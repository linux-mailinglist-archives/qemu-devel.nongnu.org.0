Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3592D2DD3C9
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:10:25 +0100 (CET)
Received: from localhost ([::1]:56730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpuv9-00034c-Uj
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:10:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpudt-0003Na-UT
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:35 -0500
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:35438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpudn-0004u0-Vg
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:33 -0500
Received: by mail-ot1-x335.google.com with SMTP id i6so27535579otr.2
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 06:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f2WSteXPwYnIE0v0wh60wUMuRbrW6fX7jCUzcHiVN5w=;
 b=YRSSX5xnyx0sSgvb8eGcit0yRYkp+jfjtNzPqLP6c66lt5Qlthcyt3+K7ug4gNpJTP
 1Ny/EtXNSa6p+uhpFNoj8vaAfTyFWEYvGxnQU+q1YX/TUe9OTwkuPckp8HwA5ncLD6tO
 j5A6jAtjcsatObTEXcfw9vqsSWFQWdMY/lxDp1mn9J0e9Eg+teOUkF3hynsI9oR9W4Lv
 sXrwLK3BM7IskNpBp97BbKyK3I1GlEvV9Qpi+0DLhwD91jFhxMo8kDsdgDVgAr99Yg/I
 7GEWKpkajWDpJ2xKpe79mIfNDjzzuWQbtQlxMOr2xVQ1krXPaY4xjvVquMMbA060BWSb
 LaRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f2WSteXPwYnIE0v0wh60wUMuRbrW6fX7jCUzcHiVN5w=;
 b=Hdwmoa57sOr7Fo8tVapHz7aNEQb/kDUcYlafkm92nWjRc3rVgislJkVfUkM+sw30N/
 tO7fDqV/tYWwI9Qv7/pEOrwYmeliTfzxnp7rpYiL4IB920bA6/ke+652ZX9BKGEbZPeO
 XirH2Ulm38F70AUu+I8dh0HuLgrT9+p6WQNTl+FP84jFOFMzpS+sF6OlpkFQ/Xqirdyb
 Oqa+E3m4yY7y9ogww8fx2l7a6H2dP3o7U8+fKKqcsshFJqSefAdDNp0IXdQzkF8OK3o8
 f353FjUdU967lhUR0uRhQXlABjSeJyNKOKd9ErY+GR1dtVYgPEmNMp6goA10qmd9234P
 jfrg==
X-Gm-Message-State: AOAM530/qkwCbQ29my7mYEyq0JExbLwJrP8n7Bmj8YzN4sTxoCz4vUsE
 SdMfcOqjmuF3Rid40d5yb8mAAxnclgqdl6U4
X-Google-Smtp-Source: ABdhPJyr00FnmV+WinFs8RsZgmr2hwJCWp+5zn4KIIRMh4zvVbw8sDdIFoebrEodvL2ced+5dj/Lxw==
X-Received: by 2002:a05:6830:1657:: with SMTP id
 h23mr30118402otr.184.1608216741921; 
 Thu, 17 Dec 2020 06:52:21 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id x130sm1136342oif.3.2020.12.17.06.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 06:52:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/23] tcg: Add temp_readonly
Date: Thu, 17 Dec 2020 08:51:56 -0600
Message-Id: <20201217145215.534637-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201217145215.534637-1-richard.henderson@linaro.org>
References: <20201217145215.534637-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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

In most, but not all, places that we check for TEMP_FIXED,
we are really testing that we do not modify the temporary.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h |  5 +++++
 tcg/tcg.c         | 21 ++++++++++-----------
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 30bd525d83..9a9ced3b15 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -681,6 +681,11 @@ struct TCGContext {
     target_ulong gen_insn_data[TCG_MAX_INSNS][TARGET_INSN_START_WORDS];
 };
 
+static inline bool temp_readonly(TCGTemp *ts)
+{
+    return ts->kind == TEMP_FIXED;
+}
+
 extern TCGContext tcg_init_ctx;
 extern __thread TCGContext *tcg_ctx;
 extern TCGv_env cpu_env;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 07a25e59b6..54619c1cbc 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3200,7 +3200,7 @@ static void temp_load(TCGContext *, TCGTemp *, TCGRegSet, TCGRegSet, TCGRegSet);
    mark it free; otherwise mark it dead.  */
 static void temp_free_or_dead(TCGContext *s, TCGTemp *ts, int free_or_dead)
 {
-    if (ts->kind == TEMP_FIXED) {
+    if (temp_readonly(ts)) {
         return;
     }
     if (ts->val_type == TEMP_VAL_REG) {
@@ -3224,7 +3224,7 @@ static inline void temp_dead(TCGContext *s, TCGTemp *ts)
 static void temp_sync(TCGContext *s, TCGTemp *ts, TCGRegSet allocated_regs,
                       TCGRegSet preferred_regs, int free_or_dead)
 {
-    if (ts->kind == TEMP_FIXED) {
+    if (temp_readonly(ts)) {
         return;
     }
     if (!ts->mem_coherent) {
@@ -3407,8 +3407,7 @@ static void temp_save(TCGContext *s, TCGTemp *ts, TCGRegSet allocated_regs)
 {
     /* The liveness analysis already ensures that globals are back
        in memory. Keep an tcg_debug_assert for safety. */
-    tcg_debug_assert(ts->val_type == TEMP_VAL_MEM
-                     || ts->kind == TEMP_FIXED);
+    tcg_debug_assert(ts->val_type == TEMP_VAL_MEM || temp_readonly(ts));
 }
 
 /* save globals to their canonical location and assume they can be
@@ -3488,7 +3487,7 @@ static void tcg_reg_alloc_do_movi(TCGContext *s, TCGTemp *ots,
                                   TCGRegSet preferred_regs)
 {
     /* ENV should not be modified.  */
-    tcg_debug_assert(ots->kind != TEMP_FIXED);
+    tcg_debug_assert(!temp_readonly(ots));
 
     /* The movi is not explicitly generated here.  */
     if (ots->val_type == TEMP_VAL_REG) {
@@ -3528,7 +3527,7 @@ static void tcg_reg_alloc_mov(TCGContext *s, const TCGOp *op)
     ts = arg_temp(op->args[1]);
 
     /* ENV should not be modified.  */
-    tcg_debug_assert(ots->kind != TEMP_FIXED);
+    tcg_debug_assert(!temp_readonly(ots));
 
     /* Note that otype != itype for no-op truncation.  */
     otype = ots->type;
@@ -3589,7 +3588,7 @@ static void tcg_reg_alloc_mov(TCGContext *s, const TCGOp *op)
                  * Store the source register into the destination slot
                  * and leave the destination temp as TEMP_VAL_MEM.
                  */
-                assert(ots->kind != TEMP_FIXED);
+                assert(!temp_readonly(ots));
                 if (!ts->mem_allocated) {
                     temp_allocate_frame(s, ots);
                 }
@@ -3626,7 +3625,7 @@ static void tcg_reg_alloc_dup(TCGContext *s, const TCGOp *op)
     its = arg_temp(op->args[1]);
 
     /* ENV should not be modified.  */
-    tcg_debug_assert(ots->kind != TEMP_FIXED);
+    tcg_debug_assert(!temp_readonly(ots));
 
     itype = its->type;
     vece = TCGOP_VECE(op);
@@ -3858,7 +3857,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
             ts = arg_temp(arg);
 
             /* ENV should not be modified.  */
-            tcg_debug_assert(ts->kind != TEMP_FIXED);
+            tcg_debug_assert(!temp_readonly(ts));
 
             if (arg_ct->oalias && !const_args[arg_ct->alias_index]) {
                 reg = new_args[arg_ct->alias_index];
@@ -3899,7 +3898,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
         ts = arg_temp(op->args[i]);
 
         /* ENV should not be modified.  */
-        tcg_debug_assert(ts->kind != TEMP_FIXED);
+        tcg_debug_assert(!temp_readonly(ts));
 
         if (NEED_SYNC_ARG(i)) {
             temp_sync(s, ts, o_allocated_regs, 0, IS_DEAD_ARG(i));
@@ -4031,7 +4030,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
         ts = arg_temp(arg);
 
         /* ENV should not be modified.  */
-        tcg_debug_assert(ts->kind != TEMP_FIXED);
+        tcg_debug_assert(!temp_readonly(ts));
 
         reg = tcg_target_call_oarg_regs[i];
         tcg_debug_assert(s->reg_to_temp[reg] == NULL);
-- 
2.25.1


