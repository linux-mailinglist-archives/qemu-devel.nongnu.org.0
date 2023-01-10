Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D54526647B5
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 18:51:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFIbE-0003by-Oi; Tue, 10 Jan 2023 12:39:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIb8-0003Xt-Hx
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:42 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIb3-0001FA-DK
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:42 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso10710559wmq.1
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 09:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kicu2o7DliK9NIrjxHX2SYsQRxeUGLNQgh1V/I/tfuk=;
 b=v9pZScaXYw5pWWMxBkvH94FPLOVUQwV2i2FdnAlbEv/tdMTUn8XNz9dxUuzoZ6dShc
 Q1SAdOQoS2V1ai6HtomZFMqyizFAUqzusgS5/I27a/e2mCUFAmuIg7pp5gGkCXOKdJFI
 krzR1ISCPTZK5R/JdeQhmwYPjtR9OWOf5TmhjV48Veu5NNF+NP9uKUL9F/8o3fousDOI
 EcD2F5KgMu9u999Ws5FZfDmgtjWXXKQdOc6qhPv3c73tlJXWdQP5QRw7H55o/AiA4eAF
 +dy6ACBmD0m8256MgnwX9Z8N7EdVLH77BwIYWLW5k5vA0XnqRNgkTUqv59mIg9T5VdxH
 9KhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kicu2o7DliK9NIrjxHX2SYsQRxeUGLNQgh1V/I/tfuk=;
 b=YYO9JwIpjC9FPjZVmH8jL6ptN0iEFg7lO1cbRpsjDcwQGrK7y7gghe/Gp9hcuQo/Vb
 nonmTJK4l0vmruKuPhvE6Prx46Gg0pVLRq3dcnvOaS7XsnNxLLm45LxhlWuwTMDF6Jiq
 tkShsQbaUXFvaN705L3almLPnUn7ZvxE6h3b2+cNajARULVH7LiTxWtZ9LevQeTUCQuT
 pWR9K6LZeaWm9aMu9gXzjg/lhMr8qGYiRsZqelNwYZ85vvOiVUbY3cqDhmTel+xeuXgp
 LAdl1a7VY2m1xPu2gAMFycen0yQeU92EZH/OJTfa5NPbiUY+1MKLjTkOmrl5gaT368CQ
 yKmA==
X-Gm-Message-State: AFqh2krVEWBm8j51CUlC7JTkRrL/MPFMsajF8hXBekB0RT3x5OzJupE3
 5bzGM4FR0Pf371YMI3exTY3UdUi3CkptzQXu
X-Google-Smtp-Source: AMrXdXua2T88gdyXDMizSlSuyr/jr2pI5EWfDXfv8RP6o2Vszicms6UD8WqC9cVMIvJ5Gi5GP0pbZA==
X-Received: by 2002:a05:600c:18a1:b0:3d2:3ec4:7eed with SMTP id
 x33-20020a05600c18a100b003d23ec47eedmr53404540wmp.10.1673372376666; 
 Tue, 10 Jan 2023 09:39:36 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a1c5408000000b003da065105c9sm13487wmb.40.2023.01.10.09.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 09:39:36 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C82001FFB8;
 Tue, 10 Jan 2023 17:39:25 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Ed Maste <emaste@freebsd.org>, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 John G Johnson <john.g.johnson@oracle.com>, Emilio Cota <cota@braap.org>
Subject: [PATCH 23/26] plugins: fix optimization in
 plugin_gen_disable_mem_helpers
Date: Tue, 10 Jan 2023 17:39:19 +0000
Message-Id: <20230110173922.265055-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110173922.265055-1-alex.bennee@linaro.org>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Emilio Cota <cota@braap.org>

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
Message-Id: <20230108164731.61469-2-cota@braap.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/plugin.h  |  7 +++++++
 accel/tcg/plugin-gen.c | 26 ++++++++++++++++++--------
 2 files changed, 25 insertions(+), 8 deletions(-)

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
-- 
2.34.1


