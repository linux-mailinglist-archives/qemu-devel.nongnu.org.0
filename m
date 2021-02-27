Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2D3326F99
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 00:28:20 +0100 (CET)
Received: from localhost ([::1]:46024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lG90V-0003Ls-9y
	for lists+qemu-devel@lfdr.de; Sat, 27 Feb 2021 18:28:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lG8xi-0001eo-Eo
 for qemu-devel@nongnu.org; Sat, 27 Feb 2021 18:25:26 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:34667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lG8xf-00037K-NZ
 for qemu-devel@nongnu.org; Sat, 27 Feb 2021 18:25:26 -0500
Received: by mail-pg1-x52e.google.com with SMTP id l2so8626921pgb.1
 for <qemu-devel@nongnu.org>; Sat, 27 Feb 2021 15:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1wtxOXkgEIEKU8XQwNUeSlT4Y6Fve79jFtXE/YJnOWg=;
 b=VD6O8LM5bIqao7y1WVAbB4KIKXGosTea5lBURqVCX2bCCJH6WctJxmKKmC6CF4xfm0
 2Skgpd9qX6IMGW9pXJsz9hS6CjMyXoSIv9Pf22KqSuG41FuqOeatnHtdwuhsXQpU3ZQt
 vIPBQt1FRoxB9zQyo7fjVOVdli4ut4KRAsTt4rdAl37ruFnznM1TwmUp+Fr0eI4LHD/F
 T42vqscRklgfISkwX6G3cHAv0u1tIBvT/q9BGD0o6w3x3s2K/ELcP+ARAtZJTy2wzQR1
 xWRQV0OnmDUC/4J7B+623nFt3aLj6vhdWsh11YTEllApzgYb4zLHOcpIt87bH9jXtTsC
 6YPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1wtxOXkgEIEKU8XQwNUeSlT4Y6Fve79jFtXE/YJnOWg=;
 b=ogRb9LLjSzwhrP/aKFVIbQ5n3cu0SfTFYqIzOZ8PDCbcCK69viP+RIVyTSZlGtv2by
 jtT3lLDL1JNBgwxyGFUNuQhsbYyR2yzgdCry1JHeZf7exc5KVuY6G7gegqdMVLiQwn3v
 CUE2Sv4C8sZ9Tn5riUFyS65NRla4RiBLa7XJf+3GG6CVsuCfmsKMUnFF2y4PXfv9PzGe
 fmG85r2VFm1oMvYVoppbXlEWFDp5Ig79reF90dmsZa5NZKgyQ/qyMdGa7OmGxDVVrU3U
 BKFgQ+XGc+yP1QUyyxMEIToihMDfwKFwaX76LcSvaM9+d/+ovCF/8JsQ/14FkNOEY5MZ
 bFeQ==
X-Gm-Message-State: AOAM530+XlXLH0a3VzEVhabGb2S1I/pg7Kwwh+eKiOjdRWefZ/L4GRpE
 EyY5pz4As04GAHFNWf96RLfgn7SpwIqZuw==
X-Google-Smtp-Source: ABdhPJxrzz0UJdTa7MomOqgCAkjBmc9qyiSV+kSS3oamXQ/SID17fLDoiyiJ6G9uMsFFoXpXBcS0MA==
X-Received: by 2002:a65:50c8:: with SMTP id s8mr8221122pgp.68.1614468321499;
 Sat, 27 Feb 2021 15:25:21 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id ha8sm8187516pjb.6.2021.02.27.15.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Feb 2021 15:25:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/mips: Fold jazz behaviour into
 mips_cpu_do_transaction_failed
Date: Sat, 27 Feb 2021 15:25:18 -0800
Message-Id: <20210227232519.222663-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210227232519.222663-1-richard.henderson@linaro.org>
References: <20210227232519.222663-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: f4bug@amsat.org, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a flag to MIPSCPUClass in order to avoid needing to
replace mips_tcg_ops.do_transaction_failed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/cpu-qom.h   |  3 +++
 hw/mips/jazz.c          | 35 +++--------------------------------
 target/mips/op_helper.c |  3 ++-
 3 files changed, 8 insertions(+), 33 deletions(-)

diff --git a/target/mips/cpu-qom.h b/target/mips/cpu-qom.h
index 826ab13019..dda0c911fa 100644
--- a/target/mips/cpu-qom.h
+++ b/target/mips/cpu-qom.h
@@ -47,6 +47,9 @@ struct MIPSCPUClass {
     DeviceRealize parent_realize;
     DeviceReset parent_reset;
     const struct mips_def_t *cpu_def;
+
+    /* Used for the jazz board to modify mips_cpu_do_transaction_failed. */
+    bool no_data_aborts;
 };
 
 
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 83c8086062..7b22a9b511 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -120,30 +120,6 @@ static const MemoryRegionOps dma_dummy_ops = {
 #define MAGNUM_BIOS_SIZE                                                       \
         (BIOS_SIZE < MAGNUM_BIOS_SIZE_MAX ? BIOS_SIZE : MAGNUM_BIOS_SIZE_MAX)
 
-#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
-static void (*real_do_transaction_failed)(CPUState *cpu, hwaddr physaddr,
-                                          vaddr addr, unsigned size,
-                                          MMUAccessType access_type,
-                                          int mmu_idx, MemTxAttrs attrs,
-                                          MemTxResult response,
-                                          uintptr_t retaddr);
-
-static void mips_jazz_do_transaction_failed(CPUState *cs, hwaddr physaddr,
-                                            vaddr addr, unsigned size,
-                                            MMUAccessType access_type,
-                                            int mmu_idx, MemTxAttrs attrs,
-                                            MemTxResult response,
-                                            uintptr_t retaddr)
-{
-    if (access_type != MMU_INST_FETCH) {
-        /* ignore invalid access (ie do not raise exception) */
-        return;
-    }
-    (*real_do_transaction_failed)(cs, physaddr, addr, size, access_type,
-                                  mmu_idx, attrs, response, retaddr);
-}
-#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
-
 static void mips_jazz_init(MachineState *machine,
                            enum jazz_model_e jazz_model)
 {
@@ -152,7 +128,7 @@ static void mips_jazz_init(MachineState *machine,
     int bios_size, n;
     Clock *cpuclk;
     MIPSCPU *cpu;
-    CPUClass *cc;
+    MIPSCPUClass *mcc;
     CPUMIPSState *env;
     qemu_irq *i8259;
     rc4030_dma *dmas;
@@ -199,8 +175,6 @@ static void mips_jazz_init(MachineState *machine,
      * However, we can't simply add a global memory region to catch
      * everything, as this would make all accesses including instruction
      * accesses be ignored and not raise exceptions.
-     * So instead we hijack the do_transaction_failed method on the CPU, and
-     * do not raise exceptions for data access.
      *
      * NOTE: this behaviour of raising exceptions for bad instruction
      * fetches but not bad data accesses was added in commit 54e755588cf1e9
@@ -210,11 +184,8 @@ static void mips_jazz_init(MachineState *machine,
      * we could replace this hijacking of CPU methods with a simple global
      * memory region that catches all memory accesses, as we do on Malta.
      */
-    cc = CPU_GET_CLASS(cpu);
-#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
-    real_do_transaction_failed = cc->tcg_ops->do_transaction_failed;
-    cc->tcg_ops->do_transaction_failed = mips_jazz_do_transaction_failed;
-#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
+    mcc = MIPS_CPU_GET_CLASS(cpu);
+    mcc->no_data_aborts = true;
 
     /* allocate RAM */
     memory_region_add_subregion(address_space, 0, machine->ram);
diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index b80e8f7540..7626fc5254 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -1164,11 +1164,12 @@ void mips_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                     MemTxResult response, uintptr_t retaddr)
 {
     MIPSCPU *cpu = MIPS_CPU(cs);
+    MIPSCPUClass *mcc = MIPS_CPU_GET_CLASS(cpu);
     CPUMIPSState *env = &cpu->env;
 
     if (access_type == MMU_INST_FETCH) {
         do_raise_exception(env, EXCP_IBE, retaddr);
-    } else {
+    } else if (!mcc->no_data_aborts) {
         do_raise_exception(env, EXCP_DBE, retaddr);
     }
 }
-- 
2.25.1


