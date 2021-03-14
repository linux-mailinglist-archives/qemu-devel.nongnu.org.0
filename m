Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D523D33A832
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 22:29:27 +0100 (CET)
Received: from localhost ([::1]:59220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLYIg-0007eu-Re
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 17:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYGr-0005rJ-Ha
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:33 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:33549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYGp-00088n-Ma
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:33 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id o19so912010qvu.0
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 14:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zo0Axh7LGw4WyjdfTcLkZAEZsIuFs0M9C89s4USb0+Y=;
 b=J4bpnwoOfkGpQRujYf8iLjvJiFiu4UYjzuUuMke84vAvSVt2cWST5J/Sgms13yWBFf
 qD1J/97G4rCqQ4dCnL0xgjQSMjC51JlNYiwSH/Koz0YdsBPgv1b+qsfhAj+YGtOG8rOt
 8haoJvwGCpqEQtuFMM/aPWBYlNAJ3OPDyZj3HjtuP88f/GzCNVmzrgM/hJEf3t7b+1sB
 NHwV7TKPViPcqKXmhg8ZrbnwobNLTZ5XvaqOO78N/QqWGpg5tnh2ikHtK42aJFn0Zhtw
 2u0/gOHNdbNoGYzWnJYiTt2fWiKm7yqtRU7U3WNfJtDM8NTX/NQ+j0BFN2tqMnd7n9EL
 U9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zo0Axh7LGw4WyjdfTcLkZAEZsIuFs0M9C89s4USb0+Y=;
 b=L1YfYpE6FygjE/Y7B9N9EByiuuX4ZgJbPLfdBMb/tiCaNiDDyQSpGciWtE34PUw8uB
 bdzxvp5bCaQ4veCjdum4YkS+8U4OmAnP7lSGfih4GKegSgZ195OzniEqHIndIiH5EiND
 kT53sCWckZJr+Cy6zbfCKUzR/BstZNHudRhPF4ojEyvr9PJSgwhbIh0G5oPhY6/wkDrX
 w9mzUivPHkM5IVvSlH/d/PkeQrWx+H7MCMfKLIXyCWnb3H+6GeGCAgV616Jmh2wGRqAF
 g+WoXYUV75Y2fGOHbk7ew94V7FS1c6Ok04V89x0oP0Im3/AlHAYdcLQ/8MLhYNEeHzc5
 oFHw==
X-Gm-Message-State: AOAM531fxzYmpMZhLqZLI/BsXbb6MGi0cBOM0xDwt5ZziZyzI8TA4Ukk
 lrTzsQbmfLIY/3iZxwDCfct0K5zBTkq8mzqr
X-Google-Smtp-Source: ABdhPJzls4RSh/Hekj9uKHkMPlPbkwcBO72k8B8JeR/OFeqR674+DUTqQVHn6H4qUBf9gH2SVj6OGg==
X-Received: by 2002:a0c:e84d:: with SMTP id l13mr7839422qvo.28.1615757250676; 
 Sun, 14 Mar 2021 14:27:30 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t2sm9337749qtd.13.2021.03.14.14.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 14:27:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/29] tcg: Re-order tcg_region_init vs tcg_prologue_init
Date: Sun, 14 Mar 2021 15:26:58 -0600
Message-Id: <20210314212724.1917075-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314212724.1917075-1-richard.henderson@linaro.org>
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
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
index f32df8b240..b9057567f4 100644
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
index 4f4746dce8..1bc48ca954 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -850,7 +850,6 @@ int main(int argc, char **argv, char **envp)
        generating the prologue until now so that the prologue can take
        the real value of GUEST_BASE into account.  */
     tcg_prologue_init(tcg_ctx);
-    tcg_region_init();
 
     target_cpu_copy_regs(env, regs);
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 2991112829..0a2e5710de 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1204,32 +1204,18 @@ TranslationBlock *tcg_tb_alloc(TCGContext *s)
 
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
@@ -1246,32 +1232,32 @@ void tcg_prologue_init(TCGContext *s)
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
@@ -1285,7 +1271,7 @@ void tcg_prologue_init(TCGContext *s)
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


