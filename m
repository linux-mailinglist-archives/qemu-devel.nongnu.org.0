Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFE341F15F
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 17:39:29 +0200 (CEST)
Received: from localhost ([::1]:48056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWKdF-0006xX-1g
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 11:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWKXs-0006K5-Tz
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:33:56 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:35470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWKXq-0007fk-EQ
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:33:56 -0400
Received: by mail-qt1-x835.google.com with SMTP id c20so9317340qtb.2
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 08:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dtDTFH5wVX1LPjRcgOE5Bj/g+8fIpGjADqZ8damTkkI=;
 b=OzdwVhFxwg2zU8n6+Ktibox3tWoG7J0qUEki2yK7HzX545e3TpjMW+w9icuhvPwoEp
 XZIDp+bIFGFAXUpkUhpTIJ2jSf/E+Z9Z1LRrqw6Z4jS/We2EiLDe0sEa7ovTJLTbKbZH
 Oc/X+YjMlrSU39oJOoV6mn4f8C+EFyMRXR4bk/WxLehlF7n6u4Fptn2JJRVTgV2t5GkC
 AJyCrjkwM+zysZj+8op8IYHy1bzX2+sittMvqu2QyO0bz0V19GA8ZLkMz16FTmFW2aON
 bSxoiF5xq/50QbnVSCjKhiyLxuXKzls7QgxIG2tu7BME8ubI9RhE4cUp23NV4iWJZOM4
 r7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dtDTFH5wVX1LPjRcgOE5Bj/g+8fIpGjADqZ8damTkkI=;
 b=ad6FRhl2FlJIkxqhmPCrhHLzEu0wGW9VP1RZJ4bwEYohAAQdGb0L8Pe5Gljmw3TNXz
 WObX+b2B88vnjLpDaq4ec+Xc4/iTD6RGvl94fNx2+pNdJJ0arhxhU7So4IBuzQIum/Qb
 AUu0HYIQE6+1V9lsB8omezIDBPBfmvOt7DKSV5ipw9AkId1wI9NunQLqI0Bjv6Bhu+Y1
 ENoEbXKrF/e72nU05eOX3zlPfQ9hBbx0VjODQDzS4RMao0RCK6X6aDIS0Z9sOmXsJzgF
 j9ynoJTmtWV3Wly4Y9LvRE2Epzggr6+lQdHCCHJ9RVsB5zn6z6CTAMVBneY6x1GXCwDc
 gENg==
X-Gm-Message-State: AOAM531ZiBwOgg/1jusgyYSaWEjGx4SV8hkSQsoLE66mTPchd9MyRKLa
 zuMwTIUQQrcnMlUBpCMo4YAoMflsBSFq+A==
X-Google-Smtp-Source: ABdhPJws/npuYfnAT6AC1Qng6Jn4EoSddb8tdXsapFVHqFfHXptggUUKVphJSW8edVB5kv0EjKhvnQ==
X-Received: by 2002:a05:622a:1d4:: with SMTP id
 t20mr13338893qtw.144.1633102432373; 
 Fri, 01 Oct 2021 08:33:52 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id x8sm3484823qtv.5.2021.10.01.08.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 08:33:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/9] linux-user/nios2: Properly emulate EXCP_TRAP
Date: Fri,  1 Oct 2021 11:33:39 -0400
Message-Id: <20211001153347.1736014-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001153347.1736014-1-richard.henderson@linaro.org>
References: <20211001153347.1736014-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
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
Cc: marex@denx.de, crwulff@gmail.com, alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The real kernel has to load the instruction and extract
the imm5 field; for qemu, modify the translator to do this.

The use of R_AT for this in cpu_loop was a bug.  Handle
the other trap numbers as per the kernel's trap_table.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h          |  2 +-
 linux-user/nios2/cpu_loop.c | 40 ++++++++++++++++++++-----------------
 target/nios2/translate.c    | 17 +++++++++++++++-
 3 files changed, 39 insertions(+), 20 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index a80587338a..f8c9d11f2f 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -160,9 +160,9 @@ struct CPUNios2State {
 
 #if !defined(CONFIG_USER_ONLY)
     Nios2MMU mmu;
-
     uint32_t irq_pending;
 #endif
+    int error_code;
 };
 
 /**
diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 34290fb3b5..5c3d01d22d 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -26,7 +26,6 @@
 void cpu_loop(CPUNios2State *env)
 {
     CPUState *cs = env_cpu(env);
-    Nios2CPU *cpu = NIOS2_CPU(cs);
     target_siginfo_t info;
     int trapnr, ret;
 
@@ -39,9 +38,10 @@ void cpu_loop(CPUNios2State *env)
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
             break;
+
         case EXCP_TRAP:
-            if (env->regs[R_AT] == 0) {
-                abi_long ret;
+            switch (env->error_code) {
+            case 0:
                 qemu_log_mask(CPU_LOG_INT, "\nSyscall\n");
 
                 ret = do_syscall(env, env->regs[2],
@@ -55,26 +55,30 @@ void cpu_loop(CPUNios2State *env)
 
                 env->regs[2] = abs(ret);
                 /* Return value is 0..4096 */
-                env->regs[7] = (ret > 0xfffffffffffff000ULL);
-                env->regs[CR_ESTATUS] = env->regs[CR_STATUS];
-                env->regs[CR_STATUS] &= ~0x3;
-                env->regs[R_EA] = env->regs[R_PC] + 4;
+                env->regs[7] = ret > 0xfffff000u;
                 env->regs[R_PC] += 4;
                 break;
-            } else {
-                qemu_log_mask(CPU_LOG_INT, "\nTrap\n");
 
-                env->regs[CR_ESTATUS] = env->regs[CR_STATUS];
-                env->regs[CR_STATUS] &= ~0x3;
-                env->regs[R_EA] = env->regs[R_PC] + 4;
-                env->regs[R_PC] = cpu->exception_addr;
-
-                info.si_signo = TARGET_SIGTRAP;
-                info.si_errno = 0;
-                info.si_code = TARGET_TRAP_BRKPT;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            case 1:
+                qemu_log_mask(CPU_LOG_INT, "\nTrap 1\n");
+                force_sig_fault(TARGET_SIGUSR1, 0, env->regs[R_PC]);
+                break;
+            case 2:
+                qemu_log_mask(CPU_LOG_INT, "\nTrap 2\n");
+                force_sig_fault(TARGET_SIGUSR2, 0, env->regs[R_PC]);
+                break;
+            case 31:
+                qemu_log_mask(CPU_LOG_INT, "\nTrap 31\n");
+                force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->regs[R_PC]);
+                break;
+            default:
+                qemu_log_mask(CPU_LOG_INT, "\nTrap %d\n", env->error_code);
+                force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLTRP,
+                                env->regs[R_PC]);
                 break;
             }
+            break;
+
         case EXCP_DEBUG:
             info.si_signo = TARGET_SIGTRAP;
             info.si_errno = 0;
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 08d7ac5398..a759877519 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -636,6 +636,21 @@ static void divu(DisasContext *dc, uint32_t code, uint32_t flags)
     tcg_temp_free(t0);
 }
 
+static void trap(DisasContext *dc, uint32_t code, uint32_t flags)
+{
+#ifdef CONFIG_USER_ONLY
+    /*
+     * The imm5 field is not stored anywhere on real hw; the kernel
+     * has to load the insn and extract the field.  But we can make
+     * things easier for cpu_loop if we pop this into env->error_code.
+     */
+    R_TYPE(instr, code);
+    tcg_gen_st_i32(tcg_constant_i32(instr.imm5), cpu_env,
+                   offsetof(CPUNios2State, error_code));
+#endif
+    t_gen_helper_raise_exception(dc, EXCP_TRAP);
+}
+
 static const Nios2Instruction r_type_instructions[] = {
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION(eret),                                /* eret */
@@ -682,7 +697,7 @@ static const Nios2Instruction r_type_instructions[] = {
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION_ILLEGAL(),
-    INSTRUCTION_FLG(gen_excp, EXCP_TRAP),             /* trap */
+    INSTRUCTION(trap),                                /* trap */
     INSTRUCTION(wrctl),                               /* wrctl */
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION_FLG(gen_cmpxx, TCG_COND_LTU),         /* cmpltu */
-- 
2.25.1


