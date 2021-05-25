Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E36E3904A8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:10:18 +0200 (CEST)
Received: from localhost ([::1]:43928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYhF-00009R-Bo
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:10:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYar-0001mP-JS
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:41 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYao-00045H-Gr
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:41 -0400
Received: by mail-wr1-x42f.google.com with SMTP id x7so13000865wrt.12
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HSfuCkSnES3tJ+n2+fj+WjcjSsT01dBeB26N1JFP4LU=;
 b=HQitmdZ/0W1F2irqavkyoVR3Wfgo0xBJVx0h5c1KXmmw0w6bUF1BOj/Iti8YXSxjM3
 Lln2szdkMLjCoxqiK2l1ad2S0TTQ/myGgu/HMINtIXVRzZyLO5y767PlNViIilijWdol
 bPLZ8U23GQThvMrLSsHUVNKBR8b4xbpY8GNz2gEKt9jskyUnnurtJY0sO8IBgTvOlCM9
 I6XlQg4wVd6z5hvv9FbQLt3NQEjv4CoVw8QLwO1iisERWpGtGR766EzRWkET64P1pDuV
 g4A42NyymL45ydkiFNSsLUCzc+E7PreAJ4hxNwR0z64duAfTTDRRmrpMURv5lBaFXviz
 RRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HSfuCkSnES3tJ+n2+fj+WjcjSsT01dBeB26N1JFP4LU=;
 b=TKmrQUy5m1XIa79apYC+n+63VLqmjQS81vESNVQsw7eXG/Qxo8HMwJdwRsEiXVwS+h
 TVyyxaLh3heefcklTxS3StlTF0xHWB8TbGtVqfWDzKdGkAd03uSBVQPUEkeoVdfldXYP
 M2CdJe8PYrHnfgfh14UvPgfDg5QKGnQizZmKHlqnWxaOq9kzP5m5xSkc20VE3YSpqexm
 V6VNXEnHU+4bv+8UqV3K1gBCaDnEZ/A55k/XupzLfEx5s1H8Bk2ccp7BywWZFs1WPiAR
 1Zo2+16/Rz6a1xDzMx0VnFCQ1thGIuILeyn/AiEiJFD2lPxMaNnK5dRIw3rhY3YDG8oA
 5ccQ==
X-Gm-Message-State: AOAM533g+VdceCQAwzsPriq9tSkdXRDpSSEC2aWZ/WTsNc8iSfffh6MQ
 C+xVOSvf5202ZV+J6ss0PgxPsxfXxXyYEd0B
X-Google-Smtp-Source: ABdhPJwau7G/hdav4AJaiwdMAUZjvXYK/SP2ABegbzpy16upod9Phf2dntCFP4T4Z+4BiDqcB92iNw==
X-Received: by 2002:a5d:6381:: with SMTP id p1mr28108799wru.19.1621955017106; 
 Tue, 25 May 2021 08:03:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.03.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:03:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 008/114] hw/arm: Model TCMs in the SSE-300, not the AN547
Date: Tue, 25 May 2021 16:01:38 +0100
Message-Id: <20210525150324.32370-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

The SSE-300 has an ITCM at 0x0000_0000 and a DTCM at 0x2000_0000.
Currently we model these in the AN547 board, but this is conceptually
wrong, because they are a part of the SSE-300 itself. Move the
modelling of the TCMs out of mps2-tz.c into sse300.c.

This has no guest-visible effects.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210510190844.17799-7-peter.maydell@linaro.org
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


