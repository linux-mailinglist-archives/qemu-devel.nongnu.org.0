Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1B2331587
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:09:25 +0100 (CET)
Received: from localhost ([::1]:49704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKJo-0003yX-71
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:09:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkz-0006zv-MI
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:25 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:36479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkh-00075s-RR
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:25 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 r15-20020a05600c35cfb029010e639ca09eso4302873wmq.1
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rIdp9Af7xnr6filcPNFj0pccVxbGviQbF3q/qYjFNdc=;
 b=TYUjX9pmiamqGT0aYRBteb5Dg2tGkNEpKKKM2GxeGe8f9tN2YOWRuWmMEfdfVs+Bfy
 QCY7yYFEmNF0CLh1qnFYjOqwtCZ3rlIp1fkxtJ8d3q38SM2HUaZrB30hQ2Oom1KluVXY
 HHynCETbi6jLXwtCHeV1sHT/RFc+whZCVAMLmpVSPhqLiDJDHBaQWx5PsiKOa/x+dMX7
 u3cvrVT3o5E9GBA+YFYiWK+wXkSz/Teyg42OtPuyq6/b4Gp9y7RGNS886hN8x/ijCJLV
 /ago3tEgX2bbeWPyikj9G0+gg6aaE9OmxEDjtGqlLtpV/hygSIImJfwBtVNCuvTuPDxX
 34Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rIdp9Af7xnr6filcPNFj0pccVxbGviQbF3q/qYjFNdc=;
 b=ZTwrcdif/ik4YjpWX7ko2aGbQhXUgBxvhicqyCacBa41ZskH2GgL/s2oV1LSq1ITQg
 FOa3XcvVcp3KXEgoPo4qshsRe89Z3o7n3L0nu2B/7vUKWhX8ploJY9QsLW7KJLSMu4vF
 TgXH1G7sct93ldvyrl8nN7yUTo6TFxgCICSuqtZv0cYZV24xvqGBMF0udsmGzUwBDXPx
 4+2Vqz6xDpV/VoAnEmRIrA21FN5L8JHwJ2IAqsxH/wepabQsB6TDOpTkQeLcKTIihkZT
 3b5MiZXv/+JZp5NwhDmxB9MyibOOfC/LQcyLD7m18EW5yU+aXhCQZGmPmVN9yCg4WScO
 u7bQ==
X-Gm-Message-State: AOAM533+vUoWBa3OxtX2HsXWEAlAjoWn42PYaXT/qMeNFHGH51P5/pgl
 padRwQnZMxrhS4qsauFjiAhWGc7pMAYVjg==
X-Google-Smtp-Source: ABdhPJxd+uY1tYZz3Ny1r8emTd5oPn4KzJAHsYUmDyck6DWWucA4qv1s+eovPQy7F5b3svMNIGgUCg==
X-Received: by 2002:a05:600c:2946:: with SMTP id
 n6mr23064533wmd.52.1615224784588; 
 Mon, 08 Mar 2021 09:33:04 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.33.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:33:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/54] hw/arm/armsse: Move dual-timer device into data-driven
 framework
Date: Mon,  8 Mar 2021 17:32:14 +0000
Message-Id: <20210308173244.20710-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

Move the CMSDK dualtimer device handling into the data-driven
device placement framework.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-25-peter.maydell@linaro.org
---
 hw/arm/armsse.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 22dd437a4ba..f8da7fb00f9 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -105,6 +105,15 @@ static const ARMSSEDeviceInfo sse200_devices[] = {
         .ppc_port = 1,
         .irq = 4,
     },
+    {
+        .name = "dualtimer",
+        .type = TYPE_CMSDK_APB_DUALTIMER,
+        .index = 0,
+        .addr = 0x40002000,
+        .ppc = 0,
+        .ppc_port = 2,
+        .irq = 5,
+    },
     {
         .name = NULL,
     }
@@ -346,6 +355,10 @@ static void armsse_init(Object *obj)
             object_initialize_child(obj, devinfo->name,
                                     &s->timer[devinfo->index],
                                     TYPE_CMSDK_APB_TIMER);
+        } else if (!strcmp(devinfo->type, TYPE_CMSDK_APB_DUALTIMER)) {
+            assert(devinfo->index == 0);
+            object_initialize_child(obj, devinfo->name, &s->dualtimer,
+                                    TYPE_CMSDK_APB_DUALTIMER);
         } else {
             g_assert_not_reached();
         }
@@ -375,8 +388,6 @@ static void armsse_init(Object *obj)
     }
     object_initialize_child(obj, "s32ktimer", &s->s32ktimer,
                             TYPE_CMSDK_APB_TIMER);
-    object_initialize_child(obj, "dualtimer", &s->dualtimer,
-                            TYPE_CMSDK_APB_DUALTIMER);
     object_initialize_child(obj, "s32kwatchdog", &s->s32kwatchdog,
                             TYPE_CMSDK_APB_WATCHDOG);
     object_initialize_child(obj, "nswatchdog", &s->nswatchdog,
@@ -808,6 +819,14 @@ static void armsse_realize(DeviceState *dev, Error **errp)
                 return;
             }
             mr = sysbus_mmio_get_region(sbd, 0);
+        } else if (!strcmp(devinfo->type, TYPE_CMSDK_APB_DUALTIMER)) {
+            sbd = SYS_BUS_DEVICE(&s->dualtimer);
+
+            qdev_connect_clock_in(DEVICE(sbd), "TIMCLK", s->mainclk);
+            if (!sysbus_realize(sbd, errp)) {
+                return;
+            }
+            mr = sysbus_mmio_get_region(sbd, 0);
         } else {
             g_assert_not_reached();
         }
@@ -844,16 +863,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    qdev_connect_clock_in(DEVICE(&s->dualtimer), "TIMCLK", s->mainclk);
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->dualtimer), errp)) {
-        return;
-    }
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->dualtimer), 0,
-                       armsse_get_common_irq_in(s, 5));
-    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->dualtimer), 0);
-    object_property_set_link(OBJECT(&s->apb_ppc[0]), "port[2]", OBJECT(mr),
-                             &error_abort);
-
     if (info->has_mhus) {
         /*
          * An SSE-200 with only one CPU should have only one MHU created,
@@ -901,8 +910,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     sbd_apb_ppc0 = SYS_BUS_DEVICE(&s->apb_ppc[0]);
     dev_apb_ppc0 = DEVICE(&s->apb_ppc[0]);
 
-    mr = sysbus_mmio_get_region(sbd_apb_ppc0, 2);
-    memory_region_add_subregion(&s->container, 0x40002000, mr);
     if (info->has_mhus) {
         mr = sysbus_mmio_get_region(sbd_apb_ppc0, 3);
         memory_region_add_subregion(&s->container, 0x40003000, mr);
-- 
2.20.1


