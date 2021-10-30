Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15376440AF5
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:22:16 +0200 (CEST)
Received: from localhost ([::1]:60878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgszf-0002g8-5i
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryc-0002Gz-Jz
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:17:08 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:35426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgrya-0000Bm-5G
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:17:06 -0400
Received: by mail-pl1-x62c.google.com with SMTP id n18so8929469plc.2
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/utnMsLyouv7LilvnHYZPxrZ8zRoC/jZ7xS1qGJE894=;
 b=eD/yScecEPUyvblU1mUFzn3VOT6P33rWW6WhmLY13UXFiIdqs0oj8LxFpEfTQgpam5
 p9NEV7sNLM58QjFyrY6dFfNUzFtPfGrFooVVR6h8ynSEnN2TrEqs4iywD93C3ZFBHEQB
 Rf2NvHGxUj8h/w7+5qrbtw+b4jmyNCtDyZVTrQMKmguF3nALqv8yAJtulrbsAHiO60UL
 8H/THup/qXxEs+YsANz2642CN15Ckf7pLJnyH5B1swekLQBxDkxBkOdmZZX15MeAf1Fk
 QB87TFBe5rLDUxwEK7qco7H/EqV3ZawlSSLYa4/1jVJDrBOinyvuWdVbNeKHYj6HukUm
 MdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/utnMsLyouv7LilvnHYZPxrZ8zRoC/jZ7xS1qGJE894=;
 b=zuZoaF/jK0Tmzk301hzCMdaQS0IU3erIKY6KmJke+GpKjGgW0N9gnOrWaVZBkP2Vm5
 PVrSd0lSvBHUd3agRbD7S3ukVQTthlQWNlaNBTF/42R44vBANolWZH74hDJB5eAeQht6
 HwNfy6anr5R+ISsJv8ZGnaq46Yf78XjUx+d1NVqsC+961b7Z1vKA3PaN8362ssis4PuB
 mOsXO4uv0DfymsFbI7pga+uPWvGPqI7etIfSeUWzYgI4iSfVfoayz75676C6U19M7jXI
 DLIdsGOXvwfOPN1CaMdoWR4Dq6k5fhL7eBv/fgsxmZVlRO6DPLO2PaUSvqyDaB8gFePC
 to6w==
X-Gm-Message-State: AOAM5331CIe4Xj3G/RMAafKVCGIOoQ0ElUtvBsSw8JpLtwQIWsEcHp17
 MM6PU2NVwt189aAHvYILa7lRHjxUrCpbEQ==
X-Google-Smtp-Source: ABdhPJxySpXd0tT9JPf9cf56+jEirTp/hjpIaY/t7SbNNdzEa6EOPlX4Yj/+Rge+QVlumNXrtZAyOw==
X-Received: by 2002:a17:902:c409:b0:140:5a3c:8e99 with SMTP id
 k9-20020a170902c40900b001405a3c8e99mr15987051plk.37.1635614222893; 
 Sat, 30 Oct 2021 10:17:02 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nv4sm3111943pjb.17.2021.10.30.10.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:17:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 28/66] target/m68k: Make m68k_cpu_tlb_fill sysemu only
Date: Sat, 30 Oct 2021 10:15:57 -0700
Message-Id: <20211030171635.1689530-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

The fallback code in cpu_loop_exit_sigsegv is sufficient
for m68k linux-user.

Remove the code from cpu_loop that handled EXCP_ACCESS.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/m68k/cpu_loop.c | 10 ----------
 target/m68k/cpu.c          |  2 +-
 target/m68k/helper.c       |  6 +-----
 3 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index ebf32be78f..790bd558c3 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -90,16 +90,6 @@ void cpu_loop(CPUM68KState *env)
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
             break;
-        case EXCP_ACCESS:
-            {
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                /* XXX: check env->error_code */
-                info.si_code = TARGET_SEGV_MAPERR;
-                info._sifields._sigfault._addr = env->mmu.ar;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            }
-            break;
         case EXCP_DEBUG:
             info.si_signo = TARGET_SIGTRAP;
             info.si_errno = 0;
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 66d22d1189..c7aeb7da9c 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -515,9 +515,9 @@ static const struct SysemuCPUOps m68k_sysemu_ops = {
 
 static const struct TCGCPUOps m68k_tcg_ops = {
     .initialize = m68k_tcg_init,
-    .tlb_fill = m68k_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill = m68k_cpu_tlb_fill,
     .cpu_exec_interrupt = m68k_cpu_exec_interrupt,
     .do_interrupt = m68k_cpu_do_interrupt,
     .do_transaction_failed = m68k_cpu_transaction_failed,
diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 137a3e1a3d..5728e48585 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -978,16 +978,12 @@ void m68k_set_irq_level(M68kCPU *cpu, int level, uint8_t vector)
     }
 }
 
-#endif
-
 bool m68k_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType qemu_access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr)
 {
     M68kCPU *cpu = M68K_CPU(cs);
     CPUM68KState *env = &cpu->env;
-
-#ifndef CONFIG_USER_ONLY
     hwaddr physical;
     int prot;
     int access_type;
@@ -1051,12 +1047,12 @@ bool m68k_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     if (!(access_type & ACCESS_STORE)) {
         env->mmu.ssw |= M68K_RW_040;
     }
-#endif
 
     cs->exception_index = EXCP_ACCESS;
     env->mmu.ar = address;
     cpu_loop_exit_restore(cs, retaddr);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 uint32_t HELPER(bitrev)(uint32_t x)
 {
-- 
2.25.1


