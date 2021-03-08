Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E4C331566
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:01:49 +0100 (CET)
Received: from localhost ([::1]:32962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKCS-0005L6-7o
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:01:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkx-0006tW-3e
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:23 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJki-000762-Gn
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:22 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 124-20020a1c00820000b029010b871409cfso4291126wma.4
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TlkLK70vLo3e5fw7uvBkZ9GVF0hxHA2ERjrFREIYGjw=;
 b=lE517Rt6v7kMAItrmtQloMFdgoNweMCLj0LGuptBfHiKvOO08b71CczTjJ7xATJRGZ
 WlD0Go+9Pge+xJnSDFStq4CNYVPBOjtHWK+L2FIS7knJFmWvJOj6rARqArqjZYbvBrk+
 ixztCEu0OwBqC6s0xUpOeMpR6s1WQ6f5cD97ikiVTv+0GcmY2jUT6eW3KHZy7OaA5RF1
 NGceuD+Yc28JOkPdnT+vnjm5R9Rn57o3TGPTQe1ead/FlDOVStW6rU+KfQFhpjjG3uRZ
 dIH/xqGHbWRbR/GhC0pRmrAo7wFK6wXD5FTdD4MLx6GLuXu1imLc6SL20QlU9KgVSz5o
 iR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TlkLK70vLo3e5fw7uvBkZ9GVF0hxHA2ERjrFREIYGjw=;
 b=C/PivMajcC5v2CldEHC3Edvg11X4c+I4YvVsXFhVSB3XbeQYLbuxuVymXs9sS2HTTL
 ma1KQwrMcPwFDahZE2ewdxsy81NNrVWhly1Xkg5N1CJbUQCchnBIwwOB8j7/HgoUTtb4
 cHNlrHig9yrbIj0PldudrEzAsSFYJfu+QhxMLdu1fjHntwwFQ4eF9AUCiLdNMAlg55np
 D6dspXyilQRjNoFplvb5jHX+zRUplKQMlmKEX0L5Okpjv8Jt2oAab38lGhMobBbpLc0q
 x3PpJxRMwuCYDAFrP16J7bexSDdHxwBfh0dwJV/O3f+bOvx8IdqLkmcyWfEfERaMhDkr
 CHyg==
X-Gm-Message-State: AOAM530y4069H67hIaB0JUntdDCoPedvGHb2ilwh2GBOE3Wp9MKoJjv5
 CvxyA7RY1cD6w2Hifhemdc1hMvw/+8hIMg==
X-Google-Smtp-Source: ABdhPJy+RFPmv5NHBESjOAWuaY2nN1avnxSNERfN+OKu+IwlcXyYwOz6m8IcVoszkZNaTkSeEIyeSw==
X-Received: by 2002:a7b:cb04:: with SMTP id u4mr7602239wmj.122.1615224786042; 
 Mon, 08 Mar 2021 09:33:06 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.33.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:33:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/54] hw/arm/armsse: Move s32ktimer into data-driven framework
Date: Mon,  8 Mar 2021 17:32:16 +0000
Message-Id: <20210308173244.20710-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

Move the CMSDK timer that uses the S32K slow clock into the data-driven
device placement framework.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-27-peter.maydell@linaro.org
---
 include/hw/arm/armsse.h |  3 +--
 hw/arm/armsse.c         | 31 ++++++++++++-------------------
 2 files changed, 13 insertions(+), 21 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 3f8f3750577..7416c08a802 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -158,8 +158,7 @@ struct ARMSSE {
     IoTKitSecCtl secctl;
     TZPPC apb_ppc[NUM_INTERNAL_PPCS];
     TZMPC mpc[IOTS_NUM_MPC];
-    CMSDKAPBTimer timer[2];
-    CMSDKAPBTimer s32ktimer;
+    CMSDKAPBTimer timer[3];
     qemu_or_irq ppc_irq_orgate;
     SplitIRQ sec_resp_splitter;
     SplitIRQ ppc_irq_splitter[NUM_PPCS];
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 6540ffb919b..3270362d599 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -113,6 +113,16 @@ static const ARMSSEDeviceInfo sse200_devices[] = {
         .ppc_port = 1,
         .irq = 4,
     },
+    {
+        .name = "s32ktimer",
+        .type = TYPE_CMSDK_APB_TIMER,
+        .index = 2,
+        .addr = 0x4002f000,
+        .ppc = 1,
+        .ppc_port = 0,
+        .irq = 2,
+        .slowclk = true,
+    },
     {
         .name = "dualtimer",
         .type = TYPE_CMSDK_APB_DUALTIMER,
@@ -425,8 +435,6 @@ static void armsse_init(Object *obj)
         g_free(name);
     }
 
-    object_initialize_child(obj, "s32ktimer", &s->s32ktimer,
-                            TYPE_CMSDK_APB_TIMER);
     object_initialize_child(obj, "armsse-sysctl", &s->sysctl,
                             TYPE_IOTKIT_SYSCTL);
     object_initialize_child(obj, "armsse-sysinfo", &s->sysinfo,
@@ -858,7 +866,8 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         if (!strcmp(devinfo->type, TYPE_CMSDK_APB_TIMER)) {
             sbd = SYS_BUS_DEVICE(&s->timer[devinfo->index]);
 
-            qdev_connect_clock_in(DEVICE(sbd), "pclk", s->mainclk);
+            qdev_connect_clock_in(DEVICE(sbd), "pclk",
+                                  devinfo->slowclk ? s->s32kclk : s->mainclk);
             if (!sysbus_realize(sbd, errp)) {
                 return;
             }
@@ -1059,25 +1068,9 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    /* 0x40020000 .. 0x4002ffff : ARMSSE system control peripheral region */
-    /* Devices behind APB PPC1:
-     *   0x4002f000: S32K timer
-     */
-    qdev_connect_clock_in(DEVICE(&s->s32ktimer), "pclk", s->s32kclk);
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->s32ktimer), errp)) {
-        return;
-    }
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->s32ktimer), 0,
-                       armsse_get_common_irq_in(s, 2));
-    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->s32ktimer), 0);
-    object_property_set_link(OBJECT(&s->apb_ppc[1]), "port[0]", OBJECT(mr),
-                             &error_abort);
-
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->apb_ppc[1]), errp)) {
         return;
     }
-    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->apb_ppc[1]), 0);
-    memory_region_add_subregion(&s->container, 0x4002f000, mr);
 
     dev_apb_ppc1 = DEVICE(&s->apb_ppc[1]);
     qdev_connect_gpio_out_named(dev_secctl, "apb_ppc1_nonsec", 0,
-- 
2.20.1


