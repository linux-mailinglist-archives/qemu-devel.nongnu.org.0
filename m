Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C59C143BDEF
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:33:59 +0200 (CEST)
Received: from localhost ([::1]:58922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfVx8-0003nD-Ru
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVaH-0003N3-M0
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:21 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:37431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVa4-0001zy-D2
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:21 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 t5-20020a17090a4e4500b001a0a284fcc2so3572028pjl.2
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OJWu7yUFUqO6SxASLIr2hIPwbeHCDr8GBSl6LyJ/KfE=;
 b=mx2ZQvdUOlgQRL4QVlM/4jfnS2kAxO+buqtlqmTic0lVb103aBSrPCcAcH0cVPY4hS
 mz7xbe52mtT7puXSb+Jm2DeUbN4FUOdZYMwhemWk6BMULu0Szy+P0iEtiSQO0mmuXR/t
 Vug2MKUm0AkHZbAREQX6w/mgnb85OQtAmlEONv40sbyAGRYUOgQ9iNnfzg/4NqiWHnJ/
 glzzH3epp2idnj7PqIYUao1rglGa9KxV5n7jWhSORiFHmjUCVyWWvgmT/T4+rrdntxYl
 EBvGPVE6P8HXZ2vq8mXLm2qRsy17rptSw9q/GQZ6OJJDxQJU25g/7g/EeMMlMmPI0mSB
 4hxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OJWu7yUFUqO6SxASLIr2hIPwbeHCDr8GBSl6LyJ/KfE=;
 b=rnXZkjHWA9MxqoUk801O7s4U1QcD/N0Vr26vUpcqrDXFX17Dsg90dKocTp/Hh3lCMa
 I+qObwCHPB3S3GJxHM3RiXSEZqr1sU9o81woYTu7agF1H8h8iKz9MvzWMQKc8c14rO9l
 +AyrtjYcPDcoZ7lBvoBcSjOyvme1+FI47G4zGdB6wDBh167lE2pjuq7EbQCgZKISAXgc
 BZT7HuvlSEepwpO7o0iuiOYlXsRN3bId9LpOTy0ofXOyRTF3xiwZautFGEQGw0t1a66n
 NtedxroA+J8ezqkz22UUsbp1ndxnPjNZHUrBS5iePShrID6JiKYl1YBou1Zv1R1m/r0J
 q1Cg==
X-Gm-Message-State: AOAM533BxKqyBAgYwEOc73Y4+mEKgl9m/bRjiQmeuxURgk5YK2Ry0qjm
 GWmFH2OZkSIEx2WdRb9xjxASp+6l4suI6g==
X-Google-Smtp-Source: ABdhPJwnu5ERrxpyyHegIfSL3WiaHwORzkyuiEDam7diebgnLlRmsFKi1AJDU7CbS1oqIcX8WZzkEw==
X-Received: by 2002:a17:902:db04:b0:13e:f118:54de with SMTP id
 m4-20020a170902db0400b0013ef11854demr25668384plx.44.1635289807264; 
 Tue, 26 Oct 2021 16:10:07 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:10:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 25/51] tcg/optimize: Split out fold_deposit
Date: Tue, 26 Oct 2021 16:09:17 -0700
Message-Id: <20211026230943.1225890-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
 tcg/optimize.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 3bd5f043c8..2c57d08760 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -878,6 +878,18 @@ static bool fold_ctpop(OptContext *ctx, TCGOp *op)
     return fold_const1(ctx, op);
 }
 
+static bool fold_deposit(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
+        uint64_t t1 = arg_info(op->args[1])->val;
+        uint64_t t2 = arg_info(op->args[2])->val;
+
+        t1 = deposit64(t1, op->args[3], op->args[4], t2);
+        return tcg_opt_gen_movi(ctx, op, op->args[0], t1);
+    }
+    return false;
+}
+
 static bool fold_divide(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1741,16 +1753,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(deposit):
-            if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
-                tmp = deposit64(arg_info(op->args[1])->val,
-                                op->args[3], op->args[4],
-                                arg_info(op->args[2])->val);
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                continue;
-            }
-            break;
-
         default:
             break;
 
@@ -1778,6 +1780,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(ctpop):
             done = fold_ctpop(&ctx, op);
             break;
+        CASE_OP_32_64(deposit):
+            done = fold_deposit(&ctx, op);
+            break;
         CASE_OP_32_64(div):
         CASE_OP_32_64(divu):
             done = fold_divide(&ctx, op);
-- 
2.25.1


