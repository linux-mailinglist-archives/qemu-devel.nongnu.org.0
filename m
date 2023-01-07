Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0834D660CF3
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 09:18:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE3zZ-0003on-93; Sat, 07 Jan 2023 02:51:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zV-0003lm-Tw
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:45 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zU-0004Gb-A8
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:45 -0500
Received: by mail-pl1-x635.google.com with SMTP id jl4so4063074plb.8
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 23:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zXV4BMwfx9Is58VBQw1MuaHrgXoFB6r8BjQyzRQcYiU=;
 b=B6QNJoQFnFVNS3BLTcjW0r+awNaOIANI8JFLEFeajHmPHltb7PiOiZYR6RkIMNgXUT
 sgLLh1PZkoRUUoL1/o0AAYytiQa48+qSM1PgbzUHjqx1YQGQtihPv3S2LMA4Mi/t9lk9
 32aDFaFAd1VfvPMJkhDZ3YGyIuzvGfhn/LjZtlH4iuC+J1KhiITBgp2gWfOUibm/HDL4
 2ynM9bUr7K9KnBMU4YIgSOhsjRDU3MrgmcAUiZ049hiFMbuvItdJU/RpNiHCn8FnDEux
 ymCh9Ea8s1POM8t8bCCCFsVrUc/Tq4yxq5bNCfMza0ilveQcIz4+Om18E/0HaSn1MBpO
 KbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zXV4BMwfx9Is58VBQw1MuaHrgXoFB6r8BjQyzRQcYiU=;
 b=pEKhH7rABJlG3XYi3Gx7jawQn3rUYVjJsiZhlEAsp0FnQH9WYTtKsRpmYBgtGpE/LS
 eYx0lAtnUWotmqMsiFb/0fbO4a6ZDHMsf+MLs74A0MWRvsHmxjO3NvA/HVXKihB//FXk
 l7/kfwangD/KIRH5f8/65DfFJc5K3HMvdzaXUSMVHxjVVFGl3lf/UBSxN8AA0guuZhkq
 GcBf2wwOfu9/Sjxzp535dnVW+v+8wJGXP9FiZuzcxucB67BklPZOB07n1VzHQj6JyOcM
 p+oKBCiaPWaBQY8hBOJEV72QhdAreAIjjCIml02uNchHFrY5+Lls84KlAOQPIv+q3CVl
 HZtQ==
X-Gm-Message-State: AFqh2kr3RyvP2LAZhk2XC9DFRgsaLwdfJCfYua/GkjBb4ADD6lybKSjj
 PjNsyMe1FplCrzp/iXNLCfvEi0WvBiL06LB+
X-Google-Smtp-Source: AMrXdXuVUtJcEpk0hXGbYvW/rVAzsXm7o0Vcoyod9oYtttbNblGxHcEGtq3yjS5xgOw5lUCCRjUBNw==
X-Received: by 2002:a17:90a:6398:b0:223:de00:f5ab with SMTP id
 f24-20020a17090a639800b00223de00f5abmr60313721pjj.28.1673077903089; 
 Fri, 06 Jan 2023 23:51:43 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 bj5-20020a17090b088500b00212e5068e17sm1945119pjb.40.2023.01.06.23.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 23:51:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 25/27] tcg/s390x: Tighten constraints for 64-bit compare
Date: Fri,  6 Jan 2023 23:51:16 -0800
Message-Id: <20230107075118.1814503-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230107075118.1814503-1-richard.henderson@linaro.org>
References: <20230107075118.1814503-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
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


