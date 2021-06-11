Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D96E3A4B6B
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:50:34 +0200 (CEST)
Received: from localhost ([::1]:47072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrqv3-0003oD-9S
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqml-0002gy-36
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:41:59 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:37558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmh-0002gM-Vq
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:41:58 -0400
Received: by mail-pl1-x62b.google.com with SMTP id h12so3599742plf.4
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iYzRJ65/H4fLD/mZbc5LqELD84drbVwSLcSFgKAxf3E=;
 b=mmEhLw68a9vsbek7USdTzB4NDKKrrcGQkon4VMBgVVZYNzY6go3QKre4VkvArwmoJT
 hiC3HfuE5VoktDdLtfSgkdXmM1hF4w7Ev4HWwIK20G94wMPJrrliPa8tTVbttAc4Q9Es
 2M5RpGYQQ2vVxIQeEapqbkeFlc1cqJDvJHmbx6cScNh/fCbuOQfJK+MB1EPbEWkKYfYG
 5FphL3RnPGWRrH6/DPpoqkr1bGdY4GTUgHSAPMETSFHh1VcKHEobKpz5wVScaMlvi9QD
 sB9YTPEuPQsTloRsiTWSZJIUYWgY6XjLNhSjatLHWwF1b7TZ4URNSzLtscuMHkATExWl
 7wIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iYzRJ65/H4fLD/mZbc5LqELD84drbVwSLcSFgKAxf3E=;
 b=E5hINmK54qhge6ackav44X2grWOskyuNbaM7LEMxHvz1N+f5RRBBhvgzhwEbhUZfke
 uc0lW928x3lz1AYSHGEfxQPmxLA7gTIf+R0l1Uw4Fpfu4+iEyPsSUxQ64JxdQ9iDmujT
 yAD++Au8JHOHmcV/lWsr7ottkRjnalwFVMic7Jsr4hCKNUxjswyS8tTWN+SG+fHfiheR
 IHwu77GR7tuWPDokL5mwZgFqWRnsEB91QP4JgS8wTZ6uFfjVGMGcP2VSCOBTLWvoKw3t
 cOKmT/2vjw07W6nbP0Q4ND6rHEcNE/2A9MB42I3j3kKv0K9TyNQB9hG64oYlJUXqA/nG
 kZag==
X-Gm-Message-State: AOAM532/TdUeYDoEBW8NHoQ0PcOiTr3ajqf+zth10Dk2PPnJ54TpuOhB
 2wf7g4x/ZYpqjBQjrftLFH8zTfJv5FTsRg==
X-Google-Smtp-Source: ABdhPJw/vw69/v6XUaPYsEJpyZJnv8bhsFd5MH3RZAnl6TN5S79O4rQ575/mL2PBxylOrNqPC2EVMw==
X-Received: by 2002:a17:90a:4f0a:: with SMTP id
 p10mr11551371pjh.36.1623454914732; 
 Fri, 11 Jun 2021 16:41:54 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:41:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/34] tcg: Introduce tcg_max_ctxs
Date: Fri, 11 Jun 2021 16:41:25 -0700
Message-Id: <20210611234144.653682-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Finish the divorce of tcg/ from hw/, and do not take
the max cpu value from MachineState; just remember what
we were passed in tcg_init.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-internal.h |  3 ++-
 tcg/region.c       |  6 +++---
 tcg/tcg.c          | 23 ++++++++++-------------
 3 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index fcfeca232f..f9906523da 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -28,7 +28,8 @@
 #define TCG_HIGHWATER 1024
 
 extern TCGContext **tcg_ctxs;
-extern unsigned int n_tcg_ctxs;
+extern unsigned int tcg_cur_ctxs;
+extern unsigned int tcg_max_ctxs;
 
 void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus);
 bool tcg_region_alloc(TCGContext *s);
diff --git a/tcg/region.c b/tcg/region.c
index 877baf16f5..57069a38ff 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -347,7 +347,7 @@ void tcg_region_initial_alloc(TCGContext *s)
 /* Call from a safe-work context */
 void tcg_region_reset_all(void)
 {
-    unsigned int n_ctxs = qatomic_read(&n_tcg_ctxs);
+    unsigned int n_ctxs = qatomic_read(&tcg_cur_ctxs);
     unsigned int i;
 
     qemu_mutex_lock(&region.lock);
@@ -934,7 +934,7 @@ void tcg_region_prologue_set(TCGContext *s)
  */
 size_t tcg_code_size(void)
 {
-    unsigned int n_ctxs = qatomic_read(&n_tcg_ctxs);
+    unsigned int n_ctxs = qatomic_read(&tcg_cur_ctxs);
     unsigned int i;
     size_t total;
 
@@ -970,7 +970,7 @@ size_t tcg_code_capacity(void)
 
 size_t tcg_tb_phys_invalidate_count(void)
 {
-    unsigned int n_ctxs = qatomic_read(&n_tcg_ctxs);
+    unsigned int n_ctxs = qatomic_read(&tcg_cur_ctxs);
     unsigned int i;
     size_t total = 0;
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 5cc384e205..9880d5205e 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -43,11 +43,6 @@
 #define NO_CPU_IO_DEFS
 
 #include "exec/exec-all.h"
-
-#if !defined(CONFIG_USER_ONLY)
-#include "hw/boards.h"
-#endif
-
 #include "tcg/tcg-op.h"
 
 #if UINTPTR_MAX == UINT32_MAX
@@ -155,7 +150,8 @@ static int tcg_out_ldst_finalize(TCGContext *s);
 #endif
 
 TCGContext **tcg_ctxs;
-unsigned int n_tcg_ctxs;
+unsigned int tcg_cur_ctxs;
+unsigned int tcg_max_ctxs;
 TCGv_env cpu_env = 0;
 const void *tcg_code_gen_epilogue;
 uintptr_t tcg_splitwx_diff;
@@ -475,7 +471,6 @@ void tcg_register_thread(void)
 #else
 void tcg_register_thread(void)
 {
-    MachineState *ms = MACHINE(qdev_get_machine());
     TCGContext *s = g_malloc(sizeof(*s));
     unsigned int i, n;
 
@@ -491,8 +486,8 @@ void tcg_register_thread(void)
     }
 
     /* Claim an entry in tcg_ctxs */
-    n = qatomic_fetch_inc(&n_tcg_ctxs);
-    g_assert(n < ms->smp.max_cpus);
+    n = qatomic_fetch_inc(&tcg_cur_ctxs);
+    g_assert(n < tcg_max_ctxs);
     qatomic_set(&tcg_ctxs[n], s);
 
     if (n > 0) {
@@ -643,9 +638,11 @@ static void tcg_context_init(unsigned max_cpus)
      */
 #ifdef CONFIG_USER_ONLY
     tcg_ctxs = &tcg_ctx;
-    n_tcg_ctxs = 1;
+    tcg_cur_ctxs = 1;
+    tcg_max_ctxs = 1;
 #else
-    tcg_ctxs = g_new(TCGContext *, max_cpus);
+    tcg_max_ctxs = max_cpus;
+    tcg_ctxs = g_new0(TCGContext *, max_cpus);
 #endif
 
     tcg_debug_assert(!tcg_regset_test_reg(s->reserved_regs, TCG_AREG0));
@@ -3937,7 +3934,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
 static inline
 void tcg_profile_snapshot(TCGProfile *prof, bool counters, bool table)
 {
-    unsigned int n_ctxs = qatomic_read(&n_tcg_ctxs);
+    unsigned int n_ctxs = qatomic_read(&tcg_cur_ctxs);
     unsigned int i;
 
     for (i = 0; i < n_ctxs; i++) {
@@ -4000,7 +3997,7 @@ void tcg_dump_op_count(void)
 
 int64_t tcg_cpu_exec_time(void)
 {
-    unsigned int n_ctxs = qatomic_read(&n_tcg_ctxs);
+    unsigned int n_ctxs = qatomic_read(&tcg_cur_ctxs);
     unsigned int i;
     int64_t ret = 0;
 
-- 
2.25.1


