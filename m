Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D94F43BE0F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:43:59 +0200 (CEST)
Received: from localhost ([::1]:47834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfW6o-0006pv-72
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVaG-0003Lg-92
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:21 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:37438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVa8-00020o-GA
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:19 -0400
Received: by mail-pl1-x636.google.com with SMTP id n11so652568plf.4
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3jpxULOVdIgL0Mnirkv2EuUv8fHOKVVpG1kUJouTiHI=;
 b=RbBpcjubvQ4TUS+qLOcDBEYOMG5Lj38yCc/tUzuPU9sz8u4v2UEMbtJZKL5UnxaV5P
 qzUkjzKbcgKjvhCkcQq0zzlpBVpe8Yo6hJDyKQw4+QrP5otr96ZWU4lM0wQxG0ya3VK+
 7lGQZ/miH8ZwgHkkVgASjHOFM+irw0KL48e1WUHTalqk7pRg3wOOM2ueIJXxtpUriLou
 J4i88mFwU5wtAMRPljL/aWE2tg7VfWmZDX8MhBMHSuy6O6YTtGYaPDrs9d8wjXfJKpuF
 OsfR0r0iZl95FkIOCXz5d5OOgCiIHxD6Ck4xz7dxhhjzAegQWd4KVOGZMVE18yIq6ir4
 /8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3jpxULOVdIgL0Mnirkv2EuUv8fHOKVVpG1kUJouTiHI=;
 b=HeuBUpYcdcanIPqnn/g8e0ATlRvm0ujj0vCDkD52Hjnh/7Id2BpmvnKaeltF/KjFdV
 h+uUq+Dsbc+IgE1WsluPac9XrxJ12ylRtb/G0Os2OqCwtAySMr84sziAOdeu3SPIiWIb
 rmqclfqG1XgnvFnZvehRwDjsuN+48sp89MzUC0njBvl58lS3e+bsP59ZuU32P5L5QjZ3
 b1KWY22f/L48qQDoL/CMlP8IWHPek0GZyz8dkIksqtA1iolCx0Ri35L9mCiWElJfpM2U
 A/W0S0vUYrim3DwxIT0e8Yl9rhod2E1TmYRJCzXAa2PpA3ezNl70nmvlZcJ3J6OxOcD2
 Q33w==
X-Gm-Message-State: AOAM533lgiC5QzLcCfkKpzxcu0aRK9NpjNEjaxxykheUBm4GWxPfi+xC
 qGpKrkkEJaLELXPkdbbsFQKhVIySFy4B0A==
X-Google-Smtp-Source: ABdhPJxpEBekMdbVIOkj1gRI6wUHTs2rvJsqSBD0CLAiF7MFPoYxOgBYugwNnw4/lsxvHw0jrE5NDg==
X-Received: by 2002:a17:902:b691:b029:12d:2b6:d116 with SMTP id
 c17-20020a170902b691b029012d02b6d116mr24210351pls.71.1635289811214; 
 Tue, 26 Oct 2021 16:10:11 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:10:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 29/51] tcg/optimize: Split out fold_mov
Date: Tue, 26 Oct 2021 16:09:21 -0700
Message-Id: <20211026230943.1225890-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the final entry in the main switch that was in a
different form.  After this, we have the option to convert
the switch into a function dispatch table.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 8524fe1f8a..5f1bd7cd78 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1015,6 +1015,11 @@ static bool fold_mb(OptContext *ctx, TCGOp *op)
     return true;
 }
 
+static bool fold_mov(OptContext *ctx, TCGOp *op)
+{
+    return tcg_opt_gen_mov(ctx, op, op->args[0], op->args[1]);
+}
+
 static bool fold_movcond(OptContext *ctx, TCGOp *op)
 {
     TCGOpcode opc = op->opc;
@@ -1748,20 +1753,11 @@ void tcg_optimize(TCGContext *s)
             break;
         }
 
-        /* Propagate constants through copy operations and do constant
-           folding.  Constants will be substituted to arguments by register
-           allocator where needed and possible.  Also detect copies. */
+        /*
+         * Process each opcode.
+         * Sorted alphabetically by opcode as much as possible.
+         */
         switch (opc) {
-        CASE_OP_32_64_VEC(mov):
-            done = tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[1]);
-            break;
-
-        default:
-            break;
-
-        /* ---------------------------------------------------------- */
-        /* Sorted alphabetically by opcode as much as possible. */
-
         CASE_OP_32_64_VEC(add):
             done = fold_add(&ctx, op);
             break;
@@ -1831,6 +1827,9 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_mb:
             done = fold_mb(&ctx, op);
             break;
+        CASE_OP_32_64_VEC(mov):
+            done = fold_mov(&ctx, op);
+            break;
         CASE_OP_32_64(movcond):
             done = fold_movcond(&ctx, op);
             break;
@@ -1900,6 +1899,8 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(xor):
             done = fold_xor(&ctx, op);
             break;
+        default:
+            break;
         }
 
         if (!done) {
-- 
2.25.1


