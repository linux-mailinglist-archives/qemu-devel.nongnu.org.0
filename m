Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B59324CFC7A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:16:26 +0100 (CET)
Received: from localhost ([::1]:44378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBLl-0004I7-Mk
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:16:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRALm-0002tA-KD
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:12:22 -0500
Received: from [2a00:1450:4864:20::42d] (port=42586
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRALl-0004Ii-4S
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:12:22 -0500
Received: by mail-wr1-x42d.google.com with SMTP id u10so20725758wra.9
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DqaZ5Ub4osh9S6eeel3VjCBvvslN0dh7T/O90JZjAfc=;
 b=kFSzdr92zF2OUN0ZRJfIS0rqFvDPEjO2CzyCdxP6KyeOfepuG60RB/xJDDvmuxMjst
 r6KLU8uPw5ybTr8xYtZsOOHVymXr4LJSe1itImeEukEbhzFYnMOk2Pa9iAPAN00X5R/h
 qdxJWReUGw9kanbYMEHls5Qb0UApRrpLpPMuRhIsZogC06VcoVX40frmwvKCw1SLpeNf
 sdT5zp6Us0J4I2HMjlzfEp5keKbT2ArJX+Ftu2om9RlYWWhHtSTBBXjJUIcmDoKnzd0v
 1YGzDzIZ/oBWJ1wdxXzgBgoK7JBCCvpZj0qaQO1JyLtuFVNy2ZX2texHzZh5AVGjCEFG
 D3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DqaZ5Ub4osh9S6eeel3VjCBvvslN0dh7T/O90JZjAfc=;
 b=ukCGb3zdyzDM8fU3NLNuPMPGSf4M0gP1fXzvsxnaKVzBkmhxUwUM4zt5WYNDj2KjAi
 hlWUtbUre4NvCuhWMf0l8JOzX7Cww1Mnfmz3viDxwGozZ3NietjRU5LckG1Gzdt7Je7M
 fPFFxT0sxBzdO4cw5oaupiOgqa3gcqoGnE4NuiJX+jsyURw/cShbUHYxdcq7vS6Cw+5e
 KZafBv1dHkSMvsN7VV9f2ijWY8pR7mkm95IOb/ywdtAuG7KMCQvFs31g6ckoFKi/bPfZ
 +5eaCZ+fqbcIJEKVUoCPtYxdBqf5F6yWeN1p/pyjhEpFRdd3nBBUL1lWE7AQsKBi6Him
 IXxg==
X-Gm-Message-State: AOAM5308zZ+9s4wnihCF6ovcdpB4aijAfTP/kjbp0Fd7QTpvTaeqJZLU
 Lizei8flKZKBVH3ZVcFuh61EtNJmNtc=
X-Google-Smtp-Source: ABdhPJx93mYXBEwF24vXUkQWpaaY61okbPubdNO+QYuVLfT3Cdq7aQo9aij7B31Mbn/fU0ogdQINKw==
X-Received: by 2002:adf:c40e:0:b0:1f1:d719:52d2 with SMTP id
 v14-20020adfc40e000000b001f1d71952d2mr7922389wrf.105.1646647938437; 
 Mon, 07 Mar 2022 02:12:18 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adff0c2000000b001f1fa284a32sm1604906wro.115.2022.03.07.02.12.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 02:12:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/16] target/mips: Remove duplicated MIPSCPU::cp0_count_rate
Date: Mon,  7 Mar 2022 11:11:53 +0100
Message-Id: <20220307101207.90369-3-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
References: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Since the previous commit 9ea89876f9d ("target/mips: Fix cycle
counter timing calculations"), MIPSCPU::cp0_count_rate is not
used anymore. We don't need it since it is already expressed
as mips_def_t::CCRes. Remove the duplicate and clean.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <>20211213102340.1847248-1-f4bug@amsat.org>
---
 target/mips/cpu.c      | 10 ----------
 target/mips/cpu.h      |  9 ---------
 target/mips/internal.h |  9 +++++++++
 3 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 0766e25693..af287177d5 100644
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
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 56b1cbd091..ea66b866c6 100644
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
index daddb05fd4..1526fb880d 100644
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
-- 
2.34.1


