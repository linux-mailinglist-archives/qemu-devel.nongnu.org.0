Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28783441FC7
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:04:09 +0100 (CET)
Received: from localhost ([::1]:56888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbfE-00034F-99
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb6G-0003w5-Ls
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:28:05 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:33598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb6A-0000fi-Se
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:28:00 -0400
Received: by mail-qk1-x72e.google.com with SMTP id a132so16129399qkg.0
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pnbVDz2F7bl2MnMZvXAf7/LYYOvOlpdsDMsaNKSumSw=;
 b=jCAopIgdKmDshH9485eiYuo0XHaa2g3+RTqqygc+w96vZ6mJsVbrLd6cQ89/H+YbLn
 bikGKk+klu1w6bLaRmJmD+TLoZfp666qQFwGBXdhJb/put8O1BfL/HfpmYthnx5dFDRi
 fs/NaIbM2rMWlLVL1YTwfCDmmXYdrs4QlecIFaxd6Y3HQk912VXerXddgNIFu+ixkUbt
 x2SooLAhiKI9TAugNZqLkW0ooG+CuF/mSMhwzD1+e3NCcCrPmjVT29G8FOglo9Wmg6ho
 W2UE/R59Ngb8pFaCQ8aRbXDJTwFx9DUOaDIOu1xGoCu7ZRqcqp1y+AaCh8qWZ9Y4uk0X
 /AOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pnbVDz2F7bl2MnMZvXAf7/LYYOvOlpdsDMsaNKSumSw=;
 b=MFEOW7p1LRZd9ne4XjAkTEfZxbhwyApTH3V2jLGmRJD+JisdAmkVBFDfOKNw39rzXt
 E7u00jtzenqNMqbnpDcITG6srN+UXQtatJcRrjogxd8DWAE7unCIxKQ7kob5jZ6Sp6Th
 fdkPfJDfcSZ6xs8hEO//jyTZJU+mT6ch6i94lje8K7Lkdys+qFtyqJHQEaxkp7EzGasD
 /nnlq6K9SiWPNzkAMjtZGgwe2OoFPdHY0FJugqOcaabERVY1hXwGUphftSbxfOtOYWHD
 3kSIYldZS0cQghlLmZK3y2NBBMJalzuD32HH4156uvmypaOBi41jLQhIcFNau0ZO7FTy
 M4+g==
X-Gm-Message-State: AOAM53321E/jIqCa7ixzJ4dfTIIwD+ric3QrJDLn3TwlJYaCUU5B8jst
 aSFk2Qejn3GvRpnOK1XYntg8oVu1iPvfSg==
X-Google-Smtp-Source: ABdhPJxTHJZghckW0+mJ2eaUHzuMvOTN4WR6mTZcSPNIbILSJ44TvSSAOvnx8uW46psUa+W9stBt3w==
X-Received: by 2002:a05:620a:28cc:: with SMTP id
 l12mr16667918qkp.423.1635787670016; 
 Mon, 01 Nov 2021 10:27:50 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id t5sm6075331qkf.34.2021.11.01.10.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:27:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 33/60] target/openrisc: Make openrisc_cpu_tlb_fill sysemu
 only
Date: Mon,  1 Nov 2021 13:27:02 -0400
Message-Id: <20211101172729.23149-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fallback code in cpu_loop_exit_sigsegv is sufficient for
openrisc linux-user.

This makes all of the code in mmu.c sysemu only, so remove
the ifdefs and move the file to openrisc_softmmu_ss.
Remove the code from cpu_loop that handled EXCP_DPF.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/cpu.h          | 7 ++++---
 linux-user/openrisc/cpu_loop.c | 8 --------
 target/openrisc/cpu.c          | 2 +-
 target/openrisc/mmu.c          | 9 ---------
 target/openrisc/meson.build    | 2 +-
 5 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index 187a4a114e..ee069b080c 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -317,14 +317,15 @@ hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int openrisc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int openrisc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void openrisc_translate_init(void);
-bool openrisc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                           MMUAccessType access_type, int mmu_idx,
-                           bool probe, uintptr_t retaddr);
 int print_insn_or1k(bfd_vma addr, disassemble_info *info);
 
 #define cpu_list cpu_openrisc_list
 
 #ifndef CONFIG_USER_ONLY
+bool openrisc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                           MMUAccessType access_type, int mmu_idx,
+                           bool probe, uintptr_t retaddr);
+
 extern const VMStateDescription vmstate_openrisc_cpu;
 
 void openrisc_cpu_do_interrupt(CPUState *cpu);
diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.c
index 10b7147f68..3cfdbbf037 100644
--- a/linux-user/openrisc/cpu_loop.c
+++ b/linux-user/openrisc/cpu_loop.c
@@ -54,14 +54,6 @@ void cpu_loop(CPUOpenRISCState *env)
                 cpu_set_gpr(env, 11, ret);
             }
             break;
-        case EXCP_DPF:
-        case EXCP_IPF:
-            info.si_signo = TARGET_SIGSEGV;
-            info.si_errno = 0;
-            info.si_code = TARGET_SEGV_MAPERR;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case EXCP_ALIGN:
             info.si_signo = TARGET_SIGBUS;
             info.si_errno = 0;
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 27cb04152f..dfbafc5236 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -186,9 +186,9 @@ static const struct SysemuCPUOps openrisc_sysemu_ops = {
 
 static const struct TCGCPUOps openrisc_tcg_ops = {
     .initialize = openrisc_translate_init,
-    .tlb_fill = openrisc_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill = openrisc_cpu_tlb_fill,
     .cpu_exec_interrupt = openrisc_cpu_exec_interrupt,
     .do_interrupt = openrisc_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/openrisc/mmu.c b/target/openrisc/mmu.c
index 94df8c7bef..e561ef245b 100644
--- a/target/openrisc/mmu.c
+++ b/target/openrisc/mmu.c
@@ -23,11 +23,8 @@
 #include "exec/exec-all.h"
 #include "exec/gdbstub.h"
 #include "qemu/host-utils.h"
-#ifndef CONFIG_USER_ONLY
 #include "hw/loader.h"
-#endif
 
-#ifndef CONFIG_USER_ONLY
 static inline void get_phys_nommu(hwaddr *phys_addr, int *prot,
                                   target_ulong address)
 {
@@ -94,7 +91,6 @@ static int get_phys_mmu(OpenRISCCPU *cpu, hwaddr *phys_addr, int *prot,
         return need & PAGE_EXEC ? EXCP_ITLBMISS : EXCP_DTLBMISS;
     }
 }
-#endif
 
 static void raise_mmu_exception(OpenRISCCPU *cpu, target_ulong address,
                                 int exception)
@@ -112,8 +108,6 @@ bool openrisc_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
 {
     OpenRISCCPU *cpu = OPENRISC_CPU(cs);
     int excp = EXCP_DPF;
-
-#ifndef CONFIG_USER_ONLY
     int prot;
     hwaddr phys_addr;
 
@@ -138,13 +132,11 @@ bool openrisc_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
     if (probe) {
         return false;
     }
-#endif
 
     raise_mmu_exception(cpu, addr, excp);
     cpu_loop_exit_restore(cs, retaddr);
 }
 
-#ifndef CONFIG_USER_ONLY
 hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
 {
     OpenRISCCPU *cpu = OPENRISC_CPU(cs);
@@ -177,4 +169,3 @@ hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
         return phys_addr;
     }
 }
-#endif
diff --git a/target/openrisc/meson.build b/target/openrisc/meson.build
index e445dec4a0..84322086ec 100644
--- a/target/openrisc/meson.build
+++ b/target/openrisc/meson.build
@@ -10,7 +10,6 @@ openrisc_ss.add(files(
   'fpu_helper.c',
   'gdbstub.c',
   'interrupt_helper.c',
-  'mmu.c',
   'sys_helper.c',
   'translate.c',
 ))
@@ -19,6 +18,7 @@ openrisc_softmmu_ss = ss.source_set()
 openrisc_softmmu_ss.add(files(
   'interrupt.c',
   'machine.c',
+  'mmu.c',
 ))
 
 target_arch += {'openrisc': openrisc_ss}
-- 
2.25.1


