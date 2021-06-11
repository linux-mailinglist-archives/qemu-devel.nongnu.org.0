Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CD33A4B72
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:54:30 +0200 (CEST)
Received: from localhost ([::1]:56948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrqyr-000256-IH
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqml-0002i4-CJ
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:41:59 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:33739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmh-0002fU-FV
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:41:59 -0400
Received: by mail-pf1-x435.google.com with SMTP id p13so5713972pfw.0
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iD7yxVWh28zLth+n9Lv4DaX50utGIU5Dj8a00XRtdrI=;
 b=VLls0+rLBWFQAL6q/M4y39R3MuWoqUQWxCASwKomRwCR9BsNL2Ce/J/Ynst4DphROb
 hMhy+igqjJ1CLgn6Sn+HPCRsUOgY4Djqtrxt4w7lihusUzUrPM/21v+d13jhu35X7pQX
 6bH/FzxrbXUXLjoZiVqEo7/sfHOWo4PEb3KuS2rjl5yOZUWFDR0cINgWqyw34gvs+i5L
 M4uN6xj/bNCDuNQ+W6fIu1F6YirFSJoceWw0iqaiQPlNsm7adXOicd+3/Psg5xqyt33X
 xw0vSpm2D9DL3zjbfzOEUZL+LiuLkC8tHaOX+VKHy8XIYUvOFqR6gQaAg7RIeIlLFirp
 Z94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iD7yxVWh28zLth+n9Lv4DaX50utGIU5Dj8a00XRtdrI=;
 b=X2NMsfvPQRtns8/Vc/1jJ5ZB8waL0A4NI2RkvVdYaQJeYFk1IGQ62OF1fAiNVsvuai
 IRmDvQfYhC694rIj7xqtaGm/+Vvg4eyBt4NwAlJA3tg/VqG5UnQqzTIw+FeQk/FsNPLy
 mhaAkZYmcQaA6pokD7gkQHV/ywx/zkgy3By9EAOu62PjL8Uzd96obWKuZnBPqT+tLFMA
 fdyg8YRurkqOo99uu4rZNAxg/xtopMUK54P//9SoKncAE1uTad7srFfYLJhPF9pWe1lw
 SRysXHccz/XZLsyBMVe6zpnVaS3iXW39ra9vtjqr5srBnIr17p01QSVB9hjkwrWjrs+y
 vk6w==
X-Gm-Message-State: AOAM531jPxKObALXIVCVtEDji8vLSlwaCcZYD69CNh1+m3JniT9W6AEu
 31Iv+HGw7yoniBRe6Q98vaFAYYbV2N2jtw==
X-Google-Smtp-Source: ABdhPJwrxWepnsVM8dZqcxhxgFI6YihOH2D3p3pAecosPzxdeNXvsEGxB2w1pwzLAD5TP7S1j+aHHQ==
X-Received: by 2002:a63:ff43:: with SMTP id s3mr6002879pgk.86.1623454914120;
 Fri, 11 Jun 2021 16:41:54 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:41:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/34] accel/tcg: Pass down max_cpus to tcg_init
Date: Fri, 11 Jun 2021 16:41:24 -0700
Message-Id: <20210611234144.653682-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

Start removing the include of hw/boards.h from tcg/.
Pass down the max_cpus value from tcg_init_machine,
where we have the MachineState already.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h   |  2 +-
 tcg/tcg-internal.h  |  2 +-
 accel/tcg/tcg-all.c | 10 +++++++++-
 tcg/region.c        | 32 +++++++++++---------------------
 tcg/tcg.c           | 10 ++++------
 5 files changed, 26 insertions(+), 30 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index b3304ce095..2316a64139 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -905,7 +905,7 @@ static inline void *tcg_malloc(int size)
     }
 }
 
-void tcg_init(size_t tb_size, int splitwx);
+void tcg_init(size_t tb_size, int splitwx, unsigned max_cpus);
 void tcg_register_thread(void);
 void tcg_prologue_init(TCGContext *s);
 void tcg_func_start(TCGContext *s);
diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index f13c564d9b..fcfeca232f 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -30,7 +30,7 @@
 extern TCGContext **tcg_ctxs;
 extern unsigned int n_tcg_ctxs;
 
-void tcg_region_init(size_t tb_size, int splitwx);
+void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus);
 bool tcg_region_alloc(TCGContext *s);
 void tcg_region_initial_alloc(TCGContext *s);
 void tcg_region_prologue_set(TCGContext *s);
diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index 1ee89902c3..00803f76d8 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -33,6 +33,9 @@
 #include "qemu/accel.h"
 #include "qapi/qapi-builtin-visit.h"
 #include "qemu/units.h"
+#if !defined(CONFIG_USER_ONLY)
+#include "hw/boards.h"
+#endif
 #include "internal.h"
 
 struct TCGState {
@@ -110,13 +113,18 @@ bool mttcg_enabled;
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
-    tcg_init(s->tb_size * MiB, s->splitwx_enabled);
+    tcg_init(s->tb_size * MiB, s->splitwx_enabled, max_cpus);
 
 #if defined(CONFIG_SOFTMMU)
     /*
diff --git a/tcg/region.c b/tcg/region.c
index 162b4d6486..877baf16f5 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -27,9 +27,6 @@
 #include "qapi/error.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
-#if !defined(CONFIG_USER_ONLY)
-#include "hw/boards.h"
-#endif
 #include "tcg-internal.h"
 
 
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
 
 /*
  * Minimum size of the code gen buffer.  This number is randomly chosen,
@@ -848,7 +838,7 @@ static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
  * in practice. Multi-threaded guests share most if not all of their translated
  * code, which makes parallel code generation less appealing than in softmmu.
  */
-void tcg_region_init(size_t tb_size, int splitwx)
+void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
 {
     void *buf, *aligned;
     size_t size;
@@ -865,7 +855,7 @@ void tcg_region_init(size_t tb_size, int splitwx)
     buf = tcg_init_ctx.code_gen_buffer;
     size = tcg_init_ctx.code_gen_buffer_size;
     page_size = qemu_real_host_page_size;
-    n_regions = tcg_n_regions();
+    n_regions = tcg_n_regions(max_cpus);
 
     /* The first region will be 'aligned - buf' bytes larger than the others */
     aligned = QEMU_ALIGN_PTR_UP(buf, page_size);
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 2625d9e502..5cc384e205 100644
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


