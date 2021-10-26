Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7643343BDC0
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:21:12 +0200 (CEST)
Received: from localhost ([::1]:53700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfVkl-00068h-J9
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVa9-00039w-OX
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:14 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:41529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVa3-0001zZ-2u
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:13 -0400
Received: by mail-pf1-x42c.google.com with SMTP id y7so889190pfg.8
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UhofiOMOxfG85+VIZHMXYK/5ma+X06jKCdYHbFqq/90=;
 b=coYXeJIIPzLHnVpUPY3+vcse2a4svv9hRNu4YIj0L7/gVhN1GVFTFdRmz6NCK4eTrK
 U4Ywhj3RG7lQfVc/pQsDff70tPFhc71SHyTY6JhgfpnK7qI6nZP+oQni23EqeftdAuXI
 TBzrFJ1iek5PnzA7Trk+/l4zOdCWNGxi6cpAvh7Idl1Jh14eve04SCwjaQgz0QOnR0uG
 c+me0zb2OJKMELG3dDXXz5EgPVW2IPgG6aAeS/L59idos0D5Ut/izDq7pZMWlbcG5nSm
 KKKLUINCkZ0nX/yFwQp+n3BN9RR/Zp6/jaNIyJnDudJY4gQ924y7f9G2bDYMWuSNcqiH
 npXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UhofiOMOxfG85+VIZHMXYK/5ma+X06jKCdYHbFqq/90=;
 b=IiQ5xo0mnTBNEy0wCTrNyZLh0CJRfw10wYdgxBc9ZCy/3zzKan2540m7tlQYK+1Eiw
 XOiziNHso+ONYLkD02QT5LPr3KUg9ZfIl2XV9G1hJIcDjh/axeRRAtwjLHELOHHYmwQF
 O0+MX3fsmEl+CrWUepnUr+MHQBhHJKpyu+Kto/AzRwI5q45RG/7p7KT58Yn4KjIB+K6v
 285sSKgrvtP65Q+H8/8JbZy8DUpIPkc0y3LTSWdwqOJB68YyvNt06fJfMOqcP07V6eQW
 abHQA77df5B7G/OGVHqV0m9hVYSsu1zOPz4az4wTmrUIQuNhYKfHwOHRLgPzXUb8a/LK
 TZ+Q==
X-Gm-Message-State: AOAM53050/qNlFcKx2xcSe/y7XbanwrWiIWL614LyRaeCIviErD8k6ez
 Sz+hruyh5Zr3fdk2xwabHMjzwvsD6psMsA==
X-Google-Smtp-Source: ABdhPJwGYlWWGtd5w2x6rZi9u7Qy6+nbTjUrzH381nofhErJo/HLspKJ/xJSuaEBN+56GSXY428wTw==
X-Received: by 2002:a63:6c02:: with SMTP id h2mr21294206pgc.173.1635289805794; 
 Tue, 26 Oct 2021 16:10:05 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:10:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 23/51] tcg/optimize: Split out fold_extract2
Date: Tue, 26 Oct 2021 16:09:15 -0700
Message-Id: <20211026230943.1225890-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 110b3d1cc2..faedbdbfb8 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -888,6 +888,25 @@ static bool fold_eqv(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_extract2(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
+        uint64_t v1 = arg_info(op->args[1])->val;
+        uint64_t v2 = arg_info(op->args[2])->val;
+        int shr = op->args[3];
+
+        if (op->opc == INDEX_op_extract2_i64) {
+            v1 >>= shr;
+            v2 <<= 64 - shr;
+        } else {
+            v1 = (uint32_t)v1 >> shr;
+            v2 = (int32_t)v2 << (32 - shr);
+        }
+        return tcg_opt_gen_movi(ctx, op, op->args[0], v1 | v2);
+    }
+    return false;
+}
+
 static bool fold_exts(OptContext *ctx, TCGOp *op)
 {
     return fold_const1(ctx, op);
@@ -1726,23 +1745,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(extract2):
-            if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
-                uint64_t v1 = arg_info(op->args[1])->val;
-                uint64_t v2 = arg_info(op->args[2])->val;
-                int shr = op->args[3];
-
-                if (opc == INDEX_op_extract2_i64) {
-                    tmp = (v1 >> shr) | (v2 << (64 - shr));
-                } else {
-                    tmp = (int32_t)(((uint32_t)v1 >> shr) |
-                                    ((uint32_t)v2 << (32 - shr)));
-                }
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                continue;
-            }
-            break;
-
         default:
             break;
 
@@ -1777,6 +1779,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(eqv):
             done = fold_eqv(&ctx, op);
             break;
+        CASE_OP_32_64(extract2):
+            done = fold_extract2(&ctx, op);
+            break;
         CASE_OP_32_64(ext8s):
         CASE_OP_32_64(ext16s):
         case INDEX_op_ext32s_i64:
-- 
2.25.1


