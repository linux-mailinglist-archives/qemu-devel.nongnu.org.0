Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8414767C9D3
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:25:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0Lk-0004Mk-0N; Thu, 26 Jan 2023 06:23:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LS-0002kY-Oy
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:06 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LQ-00045J-Mn
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:06 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 o17-20020a05600c511100b003db021ef437so888662wms.4
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WMKYhd9TX4wsL34GOByCJGYMOpnSk1b4tc7gsSxzvRM=;
 b=u+5u2p4vaAWZr4f07Nh1y32VBVlmmLzft3qPns81O99Jczdvi8izkMn2TrtA+8tz57
 9PIV925RFtCVuStjDs/64XHdRcjiHa0r338mku6nhddTsgp1NweGWzQ0EH6HE15V0rRG
 XeKovDuzFw+Ta1RwQVvsxfNVpjxMrr/H02MsF6GwgSca5ZesgUxzKxCk96EchPHnaLqL
 XPcZfAkK6Z+69GbxXy40ZNzElevQ0THZ5gk5zSqLkep7XEgdAKYa1E2MtL86Qt6wyRXW
 ozzT53V7IaRdFU7kaDREdDMI1YUYoTeeY6c30q2TewVZgFJNDJz7g2wQ+so4+r495yPb
 s6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WMKYhd9TX4wsL34GOByCJGYMOpnSk1b4tc7gsSxzvRM=;
 b=jE9iSdLLBz4SkNmKnhKNBxmPO5RGtgUAA74Xn6fhSmIhIrFnVDVi70d3n4W1uiKd23
 GhCDR0L8LlWvie1uIaPQ5BIx+4mJ4lrTujriQCpVKetqexVS/jgjS1Hq/SPeR/PA5zZw
 s/liiOfwvgkOmDDxBUGtRy3VQEfEb13M+YsXCgsRMPCi9geO9cUgTcLTYBcJdph8VXVi
 PDu0hj0xaKyPFcdN0AaqZXQK06sJ6U7tn0FJQvbLqNzh1bLFvl45fm/TXdfNAU9Dx4Q7
 5wxTZjD0HUHRvdzLrqvp1+OllEc83eHYE0tTqQuzwPRPJEyoP0ShGqbDSdTEqafrF6+3
 22Hw==
X-Gm-Message-State: AFqh2koxyNFmEGdiCrrYFykLwvWYiGm6d7euaEOiZ+uKsE3YflAC1UYb
 wv3IOwus8Fx5qVDGc6CtniMK9Q==
X-Google-Smtp-Source: AMrXdXu+rXsdcIS7n6ZqqodQl2U1TiOLPHiMH55I2vt48raKK0LUBoZiQ3XtWQh9ZfZe5744USP6+A==
X-Received: by 2002:a05:600c:1e1f:b0:3db:e13:750c with SMTP id
 ay31-20020a05600c1e1f00b003db0e13750cmr33608407wmb.29.1674732183037; 
 Thu, 26 Jan 2023 03:23:03 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a05600c2e0700b003dafa04ecc4sm1170327wmf.6.2023.01.26.03.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:23:01 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 706421FFCE;
 Thu, 26 Jan 2023 11:22:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Emilio Cota <cota@braap.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 31/35] plugins: fix optimization in
 plugin_gen_disable_mem_helpers
Date: Thu, 26 Jan 2023 11:22:46 +0000
Message-Id: <20230126112250.2584701-32-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Message-Id: <20230124180127.1881110-32-alex.bennee@linaro.org>

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


