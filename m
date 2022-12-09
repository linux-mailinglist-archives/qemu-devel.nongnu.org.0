Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24972647C1A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 03:17:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Slx-0005zP-2s; Thu, 08 Dec 2022 21:05:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Slv-0005z9-SF
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:55 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Slt-0001xU-Ui
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:55 -0500
Received: by mail-ot1-x32c.google.com with SMTP id
 p24-20020a0568301d5800b0066e6dc09be5so1982002oth.8
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 18:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZZ4VRWcd/3v2ZpQqxpOvmExXeCfgt0ZAkQUAPsPFAv4=;
 b=XStexhSVBCjyCq9pMVOOtsEmM3gtG5ouAjxjxKEDK4f4IT3/b+X1akvSh5Jnjc+Bkk
 7oT/A6RBtPm+mCtI767LBOH54HYZp/7DEq9iQsyUcJRkDdPQ7CjAAorvTgqJKzO6t1ni
 v1RTpD5Y1l57Yz1q2ug6A17y4uBuhUrMuuHh18ze8UVxAUPyVUATT2vxoTqhOoiM+9qI
 hgtFIQhniKB6RclNGB9y5z2GAwdXu/HtR2kmeGjQwPxaRSSK6ZgiQ0He6Rz/r+P4W08P
 oOSHMCfe0ggDHqm9FJdg1mYY7D20X83GS/ThgfUHSyS+jSD4WJo1ttJnWNkTzPiZmdWa
 IsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZZ4VRWcd/3v2ZpQqxpOvmExXeCfgt0ZAkQUAPsPFAv4=;
 b=6YdieSRd5hm3/Y1kb5/L6d5FFoz3PLH9iuuwvhrUkW7jIsiagp+BFFEq1s62zlz9mH
 rTa90Xm4+Nl5V1R775HBR3ByKuTF6Rc61rTH7Bj++ifnpApcHZ/qc3G0YbRjYgMVj4EN
 jOdHHvoVz1dVBk0dgAI1xYnI+aulw35tZwufU0XpehZwAme3misIck9/Z8E/swakvUJt
 Mc7lVBvTX3IxMFeeb7tvmy1G7yQv2Al9aGZfn/hsEP0CyVzvS9d1uo+WRjpSwvi79ZLh
 fzoDV5anUUTloDlu+qCuRzFE7YAJS25dId+q+Rc6jM3uFIyBe6Pp29SRAi9R/ls8rFMU
 19Kw==
X-Gm-Message-State: ANoB5pmaENyTyBbQOh+2/F+UODqCNt0hJRuIB7c3bclJduFiYw7ydY+a
 RzM+fgOlRsa6RARPI0WCUUzOt3xCPFV+V4Lxdx8=
X-Google-Smtp-Source: AA0mqf4FPeMl5TTfWjNt0SOyTHIAexovWpGuERpD0rPpfyhqBf2rUQNntu9JK4QSc0IarbjcPJmLcg==
X-Received: by 2002:a9d:6511:0:b0:661:dfeb:ea2a with SMTP id
 i17-20020a9d6511000000b00661dfebea2amr1661759otl.15.1670551552666; 
 Thu, 08 Dec 2022 18:05:52 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:d298:de6f:2ed:87a4])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a05683004ce00b0066f7e1188f0sm53531otd.68.2022.12.08.18.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 18:05:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v4 17/27] tcg/s390x: Tighten constraints for or_i64 and xor_i64
Date: Thu,  8 Dec 2022 20:05:20 -0600
Message-Id: <20221209020530.396391-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209020530.396391-1-richard.henderson@linaro.org>
References: <20221209020530.396391-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
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

Drop support for sequential OR and XOR, as the serial dependency is
slower than loading the constant first.  Let the register allocator
handle such immediates by matching only what one insn can achieve.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target-con-set.h |   1 +
 tcg/s390x/tcg-target-con-str.h |   1 +
 tcg/s390x/tcg-target.c.inc     | 114 ++++++++++++++++-----------------
 3 files changed, 56 insertions(+), 60 deletions(-)

diff --git a/tcg/s390x/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
index b1a89a88ba..34ae4c7743 100644
--- a/tcg/s390x/tcg-target-con-set.h
+++ b/tcg/s390x/tcg-target-con-set.h
@@ -24,6 +24,7 @@ C_O1_I2(r, 0, rI)
 C_O1_I2(r, 0, rJ)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, r, rJ)
+C_O1_I2(r, r, rK)
 C_O1_I2(r, rZ, r)
 C_O1_I2(v, v, r)
 C_O1_I2(v, v, v)
diff --git a/tcg/s390x/tcg-target-con-str.h b/tcg/s390x/tcg-target-con-str.h
index 76446aecae..7b910d6d11 100644
--- a/tcg/s390x/tcg-target-con-str.h
+++ b/tcg/s390x/tcg-target-con-str.h
@@ -20,4 +20,5 @@ REGS('o', 0xaaaa) /* odd numbered general regs */
 CONST('A', TCG_CT_CONST_S33)
 CONST('I', TCG_CT_CONST_S16)
 CONST('J', TCG_CT_CONST_S32)
+CONST('K', TCG_CT_CONST_P32)
 CONST('Z', TCG_CT_CONST_ZERO)
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index fc304327fc..2a7410ba58 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -37,6 +37,7 @@
 #define TCG_CT_CONST_S32   0x200
 #define TCG_CT_CONST_S33   0x400
 #define TCG_CT_CONST_ZERO  0x800
+#define TCG_CT_CONST_P32   0x1000
 
 #define ALL_GENERAL_REGS     MAKE_64BIT_MASK(0, 16)
 #define ALL_VECTOR_REGS      MAKE_64BIT_MASK(32, 32)
@@ -507,6 +508,28 @@ static bool patch_reloc(tcg_insn_unit *src_rw, int type,
     return false;
 }
 
+static int is_const_p16(uint64_t val)
+{
+    for (int i = 0; i < 4; ++i) {
+        uint64_t mask = 0xffffull << (i * 16);
+        if ((val & ~mask) == 0) {
+            return i;
+        }
+    }
+    return -1;
+}
+
+static int is_const_p32(uint64_t val)
+{
+    if ((val & 0xffffffff00000000ull) == 0) {
+        return 0;
+    }
+    if ((val & 0x00000000ffffffffull) == 0) {
+        return 1;
+    }
+    return -1;
+}
+
 /* Test if a constant matches the constraint. */
 static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 {
@@ -529,6 +552,14 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
         return val == 0;
     }
 
+    /*
+     * Note that is_const_p16 is a subset of is_const_p32,
+     * so we don't need both constraints.
+     */
+    if ((ct & TCG_CT_CONST_P32) && is_const_p32(val) >= 0) {
+        return true;
+    }
+
     return 0;
 }
 
@@ -1125,7 +1156,7 @@ static void tgen_andi(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
     }
 }
 
-static void tgen_ori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
+static void tgen_ori(TCGContext *s, TCGReg dest, uint64_t val)
 {
     static const S390Opcode oi_insns[4] = {
         RI_OILL, RI_OILH, RI_OIHL, RI_OIHH
@@ -1136,70 +1167,32 @@ static void tgen_ori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
 
     int i;
 
-    /* Look for no-op.  */
-    if (unlikely(val == 0)) {
+    i = is_const_p16(val);
+    if (i >= 0) {
+        tcg_out_insn_RI(s, oi_insns[i], dest, val >> (i * 16));
         return;
     }
 
-    /* Try all 32-bit insns that can perform it in one go.  */
-    for (i = 0; i < 4; i++) {
-        tcg_target_ulong mask = (0xffffull << i * 16);
-        if ((val & mask) != 0 && (val & ~mask) == 0) {
-            tcg_out_insn_RI(s, oi_insns[i], dest, val >> i * 16);
-            return;
-        }
+    i = is_const_p32(val);
+    if (i >= 0) {
+        tcg_out_insn_RIL(s, oif_insns[i], dest, val >> (i * 32));
+        return;
     }
 
-    /* Try all 48-bit insns that can perform it in one go.  */
-    for (i = 0; i < 2; i++) {
-        tcg_target_ulong mask = (0xffffffffull << i * 32);
-        if ((val & mask) != 0 && (val & ~mask) == 0) {
-            tcg_out_insn_RIL(s, oif_insns[i], dest, val >> i * 32);
-            return;
-        }
-    }
-
-    if (maybe_out_small_movi(s, type, TCG_TMP0, val)) {
-        if (type == TCG_TYPE_I32) {
-            tcg_out_insn(s, RR, OR, dest, TCG_TMP0);
-        } else {
-            tcg_out_insn(s, RRE, OGR, dest, TCG_TMP0);
-        }
-    } else {
-        /* Perform the OR via sequential modifications to the high and
-           low parts.  Do this via recursion to handle 16-bit vs 32-bit
-           masks in each half.  */
-        tgen_ori(s, type, dest, val & 0x00000000ffffffffull);
-        tgen_ori(s, type, dest, val & 0xffffffff00000000ull);
-    }
+    g_assert_not_reached();
 }
 
-static void tgen_xori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
+static void tgen_xori(TCGContext *s, TCGReg dest, uint64_t val)
 {
-    /* Try all 48-bit insns that can perform it in one go.  */
-    if ((val & 0xffffffff00000000ull) == 0) {
+    switch (is_const_p32(val)) {
+    case 0:
         tcg_out_insn(s, RIL, XILF, dest, val);
-        return;
-    }
-    if ((val & 0x00000000ffffffffull) == 0) {
+        break;
+    case 1:
         tcg_out_insn(s, RIL, XIHF, dest, val >> 32);
-        return;
-    }
-
-    if (maybe_out_small_movi(s, type, TCG_TMP0, val)) {
-        if (type == TCG_TYPE_I32) {
-            tcg_out_insn(s, RR, XR, dest, TCG_TMP0);
-        } else {
-            tcg_out_insn(s, RRE, XGR, dest, TCG_TMP0);
-        }
-    } else {
-        /* Perform the xor by parts.  */
-        if (val & 0xffffffff) {
-            tcg_out_insn(s, RIL, XILF, dest, val);
-        }
-        if (val > 0xffffffff) {
-            tcg_out_insn(s, RIL, XIHF, dest, val >> 32);
-        }
+        break;
+    default:
+        g_assert_not_reached();
     }
 }
 
@@ -1994,7 +1987,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         a0 = args[0], a1 = args[1], a2 = (uint32_t)args[2];
         if (const_args[2]) {
             tcg_out_mov(s, TCG_TYPE_I32, a0, a1);
-            tgen_ori(s, TCG_TYPE_I32, a0, a2);
+            tgen_ori(s, a0, a2);
         } else if (a0 == a1) {
             tcg_out_insn(s, RR, OR, a0, a2);
         } else {
@@ -2256,7 +2249,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[2]) {
             tcg_out_mov(s, TCG_TYPE_I64, a0, a1);
-            tgen_ori(s, TCG_TYPE_I64, a0, a2);
+            tgen_ori(s, a0, a2);
         } else {
             tcg_out_insn(s, RRFa, OGRK, a0, a1, a2);
         }
@@ -2265,7 +2258,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[2]) {
             tcg_out_mov(s, TCG_TYPE_I64, a0, a1);
-            tgen_xori(s, TCG_TYPE_I64, a0, a2);
+            tgen_xori(s, a0, a2);
         } else {
             tcg_out_insn(s, RRFa, XGRK, a0, a1, a2);
         }
@@ -2944,10 +2937,11 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_and_i32:
     case INDEX_op_and_i64:
     case INDEX_op_or_i32:
-    case INDEX_op_or_i64:
     case INDEX_op_xor_i32:
-    case INDEX_op_xor_i64:
         return C_O1_I2(r, r, ri);
+    case INDEX_op_or_i64:
+    case INDEX_op_xor_i64:
+        return C_O1_I2(r, r, rK);
 
     case INDEX_op_mul_i32:
         return (HAVE_FACILITY(MISC_INSN_EXT2)
-- 
2.34.1


