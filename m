Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477412F572C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 03:22:00 +0100 (CET)
Received: from localhost ([::1]:45742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzsGt-0008L3-97
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 21:21:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCC-0003Jk-IC
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:08 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:44603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCA-0003OI-Nk
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:08 -0500
Received: by mail-pl1-x62c.google.com with SMTP id r4so2128983pls.11
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 18:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YpDNiHW+o2iNjUonn03i++LfISaZVtNqCD0CIRtryeM=;
 b=hTCnrVLieh1AdfZur6mt7/4aqb2IYuq+A6eGXOMK8meNXUBTmDFJ+tgBH0QBRiTJBO
 c/FvApDpkI0fZhUq/7r7j2OuNpWlRdP/BoPUoOvqw0OeYfImO7XtnuOvGtNdV7opqNcw
 yvhg5z9v+GZs9CGo5KOnG9JnrevmeFCDDxbPG9/lfTMwOSEsWS5Kv8/GsTtLiQi6Q9/O
 sLG+XRTYsJIds8/eMt5w64mUdBNxMSKMbVlxMYd0FLXLUUd8ve1THWslmxSG3QRYyYrT
 dViuQxIfnqaayHgK+/frtZIOpmvGP0gXEUsgrGh2KPK5poxaYRNj+bavVu3CwckCWXKw
 Y5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YpDNiHW+o2iNjUonn03i++LfISaZVtNqCD0CIRtryeM=;
 b=J7omKF5pUZer+EQQ9uDFEJijOp8O/e731N9v8lHlsIVrUxXaft+3SzfbfAGFqqffOi
 0Y4ajhHoBAjcdhOf12FkeRtpzSk6e7Nw2w2MpClssVO5oibvPONS04TcXeTsTob+LV7f
 UjfpuSAyVnOFslrrqFm1tuvcbVHethoeuFO4D+ASnprKZs3u52RrXRdS7UlREmR2bKJM
 9qVJSLxAC/Y01OF26UsaKjjVGo1OtfG7l8CVowyTcbeMdvjYiRQ342aWTSS/MOtojGdn
 NmlnHZfYTEG4Uo5R9I2ivzMmk63BrF28AeKUX/McK6Z0IOlsoFuyBKjFFvRSrhohFKzk
 bMIQ==
X-Gm-Message-State: AOAM5324Dcj6mbwgRyL+jG8/KE6q1TSXkEvFTRhSUA0Vpbukt2vsQiIX
 7Gt11cvon/JCvVRv6lJ226FvED0owmIfsQ==
X-Google-Smtp-Source: ABdhPJwh/kYr1F2HGm22n7ZFcagY+kH30slxilC3rkn+ECvajGBRyyT49ijy63go2iSBvPirJvmRew==
X-Received: by 2002:a17:90a:454e:: with SMTP id
 r14mr2501853pjm.194.1610590624956; 
 Wed, 13 Jan 2021 18:17:04 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id i7sm3771687pfc.50.2021.01.13.18.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 18:17:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/24] tcg: Add temp_readonly
Date: Wed, 13 Jan 2021 16:16:34 -1000
Message-Id: <20210114021654.647242-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114021654.647242-1-richard.henderson@linaro.org>
References: <20210114021654.647242-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
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
index 571d4e0fa3..2bdaeaa69c 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -679,6 +679,11 @@ struct TCGContext {
     target_ulong gen_insn_data[TCG_MAX_INSNS][TARGET_INSN_START_WORDS];
 };
 
+static inline bool temp_readonly(TCGTemp *ts)
+{
+    return ts->kind == TEMP_FIXED;
+}
+
 extern TCGContext tcg_init_ctx;
 extern __thread TCGContext *tcg_ctx;
 extern const void *tcg_code_gen_epilogue;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 143794a585..e02bb71953 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3254,7 +3254,7 @@ static void temp_load(TCGContext *, TCGTemp *, TCGRegSet, TCGRegSet, TCGRegSet);
    mark it free; otherwise mark it dead.  */
 static void temp_free_or_dead(TCGContext *s, TCGTemp *ts, int free_or_dead)
 {
-    if (ts->kind == TEMP_FIXED) {
+    if (temp_readonly(ts)) {
         return;
     }
     if (ts->val_type == TEMP_VAL_REG) {
@@ -3278,7 +3278,7 @@ static inline void temp_dead(TCGContext *s, TCGTemp *ts)
 static void temp_sync(TCGContext *s, TCGTemp *ts, TCGRegSet allocated_regs,
                       TCGRegSet preferred_regs, int free_or_dead)
 {
-    if (ts->kind == TEMP_FIXED) {
+    if (temp_readonly(ts)) {
         return;
     }
     if (!ts->mem_coherent) {
@@ -3461,8 +3461,7 @@ static void temp_save(TCGContext *s, TCGTemp *ts, TCGRegSet allocated_regs)
 {
     /* The liveness analysis already ensures that globals are back
        in memory. Keep an tcg_debug_assert for safety. */
-    tcg_debug_assert(ts->val_type == TEMP_VAL_MEM
-                     || ts->kind == TEMP_FIXED);
+    tcg_debug_assert(ts->val_type == TEMP_VAL_MEM || temp_readonly(ts));
 }
 
 /* save globals to their canonical location and assume they can be
@@ -3542,7 +3541,7 @@ static void tcg_reg_alloc_do_movi(TCGContext *s, TCGTemp *ots,
                                   TCGRegSet preferred_regs)
 {
     /* ENV should not be modified.  */
-    tcg_debug_assert(ots->kind != TEMP_FIXED);
+    tcg_debug_assert(!temp_readonly(ots));
 
     /* The movi is not explicitly generated here.  */
     if (ots->val_type == TEMP_VAL_REG) {
@@ -3582,7 +3581,7 @@ static void tcg_reg_alloc_mov(TCGContext *s, const TCGOp *op)
     ts = arg_temp(op->args[1]);
 
     /* ENV should not be modified.  */
-    tcg_debug_assert(ots->kind != TEMP_FIXED);
+    tcg_debug_assert(!temp_readonly(ots));
 
     /* Note that otype != itype for no-op truncation.  */
     otype = ots->type;
@@ -3643,7 +3642,7 @@ static void tcg_reg_alloc_mov(TCGContext *s, const TCGOp *op)
                  * Store the source register into the destination slot
                  * and leave the destination temp as TEMP_VAL_MEM.
                  */
-                assert(ots->kind != TEMP_FIXED);
+                assert(!temp_readonly(ots));
                 if (!ts->mem_allocated) {
                     temp_allocate_frame(s, ots);
                 }
@@ -3680,7 +3679,7 @@ static void tcg_reg_alloc_dup(TCGContext *s, const TCGOp *op)
     its = arg_temp(op->args[1]);
 
     /* ENV should not be modified.  */
-    tcg_debug_assert(ots->kind != TEMP_FIXED);
+    tcg_debug_assert(!temp_readonly(ots));
 
     itype = its->type;
     vece = TCGOP_VECE(op);
@@ -3912,7 +3911,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
             ts = arg_temp(arg);
 
             /* ENV should not be modified.  */
-            tcg_debug_assert(ts->kind != TEMP_FIXED);
+            tcg_debug_assert(!temp_readonly(ts));
 
             if (arg_ct->oalias && !const_args[arg_ct->alias_index]) {
                 reg = new_args[arg_ct->alias_index];
@@ -3953,7 +3952,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
         ts = arg_temp(op->args[i]);
 
         /* ENV should not be modified.  */
-        tcg_debug_assert(ts->kind != TEMP_FIXED);
+        tcg_debug_assert(!temp_readonly(ts));
 
         if (NEED_SYNC_ARG(i)) {
             temp_sync(s, ts, o_allocated_regs, 0, IS_DEAD_ARG(i));
@@ -4085,7 +4084,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
         ts = arg_temp(arg);
 
         /* ENV should not be modified.  */
-        tcg_debug_assert(ts->kind != TEMP_FIXED);
+        tcg_debug_assert(!temp_readonly(ts));
 
         reg = tcg_target_call_oarg_regs[i];
         tcg_debug_assert(s->reg_to_temp[reg] == NULL);
-- 
2.25.1


