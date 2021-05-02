Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF49370FCD
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:28:33 +0200 (CEST)
Received: from localhost ([::1]:60886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLVo-0003r0-7Q
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMc-0008Ls-TC
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:05 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:40794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMX-0002wM-RS
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:02 -0400
Received: by mail-pl1-x62c.google.com with SMTP id n16so1776686plf.7
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mRgvCIDFvA5UlQTj7r2nU69wxLSUlzYCUC/NBBipjpc=;
 b=x453Sr/GcQsuehPBG/uN+gTmEmu8uS66nhghLnkTlSS7+87vLcAkqxPVY7BMev+Xx1
 RI2EIBuUXagRc6QHCVnP5Izf5oTBk2Y/yma2naaPmcFhT8UE3G8+Y7ZzDElHZRAg8Jxt
 hMWcvZ68yzI9FW/kGozXO98Ye4PWNiV0K+vhRLsAnbvCfvFZQE1r3Q3xmAN2OXhKDCt8
 D/8fArF2HVAIUPnLijooWp9zRgrKztD862K7gp3RBwPbQVO4FNb87r3X1ZA/xSoUwP0w
 IpSGuAmYWHNtsPgj6SwD0zykRdVjyJwWFYEfkWDJnZycBy9W4RBMOItm10RIb80tKlvq
 gdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mRgvCIDFvA5UlQTj7r2nU69wxLSUlzYCUC/NBBipjpc=;
 b=gC9AiXPuG0N7SKiLEix09PeQ2kKqc/oSNvOkcd3BxQLfgaWAshfy9r9f/FQL0E/iII
 YQSwV1ayTPW6Rs7i6FjQ+fsIQv38t+e7tJbJ08+g8P+ptYSgGjrZ9PSiPvfUw8yxuVU6
 WaapocSHwryJNSCQTBOUPLIi0pBeGjgrfTQNF6aNzyTyoIHEhyh5sIs+xxM1o6zB0c/0
 hahYKIInOf1QsgBPUAQ1TunaN4Y7koTHTbXsha+CbTNmPFzOU1I4QVkQUbcWYqlL5tSN
 iiaXGvEBSS5vyWamVLCUKqJm/+6GzjFJyVw4QK9UTEYc45pbtUXGrgK8+n39oo0h3jS0
 f2MA==
X-Gm-Message-State: AOAM531QfJD9hGi3mdHG6bTUn22pckGOe0QLt+Z0xofuGBf4bE00r7j8
 EK+BRCrSnTWGo26VICeQRFVM4UJ/p3nGbw==
X-Google-Smtp-Source: ABdhPJzWqqwJbPz1QxUW954iV+dtJi0dYIro/C6Cx2lfOiFRFB5FN2b6rFGQdSb8homwf8JY5ru41w==
X-Received: by 2002:a17:90a:e615:: with SMTP id
 j21mr27513347pjy.43.1619997536566; 
 Sun, 02 May 2021 16:18:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm7146236pfa.68.2021.05.02.16.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:18:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/28] tcg: Introduce tcg_max_ctxs
Date: Sun,  2 May 2021 16:18:30 -0700
Message-Id: <20210502231844.1977630-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502231844.1977630-1-richard.henderson@linaro.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
index f9e93e85b3..142b27276b 100644
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
@@ -924,7 +924,7 @@ void tcg_region_prologue_set(TCGContext *s)
  */
 size_t tcg_code_size(void)
 {
-    unsigned int n_ctxs = qatomic_read(&n_tcg_ctxs);
+    unsigned int n_ctxs = qatomic_read(&tcg_cur_ctxs);
     unsigned int i;
     size_t total;
 
@@ -960,7 +960,7 @@ size_t tcg_code_capacity(void)
 
 size_t tcg_tb_phys_invalidate_count(void)
 {
-    unsigned int n_ctxs = qatomic_read(&n_tcg_ctxs);
+    unsigned int n_ctxs = qatomic_read(&tcg_cur_ctxs);
     unsigned int i;
     size_t total = 0;
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 5af51d41ee..0926454845 100644
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
@@ -158,7 +153,8 @@ static int tcg_out_ldst_finalize(TCGContext *s);
 #endif
 
 TCGContext **tcg_ctxs;
-unsigned int n_tcg_ctxs;
+unsigned int tcg_cur_ctxs;
+unsigned int tcg_max_ctxs;
 TCGv_env cpu_env = 0;
 const void *tcg_code_gen_epilogue;
 uintptr_t tcg_splitwx_diff;
@@ -478,7 +474,6 @@ void tcg_register_thread(void)
 #else
 void tcg_register_thread(void)
 {
-    MachineState *ms = MACHINE(qdev_get_machine());
     TCGContext *s = g_malloc(sizeof(*s));
     unsigned int i, n;
 
@@ -494,8 +489,8 @@ void tcg_register_thread(void)
     }
 
     /* Claim an entry in tcg_ctxs */
-    n = qatomic_fetch_inc(&n_tcg_ctxs);
-    g_assert(n < ms->smp.max_cpus);
+    n = qatomic_fetch_inc(&tcg_cur_ctxs);
+    g_assert(n < tcg_max_ctxs);
     qatomic_set(&tcg_ctxs[n], s);
 
     if (n > 0) {
@@ -646,9 +641,11 @@ static void tcg_context_init(unsigned max_cpus)
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
@@ -3940,7 +3937,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
 static inline
 void tcg_profile_snapshot(TCGProfile *prof, bool counters, bool table)
 {
-    unsigned int n_ctxs = qatomic_read(&n_tcg_ctxs);
+    unsigned int n_ctxs = qatomic_read(&tcg_cur_ctxs);
     unsigned int i;
 
     for (i = 0; i < n_ctxs; i++) {
@@ -4003,7 +4000,7 @@ void tcg_dump_op_count(void)
 
 int64_t tcg_cpu_exec_time(void)
 {
-    unsigned int n_ctxs = qatomic_read(&n_tcg_ctxs);
+    unsigned int n_ctxs = qatomic_read(&tcg_cur_ctxs);
     unsigned int i;
     int64_t ret = 0;
 
-- 
2.25.1


