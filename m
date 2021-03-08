Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 646E63315A2
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:15:01 +0100 (CET)
Received: from localhost ([::1]:36840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKPE-00020U-E5
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:15:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkz-0006yJ-1d
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:25 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkj-00076C-Qm
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:24 -0500
Received: by mail-wr1-x432.google.com with SMTP id l12so12332257wry.2
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QFfMyiBhaGCd5vnrl1Fd6DmKH+l7p58EQ9KdLB+f7Bc=;
 b=b3xWueesLGwVCL2tDFBfGPJFHjgJUw9jaZMongkB6oDW8TeO5/D/KztwsQlC77pyvd
 y4YtOgjSbb4hAphDXNzrxQOWu75oC+LCFB4Ft3LuYiwg90HrVSYpmF3rpfYWS0JT7BsE
 AnXnxm4ivMjoj981Z+FVcCnfWdaGiFpYNRmoLuznGhRKWFlHUCdFaRav3fKv2F1oOD7D
 FRA88oXq71vQK4hKh984O1zYTjkCcW/RSv2u39uZVPI5qTshRFLgHIIqUzd3Qku4oEfI
 G3c8+aguRc+nRV/JGqIHCDOwBav6/18w0wNfMt/9vGdyIJFQWqVC0P/+D7eviuBujuwO
 2CkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QFfMyiBhaGCd5vnrl1Fd6DmKH+l7p58EQ9KdLB+f7Bc=;
 b=AxuRHpEb3vthfs32JN12zQ30kyFGyeADO4QvyI1syv7h0LO8nCHN/+xfWzv8aKmFNt
 9No+mbWhrM4Vdq9w9Wf9JHHTifgsr+rIWHtKtSB7RL8cGE95AYDwDpe/7N0HMRwGiRvZ
 40TWEHqWwrlBeTADR2j0NJ9rHPGpCSZCDMrpw3/iMIaNdG4Rimo7o/Stq4VAI+957yNW
 gDqk5iRpsXvMPfWU7hyRvjNSNyIOLiNH4aWvhVrTJsIGyrxeg84BRW5b02skW+eYluan
 0NvBMTgS7mBnD7PvVF0HMH/JpuwYgRjqHMQnSuyN1/zPDiudk+JRRxz/KBqwjwqcdUBp
 dEeA==
X-Gm-Message-State: AOAM5334ypWpu74UIgKQyHmjKgm/x10eqUJpcrW7SCG3WEMEIM6kn2yp
 +75XA5lXWvmJWXtCFownSrGbH5ekPG0d7w==
X-Google-Smtp-Source: ABdhPJxtY/9Bl0nVmTN7UnRQ+4FC4uQSi/9m6PVl42GCtSGkh/cx9wax6ubT0OzJgvNfWSF7pskyAA==
X-Received: by 2002:a5d:468e:: with SMTP id u14mr24142921wrq.359.1615224787619; 
 Mon, 08 Mar 2021 09:33:07 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.33.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:33:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/54] hw/arm/armsse: Move sysctl register block into
 data-driven framework
Date: Mon,  8 Mar 2021 17:32:18 +0000
Message-Id: <20210308173244.20710-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-29-peter.maydell@linaro.org
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


