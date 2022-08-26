Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0565A2A23
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:57:00 +0200 (CEST)
Received: from localhost ([::1]:46304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRalX-0002fB-UK
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oRaOe-0004Fl-F6; Fri, 26 Aug 2022 10:33:23 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:48158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oRaOb-0007B2-OE; Fri, 26 Aug 2022 10:33:20 -0400
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 8A36C2E14A5;
 Fri, 26 Aug 2022 17:33:10 +0300 (MSK)
Received: from d-tatianin-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:b581::1:d])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 7Ht2PirWaX-X9OqqhLf; Fri, 26 Aug 2022 17:33:09 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1661524389; bh=WDRidtUyWNhtpkJO93ivbw9izEVnseytsz3bIxbKKvc=;
 h=Cc:Message-Id:References:Date:In-Reply-To:Subject:To:From;
 b=VbWqSvAevoDqcildLluKVJXF+fLF1PL7nn3AvxGewNKBebBxs7GBdb87cjGFfv9LP
 QG1J/Ij+Qg73y310HKzEnlSMv2HYCl8CYjIGvQ6PmRj36tNLfHBGQL7ntapDye5rSL
 m14cmiStNj86DY7ykLaNG6U5xxMW0+UN3yw+xUL4=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, mst@redhat.com, stefanha@redhat.com,
 raphael.norwitz@nutanix.com, kwolf@redhat.com, qemu-block@nongnu.org,
 jasowang@redhat.com, d-tatianin@yandex-team.ru
Subject: [PATCH v2 5/8] virtio-blk: move config size params to
 virtio-blk-common
Date: Fri, 26 Aug 2022 17:32:45 +0300
Message-Id: <20220826143248.580939-6-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220826143248.580939-1-d-tatianin@yandex-team.ru>
References: <20220826143248.580939-1-d-tatianin@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This way we can reuse it for other virtio-blk devices, e.g
vhost-user-blk, which currently does not control its config space size
dynamically.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
---
 MAINTAINERS                           |  4 +++
 hw/block/meson.build                  |  4 +--
 hw/block/virtio-blk-common.c          | 39 +++++++++++++++++++++++++++
 hw/block/virtio-blk.c                 | 24 ++---------------
 include/hw/virtio/virtio-blk-common.h | 20 ++++++++++++++
 5 files changed, 67 insertions(+), 24 deletions(-)
 create mode 100644 hw/block/virtio-blk-common.c
 create mode 100644 include/hw/virtio/virtio-blk-common.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 5ce4227ff6..a7d3914735 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2030,8 +2030,10 @@ virtio-blk
 M: Stefan Hajnoczi <stefanha@redhat.com>
 L: qemu-block@nongnu.org
 S: Supported
+F: hw/block/virtio-blk-common.c
 F: hw/block/virtio-blk.c
 F: hw/block/dataplane/*
+F: include/hw/virtio/virtio-blk-common.h
 F: tests/qtest/virtio-blk-test.c
 T: git https://github.com/stefanha/qemu.git block
 
@@ -2271,11 +2273,13 @@ S: Maintained
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
index 2389326112..1908abd45c 100644
--- a/hw/block/meson.build
+++ b/hw/block/meson.build
@@ -16,7 +16,7 @@ softmmu_ss.add(when: 'CONFIG_SWIM', if_true: files('swim.c'))
 softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen-block.c'))
 softmmu_ss.add(when: 'CONFIG_TC58128', if_true: files('tc58128.c'))
 
-specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'))
-specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk.c'))
+specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c', 'virtio-blk-common.c'))
+specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk.c', 'virtio-blk-common.c'))
 
 subdir('dataplane')
diff --git a/hw/block/virtio-blk-common.c b/hw/block/virtio-blk-common.c
new file mode 100644
index 0000000000..ac52d7c176
--- /dev/null
+++ b/hw/block/virtio-blk-common.c
@@ -0,0 +1,39 @@
+/*
+ * Virtio Block Device common helpers
+ *
+ * Copyright IBM, Corp. 2007
+ *
+ * Authors:
+ *  Anthony Liguori   <aliguori@us.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "standard-headers/linux/virtio_blk.h"
+#include "hw/virtio/virtio.h"
+#include "hw/virtio/virtio-blk-common.h"
+
+/* Config size before the discard support (hide associated config fields) */
+#define VIRTIO_BLK_CFG_SIZE offsetof(struct virtio_blk_config, \
+                                     max_discard_sectors)
+
+/*
+ * Starting from the discard feature, we can use this array to properly
+ * set the config size depending on the features enabled.
+ */
+static const VirtIOFeature feature_sizes[] = {
+    {.flags = 1ULL << VIRTIO_BLK_F_DISCARD,
+     .end = endof(struct virtio_blk_config, discard_sector_alignment)},
+    {.flags = 1ULL << VIRTIO_BLK_F_WRITE_ZEROES,
+     .end = endof(struct virtio_blk_config, write_zeroes_may_unmap)},
+    {}
+};
+
+const VirtIOConfigSizeParams virtio_blk_cfg_size_params = {
+    .min_size = VIRTIO_BLK_CFG_SIZE,
+    .max_size = sizeof(struct virtio_blk_config),
+    .feature_sizes = feature_sizes
+};
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 10c47c2934..8131ec2dbc 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -32,29 +32,9 @@
 #include "hw/virtio/virtio-bus.h"
 #include "migration/qemu-file-types.h"
 #include "hw/virtio/virtio-access.h"
+#include "hw/virtio/virtio-blk-common.h"
 #include "qemu/coroutine.h"
 
-/* Config size before the discard support (hide associated config fields) */
-#define VIRTIO_BLK_CFG_SIZE offsetof(struct virtio_blk_config, \
-                                     max_discard_sectors)
-/*
- * Starting from the discard feature, we can use this array to properly
- * set the config size depending on the features enabled.
- */
-static const VirtIOFeature feature_sizes[] = {
-    {.flags = 1ULL << VIRTIO_BLK_F_DISCARD,
-     .end = endof(struct virtio_blk_config, discard_sector_alignment)},
-    {.flags = 1ULL << VIRTIO_BLK_F_WRITE_ZEROES,
-     .end = endof(struct virtio_blk_config, write_zeroes_may_unmap)},
-    {}
-};
-
-static const VirtIOConfigSizeParams cfg_size_params = {
-    .min_size = VIRTIO_BLK_CFG_SIZE,
-    .max_size = sizeof(struct virtio_blk_config),
-    .feature_sizes = feature_sizes
-};
-
 static void virtio_blk_init_request(VirtIOBlock *s, VirtQueue *vq,
                                     VirtIOBlockReq *req)
 {
@@ -1202,7 +1182,7 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    s->config_size = virtio_get_config_size(&cfg_size_params,
+    s->config_size = virtio_get_config_size(&virtio_blk_cfg_size_params,
                                             s->host_features);
     virtio_init(vdev, VIRTIO_ID_BLOCK, s->config_size);
 
diff --git a/include/hw/virtio/virtio-blk-common.h b/include/hw/virtio/virtio-blk-common.h
new file mode 100644
index 0000000000..31daada3e3
--- /dev/null
+++ b/include/hw/virtio/virtio-blk-common.h
@@ -0,0 +1,20 @@
+/*
+ * Virtio Block Device common helpers
+ *
+ * Copyright IBM, Corp. 2007
+ *
+ * Authors:
+ *  Anthony Liguori   <aliguori@us.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef VIRTIO_BLK_COMMON_H
+#define VIRTIO_BLK_COMMON_H
+
+#include "hw/virtio/virtio.h"
+
+extern const VirtIOConfigSizeParams virtio_blk_cfg_size_params;
+
+#endif
-- 
2.25.1


