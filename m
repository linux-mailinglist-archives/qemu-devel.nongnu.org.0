Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2F8647BFA
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 03:07:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Slu-0005y9-Tp; Thu, 08 Dec 2022 21:05:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Sln-0005wr-9t
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:47 -0500
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Sll-0001w4-M5
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:47 -0500
Received: by mail-ot1-x32a.google.com with SMTP id
 l8-20020a056830054800b006705fd35eceso1976152otb.12
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 18:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8dJchTnb5uNiKNB26rXc8pPkHP1mXmQfsp6Yr2QLErc=;
 b=KUBnXHO2/NXDiZ3Z+wRw+tlJznXRr0B93swlrGi0GU68T7nYPakQm3ahodaW1bShym
 9tUBrQ9s2RCXr4fFFfaE8TY9Y22yfbQp9f5YS/lcU5PJ5Wrlfb14an0+49BojaxSvaXk
 zM3H6cOtSrrPJoEMKHDQCLJh8D4p2DiC/WTMfMsciYAAhJrAeCY7IV3gcYoa34M3C/oE
 iMvaleAVdR3wkXcVkCe0JuJmtNTK9jaM1od89L9ogCFwBVDOzrmRmEW2q1PUnPstRPwJ
 Q83WDwr339XejQAu//fierr2FlEtYu24PnL//O+Dm6z8eti0JqeYOHY7GaHRkp0hLRbd
 X+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8dJchTnb5uNiKNB26rXc8pPkHP1mXmQfsp6Yr2QLErc=;
 b=KhL9kzMK1zsUxCe/dDU5fBu7uwljcZf62gH7k8+y1XgG+q9R3VDZiD7v7xb0uUvTk9
 XfJwP3rFtCdCh/n2RZqCNEDNE4WzAvO1mmnI/fsy2yjNw8ofpGkJJZAXOoVlvml7UIQR
 UdoHasrAZ7CNgySuJzx9u8GIFqUSu/uIZuLsCmfsA3+9GlD79LO/bHtfNbFG82Zwd2Zl
 et8sTg6yT7DW7Q0yEBietbhVWgfeaFh1sCWsp6hCwIXQ6GVuFs20pvV4DJCuc7iWxAoq
 AxJtQfkvzetxRNZDu4QDEK8B8e0/XCzPqkAOpOT9wqoM6xZrm0IZhdxLTPpC0UcRGmsj
 Lr4A==
X-Gm-Message-State: ANoB5pnIIb59FKBGDtm2n3CH1iPmur4OqRxJDc6d4a1cBB4NXulZTsUs
 QTRn0X2YxDCZ7XjbI7QVGsHaETqGy359k2nCU+4=
X-Google-Smtp-Source: AA0mqf5FIBYlcNg/exbp3iAwK7oAoOgAzFrL+qpe1JOoDA2VVGu/DMGbfcT4EL+fLvCo+mFfYrlkKQ==
X-Received: by 2002:a9d:161:0:b0:670:6615:a9e8 with SMTP id
 88-20020a9d0161000000b006706615a9e8mr2314094otu.34.1670551544590; 
 Thu, 08 Dec 2022 18:05:44 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:d298:de6f:2ed:87a4])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a05683004ce00b0066f7e1188f0sm53531otd.68.2022.12.08.18.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 18:05:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v4 10/27] tcg/s390x: Remove DISTINCT_OPERANDS facility check
Date: Thu,  8 Dec 2022 20:05:13 -0600
Message-Id: <20221209020530.396391-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209020530.396391-1-richard.henderson@linaro.org>
References: <20221209020530.396391-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
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

The distinct-operands facility is bundled into facility 45,
along with load-on-condition.  We are checking this at startup.
Remove the a0 == a1 checks for 64-bit sub, and, or, xor, as there
is no space savings for avoiding the distinct-operands insn.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h     |  1 -
 tcg/s390x/tcg-target.c.inc | 16 ++--------------
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index fc9ae82700..db10a39381 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -62,7 +62,6 @@ typedef enum TCGReg {
 
 /* Facilities that are checked at runtime. */
 
-#define FACILITY_DISTINCT_OPS         45
 #define FACILITY_LOAD_ON_COND2        53
 #define FACILITY_VECTOR               129
 #define FACILITY_VECTOR_ENH1          135
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index dd58f0cdb5..e4403ffabf 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2218,8 +2218,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         if (const_args[2]) {
             a2 = -a2;
             goto do_addi_64;
-        } else if (a0 == a1) {
-            tcg_out_insn(s, RRE, SGR, a0, a2);
         } else {
             tcg_out_insn(s, RRF, SGRK, a0, a1, a2);
         }
@@ -2230,8 +2228,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         if (const_args[2]) {
             tcg_out_mov(s, TCG_TYPE_I64, a0, a1);
             tgen_andi(s, TCG_TYPE_I64, args[0], args[2]);
-        } else if (a0 == a1) {
-            tcg_out_insn(s, RRE, NGR, args[0], args[2]);
         } else {
             tcg_out_insn(s, RRF, NGRK, a0, a1, a2);
         }
@@ -2241,8 +2237,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         if (const_args[2]) {
             tcg_out_mov(s, TCG_TYPE_I64, a0, a1);
             tgen_ori(s, TCG_TYPE_I64, a0, a2);
-        } else if (a0 == a1) {
-            tcg_out_insn(s, RRE, OGR, a0, a2);
         } else {
             tcg_out_insn(s, RRF, OGRK, a0, a1, a2);
         }
@@ -2252,8 +2246,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         if (const_args[2]) {
             tcg_out_mov(s, TCG_TYPE_I64, a0, a1);
             tgen_xori(s, TCG_TYPE_I64, a0, a2);
-        } else if (a0 == a1) {
-            tcg_out_insn(s, RRE, XGR, a0, a2);
         } else {
             tcg_out_insn(s, RRF, XGRK, a0, a1, a2);
         }
@@ -2926,9 +2918,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_or_i64:
     case INDEX_op_xor_i32:
     case INDEX_op_xor_i64:
-        return (HAVE_FACILITY(DISTINCT_OPS)
-                ? C_O1_I2(r, r, ri)
-                : C_O1_I2(r, 0, ri));
+        return C_O1_I2(r, r, ri);
 
     case INDEX_op_mul_i32:
         return C_O1_I2(r, 0, ri);
@@ -2938,9 +2928,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_shl_i32:
     case INDEX_op_shr_i32:
     case INDEX_op_sar_i32:
-        return (HAVE_FACILITY(DISTINCT_OPS)
-                ? C_O1_I2(r, r, ri)
-                : C_O1_I2(r, 0, ri));
+        return C_O1_I2(r, r, ri);
 
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
-- 
2.34.1


