Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F04523ADB3C
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:17:31 +0200 (CEST)
Received: from localhost ([::1]:33674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufX9-0003fk-1i
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUh-0000dR-C1
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:14:59 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:40604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUf-0002DR-7X
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:14:59 -0400
Received: by mail-pf1-x42e.google.com with SMTP id q192so3785959pfc.7
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OeLRNKnSJRWwobrAkPzoaUrmD8xwClpaPzu+CpkjnbQ=;
 b=agl3FJWIRG00NOqapEFBJmruUMYVlbMjIj8jP0ZXYlCkB/yqEHWc53TMfUDh9fOaNE
 GHgu+JYj/uaetmue6ynmiRuJ5nfo2ChW8UXvKa3jjlF6EB2SvXFxc+r2tvzKXgwXqOZs
 p7NC6nC0TlS/H5ykHsT70aVKGYlbzeueBMqgAktVhqAPbZ6JmoV3BW4FAnO5okAwDZfz
 zLW1KsFCVs+muRVqu7yrc4gz0yNaMWmGz2T4fauO7fkCe1HFV61IEFNQJ3TH+1ZsAp5g
 psVRG7wsTCnFcNqvHUZPAzJ1VWq3CfviOmmQ4KZuRKVnFca1j23EFO22+qHXYD4pOpKQ
 mpyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OeLRNKnSJRWwobrAkPzoaUrmD8xwClpaPzu+CpkjnbQ=;
 b=nuRyne+q6cXDuf/c6WKSAWsopBR4zLtuXkZpXO2LwRzWYFlLhOd3p+0etHo81zzjGB
 ZWxD/qQFvtvqK2rDZDQ04eh7ENyhMafLA/j7LHDD7+FR3nU0eZFtJqzxpQ7iZ97DLAVb
 Fv+nrpwZFl58s+PNtJLOBH+3wloojfeBM0h5uOj4c+OKL1iGcE6WHoLrSE8v44y07ZxC
 i668a7oHHkviDtf4wiNJ151FoymkY/bglDE7g2PKSROC3Hvmrs7Ye6l0HznRq9UGTAdx
 STkhM/XUK94A/9A3ud1W6RCuaJXmAJ8xCvCL+mKOe/S7ApkJ59hEdQourGxamKWeb3Fj
 hyTg==
X-Gm-Message-State: AOAM532FiNhlxBzTC1Y5VgGih3Fo+/cQ6YckJQGxY6iCM1SBndW+LL+H
 ZrqswtRo6Kx2Bg/bu9KOzD4V9kEZ9wKY4w==
X-Google-Smtp-Source: ABdhPJxL0smQN/f6jia4xfdpq54HH58IqIEnFU9c7tETDWT0YU00tctlsxXtxgpXw9547FPPZlGtkQ==
X-Received: by 2002:a63:1e1e:: with SMTP id e30mr6900617pge.149.1624126495676; 
 Sat, 19 Jun 2021 11:14:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k35sm12059113pgi.21.2021.06.19.11.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 11:14:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/33] plugins: Drop tcg_flags from struct qemu_plugin_dyn_cb
Date: Sat, 19 Jun 2021 11:14:23 -0700
Message-Id: <20210619181452.877683-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619181452.877683-1-richard.henderson@linaro.org>
References: <20210619181452.877683-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As noted by qemu-plugins.h, enum qemu_plugin_cb_flags is
currently unused -- plugins can neither read nor write
guest registers.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/plugin-helpers.h |  1 -
 include/qemu/plugin.h      |  1 -
 accel/tcg/plugin-gen.c     |  8 ++++----
 plugins/core.c             | 30 ++++++------------------------
 4 files changed, 10 insertions(+), 30 deletions(-)

diff --git a/accel/tcg/plugin-helpers.h b/accel/tcg/plugin-helpers.h
index 1916ee7920..853bd21677 100644
--- a/accel/tcg/plugin-helpers.h
+++ b/accel/tcg/plugin-helpers.h
@@ -1,5 +1,4 @@
 #ifdef CONFIG_PLUGIN
-/* Note: no TCG flags because those are overwritten later */
 DEF_HELPER_2(plugin_vcpu_udata_cb, void, i32, ptr)
 DEF_HELPER_4(plugin_vcpu_mem_cb, void, i32, i32, i64, ptr)
 #endif
diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index c5a79a89f0..0fefbc6084 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -79,7 +79,6 @@ enum plugin_dyn_cb_subtype {
 struct qemu_plugin_dyn_cb {
     union qemu_plugin_cb_sig f;
     void *userp;
-    unsigned tcg_flags;
     enum plugin_dyn_cb_subtype type;
     /* @rw applies to mem callbacks only (both regular and inline) */
     enum qemu_plugin_mem_rw rw;
diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 48bd2f36f0..88e25c6df9 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -384,7 +384,7 @@ static TCGOp *copy_st_ptr(TCGOp **begin_op, TCGOp *op)
 }
 
 static TCGOp *copy_call(TCGOp **begin_op, TCGOp *op, void *empty_func,
-                        void *func, unsigned tcg_flags, int *cb_idx)
+                        void *func, int *cb_idx)
 {
     /* copy all ops until the call */
     do {
@@ -411,7 +411,7 @@ static TCGOp *copy_call(TCGOp **begin_op, TCGOp *op, void *empty_func,
         tcg_debug_assert(i < MAX_OPC_PARAM_ARGS);
     }
     op->args[*cb_idx] = (uintptr_t)func;
-    op->args[*cb_idx + 1] = tcg_flags;
+    op->args[*cb_idx + 1] = (*begin_op)->args[*cb_idx + 1];
 
     return op;
 }
@@ -438,7 +438,7 @@ static TCGOp *append_udata_cb(const struct qemu_plugin_dyn_cb *cb,
 
     /* call */
     op = copy_call(&begin_op, op, HELPER(plugin_vcpu_udata_cb),
-                   cb->f.vcpu_udata, cb->tcg_flags, cb_idx);
+                   cb->f.vcpu_udata, cb_idx);
 
     return op;
 }
@@ -489,7 +489,7 @@ static TCGOp *append_mem_cb(const struct qemu_plugin_dyn_cb *cb,
     if (type == PLUGIN_GEN_CB_MEM) {
         /* call */
         op = copy_call(&begin_op, op, HELPER(plugin_vcpu_mem_cb),
-                       cb->f.vcpu_udata, cb->tcg_flags, cb_idx);
+                       cb->f.vcpu_udata, cb_idx);
     }
 
     return op;
diff --git a/plugins/core.c b/plugins/core.c
index 55d188af51..e1bcdb570d 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -295,33 +295,15 @@ void plugin_register_inline_op(GArray **arr,
     dyn_cb->inline_insn.imm = imm;
 }
 
-static inline uint32_t cb_to_tcg_flags(enum qemu_plugin_cb_flags flags)
-{
-    uint32_t ret;
-
-    switch (flags) {
-    case QEMU_PLUGIN_CB_RW_REGS:
-        ret = 0;
-        break;
-    case QEMU_PLUGIN_CB_R_REGS:
-        ret = TCG_CALL_NO_WG;
-        break;
-    case QEMU_PLUGIN_CB_NO_REGS:
-    default:
-        ret = TCG_CALL_NO_RWG;
-    }
-    return ret;
-}
-
-inline void
-plugin_register_dyn_cb__udata(GArray **arr,
-                              qemu_plugin_vcpu_udata_cb_t cb,
-                              enum qemu_plugin_cb_flags flags, void *udata)
+void plugin_register_dyn_cb__udata(GArray **arr,
+                                   qemu_plugin_vcpu_udata_cb_t cb,
+                                   enum qemu_plugin_cb_flags flags,
+                                   void *udata)
 {
     struct qemu_plugin_dyn_cb *dyn_cb = plugin_get_dyn_cb(arr);
 
     dyn_cb->userp = udata;
-    dyn_cb->tcg_flags = cb_to_tcg_flags(flags);
+    /* Note flags are discarded as unused. */
     dyn_cb->f.vcpu_udata = cb;
     dyn_cb->type = PLUGIN_CB_REGULAR;
 }
@@ -336,7 +318,7 @@ void plugin_register_vcpu_mem_cb(GArray **arr,
 
     dyn_cb = plugin_get_dyn_cb(arr);
     dyn_cb->userp = udata;
-    dyn_cb->tcg_flags = cb_to_tcg_flags(flags);
+    /* Note flags are discarded as unused. */
     dyn_cb->type = PLUGIN_CB_REGULAR;
     dyn_cb->rw = rw;
     dyn_cb->f.generic = cb;
-- 
2.25.1


