Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0947D5E99D8
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 08:48:59 +0200 (CEST)
Received: from localhost ([::1]:39258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ochvE-0007cQ-MR
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 02:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1ochlR-0001T2-Pe
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 02:38:49 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.220]:45546
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1ochlJ-0007aj-Ps
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 02:38:46 -0400
HMM_SOURCE_IP: 172.18.0.188:40300.940860629
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.85 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 1AB332800BF;
 Mon, 26 Sep 2022 14:38:34 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([36.111.64.85])
 by app0023 with ESMTP id 15b3ed7ecbe84c73ac207579295e03eb for
 qemu-devel@nongnu.org; Mon, 26 Sep 2022 14:38:34 CST
X-Transaction-ID: 15b3ed7ecbe84c73ac207579295e03eb
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 36.111.64.85
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 tugy@chinatelecom.cn, baiyw2@chinatelecom.cn, dengpc12@chinatelecom.cn,
 liuym16@chinatelecom.cn, yangchg@chinatelecom.cn, yuanmh12@chinatelecom.cn,
 zhoupx@chinatelecom.cn, huangy81@chinatelecom.cn, lic121@chinatelecom.cn
Subject: [PATCH 2/2] vhost-net: Fix the virito features negotiation flaw
Date: Mon, 26 Sep 2022 14:36:41 +0800
Message-Id: <20220926063641.25038-3-huangy81@chinatelecom.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220926063641.25038-1-huangy81@chinatelecom.cn>
References: <20220926063641.25038-1-huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.220;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
index d28f8b974b..2bffc276b9 100644
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
index dd0d056fde..69c00b4e74 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -918,6 +918,11 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
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
index 387e913e4e..3a5579b075 100644
--- a/include/net/vhost_net.h
+++ b/include/net/vhost_net.h
@@ -46,6 +46,8 @@ int vhost_set_vring_enable(NetClientState * nc, int enable);
 
 uint64_t vhost_net_get_acked_features(VHostNetState *net);
 
+void vhost_net_save_acked_features(NetClientState *nc);
+
 int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu);
 
 #endif
-- 
2.27.0


