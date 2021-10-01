Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E7C41F375
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:44:28 +0200 (CEST)
Received: from localhost ([::1]:38146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMaB-0004pC-0i
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM5E-0005C8-1H
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:29 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:34808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM5A-0005If-CK
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:27 -0400
Received: by mail-qt1-x835.google.com with SMTP id m26so9646193qtn.1
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h+WX/Xz3j7uTzh8f9NwZfFO9w7icTNNLSs9RiVXjf3k=;
 b=mCrnYTJnJbIbGzuxs5qDnO0t4J7n5Fu+Qhpm2DHKICihgqmI6wflxWRy8RtkQg40eY
 E5ZC8hEIUbbTCfnCh3aujUhfw5Vgf9gBybenKAwTc2H2C3Nm2FpodLkkPme+C/55yPUF
 PmIwSX0OI6w2W5H58XRYRnQ/sixHb28XQnAd2NgX0Bm+yf0AC3yLmjpMN3dl9R23NHom
 u28E+AGfGnJFeJsOYOuLnLDV3YTk1ZImviLjptMKDoJF2+RJfCSFA/WCAU6wK3armwYU
 WLa7tAQf+RZAJqH+DNOTAizAyV9NPhYQqn42Ap1usXn+c66PZDNkgB6cjzqZU8gHogAs
 hwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h+WX/Xz3j7uTzh8f9NwZfFO9w7icTNNLSs9RiVXjf3k=;
 b=tQlTs4Lv1O3eiRf7pUHizf3h/Z8Gk2qt8BS4pti9C4qfHRwA87xSbvSsDP+XJVJ4fL
 /5Bgy4eiXwL595k2f0pQVLGLQyp0i/UmEEpoRe3UUY20GDEF2F3se1nvOXMCsmA48eO8
 gBOSd04Wq6GCSn4TNTE9JR71n38Hx58SuwStDW26f3bC5pd5nBnOQuygmKUzFTSNhsYQ
 yPvKnXN0sMzTqnVKJ/ckJeUVTsZs5IQMCinbI9EySj+3An0rAgx35ng2Km1tp5yhoTns
 4S2FQ3FnMcWNLbBivHdkhtCI+MM8R+l0/DuuFjlg+1htuNXgkQ9yPqbvEVg8z9Pa5jp8
 Yz+A==
X-Gm-Message-State: AOAM532/W/1e2lqgk/O/rc9Uhfa8YCSyGX9viIaXPGQWMT12LEyYyZsk
 FuiIoT7zS0Zca5wtT+ya0xVqOt6wLcUobA==
X-Google-Smtp-Source: ABdhPJwKGjTuE5TNy6NU/FlFmn+Y5yF2ow3hn/mbcHu0tpmo8gB+BLk+kVvRk04vlmR4A3/R6wgagw==
X-Received: by 2002:ac8:7143:: with SMTP id h3mr14627375qtp.242.1633108343053; 
 Fri, 01 Oct 2021 10:12:23 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id y15sm3557250qko.78.2021.10.01.10.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:12:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 34/41] target/ppc: Implement ppc_cpu_record_sigsegv
Date: Fri,  1 Oct 2021 13:11:44 -0400
Message-Id: <20211001171151.1739472-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001171151.1739472-1-richard.henderson@linaro.org>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: qemu-ppc@nongnu.org, alex.bennee@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Record DAR, DSISR, and exception_index.  That last means
that we must exit to cpu_loop ourselves, instead of letting
exception_index being overwritten.

This is exactly what the user-mode ppc_cpu_tlb_fill does,
so simply rename it as ppc_cpu_record_sigsegv.

Cc: qemu-ppc@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h              |  3 ---
 target/ppc/internal.h         |  9 +++++++++
 target/ppc/cpu_init.c         |  6 ++++--
 target/ppc/user_only_helper.c | 15 +++++++++++----
 4 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 01d3773bc7..60d1117845 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1278,9 +1278,6 @@ extern const VMStateDescription vmstate_ppc_cpu;
 
 /*****************************************************************************/
 void ppc_translate_init(void);
-bool ppc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                      MMUAccessType access_type, int mmu_idx,
-                      bool probe, uintptr_t retaddr);
 
 #if !defined(CONFIG_USER_ONLY)
 void ppc_store_sdr1(CPUPPCState *env, target_ulong value);
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 55284369f5..339974b7d8 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -283,5 +283,14 @@ static inline void pte_invalidate(target_ulong *pte0)
 #define PTE_PTEM_MASK 0x7FFFFFBF
 #define PTE_CHECK_MASK (TARGET_PAGE_MASK | 0x7B)
 
+#ifdef CONFIG_USER_ONLY
+void ppc_cpu_record_sigsegv(CPUState *cs, vaddr addr,
+                            MMUAccessType access_type,
+                            bool maperr, uintptr_t ra);
+#else
+bool ppc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                      MMUAccessType access_type, int mmu_idx,
+                      bool probe, uintptr_t retaddr);
+#endif
 
 #endif /* PPC_INTERNAL_H */
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 6aad01d1d3..ec8da08f0b 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -9014,9 +9014,11 @@ static const struct SysemuCPUOps ppc_sysemu_ops = {
 
 static const struct TCGCPUOps ppc_tcg_ops = {
   .initialize = ppc_translate_init,
-  .tlb_fill = ppc_cpu_tlb_fill,
 
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_USER_ONLY
+  .record_sigsegv = ppc_cpu_record_sigsegv,
+#else
+  .tlb_fill = ppc_cpu_tlb_fill,
   .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
   .do_interrupt = ppc_cpu_do_interrupt,
   .cpu_exec_enter = ppc_cpu_exec_enter,
diff --git a/target/ppc/user_only_helper.c b/target/ppc/user_only_helper.c
index aa3f867596..7ff76f7a06 100644
--- a/target/ppc/user_only_helper.c
+++ b/target/ppc/user_only_helper.c
@@ -21,16 +21,23 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "internal.h"
 
-
-bool ppc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                      MMUAccessType access_type, int mmu_idx,
-                      bool probe, uintptr_t retaddr)
+void ppc_cpu_record_sigsegv(CPUState *cs, vaddr address,
+                            MMUAccessType access_type,
+                            bool maperr, uintptr_t retaddr)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
     int exception, error_code;
 
+    /*
+     * Both DSISR and the "trap number" (exception vector offset,
+     * looked up from exception_index) are present in the linux-user
+     * signal frame.
+     * FIXME: we don't actually populate the trap number properly.
+     * It would be easiest to fill in an env->trap value now.
+     */
     if (access_type == MMU_INST_FETCH) {
         exception = POWERPC_EXCP_ISI;
         error_code = 0x40000000;
-- 
2.25.1


