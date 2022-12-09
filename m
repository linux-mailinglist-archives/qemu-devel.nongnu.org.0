Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5614647C04
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 03:10:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Sm7-00061q-3t; Thu, 08 Dec 2022 21:06:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Slx-00060V-HY
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:57 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Slv-0001vq-JS
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:57 -0500
Received: by mail-oi1-x234.google.com with SMTP id l127so3259989oia.8
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 18:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r/pLue4GJbxIJm5sMmwSzrcMdvN3fibiketeG7lVYHg=;
 b=LczvHU+zvROps0yYEqNDAaAqRR2oDKwFL3wRNZUdHt2rdVeYyNJn6xqsZuvxsq20M0
 UiBTkO9RtyyZ8uaYpSWyQRscK904AxuPReE+OCqSWwRUvKthqZGHIZ52uVnbdZ6AfZOE
 5qg7vMxYe/v5hHqo3p2Gccc/WqgHaoDvUeO510ZIoIcsR6PVN1kmOcHnbCuGnXIrm7LH
 lUoRZLqfxD5lwouB8Jp6pxp58rv6O3gn5ti0nF7bTiVNSbTVVHavxtppqfhaIx3UjiKU
 j0hU6wtY4Sic3oSv/9IFDj84GkPdZXBTA9OuztlnYE0YFAPL2UeJGvqmITSzJCykFVMP
 5b0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r/pLue4GJbxIJm5sMmwSzrcMdvN3fibiketeG7lVYHg=;
 b=ABKWy68SrlTGBlFHH2aosD2eE42MnATawLiO8k4yTW3cWtmQQXWKHNZ+NiOKjbm02f
 3X1wcJln3U3F4LJYIsqYymp16NO+GeSnW9uzcQm2jgroNs+sDfNUlqz03RO0elbjFlda
 OmT6fBiyMUm/z4w8OlRlTYNSv6QXiRc8RasbMajtn63VzlDpmAj5L/pXN3u6KyUjLc4C
 6w+K4krsi9xWu+/Q6vZXt7R+obze7ABwbHGc9VcKv6rL0Nho6iR47NbGJ9W2b7T0aRVP
 bkdIZT3dbGrZCuQtkHYZ64pIKIUMx23zkk1AB42e84wWHivkgVrGHq+pfL0nJGaN3xot
 8fdQ==
X-Gm-Message-State: ANoB5pnnn4xq2Z8ot1Kg/GK1rtiora48a4mw7KfCv5Yy7cIR2yl88l0U
 30zNndFV1VX5asPCLrVhQ2hHcrKLfz8WZNFpJzg=
X-Google-Smtp-Source: AA0mqf73W+ilIe9QVTRQMst+C95BMbfoDNo8rgsE3V+qdDV6JVfBOETn77QkRBNd27W969Z3CdySXA==
X-Received: by 2002:a05:6808:a10:b0:35a:3093:e9e1 with SMTP id
 n16-20020a0568080a1000b0035a3093e9e1mr1566738oij.3.1670551554853; 
 Thu, 08 Dec 2022 18:05:54 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:d298:de6f:2ed:87a4])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a05683004ce00b0066f7e1188f0sm53531otd.68.2022.12.08.18.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 18:05:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v4 19/27] tcg/s390x: Support MIE3 logical operations
Date: Thu,  8 Dec 2022 20:05:22 -0600
Message-Id: <20221209020530.396391-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209020530.396391-1-richard.henderson@linaro.org>
References: <20221209020530.396391-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
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


