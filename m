Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D262EE747
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:56:00 +0100 (CET)
Received: from localhost ([::1]:55118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxcK7-0002Iv-Mg
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:55:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhe-0001b0-0u
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:16:14 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:43387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhV-0001jc-Rx
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:16:13 -0500
Received: by mail-pg1-x532.google.com with SMTP id n10so5718444pgl.10
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9/TRkK1ohPG7NzFVdGar1E3FliGdhxt5t+NNXefLhVw=;
 b=OdBATOSBTvLV6fipseieAicFSrcGArr85XzCqxEUByg9/g2Qs59ApU3wz1yplUW5x1
 F1EdYjNOtw1KVPuRzSuBAdjOF8bbsQUTKQarMKk0vMjsdsnbVGdrobr/Lg85S4NbpOWO
 hdvHspBuBh/OqY9hlDuC6LhjDFe96FtP0J40gvX+sid+ks7jHShtq0Fb1fJaquR1TR01
 5immbhK4jib+G+RPU0B2AhNL491mKSyWREOojpSv4izipNpm/A7cvLbvPkdtXvUPxtBa
 x8s5S0fEkIf9F8sTkSe9qFvyGjG2gk6uOMLYOoIoHzJ9v+cwO/H8Fh9llFo9cPLumwZm
 B+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9/TRkK1ohPG7NzFVdGar1E3FliGdhxt5t+NNXefLhVw=;
 b=LT8qQvShpqqOKFpjJC9OIxCNkD0vlsjGN95JALmGnwynvmDTEkI7E1XCjXh3XPbtVX
 DBqYwEAFlQ1bpm0w6uA55zFMSwqfBnoMVPeq6qde+JHh8MeLwRDJrib+qUfuxgbA+7lF
 wfHjU2CL6nTAu/W5NQJeKUjJSaSc3UQaBZ5qntuLbmjkuRssvaugXDgn44RUBrX1mBxA
 YyfFn14a8laebCif34gkteFz3ARtJW9Awv2nMbGbbYZDjBF8sa2MFw7fJLy9fVkbOp75
 b9ajD/6PQGfHiK9c2XAY+wJExWlynRiLlfnITz1pUKNRxtQ/aDb9n4NQMlNh+dJDG+D4
 j3UA==
X-Gm-Message-State: AOAM533bmbqhL26Gg2zcoQQzHt4/1tT3Qaia4l1zw8CY6hkwbP/GRGBk
 +Oe38G/RE7w0d/zEuBEu4t9aJabBmwrImw==
X-Google-Smtp-Source: ABdhPJzdEJIiNThUZNCgNhiS4eHWzjooEn+LZIc2Ie+68MUi8vG2wzmOg0Gkl0gvrTaG3TnVfF5mHQ==
X-Received: by 2002:aa7:9d81:0:b029:19d:ca64:3c62 with SMTP id
 f1-20020aa79d810000b029019dca643c62mr3671495pfq.16.1610050563850; 
 Thu, 07 Jan 2021 12:16:03 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:16:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 42/47] tcg/mips: Do not assert on relocation overflow
Date: Thu,  7 Jan 2021 10:14:43 -1000
Message-Id: <20210107201448.1152301-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

This target was not updated with 7ecd02a06f8, and so did
not allow re-compilation with relocation overflow.

Remove reloc_26 and reloc_26_val as unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 53 ++++++++++++++-------------------------
 1 file changed, 19 insertions(+), 34 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 52638e920c..37faf1356c 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -144,29 +144,15 @@ static tcg_insn_unit *bswap32_addr;
 static tcg_insn_unit *bswap32u_addr;
 static tcg_insn_unit *bswap64_addr;
 
-static inline uint32_t reloc_pc16_val(tcg_insn_unit *pc,
-                                      const tcg_insn_unit *target)
+static bool reloc_pc16(tcg_insn_unit *pc, const tcg_insn_unit *target)
 {
     /* Let the compiler perform the right-shift as part of the arithmetic.  */
     ptrdiff_t disp = target - (pc + 1);
-    tcg_debug_assert(disp == (int16_t)disp);
-    return disp & 0xffff;
-}
-
-static inline void reloc_pc16(tcg_insn_unit *pc, const tcg_insn_unit *target)
-{
-    *pc = deposit32(*pc, 0, 16, reloc_pc16_val(pc, target));
-}
-
-static inline uint32_t reloc_26_val(tcg_insn_unit *pc, tcg_insn_unit *target)
-{
-    tcg_debug_assert((((uintptr_t)pc ^ (uintptr_t)target) & 0xf0000000) == 0);
-    return ((uintptr_t)target >> 2) & 0x3ffffff;
-}
-
-static inline void reloc_26(tcg_insn_unit *pc, tcg_insn_unit *target)
-{
-    *pc = deposit32(*pc, 0, 26, reloc_26_val(pc, target));
+    if (disp == (int16_t)disp) {
+        *pc = deposit32(*pc, 0, 16, disp);
+        return true;
+    }
+    return false;
 }
 
 static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
@@ -174,8 +160,7 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
 {
     tcg_debug_assert(type == R_MIPS_PC16);
     tcg_debug_assert(addend == 0);
-    reloc_pc16(code_ptr, (tcg_insn_unit *)value);
-    return true;
+    return reloc_pc16(code_ptr, (const tcg_insn_unit *)value);
 }
 
 #define TCG_CT_CONST_ZERO 0x100
@@ -925,11 +910,7 @@ static void tcg_out_brcond(TCGContext *s, TCGCond cond, TCGReg arg1,
     }
 
     tcg_out_opc_br(s, b_opc, arg1, arg2);
-    if (l->has_value) {
-        reloc_pc16(s->code_ptr - 1, l->u.value_ptr);
-    } else {
-        tcg_out_reloc(s, s->code_ptr - 1, R_MIPS_PC16, l, 0);
-    }
+    tcg_out_reloc(s, s->code_ptr - 1, R_MIPS_PC16, l, 0);
     tcg_out_nop(s);
 }
 
@@ -1316,9 +1297,10 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     int i;
 
     /* resolve label address */
-    reloc_pc16(l->label_ptr[0], s->code_ptr);
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        reloc_pc16(l->label_ptr[1], s->code_ptr);
+    if (!reloc_pc16(l->label_ptr[0], s->code_ptr)
+        || (TCG_TARGET_REG_BITS < TARGET_LONG_BITS
+            && !reloc_pc16(l->label_ptr[1], s->code_ptr))) {
+        return false;
     }
 
     i = 1;
@@ -1346,7 +1328,9 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     }
 
     tcg_out_opc_br(s, OPC_BEQ, TCG_REG_ZERO, TCG_REG_ZERO);
-    reloc_pc16(s->code_ptr - 1, l->raddr);
+    if (!reloc_pc16(s->code_ptr - 1, l->raddr)) {
+        return false;
+    }
 
     /* delay slot */
     if (TCG_TARGET_REG_BITS == 64 && l->type == TCG_TYPE_I32) {
@@ -1366,9 +1350,10 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     int i;
 
     /* resolve label address */
-    reloc_pc16(l->label_ptr[0], s->code_ptr);
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        reloc_pc16(l->label_ptr[1], s->code_ptr);
+    if (!reloc_pc16(l->label_ptr[0], s->code_ptr)
+        || (TCG_TARGET_REG_BITS < TARGET_LONG_BITS
+            && !reloc_pc16(l->label_ptr[1], s->code_ptr))) {
+        return false;
     }
 
     i = 1;
-- 
2.25.1


