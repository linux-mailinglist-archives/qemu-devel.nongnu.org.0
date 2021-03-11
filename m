Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7A433689C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 01:29:51 +0100 (CET)
Received: from localhost ([::1]:47722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK9D4-0006IO-WE
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 19:29:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95w-0004vh-RM
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:28 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:43796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95q-0001N3-92
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:28 -0500
Received: by mail-ot1-x32f.google.com with SMTP id v12so18288222ott.10
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 16:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VKloW61Tc26sBFlXYkkTRhi8LhsET7aQryx+m5RvYhU=;
 b=NOVUcaE6XTntnOR5u/hvoZXTI60JwJ5AJ1r5pSDbWmR3QYBNV1hZMKmUT75fl+nnRU
 VME6WnMl50igEEFmpapp/u1r4L0ySGa75jhxy1hHUB1b6Qm0dW/Hmq+d8AWradBoP5bm
 Ke15yEC1k1RXYFelCz+VsfAyCOOLhs73mHheOlgMfJQuJ0CASNlFzVHHkcpmC9NaRrVW
 L+fWJdgW3WofRocWyOJKE++Z7nWzxdL3RFH5cCk46PTHv2Meogx443SvPd2aCZfUKwxQ
 XRAv4piQ3iIIyBcci+TS7lbChAWvT/XthskDQ0Rc/RjB5A63JnDgBisCk+Isnpcn7Le0
 IpYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VKloW61Tc26sBFlXYkkTRhi8LhsET7aQryx+m5RvYhU=;
 b=Ppz/YNs3VPJeqq5T/WQbzSfdPnM0Hdi/f22HRh6cTff1ckL2lAiNaOpnPbGFQoFGl8
 f21IYlwRyhnpwpUMABiiN21xJ7LjoLDPVzIfPUV5CEpPc7aTicZNjo9HRNONqz3PET2X
 16rZi9MohreQBmkDs+LH/QNItRNXj7W5663m1ocy5Ji9U7jakPiQ+9vkZ7sGEpbcS7pA
 cWrc1hkj9vxJDjYOaX3K53pYYTKDe4C1I1O4456/saAeE+v56OkRdQi30ahSh/M2WhRA
 ijGYDNOK+HID6a4UMh1HColRM7Gt3kziVmF9hJuPggVlvmDlYxPTBdGz18d0vEHRXCD1
 iW3w==
X-Gm-Message-State: AOAM5302WNRQ1zS9NkXvagsPu75+CxwghBXtJK7ECgMuJj3yCooCYhIH
 ajM4aTIyLVJCHvygYOJ9tlDXZqZTOyU1w+Jy
X-Google-Smtp-Source: ABdhPJzCJFCpV/0wo4cf7hHVNf8SzH6uIRr3wEOxCkSG8ve6zbTBmzMEpIOLm5Wa2Iwu6BYBYR6nHA==
X-Received: by 2002:a05:6830:57a:: with SMTP id
 f26mr4634801otc.70.1615422137015; 
 Wed, 10 Mar 2021 16:22:17 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a6sm300962otq.79.2021.03.10.16.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 16:22:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/26] accel/tcg: Pass down max_cpus to tcg_init
Date: Wed, 10 Mar 2021 18:21:44 -0600
Message-Id: <20210311002156.253711-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311002156.253711-1-richard.henderson@linaro.org>
References: <20210311002156.253711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Start removing the include of hw/boards.h from tcg/.
Pass down the max_cpus value from tcg_init_machine,
where we have the MachineState already.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h   |  2 +-
 tcg/internal.h      |  2 +-
 accel/tcg/tcg-all.c | 10 +++++++++-
 tcg/region.c        | 32 +++++++++++---------------------
 tcg/tcg.c           | 10 ++++------
 5 files changed, 26 insertions(+), 30 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 3ad77ec34d..a0122c0dd3 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -906,7 +906,7 @@ static inline void *tcg_malloc(int size)
     }
 }
 
-void tcg_init(size_t tb_size, int splitwx);
+void tcg_init(size_t tb_size, int splitwx, unsigned max_cpus);
 void tcg_register_thread(void);
 void tcg_prologue_init(TCGContext *s);
 void tcg_func_start(TCGContext *s);
diff --git a/tcg/internal.h b/tcg/internal.h
index f13c564d9b..fcfeca232f 100644
--- a/tcg/internal.h
+++ b/tcg/internal.h
@@ -30,7 +30,7 @@
 extern TCGContext **tcg_ctxs;
 extern unsigned int n_tcg_ctxs;
 
-void tcg_region_init(size_t tb_size, int splitwx);
+void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus);
 bool tcg_region_alloc(TCGContext *s);
 void tcg_region_initial_alloc(TCGContext *s);
 void tcg_region_prologue_set(TCGContext *s);
diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index 0e83acbfe5..d2f2ddb844 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -32,6 +32,9 @@
 #include "qemu/error-report.h"
 #include "qemu/accel.h"
 #include "qapi/qapi-builtin-visit.h"
+#if !defined(CONFIG_USER_ONLY)
+#include "hw/boards.h"
+#endif
 #include "internal.h"
 
 struct TCGState {
@@ -109,13 +112,18 @@ bool mttcg_enabled;
 static int tcg_init_machine(MachineState *ms)
 {
     TCGState *s = TCG_STATE(current_accel());
+#ifdef CONFIG_USER_ONLY
+    unsigned max_cpus = 1;
+#else
+    unsigned max_cpus = ms->smp.max_cpus;
+#endif
 
     tcg_allowed = true;
     mttcg_enabled = s->mttcg_enabled;
 
     page_init();
     tb_htable_init();
-    tcg_init(s->tb_size * 1024 * 1024, s->splitwx_enabled);
+    tcg_init(s->tb_size * 1024 * 1024, s->splitwx_enabled, max_cpus);
 
 #if defined(CONFIG_SOFTMMU)
     /* There's no guest base to take into account, so go ahead and
diff --git a/tcg/region.c b/tcg/region.c
index 8d88144a22..04b699da63 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -27,9 +27,6 @@
 #include "qapi/error.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
-#if !defined(CONFIG_USER_ONLY)
-#include "hw/boards.h"
-#endif
 #include "internal.h"
 
 
@@ -366,27 +363,20 @@ void tcg_region_reset_all(void)
     tcg_region_tree_reset_all();
 }
 
+static size_t tcg_n_regions(unsigned max_cpus)
+{
 #ifdef CONFIG_USER_ONLY
-static size_t tcg_n_regions(void)
-{
     return 1;
-}
 #else
-/*
- * It is likely that some vCPUs will translate more code than others, so we
- * first try to set more regions than max_cpus, with those regions being of
- * reasonable size. If that's not possible we make do by evenly dividing
- * the code_gen_buffer among the vCPUs.
- */
-static size_t tcg_n_regions(void)
-{
+    /*
+     * It is likely that some vCPUs will translate more code than others,
+     * so we first try to set more regions than max_cpus, with those regions
+     * being of reasonable size. If that's not possible we make do by evenly
+     * dividing the code_gen_buffer among the vCPUs.
+     */
     size_t i;
 
     /* Use a single region if all we have is one vCPU thread */
-#if !defined(CONFIG_USER_ONLY)
-    MachineState *ms = MACHINE(qdev_get_machine());
-    unsigned int max_cpus = ms->smp.max_cpus;
-#endif
     if (max_cpus == 1 || !qemu_tcg_mttcg_enabled()) {
         return 1;
     }
@@ -405,8 +395,8 @@ static size_t tcg_n_regions(void)
     }
     /* If we can't, then just allocate one region per vCPU thread */
     return max_cpus;
-}
 #endif
+}
 
 /* Minimum size of the code gen buffer.  This number is randomly chosen,
    but not so small that we can't have a fair number of TB's live.  */
@@ -838,7 +828,7 @@ static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
  * in practice. Multi-threaded guests share most if not all of their translated
  * code, which makes parallel code generation less appealing than in softmmu.
  */
-void tcg_region_init(size_t tb_size, int splitwx)
+void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
 {
     void *buf, *aligned;
     size_t size;
@@ -856,7 +846,7 @@ void tcg_region_init(size_t tb_size, int splitwx)
     buf = tcg_init_ctx.code_gen_buffer;
     size = tcg_init_ctx.code_gen_buffer_size;
     page_size = qemu_real_host_page_size;
-    n_regions = tcg_n_regions();
+    n_regions = tcg_n_regions(max_cpus);
 
     /* The first region will be 'aligned - buf' bytes larger than the others */
     aligned = QEMU_ALIGN_PTR_UP(buf, page_size);
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 65a63bda8a..a89d8f6b81 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -576,7 +576,7 @@ static void process_op_defs(TCGContext *s);
 static TCGTemp *tcg_global_reg_new_internal(TCGContext *s, TCGType type,
                                             TCGReg reg, const char *name);
 
-static void tcg_context_init(void)
+static void tcg_context_init(unsigned max_cpus)
 {
     TCGContext *s = &tcg_init_ctx;
     int op, total_args, n, i;
@@ -645,8 +645,6 @@ static void tcg_context_init(void)
     tcg_ctxs = &tcg_ctx;
     n_tcg_ctxs = 1;
 #else
-    MachineState *ms = MACHINE(qdev_get_machine());
-    unsigned int max_cpus = ms->smp.max_cpus;
     tcg_ctxs = g_new(TCGContext *, max_cpus);
 #endif
 
@@ -655,10 +653,10 @@ static void tcg_context_init(void)
     cpu_env = temp_tcgv_ptr(ts);
 }
 
-void tcg_init(size_t tb_size, int splitwx)
+void tcg_init(size_t tb_size, int splitwx, unsigned max_cpus)
 {
-    tcg_context_init();
-    tcg_region_init(tb_size, splitwx);
+    tcg_context_init(max_cpus);
+    tcg_region_init(tb_size, splitwx, max_cpus);
 }
 
 /*
-- 
2.25.1


