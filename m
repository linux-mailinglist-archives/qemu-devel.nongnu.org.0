Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE93043BDD6
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:26:28 +0200 (CEST)
Received: from localhost ([::1]:41962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfVpr-0000UI-Ue
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVa4-00031a-NY
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:08 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:39913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVa1-0001z1-FQ
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:08 -0400
Received: by mail-pg1-x529.google.com with SMTP id g184so1023648pgc.6
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XCdKX5lGX4jVtgmDyFNtAjJPKoYBkr5rEDOGi0sGeW8=;
 b=XpaidSdnAHeV5T6rqwkPGY+qCDRCp1MUDijPjY673FG5OEqtkC2XznyTudrEOoSvi1
 Nnv/ecf9xStgTjTajE0U7J9nkXMHAOfgtWDvdN2iuFs5yc+SxCPfXw0vzsoHn1hojuZU
 HHV4fXuTaI+LW/VvJ3bSkwsU2k9O78Opo5Ilgk+YGndXpuaAcO9lgSJ8IzPBRvUdSRyK
 PemBIs++K3QaPNXHXUWxjTV2hXHknU9VgDwmcgn8LxbwvqdkohZqZHPdFFu+pG9CK2JI
 NEpEmD9Qx7Fy8f6eCZKO4bQKn1S7i8MWyYRmDMsFbpPq0aeacuvw3IG6D1Z4vfTTG5bt
 VMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XCdKX5lGX4jVtgmDyFNtAjJPKoYBkr5rEDOGi0sGeW8=;
 b=pOWZ3QlCfM0NU3OZInoeaqlH9/vtx3au9kX/ma1uaLyXH6iELIqmpSViJag73Sn7kD
 HfiflWLsES1XtvBKhvD0x9FbY7iEOjem6lQFaw0q1/Pr8tWBR/4MZhSIFqPIaU1O06gz
 HnRxL15ISRL/Epzd6Yntkmg/y3+DNUchBBokw/r/JQgnWcZIjSEY+grTjr7w/dHoUpj1
 exf2JUuwqlt+RP3nMbCHc+ktr6KWOHG9AqKhfqSMXq23UgoRDPy1S4YHX+0iA60KjvZq
 chr8yJ4vwbesvrD7HPkr9wNSFJHT/FMaIl/AW6LczSwzk417vao124h4k9rkFFUPI6Jm
 mNwA==
X-Gm-Message-State: AOAM531gfVJf5RWVf72a0IHuTV5CNgp/v1crKpwWOQ+EEo5bn4zd1rP2
 uyzZXvjms73XSF2LX9aVJtrn7/aCN3FjRg==
X-Google-Smtp-Source: ABdhPJxfiAqBJtnRdLl1jLNvHKDsiiaQP8lS4UFSp1KsdwCgimrZunIeHQVRsb+Q2vCsvh8cffn08Q==
X-Received: by 2002:a63:b91c:: with SMTP id z28mr21014061pge.393.1635289803775; 
 Tue, 26 Oct 2021 16:10:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:10:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 21/51] tcg/optimize: Split out fold_addsub2_i32
Date: Tue, 26 Oct 2021 16:09:13 -0700
Message-Id: <20211026230943.1225890-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

Add two additional helpers, fold_add2_i32 and fold_sub2_i32
which will not be simple wrappers forever.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 70 +++++++++++++++++++++++++++++++-------------------
 1 file changed, 44 insertions(+), 26 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 805522f99d..9d1d045363 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -704,6 +704,39 @@ static bool fold_add(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_addsub2_i32(OptContext *ctx, TCGOp *op, bool add)
+{
+    if (arg_is_const(op->args[2]) && arg_is_const(op->args[3]) &&
+        arg_is_const(op->args[4]) && arg_is_const(op->args[5])) {
+        uint32_t al = arg_info(op->args[2])->val;
+        uint32_t ah = arg_info(op->args[3])->val;
+        uint32_t bl = arg_info(op->args[4])->val;
+        uint32_t bh = arg_info(op->args[5])->val;
+        uint64_t a = ((uint64_t)ah << 32) | al;
+        uint64_t b = ((uint64_t)bh << 32) | bl;
+        TCGArg rl, rh;
+        TCGOp *op2 = tcg_op_insert_before(ctx->tcg, op, INDEX_op_mov_i32);
+
+        if (add) {
+            a += b;
+        } else {
+            a -= b;
+        }
+
+        rl = op->args[0];
+        rh = op->args[1];
+        tcg_opt_gen_movi(ctx, op, rl, (int32_t)a);
+        tcg_opt_gen_movi(ctx, op2, rh, (int32_t)(a >> 32));
+        return true;
+    }
+    return false;
+}
+
+static bool fold_add2_i32(OptContext *ctx, TCGOp *op)
+{
+    return fold_addsub2_i32(ctx, op, true);
+}
+
 static bool fold_and(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1056,6 +1089,11 @@ static bool fold_sub(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_sub2_i32(OptContext *ctx, TCGOp *op)
+{
+    return fold_addsub2_i32(ctx, op, false);
+}
+
 static bool fold_xor(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1701,32 +1739,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        case INDEX_op_add2_i32:
-        case INDEX_op_sub2_i32:
-            if (arg_is_const(op->args[2]) && arg_is_const(op->args[3])
-                && arg_is_const(op->args[4]) && arg_is_const(op->args[5])) {
-                uint32_t al = arg_info(op->args[2])->val;
-                uint32_t ah = arg_info(op->args[3])->val;
-                uint32_t bl = arg_info(op->args[4])->val;
-                uint32_t bh = arg_info(op->args[5])->val;
-                uint64_t a = ((uint64_t)ah << 32) | al;
-                uint64_t b = ((uint64_t)bh << 32) | bl;
-                TCGArg rl, rh;
-                TCGOp *op2 = tcg_op_insert_before(s, op, INDEX_op_mov_i32);
-
-                if (opc == INDEX_op_add2_i32) {
-                    a += b;
-                } else {
-                    a -= b;
-                }
-
-                rl = op->args[0];
-                rh = op->args[1];
-                tcg_opt_gen_movi(&ctx, op, rl, (int32_t)a);
-                tcg_opt_gen_movi(&ctx, op2, rh, (int32_t)(a >> 32));
-                continue;
-            }
-            break;
 
         default:
             break;
@@ -1737,6 +1749,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(add):
             done = fold_add(&ctx, op);
             break;
+        case INDEX_op_add2_i32:
+            done = fold_add2_i32(&ctx, op);
+            break;
         CASE_OP_32_64_VEC(and):
             done = fold_and(&ctx, op);
             break;
@@ -1833,6 +1848,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(sub):
             done = fold_sub(&ctx, op);
             break;
+        case INDEX_op_sub2_i32:
+            done = fold_sub2_i32(&ctx, op);
+            break;
         CASE_OP_32_64_VEC(xor):
             done = fold_xor(&ctx, op);
             break;
-- 
2.25.1


