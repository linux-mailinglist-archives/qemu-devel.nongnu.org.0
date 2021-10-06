Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB7242454B
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:52:18 +0200 (CEST)
Received: from localhost ([::1]:46852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYB5V-0000C2-0R
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdq-0007mH-TN
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:42 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:39912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdo-0008LT-RO
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:42 -0400
Received: by mail-pl1-x62d.google.com with SMTP id c4so2139230pls.6
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ij1YRgU0peRo+QSVg6ezzkIr6IGfKaWXUXRkApukMz0=;
 b=BWtsOiQ8Z+3+JslAmjS3aCjANOgTbTNoeuUoEM4wgfi+4lYwBrGxWMWm188YUYkpS5
 KItnBGab32j6LgX1GIq7AGXUgTpW/rtrj5dg6eLYLXteyUKrPYun0vH5Gq49C74uTR3h
 bjSnqmifkHqjNvoA/1hyYeJf5WgLszA8BDm7YrkHU6jOaSj3pX2hpDhlZUdB6NbnCWbM
 BjyHdYDSbkH4n+O6r2AFZeGODd6XAH5l93KDg8feF21t/C5czrBHDm+vGddrJq7pYfgV
 fb8MYIOwlf9y+kt0LWnIFrqbQVFW9ZdDDBNDQk3DBNO/irsOCoRGS0DecU+qZwJQO1k9
 77uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ij1YRgU0peRo+QSVg6ezzkIr6IGfKaWXUXRkApukMz0=;
 b=uxRG5ff5GvJdLsQNCl4mS0GNJMMuWWK5TBI1WGQxn8b0T9AKaTkq1tz+/DSz4dWQ1z
 WtnLQtnfldijuZ2kC7THFde/E5GJMsXWqH0ZN8SgWKP3nspEWhlGMcTJRORqDWFnSV9p
 xedpHh46+hiss+1al2zBGcVvyCj8l+8DAOXAs3NsGjaXmTOt5cI/zV1cLCKyA/mTT5Eg
 WdpegxykVynE20+bdLUawGb239f3rhW7xAo4dlPsOqM0V2+2ksJgZDfUz4tw3ilstMvc
 1dsZPb4sktnHAUZAPZ+c0/1m7S1NZvH6r6Aw1MccNzepHkxfHlbRQMsGadkjrd5r0HV6
 FI5Q==
X-Gm-Message-State: AOAM530SeRODq2a8ufyC34vea1uqpnGdZK81Yu2SQ0ri4Fluwk2ASGAV
 07fRuYzjc5h77LzrhCymX+iQd2NbOkb3PQ==
X-Google-Smtp-Source: ABdhPJzU/HvxzE4SduKVmSHpzSKx4vFtiTMSc4vvCMN4osBU2aivGCTMa7Jy1Lkb3gF1lf4L+FdtfQ==
X-Received: by 2002:a17:902:aa02:b0:13a:6c8f:407f with SMTP id
 be2-20020a170902aa0200b0013a6c8f407fmr12114364plb.59.1633541019410; 
 Wed, 06 Oct 2021 10:23:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w7sm21606929pfj.189.2021.10.06.10.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:23:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 37/41] target/s390x: Implement s390_cpu_record_sigsegv
Date: Wed,  6 Oct 2021 10:23:03 -0700
Message-Id: <20211006172307.780893-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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


