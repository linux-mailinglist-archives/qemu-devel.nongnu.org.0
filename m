Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C93DE440ABF
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:51:04 +0200 (CEST)
Received: from localhost ([::1]:42134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsVT-0001Q4-SH
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryg-0002Hv-E2
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:17:10 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:45793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgrye-0000Cp-CO
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:17:10 -0400
Received: by mail-pg1-x533.google.com with SMTP id f5so12974662pgc.12
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pnbVDz2F7bl2MnMZvXAf7/LYYOvOlpdsDMsaNKSumSw=;
 b=cA6sp4tlc2EsLFWa9Yb7uYpXg0ZUzXgMalSCD/Ip8R0I91eTjvan41jDcSVK5pqtRI
 WDWYPtUJqnLC873edgyw9tSKK5C2b8oRKm+A3MR6/j8Xds9m+zJoHnnJZOr1CHl7rk3T
 wLFvCrv2l4LKgZipfijavv9R9U+7nTy6kzCpTBCarw9mWsMinJB453pN0pilWe+FA7ds
 kpwtHAjxqqEHIR2/P6etKqrMKXc3nCHDoD7LkLyUCTE0z6YiYLIZ7UBiPUFc2DXI9cxA
 6dz2IdRI6Ko/iVNIWTtbAhWzg+CJkz63z3p/ECeICbIaWgoW6+udtCZKOm6VUWtBYmRP
 Ozgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pnbVDz2F7bl2MnMZvXAf7/LYYOvOlpdsDMsaNKSumSw=;
 b=7LdUdhrOalvTMBIlK8o3RNL3TPSbppoPrnjFDQ9SzB+qoju9zmBmYewDumsqHbghu2
 vrKbRAizGI3jxcNXXpExiyg8H7jsK4PMcOigJT4ivGzUZD6UYN1QJjO6vsM8DDGY85bR
 nMGckUJG53tXcVq5an5FvDi9Pe3lIINgqVaGbgtDsJ6xUUPjSL2wAvW7QBg35mNCb1h5
 +wGyBK0AXooHVt7XwvWu8ETW5zdAM4iHYq7K+KFdT5u6HjP9YODqKr0v/a3xVzp1wSqS
 GkWFFC7fBKmpVqHowMW/HtGci/2gRE8gJWvowgB4WTZ6iOY802LS+gmpgW14u5Hiotbl
 6uNw==
X-Gm-Message-State: AOAM5333prWlj0DOLFhvh+eUs0vEzyQNTjw7m9FBvLqchG2dX+UGAAoS
 RmGvF2TsZBSqEsA0KFLpa/Kp0u7kbuC/pQ==
X-Google-Smtp-Source: ABdhPJzo0a+fNfojpafmmkpgkkOzdx1tOmReVGk632ReSqse9nQgq0DRNBHgMne68xpCMb2hwLJd7w==
X-Received: by 2002:a62:e514:0:b0:47c:12f6:3aae with SMTP id
 n20-20020a62e514000000b0047c12f63aaemr18607429pff.26.1635614227198; 
 Sat, 30 Oct 2021 10:17:07 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nv4sm3111943pjb.17.2021.10.30.10.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:17:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 33/66] target/openrisc: Make openrisc_cpu_tlb_fill sysemu
 only
Date: Sat, 30 Oct 2021 10:16:02 -0700
Message-Id: <20211030171635.1689530-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
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


