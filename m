Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE0D43D9DE
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:29:36 +0200 (CEST)
Received: from localhost ([::1]:48148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfw6h-00015B-Dy
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMd-0004rv-Ms
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:42:02 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:35730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMb-0003iw-3a
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:58 -0400
Received: by mail-pg1-x52c.google.com with SMTP id q187so4966439pgq.2
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fwDfuaHLd2phF2WKQRX+NWoB84U/ilhRWeGAC07+3IE=;
 b=EVIz5wM6BJdcr+QB9fq2nzm/0+sbaYYr/zgzxZRdkf12tiHxc8baO9n3KefEtdXPGE
 gMe68nLf6zWifbhyswrYh/Os08+9qza4KogrxBZqFw/xs/9WpuWIAQYtM1LluFQ0UNgL
 SSP4OITiI1ogJy+2Y0pekDIG6lBXgfAfUl42H8Xc2YH+EmucPlTrgMi1QpHBwHyIrio9
 Wq80kdD8ZS5NOvMYNBAsu/BGyStWs/3YmyPDqhB2RckVrYfumiyE6ai+ucWj4bLKey/M
 spljy/594aEeFYHVFXQb1jEikZFk9IxLlskosoWSxtzPoNrM72W6X5H9b8r1cn3mxQWl
 QUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fwDfuaHLd2phF2WKQRX+NWoB84U/ilhRWeGAC07+3IE=;
 b=a29+DbWSZlokqioaNAl9wqbV/X5CdR4Kt4XBA1YU6aUmzLMG9XHMxUwZL8pQ8jjw0f
 qir48M97tqQnnqONEz9EsbZ2yMFxJzMa9P561DWIerPS3wRWYMr+4A7yBCiZnrMmwrsd
 rOjSPjsZZAhCZUcP64A/MSv7lDLGJDb1FtfKVlNMvH8CjbyVjHqVfn90VKgRGcat4crW
 CUN6EEzY5AQkjVJeGMREbGKPCONV33pH0hNHKZ2IWJ1kRvM3Y8MgDcjGNs3kRdipdH8o
 9AngEqzkSrUkc17B2hBxpesNz0MPn3rFkoSEJMphhQCUvLrrOKP52//sqrj6u8Luw7cr
 0uIA==
X-Gm-Message-State: AOAM5328ywmeUOumJ24CebDoomO8kQdl3WjvgrMiomb0+ZSza4x09mxm
 M617OG0a++UfJboDApCD3zAC6q59qTlgOA==
X-Google-Smtp-Source: ABdhPJy29laAWnR5uVCJ2YbTFeST/yxe2MD1yYOD5orMGK6cDuz7udQhlke67qs9Pcd9J/NfSZHZoQ==
X-Received: by 2002:a05:6a00:234f:b0:3eb:3ffd:6da2 with SMTP id
 j15-20020a056a00234f00b003eb3ffd6da2mr1461736pfj.15.1635388914452; 
 Wed, 27 Oct 2021 19:41:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/56] tcg/optimize: Split out fold_dup, fold_dup2
Date: Wed, 27 Oct 2021 19:41:08 -0700
Message-Id: <20211028024131.1492790-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 53 +++++++++++++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 5374c230da..8524fe1f8a 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -920,6 +920,31 @@ static bool fold_divide(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_dup(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1])) {
+        uint64_t t = arg_info(op->args[1])->val;
+        t = dup_const(TCGOP_VECE(op), t);
+        return tcg_opt_gen_movi(ctx, op, op->args[0], t);
+    }
+    return false;
+}
+
+static bool fold_dup2(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
+        uint64_t t = deposit64(arg_info(op->args[1])->val, 32, 32,
+                               arg_info(op->args[2])->val);
+        return tcg_opt_gen_movi(ctx, op, op->args[0], t);
+    }
+
+    if (args_are_copies(op->args[1], op->args[2])) {
+        op->opc = INDEX_op_dup_vec;
+        TCGOP_VECE(op) = MO_32;
+    }
+    return false;
+}
+
 static bool fold_eqv(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1731,28 +1756,6 @@ void tcg_optimize(TCGContext *s)
             done = tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[1]);
             break;
 
-        case INDEX_op_dup_vec:
-            if (arg_is_const(op->args[1])) {
-                tmp = arg_info(op->args[1])->val;
-                tmp = dup_const(TCGOP_VECE(op), tmp);
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                continue;
-            }
-            break;
-
-        case INDEX_op_dup2_vec:
-            assert(TCG_TARGET_REG_BITS == 32);
-            if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
-                tcg_opt_gen_movi(&ctx, op, op->args[0],
-                                 deposit64(arg_info(op->args[1])->val, 32, 32,
-                                           arg_info(op->args[2])->val));
-                continue;
-            } else if (args_are_copies(op->args[1], op->args[2])) {
-                op->opc = INDEX_op_dup_vec;
-                TCGOP_VECE(op) = MO_32;
-            }
-            break;
-
         default:
             break;
 
@@ -1796,6 +1799,12 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(divu):
             done = fold_divide(&ctx, op);
             break;
+        case INDEX_op_dup_vec:
+            done = fold_dup(&ctx, op);
+            break;
+        case INDEX_op_dup2_vec:
+            done = fold_dup2(&ctx, op);
+            break;
         CASE_OP_32_64(eqv):
             done = fold_eqv(&ctx, op);
             break;
-- 
2.25.1


