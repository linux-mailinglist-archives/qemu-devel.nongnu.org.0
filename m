Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BAA5B7058
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 16:28:23 +0200 (CEST)
Received: from localhost ([::1]:50002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY6ti-0003Ue-1d
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 10:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenh@yusur.tech>)
 id 1oY1zf-0007ok-Jd; Tue, 13 Sep 2022 05:14:11 -0400
Received: from out29-74.mail.aliyun.com ([115.124.29.74]:43707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenh@yusur.tech>)
 id 1oY1za-0002EA-Si; Tue, 13 Sep 2022 05:14:11 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07550962|-1;
 BR=01201311R111S62rulernew998_84748_2000303; CH=blue; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_alarm|0.0150943-0.000738313-0.984167; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047202; MF=chenh@yusur.tech; NM=1; PH=DS; RN=10; RT=10; SR=0;
 TI=SMTPD_---.PES1aiL_1663060107; 
Received: from localhost.localdomain(mailfrom:chenh@yusur.tech
 fp:SMTPD_---.PES1aiL_1663060107) by smtp.aliyun-inc.com;
 Tue, 13 Sep 2022 17:08:33 +0800
From: Hao Chen <chenh@yusur.tech>
To: mst@redhat.com,
	raphael.norwitz@nutanix.com
Cc: kwolf@redhat.com, hreitz@redhat.com, jasowang@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, houyl@yusur.tech,
 zy@yusur.tech, Hao Chen <chenh@yusur.tech>
Subject: [PATCH] hw/virtio/vhost-user: support obtain vdpa device's mac
 address automatically
Date: Tue, 13 Sep 2022 17:08:17 +0800
Message-Id: <20220913090817.212224-1-chenh@yusur.tech>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.29.74; envelope-from=chenh@yusur.tech;
 helo=out29-74.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 13 Sep 2022 10:25:21 -0400
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

When use dpdk-vdpa tests vdpa device. You need to specify the mac address to
start the virtual machine through libvirt or qemu, but now, the libvirt or
qemu can call dpdk vdpa vendor driver's ops .get_config through vhost_net_get_config
to get the mac address of the vdpa hardware without manual configuration.

Signed-off-by: Hao Chen <chenh@yusur.tech>
---
 hw/block/vhost-user-blk.c |  1 -
 hw/net/virtio-net.c       |  3 ++-
 hw/virtio/vhost-user.c    | 19 -------------------
 3 files changed, 2 insertions(+), 21 deletions(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 9117222456..5dca4eab09 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -337,7 +337,6 @@ static int vhost_user_blk_connect(DeviceState *dev, Error **errp)
 
     vhost_dev_set_config_notifier(&s->dev, &blk_ops);
 
-    s->vhost_user.supports_config = true;
     ret = vhost_dev_init(&s->dev, &s->vhost_user, VHOST_BACKEND_TYPE_USER, 0,
                          errp);
     if (ret < 0) {
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index dd0d056fde..274ea84644 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -149,7 +149,8 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
      * Is this VDPA? No peer means not VDPA: there's no way to
      * disconnect/reconnect a VDPA peer.
      */
-    if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
+    if ((nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) ||
+        (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_USER)) {
         ret = vhost_net_get_config(get_vhost_net(nc->peer), (uint8_t *)&netcfg,
                                    n->config_size);
         if (ret != -1) {
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index bd24741be8..8b01078249 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -2013,8 +2013,6 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
     }
 
     if (virtio_has_feature(features, VHOST_USER_F_PROTOCOL_FEATURES)) {
-        bool supports_f_config = vus->supports_config ||
-            (dev->config_ops && dev->config_ops->vhost_dev_config_notifier);
         uint64_t protocol_features;
 
         dev->backend_features |= 1ULL << VHOST_USER_F_PROTOCOL_FEATURES;
@@ -2033,23 +2031,6 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
          */
         protocol_features &= VHOST_USER_PROTOCOL_FEATURE_MASK;
 
-        if (supports_f_config) {
-            if (!virtio_has_feature(protocol_features,
-                                    VHOST_USER_PROTOCOL_F_CONFIG)) {
-                error_setg(errp, "vhost-user device expecting "
-                           "VHOST_USER_PROTOCOL_F_CONFIG but the vhost-user backend does "
-                           "not support it.");
-                return -EPROTO;
-            }
-        } else {
-            if (virtio_has_feature(protocol_features,
-                                   VHOST_USER_PROTOCOL_F_CONFIG)) {
-                warn_reportf_err(*errp, "vhost-user backend supports "
-                                 "VHOST_USER_PROTOCOL_F_CONFIG but QEMU does not.");
-                protocol_features &= ~(1ULL << VHOST_USER_PROTOCOL_F_CONFIG);
-            }
-        }
-
         /* final set of protocol features */
         dev->protocol_features = protocol_features;
         err = vhost_user_set_protocol_features(dev, dev->protocol_features);
-- 
2.27.0


