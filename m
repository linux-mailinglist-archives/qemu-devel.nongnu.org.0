Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EB6397613
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:07:44 +0200 (CEST)
Received: from localhost ([::1]:49990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo5zb-0002yU-4T
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tO-0002FS-Fg
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:18 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:37465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tM-0002VR-IM
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:18 -0400
Received: by mail-il1-x12b.google.com with SMTP id x9so8119585ilp.4
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 08:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F31qAQ0X6VEkNhOZZ066R8viH3nO1w9CAnxcuOecYdg=;
 b=cO1FI4uIDf9frllQ29Z6cGoHBLeQHZ2q15ElFMUZ4C9g+VroLYIW1Zf/MY8hV6e0LE
 RVKHcMTaRZYB9mitpfV5EqBAPFuPrjv7yddIKSgLg7E/2ikHCWbR2j4ZREjFMT/lOZOB
 5mqoALVo9F3v87fZC8zZhJMjrAwfUwrbvEjOLJXxsjwq8xe6lbZewuvijXums22kKfcd
 NM5T1RPrSkkhkfzVtjvK1a48bVYbJf5UII246Cqlo9REe99SKaFjpfTXB3ou3Sj2irfA
 W8RVBTB+Qw4oQn+x/JwKbohFjCAIIOuOKJoY+t1j0g2FuOwF5g+WemrvVROBNrJ1rm2n
 PdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F31qAQ0X6VEkNhOZZ066R8viH3nO1w9CAnxcuOecYdg=;
 b=CP81Idf2oUHc14ivU+HoCEFXwHdi7+jZuEJPIN4a8rMPIG14AHr+wjtiE6v9tTF7w+
 RcZ98VvGqT8GW3z5Ba9TS1DwJgmP2LecYz8C0GmdiZG2kYZGbkFE2cqJ7jXr0Fzt7jOj
 IjmTBGHjnVis1BTrLr0GNTRwI6ONxdQsrOJNprrfGCnF5WE6LeG7utedF1/glcI6tpVP
 BZDqsBUWqPhyRpTRnC5UiIeREbPZnADJP6nJl4c8J8JK3Nwk3J8Tgz6TRl+xy1BrWezO
 AZAvl3zPdZDgkV+FdOjml4A+4r3X5DAU7Oosi6DX9+uR+rJo3sdp0oFAeNSkQLRF2jjv
 cpJg==
X-Gm-Message-State: AOAM532RdtIV0LkjnSuW9hj72fHLe7KfrRXcoOtZLt9h6ZP5jUGcBARV
 zmw905T5mqNatEy3lp10/vlQdOchWo4TUTMO
X-Google-Smtp-Source: ABdhPJxnrg+7RvxEJBmVuJ+BzZvnBFf5ZvMFfCF6/lp0KmaXwI7JMbgC8WcaJnyL7cF1CKFjJ9pAfQ==
X-Received: by 2002:a05:6e02:1111:: with SMTP id
 u17mr10369580ilk.307.1622559675549; 
 Tue, 01 Jun 2021 08:01:15 -0700 (PDT)
Received: from localhost.localdomain
 ([2607:fb90:806c:3e8a:9cf0:b3be:5e07:b99f])
 by smtp.gmail.com with ESMTPSA id f8sm4109909ilj.37.2021.06.01.08.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 08:01:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 04/27] plugins: Drop tcg_flags from struct
 qemu_plugin_dyn_cb
Date: Tue,  1 Jun 2021 08:00:43 -0700
Message-Id: <20210601150106.12761-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601150106.12761-1-richard.henderson@linaro.org>
References: <20210601150106.12761-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12b.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As noted by qemu-plugins.h, enum qemu_plugin_cb_flags is
currently unused -- plugins can neither read nor write
guest registers.

Cc: Alex Bennée <alex.bennee@linaro.org>
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


