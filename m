Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C29067A0EA
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 19:09:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNi6-0005rI-Ub; Tue, 24 Jan 2023 13:07:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhG-0004yk-6M
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:03 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhD-00073h-CL
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:01 -0500
Received: by mail-wr1-x429.google.com with SMTP id e3so14697215wru.13
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 10:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kicu2o7DliK9NIrjxHX2SYsQRxeUGLNQgh1V/I/tfuk=;
 b=c0q+eM7wHxnoHder73creO8u6wW6XHcaMHVuqAGuq+kfL6t0txTLBYk/KiggZ1mxQ5
 3aJ/XlEbjdsRJJWI/D/52oYCY207Ef778QKXGBc/vI+6mo1lwWp/lGbMLavDnE5VEVzq
 EjBVmmYd69bg6Oc7KOxwz5+digdnhWrSB/jAIUgKhmoSyHrA/VbfsHI9H+6Bg0Bd/VhQ
 wZL9SnFx2v4Ms8wSc86AtPnRAQHj+P/CFklUMLno32jJvj0SDKpFXTIr+863WvMoXkH+
 i9cLEV6/shLWkjrveFNRuvaIAB+/E3zjEBEmH1S3xoeX5yEV95HwJNqCVHXUE4JGEWVc
 uXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kicu2o7DliK9NIrjxHX2SYsQRxeUGLNQgh1V/I/tfuk=;
 b=CG/IBeQ2l9kxhCxwBW4IQTTQjWtfEYxcYYpa/xtICkv/HhzQPwTWOdta1JXcMga+U4
 26zq4jLi+bpppBZDLVYB5w4m/B2l3x3oZglSGnjUTCDDRmyTr7ai2OyQ0ZUCbBPtGgUk
 QEuEBocnIujAxSFf93oWH2E8SCkTaG4gq/JrdTVY2r3KalbfYsyWAmb2SG6fUHNI8CfE
 XAhcAu9Ba1+3y6x+q2AOn/dhGgS0cCEuwO2MWqXG+L1hB2o4Wyqdacaj6tu25oSWpc2f
 uqLpHbDAzFjv302THlJ+LXwKH8SXoEX7IuHANyDwdj8LAB7JbWnFMlFIwzxa05Hcw0Dl
 Smhg==
X-Gm-Message-State: AFqh2kqKfEmjBkvwNWmR1ypNhYynLljZWVGj8C8Qrci8E6wr8jPTTDA2
 kFYliiy/psubMz65ta7IHM8uZw==
X-Google-Smtp-Source: AMrXdXvX+OvzHrrmXwSsNed0VeDY06APaOatgcmts+xt3GdxQstZXrdT37qsd0ydxBdPjsGFJUCCgQ==
X-Received: by 2002:a5d:6b0e:0:b0:2bd:e13f:48b8 with SMTP id
 v14-20020a5d6b0e000000b002bde13f48b8mr25960250wrw.3.1674583617056; 
 Tue, 24 Jan 2023 10:06:57 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a05600012ca00b002bfb02153d1sm2308716wrx.45.2023.01.24.10.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:06:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 54FCB1FFB8;
 Tue, 24 Jan 2023 18:01:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, qemu-arm@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Emilio Cota <cota@braap.org>
Subject: [PATCH v2 31/35] plugins: fix optimization in
 plugin_gen_disable_mem_helpers
Date: Tue, 24 Jan 2023 18:01:23 +0000
Message-Id: <20230124180127.1881110-32-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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


