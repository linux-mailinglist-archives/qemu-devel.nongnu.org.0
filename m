Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A19B9436C9E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:24:26 +0200 (CEST)
Received: from localhost ([::1]:59622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfY1-00039i-Nk
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGG-0007dj-8F
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:05 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:44629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGA-0004Le-OM
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:03 -0400
Received: by mail-pl1-x62b.google.com with SMTP id t11so1266371plq.11
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bOobEJyobONUr+gZkyJIYSFjF1OtYpVc5oUN5hGeX/8=;
 b=HExscu4fPLgrroaUQdv/hejWMveVfFDF+zo5P8PxtUa+ZlVTdhWJsUzq3AgbUsMDUE
 VzEjX26OBdQPR2FM1cvl4EHk5ufL7HgJ6h+dv0WKCQxO1LNaGbZvGXPZs6NQTdwXyCob
 klm5aCNCmNDdZOqn+G8kvj71YM8fYRhM9R3FxiwTU15oRqf2y7iIKTgqF6QFsnK7KLAb
 TithfJKbJWuRRqSKnaRH992qw9i5Ka7sdcY7psxkrx1MQhlcHHXaicr2e415xzk81awL
 Mo22Eh28VhokoRnmERITNwqZTNDKNu9Bxp5BGCb8iBu+/wv4FHVtAMfryT6G2U9u6II5
 3xrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bOobEJyobONUr+gZkyJIYSFjF1OtYpVc5oUN5hGeX/8=;
 b=7LyxiVgGcpEoaNmlRc4PIadC8D229M07b4vqmPzmzap+ERhCOv/1rin+L4Z7Js8Z/T
 A7gs+1/PX5Qg4IZQXQ8LM/eCOc42YoDJFUanQwAu8oYVNehw7DhS/SMnFVtWX7Y4wDBd
 imPCf4w/f/DHEzCroD1JdCpb4k1xBl3a3wF/k+TSckCHOhn4RwCWdP0vO7qxsNNYWXYA
 VB1bAgELDaUC+OTBltGHZgY9YTtZkV5LZKD2hUXDaxC97S72JxDk2czkFZh8MbuBUJ5a
 Az90NntIONeb1zG0BcWo1s7zkkBC7Sjr5IWaWSvvkC/APFARcxeo+PMjs0I4qyJ7yxjm
 hcHg==
X-Gm-Message-State: AOAM530Lenra7PlFzGjq6TeD1jq3S/RvNW1d0di7wXrcziu9g2ENYcXa
 qWdyp1+S3awdX00yAVymCEJNbPpcqPIwdg==
X-Google-Smtp-Source: ABdhPJxfkLXY3I8/TKOcO0w+3ili/JGulvF4qJRMRAPVjGWJHKGuD0qgWYCgYbwG0xKp5dlJtIBOQw==
X-Received: by 2002:a17:902:cec3:b0:13f:2176:5ce5 with SMTP id
 d3-20020a170902cec300b0013f21765ce5mr7334901plg.13.1634850357378; 
 Thu, 21 Oct 2021 14:05:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm5981670pgp.17.2021.10.21.14.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:05:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 23/48] tcg/optimize: Split out fold_extract2
Date: Thu, 21 Oct 2021 14:05:14 -0700
Message-Id: <20211021210539.825582-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index ed5a304089..885380bb22 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -883,6 +883,25 @@ static bool fold_eqv(OptContext *ctx, TCGOp *op)
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
@@ -1711,23 +1730,6 @@ void tcg_optimize(TCGContext *s)
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
 
@@ -1762,6 +1764,9 @@ void tcg_optimize(TCGContext *s)
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


