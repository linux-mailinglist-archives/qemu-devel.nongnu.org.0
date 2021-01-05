Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 507FF2EB1D2
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:53:10 +0100 (CET)
Received: from localhost ([::1]:45258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqW5-0003rQ-B5
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:53:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq12-0003Fh-TW
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:21:04 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:55578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq10-0006mM-QH
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:21:04 -0500
Received: by mail-pj1-x1030.google.com with SMTP id lb18so9573pjb.5
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=RjsLWt3F7DefhddvmyHDtzHbHX1tk83XD8LIVsXHpX8=;
 b=qhm8XYo4JZMU4QVa31c11O0tILe9/lKoafWbH7xNi5ERuL2q/3xd7BMEuE1uS80XgL
 T333f6bMscJtTn28zIcJE8vzQIKxlMOoDfuNIEI/aFrvt3auHIVGrHvZpOerONcxXD6H
 S2XexIxdUhavlsFeK1Orx840wtwZBXJ3eW7JlZzc7N44v5AW7do97+vK63WKUcvslTGe
 ZMKZz9+dGFC4pb5qePtt7TqHIW1fy+m2ajWomYRlKym/WdZSxkCsgkaklSzjrjwQVKXK
 POM2jIlJn0cliagzG68HsP0la/pI6woHbpCTQ7Ldf//B97o8RKM1d+igVjVSicpxWJq6
 q5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RjsLWt3F7DefhddvmyHDtzHbHX1tk83XD8LIVsXHpX8=;
 b=E0Cygz4l+/BqxQ/uye9tQZ1f3jc1rtBD98Dx0QrYR6vXq//ngPXo4mGfEgm4itSpHn
 uY0CGsMwkUeLG8V+JhOVu9gwA5hl6A/lMkPNcbI0O+z8jpuQWXsddoMBzaFryV5n8yty
 IXN6d0Fj2AW2G2+F3OJn4XqNjdeSP6N0WCl3Ygs8C3j6RZc0GpL+UiFpBP+K3wjxzG+B
 t8Nnk/OhJrVLHTLt/m6Y+fLAIaAR1clAKTI8t+mX3howU8IQqRSRh3ZLKHdMUWV/eDYs
 5lRMfnMTB4XPSi2XvsZ16BHyweUvV7ST49tkftFNcPWXEh88iEljZrwefVtZPKnKmpRu
 kALw==
X-Gm-Message-State: AOAM532nbI/Jo4KiT4Gk8vY4D1zMF+VkoW2UrTSfPXQe12lAiPDa1c77
 XpjgoErh2zunFdwF0QfZf31ltrRrnKVDMg==
X-Google-Smtp-Source: ABdhPJwTAZUWsDtS+qfTnV5Tz7MB2n0ilTF3NOZgI5EvoHWBaW8DBJiS0Q9zNfocfPU79P1e9jdj4A==
X-Received: by 2002:a17:90b:78d:: with SMTP id l13mr258820pjz.51.1609867261190; 
 Tue, 05 Jan 2021 09:21:01 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:21:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 40/43] tcg/arm: Support split-wx code generation
Date: Tue,  5 Jan 2021 07:19:47 -1000
Message-Id: <20210105171950.415486-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
 tcg/arm/tcg-target.h     |  2 +-
 tcg/arm/tcg-target.c.inc | 37 +++++++++++++++++++++----------------
 2 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 494837d128..fdf75ba93f 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -142,6 +142,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_SUPPORT_MIRROR       0
+#define TCG_TARGET_SUPPORT_MIRROR       1
 
 #endif
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 9b9400f164..3d2717aeb0 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -187,29 +187,32 @@ static const uint8_t tcg_cond_to_arm_cond[] = {
     [TCG_COND_GTU] = COND_HI,
 };
 
-static inline bool reloc_pc24(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
+static bool reloc_pc24(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
 {
-    ptrdiff_t offset = (tcg_ptr_byte_diff(target, code_ptr) - 8) >> 2;
+    const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
+    ptrdiff_t offset = (tcg_ptr_byte_diff(target, src_rx) - 8) >> 2;
+
     if (offset == sextract32(offset, 0, 24)) {
-        *code_ptr = (*code_ptr & ~0xffffff) | (offset & 0xffffff);
+        *src_rw = deposit32(*src_rw, 0, 24, offset);
         return true;
     }
     return false;
 }
 
-static inline bool reloc_pc13(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
+static bool reloc_pc13(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
 {
-    ptrdiff_t offset = tcg_ptr_byte_diff(target, code_ptr) - 8;
+    const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
+    ptrdiff_t offset = tcg_ptr_byte_diff(target, src_rx) - 8;
 
     if (offset >= -0xfff && offset <= 0xfff) {
-        tcg_insn_unit insn = *code_ptr;
+        tcg_insn_unit insn = *src_rw;
         bool u = (offset >= 0);
         if (!u) {
             offset = -offset;
         }
         insn = deposit32(insn, 23, 1, u);
         insn = deposit32(insn, 0, 12, offset);
-        *code_ptr = insn;
+        *src_rw = insn;
         return true;
     }
     return false;
@@ -221,9 +224,9 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
     tcg_debug_assert(addend == 0);
 
     if (type == R_ARM_PC24) {
-        return reloc_pc24(code_ptr, (tcg_insn_unit *)value);
+        return reloc_pc24(code_ptr, (const tcg_insn_unit *)value);
     } else if (type == R_ARM_PC13) {
-        return reloc_pc13(code_ptr, (tcg_insn_unit *)value);
+        return reloc_pc13(code_ptr, (const tcg_insn_unit *)value);
     } else {
         g_assert_not_reached();
     }
@@ -617,7 +620,7 @@ static void tcg_out_movi32(TCGContext *s, int cond, int rd, uint32_t arg)
 
     /* Check for a pc-relative address.  This will usually be the TB,
        or within the TB, which is immediately before the code block.  */
-    diff = arg - ((intptr_t)s->code_ptr + 8);
+    diff = tcg_pcrel_diff(s, (void *)arg) - 8;
     if (diff >= 0) {
         rot = encode_imm(diff);
         if (rot >= 0) {
@@ -1337,7 +1340,8 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, TCGMemOpIdx oi,
     label->datahi_reg = datahi;
     label->addrlo_reg = addrlo;
     label->addrhi_reg = addrhi;
-    label->raddr = raddr;
+    /* TODO: Cast goes away when all hosts converted */
+    label->raddr = (void *)tcg_splitwx_to_rx(raddr);
     label->label_ptr[0] = label_ptr;
 }
 
@@ -1348,7 +1352,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     MemOp opc = get_memop(oi);
     void *func;
 
-    if (!reloc_pc24(lb->label_ptr[0], s->code_ptr)) {
+    if (!reloc_pc24(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
@@ -1411,7 +1415,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     TCGMemOpIdx oi = lb->oi;
     MemOp opc = get_memop(oi);
 
-    if (!reloc_pc24(lb->label_ptr[0], s->code_ptr)) {
+    if (!reloc_pc24(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
@@ -1762,8 +1766,8 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
             TCGReg base = TCG_REG_PC;
 
             tcg_debug_assert(s->tb_jmp_insn_offset == 0);
-            ptr = (intptr_t)(s->tb_jmp_target_addr + args[0]);
-            dif = ptr - ((intptr_t)s->code_ptr + 8);
+            ptr = (intptr_t)tcg_splitwx_to_rx(s->tb_jmp_target_addr + args[0]);
+            dif = tcg_pcrel_diff(s, (void *)ptr) - 8;
             dil = sextract32(dif, 0, 12);
             if (dif != dil) {
                 /* The TB is close, but outside the 12 bits addressable by
@@ -2297,7 +2301,8 @@ static void tcg_target_qemu_prologue(TCGContext *s)
      * Return path for goto_ptr. Set return value to 0, a-la exit_tb,
      * and fall through to the rest of the epilogue.
      */
-    tcg_code_gen_epilogue = s->code_ptr;
+    /* TODO: Cast goes away when all hosts converted */
+    tcg_code_gen_epilogue = (void *)tcg_splitwx_to_rx(s->code_ptr);
     tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R0, 0);
     tcg_out_epilogue(s);
 }
-- 
2.25.1


