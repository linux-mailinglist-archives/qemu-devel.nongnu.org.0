Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D67812D9A1E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:39:36 +0100 (CET)
Received: from localhost ([::1]:58220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kop0h-0001E0-Vm
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:39:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSW-0002Cd-G5
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:16 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:37246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooST-00041Y-CE
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:16 -0500
Received: by mail-ot1-x32f.google.com with SMTP id o11so15761185ote.4
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dcqt/mgICWsadeLmqExwcaSBKbyWpQDlM1YBo4lkUJg=;
 b=J4FKI4XMRd4ABAhc5MJyYcLxavVS3WHMVb6OH/mMWIiANkq3xuinVVDrc6FvvSl4bk
 gzYjXqqfHX+oLcfiG7NkbpFA85QWCuNsbpUz4W3F/4eAu5uV5BPvOC7IwlVhfJloz1C+
 vI7utpER9W70wIG0f66BiV295akeSI5M3aJAZo4g9YTh6N1YIioJREdWGhGUjcPOuaAh
 kNZlS3FgMtu2UOQq+6Cc75DFSmXd/XHB62SGfPMit02B3PmR3Xob9o5/C17+IByMNVNg
 8UG8xbIiK6f/dmHrB10g+H0RzP09T44cLwVzLxLJAJtAjlY/DSS2w+l830JMKHU86hS5
 i5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dcqt/mgICWsadeLmqExwcaSBKbyWpQDlM1YBo4lkUJg=;
 b=kPXJYySnXlQLP0FX9ZcidZSe/eq0SXiTTCu1l/JKbB4SPsT2G9GcdodA4Rmq2aqdhI
 w4GrqYbTChNq2gVCKjVcf3uhpFfzQ503MhYMz0PtTiBlar8s8hj6DsQs8RV5NwdwgnVw
 pHZ69bJY62edfTs2/zO5mEUh8AGnWutz6qYC6WmThXxPuUTCOVfzwpGjAU5uRNjigyiT
 428aWWA6FG6MKuu0nfBzLII3MIbgwGZisKZ5iLv/IfLk6bR6jl1uo4p+a2v+tS7ortX8
 FW846RcebGS+9v1wSyqUZXGUOloqRqlnuaL/plUyVt2eHcPaJPndYctXTDnnjyreNkjC
 PIMg==
X-Gm-Message-State: AOAM532y1WJPip6VfEqTcZGRp5E9tJg2iytsuemSIU5D9GMB+y4u1cSn
 4gbt4fXHd0zTCzvjAqPPnTcY0UFoPWLHutZK
X-Google-Smtp-Source: ABdhPJxgUyazVI8wF3nnkSzbyLn96zMk8HAKF1+ApNzSMbNBfxgp9OooJa2KJ/2bShm6ml25idLC3w==
X-Received: by 2002:a05:6830:1f5a:: with SMTP id
 u26mr19803982oth.250.1607954651751; 
 Mon, 14 Dec 2020 06:04:11 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.04.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:04:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 33/43] tcg/s390: Support split-wx code generation
Date: Mon, 14 Dec 2020 08:03:04 -0600
Message-Id: <20201214140314.18544-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390/tcg-target.h     |  2 +-
 tcg/s390/tcg-target.c.inc | 69 +++++++++++++++++----------------------
 2 files changed, 31 insertions(+), 40 deletions(-)

diff --git a/tcg/s390/tcg-target.h b/tcg/s390/tcg-target.h
index fed3329e51..fc65f42650 100644
--- a/tcg/s390/tcg-target.h
+++ b/tcg/s390/tcg-target.h
@@ -158,6 +158,6 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
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


