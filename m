Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DA6370FF7
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 02:02:01 +0200 (CEST)
Received: from localhost ([::1]:36622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldM2C-0004Cf-Re
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 20:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLxv-0007W5-UJ
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:35 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:46672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLxt-0000XC-2L
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:35 -0400
Received: by mail-pf1-x42d.google.com with SMTP id q2so2953078pfh.13
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7WC6aCWBiBkIVX6YSHl8xz2aqS3rr1eaXPkREHwIVTY=;
 b=uIqAvuRhG4MMPOUXz4Ukl+go2zngHwBcPDaIs3VZuymwtuvvGjz7SuTMZqrQ5tIiTN
 BrmidV57H2ZkWmj2ZlahOrZ2VXr35qFCrsjlCIaKDB2qNZtjSRIr9xB8rw5TZroXuIEk
 IqHDwQrfhvw3iwUi6LoUoWZzvpp0Tj++rBZxaJAcocRGQEn9QCdcRZAlYtHcWjhVnkbP
 /tnLGtY6W7aZPbMQYiBFyhnjxhZcO4HLpvRKwdnNlglC9abuHw4XipocJiAX4VsnYvrA
 Malk9lKI2vVmn/6LzPsVmYpMQX6HC4LPz4+NE0CBMvlS60286wktd2nHTr3U+K/bUasC
 aJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7WC6aCWBiBkIVX6YSHl8xz2aqS3rr1eaXPkREHwIVTY=;
 b=XBTGUf/P3auXmQZ6pO38gAl6enedAsWGLpEO8Tof3BukNEZIILg8fl/LUUpxCZscwO
 +exOsmlAk1FHqShIMaHb6oJT0oojc/+CUil3hQawbY2AUVII973XhmtndwhdDNvI3jy/
 4/L+3tKc+9Sz/pqG3anjPfidiOpbwom3yZCqol4fCT5wlmLgewoEyJ2GAPQ59JWQkJYk
 sjeD6J75n5aLw6IACviErIL0q0+y1GwdlSQ0kC4wltPvnr4VqAkq4rmurag2NjwkJ4e1
 XveLExkDf+UIup7K6yI+da62CXSzSCEV8eqZ5SGMOpBEYMVHuGbhgeUvJNhULO5kag04
 T0FQ==
X-Gm-Message-State: AOAM533dDgAwdttVDu3To55gdp13G9tdsAJNlvxf2x6qRwcArVHFE7Jj
 +/NDqnTEjsG26OkwYfiCyZ+2FBYx9B6jKQ==
X-Google-Smtp-Source: ABdhPJzHc70rnaS3NF3MAdi8RDcKGvbS2RWbEHayUSUjTaSt9S+eMIBwtbXwuV8k8/SJinFj7NtIqA==
X-Received: by 2002:aa7:83d8:0:b029:249:79c9:fd49 with SMTP id
 j24-20020aa783d80000b029024979c9fd49mr16587787pfn.72.1619999851683; 
 Sun, 02 May 2021 16:57:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t184sm8098054pgt.32.2021.05.02.16.57.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:57:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 04/26] plugins: Drop tcg_flags from struct
 qemu_plugin_dyn_cb
Date: Sun,  2 May 2021 16:57:05 -0700
Message-Id: <20210502235727.1979457-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502235727.1979457-1-richard.henderson@linaro.org>
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

As noted by qemu-plugins.h, enum qemu_plugin_cb_flags is
currently unused -- plugins can neither read nor write
guest registers.

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
index eb99be52d0..1e7f201cd2 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -385,7 +385,7 @@ static TCGOp *copy_st_ptr(TCGOp **begin_op, TCGOp *op)
 }
 
 static TCGOp *copy_call(TCGOp **begin_op, TCGOp *op, void *empty_func,
-                        void *func, unsigned tcg_flags, int *cb_idx)
+                        void *func, int *cb_idx)
 {
     /* copy all ops until the call */
     do {
@@ -412,7 +412,7 @@ static TCGOp *copy_call(TCGOp **begin_op, TCGOp *op, void *empty_func,
         tcg_debug_assert(i < MAX_OPC_PARAM_ARGS);
     }
     op->args[*cb_idx] = (uintptr_t)func;
-    op->args[*cb_idx + 1] = tcg_flags;
+    op->args[*cb_idx + 1] = (*begin_op)->args[*cb_idx + 1];
 
     return op;
 }
@@ -439,7 +439,7 @@ static TCGOp *append_udata_cb(const struct qemu_plugin_dyn_cb *cb,
 
     /* call */
     op = copy_call(&begin_op, op, HELPER(plugin_vcpu_udata_cb),
-                   cb->f.vcpu_udata, cb->tcg_flags, cb_idx);
+                   cb->f.vcpu_udata, cb_idx);
 
     return op;
 }
@@ -490,7 +490,7 @@ static TCGOp *append_mem_cb(const struct qemu_plugin_dyn_cb *cb,
     if (type == PLUGIN_GEN_CB_MEM) {
         /* call */
         op = copy_call(&begin_op, op, HELPER(plugin_vcpu_mem_cb),
-                       cb->f.vcpu_udata, cb->tcg_flags, cb_idx);
+                       cb->f.vcpu_udata, cb_idx);
     }
 
     return op;
diff --git a/plugins/core.c b/plugins/core.c
index 87b823bbc4..03e0a4c806 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -297,33 +297,15 @@ void plugin_register_inline_op(GArray **arr,
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
@@ -338,7 +320,7 @@ void plugin_register_vcpu_mem_cb(GArray **arr,
 
     dyn_cb = plugin_get_dyn_cb(arr);
     dyn_cb->userp = udata;
-    dyn_cb->tcg_flags = cb_to_tcg_flags(flags);
+    /* Note flags are discarded as unused. */
     dyn_cb->type = PLUGIN_CB_REGULAR;
     dyn_cb->rw = rw;
     dyn_cb->f.generic = cb;
-- 
2.25.1


