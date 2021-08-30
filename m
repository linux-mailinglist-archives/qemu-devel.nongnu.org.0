Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E243FB152
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:43:29 +0200 (CEST)
Received: from localhost ([::1]:48830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKb0y-000241-O7
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajA-0003nP-Ju
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:04 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:35336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKaj8-0007U2-VY
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:04 -0400
Received: by mail-pl1-x636.google.com with SMTP id x16so6280668pll.2
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=iscoqGqYO3xbXiSWKEGOsSLJvb+F5x+TyO1DAWvp38U=;
 b=rP2LWICwlctzDAgJhaJkCu6rzaGT8ouBdV5sWc2LXp4DTd3+i7PiehNGeEukPL9qpF
 bvdNn9AJ/+WY4LFlidomV4pGvXhr2f7nNyC8mVJUCkeeWG1THEpwNUqdvGij3YAZOha9
 BuVQsfhg5yCaoNCJXNlqHIjXNLGS6H+avIcmbBrxdKCkMhomqPAfFOywR96Y+vW7Bb+m
 3awrftm4vAZ5EKSTrAPlw5nZSNH79R+p2O3VktzTPnTG+klTnhNacCPYCMiHme0mczbZ
 rRQjHDydP8MSsZlT5w1GyVUhVQNNx7/vnqc9himAm5JASrQ9HC8HhAHNlzBoX3kXz2Gh
 /kUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iscoqGqYO3xbXiSWKEGOsSLJvb+F5x+TyO1DAWvp38U=;
 b=uJD8P+X/r/kz/f6gdvBe4JfnRU8Ru6CKHPvfeGZLAtJtD0U9qO9tSu6X/voqu2wl4j
 zt1NmGTQOz29atyYwSjtdFgCDLLR863xdZ12cwJzSA3ap73cPS0njudjz7r3p32F1rjq
 wpB+/Mmi01GrPf/k0fGN/+PbwPsx6SRbwtvtV3bsRBoIi25n9vC6OsxI+bSi37yKhFTp
 3MVofluz4dJNrMXbAHmDX6YxpwcHWHNRo9gbp47oiXGDB2m0lJdRK6nopOoI8GmQSMp4
 qRYYqooKcpkjtytrG9XePGqanj8SdhifMWJvqh2E2FE4J9uYLeFk8QKECxgMSn5Wz5Rs
 tc/Q==
X-Gm-Message-State: AOAM532tIHdNilolVwqbKKK8zIr+HD+CS7WsYPQUjerpPnx2SsqSlpIu
 EY1JQTk+L2f52OncJGqyRQDkvZw8nqvPgg==
X-Google-Smtp-Source: ABdhPJyoFvXhxdHBkh656wXZcUzvFEKn0Ar+U7lTARLUrDOml3JyEb4rsX0evcfKu2r2OMqsx9qnKQ==
X-Received: by 2002:a17:90a:598e:: with SMTP id
 l14mr37190244pji.28.1630304701532; 
 Sun, 29 Aug 2021 23:25:01 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.25.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:25:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/48] tcg/optimize: Use a boolean to avoid a mass of continues
Date: Sun, 29 Aug 2021 23:24:16 -0700
Message-Id: <20210830062451.639572-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index d202515369..76f9772648 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -713,6 +713,7 @@ void tcg_optimize(TCGContext *s)
         uint64_t z_mask, partmask, affected, tmp;
         TCGOpcode opc = op->opc;
         const TCGOpDef *def;
+        bool done = false;
 
         /* Calls are special. */
         if (opc == INDEX_op_call) {
@@ -1212,8 +1213,8 @@ void tcg_optimize(TCGContext *s)
            allocator where needed and possible.  Also detect copies. */
         switch (opc) {
         CASE_OP_32_64_VEC(mov):
-            tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[1]);
-            continue;
+            done = tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[1]);
+            break;
 
         case INDEX_op_dup_vec:
             if (arg_is_const(op->args[1])) {
@@ -1602,7 +1603,9 @@ void tcg_optimize(TCGContext *s)
             break;
         }
 
-        finish_folding(&ctx, op);
+        if (!done) {
+            finish_folding(&ctx, op);
+        }
 
         /* Eliminate duplicate and redundant fence instructions.  */
         if (ctx.prev_mb) {
-- 
2.25.1


