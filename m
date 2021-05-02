Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA3A370FC4
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:25:50 +0200 (CEST)
Received: from localhost ([::1]:52150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLTB-0000Cf-AV
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMa-0008KT-JJ
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:00 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:44936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMX-0002vi-Aw
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:00 -0400
Received: by mail-pf1-x42f.google.com with SMTP id m11so2921602pfc.11
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iojAJu7Pxy1uH4OTAeQ4zSPiG2hYAgOBc04Nh+PmbfI=;
 b=gYDbIlFGpN7THjCgAM9gBFhjrxGphnzxbRh058uhHB4ecLDBZX6kmSybFCumwX9tSq
 0F9zAW/3pXVxw5al2fafufmmnjU5PI183WlwnOOOwxa9Cy0sIAAd/dEL5j8qsna7VCz7
 LvgVIPk/mgDJU/yiBKQJL0T+dagfjkCvpvm7Rpl6Bv9RCnjHaJvGm0CnI/Z249NTGSNy
 NBq8rZU+o2kuQgTDwTNDakgCTCx7DdnT+mJqyTdgwENxDxcNSCXosmJRdDh8eKTPkd+Z
 i0sTNK5t5bQOjI/IDDUB/y8FPUlPHcUbaEkTT8TJkQU4UbJV/gKwfe5Fs2AO/1nVFdFK
 xmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iojAJu7Pxy1uH4OTAeQ4zSPiG2hYAgOBc04Nh+PmbfI=;
 b=sZSzajn+QsNf9BVlPIAhW6i+KLZfY9V+9sBxmAtOCMVzbfXj7bxwmon+Vv4aUZ9nq4
 E8AjmCIyDhpcWHb2PZ2MMLx2zkKjcRwSVHQQ15AclnLPUM+fosWxjwZBRhq5nNPhwy7h
 4bbtEJUB+sUqjSWjj5wPyO2n7fHo5La8uUJ1HEqSrtFRs0uTQ2s+5HlzJV3PNUsN7avs
 Hh7mQRWwong+RrZruIo9Kd3mUj0Qz23i16J+bBwQP92kEjeLhX+0QLgrWleWYaY4idac
 G6W32xeZD4NuvdE+PE8jYj9lG4vZcTTB3IQqHIJIe5CnW1O2OJN6Pejtw8gi6w7yKWuA
 LpRw==
X-Gm-Message-State: AOAM533Io3OZrAU09uZyuuCpXMuTl3yZsIPWLz2TwloYP4JI+1nwC77S
 RE7zc/Q4c9IAdT4U9xmV9nkcNcN4i4g2Aw==
X-Google-Smtp-Source: ABdhPJy2kvqJO8TSQjbA2gJPZrDXTyyu2CewIh2MrZT6PncsGE2PsIuor/9lL/59Prmjt4PFync39Q==
X-Received: by 2002:a05:6a00:8c7:b029:20f:1cf4:d02 with SMTP id
 s7-20020a056a0008c7b029020f1cf40d02mr16194269pfu.49.1619997535859; 
 Sun, 02 May 2021 16:18:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm7146236pfa.68.2021.05.02.16.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:18:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/28] accel/tcg: Pass down max_cpus to tcg_init
Date: Sun,  2 May 2021 16:18:29 -0700
Message-Id: <20210502231844.1977630-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502231844.1977630-1-richard.henderson@linaro.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

Start removing the include of hw/boards.h from tcg/.
Pass down the max_cpus value from tcg_init_machine,
where we have the MachineState already.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index ddcbf7113e..f9e93e85b3 100644
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
@@ -855,7 +845,7 @@ void tcg_region_init(size_t tb_size, int splitwx)
     buf = tcg_init_ctx.code_gen_buffer;
     size = tcg_init_ctx.code_gen_buffer_size;
     page_size = qemu_real_host_page_size;
-    n_regions = tcg_n_regions();
+    n_regions = tcg_n_regions(max_cpus);
 
     /* The first region will be 'aligned - buf' bytes larger than the others */
     aligned = QEMU_ALIGN_PTR_UP(buf, page_size);
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 92749a2f8b..5af51d41ee 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -579,7 +579,7 @@ static void process_op_defs(TCGContext *s);
 static TCGTemp *tcg_global_reg_new_internal(TCGContext *s, TCGType type,
                                             TCGReg reg, const char *name);
 
-static void tcg_context_init(void)
+static void tcg_context_init(unsigned max_cpus)
 {
     TCGContext *s = &tcg_init_ctx;
     int op, total_args, n, i;
@@ -648,8 +648,6 @@ static void tcg_context_init(void)
     tcg_ctxs = &tcg_ctx;
     n_tcg_ctxs = 1;
 #else
-    MachineState *ms = MACHINE(qdev_get_machine());
-    unsigned int max_cpus = ms->smp.max_cpus;
     tcg_ctxs = g_new(TCGContext *, max_cpus);
 #endif
 
@@ -658,10 +656,10 @@ static void tcg_context_init(void)
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


