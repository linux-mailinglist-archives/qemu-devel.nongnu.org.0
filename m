Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BF84245AA
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 20:07:03 +0200 (CEST)
Received: from localhost ([::1]:51172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYBJm-0005IY-QM
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 14:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdn-0007Zb-2i
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:39 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:37698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdl-0008I4-6n
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:38 -0400
Received: by mail-pg1-x530.google.com with SMTP id r201so3102549pgr.4
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B4SaQQZmznpnKQ4FPXFeYarEGh4avP+2dHJ0pw3Dp+w=;
 b=xUnBhBL9rTQRLoWnCWtoKB2MQvcpNrbp4E6J8jkjm7A0XJd6j61S71RetNjfFAXgqK
 sfVb5s1xj0vXF+RjVhs5QQYT0DyLEVF6swxe3+T8EmNyH4p3n2f2aKdVoHI9od4hadB8
 kPAYDIFS7h57/IRpa3KXZZjT1CCYDNDQbsdAJW/ds25brkCtFuWeYLyuMb5dOaU2c5Yg
 Ro8DdIM8C0Xc6DQtLOLQwdfkX9+IpZL5EZDiy4yhmBKMKvv0o9IC2VNTr7VNHJpHHwfb
 aAvkrsYt7gJwOkfXJ7xztLZqT5OJn0zK3UO0334il95cFxuiUJDXAEBJR1C0B4Hyi+xM
 Q0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B4SaQQZmznpnKQ4FPXFeYarEGh4avP+2dHJ0pw3Dp+w=;
 b=fwCJHw/s12L01jcGBmsnOUEkQujzF+4mPGbyuOu6cfMonwrTCf3o3Stfx2lCR2aEK0
 5Jl/nFXY9+67dLOEPIOAYrWlt1kA05Azrsk4bmQ22JqfUsGILTQPsDrbncEQrEJ322r2
 RPbRFYAGf78XEqtzGmYY8K3Y28LrLa4viy19G57m0hrgxCJhKCEXyzho8FqUZgDK3tpa
 X+R0kZXw2KRkdkaeXcnv7S9ukk5VSD+W8NCiVsstJTNZoRyyOXhTVf8F2G9dxs+YQ6O9
 kxX6AsFiPhpW8t8SzqDx1U2JEIKRiNiur6xscTWIDYaKRjRnYGNnMOpQWN04gZ+876v1
 Ie3A==
X-Gm-Message-State: AOAM530wLYEo08OZzmXN7LGZ1dQQGaCyHlL4p211NQkavsnfHWk/i8wp
 eqEk/kdevMQ3udS8vroVryGGZngt5Kyryg==
X-Google-Smtp-Source: ABdhPJxbCX9K8qF5yjNfPMW32gdOnBBBwrdi3imfM/oVTSnPiu8mFYPB5vrb7zSjoR4NmQsdyp3v5Q==
X-Received: by 2002:aa7:82d0:0:b0:413:5e93:2f7a with SMTP id
 f16-20020aa782d0000000b004135e932f7amr37081208pfn.16.1633541015849; 
 Wed, 06 Oct 2021 10:23:35 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w7sm21606929pfj.189.2021.10.06.10.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:23:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 33/41] target/openrisc: Make openrisc_cpu_tlb_fill sysemu
 only
Date: Wed,  6 Oct 2021 10:22:59 -0700
Message-Id: <20211006172307.780893-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
index de5417a262..fb37fb7651 100644
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
         case EXCP_RANGE:
         case EXCP_FPE:
             /* ??? The kernel vectors both of these to unhandled_exception. */
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


