Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C5C647BF9
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 03:07:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Smj-0006RR-PJ; Thu, 08 Dec 2022 21:06:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3SmA-00065E-94
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:06:10 -0500
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Sm7-0001zY-6M
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:06:09 -0500
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-144bd860fdbso4108835fac.0
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 18:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PkPgZIG6hTGADlV8624tJVDsas/W4HyH9r53h6RELE4=;
 b=FZf4cd5A7Ju3h1L1d5KZ+Mial6RHkWgdF/7ffcRASU5oWvRGYRLgRkX22v9uXSJj3u
 ujIb0pCbFrIi3WOpeQXAmJvdUmlzG3CVHljVR5RUvyZZYZslmxFPJ9hxQQU+MAIR8Wi4
 JJPPk+Pr2+JjQGVaI7R+wQx9dV0e7z06+ThDN4k/pooyLX+bOCSyjJGm1s8ipHy4UMdU
 CsrvItBnxWK/AYSaPIEjhMtZ0EZ4qA4pCfO5ZoENi3rSeSkl9DI4dv12nL3PxEHR5MjN
 pFNmOVL8Qkdzp6bbLOgUOe/6/d/kMgPHGffuFYUDo/Tya/iDlWrUKcb4CZPTG4uxxnMr
 gY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PkPgZIG6hTGADlV8624tJVDsas/W4HyH9r53h6RELE4=;
 b=ttnw+T/XryvJWIp+lSmeTl2ihb3jO4X6vizQSenXdX70CNft9IeBKnAlwFMJ92vUef
 XzL/Ov0oy4Y53IrlvVlxRdeLAJfLfOr0xa29+0qSBItLCwuEKBYEXgcY3qqH8+NMdOwQ
 EH617u8BEFnTXQODvT0AL/J5AhOqO4hiy0BWYMBgZB2XVf8TrE2KMsN8Y57uXpYjBehS
 yXmCXDQin4qxZdLFcdo0FzJ65WleGFqKV5KqVdyFe+iKwYlG5pNYR8HIPtpCUKHWi/xt
 jqLqGqy+L1eOopRfCyEH1ZhekpGVadb03s+QhJQAgSsjgj9037E7Kjkeh1winzhp6Uw9
 Ui+w==
X-Gm-Message-State: ANoB5pmXOSDnwlSLBCu9+U1rLc+BW2y9oJhtbVfsW/f0j847dll6+E+E
 J5Jqok6p2brFWmbtDg0cW8m6riKGGx6Oggb8M4g=
X-Google-Smtp-Source: AA0mqf6ISAVDOFKYsesxdzoXi2/V3JK/cCNK7nH0zuZColqiVBlJx1dq2+pcGirbAU3GR6LrWtDKOg==
X-Received: by 2002:a05:6870:3c13:b0:144:ebb9:9ea with SMTP id
 gk19-20020a0568703c1300b00144ebb909eamr1811846oab.48.1670551561868; 
 Thu, 08 Dec 2022 18:06:01 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:d298:de6f:2ed:87a4])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a05683004ce00b0066f7e1188f0sm53531otd.68.2022.12.08.18.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 18:06:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v4 25/27] tcg/s390x: Tighten constraints for 64-bit compare
Date: Thu,  8 Dec 2022 20:05:28 -0600
Message-Id: <20221209020530.396391-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209020530.396391-1-richard.henderson@linaro.org>
References: <20221209020530.396391-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Give 64-bit comparison second operand a signed 33-bit immediate.
This is the smallest superset of uint32_t and int32_t, as used
by CLGFI and CGFI respectively.  The rest of the 33-bit space
can be loaded into TCG_TMP0.  Drop use of the constant pool.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target-con-set.h |  3 +++
 tcg/s390x/tcg-target.c.inc     | 27 ++++++++++++++-------------
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/tcg/s390x/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
index baf3bc9037..15f1c55103 100644
--- a/tcg/s390x/tcg-target-con-set.h
+++ b/tcg/s390x/tcg-target-con-set.h
@@ -13,6 +13,7 @@ C_O0_I1(r)
 C_O0_I2(L, L)
 C_O0_I2(r, r)
 C_O0_I2(r, ri)
+C_O0_I2(r, rA)
 C_O0_I2(v, r)
 C_O1_I1(r, L)
 C_O1_I1(r, r)
@@ -24,6 +25,7 @@ C_O1_I2(r, 0, rI)
 C_O1_I2(r, 0, rJ)
 C_O1_I2(r, r, r)
 C_O1_I2(r, r, ri)
+C_O1_I2(r, r, rA)
 C_O1_I2(r, r, rI)
 C_O1_I2(r, r, rJ)
 C_O1_I2(r, r, rK)
@@ -35,6 +37,7 @@ C_O1_I2(v, v, r)
 C_O1_I2(v, v, v)
 C_O1_I3(v, v, v, v)
 C_O1_I4(r, r, ri, rI, r)
+C_O1_I4(r, r, rA, rI, r)
 C_O2_I2(o, m, 0, r)
 C_O2_I2(o, m, r, r)
 C_O2_I3(o, m, 0, 1, r)
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index c0434fa2f8..4d113139e5 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1249,22 +1249,20 @@ static int tgen_cmp2(TCGContext *s, TCGType type, TCGCond c, TCGReg r1,
             tcg_out_insn_RIL(s, op, r1, c2);
             goto exit;
         }
+
+        /*
+         * Constraints are for a signed 33-bit operand, which is a
+         * convenient superset of this signed/unsigned test.
+         */
         if (c2 == (is_unsigned ? (TCGArg)(uint32_t)c2 : (TCGArg)(int32_t)c2)) {
             op = (is_unsigned ? RIL_CLGFI : RIL_CGFI);
             tcg_out_insn_RIL(s, op, r1, c2);
             goto exit;
         }
 
-        /* Use the constant pool, but not for small constants.  */
-        if (maybe_out_small_movi(s, type, TCG_TMP0, c2)) {
-            c2 = TCG_TMP0;
-            /* fall through to reg-reg */
-        } else {
-            op = (is_unsigned ? RIL_CLGRL : RIL_CGRL);
-            tcg_out_insn_RIL(s, op, r1, 0);
-            new_pool_label(s, c2, R_390_PC32DBL, s->code_ptr - 2, 2);
-            goto exit;
-        }
+        /* Load everything else into a register. */
+        tcg_out_movi(s, TCG_TYPE_I64, TCG_TMP0, c2);
+        c2 = TCG_TMP0;
     }
 
     if (type == TCG_TYPE_I32) {
@@ -3105,8 +3103,9 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_rotr_i32:
     case INDEX_op_rotr_i64:
     case INDEX_op_setcond_i32:
-    case INDEX_op_setcond_i64:
         return C_O1_I2(r, r, ri);
+    case INDEX_op_setcond_i64:
+        return C_O1_I2(r, r, rA);
 
     case INDEX_op_clz_i64:
         return C_O1_I2(r, r, rI);
@@ -3154,8 +3153,9 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         return C_O1_I2(r, r, ri);
 
     case INDEX_op_brcond_i32:
-    case INDEX_op_brcond_i64:
         return C_O0_I2(r, ri);
+    case INDEX_op_brcond_i64:
+        return C_O0_I2(r, rA);
 
     case INDEX_op_bswap16_i32:
     case INDEX_op_bswap16_i64:
@@ -3196,8 +3196,9 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         return C_O1_I2(r, rZ, r);
 
     case INDEX_op_movcond_i32:
-    case INDEX_op_movcond_i64:
         return C_O1_I4(r, r, ri, rI, r);
+    case INDEX_op_movcond_i64:
+        return C_O1_I4(r, r, rA, rI, r);
 
     case INDEX_op_div2_i32:
     case INDEX_op_div2_i64:
-- 
2.34.1


