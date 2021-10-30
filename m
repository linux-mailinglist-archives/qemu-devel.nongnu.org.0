Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA23440ADA
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:01:01 +0200 (CEST)
Received: from localhost ([::1]:48200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsf6-0007oJ-PN
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:01:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryl-0002Lm-0X
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:17:15 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:45926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryi-0000EP-Bm
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:17:14 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so9585298pjb.4
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8ZM/9TjmIZZ72copbPvsL/6T35TidGs+EyZyHS5h5dE=;
 b=F1qcW3PTTHPZ4hGJbfU0qm8QqjflT9PZ2e72sU6WAiEE2n+niTdxa3e/YyPbRjdhPq
 FHJ0up9Kl73Gauh3Gt+PR2oI6P0B1ZDYFJD1csxnriKubBa4bARmIcnj5CKqoItz8oc8
 tyUoxKwNeIrKmmopC6tRAT5fkFAPS4FhV8KA5dC2IfNWrH7LCSo+4lYwciPS6anloMGF
 Ufp7VxNsYF4tx/72Di0k7VBkE96QE/PU7s5D+rdqvmslj+Jy9ZR4LcKH0vIerLYUl/1z
 NbO3lQ0RrY8p0hGFk+tAvKlvXc2DmjIAD/SEbaeKveckKUfAW6psf9dhC/G8V+FeZtxK
 LKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8ZM/9TjmIZZ72copbPvsL/6T35TidGs+EyZyHS5h5dE=;
 b=moH8hxv/v/LbCnPjZcFy5avm4yN00vxDARPzaWCyd4ZpbsZ3nCHzfsWUdLHKO5LiZi
 CO6zK9BfZNHDmNymx6K9Hm9UVWBtvmsxlQJvFE5vlXaru9m5mCTl2Vje4naNlIEf+g4Z
 JS3fFeNVxF2+YZ53rkXV/lFf1B+YhQoa0pROJDzXSuJoy0y41Hy8V4mwCNP5uZgQfmkf
 Tcquxyb2UZRJotkOiXukopDLrhdl5iYX6GxBWXeSzv1zfE4n/DOCIGH+a5K74Y5VBrky
 n7mFicjgPGyi/4p9fo7CFxV//mo6I1kQm1sCb43us932TlkcDsOcZteaopxn7yvvKcjs
 EPuw==
X-Gm-Message-State: AOAM532zhIUIIrWA5kGWsm5gCYXUQqSnAn92uPJwHPHcfcSmCK7MWUAw
 UW/iFZfOUJrcWlXqWKMrlCyVnmWQYnUErA==
X-Google-Smtp-Source: ABdhPJzqECkDRzuy37oJQ0G8MIm3z7eo9MATvpp1+Q+Yqp+UCQQSIiSCmfAxclJLlDhiViXCIfHA3w==
X-Received: by 2002:a17:90a:718b:: with SMTP id
 i11mr27866736pjk.22.1635614231133; 
 Sat, 30 Oct 2021 10:17:11 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nv4sm3111943pjb.17.2021.10.30.10.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:17:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 38/66] target/sh4: Make sh4_cpu_tlb_fill sysemu only
Date: Sat, 30 Oct 2021 10:16:07 -0700
Message-Id: <20211030171635.1689530-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
for sh4 linux-user.

Remove the code from cpu_loop that raised SIGSEGV.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/cpu.h          | 6 +++---
 linux-user/sh4/cpu_loop.c | 8 --------
 target/sh4/cpu.c          | 2 +-
 target/sh4/helper.c       | 9 +--------
 4 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index dc81406646..4cfb109f56 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -213,12 +213,12 @@ void superh_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
                                     uintptr_t retaddr) QEMU_NORETURN;
 
 void sh4_translate_init(void);
+void sh4_cpu_list(void);
+
+#if !defined(CONFIG_USER_ONLY)
 bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          MMUAccessType access_type, int mmu_idx,
                          bool probe, uintptr_t retaddr);
-
-void sh4_cpu_list(void);
-#if !defined(CONFIG_USER_ONLY)
 void superh_cpu_do_interrupt(CPUState *cpu);
 bool superh_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void cpu_sh4_invalidate_tlb(CPUSH4State *s);
diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
index 65b8972e3c..ac9b01840c 100644
--- a/linux-user/sh4/cpu_loop.c
+++ b/linux-user/sh4/cpu_loop.c
@@ -65,14 +65,6 @@ void cpu_loop(CPUSH4State *env)
             info.si_code = TARGET_TRAP_BRKPT;
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
-        case 0xa0:
-        case 0xc0:
-            info.si_signo = TARGET_SIGSEGV;
-            info.si_errno = 0;
-            info.si_code = TARGET_SEGV_MAPERR;
-            info._sifields._sigfault._addr = env->tea;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
             arch_interrupt = false;
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 2047742d03..06b2691dc4 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -236,9 +236,9 @@ static const struct SysemuCPUOps sh4_sysemu_ops = {
 static const struct TCGCPUOps superh_tcg_ops = {
     .initialize = sh4_translate_init,
     .synchronize_from_tb = superh_cpu_synchronize_from_tb,
-    .tlb_fill = superh_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill = superh_cpu_tlb_fill,
     .cpu_exec_interrupt = superh_cpu_exec_interrupt,
     .do_interrupt = superh_cpu_do_interrupt,
     .do_unaligned_access = superh_cpu_do_unaligned_access,
diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index 53cb9c3b63..6a620e36fc 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -796,8 +796,6 @@ bool superh_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return false;
 }
 
-#endif /* !CONFIG_USER_ONLY */
-
 bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          MMUAccessType access_type, int mmu_idx,
                          bool probe, uintptr_t retaddr)
@@ -806,11 +804,6 @@ bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     CPUSH4State *env = &cpu->env;
     int ret;
 
-#ifdef CONFIG_USER_ONLY
-    ret = (access_type == MMU_DATA_STORE ? MMU_DTLB_VIOLATION_WRITE :
-           access_type == MMU_INST_FETCH ? MMU_ITLB_VIOLATION :
-           MMU_DTLB_VIOLATION_READ);
-#else
     target_ulong physical;
     int prot;
 
@@ -829,7 +822,6 @@ bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     if (ret != MMU_DTLB_MULTIPLE && ret != MMU_ITLB_MULTIPLE) {
         env->pteh = (env->pteh & PTEH_ASID_MASK) | (address & PTEH_VPN_MASK);
     }
-#endif
 
     env->tea = address;
     switch (ret) {
@@ -868,3 +860,4 @@ bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     }
     cpu_loop_exit_restore(cs, retaddr);
 }
+#endif /* !CONFIG_USER_ONLY */
-- 
2.25.1


