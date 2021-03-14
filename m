Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED43033A83D
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 22:33:17 +0100 (CET)
Received: from localhost ([::1]:39604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLYMO-0002uZ-V8
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 17:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYH4-00067l-Em
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:46 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:44585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYH1-0008EX-Ol
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:45 -0400
Received: by mail-qt1-x82b.google.com with SMTP id m7so7862638qtq.11
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 14:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OlLc/LhYExyFieSM8eoDWZSL5lD1vPrcLRLDLT+veX8=;
 b=J2f0MnHDCT5W3lGBHZmvGxJeHT1aWZsaiZFcRCamquPJVqzS6LGt5tfLfcmKhrhBcc
 3V2RtJzRxzrBwRMPSAe8eAYLRlBtqjPIdFOORR6CSxS79OudNQgcSdYCDeR6fNb1SZKK
 /Eaj0xSvjNR9tEab6DiONLvOrgIDUIgoep/ot04IFdU6HFz305eMekuYFJ8yScuIPu1f
 yExffI+3KlmehT/OPJqZC3x0orhDuXykyDT/+w64ybJ4FJ9ZEyu3F6QMYNzUKbzH+9zt
 wI/TegvVPQlcgX65n/UldxM8Sn5b/1rXMtfCL1328YGzxNYngblln5hp60Dtj2vJKYWL
 ypqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OlLc/LhYExyFieSM8eoDWZSL5lD1vPrcLRLDLT+veX8=;
 b=ZAGNWyrm4jUBRem76BFMRACYlXJrhs3nf+JxgQuFrhz7V1IYm2oCL1UJEDkzKBQc+r
 VRLZzM8GnifxWE8QJbErLiRb7wluiqasmPmGD9/ytBt6Uaq+2z3abHDk2mgoGgWPeZQY
 lDZXorE/Zw+yor3+M6nDBG0FDWN9XqekZ40mOjVRtaZDGNJFo0UQHfmnodzirBnutmzZ
 QGYT66+vtLKX7lMjqYiPTrv6eKSs/XotFKaA+E73LymKqtcqeLdABCuagr/dw1ve4jDw
 qwJ2vTSQc7yzN+mZZrY7P/Bl9Os351JaQxtWRHbNhbBL3XPhYf9Q5qc3kZw2MtnT26Eb
 9ODw==
X-Gm-Message-State: AOAM533id7T3mdfoRvxUn056M8+a/BZSlakwKpi6Uaj7YpojSrKl5t47
 dO5onSGMslNLYHYlRWGW2JGzuZ7WuBX/5iQn
X-Google-Smtp-Source: ABdhPJxKuoW9lpw34+vnh1T3iqvABZ5VvpuwTvdAypmHFTPjlgWYrmjJU1lt/4pU2Ito4qfOndDc1Q==
X-Received: by 2002:ac8:43d6:: with SMTP id w22mr19539386qtn.283.1615757262905; 
 Sun, 14 Mar 2021 14:27:42 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t2sm9337749qtd.13.2021.03.14.14.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 14:27:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/29] tcg: Introduce tcg_max_ctxs
Date: Sun, 14 Mar 2021 15:27:09 -0600
Message-Id: <20210314212724.1917075-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314212724.1917075-1-richard.henderson@linaro.org>
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
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
Cc: r.bolshakov@yadro.com, j@getutm.app,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Finish the divorce of tcg/ from hw/, and do not take
the max cpu value from MachineState; just remember what
we were passed in tcg_init.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/internal.h |  3 ++-
 tcg/region.c   |  6 +++---
 tcg/tcg.c      | 23 ++++++++++-------------
 3 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/tcg/internal.h b/tcg/internal.h
index fcfeca232f..f9906523da 100644
--- a/tcg/internal.h
+++ b/tcg/internal.h
@@ -28,7 +28,8 @@
 #define TCG_HIGHWATER 1024
 
 extern TCGContext **tcg_ctxs;
-extern unsigned int n_tcg_ctxs;
+extern unsigned int tcg_cur_ctxs;
+extern unsigned int tcg_max_ctxs;
 
 void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus);
 bool tcg_region_alloc(TCGContext *s);
diff --git a/tcg/region.c b/tcg/region.c
index 04b699da63..e3fbf6a7e7 100644
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
@@ -922,7 +922,7 @@ void tcg_region_prologue_set(TCGContext *s)
  */
 size_t tcg_code_size(void)
 {
-    unsigned int n_ctxs = qatomic_read(&n_tcg_ctxs);
+    unsigned int n_ctxs = qatomic_read(&tcg_cur_ctxs);
     unsigned int i;
     size_t total;
 
@@ -958,7 +958,7 @@ size_t tcg_code_capacity(void)
 
 size_t tcg_tb_phys_invalidate_count(void)
 {
-    unsigned int n_ctxs = qatomic_read(&n_tcg_ctxs);
+    unsigned int n_ctxs = qatomic_read(&tcg_cur_ctxs);
     unsigned int i;
     size_t total = 0;
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index a89d8f6b81..a82d3a0861 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -44,11 +44,6 @@
 #include "cpu.h"
 
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


