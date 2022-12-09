Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4047C647C1E
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 03:17:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Slm-0005vo-3i; Thu, 08 Dec 2022 21:05:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Slj-0005uR-PY
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:43 -0500
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Slh-0001uu-H0
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:43 -0500
Received: by mail-ot1-x32d.google.com with SMTP id
 p10-20020a9d76ca000000b0066d6c6bce58so1981557otl.7
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 18:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=25Ko++yQBwy/H4R6FsmmzZ4rxqjqQk1kf6nKToI9X2c=;
 b=w1LNY/z9M5+tQTYoUyce6ZYfpNjdpx0dZylEnzCSQeshaTzijtC8/FrgKdN4cL7w6r
 dara7nLuGGNITmgyjwVgLXg2dVkiqBf9kRt1N9Mf1D60Aumjv6723jV9uwWRF+blX8e0
 MJLO9ncxGe6x0C1+vV6dfmRmpg7qywlyhWBYoqKRBWsXifLnWyu1GSdqyOdyn8hVilYF
 A9xDp0SYzl+RQb0Do3Avx1QwNylX5tAJZUrHoB1GCC/1p1hqsdtF8M645P8UAc5qZhKF
 Gq0xbfHJUKQ7b5JOexEMpbnjRBkCNvOcuU9Nb0Z2027kcD/p+CnxaoNrCr5tBvZNauc0
 u7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=25Ko++yQBwy/H4R6FsmmzZ4rxqjqQk1kf6nKToI9X2c=;
 b=F6t5kVzhpDTmWjqW5HvlRLDpYFTtIPD5tqQ38m4M31O7Ar3RPZF0HM78Q0aXruHtmu
 h0tpylfEIiOo3PVF5vUu4BIOQX5tvLv6ZC4ds3fwbtSfSbS7dBztAl4u/eTQQy8gA/tf
 B1ApJ4dOzU8JUlyfeWzE4FsL/H49D07hPzWiCq/cCJQWqKP5to6Lfl2LclJV0/mKRDhw
 y9saAi9SlsmMZj1E8tDjCv2hoaFOoStmvJhdPyag12bTy8u66mvKOqC6ChImkLX3jj8w
 he9PR7d+cn1zq+I/RIkz3UR4go4cHzML+wKoFJubwWkc7Y8tGfB/tnaQ9WJNEnVrAArR
 4oBA==
X-Gm-Message-State: ANoB5pmuizIrTzEOnGkaIK0xJ48DyzN03t2vSXDPylN2+/6KohN+bvvK
 l0RR9gH5f75upBAn5WYNL5xy6wnEMNbppqAA020=
X-Google-Smtp-Source: AA0mqf4Le9QTJCDWlaCoHjYnAUCksqMRGrVE8UItA0yvDq4hoFcLg6JVNyvb2cuSbgVe80IbffWV8g==
X-Received: by 2002:a05:6830:378b:b0:66e:61be:1a90 with SMTP id
 bi11-20020a056830378b00b0066e61be1a90mr2060896otb.23.1670551540073; 
 Thu, 08 Dec 2022 18:05:40 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:d298:de6f:2ed:87a4])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a05683004ce00b0066f7e1188f0sm53531otd.68.2022.12.08.18.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 18:05:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v4 06/27] tcg/s390x: Check for extended-immediate facility at
 startup
Date: Thu,  8 Dec 2022 20:05:09 -0600
Message-Id: <20221209020530.396391-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209020530.396391-1-richard.henderson@linaro.org>
References: <20221209020530.396391-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
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

The extended-immediate facility was introduced in z9-109,
which itself was end-of-life in 2017.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h     |   4 +-
 tcg/s390x/tcg-target.c.inc | 231 +++++++++++--------------------------
 2 files changed, 72 insertions(+), 163 deletions(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 7f230ed243..126ba1048a 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -56,10 +56,10 @@ typedef enum TCGReg {
 
 #define FACILITY_ZARCH_ACTIVE         2
 #define FACILITY_LONG_DISP            18
+#define FACILITY_EXT_IMM              21
 
 /* Facilities that are checked at runtime. */
 
-#define FACILITY_EXT_IMM              21
 #define FACILITY_GEN_INST_EXT         34
 #define FACILITY_LOAD_ON_COND         45
 #define FACILITY_FAST_BCR_SER         FACILITY_LOAD_ON_COND
@@ -126,7 +126,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_eqv_i64        0
 #define TCG_TARGET_HAS_nand_i64       0
 #define TCG_TARGET_HAS_nor_i64        0
-#define TCG_TARGET_HAS_clz_i64        HAVE_FACILITY(EXT_IMM)
+#define TCG_TARGET_HAS_clz_i64        1
 #define TCG_TARGET_HAS_ctz_i64        0
 #define TCG_TARGET_HAS_ctpop_i64      0
 #define TCG_TARGET_HAS_deposit_i64    HAVE_FACILITY(GEN_INST_EXT)
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 1fcefba7ba..42e161cc7e 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -819,19 +819,17 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     }
 
     /* Try all 48-bit insns that can load it in one go.  */
-    if (HAVE_FACILITY(EXT_IMM)) {
-        if (sval == (int32_t)sval) {
-            tcg_out_insn(s, RIL, LGFI, ret, sval);
-            return;
-        }
-        if (uval <= 0xffffffff) {
-            tcg_out_insn(s, RIL, LLILF, ret, uval);
-            return;
-        }
-        if ((uval & 0xffffffff) == 0) {
-            tcg_out_insn(s, RIL, LLIHF, ret, uval >> 32);
-            return;
-        }
+    if (sval == (int32_t)sval) {
+        tcg_out_insn(s, RIL, LGFI, ret, sval);
+        return;
+    }
+    if (uval <= 0xffffffff) {
+        tcg_out_insn(s, RIL, LLILF, ret, uval);
+        return;
+    }
+    if ((uval & 0xffffffff) == 0) {
+        tcg_out_insn(s, RIL, LLIHF, ret, uval >> 32);
+        return;
     }
 
     /* Try for PC-relative address load.  For odd addresses,
@@ -844,15 +842,6 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
         }
     }
 
-    /* A 32-bit unsigned value can be loaded in 2 insns.  And given
-       that LLILL, LLIHL, LLILF above did not succeed, we know that
-       both insns are required.  */
-    if (uval <= 0xffffffff) {
-        tcg_out_insn(s, RI, LLILL, ret, uval);
-        tcg_out_insn(s, RI, IILH, ret, uval >> 16);
-        return;
-    }
-
     /* Otherwise, stuff it in the constant pool.  */
     if (HAVE_FACILITY(GEN_INST_EXT)) {
         tcg_out_insn(s, RIL, LGRL, ret, 0);
@@ -1002,82 +991,22 @@ static inline void tcg_out_risbg(TCGContext *s, TCGReg dest, TCGReg src,
 
 static void tgen_ext8s(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
 {
-    if (HAVE_FACILITY(EXT_IMM)) {
-        tcg_out_insn(s, RRE, LGBR, dest, src);
-        return;
-    }
-
-    if (type == TCG_TYPE_I32) {
-        if (dest == src) {
-            tcg_out_sh32(s, RS_SLL, dest, TCG_REG_NONE, 24);
-        } else {
-            tcg_out_sh64(s, RSY_SLLG, dest, src, TCG_REG_NONE, 24);
-        }
-        tcg_out_sh32(s, RS_SRA, dest, TCG_REG_NONE, 24);
-    } else {
-        tcg_out_sh64(s, RSY_SLLG, dest, src, TCG_REG_NONE, 56);
-        tcg_out_sh64(s, RSY_SRAG, dest, dest, TCG_REG_NONE, 56);
-    }
+    tcg_out_insn(s, RRE, LGBR, dest, src);
 }
 
 static void tgen_ext8u(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
 {
-    if (HAVE_FACILITY(EXT_IMM)) {
-        tcg_out_insn(s, RRE, LLGCR, dest, src);
-        return;
-    }
-
-    if (dest == src) {
-        tcg_out_movi(s, type, TCG_TMP0, 0xff);
-        src = TCG_TMP0;
-    } else {
-        tcg_out_movi(s, type, dest, 0xff);
-    }
-    if (type == TCG_TYPE_I32) {
-        tcg_out_insn(s, RR, NR, dest, src);
-    } else {
-        tcg_out_insn(s, RRE, NGR, dest, src);
-    }
+    tcg_out_insn(s, RRE, LLGCR, dest, src);
 }
 
 static void tgen_ext16s(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
 {
-    if (HAVE_FACILITY(EXT_IMM)) {
-        tcg_out_insn(s, RRE, LGHR, dest, src);
-        return;
-    }
-
-    if (type == TCG_TYPE_I32) {
-        if (dest == src) {
-            tcg_out_sh32(s, RS_SLL, dest, TCG_REG_NONE, 16);
-        } else {
-            tcg_out_sh64(s, RSY_SLLG, dest, src, TCG_REG_NONE, 16);
-        }
-        tcg_out_sh32(s, RS_SRA, dest, TCG_REG_NONE, 16);
-    } else {
-        tcg_out_sh64(s, RSY_SLLG, dest, src, TCG_REG_NONE, 48);
-        tcg_out_sh64(s, RSY_SRAG, dest, dest, TCG_REG_NONE, 48);
-    }
+    tcg_out_insn(s, RRE, LGHR, dest, src);
 }
 
 static void tgen_ext16u(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
 {
-    if (HAVE_FACILITY(EXT_IMM)) {
-        tcg_out_insn(s, RRE, LLGHR, dest, src);
-        return;
-    }
-
-    if (dest == src) {
-        tcg_out_movi(s, type, TCG_TMP0, 0xffff);
-        src = TCG_TMP0;
-    } else {
-        tcg_out_movi(s, type, dest, 0xffff);
-    }
-    if (type == TCG_TYPE_I32) {
-        tcg_out_insn(s, RR, NR, dest, src);
-    } else {
-        tcg_out_insn(s, RRE, NGR, dest, src);
-    }
+    tcg_out_insn(s, RRE, LLGHR, dest, src);
 }
 
 static inline void tgen_ext32s(TCGContext *s, TCGReg dest, TCGReg src)
@@ -1150,15 +1079,13 @@ static void tgen_andi(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
         tgen_ext32u(s, dest, dest);
         return;
     }
-    if (HAVE_FACILITY(EXT_IMM)) {
-        if ((val & valid) == 0xff) {
-            tgen_ext8u(s, TCG_TYPE_I64, dest, dest);
-            return;
-        }
-        if ((val & valid) == 0xffff) {
-            tgen_ext16u(s, TCG_TYPE_I64, dest, dest);
-            return;
-        }
+    if ((val & valid) == 0xff) {
+        tgen_ext8u(s, TCG_TYPE_I64, dest, dest);
+        return;
+    }
+    if ((val & valid) == 0xffff) {
+        tgen_ext16u(s, TCG_TYPE_I64, dest, dest);
+        return;
     }
 
     /* Try all 32-bit insns that can perform it in one go.  */
@@ -1171,13 +1098,11 @@ static void tgen_andi(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
     }
 
     /* Try all 48-bit insns that can perform it in one go.  */
-    if (HAVE_FACILITY(EXT_IMM)) {
-        for (i = 0; i < 2; i++) {
-            tcg_target_ulong mask = ~(0xffffffffull << i * 32);
-            if (((val | ~valid) & mask) == mask) {
-                tcg_out_insn_RIL(s, nif_insns[i], dest, val >> i * 32);
-                return;
-            }
+    for (i = 0; i < 2; i++) {
+        tcg_target_ulong mask = ~(0xffffffffull << i * 32);
+        if (((val | ~valid) & mask) == mask) {
+            tcg_out_insn_RIL(s, nif_insns[i], dest, val >> i * 32);
+            return;
         }
     }
     if (HAVE_FACILITY(GEN_INST_EXT) && risbg_mask(val)) {
@@ -1219,13 +1144,11 @@ static void tgen_ori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
     }
 
     /* Try all 48-bit insns that can perform it in one go.  */
-    if (HAVE_FACILITY(EXT_IMM)) {
-        for (i = 0; i < 2; i++) {
-            tcg_target_ulong mask = (0xffffffffull << i * 32);
-            if ((val & mask) != 0 && (val & ~mask) == 0) {
-                tcg_out_insn_RIL(s, oif_insns[i], dest, val >> i * 32);
-                return;
-            }
+    for (i = 0; i < 2; i++) {
+        tcg_target_ulong mask = (0xffffffffull << i * 32);
+        if ((val & mask) != 0 && (val & ~mask) == 0) {
+            tcg_out_insn_RIL(s, oif_insns[i], dest, val >> i * 32);
+            return;
         }
     }
 
@@ -1239,7 +1162,6 @@ static void tgen_ori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
         /* Perform the OR via sequential modifications to the high and
            low parts.  Do this via recursion to handle 16-bit vs 32-bit
            masks in each half.  */
-        tcg_debug_assert(HAVE_FACILITY(EXT_IMM));
         tgen_ori(s, type, dest, val & 0x00000000ffffffffull);
         tgen_ori(s, type, dest, val & 0xffffffff00000000ull);
     }
@@ -1248,15 +1170,13 @@ static void tgen_ori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
 static void tgen_xori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
 {
     /* Try all 48-bit insns that can perform it in one go.  */
-    if (HAVE_FACILITY(EXT_IMM)) {
-        if ((val & 0xffffffff00000000ull) == 0) {
-            tcg_out_insn(s, RIL, XILF, dest, val);
-            return;
-        }
-        if ((val & 0x00000000ffffffffull) == 0) {
-            tcg_out_insn(s, RIL, XIHF, dest, val >> 32);
-            return;
-        }
+    if ((val & 0xffffffff00000000ull) == 0) {
+        tcg_out_insn(s, RIL, XILF, dest, val);
+        return;
+    }
+    if ((val & 0x00000000ffffffffull) == 0) {
+        tcg_out_insn(s, RIL, XIHF, dest, val >> 32);
+        return;
     }
 
     if (maybe_out_small_movi(s, type, TCG_TMP0, val)) {
@@ -1267,7 +1187,6 @@ static void tgen_xori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
         }
     } else {
         /* Perform the xor by parts.  */
-        tcg_debug_assert(HAVE_FACILITY(EXT_IMM));
         if (val & 0xffffffff) {
             tcg_out_insn(s, RIL, XILF, dest, val);
         }
@@ -1301,16 +1220,15 @@ static int tgen_cmp(TCGContext *s, TCGType type, TCGCond c, TCGReg r1,
             goto exit;
         }
 
-        if (HAVE_FACILITY(EXT_IMM)) {
-            if (type == TCG_TYPE_I32) {
-                op = (is_unsigned ? RIL_CLFI : RIL_CFI);
-                tcg_out_insn_RIL(s, op, r1, c2);
-                goto exit;
-            } else if (c2 == (is_unsigned ? (TCGArg)(uint32_t)c2 : (TCGArg)(int32_t)c2)) {
-                op = (is_unsigned ? RIL_CLGFI : RIL_CGFI);
-                tcg_out_insn_RIL(s, op, r1, c2);
-                goto exit;
-            }
+        if (type == TCG_TYPE_I32) {
+            op = (is_unsigned ? RIL_CLFI : RIL_CFI);
+            tcg_out_insn_RIL(s, op, r1, c2);
+            goto exit;
+        }
+        if (c2 == (is_unsigned ? (TCGArg)(uint32_t)c2 : (TCGArg)(int32_t)c2)) {
+            op = (is_unsigned ? RIL_CLGFI : RIL_CGFI);
+            tcg_out_insn_RIL(s, op, r1, c2);
+            goto exit;
         }
 
         /* Use the constant pool, but not for small constants.  */
@@ -1318,16 +1236,9 @@ static int tgen_cmp(TCGContext *s, TCGType type, TCGCond c, TCGReg r1,
             c2 = TCG_TMP0;
             /* fall through to reg-reg */
         } else {
-            if (type == TCG_TYPE_I32) {
-                op = (is_unsigned ? RIL_CLRL : RIL_CRL);
-                tcg_out_insn_RIL(s, op, r1, 0);
-                new_pool_label(s, (uint32_t)c2, R_390_PC32DBL,
-                               s->code_ptr - 2, 2 + 4);
-            } else {
-                op = (is_unsigned ? RIL_CLGRL : RIL_CGRL);
-                tcg_out_insn_RIL(s, op, r1, 0);
-                new_pool_label(s, c2, R_390_PC32DBL, s->code_ptr - 2, 2);
-            }
+            op = (is_unsigned ? RIL_CLGRL : RIL_CGRL);
+            tcg_out_insn_RIL(s, op, r1, 0);
+            new_pool_label(s, c2, R_390_PC32DBL, s->code_ptr - 2, 2);
             goto exit;
         }
     }
@@ -2072,10 +1983,8 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
                     tcg_out_insn(s, RI, AHI, a0, a2);
                     break;
                 }
-                if (HAVE_FACILITY(EXT_IMM)) {
-                    tcg_out_insn(s, RIL, AFI, a0, a2);
-                    break;
-                }
+                tcg_out_insn(s, RIL, AFI, a0, a2);
+                break;
             }
             tcg_out_mem(s, RX_LA, RXY_LAY, a0, a1, TCG_REG_NONE, a2);
         } else if (a0 == a1) {
@@ -2326,17 +2235,17 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
                     tcg_out_insn(s, RI, AGHI, a0, a2);
                     break;
                 }
-                if (HAVE_FACILITY(EXT_IMM)) {
-                    if (a2 == (int32_t)a2) {
-                        tcg_out_insn(s, RIL, AGFI, a0, a2);
-                        break;
-                    } else if (a2 == (uint32_t)a2) {
-                        tcg_out_insn(s, RIL, ALGFI, a0, a2);
-                        break;
-                    } else if (-a2 == (uint32_t)-a2) {
-                        tcg_out_insn(s, RIL, SLGFI, a0, -a2);
-                        break;
-                    }
+                if (a2 == (int32_t)a2) {
+                    tcg_out_insn(s, RIL, AGFI, a0, a2);
+                    break;
+                }
+                if (a2 == (uint32_t)a2) {
+                    tcg_out_insn(s, RIL, ALGFI, a0, a2);
+                    break;
+                }
+                if (-a2 == (uint32_t)-a2) {
+                    tcg_out_insn(s, RIL, SLGFI, a0, -a2);
+                    break;
                 }
             }
             tcg_out_mem(s, RX_LA, RXY_LAY, a0, a1, TCG_REG_NONE, a2);
@@ -3137,15 +3046,11 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
     case INDEX_op_add2_i32:
     case INDEX_op_sub2_i32:
-        return (HAVE_FACILITY(EXT_IMM)
-                ? C_O2_I4(r, r, 0, 1, ri, r)
-                : C_O2_I4(r, r, 0, 1, r, r));
+        return C_O2_I4(r, r, 0, 1, ri, r);
 
     case INDEX_op_add2_i64:
     case INDEX_op_sub2_i64:
-        return (HAVE_FACILITY(EXT_IMM)
-                ? C_O2_I4(r, r, 0, 1, rA, r)
-                : C_O2_I4(r, r, 0, 1, r, r));
+        return C_O2_I4(r, r, 0, 1, rA, r);
 
     case INDEX_op_st_vec:
         return C_O0_I2(v, r);
@@ -3242,6 +3147,10 @@ static void query_s390_facilities(void)
         which = "long-displacement";
         goto fail;
     }
+    if (!HAVE_FACILITY(EXT_IMM)) {
+        which = "extended-immediate";
+        goto fail;
+    }
     return;
 
  fail:
-- 
2.34.1


