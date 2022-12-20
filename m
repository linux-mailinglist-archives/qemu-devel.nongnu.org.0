Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6E7651E5C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 11:05:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Ym8-0007wv-Io; Tue, 20 Dec 2022 04:19:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1p7Ylj-0007r7-S5
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 04:18:47 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.219] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1p7Yle-00086z-3d
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 04:18:39 -0500
HMM_SOURCE_IP: 172.18.0.218:35458.223668886
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.98.159 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 7AA862800CF;
 Tue, 20 Dec 2022 17:18:25 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([171.223.98.159])
 by app0025 with ESMTP id 2e4a1575174248df8c6a8609e0b3439a for
 qemu-devel@nongnu.org; Tue, 20 Dec 2022 17:18:27 CST
X-Transaction-ID: 2e4a1575174248df8c6a8609e0b3439a
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 171.223.98.159
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>, 
 Guoyi Tu <tugy@chinatelecom.cn>
Subject: [PATCH RESEND v5 3/3] vhost-user: Fix the virtio features negotiation
 flaw
Date: Tue, 20 Dec 2022 17:18:00 +0800
Message-Id: <42320fe9f331fb62f8a27b3afbf33f77f3487e8f.1671526980.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1671526980.git.huangy81@chinatelecom.cn>
References: <cover.1671526980.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1671526980.git.huangy81@chinatelecom.cn>
References: <cover.1671526980.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

This patch aims to fix unexpected negotiation features for
vhost-user netdev interface.

When openvswitch reconnect Qemu after an unexpected disconnection
and Qemu therefore start the vhost_dev, acked_features field in
vhost_dev is initialized with value fetched from acked_features
field in NetVhostUserState, which should be up-to-date at that
moment but Qemu could not make it actually during the time window
of virtio features negotiation.

So we save the acked_features right after being configured by
guest virtio driver so it can be used to restore acked_features
field in vhost_dev correctly.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
Signed-off-by: Liuxiangdong <liuxiangdong5@huawei.com>
---
 hw/net/vhost_net-stub.c | 5 +++++
 hw/net/vhost_net.c      | 7 +++++++
 hw/net/virtio-net.c     | 6 ++++++
 include/net/vhost_net.h | 2 ++
 4 files changed, 20 insertions(+)

diff --git a/hw/net/vhost_net-stub.c b/hw/net/vhost_net-stub.c
index 9f7daae..66ed5f0 100644
--- a/hw/net/vhost_net-stub.c
+++ b/hw/net/vhost_net-stub.c
@@ -113,3 +113,8 @@ int vhost_net_virtqueue_restart(VirtIODevice *vdev, NetClientState *nc,
 {
     return 0;
 }
+
+void vhost_net_save_acked_features(NetClientState *nc)
+{
+
+}
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 043058f..89866c3 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -144,6 +144,13 @@ uint64_t vhost_net_get_acked_features(VHostNetState *net)
     return net->dev.acked_features;
 }
 
+void vhost_net_save_acked_features(NetClientState *nc)
+{
+    if (nc->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
+        vhost_user_save_acked_features(nc);
+    }
+}
+
 static int vhost_net_get_fd(NetClientState *backend)
 {
     switch (backend->info->type) {
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 9cbdfa5..105fc30 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -980,6 +980,12 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
             continue;
         }
         vhost_net_ack_features(get_vhost_net(nc->peer), features);
+
+        /*
+         * keep acked_features in NetVhostUserState up-to-date so it
+         * can't miss any features configured by guest virtio driver.
+         */
+        vhost_net_save_acked_features(nc->peer);
     }
 
     if (virtio_has_feature(features, VIRTIO_NET_F_CTRL_VLAN)) {
diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
index 40b9a40..dfb1375 100644
--- a/include/net/vhost_net.h
+++ b/include/net/vhost_net.h
@@ -52,4 +52,6 @@ void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
                                int vq_index);
 int vhost_net_virtqueue_restart(VirtIODevice *vdev, NetClientState *nc,
                                 int vq_index);
+
+void vhost_net_save_acked_features(NetClientState *nc);
 #endif
-- 
1.8.3.1


