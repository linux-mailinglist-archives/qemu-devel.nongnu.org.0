Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B89611944
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 19:27:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooT7N-0000eL-BQ; Fri, 28 Oct 2022 13:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1ooT7I-0000co-D1
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 13:26:00 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1ooT7G-0002qv-5f
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 13:26:00 -0400
HMM_SOURCE_IP: 172.18.0.188:46144.108533217
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.42.35 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id A0E412800C5;
 Sat, 29 Oct 2022 01:25:53 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([125.69.42.35])
 by app0023 with ESMTP id b22857db30e24e0fbba631be8c18e015 for
 qemu-devel@nongnu.org; Sat, 29 Oct 2022 01:25:55 CST
X-Transaction-ID: b22857db30e24e0fbba631be8c18e015
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 125.69.42.35
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>, 
 Guoyi Tu <tugy@chinatelecom.cn>
Subject: [PATCH v2 2/2] vhost-net: Fix the virtio features negotiation flaw
Date: Sat, 29 Oct 2022 01:25:45 +0800
Message-Id: <2d1d1fd6b4f6e6e1eae1cc1321cee5b715b4ae0c.1666977755.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1666977755.git.huangy81@chinatelecom.cn>
References: <cover.1666977755.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1666977755.git.huangy81@chinatelecom.cn>
References: <cover.1666977755.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Save the acked_features once it be configured by guest
virtio driver so it can't miss any features.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
---
 hw/net/vhost_net.c      | 9 +++++++++
 hw/net/virtio-net.c     | 5 +++++
 include/net/vhost_net.h | 2 ++
 3 files changed, 16 insertions(+)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index d28f8b9..2bffc27 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -141,6 +141,15 @@ uint64_t vhost_net_get_acked_features(VHostNetState *net)
     return net->dev.acked_features;
 }
 
+void vhost_net_save_acked_features(NetClientState *nc)
+{
+    if (nc->info->type != NET_CLIENT_DRIVER_VHOST_USER) {
+        return;
+    }
+
+    vhost_user_save_acked_features(nc, false);
+}
+
 static int vhost_net_get_fd(NetClientState *backend)
 {
     switch (backend->info->type) {
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index e9f696b..5f8f788 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -924,6 +924,11 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
             continue;
         }
         vhost_net_ack_features(get_vhost_net(nc->peer), features);
+        /*
+         * keep acked_features in NetVhostUserState up-to-date so it
+         * can't miss any features configured by guest virtio driver.
+         */
+        vhost_net_save_acked_features(nc->peer);
     }
 
     if (virtio_has_feature(features, VIRTIO_NET_F_CTRL_VLAN)) {
diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
index 387e913..3a5579b 100644
--- a/include/net/vhost_net.h
+++ b/include/net/vhost_net.h
@@ -46,6 +46,8 @@ int vhost_set_vring_enable(NetClientState * nc, int enable);
 
 uint64_t vhost_net_get_acked_features(VHostNetState *net);
 
+void vhost_net_save_acked_features(NetClientState *nc);
+
 int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu);
 
 #endif
-- 
1.8.3.1


