Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C604B660CDE
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 08:57:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE3zY-0003nD-2Y; Sat, 07 Jan 2023 02:51:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zQ-0003iY-T2
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:40 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zO-0004FG-VM
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:40 -0500
Received: by mail-pl1-x633.google.com with SMTP id d9so4058958pll.9
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 23:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r/pLue4GJbxIJm5sMmwSzrcMdvN3fibiketeG7lVYHg=;
 b=FfP66QsHd8Ur7NwYaycdq2AZQxZZjK93Onmc6SP4MTXh279YaA3/CUwEBqhXNZ4tyQ
 ij3eIxaElcK7JaKjDfRv1kJ61fIGz87xQYVufixHz/UzXIQk7AdFDmcQ2BFfqtOiMSlS
 aZMp75pks5xH6HQ/mmH51wvUPWzGYjiuyQ0CULQJspShO71Sz11UIrdka0ZsBklWp9uI
 WX6h5dYo668LRke2ex4wPdDj1VFk/VPO5NgLEvuYjnTrg7iUKv70xfVXxyIR8C7bc9M9
 bM0XM8w3iX28XO4QLVMQhFJs3FlUpoDl0zJdbnPkP5hj50ujjeGt+hc1KHjXU8Q29QmR
 +lbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r/pLue4GJbxIJm5sMmwSzrcMdvN3fibiketeG7lVYHg=;
 b=ac5GxcoCxz+BpOVJmJ/qO4rIlMDhpOySSDFoB34kAIcxqMNRPRom6G45j0lB8LNaIG
 NBQiDvWWJ8IM+Xu8v9UkDycYpWGKkytEzrPBFIfBEzeOzt6PxZUXioixv4iuUCmxxgKD
 lOvpRZVKyUWRXXrbJ+QMCsDtIQMRSdA55x0gsa9UrJ6uvfZvqyYLSV/4FjlFq0dUgUG/
 7ECc2cng5T/dHHJV7zviRYH/mT5gI3J+6RWlvCDjBdhavYAKEWEgAkGbM8eoPh1gZTIV
 2D6nsRXDxfvVt1PMkJtKTXWwqu9jqisFh6nQqGahUY4Gdgln4qcFffI65tS/C5qgyQZS
 rlNw==
X-Gm-Message-State: AFqh2krOH523IK31VKO4CTlhK6u0bZitbm8OZPWGJw5Ap/q0Wyt/eyi6
 sNpMV8y6jrcnUgEueDBw/4BcoWgmhTqr7xTa
X-Google-Smtp-Source: AMrXdXsV7S8TfFPDPOvDO4xXQubEtTI8K6l6tjE0oKSUAkgxkiJmCvbJ0vkPsN2qDOHtrYGk4HlFXg==
X-Received: by 2002:a17:90a:8a08:b0:223:3642:f74f with SMTP id
 w8-20020a17090a8a0800b002233642f74fmr67239276pjn.0.1673077897657; 
 Fri, 06 Jan 2023 23:51:37 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 bj5-20020a17090b088500b00212e5068e17sm1945119pjb.40.2023.01.06.23.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 23:51:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 19/27] tcg/s390x: Support MIE3 logical operations
Date: Fri,  6 Jan 2023 23:51:10 -0800
Message-Id: <20230107075118.1814503-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230107075118.1814503-1-richard.henderson@linaro.org>
References: <20230107075118.1814503-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

This is andc, orc, nand, nor, eqv.
We can use nor for implementing not.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target-con-set.h |   3 +
 tcg/s390x/tcg-target.h         |  25 ++++----
 tcg/s390x/tcg-target.c.inc     | 102 +++++++++++++++++++++++++++++++++
 3 files changed, 118 insertions(+), 12 deletions(-)

diff --git a/tcg/s390x/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
index 0c4d0da8f5..b194ad7f03 100644
--- a/tcg/s390x/tcg-target-con-set.h
+++ b/tcg/s390x/tcg-target-con-set.h
@@ -22,9 +22,12 @@ C_O1_I1(v, vr)
 C_O1_I2(r, 0, ri)
 C_O1_I2(r, 0, rI)
 C_O1_I2(r, 0, rJ)
+C_O1_I2(r, r, r)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, r, rJ)
 C_O1_I2(r, r, rK)
+C_O1_I2(r, r, rKR)
+C_O1_I2(r, r, rNK)
 C_O1_I2(r, r, rNKR)
 C_O1_I2(r, rZ, r)
 C_O1_I2(v, v, r)
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 03ce11a34a..dabdae1e84 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -64,6 +64,7 @@ typedef enum TCGReg {
 
 #define FACILITY_LOAD_ON_COND2        53
 #define FACILITY_MISC_INSN_EXT2       58
+#define FACILITY_MISC_INSN_EXT3       61
 #define FACILITY_VECTOR               129
 #define FACILITY_VECTOR_ENH1          135
 
@@ -81,13 +82,13 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_ext16u_i32     1
 #define TCG_TARGET_HAS_bswap16_i32    1
 #define TCG_TARGET_HAS_bswap32_i32    1
-#define TCG_TARGET_HAS_not_i32        0
+#define TCG_TARGET_HAS_not_i32        HAVE_FACILITY(MISC_INSN_EXT3)
 #define TCG_TARGET_HAS_neg_i32        1
-#define TCG_TARGET_HAS_andc_i32       0
-#define TCG_TARGET_HAS_orc_i32        0
-#define TCG_TARGET_HAS_eqv_i32        0
-#define TCG_TARGET_HAS_nand_i32       0
-#define TCG_TARGET_HAS_nor_i32        0
+#define TCG_TARGET_HAS_andc_i32       HAVE_FACILITY(MISC_INSN_EXT3)
+#define TCG_TARGET_HAS_orc_i32        HAVE_FACILITY(MISC_INSN_EXT3)
+#define TCG_TARGET_HAS_eqv_i32        HAVE_FACILITY(MISC_INSN_EXT3)
+#define TCG_TARGET_HAS_nand_i32       HAVE_FACILITY(MISC_INSN_EXT3)
+#define TCG_TARGET_HAS_nor_i32        HAVE_FACILITY(MISC_INSN_EXT3)
 #define TCG_TARGET_HAS_clz_i32        0
 #define TCG_TARGET_HAS_ctz_i32        0
 #define TCG_TARGET_HAS_ctpop_i32      0
@@ -118,13 +119,13 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_bswap16_i64    1
 #define TCG_TARGET_HAS_bswap32_i64    1
 #define TCG_TARGET_HAS_bswap64_i64    1
-#define TCG_TARGET_HAS_not_i64        0
+#define TCG_TARGET_HAS_not_i64        HAVE_FACILITY(MISC_INSN_EXT3)
 #define TCG_TARGET_HAS_neg_i64        1
-#define TCG_TARGET_HAS_andc_i64       0
-#define TCG_TARGET_HAS_orc_i64        0
-#define TCG_TARGET_HAS_eqv_i64        0
-#define TCG_TARGET_HAS_nand_i64       0
-#define TCG_TARGET_HAS_nor_i64        0
+#define TCG_TARGET_HAS_andc_i64       HAVE_FACILITY(MISC_INSN_EXT3)
+#define TCG_TARGET_HAS_orc_i64        HAVE_FACILITY(MISC_INSN_EXT3)
+#define TCG_TARGET_HAS_eqv_i64        HAVE_FACILITY(MISC_INSN_EXT3)
+#define TCG_TARGET_HAS_nand_i64       HAVE_FACILITY(MISC_INSN_EXT3)
+#define TCG_TARGET_HAS_nor_i64        HAVE_FACILITY(MISC_INSN_EXT3)
 #define TCG_TARGET_HAS_clz_i64        1
 #define TCG_TARGET_HAS_ctz_i64        0
 #define TCG_TARGET_HAS_ctpop_i64      0
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 21007f94ad..bab2d679c2 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -181,8 +181,18 @@ typedef enum S390Opcode {
     RRFa_MGRK   = 0xb9ec,
     RRFa_MSRKC  = 0xb9fd,
     RRFa_MSGRKC = 0xb9ed,
+    RRFa_NCRK   = 0xb9f5,
+    RRFa_NCGRK  = 0xb9e5,
+    RRFa_NNRK   = 0xb974,
+    RRFa_NNGRK  = 0xb964,
+    RRFa_NORK   = 0xb976,
+    RRFa_NOGRK  = 0xb966,
     RRFa_NRK    = 0xb9f4,
     RRFa_NGRK   = 0xb9e4,
+    RRFa_NXRK   = 0xb977,
+    RRFa_NXGRK  = 0xb967,
+    RRFa_OCRK   = 0xb975,
+    RRFa_OCGRK  = 0xb965,
     RRFa_ORK    = 0xb9f6,
     RRFa_OGRK   = 0xb9e6,
     RRFa_SRK    = 0xb9f9,
@@ -2007,9 +2017,46 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
+    case INDEX_op_andc_i32:
+        a0 = args[0], a1 = args[1], a2 = (uint32_t)args[2];
+        if (const_args[2]) {
+            tcg_out_mov(s, TCG_TYPE_I32, a0, a1);
+            tgen_andi(s, TCG_TYPE_I32, a0, (uint32_t)~a2);
+	} else {
+            tcg_out_insn(s, RRFa, NCRK, a0, a1, a2);
+	}
+        break;
+    case INDEX_op_orc_i32:
+        a0 = args[0], a1 = args[1], a2 = (uint32_t)args[2];
+        if (const_args[2]) {
+            tcg_out_mov(s, TCG_TYPE_I32, a0, a1);
+            tgen_ori(s, a0, (uint32_t)~a2);
+        } else {
+            tcg_out_insn(s, RRFa, OCRK, a0, a1, a2);
+        }
+        break;
+    case INDEX_op_eqv_i32:
+        a0 = args[0], a1 = args[1], a2 = (uint32_t)args[2];
+        if (const_args[2]) {
+            tcg_out_mov(s, TCG_TYPE_I32, a0, a1);
+            tcg_out_insn(s, RIL, XILF, a0, ~a2);
+        } else {
+            tcg_out_insn(s, RRFa, NXRK, a0, a1, a2);
+        }
+        break;
+    case INDEX_op_nand_i32:
+        tcg_out_insn(s, RRFa, NNRK, args[0], args[1], args[2]);
+        break;
+    case INDEX_op_nor_i32:
+        tcg_out_insn(s, RRFa, NORK, args[0], args[1], args[2]);
+        break;
+
     case INDEX_op_neg_i32:
         tcg_out_insn(s, RR, LCR, args[0], args[1]);
         break;
+    case INDEX_op_not_i32:
+        tcg_out_insn(s, RRFa, NORK, args[0], args[1], args[1]);
+        break;
 
     case INDEX_op_mul_i32:
         a0 = args[0], a1 = args[1], a2 = (int32_t)args[2];
@@ -2265,9 +2312,46 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
+    case INDEX_op_andc_i64:
+        a0 = args[0], a1 = args[1], a2 = args[2];
+        if (const_args[2]) {
+            tcg_out_mov(s, TCG_TYPE_I64, a0, a1);
+            tgen_andi(s, TCG_TYPE_I64, a0, ~a2);
+        } else {
+            tcg_out_insn(s, RRFa, NCGRK, a0, a1, a2);
+        }
+        break;
+    case INDEX_op_orc_i64:
+        a0 = args[0], a1 = args[1], a2 = args[2];
+        if (const_args[2]) {
+            tcg_out_mov(s, TCG_TYPE_I64, a0, a1);
+            tgen_ori(s, a0, ~a2);
+        } else {
+            tcg_out_insn(s, RRFa, OCGRK, a0, a1, a2);
+        }
+        break;
+    case INDEX_op_eqv_i64:
+        a0 = args[0], a1 = args[1], a2 = args[2];
+        if (const_args[2]) {
+            tcg_out_mov(s, TCG_TYPE_I64, a0, a1);
+            tgen_xori(s, a0, ~a2);
+        } else {
+            tcg_out_insn(s, RRFa, NXGRK, a0, a1, a2);
+        }
+        break;
+    case INDEX_op_nand_i64:
+        tcg_out_insn(s, RRFa, NNGRK, args[0], args[1], args[2]);
+        break;
+    case INDEX_op_nor_i64:
+        tcg_out_insn(s, RRFa, NOGRK, args[0], args[1], args[2]);
+        break;
+
     case INDEX_op_neg_i64:
         tcg_out_insn(s, RRE, LCGR, args[0], args[1]);
         break;
+    case INDEX_op_not_i64:
+        tcg_out_insn(s, RRFa, NOGRK, args[0], args[1], args[1]);
+        break;
     case INDEX_op_bswap64_i64:
         tcg_out_insn(s, RRE, LRVGR, args[0], args[1]);
         break;
@@ -2945,6 +3029,22 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_xor_i64:
         return C_O1_I2(r, r, rK);
 
+    case INDEX_op_andc_i32:
+    case INDEX_op_orc_i32:
+    case INDEX_op_eqv_i32:
+        return C_O1_I2(r, r, ri);
+    case INDEX_op_andc_i64:
+        return C_O1_I2(r, r, rKR);
+    case INDEX_op_orc_i64:
+    case INDEX_op_eqv_i64:
+        return C_O1_I2(r, r, rNK);
+
+    case INDEX_op_nand_i32:
+    case INDEX_op_nand_i64:
+    case INDEX_op_nor_i32:
+    case INDEX_op_nor_i64:
+        return C_O1_I2(r, r, r);
+
     case INDEX_op_mul_i32:
         return (HAVE_FACILITY(MISC_INSN_EXT2)
                 ? C_O1_I2(r, r, ri)
@@ -2970,6 +3070,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_bswap64_i64:
     case INDEX_op_neg_i32:
     case INDEX_op_neg_i64:
+    case INDEX_op_not_i32:
+    case INDEX_op_not_i64:
     case INDEX_op_ext8s_i32:
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
-- 
2.34.1


