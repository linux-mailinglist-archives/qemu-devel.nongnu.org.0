Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E90285AE134
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 09:36:57 +0200 (CEST)
Received: from localhost ([::1]:53100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVT8i-00005R-J0
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 03:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oVT3Y-0003It-ML; Tue, 06 Sep 2022 03:31:36 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:47716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oVT3U-0002xm-7J; Tue, 06 Sep 2022 03:31:35 -0400
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id C99B62E2DF4;
 Tue,  6 Sep 2022 10:31:21 +0300 (MSK)
Received: from d-tatianin-nix.yandex.net (unknown
 [2a02:6b8:0:419:d8d0:8d85:2aad:ab5b])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 WefwVQnsrp-VKXinvwg; Tue, 06 Sep 2022 10:31:20 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1662449480; bh=0D0HHr/ucF+3QHpLGClIrwqsInvbQHeZacJYLryFmA4=;
 h=Cc:Message-Id:References:Date:In-Reply-To:Subject:To:From;
 b=Mc6DO25biJ419BEw1oyo05Ys2kuRgcQgX3jo58XJn1HuB/WoZn5/eSVvjLxCspLyS
 0GT81tlbCYlM435uYnXo7JmuSheyGP8soVFZaAnIXK13q3RExznVix+3uDtMtFPrxf
 wrPPJ5d7ZwGFpxiGIaWK0b0vlhwVVgPKpFJ8w838=
Authentication-Results: vla1-81430ab5870b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, mst@redhat.com, stefanha@redhat.com,
 raphael.norwitz@nutanix.com, kwolf@redhat.com, qemu-block@nongnu.org,
 jasowang@redhat.com, d-tatianin@yandex-team.ru
Subject: [PATCH v3 5/5] vhost-user-blk: dynamically resize config space based
 on features
Date: Tue,  6 Sep 2022 10:31:11 +0300
Message-Id: <20220906073111.353245-6-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906073111.353245-1-d-tatianin@yandex-team.ru>
References: <20220906073111.353245-1-d-tatianin@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Make vhost-user-blk backwards compatible when migrating from older VMs
running with modern features turned off, the same way it was done for
virtio-blk in 20764be0421c ("virtio-blk: set config size depending on the features enabled")

It's currently impossible to migrate from an older VM with
vhost-user-blk (with disable-legacy=off) because of errors like this:

qemu-system-x86_64: get_pci_config_device: Bad config data: i=0x10 read: 41 device: 1 cmask: ff wmask: 80 w1cmask:0
qemu-system-x86_64: Failed to load PCIDevice:config
qemu-system-x86_64: Failed to load virtio-blk:virtio
qemu-system-x86_64: error while loading state for instance 0x0 of device '0000:00:05.0:00.0:02.0/virtio-blk'
qemu-system-x86_64: load of migration failed: Invalid argument

This is caused by the newer (destination) VM requiring a bigger BAR0
alignment because it has to cover a bigger configuration space, which
isn't actually needed since those additional config fields are not
active (write-zeroes/discard).

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 MAINTAINERS               |  2 ++
 hw/block/meson.build      |  2 +-
 hw/block/vhost-user-blk.c | 17 ++++++++++-------
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2858577c5b..a7d3914735 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2273,11 +2273,13 @@ S: Maintained
 F: contrib/vhost-user-blk/
 F: contrib/vhost-user-scsi/
 F: hw/block/vhost-user-blk.c
+F: hw/block/virtio-blk-common.c
 F: hw/scsi/vhost-user-scsi.c
 F: hw/virtio/vhost-user-blk-pci.c
 F: hw/virtio/vhost-user-scsi-pci.c
 F: include/hw/virtio/vhost-user-blk.h
 F: include/hw/virtio/vhost-user-scsi.h
+F: include/hw/virtio/virtio-blk-common.h
 
 vhost-user-gpu
 M: Marc-André Lureau <marcandre.lureau@redhat.com>
diff --git a/hw/block/meson.build b/hw/block/meson.build
index 8ee1f1f850..1908abd45c 100644
--- a/hw/block/meson.build
+++ b/hw/block/meson.build
@@ -17,6 +17,6 @@ softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen-block.c'))
 softmmu_ss.add(when: 'CONFIG_TC58128', if_true: files('tc58128.c'))
 
 specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c', 'virtio-blk-common.c'))
-specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk.c'))
+specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk.c', 'virtio-blk-common.c'))
 
 subdir('dataplane')
diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 0d916edefa..8dd063eb96 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -23,6 +23,7 @@
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
+#include "hw/virtio/virtio-blk-common.h"
 #include "hw/virtio/vhost.h"
 #include "hw/virtio/vhost-user-blk.h"
 #include "hw/virtio/virtio.h"
@@ -63,7 +64,7 @@ static void vhost_user_blk_update_config(VirtIODevice *vdev, uint8_t *config)
     /* Our num_queues overrides the device backend */
     virtio_stw_p(vdev, &s->blkcfg.num_queues, s->num_queues);
 
-    memcpy(config, &s->blkcfg, sizeof(struct virtio_blk_config));
+    memcpy(config, &s->blkcfg, vdev->config_len);
 }
 
 static void vhost_user_blk_set_config(VirtIODevice *vdev, const uint8_t *config)
@@ -92,12 +93,12 @@ static int vhost_user_blk_handle_config_change(struct vhost_dev *dev)
 {
     int ret;
     struct virtio_blk_config blkcfg;
+    VirtIODevice *vdev = dev->vdev;
     VHostUserBlk *s = VHOST_USER_BLK(dev->vdev);
     Error *local_err = NULL;
 
     ret = vhost_dev_get_config(dev, (uint8_t *)&blkcfg,
-                               sizeof(struct virtio_blk_config),
-                               &local_err);
+                               vdev->config_len, &local_err);
     if (ret < 0) {
         error_report_err(local_err);
         return ret;
@@ -106,7 +107,7 @@ static int vhost_user_blk_handle_config_change(struct vhost_dev *dev)
     /* valid for resize only */
     if (blkcfg.capacity != s->blkcfg.capacity) {
         s->blkcfg.capacity = blkcfg.capacity;
-        memcpy(dev->vdev->config, &s->blkcfg, sizeof(struct virtio_blk_config));
+        memcpy(dev->vdev->config, &s->blkcfg, vdev->config_len);
         virtio_notify_config(dev->vdev);
     }
 
@@ -442,7 +443,7 @@ static int vhost_user_blk_realize_connect(VHostUserBlk *s, Error **errp)
     assert(s->connected);
 
     ret = vhost_dev_get_config(&s->dev, (uint8_t *)&s->blkcfg,
-                               sizeof(struct virtio_blk_config), errp);
+                               s->parent_obj.config_len, errp);
     if (ret < 0) {
         qemu_chr_fe_disconnect(&s->chardev);
         vhost_dev_cleanup(&s->dev);
@@ -457,6 +458,7 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
     ERRP_GUARD();
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VHostUserBlk *s = VHOST_USER_BLK(vdev);
+    size_t config_size;
     int retries;
     int i, ret;
 
@@ -487,8 +489,9 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, VIRTIO_ID_BLOCK,
-                sizeof(struct virtio_blk_config));
+    config_size = virtio_get_config_size(&virtio_blk_cfg_size_params,
+                                         vdev->host_features);
+    virtio_init(vdev, VIRTIO_ID_BLOCK, config_size);
 
     s->virtqs = g_new(VirtQueue *, s->num_queues);
     for (i = 0; i < s->num_queues; i++) {
-- 
2.25.1


