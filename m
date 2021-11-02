Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D065442C8A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:29:40 +0100 (CET)
Received: from localhost ([::1]:47546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrz1-0001nq-Cs
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhreJ-00042X-AH
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:15 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:39456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhreE-0000y3-75
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:15 -0400
Received: by mail-qt1-x831.google.com with SMTP id t40so18450787qtc.6
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bSOPptd8n2vyIHjygFEkKtsmxu32Sh4/nm0zdx+yC2M=;
 b=RWo6+dIKiAHeUzMx9quxbneqCPTS+sysEAb+8hRvjhWDjl3SnRAxDMLHvHmJTjVyH2
 sZ9AuFAiXdDnRgkK3Vl6efh7oRDtjkRhljNSGCNZSUI3hIwXrrfD0m0fEjgduY8RP3a+
 PGkw8WaliK21DZfJgWY7o1eFx01Usk4QjPEEH12xk+dHPJU14/64n3BVFBzDQNMUzNR/
 91rnUmcT6rgmAm93g9BT8plvctbuXQmqj5h7OjEe+ZpdgaEZtbPfc8NCfBz4Wm3L2IPw
 vcryYrLbYGTVyD1v2ed7NKoGJ6q+ndUZtrAiGyobwu0g3nXyO3AMeMfPpznU2cn6f4Ww
 QyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bSOPptd8n2vyIHjygFEkKtsmxu32Sh4/nm0zdx+yC2M=;
 b=k4Nkgax3UJWfIglg/FUFBVMBRLphKbCwJdfFx3/cO6FiRm2vkQldSO+k09ziNFQphH
 5UZQMVWTMIMYYW9hi63S4TUwktrrbtfRRFbRYtS15hDf/gAv06jSl3movr8OG1CknjNl
 41EzCQGkfIQawJ+CAvNrRtPZUWB2fAp+NOaUBspVCoT6tv85WoalhFesnJYRh2puWZs+
 OumNIX51dKmAhmIcpNTx//hy+QyM+tzLu72+6Y6KUE9iwK4e6lZjs9FWHBT85zKz3MtU
 1D+TLRu4Yb0iFf+50+mhtmvZuyS85TVxKt5adIe8oB6MyfWPTooue32THyAkDliPggkm
 /tLQ==
X-Gm-Message-State: AOAM532U5mKZORoIYxO8DTx/W7xNhN1ctXM/Xdjis+XCdyW2ykXy1bUS
 Bp55mzphZEgnj8g8c6J73FzGeyv/8htPWw==
X-Google-Smtp-Source: ABdhPJzmebVTRcAfLGJ2G1aC7ACa2m+1qAYfy+FYgTnRXas0dgBXk/j8joQQn/XpZFkInM47/vVKbw==
X-Received: by 2002:ac8:5a4b:: with SMTP id o11mr38090678qta.59.1635851283926; 
 Tue, 02 Nov 2021 04:08:03 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm7sm3568612qkb.86.2021.11.02.04.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:08:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 38/60] target/sh4: Make sh4_cpu_tlb_fill sysemu only
Date: Tue,  2 Nov 2021 07:07:18 -0400
Message-Id: <20211102110740.215699-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
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

The fallback code in cpu_loop_exit_sigsegv is sufficient
for sh4 linux-user.

Remove the code from cpu_loop that raised SIGSEGV.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


