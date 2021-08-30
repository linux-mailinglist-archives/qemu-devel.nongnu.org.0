Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3385F3FB160
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:48:05 +0200 (CEST)
Received: from localhost ([::1]:60516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKb5L-0001eE-7j
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajE-00042A-UU
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:08 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:39639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajD-0007Y1-AY
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:08 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 mj9-20020a17090b368900b001965618d019so2981372pjb.4
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=fSv6smAwvoecU3iByhei9EwDSG45D2jhxFvytV+nznA=;
 b=WSoh7df00dpEjHjVFrDgLvZeE3qIKeupl+0CAUEjvU6Oo8xqy6JBxZUT5mPEd9VR4y
 H5wLZHqOM6O1mmIR6bNMbWzPVRcoVs9cnYrklGEB2vfZX8MmNmEh7bQ0z48hnEMuUzXX
 GC0j9ev2wkSStmnQm6avTlfD9wK/h2TiOPEawXkFtxsFCvSRHfZtX5EY2lR71zQCPScR
 wkIegDvBQ9Vv6SkhxLdju4QfQ1stDyV5F8ZVVwfMwxdc0hXp7dwM8N6HVf0kgUxD4w7i
 A/3LeipdW6/FtuOPhIfyQsMVM05pxIYkFLfxfXu7lmI/Y8DEnT1TVfSqIx4SmdRJ5AH7
 u6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fSv6smAwvoecU3iByhei9EwDSG45D2jhxFvytV+nznA=;
 b=Z6PMzrRE5H2U7LD4aH5tKNVbrMxnEwHU9+T6QtMynGyfoSgMvV2LfndutWTOEVwa9S
 5Y92qzbN0elJFwCq4TwZZzjzg6y8u/PuyYb3Q6EgUIhv8ha1A5OvA5fRKbNlW5eeRnbt
 4MTIpbGzsB4ozKEuU3zSBXxHj7uptNRqEFxxl4hfKyaQ9XEYnRRKUxBXlYtpcB39BXEx
 UQIZlGsaFaYsbBfBlKb0Xsr9OeSo1gm4eRvG2y8l87QXtDJWZoUPigpMnJEhUIAgfJX5
 UZDLYzJ2+ncpw9f9G3HuDNczSFMesWjD/SAuaLMSprsSG7/xe3V8q3yhTqBk1rGIfCvi
 mWOg==
X-Gm-Message-State: AOAM531DR+MQ2uo1pEzwusQ7OaMf0ShJKifUtp7jDVL3OkXV2eJh88dt
 7SYgjksYedljUZrDUKCRv8VNbEnB/hFQcQ==
X-Google-Smtp-Source: ABdhPJznnjHmajZWMlQwh8PB4XqpEHQAnEW5om6SDovb0tgeYxFrhs4qvf+V2sbP4dt16l3Nqy8CxQ==
X-Received: by 2002:a17:90a:4093:: with SMTP id
 l19mr25127419pjg.118.1630304706078; 
 Sun, 29 Aug 2021 23:25:06 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.25.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:25:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/48] tcg/optimize: Split out fold_mulu2_i32
Date: Sun, 29 Aug 2021 23:24:23 -0700
Message-Id: <20210830062451.639572-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
index 58f03737d2..dbe283cedb 100644
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


