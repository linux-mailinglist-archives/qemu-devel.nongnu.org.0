Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC01D59F68D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 11:42:59 +0200 (CEST)
Received: from localhost ([::1]:56934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQmuY-00041U-MH
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 05:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oQmhi-0000bt-PH; Wed, 24 Aug 2022 05:29:42 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:44984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oQmhb-00083R-Jz; Wed, 24 Aug 2022 05:29:41 -0400
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 692C92E15B9;
 Wed, 24 Aug 2022 12:18:53 +0300 (MSK)
Received: from d-tatianin-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:b4bd::1:34])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 YDoXMhagzp-IqOahjb9; Wed, 24 Aug 2022 12:18:52 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1661332732; bh=+LXH894BMzuy8kXkeIyHEdZ7bh+EDQ1M88NPpjSLgdg=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=XoSp7DXqybZ6GnvWb3PRkcv2nF5seVuIp3BpB/U7yMVtRODNmqHRF4jxTPBbdbttb
 Zm0GekEBGCCjaS1xcrJeEWv3L7jjuEnU7dXzuMlJ7CHQo/QHdO4QxMOmAXE8aQIRat
 87VI/Sa29yqaX0I4ZOdgY0IlsunW0lhj2Zmg4uXA=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, stefanha@redhat.com, raphael.norwitz@nutanix.com,
 kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org,
 yc-core@yandex-team.ru, d-tatianin@yandex-team.ru
Subject: [PATCH v1 5/5] vhost-user-blk: dynamically resize config space based
 on features
Date: Wed, 24 Aug 2022 12:18:37 +0300
Message-Id: <20220824091837.301708-6-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220824091837.301708-1-d-tatianin@yandex-team.ru>
References: <20220824091837.301708-1-d-tatianin@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
---
 hw/block/vhost-user-blk.c          | 15 ++++++++-------
 include/hw/virtio/vhost-user-blk.h |  1 +
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 64f3457373..d18a7a2cd4 100644
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
+    memcpy(config, &s->blkcfg, s->config_size);
 }
 
 static void vhost_user_blk_set_config(VirtIODevice *vdev, const uint8_t *config)
@@ -96,8 +97,7 @@ static int vhost_user_blk_handle_config_change(struct vhost_dev *dev)
     Error *local_err = NULL;
 
     ret = vhost_dev_get_config(dev, (uint8_t *)&blkcfg,
-                               sizeof(struct virtio_blk_config),
-                               &local_err);
+                               s->config_size, &local_err);
     if (ret < 0) {
         error_report_err(local_err);
         return ret;
@@ -106,7 +106,7 @@ static int vhost_user_blk_handle_config_change(struct vhost_dev *dev)
     /* valid for resize only */
     if (blkcfg.capacity != s->blkcfg.capacity) {
         s->blkcfg.capacity = blkcfg.capacity;
-        memcpy(dev->vdev->config, &s->blkcfg, sizeof(struct virtio_blk_config));
+        memcpy(dev->vdev->config, &s->blkcfg, s->config_size);
         virtio_notify_config(dev->vdev);
     }
 
@@ -444,7 +444,7 @@ static int vhost_user_blk_realize_connect(VHostUserBlk *s, Error **errp)
     assert(s->connected);
 
     ret = vhost_dev_get_config(&s->dev, (uint8_t *)&s->blkcfg,
-                               sizeof(struct virtio_blk_config), errp);
+                               s->config_size, errp);
     if (ret < 0) {
         qemu_chr_fe_disconnect(&s->chardev);
         vhost_dev_cleanup(&s->dev);
@@ -489,8 +489,9 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, VIRTIO_ID_BLOCK,
-                sizeof(struct virtio_blk_config));
+    s->config_size = virtio_blk_common_get_config_size(s->host_features);
+
+    virtio_init(vdev, VIRTIO_ID_BLOCK, s->config_size);
 
     s->virtqs = g_new(VirtQueue *, s->num_queues);
     for (i = 0; i < s->num_queues; i++) {
diff --git a/include/hw/virtio/vhost-user-blk.h b/include/hw/virtio/vhost-user-blk.h
index 6252095c45..b7810360b9 100644
--- a/include/hw/virtio/vhost-user-blk.h
+++ b/include/hw/virtio/vhost-user-blk.h
@@ -52,6 +52,7 @@ struct VHostUserBlk {
     bool started_vu;
 
     uint64_t host_features;
+    size_t config_size;
 };
 
 #endif
-- 
2.25.1


