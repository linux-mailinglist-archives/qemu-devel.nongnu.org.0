Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E49441FC6
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:03:41 +0100 (CET)
Received: from localhost ([::1]:54268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhben-0001KS-3E
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb6G-0003v7-Ca
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:28:05 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:43689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb69-0000g0-Ia
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:59 -0400
Received: by mail-qk1-x72b.google.com with SMTP id bp7so11992320qkb.10
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ij1YRgU0peRo+QSVg6ezzkIr6IGfKaWXUXRkApukMz0=;
 b=y5unP1G8umjeK+1689CXhRdpgKbaKFALVpn61wwJSDW7hXhnZFi5ChtcXLqs5XauQJ
 NOHBXd6Z7LSu7gUpWUJEU2o4TeSbz3Szh8B6cEXdN882tM8PYqhtPcQgPctlqMx5REjB
 bwaHEgldNG/rM1K2EeFO0j4yBpO0uE8vxH9gUo06d3QqEcLxzb8CmLg3obPOfptGYFRL
 G9yEXI3OFLH9UdjgylLMPz5D7xiaOO32gO/hipGa6NLqgy+JuY76rw65ejbg/EskhDOx
 wtTPVY6Ahr0Kv/e8XUxAhdA67EX04X/SyIRTLUmwgjGe7VePmvzy4ex95VjB+pbXd026
 P0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ij1YRgU0peRo+QSVg6ezzkIr6IGfKaWXUXRkApukMz0=;
 b=1j7bBz1HLfg0QZQio9UgfWxU3R+C3W1xmE73AMBJO/qcfaTlOnpF7WFW2f5c4KF+gn
 lTV5cDymRGCY58p0raotE8bOlIOZ9TluN+zEfMgloI5SzEUqua5es2JD2NQU8xlKur7q
 su9gc9L9L2X4si7WSteAxjOYUenLZOdDXjQFXtUTAPXuTDkSJCh8ypa7Fove5+wlLTBR
 ROAFAZKOcr69/l+ATYhUjpV/RbKsKyNWgsZ2OVKW5mDhP+ejjxwcq3cgoU+KnyX877S3
 oz16PMVRfryMQa7kZzdZjHEvWoX8vqY7dn8Rco2hVnjlABJuj3HEYleME6UupCTqbImz
 EVgg==
X-Gm-Message-State: AOAM532vo8z/eOxhd+bAQ+bIHn3WVxsliC1+65ewa3hIB7rZ5BLmeggZ
 zP5dw3TnoiNjZfoJHdrxQB27Gog8nJsXNQ==
X-Google-Smtp-Source: ABdhPJzvXpzzd/xb8t6ScNWdMEFRVMiEnABRiUv3p+WpLFjjwsjNVlo6ReEfyU2pmihFbZHN3orJZA==
X-Received: by 2002:a37:a105:: with SMTP id k5mr23641085qke.427.1635787672533; 
 Mon, 01 Nov 2021 10:27:52 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id t5sm6075331qkf.34.2021.11.01.10.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:27:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 37/60] target/s390x: Implement s390_cpu_record_sigsegv
Date: Mon,  1 Nov 2021 13:27:06 -0400
Message-Id: <20211101172729.23149-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
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

Move the masking of the address from cpu_loop into
s390_cpu_record_sigsegv -- this is governed by hw, not linux.
This does mean we have to raise our own exception, rather
than return to the fallback.

Use maperr to choose between PGM_PROTECTION and PGM_ADDRESSING.
Use the appropriate si_code for each in cpu_loop.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/s390x-internal.h  | 13 ++++++++++---
 linux-user/s390x/cpu_loop.c    | 13 ++++++-------
 target/s390x/cpu.c             |  6 ++++--
 target/s390x/tcg/excp_helper.c | 18 +++++++++++-------
 4 files changed, 31 insertions(+), 19 deletions(-)

diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index 27d4a03ca1..163aa4f94a 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -270,13 +270,20 @@ ObjectClass *s390_cpu_class_by_name(const char *name);
 void s390x_cpu_debug_excp_handler(CPUState *cs);
 void s390_cpu_do_interrupt(CPUState *cpu);
 bool s390_cpu_exec_interrupt(CPUState *cpu, int int_req);
-bool s390_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                       MMUAccessType access_type, int mmu_idx,
-                       bool probe, uintptr_t retaddr);
 void s390x_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                    MMUAccessType access_type, int mmu_idx,
                                    uintptr_t retaddr) QEMU_NORETURN;
 
+#ifdef CONFIG_USER_ONLY
+void s390_cpu_record_sigsegv(CPUState *cs, vaddr address,
+                             MMUAccessType access_type,
+                             bool maperr, uintptr_t retaddr);
+#else
+bool s390_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                       MMUAccessType access_type, int mmu_idx,
+                       bool probe, uintptr_t retaddr);
+#endif
+
 
 /* fpu_helper.c */
 uint32_t set_cc_nz_f32(float32 v);
diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
index 69b69981f6..d089c8417e 100644
--- a/linux-user/s390x/cpu_loop.c
+++ b/linux-user/s390x/cpu_loop.c
@@ -24,8 +24,6 @@
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 
-/* s390x masks the fault address it reports in si_addr for SIGSEGV and SIGBUS */
-#define S390X_FAIL_ADDR_MASK -4096LL
 
 static int get_pgm_data_si_code(int dxc_code)
 {
@@ -111,12 +109,13 @@ void cpu_loop(CPUS390XState *env)
                 n = TARGET_ILL_ILLOPC;
                 goto do_signal_pc;
             case PGM_PROTECTION:
+                force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_ACCERR,
+                                env->__excp_addr);
+                break;
             case PGM_ADDRESSING:
-                sig = TARGET_SIGSEGV;
-                /* XXX: check env->error_code */
-                n = TARGET_SEGV_MAPERR;
-                addr = env->__excp_addr & S390X_FAIL_ADDR_MASK;
-                goto do_signal;
+                force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR,
+                                env->__excp_addr);
+                break;
             case PGM_EXECUTE:
             case PGM_SPECIFICATION:
             case PGM_SPECIAL_OP:
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 7b7b05f1d3..593dda75c4 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -266,9 +266,11 @@ static void s390_cpu_reset_full(DeviceState *dev)
 
 static const struct TCGCPUOps s390_tcg_ops = {
     .initialize = s390x_translate_init,
-    .tlb_fill = s390_cpu_tlb_fill,
 
-#if !defined(CONFIG_USER_ONLY)
+#ifdef CONFIG_USER_ONLY
+    .record_sigsegv = s390_cpu_record_sigsegv,
+#else
+    .tlb_fill = s390_cpu_tlb_fill,
     .cpu_exec_interrupt = s390_cpu_exec_interrupt,
     .do_interrupt = s390_cpu_do_interrupt,
     .debug_excp_handler = s390x_cpu_debug_excp_handler,
diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
index 3d6662a53c..b923d080fc 100644
--- a/target/s390x/tcg/excp_helper.c
+++ b/target/s390x/tcg/excp_helper.c
@@ -89,16 +89,20 @@ void s390_cpu_do_interrupt(CPUState *cs)
     cs->exception_index = -1;
 }
 
-bool s390_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                       MMUAccessType access_type, int mmu_idx,
-                       bool probe, uintptr_t retaddr)
+void s390_cpu_record_sigsegv(CPUState *cs, vaddr address,
+                             MMUAccessType access_type,
+                             bool maperr, uintptr_t retaddr)
 {
     S390CPU *cpu = S390_CPU(cs);
 
-    trigger_pgm_exception(&cpu->env, PGM_ADDRESSING);
-    /* On real machines this value is dropped into LowMem.  Since this
-       is userland, simply put this someplace that cpu_loop can find it.  */
-    cpu->env.__excp_addr = address;
+    trigger_pgm_exception(&cpu->env, maperr ? PGM_ADDRESSING : PGM_PROTECTION);
+    /*
+     * On real machines this value is dropped into LowMem. Since this
+     * is userland, simply put this someplace that cpu_loop can find it.
+     * S390 only gives the page of the fault, not the exact address.
+     * C.f. the construction of TEC in mmu_translate().
+     */
+    cpu->env.__excp_addr = address & TARGET_PAGE_MASK;
     cpu_loop_exit_restore(cs, retaddr);
 }
 
-- 
2.25.1


