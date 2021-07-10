Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CBD3C352C
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:35:06 +0200 (CEST)
Received: from localhost ([::1]:49196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2F0T-0005Fb-78
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:35:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExK-0004wy-8U
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:50 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:34635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExI-0002CY-Ia
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:50 -0400
Received: by mail-pf1-x432.google.com with SMTP id o201so6620346pfd.1
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y3lANsHAiYr3NfirOwYT3hcp5c4TVyMIYJgJoxKd7BA=;
 b=ZNFS46LO/h8QELM7+nuF74WGT/Bc7GrQKLElQH2f1DLHsWOVTeEfuI5/iZkVe7np0+
 qVFQnPW9ms7GAEusg4meX8jeP7OeQ9VaA9aff93+bkpHqTI45KCkd9LE4tSEmrnpnkTn
 01EhCocfF5+qZp5sZR6TsZoa36sglurIfXZoujNctcMy9F6vDj7Yh51r92htVbeDWwSP
 OmkEEl531tvxyFvAds1/gCsyNq9pOoAVeimKpK0kYbSkKxKWUQlnNhtqIlPHCTKiyp27
 R4d0PZ9kFFG6KttDdA3EVwoPMd4uxjN2Eeh7vVXj3FDjhxm992PSJcXrb2fmdrNiPxFd
 /1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y3lANsHAiYr3NfirOwYT3hcp5c4TVyMIYJgJoxKd7BA=;
 b=r3DzlX2G4qTlGSnuRFWBEzzjRS0Da6u1sPAmDWY5FiTv1BYksBc3hMH253vCvMDp44
 ubXlX/NZILYegUkGerIQYgHbepIjLND/BgWsFHpAdfaGo2q9gAB6dPNvExVxARk513OR
 /yDJNa3wsMDc34NMj5z0SqcG6fjyBuUxepy0NiGcnNbz8Go+VpRK8zFANxYBhYni8Z18
 aJFqwkD2PPDi7lrmwVjTwnvCyBKh/eqYZ4RCUkAPTdt5UKWkbxI7C0mW5kEtt3HpXmv3
 ORliY4VdrXiHRTTlNDkDPI1vhNqmvPYa/r7lL/EXI/jyaCVkJBI6a3O866nCf0a/+jGI
 iW0Q==
X-Gm-Message-State: AOAM533FqZbahKFcEx/zbzfgRSJrSiYb1IqGo4adGg7b35rZqvtBuhsC
 ntbCQ/MoOuqQyaWclxG7sXdgpcqosjfIVg==
X-Google-Smtp-Source: ABdhPJznV5SmpWoVPFqev+xymkcPckS0JAgk59WWzHb3YjUe+DAeGp8Suy2VAy20Sbx7hl/QWPr0Yg==
X-Received: by 2002:a63:ff25:: with SMTP id k37mr29858512pgi.353.1625931107375; 
 Sat, 10 Jul 2021 08:31:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:31:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/41] tcg: Bake tb_destroy() into tcg_region_tree
Date: Sat, 10 Jul 2021 08:31:06 -0700
Message-Id: <20210710153143.1320521-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: Liren Wei <lrwei@bupt.edu.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liren Wei <lrwei@bupt.edu.cn>

The function is called only at tcg_gen_code() when duplicated TBs
are translated by different threads, and when the tcg_region_tree
is reset. Bake it into the underlying GTree as its value destroy
function to unite these situations.
Also remove tcg_region_tree_traverse() which now becomes useless.

Signed-off-by: Liren Wei <lrwei@bupt.edu.cn>
Message-Id: <8dc352f08d038c4e7a1f5f56962398cdc700c3aa.1625404483.git.lrwei@bupt.edu.cn>
[rth: Name the new tb_tc_cmp parameter correctly.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h         |  1 -
 accel/tcg/translate-all.c |  6 ------
 tcg/region.c              | 19 ++++++++-----------
 3 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 899493701c..dedb86939a 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -808,7 +808,6 @@ void *tcg_malloc_internal(TCGContext *s, int size);
 void tcg_pool_reset(TCGContext *s);
 TranslationBlock *tcg_tb_alloc(TCGContext *s);
 
-void tb_destroy(TranslationBlock *tb);
 void tcg_region_reset_all(void);
 
 size_t tcg_code_size(void);
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 75e4d06557..57455d8639 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -378,11 +378,6 @@ static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
     return 0;
 }
 
-void tb_destroy(TranslationBlock *tb)
-{
-    qemu_spin_destroy(&tb->jmp_lock);
-}
-
 bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
 {
     /*
@@ -1681,7 +1676,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
 
         orig_aligned -= ROUND_UP(sizeof(*tb), qemu_icache_linesize);
         qatomic_set(&tcg_ctx->code_gen_ptr, (void *)orig_aligned);
-        tb_destroy(tb);
         tcg_tb_remove(tb);
         return existing_tb;
     }
diff --git a/tcg/region.c b/tcg/region.c
index 00b0c3b091..d3a3658e81 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -112,7 +112,7 @@ static int ptr_cmp_tb_tc(const void *ptr, const struct tb_tc *s)
     return 0;
 }
 
-static gint tb_tc_cmp(gconstpointer ap, gconstpointer bp)
+static gint tb_tc_cmp(gconstpointer ap, gconstpointer bp, gpointer userdata)
 {
     const struct tb_tc *a = ap;
     const struct tb_tc *b = bp;
@@ -143,6 +143,12 @@ static gint tb_tc_cmp(gconstpointer ap, gconstpointer bp)
     return ptr_cmp_tb_tc(b->ptr, a);
 }
 
+static void tb_destroy(gpointer value)
+{
+    TranslationBlock *tb = value;
+    qemu_spin_destroy(&tb->jmp_lock);
+}
+
 static void tcg_region_trees_init(void)
 {
     size_t i;
@@ -153,7 +159,7 @@ static void tcg_region_trees_init(void)
         struct tcg_region_tree *rt = region_trees + i * tree_size;
 
         qemu_mutex_init(&rt->lock);
-        rt->tree = g_tree_new(tb_tc_cmp);
+        rt->tree = g_tree_new_full(tb_tc_cmp, NULL, NULL, tb_destroy);
     }
 }
 
@@ -277,14 +283,6 @@ size_t tcg_nb_tbs(void)
     return nb_tbs;
 }
 
-static gboolean tcg_region_tree_traverse(gpointer k, gpointer v, gpointer data)
-{
-    TranslationBlock *tb = v;
-
-    tb_destroy(tb);
-    return FALSE;
-}
-
 static void tcg_region_tree_reset_all(void)
 {
     size_t i;
@@ -293,7 +291,6 @@ static void tcg_region_tree_reset_all(void)
     for (i = 0; i < region.n; i++) {
         struct tcg_region_tree *rt = region_trees + i * tree_size;
 
-        g_tree_foreach(rt->tree, tcg_region_tree_traverse, NULL);
         /* Increment the refcount first so that destroy acts as a reset */
         g_tree_ref(rt->tree);
         g_tree_destroy(rt->tree);
-- 
2.25.1


