Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A473904A9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:10:22 +0200 (CEST)
Received: from localhost ([::1]:44274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYhJ-0000OX-8m
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:10:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYaq-0001ir-ME
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:40 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYam-00042x-Dh
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:40 -0400
Received: by mail-wr1-x432.google.com with SMTP id z17so32606267wrq.7
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=m9XEXaKjRTTcc97ILzePcIC7+lA43yzaNjm/RAAFxgY=;
 b=tJqOhgrxPse6EaXoyyPqntBrKlBOKtyoxjgOzEa+AFmDRzQQzS0B4QYX5kbdZeA7hn
 pstoR04LUj2PA4CpKj/1W2jW4MiwazxcvU7XWPASZRMw8bwwFrWf69jFc/yL58WIMWd2
 MTb+C4CGMvSEntAcaumqOG45hTrqjhsZQ6WcnDw3hvMOZVCEdlWhVemq3pMLbjOvKx4a
 NiOGTHWvRLWyZJq3kcKi8pJAQik1NG+pEi+D4Zdg0SxtEYKvE6gCZL+u6j6LGryZLDsK
 dEdCMYUcxWi+vWe7hcGnaUJ+7Gjee48A/f42/9GdjOVGA2/iHlK8c3xdSY4WkXzJh3Q4
 /psQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m9XEXaKjRTTcc97ILzePcIC7+lA43yzaNjm/RAAFxgY=;
 b=OK2JDGsWsfDD5JNV2NGZvOx0/BBh6SZlF40rw+8PE9QpqR4Hdh22RSP0RucreggAvW
 FAtC+lxmduc5gkMN46Kw4X3eVeN6kYxnUi8/KQh7ivhFHX6nVsCOOly7ouiWOJYMqNgz
 2DHpK/+lCySr1K9B6+XOtVTyLAUXaGWkRKlw41d0Idp+XjDfJ2MNUQy+3qwxZSvhudBj
 yqAywC2dtZFsfmNqw/jERzd7WNwn6cUwZ9/5Lhw3tw7sf8Ko51I6lIcoeL4hHbvs+v4/
 Lbo4yGXg6NzM3MJyObVMriP9QfXnQDeh7gET/tQC5dauRksHX4Ye/N7Yg6bCxN8Gd4XF
 bYwg==
X-Gm-Message-State: AOAM530eQ+6meH2NnbJ4W/RlIw2l3MtmgGWWJYKEN7dLSkL6psPFO5Ta
 bWTgMEUtSAoB9ppHzwQudq08h3bV7MeES6jf
X-Google-Smtp-Source: ABdhPJxP4UfBxhpXBB0u7RJsOomLGISXPnJNrdU+XuKMMBgF1+DQkaRncGu+naWQqkLtFJtsme2Dog==
X-Received: by 2002:adf:d231:: with SMTP id k17mr27022789wrh.78.1621955014992; 
 Tue, 25 May 2021 08:03:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.03.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:03:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 005/114] hw/arm/armsse.c: Correct modelling of SSE-300 internal
 SRAMs
Date: Tue, 25 May 2021 16:01:35 +0100
Message-Id: <20210525150324.32370-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
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

The SSE-300 was not correctly modelling its internal SRAMs:
 * the SRAM address width default is 18
 * the SRAM is mapped at 0x2100_0000, not 0x2000_0000 like
   the SSE-200 and IoTKit

The default address width is no longer guest-visible since
our only SSE-300 board sets it explicitly to a non-default
value, but following the hardware's default will help for
any future boards we need to model.

Reported-by: Devaraj Ranganna <devaraj.ranganna@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210510190844.17799-4-peter.maydell@linaro.org
---
 hw/arm/armsse.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 2e5d0679e7b..1729f09c7cb 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -59,6 +59,7 @@ struct ARMSSEInfo {
     const char *cpu_type;
     uint32_t sse_version;
     int sram_banks;
+    uint32_t sram_bank_base;
     int num_cpus;
     uint32_t sys_version;
     uint32_t iidr;
@@ -102,7 +103,7 @@ static Property sse300_properties[] = {
     DEFINE_PROP_LINK("memory", ARMSSE, board_memory, TYPE_MEMORY_REGION,
                      MemoryRegion *),
     DEFINE_PROP_UINT32("EXP_NUMIRQ", ARMSSE, exp_numirq, 64),
-    DEFINE_PROP_UINT32("SRAM_ADDR_WIDTH", ARMSSE, sram_addr_width, 15),
+    DEFINE_PROP_UINT32("SRAM_ADDR_WIDTH", ARMSSE, sram_addr_width, 18),
     DEFINE_PROP_UINT32("init-svtor", ARMSSE, init_svtor, 0x10000000),
     DEFINE_PROP_BOOL("CPU0_FPU", ARMSSE, cpu_fpu[0], true),
     DEFINE_PROP_BOOL("CPU0_DSP", ARMSSE, cpu_dsp[0], true),
@@ -504,6 +505,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .sse_version = ARMSSE_IOTKIT,
         .cpu_type = ARM_CPU_TYPE_NAME("cortex-m33"),
         .sram_banks = 1,
+        .sram_bank_base = 0x20000000,
         .num_cpus = 1,
         .sys_version = 0x41743,
         .iidr = 0,
@@ -523,6 +525,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .sse_version = ARMSSE_SSE200,
         .cpu_type = ARM_CPU_TYPE_NAME("cortex-m33"),
         .sram_banks = 4,
+        .sram_bank_base = 0x20000000,
         .num_cpus = 2,
         .sys_version = 0x22041743,
         .iidr = 0,
@@ -542,6 +545,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .sse_version = ARMSSE_SSE300,
         .cpu_type = ARM_CPU_TYPE_NAME("cortex-m55"),
         .sram_banks = 2,
+        .sram_bank_base = 0x21000000,
         .num_cpus = 1,
         .sys_version = 0x7e00043b,
         .iidr = 0x74a0043b,
@@ -1161,7 +1165,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         /* Map the upstream end of the MPC into the right place... */
         sbd_mpc = SYS_BUS_DEVICE(&s->mpc[i]);
         memory_region_add_subregion(&s->container,
-                                    0x20000000 + i * sram_bank_size,
+                                    info->sram_bank_base + i * sram_bank_size,
                                     sysbus_mmio_get_region(sbd_mpc, 1));
         /* ...and its register interface */
         memory_region_add_subregion(&s->container, 0x50083000 + i * 0x1000,
-- 
2.20.1


