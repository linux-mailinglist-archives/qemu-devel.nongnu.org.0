Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDA131FBC8
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:15:13 +0100 (CET)
Received: from localhost ([::1]:57164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7Uu-0005oK-98
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:15:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73i-0002WY-2T
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:10 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:50559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73J-0003a6-KS
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:05 -0500
Received: by mail-wm1-x32a.google.com with SMTP id a132so7345754wmc.0
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UWgUkQ5pNZaZMRQCNjAYP//R+U9Ab+cfi649cOww/uQ=;
 b=up4D5Ybd3VUz639hzzbRDxYYcMYcqQsmROk3eB0pmJw6g1cA2zor4pzSGGKHGg5kie
 VreIsb1HbeJtRtnP6heucbgKRh6xDaGjRcMkU8w6+UHHZWx4cfwKC2mO3CZqLHyLXTqe
 9GM8dfGiKKgmPPTHDqBkzGTcLPtwxL/nY3LqZqRAi5OjbbgukwJF7hqjmEqdmCEFxYRF
 my1hG4LePkZmCvHOHL3Sv12b/eM3JXyPBJmxfK2X+KjItdsXf655VvYlyT3lan+rF085
 7yETKLKWxu8yZS8cOCZ/91QuRRZGM3PA4kIhgO1jczgRbSJTmHllEKxY6p8xXLsb29E6
 4zbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UWgUkQ5pNZaZMRQCNjAYP//R+U9Ab+cfi649cOww/uQ=;
 b=OrYXd9kvA4JMXAHopY/40gAXK2HX7AUfgGRl0zTNiLXrk2ZXr2jW7MVXWcpuBe57cD
 cPdyrxJ8kicS7rmL0VXBNSghaeAPplO2NDdh3qtA+8hbVurojZVMyJi/6jq+hVElwBkp
 DaelFVnks16y/petfV+Uo1AHVk9sux2DgtzpoCFGQBD31nL3az8ckc2qU3mSNip1Wk+R
 EskSauYR1IUUr2q/xkvJPGepuEZ1PtXSgFVYP2SBWlgSuxCLiV9H08PI+/LWnAQ9UMUK
 y1fdTOLiZ99t1rf5lsaCFLyViIXP5nGBGWlg7NvTMokstFsFDO7LUXH1Stb5fTY2lePd
 ZYHw==
X-Gm-Message-State: AOAM533bg3SMPqor9jtlI1+9IENukVZYq6Ur6A7+B1sJXnPLaojI04ai
 e4SI2GIOzwL93UkVKUqliLWwnZ7v0YsKqg==
X-Google-Smtp-Source: ABdhPJy4zeeikJc3a3dw3zMiwhnypXIHqsBQyFg9j/i/7+U30ayEWKSIHEzyaOn5s2WdsZ8UgLByLg==
X-Received: by 2002:a1c:730f:: with SMTP id d15mr8476371wmb.135.1613745999957; 
 Fri, 19 Feb 2021 06:46:39 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:39 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 26/44] hw/arm/armsse: Move s32ktimer into data-driven framework
Date: Fri, 19 Feb 2021 14:45:59 +0000
Message-Id: <20210219144617.4782-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

Move the CMSDK timer that uses the S32K slow clock into the data-driven
device placement framework.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


