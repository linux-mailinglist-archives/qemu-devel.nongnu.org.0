Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A51A7504865
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 18:53:20 +0200 (CEST)
Received: from localhost ([::1]:60644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng89H-0007wf-H7
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 12:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng87d-0005ly-6c
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 12:51:37 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:40526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng87b-00047f-LN
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 12:51:36 -0400
Received: by mail-pg1-x531.google.com with SMTP id h5so14830162pgc.7
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 09:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y9MtiwfVU2+Ka70tD6sa92Ok0UqszU+BuonBx4zVuJs=;
 b=Qi4ULHIs11KiG/vhANwNgBS/2v57Wbkkk5AUcepdZKVkpMLwkF5OoaF+XVw6OvFJwL
 mo7iRH0sAMUizaD6L4i4ieRARkoTnrl5/c3wAaZTYmPE+GrT0jNuzPiGjT18sGZrGlX6
 9wGyKz8Vf0Btl4v4pIX7OBQXCtRWhrmkH+3xlZAHeXh5VvOLHQQTDW0UF27wRJ9HJSKw
 FFmtk6dBuTbawKCcbDXoTNVhNXQMnM3XSdUl9x0kyWxYeLD+fgAPrM81cW4+DbLLK4uK
 MnblAaenKjV87BMqOfLDi8vm7hueq1o0ifWkL7IY5zf3KGzwm0J6svgkDX5X2cV4L/ON
 LpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y9MtiwfVU2+Ka70tD6sa92Ok0UqszU+BuonBx4zVuJs=;
 b=TiJoSTAr7nhpT8m1gUOZwvGU3yD5Fwvwmul/Y+8UOXK53pthSeNcRSPyWjUsS8dpTm
 bs+G3kqy7oJyYab4jR4H/492IG/RuVbQ//2QtQrEW8fG7gy/w3morbogxiFBodyLBPNw
 swoyC4izr7TSyDLEGkkCa7KOZjJ8IRov1elYXhT16mPGHdDuMOobzCopDBL6rwJ7U4vK
 lEku89vQiKBivjQ5q/HscnG44k1l1zSgHsKbUhcJH7ZG+SSCm07PYlPQrsG5q+uhfLi0
 o+OvJzDcWH71WJAhDuvMWtdcdcNnAlj4LEibfR5iDOumb6AREAnHinOMpAqxuSlJ+p5P
 uYNA==
X-Gm-Message-State: AOAM530oPFFSL/YDqKvCVste1hPoXWs8HKE2RRkdPCyhGuZ67FqT0yIl
 k658oEXjCpxf3ak2/FVyV3a7A7MjVd9Ohg==
X-Google-Smtp-Source: ABdhPJxviOryIxk1xyM8kpLW6hdKSLqhy8RgQwMaFZDBOz91AHcpPWYXYUdMW9+Z7RJMPmLJIBRsmw==
X-Received: by 2002:a63:4564:0:b0:39d:93f7:7959 with SMTP id
 u36-20020a634564000000b0039d93f77959mr6828754pgk.492.1650214294391; 
 Sun, 17 Apr 2022 09:51:34 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 f3-20020a17090aa78300b001ca7dfab2e4sm10395396pjq.25.2022.04.17.09.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 09:51:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] target/rx: Move DISAS_UPDATE check for write to PSW
Date: Sun, 17 Apr 2022 09:51:29 -0700
Message-Id: <20220417165130.695085-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417165130.695085-1-richard.henderson@linaro.org>
References: <20220417165130.695085-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: i@yvt.jp, ysato@users.sourceforge.jp
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Have one check in move_to_cr instead of one in each
function that calls move_to_cr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/translate.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/target/rx/translate.c b/target/rx/translate.c
index 586342eae7..d8b9ef635c 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -368,6 +368,10 @@ static void move_to_cr(DisasContext *ctx, TCGv val, int cr)
     switch (cr) {
     case 0:     /* PSW */
         gen_helper_set_psw(cpu_env, val);
+        if (is_privileged(ctx, 0)) {
+            /* PSW.{I,U} may be updated here. exit TB. */
+            ctx->base.is_jmp = DISAS_UPDATE;
+        }
         break;
     /* case 1: to PC not supported */
     case 2:     /* USP */
@@ -631,10 +635,6 @@ static bool trans_POPC(DisasContext *ctx, arg_POPC *a)
     val = tcg_temp_new();
     pop(val);
     move_to_cr(ctx, val, a->cr);
-    if (a->cr == 0 && is_privileged(ctx, 0)) {
-        /* PSW.I may be updated here. exit TB. */
-        ctx->base.is_jmp = DISAS_UPDATE;
-    }
     tcg_temp_free(val);
     return true;
 }
@@ -2205,9 +2205,6 @@ static bool trans_MVTC_i(DisasContext *ctx, arg_MVTC_i *a)
 
     imm = tcg_const_i32(a->imm);
     move_to_cr(ctx, imm, a->cr);
-    if (a->cr == 0 && is_privileged(ctx, 0)) {
-        ctx->base.is_jmp = DISAS_UPDATE;
-    }
     tcg_temp_free(imm);
     return true;
 }
@@ -2216,9 +2213,6 @@ static bool trans_MVTC_i(DisasContext *ctx, arg_MVTC_i *a)
 static bool trans_MVTC_r(DisasContext *ctx, arg_MVTC_r *a)
 {
     move_to_cr(ctx, cpu_regs[a->rs], a->cr);
-    if (a->cr == 0 && is_privileged(ctx, 0)) {
-        ctx->base.is_jmp = DISAS_UPDATE;
-    }
     return true;
 }
 
-- 
2.25.1


