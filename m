Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DB431FBB3
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:12:33 +0100 (CET)
Received: from localhost ([::1]:44674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7SK-0000jb-Ck
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:12:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73n-0002Z7-5o
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:11 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:37289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73K-0003aX-Kn
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:10 -0500
Received: by mail-wm1-x334.google.com with SMTP id m1so7889757wml.2
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QtFzdKHJmcOWhOa7pgzMvs7QBcJQKYPiMAhl2ByGZDs=;
 b=B5YSSQLtZfWU2QqFJgig9mnVWyr2rMYrQcEZbccx8ZKcreww0TSQKCeSNz9ByCG9VB
 TFVAESXSzmbAxzJWWXX57kZ64jcwl76XNpUSxxjLoYiisGCLIdpT94NOLBkedu0NUyvd
 ZMv31YKkQ/geSkWqBrSdLybw6/fe8JzgpzhX+jzOClpXmtReBcBlwxheVie4GE/KamrE
 EGcnvXnfvqofnq1hRFckvpe02k2UOVuZZ+3ET/jfhOF91yhFgR9L1LGAKkblsjVCbZVg
 f0gUVI0WV1IKED585uRK65F9Zem4xbMbLuEIHJjWe/rrHYtEZYeDYd76dbHUYFBAVYuK
 s0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QtFzdKHJmcOWhOa7pgzMvs7QBcJQKYPiMAhl2ByGZDs=;
 b=gSF/CyqEX9g75K6cctx/vvPhrrXI+T348V8XwOLI4ZbXpyh56QMrn1yxvU3ICvbouY
 4BGB9PLFHqHvts9NlM/05dRGJbfoxfm0b1LDrS5PlEinkomjEpfDdPmWpNl9iiZ9z424
 6ZMBARsYSVk5zRSq8lNwg1eae3T/pktr6G5NrECFqrIHbT51EPpbnjhzhD6GlpANvTR0
 J0IZ8w1YsChZ3Q/+GDOAApDdli4kvqEmWj0syXQjwEYCkGKThTAYwcGd0GXCYf6jPF/G
 GSTxmFcpIPzjPEZb1gi8YY30maTjfOzv9mzYVkdL+/NhFxjj0Drs3iM7IO1uTzNumjKG
 kKJA==
X-Gm-Message-State: AOAM532FXwiYv4DMp0ru6DFIAzn84uJ0d87JFFUDTL2x90fZpdW/2a8t
 tGbcwgY115eo+QOHfdvRbThWHA==
X-Google-Smtp-Source: ABdhPJxvbYg23SGotG6SASR1/4Vv9Q3K4S8kxhtGGtUQNNA+NR3vvn2Y0XV9tGX+cTA6IkKeqimQJA==
X-Received: by 2002:a7b:c152:: with SMTP id z18mr6790863wmi.0.1613746001339;
 Fri, 19 Feb 2021 06:46:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 28/44] hw/arm/armsse: Move sysctl register block into
 data-driven framework
Date: Fri, 19 Feb 2021 14:46:01 +0000
Message-Id: <20210219144617.4782-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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

Move the sysctl register block into the data-driven device placement
framework.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/armsse.c | 44 ++++++++++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 91f30b1fdc4..961b2d44137 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -165,6 +165,14 @@ static const ARMSSEDeviceInfo sse200_devices[] = {
         .ppc = NO_PPC,
         .irq = NO_IRQ,
     },
+    {
+        .name = "armsse-sysctl",
+        .type = TYPE_IOTKIT_SYSCTL,
+        .index = 0,
+        .addr = 0x50021000,
+        .ppc = NO_PPC,
+        .irq = NO_IRQ,
+    },
     {
         .name = NULL,
     }
@@ -419,6 +427,10 @@ static void armsse_init(Object *obj)
             assert(devinfo->index == 0);
             object_initialize_child(obj, devinfo->name, &s->sysinfo,
                                     TYPE_IOTKIT_SYSINFO);
+        } else if (!strcmp(devinfo->type, TYPE_IOTKIT_SYSCTL)) {
+            assert(devinfo->index == 0);
+            object_initialize_child(obj, devinfo->name, &s->sysctl,
+                                    TYPE_IOTKIT_SYSCTL);
         } else {
             g_assert_not_reached();
         }
@@ -447,8 +459,6 @@ static void armsse_init(Object *obj)
         g_free(name);
     }
 
-    object_initialize_child(obj, "armsse-sysctl", &s->sysctl,
-                            TYPE_IOTKIT_SYSCTL);
     if (info->has_mhus) {
         object_initialize_child(obj, "mhu0", &s->mhu[0], TYPE_ARMSSE_MHU);
         object_initialize_child(obj, "mhu1", &s->mhu[1], TYPE_ARMSSE_MHU);
@@ -915,6 +925,22 @@ static void armsse_realize(DeviceState *dev, Error **errp)
                 return;
             }
             mr = sysbus_mmio_get_region(sbd, 0);
+        } else if (!strcmp(devinfo->type, TYPE_IOTKIT_SYSCTL)) {
+            /* System control registers */
+            sbd = SYS_BUS_DEVICE(&s->sysctl);
+
+            object_property_set_int(OBJECT(&s->sysctl), "sse-version",
+                                    info->sse_version, &error_abort);
+            object_property_set_int(OBJECT(&s->sysctl), "CPUWAIT_RST",
+                                    info->cpuwait_rst, &error_abort);
+            object_property_set_int(OBJECT(&s->sysctl), "INITSVTOR0_RST",
+                                    s->init_svtor, &error_abort);
+            object_property_set_int(OBJECT(&s->sysctl), "INITSVTOR1_RST",
+                                    s->init_svtor, &error_abort);
+            if (!sysbus_realize(sbd, errp)) {
+                return;
+            }
+            mr = sysbus_mmio_get_region(sbd, 0);
         } else {
             g_assert_not_reached();
         }
@@ -1132,20 +1158,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         memory_region_add_subregion(&s->container, devinfo->addr, mr);
     }
 
-    /* System control registers */
-    object_property_set_int(OBJECT(&s->sysctl), "sse-version",
-                            info->sse_version, &error_abort);
-    object_property_set_int(OBJECT(&s->sysctl), "CPUWAIT_RST",
-                            info->cpuwait_rst, &error_abort);
-    object_property_set_int(OBJECT(&s->sysctl), "INITSVTOR0_RST",
-                            s->init_svtor, &error_abort);
-    object_property_set_int(OBJECT(&s->sysctl), "INITSVTOR1_RST",
-                            s->init_svtor, &error_abort);
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->sysctl), errp)) {
-        return;
-    }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysctl), 0, 0x50021000);
-
     if (info->has_ppus) {
         /* CPUnCORE_PPU for each CPU */
         for (i = 0; i < info->num_cpus; i++) {
-- 
2.20.1


