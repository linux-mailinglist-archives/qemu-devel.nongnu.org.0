Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC4F425D16
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:18:48 +0200 (CEST)
Received: from localhost ([::1]:52562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZqp-0006Ps-F9
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZUC-0000Oi-Hj
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:26 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:47088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZU2-0007Eq-6d
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:21 -0400
Received: by mail-pf1-x436.google.com with SMTP id u7so6202667pfg.13
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=95qg0iVCC4yKW1hO/4nRddX4+htlroVuYAkjBYfvk1o=;
 b=Vx6wJZdzs7FyyivsG5PDtt8LtdkEaB1w7X3wbaEZMWTWcad8QIiXliFfJXr+uPLftU
 BqlFhvLUyXaEFJrqAh9rdXmygfobHSB3xuF9O2B54PO7a5jLJt03LDwfidJ8JC2nilrn
 ae3enGfyBZle3aVhZfO3nP0CJq/lER64BPa57knOusU8WW0une4ExZEVuMVDdxM6woqi
 JmOLkKmyD9XK1n7gcZfkaCdz2MOIIRMHalSXRMXOk7grp86r9UisdRkPGSCJs7PKD852
 jNs3JDh6yoaBqQwoC6glRog1sthvdxGHN9OAhgo3hAyQJMB3PTM/en0Az0BKj5awU3Cx
 ClIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=95qg0iVCC4yKW1hO/4nRddX4+htlroVuYAkjBYfvk1o=;
 b=ThXJkDMRi1jFFn+EjoHwOAAOsrx2SHKcPu6sd3ZjlLo4A7xzYfkKIGQusRT4qmyedJ
 wotdSbcRY9sG3Sh4I9vsuZ/z0UMkPuInAXPGJNXMEOfzxFq5YAttRqHTdsOrRAYaY/Tf
 8dN7I0baEPSnA5FUJx9iitaI7dUFslBxjzuYST87thZsQeixB0cFgfPMOQgLFtz67wOL
 MNnEXcrUozSHUOloF4SsRnp0Gfa2Hv+zeV4x+/N0BuFAbm7W0mEXv47WN6OUdYrZMcMp
 K9Y03QZ3lvghVSSN6miSmtvgDpd7TjPp6P3le2Or+XT8rVuI7iDERy3bUOb8gEbPdClX
 VESw==
X-Gm-Message-State: AOAM531AwsCDQOMkxhSDooM8DNJEcLzvU0nHEhKbyifJVj2bPTO7LAKI
 EjgRs3iF/RbWK6tKlpuhZryOxv3a3iMQAQ==
X-Google-Smtp-Source: ABdhPJyytn1ujP/Zeux0QUGkQP8USCG5LxMq4TMTMK5MPXFsij3VP4Ph07XbtflNYJjqxqBRDL+A0g==
X-Received: by 2002:a05:6a00:23c8:b0:44c:d139:f3a4 with SMTP id
 g8-20020a056a0023c800b0044cd139f3a4mr2285535pfc.31.1633636512309; 
 Thu, 07 Oct 2021 12:55:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/48] tcg/optimize: Split out fold_mulu2_i32
Date: Thu,  7 Oct 2021 12:54:28 -0700
Message-Id: <20211007195456.1168070-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
 tcg/optimize.c | 37 +++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 6bb5e19e55..01a0925c89 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -891,6 +891,24 @@ static bool fold_multiply(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_mulu2_i32(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[2]) && arg_is_const(op->args[3])) {
+        uint32_t a = arg_info(op->args[2])->val;
+        uint32_t b = arg_info(op->args[3])->val;
+        uint64_t r = (uint64_t)a * b;
+        TCGArg rl, rh;
+        TCGOp *op2 = tcg_op_insert_before(ctx->tcg, op, INDEX_op_mov_i32);
+
+        rl = op->args[0];
+        rh = op->args[1];
+        tcg_opt_gen_movi(ctx, op, rl, (int32_t)r);
+        tcg_opt_gen_movi(ctx, op2, rh, (int32_t)(r >> 32));
+        return true;
+    }
+    return false;
+}
+
 static bool fold_nand(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1697,22 +1715,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        case INDEX_op_mulu2_i32:
-            if (arg_is_const(op->args[2]) && arg_is_const(op->args[3])) {
-                uint32_t a = arg_info(op->args[2])->val;
-                uint32_t b = arg_info(op->args[3])->val;
-                uint64_t r = (uint64_t)a * b;
-                TCGArg rl, rh;
-                TCGOp *op2 = tcg_op_insert_before(s, op, INDEX_op_mov_i32);
-
-                rl = op->args[0];
-                rh = op->args[1];
-                tcg_opt_gen_movi(&ctx, op, rl, (int32_t)r);
-                tcg_opt_gen_movi(&ctx, op2, rh, (int32_t)(r >> 32));
-                continue;
-            }
-            break;
-
         default:
             break;
 
@@ -1766,6 +1768,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(muluh):
             done = fold_multiply(&ctx, op);
             break;
+        case INDEX_op_mulu2_i32:
+            done = fold_mulu2_i32(&ctx, op);
+            break;
         CASE_OP_32_64(nand):
             done = fold_nand(&ctx, op);
             break;
-- 
2.25.1


