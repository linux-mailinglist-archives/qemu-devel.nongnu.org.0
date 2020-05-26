Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3B61DED12
	for <lists+qemu-devel@lfdr.de>; Fri, 22 May 2020 18:19:03 +0200 (CEST)
Received: from localhost ([::1]:56234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jcANy-0008Et-Kb
	for lists+qemu-devel@lfdr.de; Fri, 22 May 2020 12:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jcAKI-0002rP-AA
 for qemu-devel@nongnu.org; Fri, 22 May 2020 12:15:14 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:34113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jcAKH-00068Z-2l
 for qemu-devel@nongnu.org; Fri, 22 May 2020 12:15:13 -0400
Received: by mail-pf1-x442.google.com with SMTP id z64so881534pfb.1
 for <qemu-devel@nongnu.org>; Fri, 22 May 2020 09:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JYiXtqj6gRVqxuRODQQz1eMSRJbQ7+uu1VT7LzsetPI=;
 b=oYEvkOCJGliRXZ0zkgt/2z4gEHerit/8rwZVg00ncJ2XoANaDewSsNkRNlIUq89HZP
 Kn6Jco/Le7N32URl4/LaGQqY6TNDu0UhwNV/N2yJtcjk/WrXRIOCch/LFMOPn+jl+fJ7
 Cvq/XWmpvVOOyENH2NzgJNBF5GIG9uDwHbWaebC0r/IcQLWspcVUej6ctspFANilNjpS
 glRjG0ekFTBYu82W166JXjBwdctBmG/giTENNIkbA7MTSfLr73YT4oqAScXUopnTSe8x
 xsn8avxqns6JOEh39xBG68GaBO5eO6XspgTG+u/q+zIl6EcPmBdYnubXlxpSMcgImvKy
 F8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JYiXtqj6gRVqxuRODQQz1eMSRJbQ7+uu1VT7LzsetPI=;
 b=A38tQb+f34GyH6p1DxsM4huFi3GEKEZ0dyNWBNDYXC9KCec3kRyNjYUDeE535z38li
 lhPEHy5dlBt5fUxczyXEEZSS8lrSNRFvhUVqPIsUGPGwFp7IXZU7fV1U1xJOwaFOoFo7
 MuKO/ukn41HYILOe7WX4tsitZAC2Q3AmR8AT2dS1vxh99Mv3tntqgD2N3ToctwKmaIW0
 CcmqQyjMEXnuw6fFj/MF7gvhjqkYq21kjsIuaB/7zYG36vm2L79ECYcKO40YtGmZfkfC
 QN4NNWmPHQI9rI02lEvo+4xPW8QjBQbMva4cDRxVD8gQYOvg96WNjPTCN9oluk9yVDJf
 53Rw==
X-Gm-Message-State: AOAM531PMGY3Ywd32iyOJJHAChOIPZlbtkJx3DCA8cXtR7RUxzn7HjfW
 rOdqkoMp7rjSRdIM5rNYrbV5fx9JeYYryg==
X-Google-Smtp-Source: ABdhPJzPg+7Mb52mPLK33MwR4NS+FW4JwBoR7aokwnTMGbFqzPdJWjrMYnFZxOqf8QE8Wk4JH7DjHg==
X-Received: by 2002:a62:1957:: with SMTP id 84mr4544208pfz.54.1590164110282;
 Fri, 22 May 2020 09:15:10 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:f1d9:5fce:c451:d2e2])
 by smtp.gmail.com with ESMTPSA id y75sm7255428pfb.212.2020.05.22.09.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 09:15:09 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/19] tcg: call qemu_spin_destroy for tb->jmp_lock
Date: Fri, 22 May 2020 12:07:42 -0400
Message-Id: <20200522160755.886-7-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200522160755.886-1-robert.foley@linaro.org>
References: <20200522160755.886-1-robert.foley@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=robert.foley@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.puhov@linaro.org, cota@braap.org, alex.bennee@linaro.org,
 robert.foley@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
[RF: Minor changes to fix some checkpatch errors]
---
 accel/tcg/translate-all.c | 10 +++++++++-
 include/tcg/tcg.h         |  3 ++-
 tcg/tcg.c                 | 19 ++++++++++++++++---
 3 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 42ce1dfcff..3708aab36b 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -384,6 +384,11 @@ static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
     return 0;
 }
 
+static void tb_destroy(TranslationBlock *tb)
+{
+    qemu_spin_destroy(&tb->jmp_lock);
+}
+
 bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
 {
     TranslationBlock *tb;
@@ -413,6 +418,7 @@ bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
                 /* one-shot translation, invalidate it immediately */
                 tb_phys_invalidate(tb, -1);
                 tcg_tb_remove(tb);
+                tb_destroy(tb);
             }
             r = true;
         }
@@ -1230,7 +1236,7 @@ static void do_tb_flush(CPUState *cpu, run_on_cpu_data tb_flush_count)
     qht_reset_size(&tb_ctx.htable, CODE_GEN_HTABLE_SIZE);
     page_flush_tb();
 
-    tcg_region_reset_all();
+    tcg_region_reset_all(tb_destroy);
     /* XXX: flush processor icache at this point if cache flush is
        expensive */
     atomic_mb_set(&tb_ctx.tb_flush_count, tb_ctx.tb_flush_count + 1);
@@ -1886,6 +1892,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
 
         orig_aligned -= ROUND_UP(sizeof(*tb), qemu_icache_linesize);
         atomic_set(&tcg_ctx->code_gen_ptr, (void *)orig_aligned);
+        tb_destroy(tb);
         return existing_tb;
     }
     tcg_tb_insert(tb);
@@ -2235,6 +2242,7 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
             tb_phys_invalidate(tb->orig_tb, -1);
         }
         tcg_tb_remove(tb);
+        tb_destroy(tb);
     }
 
     /* TODO: If env->pc != tb->pc (i.e. the faulting instruction was not
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index c48bd76b0a..2c5997e14e 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -815,8 +815,9 @@ void *tcg_malloc_internal(TCGContext *s, int size);
 void tcg_pool_reset(TCGContext *s);
 TranslationBlock *tcg_tb_alloc(TCGContext *s);
 
+typedef void (*tb_destroy_func)(TranslationBlock *tb);
 void tcg_region_init(void);
-void tcg_region_reset_all(void);
+void tcg_region_reset_all(tb_destroy_func tb_destroy);
 
 size_t tcg_code_size(void);
 size_t tcg_code_capacity(void);
diff --git a/tcg/tcg.c b/tcg/tcg.c
index a2268d9db0..2680968683 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -502,7 +502,16 @@ size_t tcg_nb_tbs(void)
     return nb_tbs;
 }
 
-static void tcg_region_tree_reset_all(void)
+static gboolean tcg_region_tree_traverse(gpointer k, gpointer v, gpointer data)
+{
+    TranslationBlock *tb = v;
+    tb_destroy_func tb_destroy = data;
+
+    tb_destroy(tb);
+    return FALSE;
+}
+
+static void tcg_region_tree_reset_all(tb_destroy_func tb_destroy)
 {
     size_t i;
 
@@ -510,6 +519,10 @@ static void tcg_region_tree_reset_all(void)
     for (i = 0; i < region.n; i++) {
         struct tcg_region_tree *rt = region_trees + i * tree_size;
 
+        if (tb_destroy != NULL) {
+            g_tree_foreach(rt->tree, tcg_region_tree_traverse, tb_destroy);
+        }
+
         /* Increment the refcount first so that destroy acts as a reset */
         g_tree_ref(rt->tree);
         g_tree_destroy(rt->tree);
@@ -586,7 +599,7 @@ static inline bool tcg_region_initial_alloc__locked(TCGContext *s)
 }
 
 /* Call from a safe-work context */
-void tcg_region_reset_all(void)
+void tcg_region_reset_all(tb_destroy_func tb_destroy)
 {
     unsigned int n_ctxs = atomic_read(&n_tcg_ctxs);
     unsigned int i;
@@ -603,7 +616,7 @@ void tcg_region_reset_all(void)
     }
     qemu_mutex_unlock(&region.lock);
 
-    tcg_region_tree_reset_all();
+    tcg_region_tree_reset_all(tb_destroy);
 }
 
 #ifdef CONFIG_USER_ONLY
-- 
2.17.1


