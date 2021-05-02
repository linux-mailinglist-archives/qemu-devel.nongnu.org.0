Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFC1370FB6
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:21:10 +0200 (CEST)
Received: from localhost ([::1]:34858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLOf-0001ct-O7
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMS-0008Bd-Oe
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:18:52 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:42948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMP-0002qb-Iu
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:18:52 -0400
Received: by mail-pg1-x52b.google.com with SMTP id m12so2442936pgr.9
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Kr/Q5Rp+D/puQ2m1VQCJ8sEPTdRSEK7blwecPZuFo+Q=;
 b=iiJcnhI5wKoANxzKF5zj9QbMyga3ZpZ5YA452dUeNw2O/+vFoQT0JFyfxGy8qk67Hq
 tNi1v1fbjJmeN0vTM1ULtwo2JM6urCYw4gl6mq4mm45o4YTvrbd13Xs3Od2LFnTM6T3+
 W2nSdWtRjVXjvOXsxDDOV6A44FRCEaXuQoWSd0+4DgyeGh4uHNuIP8hF16SqQ3BuU7N2
 2SO1eGa7PfIJLPO8XTcUza0aoS+emENhJCTfmx+38MA9Xz3upuWyaUeycvwSqWU6xAkH
 6UZf5v7TPusyllBh81B2cG5VtH1z7VZ9r0KvUOWq+/BLYoaWpbvjSuwxNfHayjooOlhZ
 KEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kr/Q5Rp+D/puQ2m1VQCJ8sEPTdRSEK7blwecPZuFo+Q=;
 b=RFybpVaKkXB5BklFU2HVApQiNwGuFo21OUAiXAEvUi9RdVoFOhXKbYJLPU55BauZCR
 tLxWNo1kgriX9H6Vt2NXknsQsG+eX8gKOGfzukbh0jrllH84Eik7NXsrRplfVRKlBnEm
 t6l0p7SSXvQKikbl+JMuLslK+A319CBGWRtnQJpHuKleQ30uPzGhH45XDqLS+oFo7ROF
 jaz3corHzmdxejfMpnE6aiKY+GqSlspwE7RP/ZSYO+DYtRRIMqrQKNejMuoNAKWfZl+n
 ArlxggueDKvqdnceFRJiY5N//e0P+v7xe5R/EcMW/DFCSBWUJ1TYz560hbCnwV58IWBx
 Y0Hg==
X-Gm-Message-State: AOAM533MHkpi4YDFytfUL7kPqQ9Fleb9An/Y1mZjbG2mK7yLP+/fEcLA
 l1E/JZZz0KwsdJbtmb7fuqRC2FlObSXz7w==
X-Google-Smtp-Source: ABdhPJzmqml54+twSxwCkufxTXBUOKzpM4en6VPrW3BIq2k4W7xkKbb4tT9e1UO5SXucMp5XMsCK3A==
X-Received: by 2002:a65:6a0d:: with SMTP id m13mr15831312pgu.43.1619997528163; 
 Sun, 02 May 2021 16:18:48 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm7146236pfa.68.2021.05.02.16.18.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:18:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/28] tcg: Re-order tcg_region_init vs tcg_prologue_init
Date: Sun,  2 May 2021 16:18:19 -0700
Message-Id: <20210502231844.1977630-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502231844.1977630-1-richard.henderson@linaro.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of delaying tcg_region_init until after tcg_prologue_init
is complete, do tcg_region_init first and let tcg_prologue_init
shrink the first region by the size of the generated prologue.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-all.c       | 11 ---------
 accel/tcg/translate-all.c |  3 +++
 bsd-user/main.c           |  1 -
 linux-user/main.c         |  1 -
 tcg/tcg.c                 | 52 ++++++++++++++-------------------------
 5 files changed, 22 insertions(+), 46 deletions(-)

diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index e378c2db73..f132033999 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -111,17 +111,6 @@ static int tcg_init(MachineState *ms)
 
     tcg_exec_init(s->tb_size * 1024 * 1024, s->splitwx_enabled);
     mttcg_enabled = s->mttcg_enabled;
-
-    /*
-     * Initialize TCG regions only for softmmu.
-     *
-     * This needs to be done later for user mode, because the prologue
-     * generation needs to be delayed so that GUEST_BASE is already set.
-     */
-#ifndef CONFIG_USER_ONLY
-    tcg_region_init();
-#endif /* !CONFIG_USER_ONLY */
-
     return 0;
 }
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index b12d0898d0..9841eb3fb6 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1339,6 +1339,9 @@ void tcg_exec_init(unsigned long tb_size, int splitwx)
                                splitwx, &error_fatal);
     assert(ok);
 
+    /* TODO: allocating regions is hand-in-glove with code_gen_buffer. */
+    tcg_region_init();
+
 #if defined(CONFIG_SOFTMMU)
     /* There's no guest base to take into account, so go ahead and
        initialize the prologue now.  */
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 798aba512c..3669d2b89e 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -994,7 +994,6 @@ int main(int argc, char **argv)
        generating the prologue until now so that the prologue can take
        the real value of GUEST_BASE into account.  */
     tcg_prologue_init(tcg_ctx);
-    tcg_region_init();
 
     /* build Task State */
     memset(ts, 0, sizeof(TaskState));
diff --git a/linux-user/main.c b/linux-user/main.c
index f956afccab..746d842b58 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -874,7 +874,6 @@ int main(int argc, char **argv, char **envp)
        generating the prologue until now so that the prologue can take
        the real value of GUEST_BASE into account.  */
     tcg_prologue_init(tcg_ctx);
-    tcg_region_init();
 
     target_cpu_copy_regs(env, regs);
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 1fbe0b686d..795a71ff25 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1209,32 +1209,18 @@ TranslationBlock *tcg_tb_alloc(TCGContext *s)
 
 void tcg_prologue_init(TCGContext *s)
 {
-    size_t prologue_size, total_size;
-    void *buf0, *buf1;
+    size_t prologue_size;
 
     /* Put the prologue at the beginning of code_gen_buffer.  */
-    buf0 = s->code_gen_buffer;
-    total_size = s->code_gen_buffer_size;
-    s->code_ptr = buf0;
-    s->code_buf = buf0;
+    tcg_region_assign(s, 0);
+    s->code_ptr = s->code_gen_ptr;
+    s->code_buf = s->code_gen_ptr;
     s->data_gen_ptr = NULL;
 
-    /*
-     * The region trees are not yet configured, but tcg_splitwx_to_rx
-     * needs the bounds for an assert.
-     */
-    region.start = buf0;
-    region.end = buf0 + total_size;
-
 #ifndef CONFIG_TCG_INTERPRETER
-    tcg_qemu_tb_exec = (tcg_prologue_fn *)tcg_splitwx_to_rx(buf0);
+    tcg_qemu_tb_exec = (tcg_prologue_fn *)tcg_splitwx_to_rx(s->code_ptr);
 #endif
 
-    /* Compute a high-water mark, at which we voluntarily flush the buffer
-       and start over.  The size here is arbitrary, significantly larger
-       than we expect the code generation for any one opcode to require.  */
-    s->code_gen_highwater = s->code_gen_buffer + (total_size - TCG_HIGHWATER);
-
 #ifdef TCG_TARGET_NEED_POOL_LABELS
     s->pool_labels = NULL;
 #endif
@@ -1251,32 +1237,32 @@ void tcg_prologue_init(TCGContext *s)
     }
 #endif
 
-    buf1 = s->code_ptr;
+    prologue_size = tcg_current_code_size(s);
+
 #ifndef CONFIG_TCG_INTERPRETER
-    flush_idcache_range((uintptr_t)tcg_splitwx_to_rx(buf0), (uintptr_t)buf0,
-                        tcg_ptr_byte_diff(buf1, buf0));
+    flush_idcache_range((uintptr_t)tcg_splitwx_to_rx(s->code_buf),
+                        (uintptr_t)s->code_buf, prologue_size);
 #endif
 
-    /* Deduct the prologue from the buffer.  */
-    prologue_size = tcg_current_code_size(s);
-    s->code_gen_ptr = buf1;
-    s->code_gen_buffer = buf1;
-    s->code_buf = buf1;
-    total_size -= prologue_size;
-    s->code_gen_buffer_size = total_size;
+    /* Deduct the prologue from the first region.  */
+    region.start = s->code_ptr;
 
-    tcg_register_jit(tcg_splitwx_to_rx(s->code_gen_buffer), total_size);
+    /* Recompute boundaries of the first region. */
+    tcg_region_assign(s, 0);
+
+    tcg_register_jit(tcg_splitwx_to_rx(region.start),
+                     region.end - region.start);
 
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_OUT_ASM)) {
         FILE *logfile = qemu_log_lock();
         qemu_log("PROLOGUE: [size=%zu]\n", prologue_size);
         if (s->data_gen_ptr) {
-            size_t code_size = s->data_gen_ptr - buf0;
+            size_t code_size = s->data_gen_ptr - s->code_gen_ptr;
             size_t data_size = prologue_size - code_size;
             size_t i;
 
-            log_disas(buf0, code_size);
+            log_disas(s->code_gen_ptr, code_size);
 
             for (i = 0; i < data_size; i += sizeof(tcg_target_ulong)) {
                 if (sizeof(tcg_target_ulong) == 8) {
@@ -1290,7 +1276,7 @@ void tcg_prologue_init(TCGContext *s)
                 }
             }
         } else {
-            log_disas(buf0, prologue_size);
+            log_disas(s->code_gen_ptr, prologue_size);
         }
         qemu_log("\n");
         qemu_log_flush();
-- 
2.25.1


