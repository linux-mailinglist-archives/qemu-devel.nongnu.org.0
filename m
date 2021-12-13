Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 521A74729BC
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 11:24:57 +0100 (CET)
Received: from localhost ([::1]:35420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwiVs-0005dX-60
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 05:24:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwiUo-0004yY-SA
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:23:50 -0500
Received: from [2a00:1450:4864:20::333] (port=52169
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwiUi-0005Xs-6P
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:23:47 -0500
Received: by mail-wm1-x333.google.com with SMTP id 137so11511332wma.1
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 02:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d5gjd7DkXzFFar/87LfemtzCmDf71l2zjA4L0nnmEjE=;
 b=F7vxifWg+DWYnJC/9tgbXC4ggFouOTsTUAg8ktrNJYYVRhjC4RZDK9drxyclWvH9lQ
 m4daYx2V1p+t2JcCWyEstfbWH3eXBCBXLic/p+JgHZmovuceySV9KNDRbzIU4oWC7hPx
 J4NxSsj8ZkBZY7TmfU/vvWU4Owxhpu5wVJqa2pCIkh4/+75kuIQNYsWIkCOdVawsOarA
 Y72ojQAJGwcTclW90BGdfbc+v2brl9NMQrzNxvQ8BYIejAqvKwMAw+UbchUkqY1M9rvD
 LI8O6MroShNX/g9oO04NFs3kOtrPy4YBrPFT9l5VqeAEqfdvOIipBMD1YxePdXEJ/pnd
 PiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=d5gjd7DkXzFFar/87LfemtzCmDf71l2zjA4L0nnmEjE=;
 b=g2/1hYrFOBgL8ORTOUpgeLe6H9oMvI8e+VKNEsGUYaHaslCyw+hu2P8XBQW4iSBuEg
 qw5nRH3EvXwHOfW57JdQSXyyG6TZtUYdTKotAEHEQfyyOAGKYO2TosVyb55cLVHrTt4v
 KJ5Ydpq0GCwssQQf8/JSUoJqUbbgVH7p69Ys76F+GyYpxyTJEQ+gMdWxEMM3G80I3uNv
 KVq+Wlql3OCS9Np5zTg8Pq1c405VcDo5fMzo1ExiGqfU4fa6871/yZW8LdIRkkB5dFoY
 087PbDekgIAVZOznkKD1PwvtJf3V5VZwJPU3OWUdcrSr3YpfBHXtBGLkgPseHWs/oSK9
 VUcQ==
X-Gm-Message-State: AOAM532epXBsknhKgL32COHQh50KZbmNGgu8Yc7mG0Nbt5d9tCOHKvV8
 4PEA52kDiMfLWijlH94Y6jmKOZDOc7nFRQ==
X-Google-Smtp-Source: ABdhPJyrzu9UjLrKPOIN3d1SbY21zr8Z6VbIoxGp392Yde8p95syaCVdmMUMic/OXejQIDc5v++hAw==
X-Received: by 2002:a1c:7418:: with SMTP id p24mr36173717wmc.71.1639391022157; 
 Mon, 13 Dec 2021 02:23:42 -0800 (PST)
Received: from x1w.. (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id x13sm10419767wrr.47.2021.12.13.02.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 02:23:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/mips: Remove duplicated MIPSCPU::cp0_count_rate
Date: Mon, 13 Dec 2021 11:23:40 +0100
Message-Id: <20211213102340.1847248-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Simon Burge <simonb@NetBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since the previous commit 9ea89876f9d ("target/mips: Fix cycle
counter timing calculations"), MIPSCPU::cp0_count_rate is not
used anymore. We don't need it since it is already expressed
as mips_def_t::CCRes. Remove the duplicate and clean.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Based-on: <20211116072606.BE9C8A1856@thoreau.thistledown.com.au>
---
 target/mips/cpu.h      |  9 ---------
 target/mips/internal.h |  9 +++++++++
 target/mips/cpu.c      | 10 ----------
 3 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 56b1cbd091d..ea66b866c69 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1168,7 +1168,6 @@ struct CPUMIPSState {
  * @env: #CPUMIPSState
  * @clock: this CPU input clock (may be connected
  *         to an output clock from another device).
- * @cp0_count_rate: rate at which the coprocessor 0 counter increments
  *
  * A MIPS CPU.
  */
@@ -1180,14 +1179,6 @@ struct MIPSCPU {
     Clock *clock;
     CPUNegativeOffsetState neg;
     CPUMIPSState env;
-    /*
-     * The Count register acts as a timer, incrementing at a constant rate,
-     * whether or not an instruction is executed, retired, or any forward
-     * progress is made through the pipeline. The rate at which the counter
-     * increments is implementation dependent, and is a function of the
-     * pipeline clock of the processor, not the issue width of the processor.
-     */
-    unsigned cp0_count_rate;
 };
 
 
diff --git a/target/mips/internal.h b/target/mips/internal.h
index daddb05fd43..1526fb880da 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -46,6 +46,15 @@ struct mips_def_t {
     target_ulong CP0_LLAddr_rw_bitmask;
     int CP0_LLAddr_shift;
     int32_t SYNCI_Step;
+    /*
+     * @CCRes: rate at which the coprocessor 0 counter increments
+     *
+     * The Count register acts as a timer, incrementing at a constant rate,
+     * whether or not an instruction is executed, retired, or any forward
+     * progress is made through the pipeline. The rate at which the counter
+     * increments is implementation dependent, and is a function of the
+     * pipeline clock of the processor, not the issue width of the processor.
+     */
     int32_t CCRes;
     int32_t CP0_Status_rw_bitmask;
     int32_t CP0_TCStatus_rw_bitmask;
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 0766e256931..af287177d5a 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -434,13 +434,11 @@ static void mips_cpu_disas_set_info(CPUState *s, disassemble_info *info)
  * Since commit 6af0bf9c7c3 this model assumes a CPU clocked at 200MHz.
  */
 #define CPU_FREQ_HZ_DEFAULT     200000000
-#define CP0_COUNT_RATE_DEFAULT  2
 
 static void mips_cp0_period_set(MIPSCPU *cpu)
 {
     CPUMIPSState *env = &cpu->env;
 
-    /* env->CCRes isn't initialised this early, use env->cpu_model->CCRes. */
     env->cp0_count_ns = clock_ticks_to_ns(MIPS_CPU(cpu)->clock,
                                           env->cpu_model->CCRes);
     assert(env->cp0_count_ns);
@@ -515,13 +513,6 @@ static ObjectClass *mips_cpu_class_by_name(const char *cpu_model)
     return oc;
 }
 
-static Property mips_cpu_properties[] = {
-    /* CP0 timer running at half the clock of the CPU */
-    DEFINE_PROP_UINT32("cp0-count-rate", MIPSCPU, cp0_count_rate,
-                       CP0_COUNT_RATE_DEFAULT),
-    DEFINE_PROP_END_OF_LIST()
-};
-
 #ifndef CONFIG_USER_ONLY
 #include "hw/core/sysemu-cpu-ops.h"
 
@@ -561,7 +552,6 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_parent_realize(dc, mips_cpu_realizefn,
                                     &mcc->parent_realize);
     device_class_set_parent_reset(dc, mips_cpu_reset, &mcc->parent_reset);
-    device_class_set_props(dc, mips_cpu_properties);
 
     cc->class_by_name = mips_cpu_class_by_name;
     cc->has_work = mips_cpu_has_work;
-- 
2.33.1


