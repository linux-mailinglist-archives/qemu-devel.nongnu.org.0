Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CF443F674
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:07:58 +0200 (CEST)
Received: from localhost ([::1]:60190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgK7R-00049O-Nx
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:07:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJam-000560-At
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:34:12 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:45802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaW-0007z1-OT
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:34:12 -0400
Received: by mail-pg1-x52a.google.com with SMTP id f5so8659864pgc.12
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F1AVpbG5TP2qMj+ELcN61uRCpwzeIi0grwtPZKRIVFo=;
 b=H6b1J7RZsVJ+zUkIfH34uxFF62srtgQ8ituwjRThfa5qpqw1gLIMPfz1qxEqL+fYnL
 Ro3HYRrfgELKgraLVL7wvY0Ee7wAxb7mMq8b9D0xlAki2hbBxrapMP/aIqVYEIK4m87/
 8svEAyCh/shlwJufxvVfFX5nOnY/sbtKo6H2C9AcErKF+gPSVai7oV6AN0SC0Bw5RLCW
 RWsvtv1b5Ng/xA8ejXuUF4V4yj09CMzDVImm6DbvPsm+Mc4LgaGhb4+ADTVukYip5NEL
 /gzGJCw6uy2n1FpnzLwoztMf8ubQZCdnLn4ypSMPDLclyYczY4BWxy0F+ltrAw4G86zB
 zEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F1AVpbG5TP2qMj+ELcN61uRCpwzeIi0grwtPZKRIVFo=;
 b=oT155XdeZ7QQ76u7v9g9/63t8xxhEjyVwOc6xBmd7TwwtJAsR4wB7wSdPtQtouWcGn
 wHp0bOc221pY7ZWNs2c8Bsz1zS95iXcdAMSHWPgDmSCPtjwiBeiiXfB0KpIO+Y+l1CAC
 XoY6BMcBOgdxCu+JwMoEr1lXuUEHnmuxKkxflS1iu0HWCPaVfoJ1kuRNBSYYzdNFTuTQ
 JpbQo9oFod97rt6lJHqldeSMiy5s5TFnthlhAkl+OxFkaZ5JbsuUjOyhpg5bgGZZAEUO
 PBHk+fG0Kjx7x6+3x/4paNhIwn7Yz8VXHg6BcoEiIY461garPBQS0xzjp7BPW5fZp9yV
 CoNQ==
X-Gm-Message-State: AOAM530gDXqc1mkXoXkqYPq6PEReosvux/a0RTvJhQJXpiOXAfRTVlN7
 hFxDkKMbS/gkmHoQfFUbynAyeEPVTfKc2w==
X-Google-Smtp-Source: ABdhPJzyi0+bPYaLKMRaBfCXEeAz/n9be7+JDne7WHvqb/FK97NV0Hm1Akysx/YtMK/uF2Lx0+aeEQ==
X-Received: by 2002:aa7:83cc:0:b0:455:c394:caba with SMTP id
 j12-20020aa783cc000000b00455c394cabamr8787818pfn.28.1635482035262; 
 Thu, 28 Oct 2021 21:33:55 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:33:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 29/60] tcg/optimize: Split out fold_extract, fold_sextract
Date: Thu, 28 Oct 2021 21:32:58 -0700
Message-Id: <20211029043329.1518029-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
 tcg/optimize.c | 48 ++++++++++++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 18 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index faedbdbfb8..3bd5f043c8 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -888,6 +888,18 @@ static bool fold_eqv(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_extract(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1])) {
+        uint64_t t;
+
+        t = arg_info(op->args[1])->val;
+        t = extract64(t, op->args[2], op->args[3]);
+        return tcg_opt_gen_movi(ctx, op, op->args[0], t);
+    }
+    return false;
+}
+
 static bool fold_extract2(OptContext *ctx, TCGOp *op)
 {
     if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
@@ -1126,6 +1138,18 @@ static bool fold_setcond2(OptContext *ctx, TCGOp *op)
     return tcg_opt_gen_movi(ctx, op, op->args[0], i);
 }
 
+static bool fold_sextract(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1])) {
+        uint64_t t;
+
+        t = arg_info(op->args[1])->val;
+        t = sextract64(t, op->args[2], op->args[3]);
+        return tcg_opt_gen_movi(ctx, op, op->args[0], t);
+    }
+    return false;
+}
+
 static bool fold_shift(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1727,24 +1751,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(extract):
-            if (arg_is_const(op->args[1])) {
-                tmp = extract64(arg_info(op->args[1])->val,
-                                op->args[2], op->args[3]);
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                continue;
-            }
-            break;
-
-        CASE_OP_32_64(sextract):
-            if (arg_is_const(op->args[1])) {
-                tmp = sextract64(arg_info(op->args[1])->val,
-                                 op->args[2], op->args[3]);
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                continue;
-            }
-            break;
-
         default:
             break;
 
@@ -1779,6 +1785,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(eqv):
             done = fold_eqv(&ctx, op);
             break;
+        CASE_OP_32_64(extract):
+            done = fold_extract(&ctx, op);
+            break;
         CASE_OP_32_64(extract2):
             done = fold_extract2(&ctx, op);
             break;
@@ -1856,6 +1865,9 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_setcond2_i32:
             done = fold_setcond2(&ctx, op);
             break;
+        CASE_OP_32_64(sextract):
+            done = fold_sextract(&ctx, op);
+            break;
         CASE_OP_32_64_VEC(sub):
             done = fold_sub(&ctx, op);
             break;
-- 
2.25.1


