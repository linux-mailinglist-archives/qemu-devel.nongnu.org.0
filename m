Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD99612AD4
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 14:54:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1op8kQ-00036Z-D9; Sun, 30 Oct 2022 09:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1op8kN-00035l-Im
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 09:53:07 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1op8kK-0007WV-HF
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 09:53:07 -0400
HMM_SOURCE_IP: 172.18.0.188:52352.1572289762
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.42.35 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id C188E2800C6;
 Sun, 30 Oct 2022 21:52:55 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([125.69.42.35])
 by app0023 with ESMTP id 2992ecbd45a74427b55b836a3a472444 for
 qemu-devel@nongnu.org; Sun, 30 Oct 2022 21:52:57 CST
X-Transaction-ID: 2992ecbd45a74427b55b836a3a472444
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
Subject: [PATCH v3 2/2] vhost-net: Fix the virtio features negotiation flaw
Date: Sun, 30 Oct 2022 21:52:39 +0800
Message-Id: <2560bb4e8cabc550da07162c520aff3669a8f56f.1667136717.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1667136717.git.huangy81@chinatelecom.cn>
References: <cover.1667136717.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1667136717.git.huangy81@chinatelecom.cn>
References: <cover.1667136717.git.huangy81@chinatelecom.cn>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Save the acked_features once it be configured by guest
virtio driver so it can't miss any features.

Note that this patch also change the features saving logic
in chr_closed_bh, which originally backup features no matter
whether the features are 0 or not, but now do it only if
features aren't 0.

As to reset acked_features to 0 if needed, Qemu always
keeping the backup acked_features up-to-date, and save the
acked_features after virtio_net_set_features in advance,
including reset acked_features to 0, so the behavior is
also covered.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
---
 hw/net/vhost_net.c      | 9 +++++++++
 hw/net/virtio-net.c     | 5 +++++
 include/net/vhost_net.h | 2 ++
 net/vhost-user.c        | 6 +-----
 4 files changed, 17 insertions(+), 5 deletions(-)

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
diff --git a/net/vhost-user.c b/net/vhost-user.c
index 74f349c..c512cc9 100644
--- a/net/vhost-user.c
+++ b/net/vhost-user.c
@@ -258,11 +258,7 @@ static void chr_closed_bh(void *opaque)
     s = DO_UPCAST(NetVhostUserState, nc, ncs[0]);
 
     for (i = queues -1; i >= 0; i--) {
-        s = DO_UPCAST(NetVhostUserState, nc, ncs[i]);
-
-        if (s->vhost_net) {
-            s->acked_features = vhost_net_get_acked_features(s->vhost_net);
-        }
+        vhost_user_save_acked_features(ncs[i], false);
     }
 
     qmp_set_link(name, false, &err);
-- 
1.8.3.1


