Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CFD37978A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 21:19:59 +0200 (CEST)
Received: from localhost ([::1]:53020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgBRe-00068L-AI
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 15:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgBH3-0000cE-OD
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:09:01 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:35413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgBGv-0004y2-GD
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:09:01 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 j3-20020a05600c4843b02901484662c4ebso11777204wmo.0
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 12:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ad4UlI6darwKHtTKEKCPbY9frkKNCFD/9SwZN13PKXc=;
 b=UQfG965VU2/ih32N0Wwv0MVMC2YJgfxd9CKIriZdDOez7q7mETfhAAIU2IRI2MroFS
 6zUZTpG4BymLJ4Ef8UyfsYG6eaanKyfCkmca/9SS6//+LawfTMGEUwl6r1wkqt4IkHgb
 tU+yrhN9hZX8pwtlPOADecm/rh/gfLXAy6VZt7wQFwo9L47Gv4xSqu2f3h6shZjrucAt
 dR3Fz7FtPONc6OHwdiu0REJY/0vTWofXOC1JUeZn7dnOFFKDk7BbuTYTGDe0p0DIyIEF
 9aeedij3WJ1MRVyOoBe1As+WT2TB7yX4s475UU+u7xxcOSBBpAkpIu0tlEhyH0NblOWU
 E3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ad4UlI6darwKHtTKEKCPbY9frkKNCFD/9SwZN13PKXc=;
 b=TTm0ocfkdgQOxnBd8DxO9Pq+7KYCIbSHxzBTC3gi6F81MWe1DIdIc4oYnvl+HMs/xh
 6eKA9h+n+QzkKz12bXyNlAJf/5u8sh6cexd4UVcNLCYqdlzfc4x15AiSH8QlNR392kue
 DgUl2MuLNraVKOTREXeNp8wVNjQFCjw4WlS7aMDnxymU5GvswqgXqUBO1hp4R6K/JOsF
 NBtxMP/E772pQK1dr4cqfAIN+PajYluJFrgj2KNWeRMImcZVF/oLTE3W1nXtyhYSqf9O
 DHhk2+pRkkT5JSHWWvuMrYARV5+5MSKkBUdmNjPnd82TkqVoVEmMgF5FJh9W/0/lody/
 wtEg==
X-Gm-Message-State: AOAM533hHFMkCNL4EaQY5kJsIWtFDRFW7GaEJ3z4xlg2Jcd3KGlVCg4b
 fIMWdLz1+watO8W0ZBfPo/ZexCPPZqQvQQ==
X-Google-Smtp-Source: ABdhPJwFEynyzrWb6oNXU8AuPInTITUcun5Zj1QhLRllRuVBSQpY5TI8iH3cWLIIwwWc2V1F1eKxng==
X-Received: by 2002:a05:600c:4ba3:: with SMTP id
 e35mr765025wmp.16.1620673730998; 
 Mon, 10 May 2021 12:08:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t23sm463892wmj.31.2021.05.10.12.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 12:08:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/6] hw/arm/armsse.c: Correct modelling of SSE-300 internal
 SRAMs
Date: Mon, 10 May 2021 20:08:41 +0100
Message-Id: <20210510190844.17799-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510190844.17799-1-peter.maydell@linaro.org>
References: <20210510190844.17799-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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


