Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B49F31FBC2
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:14:34 +0100 (CET)
Received: from localhost ([::1]:53664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7UH-0004OF-Cs
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:14:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73n-0002b5-OX
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:11 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:37288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73J-0003aK-W5
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:11 -0500
Received: by mail-wm1-x333.google.com with SMTP id m1so7889734wml.2
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cUkpFgY7tiqXLrCF1eGUleIZNQUHBO/cDgm27ZFyGB4=;
 b=vEUATXAB9XP69ZbOGOISK88L6OX8Vz+hBAyyyL2ImLN3+JDaMb1B4DoC62G+9jnJsf
 +wFuLZGM7jqivaNM63tzBK1TrAIxOdZIR7Ezqm0zujGX2RhXLiVr2Km5UptnK86wgGfH
 SfTHC61zOWAgl/nfg5STV2LZ/e5/+6it5nlTlS1T4NbFlHfQaXGnBAI/iC1/ksY8U153
 cOYtuWBFkYojLZkqFG8lk/xmXtPBigpy7vbuB1hrPU4z5rdTZNVK+MPFe2rw1C04ehZ9
 L4cMNXX+3OyGdi6QtwztpcJpDIDxwc4FMXR+FfDSzZik/kQXKhtir96Ry0VxvDdVOiIs
 V5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cUkpFgY7tiqXLrCF1eGUleIZNQUHBO/cDgm27ZFyGB4=;
 b=jK1PJ+we8X/xDflFAdlg1wFZxYfyWBopCiKCdJmmMiUlnlq8Hd+DqM+qIJHc0LznOn
 cPfS5r7sW924czsu37nx/JqhuH9p5tnCYkzfG1jf1vllI0GPCRG2E/JYPepGHgA2+BhD
 EMxIgj79H9QleTGOcGTGVxg2fva26K1nQHM2khAyYZeHpyfU8NoVUidXaauFhFkIhpym
 MpPsgjdEj2GOqp2rcdK1tKYYFbb4ePZFUETo8tn3AcbR+8ewJHfUmX3Xs5FGQ7t9/Mg+
 qtoWzGe/LFAF0EWIhSO3pAgUDPThvndqJEXa5t8b9BfeE8hq1hIiMqrVA5gyGL8sUdhw
 zfaw==
X-Gm-Message-State: AOAM533NFw4b5BAm65Cx+krJbCxp2nbQ0QMbyUjuuog+M8HqojeZ4ynQ
 HTpeqWwfzN3dlAtJzLPP/jr/71k0K4UQmw==
X-Google-Smtp-Source: ABdhPJzpLMOV9fxJxWqv8Zv0KRn+Kj8QCeNCcfNUkUQz2qTS89vwzB1SqbytHzdAIF2pT3TMgbh+qA==
X-Received: by 2002:a1c:7e85:: with SMTP id z127mr8571215wmc.131.1613746000691; 
 Fri, 19 Feb 2021 06:46:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 27/44] hw/arm/armsse: Move sysinfo register block into
 data-driven framework
Date: Fri, 19 Feb 2021 14:46:00 +0000
Message-Id: <20210219144617.4782-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

Move the sysinfo register block into the data-driven framework.

While we are moving the code for configuring this device around,
regularize on using &error_abortw when setting the integer
properties: they are all simple DEFINE_PROP_UINT32 properties so the
setting can never fail.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/armsse.c | 47 ++++++++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 3270362d599..91f30b1fdc4 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -157,6 +157,14 @@ static const ARMSSEDeviceInfo sse200_devices[] = {
         .ppc = NO_PPC,
         .irq = NMI_1,
     },
+    {
+        .name = "armsse-sysinfo",
+        .type = TYPE_IOTKIT_SYSINFO,
+        .index = 0,
+        .addr = 0x40020000,
+        .ppc = NO_PPC,
+        .irq = NO_IRQ,
+    },
     {
         .name = NULL,
     }
@@ -407,6 +415,10 @@ static void armsse_init(Object *obj)
             object_initialize_child(obj, devinfo->name,
                                     &s->cmsdk_watchdog[devinfo->index],
                                     TYPE_CMSDK_APB_WATCHDOG);
+        } else if (!strcmp(devinfo->type, TYPE_IOTKIT_SYSINFO)) {
+            assert(devinfo->index == 0);
+            object_initialize_child(obj, devinfo->name, &s->sysinfo,
+                                    TYPE_IOTKIT_SYSINFO);
         } else {
             g_assert_not_reached();
         }
@@ -437,8 +449,6 @@ static void armsse_init(Object *obj)
 
     object_initialize_child(obj, "armsse-sysctl", &s->sysctl,
                             TYPE_IOTKIT_SYSCTL);
-    object_initialize_child(obj, "armsse-sysinfo", &s->sysinfo,
-                            TYPE_IOTKIT_SYSINFO);
     if (info->has_mhus) {
         object_initialize_child(obj, "mhu0", &s->mhu[0], TYPE_ARMSSE_MHU);
         object_initialize_child(obj, "mhu1", &s->mhu[1], TYPE_ARMSSE_MHU);
@@ -889,6 +899,22 @@ static void armsse_realize(DeviceState *dev, Error **errp)
                 return;
             }
             mr = sysbus_mmio_get_region(sbd, 0);
+        } else if (!strcmp(devinfo->type, TYPE_IOTKIT_SYSINFO)) {
+            sbd = SYS_BUS_DEVICE(&s->sysinfo);
+
+            object_property_set_int(OBJECT(&s->sysinfo), "SYS_VERSION",
+                                    info->sys_version, &error_abort);
+            object_property_set_int(OBJECT(&s->sysinfo), "SYS_CONFIG",
+                                    armsse_sys_config_value(s, info),
+                                    &error_abort);
+            object_property_set_int(OBJECT(&s->sysinfo), "sse-version",
+                                    info->sse_version, &error_abort);
+            object_property_set_int(OBJECT(&s->sysinfo), "IIDR",
+                                    info->iidr, &error_abort);
+            if (!sysbus_realize(sbd, errp)) {
+                return;
+            }
+            mr = sysbus_mmio_get_region(sbd, 0);
         } else {
             g_assert_not_reached();
         }
@@ -1106,23 +1132,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         memory_region_add_subregion(&s->container, devinfo->addr, mr);
     }
 
-    if (!object_property_set_int(OBJECT(&s->sysinfo), "SYS_VERSION",
-                                 info->sys_version, errp)) {
-        return;
-    }
-    if (!object_property_set_int(OBJECT(&s->sysinfo), "SYS_CONFIG",
-                                 armsse_sys_config_value(s, info), errp)) {
-        return;
-    }
-    object_property_set_int(OBJECT(&s->sysinfo), "sse-version",
-                            info->sse_version, &error_abort);
-    object_property_set_int(OBJECT(&s->sysinfo), "IIDR",
-                            info->iidr, &error_abort);
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->sysinfo), errp)) {
-        return;
-    }
-    /* System information registers */
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysinfo), 0, 0x40020000);
     /* System control registers */
     object_property_set_int(OBJECT(&s->sysctl), "sse-version",
                             info->sse_version, &error_abort);
-- 
2.20.1


