Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E5C4C3049
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 16:49:13 +0100 (CET)
Received: from localhost ([::1]:58168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNGMi-00031B-Hq
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 10:49:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNGHT-0003ZI-4q
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 10:43:47 -0500
Received: from [2607:f8b0:4864:20::431] (port=43868
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNGHQ-0008K0-Mf
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 10:43:46 -0500
Received: by mail-pf1-x431.google.com with SMTP id d187so2190165pfa.10
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 07:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iFcWsVEjBzD1yV/Bop9z8aY+oeTaAHGq5iIe4uclwiQ=;
 b=RzTDZLXwuBVBXbA8xvN9b47zlbCJXTuisH3SHkILHygg0Bx3Q4NRUDF/PWBkQgclUk
 QzpZwL9qqR/3/oKDL2mnDQRsxGQW6Lb9PcT73+z0RkAJe3ADDCSe0kF7juwJv0p6W4ID
 jqC54qsLMu6WieijMqDFzWifh6zRWTipkRp1diydYJKshzdodHJrF9cI0llcYSUSx9kr
 lukup6w6HaX1FqG3nxCXbkaeiXnBVy9wPcftLOdsxVwEtXg0VLEorwaTijuQ5Ta4Agdc
 7UqROCZ9fZekcMx73ESCCA+KfJYMaUvUSayvgQwfaU5AHhR1z8CyASkAqfjyNIyX/jYS
 Q69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iFcWsVEjBzD1yV/Bop9z8aY+oeTaAHGq5iIe4uclwiQ=;
 b=s7txB7Eojo+VAdiR/EGzpZzBtQYTjfivQ5PGkMjciwBqKrpGqkdVFRUnozbcjJ0npl
 0j+ySBQbnVJz2h/2KCd2Gg6oVF9yll2/Ux5RJxEALVot+wtG5vGrs3NUIvxzoKH4pQN3
 SElEO/MdAWqQoABuDK+NJ8bt/6BXG83N+/morp81ACs8duUW4GACntkSY75smMiPJD+j
 XznoYxaWxpVqsYnzI+yosKF3pw4OFy62MxjKYDDaui0MEgrJEMaZjw7kKxjtY16pZBuW
 /g99yoeNZnjDF2DjW49St0Z1VNTEzuiI1+Gomc6ZLTrjvF/XoyP9jHnGH09urmWRKk2J
 AY8A==
X-Gm-Message-State: AOAM531qK1D0wSG0ouB7ARldfsWvTYABI0oUgrDaSS4Dz3QYTpmMPQbc
 C38yF0gzba67uW1Y/CGtwb/oVKVRQvcCPw==
X-Google-Smtp-Source: ABdhPJyZtM4Ep9ygHxiWiHHBW8W3BI3rGzzffTZhd63yk6x6dqhWn+/whP+6a5OkinE3idvaMwDldQ==
X-Received: by 2002:a63:1405:0:b0:344:3b39:fd27 with SMTP id
 u5-20020a631405000000b003443b39fd27mr2749684pgl.488.1645717423355; 
 Thu, 24 Feb 2022 07:43:43 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id v20sm3198062pju.9.2022.02.24.07.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 07:43:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/10] tcg/s390x: Support MIE3 logical operations
Date: Thu, 24 Feb 2022 05:43:28 -1000
Message-Id: <20220224154333.125185-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224154333.125185-1-richard.henderson@linaro.org>
References: <20220224154333.125185-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, david@redhat.com, dmiller423@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is andc, orc, nand, nor, eqv.
We can use nor for implementing not.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target-con-set.h |   1 +
 tcg/s390x/tcg-target.h         |  25 +++++----
 tcg/s390x/tcg-target.c.inc     | 100 +++++++++++++++++++++++++++++++++
 3 files changed, 114 insertions(+), 12 deletions(-)

diff --git a/tcg/s390x/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
index fea73b6ed0..37801983f1 100644
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
index 280e752d94..53c4da7730 100644
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
index 77d7bb6cf5..58ebb925d9 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -189,8 +189,18 @@ typedef enum S390Opcode {
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
@@ -2254,9 +2264,46 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
@@ -2512,9 +2559,46 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
@@ -3163,6 +3247,20 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
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
@@ -3198,6 +3296,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_bswap64_i64:
     case INDEX_op_neg_i32:
     case INDEX_op_neg_i64:
+    case INDEX_op_not_i32:
+    case INDEX_op_not_i64:
     case INDEX_op_ext8s_i32:
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
-- 
2.25.1


