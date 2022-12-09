Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B156F647BF8
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 03:07:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Sln-0005wX-8v; Thu, 08 Dec 2022 21:05:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Slk-0005ua-Cj
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:44 -0500
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Sli-0001vI-DW
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:44 -0500
Received: by mail-ot1-x331.google.com with SMTP id
 cn2-20020a056830658200b0066c74617e3dso1997404otb.2
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 18:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oaWPLzYHFjhFB1tuAfWhCD/kpjISuCEiRwLxQm7Lwyo=;
 b=t6QfxqlvvSfBCFUzkB6xQpCnJNSjSPFHBMFZs4dueikNRvNZI4Hoot8TisRNQqS7VE
 khtRS5EZ/Q+fw4l0eCUxODb7QnAEvMzzqrITegy3TqP2NmRazhVsqXfEZ9PViWOBtQqP
 KFTOy3EuiGOpoNB+o39GDntXjwvAlP4RUTgghkrurshRLcAs9h306w098Z3/nAO41wtO
 J39DGupOq9wNu3bhtUbChiQHScjhsnfcUnDFF+fCqpILEfQaJcmVJwKDRCJrkTmD1kGB
 XKLqTFExkWL5DVPG7XRFWAUpCxBPZq7iZWMs+qlI7Gus8g1gh0oHjW/OjQp48k6imqur
 F8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oaWPLzYHFjhFB1tuAfWhCD/kpjISuCEiRwLxQm7Lwyo=;
 b=GUicdQTK+S99bN7v3kZT6r3KOQmr8Yq0zG3JxR+6PyRLnhdL753UJdzALtkzL4VMhD
 KmQyum6gKAuvQ/syP94D/Nc7EzVYwKDd2Dj6l1Zm1YtDZoBmNiudftBqoLrS4QpBusfz
 I/6Cb13kXoo7J/yRNLm8KuwaXKdjSMased7pk/xGC428HnZt3s1JBlShUYvR8EF+phSY
 5TMSwJkvqe41IlC/LSK5eZmf7n4wHplIzkV/WDqKX/BysK6Jx4K/Gevg/1mI2vUsJhEJ
 xW3mskcGJnBOqXeZBca7OfZgHrTNXlMs7aY/e7LN77BeYMQY7G6PV65oMCO48e/iOM7F
 3pKQ==
X-Gm-Message-State: ANoB5pn23aCZ7kMncXiREo9PQ+m5SLNZ3U86Cr26eXH3eX5qAGhNP+1D
 ScubXLoqNzZ43sUGc1b9tsrgfadotdYZm85qO+k=
X-Google-Smtp-Source: AA0mqf6w0thu/cl+rMLco+EknM0qJgjyJ4Xa60YONLxd4M4xmA+jqwdcPM4nprZcZkbSz6XgGcxZ3Q==
X-Received: by 2002:a9d:6b82:0:b0:670:5e21:70f0 with SMTP id
 b2-20020a9d6b82000000b006705e2170f0mr1904060otq.22.1670551541233; 
 Thu, 08 Dec 2022 18:05:41 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:d298:de6f:2ed:87a4])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a05683004ce00b0066f7e1188f0sm53531otd.68.2022.12.08.18.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 18:05:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v4 07/27] tcg/s390x: Check for general-instruction-extension
 facility at startup
Date: Thu,  8 Dec 2022 20:05:10 -0600
Message-Id: <20221209020530.396391-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209020530.396391-1-richard.henderson@linaro.org>
References: <20221209020530.396391-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
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

The general-instruction-extension facility was introduced in z10,
which itself was end-of-life in 2019.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h     |  10 ++--
 tcg/s390x/tcg-target.c.inc | 100 ++++++++++++++++---------------------
 2 files changed, 49 insertions(+), 61 deletions(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 126ba1048a..d47e8ba66a 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -57,10 +57,10 @@ typedef enum TCGReg {
 #define FACILITY_ZARCH_ACTIVE         2
 #define FACILITY_LONG_DISP            18
 #define FACILITY_EXT_IMM              21
+#define FACILITY_GEN_INST_EXT         34
 
 /* Facilities that are checked at runtime. */
 
-#define FACILITY_GEN_INST_EXT         34
 #define FACILITY_LOAD_ON_COND         45
 #define FACILITY_FAST_BCR_SER         FACILITY_LOAD_ON_COND
 #define FACILITY_DISTINCT_OPS         FACILITY_LOAD_ON_COND
@@ -92,8 +92,8 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_clz_i32        0
 #define TCG_TARGET_HAS_ctz_i32        0
 #define TCG_TARGET_HAS_ctpop_i32      0
-#define TCG_TARGET_HAS_deposit_i32    HAVE_FACILITY(GEN_INST_EXT)
-#define TCG_TARGET_HAS_extract_i32    HAVE_FACILITY(GEN_INST_EXT)
+#define TCG_TARGET_HAS_deposit_i32    1
+#define TCG_TARGET_HAS_extract_i32    1
 #define TCG_TARGET_HAS_sextract_i32   0
 #define TCG_TARGET_HAS_extract2_i32   0
 #define TCG_TARGET_HAS_movcond_i32    1
@@ -129,8 +129,8 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_clz_i64        1
 #define TCG_TARGET_HAS_ctz_i64        0
 #define TCG_TARGET_HAS_ctpop_i64      0
-#define TCG_TARGET_HAS_deposit_i64    HAVE_FACILITY(GEN_INST_EXT)
-#define TCG_TARGET_HAS_extract_i64    HAVE_FACILITY(GEN_INST_EXT)
+#define TCG_TARGET_HAS_deposit_i64    1
+#define TCG_TARGET_HAS_extract_i64    1
 #define TCG_TARGET_HAS_sextract_i64   0
 #define TCG_TARGET_HAS_extract2_i64   0
 #define TCG_TARGET_HAS_movcond_i64    1
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 42e161cc7e..f0b581293c 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -843,15 +843,8 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     }
 
     /* Otherwise, stuff it in the constant pool.  */
-    if (HAVE_FACILITY(GEN_INST_EXT)) {
-        tcg_out_insn(s, RIL, LGRL, ret, 0);
-        new_pool_label(s, sval, R_390_PC32DBL, s->code_ptr - 2, 2);
-    } else {
-        TCGReg base = ret ? ret : TCG_TMP0;
-        tcg_out_insn(s, RIL, LARL, base, 0);
-        new_pool_label(s, sval, R_390_PC32DBL, s->code_ptr - 2, 2);
-        tcg_out_insn(s, RXY, LG, ret, base, TCG_REG_NONE, 0);
-    }
+    tcg_out_insn(s, RIL, LGRL, ret, 0);
+    new_pool_label(s, sval, R_390_PC32DBL, s->code_ptr - 2, 2);
 }
 
 /* Emit a load/store type instruction.  Inputs are:
@@ -1105,7 +1098,7 @@ static void tgen_andi(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
             return;
         }
     }
-    if (HAVE_FACILITY(GEN_INST_EXT) && risbg_mask(val)) {
+    if (risbg_mask(val)) {
         tgen_andi_risbg(s, dest, dest, val);
         return;
     }
@@ -1460,48 +1453,47 @@ static void tgen_brcond(TCGContext *s, TCGType type, TCGCond c,
                         TCGReg r1, TCGArg c2, int c2const, TCGLabel *l)
 {
     int cc;
+    bool is_unsigned = is_unsigned_cond(c);
+    bool in_range;
+    S390Opcode opc;
 
-    if (HAVE_FACILITY(GEN_INST_EXT)) {
-        bool is_unsigned = is_unsigned_cond(c);
-        bool in_range;
-        S390Opcode opc;
+    cc = tcg_cond_to_s390_cond[c];
 
-        cc = tcg_cond_to_s390_cond[c];
+    if (!c2const) {
+        opc = (type == TCG_TYPE_I32
+               ? (is_unsigned ? RIE_CLRJ : RIE_CRJ)
+               : (is_unsigned ? RIE_CLGRJ : RIE_CGRJ));
+        tgen_compare_branch(s, opc, cc, r1, c2, l);
+        return;
+    }
 
-        if (!c2const) {
-            opc = (type == TCG_TYPE_I32
-                   ? (is_unsigned ? RIE_CLRJ : RIE_CRJ)
-                   : (is_unsigned ? RIE_CLGRJ : RIE_CGRJ));
-            tgen_compare_branch(s, opc, cc, r1, c2, l);
-            return;
-        }
-
-        /* COMPARE IMMEDIATE AND BRANCH RELATIVE has an 8-bit immediate field.
-           If the immediate we've been given does not fit that range, we'll
-           fall back to separate compare and branch instructions using the
-           larger comparison range afforded by COMPARE IMMEDIATE.  */
-        if (type == TCG_TYPE_I32) {
-            if (is_unsigned) {
-                opc = RIE_CLIJ;
-                in_range = (uint32_t)c2 == (uint8_t)c2;
-            } else {
-                opc = RIE_CIJ;
-                in_range = (int32_t)c2 == (int8_t)c2;
-            }
+    /*
+     * COMPARE IMMEDIATE AND BRANCH RELATIVE has an 8-bit immediate field.
+     * If the immediate we've been given does not fit that range, we'll
+     * fall back to separate compare and branch instructions using the
+     * larger comparison range afforded by COMPARE IMMEDIATE.
+     */
+    if (type == TCG_TYPE_I32) {
+        if (is_unsigned) {
+            opc = RIE_CLIJ;
+            in_range = (uint32_t)c2 == (uint8_t)c2;
         } else {
-            if (is_unsigned) {
-                opc = RIE_CLGIJ;
-                in_range = (uint64_t)c2 == (uint8_t)c2;
-            } else {
-                opc = RIE_CGIJ;
-                in_range = (int64_t)c2 == (int8_t)c2;
-            }
+            opc = RIE_CIJ;
+            in_range = (int32_t)c2 == (int8_t)c2;
         }
-        if (in_range) {
-            tgen_compare_imm_branch(s, opc, cc, r1, c2, l);
-            return;
+    } else {
+        if (is_unsigned) {
+            opc = RIE_CLGIJ;
+            in_range = (uint64_t)c2 == (uint8_t)c2;
+        } else {
+            opc = RIE_CGIJ;
+            in_range = (int64_t)c2 == (int8_t)c2;
         }
     }
+    if (in_range) {
+        tgen_compare_imm_branch(s, opc, cc, r1, c2, l);
+        return;
+    }
 
     cc = tgen_cmp(s, type, c, r1, c2, c2const, false);
     tgen_branch(s, cc, l);
@@ -1659,7 +1651,7 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, MemOp opc,
        cross pages using the address of the last byte of the access.  */
     a_off = (a_bits >= s_bits ? 0 : s_mask - a_mask);
     tlb_mask = (uint64_t)TARGET_PAGE_MASK | a_mask;
-    if (HAVE_FACILITY(GEN_INST_EXT) && a_off == 0) {
+    if (a_off == 0) {
         tgen_andi_risbg(s, TCG_REG_R3, addr_reg, tlb_mask);
     } else {
         tcg_out_insn(s, RX, LA, TCG_REG_R3, addr_reg, TCG_REG_NONE, a_off);
@@ -2972,17 +2964,9 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
                 : C_O1_I2(r, 0, ri));
 
     case INDEX_op_mul_i32:
-        /* If we have the general-instruction-extensions, then we have
-           MULTIPLY SINGLE IMMEDIATE with a signed 32-bit, otherwise we
-           have only MULTIPLY HALFWORD IMMEDIATE, with a signed 16-bit.  */
-        return (HAVE_FACILITY(GEN_INST_EXT)
-                ? C_O1_I2(r, 0, ri)
-                : C_O1_I2(r, 0, rI));
-
+        return C_O1_I2(r, 0, ri);
     case INDEX_op_mul_i64:
-        return (HAVE_FACILITY(GEN_INST_EXT)
-                ? C_O1_I2(r, 0, rJ)
-                : C_O1_I2(r, 0, rI));
+        return C_O1_I2(r, 0, rJ);
 
     case INDEX_op_shl_i32:
     case INDEX_op_shr_i32:
@@ -3151,6 +3135,10 @@ static void query_s390_facilities(void)
         which = "extended-immediate";
         goto fail;
     }
+    if (!HAVE_FACILITY(GEN_INST_EXT)) {
+        which = "general-instructions-extension";
+        goto fail;
+    }
     return;
 
  fail:
-- 
2.34.1


