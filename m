Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E866400C2
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 07:58:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0zuD-0007cI-Tn; Fri, 02 Dec 2022 01:52:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0zu8-0007Zp-HF
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:52:14 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0zu6-0003hA-LT
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:52:12 -0500
Received: by mail-pf1-x435.google.com with SMTP id z14so177639pfr.11
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 22:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BRN4OmSigAXOy9GNtbEG61WfbotphHHEPBF4z7Ca8UY=;
 b=CVVQ+P/xLMznRtfQW+wwrtARrLk09lpu1VnQ7PUfPfxn1ymYl/bxIxfXKlQ8YMhHpG
 06dY9WNNFW+BkNr2zF2OEaSDzWd5FiR5Ewtbgojub+mMJXkEzNGYihSgs39U5aOo9kEP
 3Ss57c4xAQr/Nii6mL43JYVP5p4MhoyQ1ZA192jNi+msOk7nukQkVkeVVTfJcLMyDF58
 jQwPZlsswTRbvBouIG4Q/YNcfKLpDftt9ipjcRhpvxNIKaYQtxFORHGmFVdBOo5EnyVA
 int0977D2HDRbM2i6hW/1UPcxShTpMMSom/WncZPgwzwZPvC4rUsuhEPNbL/fFhgGxJC
 eG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BRN4OmSigAXOy9GNtbEG61WfbotphHHEPBF4z7Ca8UY=;
 b=OLbtkG/I4jLQwIwuOQzzS4aqDNUFsfMQS4b8TjtpelU6tFEbAm8sUh4DkXlgZl9j10
 +C1cH35ltEOhaz2E3PXz3QnztlmYmKiP4/vPMndelxk8/BA/9yfMNx0q+4r53gvS4bjz
 TrvWGPYjfIQMCE7j/StEznX7amT/nQWUX3UExDE+s2rsXvLjO0IwtFHf9cqS2JahXc+W
 5B0jpBLF4R9D312zqZpzHMIpVGMnuUOky7FPTVhGbP0l0Bez3pEQIlhpNvTiA0PsbMqN
 9qBat9N/fB3C6Rx5+msTVvxXMIw6femoXVzPnhnCxXH4qzLTiNS9ZYggQZTxkhMSJizp
 v8Vw==
X-Gm-Message-State: ANoB5pl5e978gBPNnC53VVPKNwR+4ETrF+EXHBhviHpioeV1StZ4iYWQ
 Ha5yOSEEZ+0plcYvpOSxjkxvD8UX4r19fj0D
X-Google-Smtp-Source: AA0mqf7lkLtQ2c1Cf1p8b17i0Dx/vhp3CP3aB/cr/U+YqDVV+5iSz61hsdDzBRzv6vD2Al2hLxSanQ==
X-Received: by 2002:a63:580a:0:b0:477:12e3:6e1c with SMTP id
 m10-20020a63580a000000b0047712e36e1cmr46165624pgb.126.1669963929381; 
 Thu, 01 Dec 2022 22:52:09 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 q61-20020a17090a17c300b00218d894fac3sm6056649pja.3.2022.12.01.22.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 22:52:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v3 08/13] tcg/s390x: Support MIE3 logical operations
Date: Thu,  1 Dec 2022 22:51:55 -0800
Message-Id: <20221202065200.224537-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202065200.224537-1-richard.henderson@linaro.org>
References: <20221202065200.224537-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target-con-set.h |   1 +
 tcg/s390x/tcg-target.h         |  25 +++++----
 tcg/s390x/tcg-target.c.inc     | 100 +++++++++++++++++++++++++++++++++
 3 files changed, 114 insertions(+), 12 deletions(-)

diff --git a/tcg/s390x/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
index b1a89a88ba..dc271a6d11 100644
--- a/tcg/s390x/tcg-target-con-set.h
+++ b/tcg/s390x/tcg-target-con-set.h
@@ -22,6 +22,7 @@ C_O1_I1(v, vr)
 C_O1_I2(r, 0, ri)
 C_O1_I2(r, 0, rI)
 C_O1_I2(r, 0, rJ)
+C_O1_I2(r, r, r)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, r, rJ)
 C_O1_I2(r, rZ, r)
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 09cf6e60fc..191c6a073e 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -64,6 +64,7 @@ typedef enum TCGReg {
 #define FACILITY_DISTINCT_OPS         FACILITY_LOAD_ON_COND
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
 #define TCG_TARGET_HAS_clz_i64        HAVE_FACILITY(EXT_IMM)
 #define TCG_TARGET_HAS_ctz_i64        0
 #define TCG_TARGET_HAS_ctpop_i64      0
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 7315602331..4dcdad04c5 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -183,8 +183,18 @@ typedef enum S390Opcode {
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
@@ -2138,9 +2148,46 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
+    case INDEX_op_andc_i32:
+        a0 = args[0], a1 = args[1], a2 = (uint32_t)args[2];
+        if (const_args[2]) {
+            tcg_out_mov(s, TCG_TYPE_I32, a0, a1);
+            tgen_andi(s, TCG_TYPE_I32, a0, ~a2);
+	} else {
+            tcg_out_insn(s, RRFa, NCRK, a0, a1, a2);
+	}
+        break;
+    case INDEX_op_orc_i32:
+        a0 = args[0], a1 = args[1], a2 = (uint32_t)args[2];
+        if (const_args[2]) {
+            tcg_out_mov(s, TCG_TYPE_I32, a0, a1);
+            tgen_ori(s, TCG_TYPE_I32, a0, ~a2);
+        } else {
+            tcg_out_insn(s, RRFa, OCRK, a0, a1, a2);
+        }
+        break;
+    case INDEX_op_eqv_i32:
+        a0 = args[0], a1 = args[1], a2 = (uint32_t)args[2];
+        if (const_args[2]) {
+            tcg_out_mov(s, TCG_TYPE_I32, a0, a1);
+            tgen_xori(s, TCG_TYPE_I32, a0, ~a2);
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
@@ -2404,9 +2451,46 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
+            tgen_ori(s, TCG_TYPE_I64, a0, ~a2);
+        } else {
+            tcg_out_insn(s, RRFa, OCGRK, a0, a1, a2);
+        }
+        break;
+    case INDEX_op_eqv_i64:
+        a0 = args[0], a1 = args[1], a2 = args[2];
+        if (const_args[2]) {
+            tcg_out_mov(s, TCG_TYPE_I64, a0, a1);
+            tgen_xori(s, TCG_TYPE_I64, a0, ~a2);
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
@@ -3083,6 +3167,20 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
                 ? C_O1_I2(r, r, ri)
                 : C_O1_I2(r, 0, ri));
 
+    case INDEX_op_andc_i32:
+    case INDEX_op_andc_i64:
+    case INDEX_op_orc_i32:
+    case INDEX_op_orc_i64:
+    case INDEX_op_eqv_i32:
+    case INDEX_op_eqv_i64:
+        return C_O1_I2(r, r, ri);
+
+    case INDEX_op_nand_i32:
+    case INDEX_op_nand_i64:
+    case INDEX_op_nor_i32:
+    case INDEX_op_nor_i64:
+        return C_O1_I2(r, r, r);
+
     case INDEX_op_mul_i32:
         /* If we have the general-instruction-extensions, then we have
            MULTIPLY SINGLE IMMEDIATE with a signed 32-bit, otherwise we
@@ -3118,6 +3216,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
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


