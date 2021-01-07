Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49ACE2EE735
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:53:03 +0100 (CET)
Received: from localhost ([::1]:42130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxcHG-0005GO-Bm
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhZ-0001ZH-S1
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:16:13 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:36633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhS-0001i8-35
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:16:07 -0500
Received: by mail-pj1-x1033.google.com with SMTP id l23so4484646pjg.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XwAGDhPsMBTlCDYICLuTcDF1WAEZQ1i2iAFKQ493O/8=;
 b=O2UId8To7KkQyHjJydNFaX+TqaoN1AGOZY9/Q7F3cZUxKk1JoF+3HK+u0vDam2Z65t
 IYeW5Z2YvTk/EocTkJiZYlqNIzJZxEFf/o8gDUFWKEUg6SJrLmnK3a2hzsGlnVWPQ8IV
 oh4mAyJcR7Fpn1vb4fLU5m4xG/E2d70B6hdt1J6JQq9vaJ4IcYDc6c53ypIM2ve6lGNA
 Ufu1HDXmi14TUlESMfvksMkTIB2YVmDFB35xePa5ZG0UvoGq8scMBQbgUoan4PsnEoh6
 YO3ZDZpAX3dfDdWeacufiZV1GJSQlFncSzTyEj10BKB3vAadg+5YpvLA8BMux3FNmSeJ
 IK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XwAGDhPsMBTlCDYICLuTcDF1WAEZQ1i2iAFKQ493O/8=;
 b=GMqCjQD/h6NGt4ZcP79uZQQ+0ybzYs+IgdbX26NKDtzox57MIcIeuvZa1W6sEtUP2p
 tSeQ0QFkjAQN+Iceb1nBN2/XTdyrxKU7zeogP0Xo2BMv3kgkTy8OndFS0UwTu3RIzhMa
 EEHSW2mOB5O6hesMA6iyP+5kb86EmTi0soBYHMEJhv9n9fovDkwNBcFRfCopBl7L6qol
 MPlC5uSn+ynG99dycn6+LO1X3Z4ROFdh0iVqvoTwqD6ya4RMwKvUS23SC/rZlKFBt/Us
 dxhOg229b83ARPVRgmYujftAGq3ynwDylo8QwTpWOGLoA4YMg/x69ukkEwrdfBiIcHwB
 FUUQ==
X-Gm-Message-State: AOAM530Tp0iIkD1RHl/ypuA7QdZO005g1vTZQFcAMeZdWbzCJz/fjKva
 D9QZEXyJcuGPHPDzs6DqSDv6FnrW9K08Bw==
X-Google-Smtp-Source: ABdhPJxI2vCjKsHX/eFS+Vf4LJqIZ4nD1BocEvJZEEoQ9lRea6wvRI4adE8eothWZ7VTXFUt0vrDRA==
X-Received: by 2002:a17:90b:46ca:: with SMTP id
 jx10mr186269pjb.208.1610050555660; 
 Thu, 07 Jan 2021 12:15:55 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:15:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 37/47] tcg/s390: Support split-wx code generation
Date: Thu,  7 Jan 2021 10:14:38 -1000
Message-Id: <20210107201448.1152301-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390/tcg-target.h     |  2 +-
 tcg/s390/tcg-target.c.inc | 69 +++++++++++++++++----------------------
 2 files changed, 31 insertions(+), 40 deletions(-)

diff --git a/tcg/s390/tcg-target.h b/tcg/s390/tcg-target.h
index b8f4296e4b..4edcb06044 100644
--- a/tcg/s390/tcg-target.h
+++ b/tcg/s390/tcg-target.h
@@ -159,6 +159,6 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_SUPPORT_MIRROR       0
+#define TCG_TARGET_SUPPORT_MIRROR       1
 
 #endif
diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
index e4c61fc014..582a8ef941 100644
--- a/tcg/s390/tcg-target.c.inc
+++ b/tcg/s390/tcg-target.c.inc
@@ -363,36 +363,37 @@ static void * const qemu_st_helpers[16] = {
 };
 #endif
 
-static tcg_insn_unit *tb_ret_addr;
+static const tcg_insn_unit *tb_ret_addr;
 uint64_t s390_facilities;
 
-static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
+static bool patch_reloc(tcg_insn_unit *src_rw, int type,
                         intptr_t value, intptr_t addend)
 {
+    const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
     intptr_t pcrel2;
     uint32_t old;
 
     value += addend;
-    pcrel2 = (tcg_insn_unit *)value - code_ptr;
+    pcrel2 = (tcg_insn_unit *)value - src_rx;
 
     switch (type) {
     case R_390_PC16DBL:
         if (pcrel2 == (int16_t)pcrel2) {
-            tcg_patch16(code_ptr, pcrel2);
+            tcg_patch16(src_rw, pcrel2);
             return true;
         }
         break;
     case R_390_PC32DBL:
         if (pcrel2 == (int32_t)pcrel2) {
-            tcg_patch32(code_ptr, pcrel2);
+            tcg_patch32(src_rw, pcrel2);
             return true;
         }
         break;
     case R_390_20:
         if (value == sextract64(value, 0, 20)) {
-            old = *(uint32_t *)code_ptr & 0xf00000ff;
+            old = *(uint32_t *)src_rw & 0xf00000ff;
             old |= ((value & 0xfff) << 16) | ((value & 0xff000) >> 4);
-            tcg_patch32(code_ptr, old);
+            tcg_patch32(src_rw, old);
             return true;
         }
         break;
@@ -730,7 +731,8 @@ static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
 }
 
 /* load data from an absolute host address */
-static void tcg_out_ld_abs(TCGContext *s, TCGType type, TCGReg dest, void *abs)
+static void tcg_out_ld_abs(TCGContext *s, TCGType type,
+                           TCGReg dest, const void *abs)
 {
     intptr_t addr = (intptr_t)abs;
 
@@ -1304,7 +1306,7 @@ static void tgen_extract(TCGContext *s, TCGReg dest, TCGReg src,
 
 static void tgen_gotoi(TCGContext *s, int cc, const tcg_insn_unit *dest)
 {
-    ptrdiff_t off = dest - s->code_ptr;
+    ptrdiff_t off = tcg_pcrel_diff(s, dest) >> 1;
     if (off == (int16_t)off) {
         tcg_out_insn(s, RI, BRC, cc, off);
     } else if (off == (int32_t)off) {
@@ -1333,34 +1335,18 @@ static void tgen_branch(TCGContext *s, int cc, TCGLabel *l)
 static void tgen_compare_branch(TCGContext *s, S390Opcode opc, int cc,
                                 TCGReg r1, TCGReg r2, TCGLabel *l)
 {
-    intptr_t off = 0;
-
-    if (l->has_value) {
-        off = l->u.value_ptr - s->code_ptr;
-        tcg_debug_assert(off == (int16_t)off);
-    } else {
-        tcg_out_reloc(s, s->code_ptr + 1, R_390_PC16DBL, l, 2);
-    }
-
+    tcg_out_reloc(s, s->code_ptr + 1, R_390_PC16DBL, l, 2);
     tcg_out16(s, (opc & 0xff00) | (r1 << 4) | r2);
-    tcg_out16(s, off);
+    tcg_out16(s, 0);
     tcg_out16(s, cc << 12 | (opc & 0xff));
 }
 
 static void tgen_compare_imm_branch(TCGContext *s, S390Opcode opc, int cc,
                                     TCGReg r1, int i2, TCGLabel *l)
 {
-    tcg_target_long off = 0;
-
-    if (l->has_value) {
-        off = l->u.value_ptr - s->code_ptr;
-        tcg_debug_assert(off == (int16_t)off);
-    } else {
-        tcg_out_reloc(s, s->code_ptr + 1, R_390_PC16DBL, l, 2);
-    }
-
+    tcg_out_reloc(s, s->code_ptr + 1, R_390_PC16DBL, l, 2);
     tcg_out16(s, (opc & 0xff00) | (r1 << 4) | cc);
-    tcg_out16(s, off);
+    tcg_out16(s, 0);
     tcg_out16(s, (i2 << 8) | (opc & 0xff));
 }
 
@@ -1417,7 +1403,7 @@ static void tgen_brcond(TCGContext *s, TCGType type, TCGCond c,
 
 static void tcg_out_call(TCGContext *s, const tcg_insn_unit *dest)
 {
-    ptrdiff_t off = dest - s->code_ptr;
+    ptrdiff_t off = tcg_pcrel_diff(s, dest) >> 1;
     if (off == (int32_t)off) {
         tcg_out_insn(s, RIL, BRASL, TCG_REG_R14, off);
     } else {
@@ -1601,7 +1587,8 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, TCGMemOpIdx oi,
     label->oi = oi;
     label->datalo_reg = data;
     label->addrlo_reg = addr;
-    label->raddr = raddr;
+    /* TODO: Cast goes away when all hosts converted */
+    label->raddr = (void *)tcg_splitwx_to_rx(raddr);
     label->label_ptr[0] = label_ptr;
 }
 
@@ -1613,7 +1600,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     MemOp opc = get_memop(oi);
 
     if (!patch_reloc(lb->label_ptr[0], R_390_PC16DBL,
-                     (intptr_t)s->code_ptr, 2)) {
+                     (intptr_t)tcg_splitwx_to_rx(s->code_ptr), 2)) {
         return false;
     }
 
@@ -1638,7 +1625,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     MemOp opc = get_memop(oi);
 
     if (!patch_reloc(lb->label_ptr[0], R_390_PC16DBL,
-                     (intptr_t)s->code_ptr, 2)) {
+                     (intptr_t)tcg_splitwx_to_rx(s->code_ptr), 2)) {
         return false;
     }
 
@@ -1766,7 +1753,8 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_goto_tb:
         a0 = args[0];
         if (s->tb_jmp_insn_offset) {
-            /* branch displacement must be aligned for atomic patching;
+            /*
+             * branch displacement must be aligned for atomic patching;
              * see if we need to add extra nop before branch
              */
             if (!QEMU_PTR_IS_ALIGNED(s->code_ptr + 1, 4)) {
@@ -1779,7 +1767,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         } else {
             /* load address stored at s->tb_jmp_target_addr + a0 */
             tcg_out_ld_abs(s, TCG_TYPE_PTR, TCG_REG_TB,
-                           s->tb_jmp_target_addr + a0);
+                           tcg_splitwx_to_rx(s->tb_jmp_target_addr + a0));
             /* and go there */
             tcg_out_insn(s, RR, BCR, S390_CC_ALWAYS, TCG_REG_TB);
         }
@@ -1789,8 +1777,10 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
            TCG_REG_TB to the beginning of this TB.  */
         if (USE_REG_TB) {
             int ofs = -tcg_current_code_size(s);
-            assert(ofs == (int16_t)ofs);
-            tcg_out_insn(s, RI, AGHI, TCG_REG_TB, ofs);
+            /* All TB are restricted to 64KiB by unwind info. */
+            tcg_debug_assert(ofs == sextract64(ofs, 0, 20));
+            tcg_out_insn(s, RXY, LAY, TCG_REG_TB,
+                         TCG_REG_TB, TCG_REG_NONE, ofs);
         }
         break;
 
@@ -2561,11 +2551,12 @@ static void tcg_target_qemu_prologue(TCGContext *s)
      * Return path for goto_ptr. Set return value to 0, a-la exit_tb,
      * and fall through to the rest of the epilogue.
      */
-    tcg_code_gen_epilogue = s->code_ptr;
+    /* TODO: Cast goes away when all hosts converted */
+    tcg_code_gen_epilogue = (void *)tcg_splitwx_to_rx(s->code_ptr);
     tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R2, 0);
 
     /* TB epilogue */
-    tb_ret_addr = s->code_ptr;
+    tb_ret_addr = tcg_splitwx_to_rx(s->code_ptr);
 
     /* lmg %r6,%r15,fs+48(%r15) (restore registers) */
     tcg_out_insn(s, RXY, LMG, TCG_REG_R6, TCG_REG_R15, TCG_REG_R15,
-- 
2.25.1


