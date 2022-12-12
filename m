Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F63564AB1D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 00:07:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4rsH-0007I0-CI; Mon, 12 Dec 2022 18:06:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4rsF-0007HU-JV
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 18:06:15 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4rsD-0004NT-Pe
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 18:06:15 -0500
Received: by mail-ej1-x635.google.com with SMTP id m18so32179967eji.5
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 15:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a+yLOOTWW5RTMZqFbarXXQFRPj78oIVaFPvsMYq9Uqc=;
 b=fiFCDIm+EKkVAK23HboGpSRrjMsjKykCCZckVXf3RsUXvuUJeT0DysQUybE1XemEZi
 6m3hyez/T1BmZRTdPCV6PQc5h11TmIwDavybln43tuwJp8gYLTK4bsh8F9cH51x0C9/2
 mvAnYS3jInbwsq8ObVP2lYYosVTOXoRZtRG51wvmef6AMFIcGl+/q3IQt+zsz6C020hQ
 BNm9PFqOsTu4esNp8tSctCVNkjpY44/h21GXlkSQ9HyR026uItjGJ8ugNj6oUd3fDEj5
 wlE/4KTbK/a7aAxaelNR1eT11PSEViNTs2W1zRVd/Zv+8YM791tPDlqmyAi2X2wPCau1
 1Bkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a+yLOOTWW5RTMZqFbarXXQFRPj78oIVaFPvsMYq9Uqc=;
 b=mMoJCQ1BHpuH7N75KGcrqELPmbLlCXVPuhYWxzNuYvnjK1sukpF3Dd8AJD/DsbSRWT
 dLlo/o/iDSiGtTZddfY/mRDLx8tvg/0fTiajXxDqwp8yrO2JLv/0sb6Nd5sIXy7ZGS7R
 o4rHftQwnTHAlW7REnsOoRmIyeTnY5tfn1887VHDi/u86S0O9yjFLFFzw0qlaKbQXh2G
 US+qH5CN6k4wXq6lpEC/C9k4fvnrSDDBZH+A9DOuAPXXcWMvmYTNuInVaG0pi5Vl+XdO
 SVe3jWNbFlOxTwnNsqd2psHWQC40v5CcRkjInCi0iwA+vGv47sII4Iz19qitKyVWyo4C
 dH+A==
X-Gm-Message-State: ANoB5pkrp8IokE1KpGWhH2s/BPPqyq0otc3kBRtpnpcjo+jFgDpq7A7M
 8hGsksiq5j/s1pcjvoEd9PJIfCAj4xz8pS09cOs=
X-Google-Smtp-Source: AA0mqf4QW8+FE8WCSm5LezIob3+dxBcbWQcKocW3fEpy3QWXxQXK7S3O3Ox13OST8umLeTwm9Ujp/Q==
X-Received: by 2002:a17:906:1805:b0:7b2:7b66:9ed4 with SMTP id
 v5-20020a170906180500b007b27b669ed4mr20604503eje.47.1670886372185; 
 Mon, 12 Dec 2022 15:06:12 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a170906111400b007c0deb2449fsm3792478eja.82.2022.12.12.15.06.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Dec 2022 15:06:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-8.0 09/10] hw/virtio: Extract
 vhost_user_ram_slots_max() to vhost-user-target.c
Date: Tue, 13 Dec 2022 00:05:16 +0100
Message-Id: <20221212230517.28872-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212230517.28872-1-philmd@linaro.org>
References: <20221212230517.28872-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The current definition of VHOST_USER_MAX_RAM_SLOTS is
target specific. By converting this definition to a runtime
vhost_user_ram_slots_max() helper declared in a target
specific unit, we can have the rest of vhost-user.c target
independent.

To avoid variable length array or using the heap to store
arrays of vhost_user_ram_slots_max() elements, we simply
declare an array of the biggest VHOST_USER_MAX_RAM_SLOTS,
and each target uses up to vhost_user_ram_slots_max()
elements of it. Ensure arrays are big enough by adding an
assertion in vhost_user_init().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
RFC: Should I add VHOST_USER_MAX_RAM_SLOTS to vhost-user.h
     or create an internal header for it?
---
 hw/virtio/meson.build          |  1 +
 hw/virtio/vhost-user-target.c  | 29 +++++++++++++++++++++++++++++
 hw/virtio/vhost-user.c         | 26 +++++---------------------
 include/hw/virtio/vhost-user.h |  7 +++++++
 4 files changed, 42 insertions(+), 21 deletions(-)
 create mode 100644 hw/virtio/vhost-user-target.c

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index eb7ee8ea92..bf7e35fa8a 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -11,6 +11,7 @@ if have_vhost
   specific_virtio_ss.add(files('vhost.c', 'vhost-backend.c', 'vhost-iova-tree.c'))
   if have_vhost_user
     specific_virtio_ss.add(files('vhost-user.c'))
+    specific_virtio_ss.add(files('vhost-user-target.c'))
   endif
   if have_vhost_vdpa
     specific_virtio_ss.add(files('vhost-vdpa.c', 'vhost-shadow-virtqueue.c'))
diff --git a/hw/virtio/vhost-user-target.c b/hw/virtio/vhost-user-target.c
new file mode 100644
index 0000000000..6a0d0f53d0
--- /dev/null
+++ b/hw/virtio/vhost-user-target.c
@@ -0,0 +1,29 @@
+/*
+ * vhost-user target-specific helpers
+ *
+ * Copyright (c) 2013 Virtual Open Systems Sarl.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/virtio/vhost-user.h"
+
+#if defined(TARGET_X86) || defined(TARGET_X86_64) || \
+    defined(TARGET_ARM) || defined(TARGET_ARM_64)
+#include "hw/acpi/acpi.h"
+#elif defined(TARGET_PPC) || defined(TARGET_PPC64)
+#include "hw/ppc/spapr.h"
+#endif
+
+unsigned int vhost_user_ram_slots_max(void)
+{
+#if defined(TARGET_X86) || defined(TARGET_X86_64) || \
+    defined(TARGET_ARM) || defined(TARGET_ARM_64)
+    return ACPI_MAX_RAM_SLOTS;
+#elif defined(TARGET_PPC) || defined(TARGET_PPC64)
+    return SPAPR_MAX_RAM_SLOTS;
+#else
+    return 512;
+#endif
+}
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 8f635844af..21fc176725 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -41,24 +41,7 @@
 #define VHOST_MEMORY_BASELINE_NREGIONS    8
 #define VHOST_USER_F_PROTOCOL_FEATURES 30
 #define VHOST_USER_SLAVE_MAX_FDS     8
-
-/*
- * Set maximum number of RAM slots supported to
- * the maximum number supported by the target
- * hardware plaform.
- */
-#if defined(TARGET_X86) || defined(TARGET_X86_64) || \
-    defined(TARGET_ARM) || defined(TARGET_ARM_64)
-#include "hw/acpi/acpi.h"
-#define VHOST_USER_MAX_RAM_SLOTS ACPI_MAX_RAM_SLOTS
-
-#elif defined(TARGET_PPC) || defined(TARGET_PPC64)
-#include "hw/ppc/spapr.h"
-#define VHOST_USER_MAX_RAM_SLOTS SPAPR_MAX_RAM_SLOTS
-
-#else
 #define VHOST_USER_MAX_RAM_SLOTS 512
-#endif
 
 /*
  * Maximum size of virtio device config space
@@ -935,7 +918,7 @@ static int vhost_user_add_remove_regions(struct vhost_dev *dev,
 
     if (track_ramblocks) {
         memcpy(u->postcopy_client_bases, shadow_pcb,
-               sizeof(uint64_t) * VHOST_USER_MAX_RAM_SLOTS);
+               sizeof(uint64_t) * vhost_user_ram_slots_max());
         /*
          * Now we've registered this with the postcopy code, we ack to the
          * client, because now we're in the position to be able to deal with
@@ -956,7 +939,7 @@ static int vhost_user_add_remove_regions(struct vhost_dev *dev,
 err:
     if (track_ramblocks) {
         memcpy(u->postcopy_client_bases, shadow_pcb,
-               sizeof(uint64_t) * VHOST_USER_MAX_RAM_SLOTS);
+               sizeof(uint64_t) * vhost_user_ram_slots_max());
     }
 
     return ret;
@@ -1030,7 +1013,7 @@ static int vhost_user_set_mem_table_postcopy(struct vhost_dev *dev,
         }
 
         memset(u->postcopy_client_bases, 0,
-               sizeof(uint64_t) * VHOST_USER_MAX_RAM_SLOTS);
+               sizeof(uint64_t) * vhost_user_ram_slots_max());
 
         /*
          * They're in the same order as the regions that were sent
@@ -2169,7 +2152,7 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
                 return -EINVAL;
             }
 
-            u->user->memory_slots = MIN(ram_slots, VHOST_USER_MAX_RAM_SLOTS);
+            u->user->memory_slots = MIN(ram_slots, vhost_user_ram_slots_max());
         }
     }
 
@@ -2649,6 +2632,7 @@ static void vhost_user_state_destroy(gpointer data)
 
 bool vhost_user_init(VhostUserState *user, CharBackend *chr, Error **errp)
 {
+    assert(vhost_user_ram_slots_max() <= VHOST_USER_MAX_RAM_SLOTS);
     if (user->chr) {
         error_setg(errp, "Cannot initialize vhost-user state");
         return false;
diff --git a/include/hw/virtio/vhost-user.h b/include/hw/virtio/vhost-user.h
index 191216a74f..e13584ade8 100644
--- a/include/hw/virtio/vhost-user.h
+++ b/include/hw/virtio/vhost-user.h
@@ -86,4 +86,11 @@ void vhost_user_async_close(DeviceState *d,
                             CharBackend *chardev, struct vhost_dev *vhost,
                             vu_async_close_fn cb);
 
+/**
+ * vhost_user_ram_slots_max()
+ *
+ * Return: maximum number of RAM slots supported by the target hardware plaform.
+ */
+unsigned int vhost_user_ram_slots_max(void);
+
 #endif
-- 
2.38.1


