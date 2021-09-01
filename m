Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C217A3FDDF8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 16:47:47 +0200 (CEST)
Received: from localhost ([::1]:57702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLRWk-0003bI-QA
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 10:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@virtuozzo.com>)
 id 1mLMEB-0003W6-OK
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:08:15 -0400
Received: from relay.sw.ru ([185.231.240.75]:35418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@virtuozzo.com>)
 id 1mLME6-0005OW-4d
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:08:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=8jL/D0NXc6rwIFR0XUaMUKl6lsA78rRrWSZtWk/wHZc=; b=C+uyGfoKZpSE
 s1W5piALaSawLabp4SDc36FQk56L/RMq7CHqN0W+YiwJ5XD7gLUSpFJBMXBIhDoYZ5C6MKAB7mD4W
 wtdqUi3JfcScHWBpNVy6mUZUz5PmKCtkJg5fdPM4715gR3nBCeChjnleVyA94Abso1czXF68kpA9O
 XY1io=;
Received: from [192.168.15.100] (helo=max-Swift-SF314-57.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94.2)
 (envelope-from <maxim.davydov@virtuozzo.com>)
 id 1mLME0-000RwD-Jy; Wed, 01 Sep 2021 12:08:04 +0300
From: Maxim Davydov <maxim.davydov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@openvz.org, mst@redhat.com, stefanha@redhat.com, fam@euphon.net,
 amit@kernel.org, kraxel@redhat.com, berrange@redhat.com,
 Maxim Davydov <maxim.davydov@virtuozzo.com>
Subject: [PATCH v1 2/8] virtio: Add tracking of the common virtio guest
 features
Date: Wed,  1 Sep 2021 12:07:58 +0300
Message-Id: <20210901090804.7139-3-maxim.davydov@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901090804.7139-1-maxim.davydov@virtuozzo.com>
References: <20210901090804.7139-1-maxim.davydov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=maxim.davydov@virtuozzo.com; helo=relay.sw.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 01 Sep 2021 10:43:12 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

It implements common virtio features via macros that, by defining
the virtio guest feature bit and the virtio host feature bit, allow
you to checks acknowledged virtio features by the guest.

Signed-off-by: Maxim Davydov <maxim.davydov@virtuozzo.com>
---
 hw/virtio/virtio.c         |  2 +-
 include/hw/virtio/virtio.h | 39 ++++++++++++++++++++++++++-------------
 2 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 874377f..5f113c7 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3717,7 +3717,7 @@ static void virtio_device_instance_finalize(Object *obj)
 }
 
 static Property virtio_properties[] = {
-    DEFINE_VIRTIO_COMMON_FEATURES(VirtIODevice, host_features),
+    DEFINE_VIRTIO_COMMON_FEATURES(VirtIODevice, host_features, guest_features),
     DEFINE_PROP_BOOL("use-started", VirtIODevice, use_started, true),
     DEFINE_PROP_BOOL("use-disabled-flag", VirtIODevice, use_disabled_flag, true),
     DEFINE_PROP_BOOL("x-disable-legacy-check", VirtIODevice,
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 8bab9cf..50f334c 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -277,19 +277,32 @@ typedef struct virtio_input_conf virtio_input_conf;
 typedef struct VirtIOSCSIConf VirtIOSCSIConf;
 typedef struct VirtIORNGConf VirtIORNGConf;
 
-#define DEFINE_VIRTIO_COMMON_FEATURES(_state, _field) \
-    DEFINE_PROP_BIT64("indirect_desc", _state, _field,    \
-                      VIRTIO_RING_F_INDIRECT_DESC, true), \
-    DEFINE_PROP_BIT64("event_idx", _state, _field,        \
-                      VIRTIO_RING_F_EVENT_IDX, true),     \
-    DEFINE_PROP_BIT64("notify_on_empty", _state, _field,  \
-                      VIRTIO_F_NOTIFY_ON_EMPTY, true), \
-    DEFINE_PROP_BIT64("any_layout", _state, _field, \
-                      VIRTIO_F_ANY_LAYOUT, true), \
-    DEFINE_PROP_BIT64("iommu_platform", _state, _field, \
-                      VIRTIO_F_IOMMU_PLATFORM, false), \
-    DEFINE_PROP_BIT64("packed", _state, _field, \
-                      VIRTIO_F_RING_PACKED, false)
+#define DEFINE_VIRTIO_FEATURE_BIT(_name, _state, _host_field, _guest_field,    \
+                                  _bit, _defval)                               \
+    DEFINE_PROP_BIT(_name, _state, _host_field, _bit, _defval),                \
+    DEFINE_PROP_READ_ONLY_BIT64("acknowledged_by_guest_" _name, _state,        \
+                                _guest_field, _bit)
+
+#define DEFINE_VIRTIO_FEATURE_BIT64(_name, _state, _host_field, _guest_field,  \
+                                    _bit, _defval)                             \
+    DEFINE_PROP_BIT64(_name, _state, _host_field, _bit, _defval),              \
+    DEFINE_PROP_READ_ONLY_BIT64("acknowledged_by_guest_" _name, _state,        \
+                                _guest_field, _bit)
+
+#define DEFINE_VIRTIO_COMMON_FEATURES(_state, _host_field, _guest_field)       \
+    DEFINE_VIRTIO_FEATURE_BIT64("indirect_desc", _state, _host_field,          \
+                                _guest_field, VIRTIO_RING_F_INDIRECT_DESC,     \
+                                true),                                         \
+    DEFINE_VIRTIO_FEATURE_BIT64("event_idx", _state, _host_field,              \
+                                _guest_field, VIRTIO_RING_F_EVENT_IDX, true),  \
+    DEFINE_VIRTIO_FEATURE_BIT64("notify_on_empty", _state, _host_field,        \
+                                _guest_field, VIRTIO_F_NOTIFY_ON_EMPTY, true), \
+    DEFINE_VIRTIO_FEATURE_BIT64("any_layout", _state, _host_field,             \
+                                _guest_field, VIRTIO_F_ANY_LAYOUT, true),      \
+    DEFINE_VIRTIO_FEATURE_BIT64("iommu_platform", _state, _host_field,         \
+                                _guest_field, VIRTIO_F_IOMMU_PLATFORM, false), \
+    DEFINE_VIRTIO_FEATURE_BIT64("packed", _state, _host_field,                 \
+                                _guest_field,  VIRTIO_F_RING_PACKED, false)
 
 hwaddr virtio_queue_get_desc_addr(VirtIODevice *vdev, int n);
 bool virtio_queue_enabled_legacy(VirtIODevice *vdev, int n);
-- 
1.8.3.1


