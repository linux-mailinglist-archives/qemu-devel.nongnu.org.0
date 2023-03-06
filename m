Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 879366AB3DA
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:45:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyuD-0004Xp-9g; Sun, 05 Mar 2023 19:40:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyte-0004Q3-8o
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:13 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytc-0006aE-0J
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:09 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so9705786pjn.1
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z2BNlj0nyRYAwdzc4yhgynKpP+EDgVfBPbDdhIIdNXE=;
 b=KBKwsFf3xHDM4TejvKw3f8KapM9JiTeGcbsh67VS6PwnOa7YwpMY9Gup4Tc0Fvh441
 NBBUvDLFuBcYi6GSO6EQqkR3ak3Ia7tmdBqh1U9n6MKSBQxLwJHm8/lpsf/kQmE+hZC7
 UtbN3fFD4nxUD37/ZyZDduXl4XmWD0ANuVfoNbINodTjoPwf/hJbFhF9vjNIp/GjzRdV
 D++62ejYw8PfwMx8/Yp1OCYH+Aowg1A26ni2mUvCJVD4hTNh87OLOgZnRYdscW31RupS
 G+meQ05HgxIdrm3eClEtxUcK04itlzpQZ8WZh0B2afEQt1y+WpfiBuWask4/0fGSgR6W
 hChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z2BNlj0nyRYAwdzc4yhgynKpP+EDgVfBPbDdhIIdNXE=;
 b=IdPl5P/2zvYBvd7Fx3taVZv9dI4TVnmz6ZuN0soIj7nA0inpmJtDNK7iUGFyV/0zu+
 gHZI6mojxlLob7jfD92+4JCpNXYTZQXVWxvsDerpPlJ1Ezb0faxU8QQiL260WkTFk/4A
 uoY2FNDV1BU334Nn2cj/FXcM64XhTsqm8ZxbCuJZM4GjS8MPm40S5P8fLqKc+kJMdeNl
 eVFxjhRTWqrVZ86Oi1lWcqLhgiHUGVHRQ2Od5PDjHKlu3Ocd4R7K0UrlaurhtACkfBf5
 ljxpa0iEuJJwT6g5tlyu4qJAoXZvR3T0hymTc9xH9BqXazX2QMWnLRq5tAUhQPKVdfNn
 kgZg==
X-Gm-Message-State: AO0yUKUquxdOQf3x2FuAtGV8OADiisbfrfVnkv5IqQkmUnFfaLlACCU3
 RxD36JNcwEpnWPAondrKgwKHbHLbhgiPPcCOyj8rFw==
X-Google-Smtp-Source: AK7set+HZm0MQewtEesP3F5HOXbffZYhl/iqBHxRPCPh33LjIC53R9VaibzQxdmnElC8X3X4LI8Qaw==
X-Received: by 2002:a17:90b:38c2:b0:23a:333c:6ba6 with SMTP id
 nn2-20020a17090b38c200b0023a333c6ba6mr9212237pjb.16.1678063206324; 
 Sun, 05 Mar 2023 16:40:06 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090b050d00b002372106a5c2sm6567901pjz.37.2023.03.05.16.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:40:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 12/84] tcg: Remove tcg_check_temp_count, tcg_clear_temp_count
Date: Sun,  5 Mar 2023 16:38:42 -0800
Message-Id: <20230306003954.1866998-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since all temps allocated by guest front-ends are now TEMP_TB,
and we don't recycle TEMP_TB, there's no point in requiring
that the front-ends free the temps at all.  Begin by dropping
the inner-most checks that all temps have been freed.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h      | 14 -----------
 accel/tcg/translator.c | 12 ----------
 tcg/tcg.c              | 54 +++++++-----------------------------------
 3 files changed, 8 insertions(+), 72 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 0dc88011ce..a5cf21be83 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -574,7 +574,6 @@ struct TCGContext {
 #endif
 
 #ifdef CONFIG_DEBUG_TCG
-    int temps_in_use;
     int goto_tb_issue_mask;
     const TCGOpcode *vecop_list;
 #endif
@@ -965,19 +964,6 @@ static inline TCGv_ptr tcg_temp_new_ptr(void)
     return temp_tcgv_ptr(t);
 }
 
-#if defined(CONFIG_DEBUG_TCG)
-/* If you call tcg_clear_temp_count() at the start of a section of
- * code which is not supposed to leak any TCG temporaries, then
- * calling tcg_check_temp_count() at the end of the section will
- * return 1 if the section did in fact leak a temporary.
- */
-void tcg_clear_temp_count(void);
-int tcg_check_temp_count(void);
-#else
-#define tcg_clear_temp_count() do { } while (0)
-#define tcg_check_temp_count() 0
-#endif
-
 int64_t tcg_cpu_exec_time(void);
 void tcg_dump_info(GString *buf);
 void tcg_dump_op_count(GString *buf);
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index d0babfea88..e00e7fa601 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -18,17 +18,8 @@
 #include "exec/plugin-gen.h"
 #include "exec/replay-core.h"
 
-/* Pairs with tcg_clear_temp_count.
-   To be called by #TranslatorOps.{translate_insn,tb_stop} if
-   (1) the target is sufficiently clean to support reporting,
-   (2) as and when all temporaries are known to be consumed.
-   For most targets, (2) is at the end of translate_insn.  */
 void translator_loop_temp_check(DisasContextBase *db)
 {
-    if (tcg_check_temp_count()) {
-        qemu_log("warning: TCG temporary leaks before "
-                 TARGET_FMT_lx "\n", db->pc_next);
-    }
 }
 
 bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest)
@@ -67,9 +58,6 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,
     ops->init_disas_context(db, cpu);
     tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
 
-    /* Reset the temp count so that we can identify leaks */
-    tcg_clear_temp_count();
-
     /* Start translating.  */
     gen_tb_start(db->tb);
     ops->tb_start(db, cpu);
diff --git a/tcg/tcg.c b/tcg/tcg.c
index f9e1afd926..e4fccbd0d8 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1273,7 +1273,7 @@ TCGTemp *tcg_temp_new_internal(TCGType type, TCGTempKind kind)
             ts->temp_allocated = 1;
             tcg_debug_assert(ts->base_type == type);
             tcg_debug_assert(ts->kind == kind);
-            goto done;
+            return ts;
         }
     } else {
         tcg_debug_assert(kind == TEMP_TB);
@@ -1317,11 +1317,6 @@ TCGTemp *tcg_temp_new_internal(TCGType type, TCGTempKind kind)
             ts2->kind = kind;
         }
     }
-
- done:
-#if defined(CONFIG_DEBUG_TCG)
-    s->temps_in_use++;
-#endif
     return ts;
 }
 
@@ -1366,30 +1361,18 @@ void tcg_temp_free_internal(TCGTemp *ts)
 
     switch (ts->kind) {
     case TEMP_CONST:
-        /*
-         * In order to simplify users of tcg_constant_*,
-         * silently ignore free.
-         */
-        return;
-    case TEMP_EBB:
     case TEMP_TB:
+        /* Silently ignore free. */
+        break;
+    case TEMP_EBB:
+        tcg_debug_assert(ts->temp_allocated != 0);
+        ts->temp_allocated = 0;
+        set_bit(temp_idx(ts), s->free_temps[ts->base_type].l);
         break;
     default:
+        /* It never made sense to free TEMP_FIXED or TEMP_GLOBAL. */
         g_assert_not_reached();
     }
-
-    tcg_debug_assert(ts->temp_allocated != 0);
-    ts->temp_allocated = 0;
-
-#if defined(CONFIG_DEBUG_TCG)
-    assert(s->temps_in_use > 0);
-    s->temps_in_use--;
-#endif
-
-    if (ts->kind == TEMP_EBB) {
-        int idx = temp_idx(ts);
-        set_bit(idx, s->free_temps[ts->base_type].l);
-    }
 }
 
 TCGTemp *tcg_constant_internal(TCGType type, int64_t val)
@@ -1477,27 +1460,6 @@ TCGv_i64 tcg_const_i64(int64_t val)
     return t0;
 }
 
-#if defined(CONFIG_DEBUG_TCG)
-void tcg_clear_temp_count(void)
-{
-    TCGContext *s = tcg_ctx;
-    s->temps_in_use = 0;
-}
-
-int tcg_check_temp_count(void)
-{
-    TCGContext *s = tcg_ctx;
-    if (s->temps_in_use) {
-        /* Clear the count so that we don't give another
-         * warning immediately next time around.
-         */
-        s->temps_in_use = 0;
-        return 1;
-    }
-    return 0;
-}
-#endif
-
 /* Return true if OP may appear in the opcode stream.
    Test the runtime variable that controls each opcode.  */
 bool tcg_op_supported(TCGOpcode op)
-- 
2.34.1


