Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB3C3797AC
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 21:23:53 +0200 (CEST)
Received: from localhost ([::1]:33170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgBVQ-0003U6-Fg
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 15:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgBH7-0000fM-KT
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:09:07 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:52965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgBGx-00050O-9d
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:09:05 -0400
Received: by mail-wm1-x335.google.com with SMTP id g65so9801571wmg.2
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 12:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jPFTO/Pkb0tpTTdt3nZWuAHHHRL642BlgSkp2Crh+Tw=;
 b=R7JhgUncdY4QoKikAyCvhBR9CiMM1jj5r3eSQCPudffcgFUN0xWwBrL/p6rOYusfk2
 1WVuaWAjUdi7DO+NJ6pRTKQM+XNhgyt255iltsr5WRpTCily+WJ/61sRmK4yxmYpuMmg
 WQuMFYW6fq6VCH2Cwr3XaAgBu3CpG0R9KWbvgaqCeWiigvq9MKapuKn5I+0zz2MbstcI
 CMRe5XuEZ63xuKyNMecB5CvO/zwB/l2rYGmNPsWcRA7M/eDh+0GPwopYhCcI/goEhpZu
 ezt1UrKMW59SSd0XThzwDwYC9f7bnwixD3ObW20hA15VSPGmg78BTQjzTDVyK1NVqyF9
 JH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jPFTO/Pkb0tpTTdt3nZWuAHHHRL642BlgSkp2Crh+Tw=;
 b=g07P5ucF8dnUSmuOCEvqZcDm31toPAHOj9NCHiGCI4XGDVqlaNzbOUKBNn765gQALg
 Msesu8Rx49uGneNNeMaEUtxPcGA5g5P+I5tbV0dqwXzRtBtp4O8cAJXl3qoOOYb6Ayua
 5tMAi4m8EeDQW6M7bvJ/U2AemA4FIJEvku16mqUjgpytBsLuEUK6MkIbGkGtPQX65pgw
 mnR1rAeRIj19Wq6+eQaBAzFb0W+Xprb1tXhMnvqbiJWqxhdHpIjQ40jvBxh9781q1IqH
 vKHsxJRX9QQkEzFrhoZSQKxCFeuAwlMLYDVLYTMtdkQNKIGivg6qUyEnQ7RtAQDuyDJl
 OMzg==
X-Gm-Message-State: AOAM532HQauKwg/vgoKpaJ94Q78DJV+jvYZTpoIOQKKKWd0Bm6S6Z87A
 cFAnSPRIpjaFX0oOF9zXVPsaeA==
X-Google-Smtp-Source: ABdhPJwSA1JIG+ExFPvHX9glIDtEwX/yt2UssQXq5KtEYbbZ/k3uvbrq/sYxvoPOoqMeaqqVny3l6A==
X-Received: by 2002:a05:600c:4f93:: with SMTP id
 n19mr733428wmq.100.1620673734048; 
 Mon, 10 May 2021 12:08:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t23sm463892wmj.31.2021.05.10.12.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 12:08:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 6/6] hw/arm: Model TCMs in the SSE-300, not the AN547
Date: Mon, 10 May 2021 20:08:44 +0100
Message-Id: <20210510190844.17799-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510190844.17799-1-peter.maydell@linaro.org>
References: <20210510190844.17799-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: Kumar Gala <kumar.gala@linaro.org>,
 Jimmy Brisson <jimmy.brisson@linaro.org>,
 Kevin Townsend <kevin.townsend@linaro.org>,
 Devaraj Ranganna <devaraj.ranganna@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SSE-300 has an ITCM at 0x0000_0000 and a DTCM at 0x2000_0000.
Currently we model these in the AN547 board, but this is conceptually
wrong, because they are a part of the SSE-300 itself. Move the
modelling of the TCMs out of mps2-tz.c into sse300.c.

This has no guest-visible effects.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armsse.h |  2 ++
 hw/arm/armsse.c         | 19 +++++++++++++++++++
 hw/arm/mps2-tz.c        | 12 ------------
 3 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 36592be62c5..9648e7a4193 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -198,6 +198,8 @@ struct ARMSSE {
     MemoryRegion alias2;
     MemoryRegion alias3[SSE_MAX_CPUS];
     MemoryRegion sram[MAX_SRAM_BANKS];
+    MemoryRegion itcm;
+    MemoryRegion dtcm;
 
     qemu_irq *exp_irqs[SSE_MAX_CPUS];
     qemu_irq ppc0_irq;
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index be5aa1f113a..a1456cb0f42 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -13,6 +13,7 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "qemu/bitops.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "trace.h"
 #include "hw/sysbus.h"
@@ -70,6 +71,7 @@ struct ARMSSEInfo {
     bool has_cpuid;
     bool has_cpu_pwrctrl;
     bool has_sse_counter;
+    bool has_tcms;
     Property *props;
     const ARMSSEDeviceInfo *devinfo;
     const bool *irq_is_common;
@@ -516,6 +518,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .has_cpuid = false,
         .has_cpu_pwrctrl = false,
         .has_sse_counter = false,
+        .has_tcms = false,
         .props = iotkit_properties,
         .devinfo = iotkit_devices,
         .irq_is_common = sse200_irq_is_common,
@@ -536,6 +539,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .has_cpuid = true,
         .has_cpu_pwrctrl = false,
         .has_sse_counter = false,
+        .has_tcms = false,
         .props = sse200_properties,
         .devinfo = sse200_devices,
         .irq_is_common = sse200_irq_is_common,
@@ -556,6 +560,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .has_cpuid = true,
         .has_cpu_pwrctrl = true,
         .has_sse_counter = true,
+        .has_tcms = true,
         .props = sse300_properties,
         .devinfo = sse300_devices,
         .irq_is_common = sse300_irq_is_common,
@@ -1214,6 +1219,20 @@ static void armsse_realize(DeviceState *dev, Error **errp)
                                     sysbus_mmio_get_region(sbd, 1));
     }
 
+    if (info->has_tcms) {
+        /* The SSE-300 has an ITCM at 0x0000_0000 and a DTCM at 0x2000_0000 */
+        memory_region_init_ram(&s->itcm, NULL, "sse300-itcm", 512 * KiB, errp);
+        if (*errp) {
+            return;
+        }
+        memory_region_init_ram(&s->dtcm, NULL, "sse300-dtcm", 512 * KiB, errp);
+        if (*errp) {
+            return;
+        }
+        memory_region_add_subregion(&s->container, 0x00000000, &s->itcm);
+        memory_region_add_subregion(&s->container, 0x20000000, &s->dtcm);
+    }
+
     /* Devices behind APB PPC0:
      *   0x40000000: timer0
      *   0x40001000: timer1
diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 8d921afec14..e23830f4b7d 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -265,23 +265,11 @@ static const RAMInfo an524_raminfo[] = { {
 };
 
 static const RAMInfo an547_raminfo[] = { {
-        .name = "itcm",
-        .base = 0x00000000,
-        .size = 512 * KiB,
-        .mpc = -1,
-        .mrindex = 0,
-    }, {
         .name = "sram",
         .base = 0x01000000,
         .size = 2 * MiB,
         .mpc = 0,
         .mrindex = 1,
-    }, {
-        .name = "dtcm",
-        .base = 0x20000000,
-        .size = 4 * 128 * KiB,
-        .mpc = -1,
-        .mrindex = 2,
     }, {
         .name = "sram 2",
         .base = 0x21000000,
-- 
2.20.1


