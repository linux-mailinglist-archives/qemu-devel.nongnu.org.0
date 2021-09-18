Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4064410849
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 21:07:52 +0200 (CEST)
Received: from localhost ([::1]:35246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfgl-0000Yk-SW
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 15:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLn-0005Lj-FH
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:11 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:35636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLb-0006x0-3j
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:11 -0400
Received: by mail-pf1-x431.google.com with SMTP id w14so1834208pfu.2
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b8i+4Ubm77XbfHdsRyJB5Dlng3rJ0jGxHde2wGc/RXc=;
 b=cFFXdP3kMGcgUkPMjkjvATamv+a9RM5y7Xk85Ul6//YBwxwZOzp+cmR9PMOWgxR+Z7
 nC5qz6Mqj9zZk6q20aeMIXbbShQ/Ovsb1JuGcvyDOsszNO2F5UvhqbDFbpVn7SsztP9A
 6b6Q1hF6guf7MH4fz4z8hqNjHxkSd1uIIcnTZnBF2cJcOBWHySiyjoAsdXoqqn88xCi8
 6fZqQmFE/42jBkviCuq9dlGH0npgRGOAnJZohDrfnidMEFfP8CaNJdeH4Vq0lhpo0x+P
 jx4Sz+T8wgVmUAZQ62lg8IcIeFZy1NFajZFw/xjOwtTLFw/6ZEQKEikmonHSkqIiE3ds
 quWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b8i+4Ubm77XbfHdsRyJB5Dlng3rJ0jGxHde2wGc/RXc=;
 b=mvxkuAsiK35hqZfFknJ55FyCwa9j9K/4mVarLJynGVPVDEIj82bFfXOstvXblTZWFW
 +LA1IOSegQe1oAJ+V1sK0QbUCdGO9u8XSQDbtYhU2KWbA035L+4nvpDBnqHJ6CMBqf+4
 ebMz8vIRPhSJYn8vSVlEk0UqaNpk1un4HykG4wk0f4A8GstkAt55pKeaEpNSYZXFuOmy
 edad33Fwyb3a2INgEXhS2XAOa9cVxmk9y4AVvldVFP27nrlrKQh7XizoMrYCVXTvyPFX
 4jlwAynOCsBoWezQxAYXWKhnmGf0vmlgjU3IOw2Y5s9AvhD8kcOs2USLQ41MlziagPLm
 w6Iw==
X-Gm-Message-State: AOAM5305/VRx0OOSesluJnDT0fiOXvGrExDkFLl9SZ77lChKJg26dCta
 g7/CDDC5nIU6AtcZRwugB5WsmuyLXqbLXQ==
X-Google-Smtp-Source: ABdhPJwAtAXRRNNqyU+DXfRevZ+PWgx4T5mxa/2u1YK2PVxL3JQTs9gJmRf42HMEYQxDSuy56G87Tw==
X-Received: by 2002:a62:7d45:0:b0:445:545b:4d0e with SMTP id
 y66-20020a627d45000000b00445545b4d0emr7615686pfc.1.1631990755883; 
 Sat, 18 Sep 2021 11:45:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:45:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 33/41] target/openrisc: Make openrisc_cpu_tlb_fill sysemu
 only
Date: Sat, 18 Sep 2021 11:45:19 -0700
Message-Id: <20210918184527.408540-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fallback code in raise_sigsegv is sufficient for openrisc.
This makes all of the code in mmu.c sysemu only, so remove
the ifdefs and move the file to openrisc_softmmu_ss.
Remove the code from cpu_loop that handled EXCP_DPF.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/cpu.h          | 7 ++++---
 linux-user/openrisc/cpu_loop.c | 8 --------
 target/openrisc/cpu.c          | 2 +-
 target/openrisc/mmu.c          | 8 --------
 target/openrisc/meson.build    | 2 +-
 5 files changed, 6 insertions(+), 21 deletions(-)

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
index 314e7fba1e..5e50c0d743 100644
--- a/linux-user/openrisc/cpu_loop.c
+++ b/linux-user/openrisc/cpu_loop.c
@@ -53,14 +53,6 @@ void cpu_loop(CPUOpenRISCState *env)
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
         case EXCP_RANGE:
         case EXCP_FPE:
             /* ??? The kernel vectors both of these to unhandled_exception. */
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 3c368a1bde..0092fc161d 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -188,10 +188,10 @@ static const struct SysemuCPUOps openrisc_sysemu_ops = {
 
 static const struct TCGCPUOps openrisc_tcg_ops = {
     .initialize = openrisc_translate_init,
-    .tlb_fill = openrisc_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
     .has_work = openrisc_cpu_has_work,
+    .tlb_fill = openrisc_cpu_tlb_fill,
     .cpu_exec_interrupt = openrisc_cpu_exec_interrupt,
     .do_interrupt = openrisc_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/openrisc/mmu.c b/target/openrisc/mmu.c
index 94df8c7bef..91cedf4125 100644
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
@@ -113,7 +109,6 @@ bool openrisc_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
     OpenRISCCPU *cpu = OPENRISC_CPU(cs);
     int excp = EXCP_DPF;
 
-#ifndef CONFIG_USER_ONLY
     int prot;
     hwaddr phys_addr;
 
@@ -138,13 +133,11 @@ bool openrisc_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
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
@@ -177,4 +170,3 @@ hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
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


