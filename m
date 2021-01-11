Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A12522F1C74
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 18:34:13 +0100 (CET)
Received: from localhost ([::1]:58118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz152-0006hj-Np
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 12:34:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0rh-0003GX-5Z
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:20:25 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:40730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0rd-0000Az-24
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:20:24 -0500
Received: by mail-pl1-x62b.google.com with SMTP id q4so177839plr.7
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 09:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HakP3QzMMgoP+5PWHWKQnZl86G7xrmBYKlGdyeWSyq0=;
 b=CLtHVyFlqzowouvrontOt6i3fEY3xqaDnFchEvmmMi3vvuZ0S0KFh6HYfkoSd0b1bZ
 W9CjU3ptNUhPP2zeXdH30HwHyhKdW9cs5qJEXKUECoKfS+rPwGIKizAGOZ3kw4fAWAGT
 A/bDbJcCd7FtS3uZj7L62xQ0s/C+iUL9zN8W6hFBWjfiTubDG5ohU/fcKP7IwWRUyuJu
 oMBrYQNHR7NDXPPc7r0t34823u6v8sXaQK/+P0xdOQiqNzC+L4oNbFujnEDR0cZfN6/a
 9A2ax0i72rr1mKtKoI0lg6+NY9iwHYR+Bn6eSGdAOiot64fnRdnGKA7Wh06e040uiy2S
 woPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HakP3QzMMgoP+5PWHWKQnZl86G7xrmBYKlGdyeWSyq0=;
 b=fWs055q9dMsi7XZ+rHHYbD1eFLKNyLL8ZNZaafdgdAKnk7JbzqqSp8EwkTm3jvhJFp
 aEiafK8e8vagQLBaEkMTqONEn/8LJCaqtQCkoyvyBan0879UqzPOwUfgnZQJmh5lCgiu
 CSKDGfstJ36axqQr8KYH6ph1DcXCyUH2JYswn/pm8lhCzXqExRO7yXNQLxqSZLVABG3P
 M38NiZ9DrptnzsJmeI14h1WXgmPu8d0V1GV6O4mIFKZWRnp5Axs3J/UkKr7qz8uOT6PI
 XVt1xai70UINCSCrnOyS0qX5SLcneoU6sjoxAVGmSIbBw1ANW3s400zXHh3QRCxnJiP/
 CKFg==
X-Gm-Message-State: AOAM532BiNZjCn695tUS+YxGQ2bEcqJqk58RjrkFxYxrWCIlzKypl39j
 HvbNFQL0gpVR0YU1DcYUcX94tl2Jn9727w==
X-Google-Smtp-Source: ABdhPJyrcVOFZMsCKCHBf+ucxD5VA8dfghBujeZtCuH3S8uGFhXCm/ECGnyKKxTHhcH5NzOYnOvXKg==
X-Received: by 2002:a17:90a:300c:: with SMTP id g12mr312264pjb.4.1610385614680; 
 Mon, 11 Jan 2021 09:20:14 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id k64sm206666pfd.75.2021.01.11.09.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 09:20:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 15/23] tcg: Use tcg_constant_{i32,i64} with tcg plugins
Date: Mon, 11 Jan 2021 07:19:38 -1000
Message-Id: <20210111171946.219469-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111171946.219469-1-richard.henderson@linaro.org>
References: <20210111171946.219469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/plugin-gen.c | 49 +++++++++++++++++++-----------------------
 1 file changed, 22 insertions(+), 27 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 51580d51a0..e5dc9d0ca9 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -284,8 +284,8 @@ static TCGOp *copy_extu_i32_i64(TCGOp **begin_op, TCGOp *op)
     if (TCG_TARGET_REG_BITS == 32) {
         /* mov_i32 */
         op = copy_op(begin_op, op, INDEX_op_mov_i32);
-        /* movi_i32 */
-        op = copy_op(begin_op, op, INDEX_op_movi_i32);
+        /* mov_i32 w/ $0 */
+        op = copy_op(begin_op, op, INDEX_op_mov_i32);
     } else {
         /* extu_i32_i64 */
         op = copy_op(begin_op, op, INDEX_op_extu_i32_i64);
@@ -306,39 +306,34 @@ static TCGOp *copy_mov_i64(TCGOp **begin_op, TCGOp *op)
     return op;
 }
 
-static TCGOp *copy_movi_i64(TCGOp **begin_op, TCGOp *op, uint64_t v)
-{
-    if (TCG_TARGET_REG_BITS == 32) {
-        /* 2x movi_i32 */
-        op = copy_op(begin_op, op, INDEX_op_movi_i32);
-        op->args[1] = v;
-
-        op = copy_op(begin_op, op, INDEX_op_movi_i32);
-        op->args[1] = v >> 32;
-    } else {
-        /* movi_i64 */
-        op = copy_op(begin_op, op, INDEX_op_movi_i64);
-        op->args[1] = v;
-    }
-    return op;
-}
-
 static TCGOp *copy_const_ptr(TCGOp **begin_op, TCGOp *op, void *ptr)
 {
     if (UINTPTR_MAX == UINT32_MAX) {
-        /* movi_i32 */
-        op = copy_op(begin_op, op, INDEX_op_movi_i32);
-        op->args[1] = (uintptr_t)ptr;
+        /* mov_i32 */
+        op = copy_op(begin_op, op, INDEX_op_mov_i32);
+        op->args[1] = tcgv_i32_arg(tcg_constant_i32((uintptr_t)ptr));
     } else {
-        /* movi_i64 */
-        op = copy_movi_i64(begin_op, op, (uint64_t)(uintptr_t)ptr);
+        /* mov_i64 */
+        op = copy_op(begin_op, op, INDEX_op_mov_i64);
+        op->args[1] = tcgv_i64_arg(tcg_constant_i64((uintptr_t)ptr));
     }
     return op;
 }
 
 static TCGOp *copy_const_i64(TCGOp **begin_op, TCGOp *op, uint64_t v)
 {
-    return copy_movi_i64(begin_op, op, v);
+    if (TCG_TARGET_REG_BITS == 32) {
+        /* 2x mov_i32 */
+        op = copy_op(begin_op, op, INDEX_op_mov_i32);
+        op->args[1] = tcgv_i32_arg(tcg_constant_i32(v));
+        op = copy_op(begin_op, op, INDEX_op_mov_i32);
+        op->args[1] = tcgv_i32_arg(tcg_constant_i32(v >> 32));
+    } else {
+        /* mov_i64 */
+        op = copy_op(begin_op, op, INDEX_op_mov_i64);
+        op->args[1] = tcgv_i64_arg(tcg_constant_i64(v));
+    }
+    return op;
 }
 
 static TCGOp *copy_extu_tl_i64(TCGOp **begin_op, TCGOp *op)
@@ -486,8 +481,8 @@ static TCGOp *append_mem_cb(const struct qemu_plugin_dyn_cb *cb,
 
     tcg_debug_assert(type == PLUGIN_GEN_CB_MEM);
 
-    /* const_i32 == movi_i32 ("info", so it remains as is) */
-    op = copy_op(&begin_op, op, INDEX_op_movi_i32);
+    /* const_i32 == mov_i32 ("info", so it remains as is) */
+    op = copy_op(&begin_op, op, INDEX_op_mov_i32);
 
     /* const_ptr */
     op = copy_const_ptr(&begin_op, op, cb->userp);
-- 
2.25.1


