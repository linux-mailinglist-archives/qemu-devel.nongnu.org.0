Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8855E6616D6
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 17:49:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEYqH-0006jB-EJ; Sun, 08 Jan 2023 11:48:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pEYqC-0006ed-Lk
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 11:48:13 -0500
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pEYqB-0000OX-0G
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 11:48:12 -0500
Received: by mail-qt1-x834.google.com with SMTP id h26so6187094qtu.2
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 08:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d92HqZO3HGiFOo1ukeBZZ1sHajJw5wbqCOY5xB+iG3Y=;
 b=i1T1hhedKv82+w3CXqbSpjPXjY44utNEg38vZv2h1443abOjQYcSJlSbwRADz5RxzL
 DtqnFau3spj+1JbhD6HY7j+e0sX+fHTl+YGuaXKAcCmCY8Y8hknN00ufrpORWRv0TKg/
 lQEqGA/o9B6QDL8/RDBYpjxaOh0oGbQx+pRYydew8PQFjUVf4kGN+7g9k/0lOeGLhKWz
 cNYLMcecep8SVJpAJkw7GlwC/kDc1xnQ+RWupehaGN/3vDR7tcCyCqjPIGEo5L9S9kGk
 H1k+kfo9fY8nHX2/2b4ptDF+jJf7AMkinDhD9JBU07QXnQsMe1ydizgbvEpCGQQHGgID
 4FEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d92HqZO3HGiFOo1ukeBZZ1sHajJw5wbqCOY5xB+iG3Y=;
 b=qVz2DxuJ1MQeRfp102jHReK1ge0tKFtU2dqb4MV/EU4+Wt7RK5u7E3eoyulePWfih8
 MFdrIfOtu21pBHszsiGbb+tZ6I+YHuH6rVB/EETCxVlTW+keoyrmVVJtWcgENvgU+Ag/
 09dcrbyA0bdeyuNKB/VXC+ZuaQA33iVRQShIb5HPJUplBmr/ou1OcjyEyxyQlikoZY74
 ZYQ5tvGEaN55ntVQtHy5xI3jBPeF2Zu5sanQR2VsDjmllltz1XeL4ar9CwIFPirn04jz
 pc5SOVfUy4au2rxU6Rryhuuyq8Sk1XLHcspRZEdMOB7iGhpC2QWYYgiXFtdqNApp4qLn
 kW2A==
X-Gm-Message-State: AFqh2ko0QuldFS2OUOoX9b1YfBQZwvBo3WIrUAHzLMCbpawkgaNhOp9j
 fgmWc3NBbVW4k6pAlc4IdkIqHYUeyI4kTRIYWm4G/g==
X-Google-Smtp-Source: AMrXdXtKIFpPDvDySKVHQC06IzxOpADUPEQv9FxYQ9uwIrUoiFCfO6cUF3HalYRlklke9wKRN+ONYw==
X-Received: by 2002:a05:622a:4d06:b0:3a9:9217:9e6c with SMTP id
 fd6-20020a05622a4d0600b003a992179e6cmr97761509qtb.55.1673196487264; 
 Sun, 08 Jan 2023 08:48:07 -0800 (PST)
Received: from localhost ([185.156.46.146]) by smtp.gmail.com with ESMTPSA id
 y19-20020a05620a44d300b006fba44843a5sm3944808qkp.52.2023.01.08.08.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 08:48:06 -0800 (PST)
From: Emilio Cota <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aaron Lindsay <aaron@os.amperecomputing.com>, Emilio Cota <cota@braap.org>
Subject: [PATCH 1/4] plugins: fix optimization in
 plugin_gen_disable_mem_helpers
Date: Sun,  8 Jan 2023 11:47:28 -0500
Message-Id: <20230108164731.61469-2-cota@braap.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108164731.61469-1-cota@braap.org>
References: <20230108164731.61469-1-cota@braap.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2607:f8b0:4864:20::834;
 envelope-from=cota@braap.org; helo=mail-qt1-x834.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

We were mistakenly checking tcg_ctx->plugin_insn as a canary to know
whether the TB had emitted helpers that might have accessed memory.

The problem is that tcg_ctx->plugin_insn gets updated on every
instruction in the TB, which results in us wrongly performing the
optimization (i.e. not clearing cpu->plugin_mem_cbs) way too often,
since it's not rare that the last instruction in the TB doesn't
use helpers.

Fix it by tracking a per-TB canary.

While at it, expand documentation.

Related: #1381

Signed-off-by: Emilio Cota <cota@braap.org>
---
 accel/tcg/plugin-gen.c | 26 ++++++++++++++++++--------
 include/qemu/plugin.h  |  7 +++++++
 2 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index c7d6514840..17a686bd9e 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -579,7 +579,8 @@ static void inject_mem_helper(TCGOp *begin_op, GArray *arr)
  * is possible that the code we generate after the instruction is
  * dead, we also add checks before generating tb_exit etc.
  */
-static void inject_mem_enable_helper(struct qemu_plugin_insn *plugin_insn,
+static void inject_mem_enable_helper(struct qemu_plugin_tb *ptb,
+                                     struct qemu_plugin_insn *plugin_insn,
                                      TCGOp *begin_op)
 {
     GArray *cbs[2];
@@ -599,6 +600,7 @@ static void inject_mem_enable_helper(struct qemu_plugin_insn *plugin_insn,
         rm_ops(begin_op);
         return;
     }
+    ptb->mem_helper = true;
 
     arr = g_array_sized_new(false, false,
                             sizeof(struct qemu_plugin_dyn_cb), n_cbs);
@@ -626,15 +628,22 @@ void plugin_gen_disable_mem_helpers(void)
 {
     TCGv_ptr ptr;
 
-    if (likely(tcg_ctx->plugin_insn == NULL ||
-               !tcg_ctx->plugin_insn->mem_helper)) {
+    /*
+     * We could emit the clearing unconditionally and be done. However, this can
+     * be wasteful if for instance plugins don't track memory accesses, or if
+     * most TBs don't use helpers. Instead, emit the clearing iff the TB calls
+     * helpers that might access guest memory.
+     *
+     * Note: we do not reset plugin_tb->mem_helper here; a TB might have several
+     * exit points, and we want to emit the clearing from all of them.
+     */
+    if (!tcg_ctx->plugin_tb->mem_helper) {
         return;
     }
     ptr = tcg_const_ptr(NULL);
     tcg_gen_st_ptr(ptr, cpu_env, offsetof(CPUState, plugin_mem_cbs) -
                                  offsetof(ArchCPU, env));
     tcg_temp_free_ptr(ptr);
-    tcg_ctx->plugin_insn->mem_helper = false;
 }
 
 static void plugin_gen_tb_udata(const struct qemu_plugin_tb *ptb,
@@ -682,14 +691,14 @@ static void plugin_gen_mem_inline(const struct qemu_plugin_tb *ptb,
     inject_inline_cb(cbs, begin_op, op_rw);
 }
 
-static void plugin_gen_enable_mem_helper(const struct qemu_plugin_tb *ptb,
+static void plugin_gen_enable_mem_helper(struct qemu_plugin_tb *ptb,
                                          TCGOp *begin_op, int insn_idx)
 {
     struct qemu_plugin_insn *insn = g_ptr_array_index(ptb->insns, insn_idx);
-    inject_mem_enable_helper(insn, begin_op);
+    inject_mem_enable_helper(ptb, insn, begin_op);
 }
 
-static void plugin_gen_disable_mem_helper(const struct qemu_plugin_tb *ptb,
+static void plugin_gen_disable_mem_helper(struct qemu_plugin_tb *ptb,
                                           TCGOp *begin_op, int insn_idx)
 {
     struct qemu_plugin_insn *insn = g_ptr_array_index(ptb->insns, insn_idx);
@@ -750,7 +759,7 @@ static void pr_ops(void)
 #endif
 }
 
-static void plugin_gen_inject(const struct qemu_plugin_tb *plugin_tb)
+static void plugin_gen_inject(struct qemu_plugin_tb *plugin_tb)
 {
     TCGOp *op;
     int insn_idx = -1;
@@ -870,6 +879,7 @@ bool plugin_gen_tb_start(CPUState *cpu, const DisasContextBase *db,
         ptb->haddr1 = db->host_addr[0];
         ptb->haddr2 = NULL;
         ptb->mem_only = mem_only;
+        ptb->mem_helper = false;
 
         plugin_gen_empty_callback(PLUGIN_GEN_FROM_TB);
     }
diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index a772e14193..e0ebedef84 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -118,7 +118,10 @@ struct qemu_plugin_insn {
     void *haddr;
     GArray *cbs[PLUGIN_N_CB_TYPES][PLUGIN_N_CB_SUBTYPES];
     bool calls_helpers;
+
+    /* if set, the instruction calls helpers that might access guest memory */
     bool mem_helper;
+
     bool mem_only;
 };
 
@@ -158,6 +161,10 @@ struct qemu_plugin_tb {
     void *haddr1;
     void *haddr2;
     bool mem_only;
+
+    /* if set, the TB calls helpers that might access guest memory */
+    bool mem_helper;
+
     GArray *cbs[PLUGIN_N_CB_SUBTYPES];
 };
 
-- 
2.34.1


