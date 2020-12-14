Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBC82D9A11
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:36:15 +0100 (CET)
Received: from localhost ([::1]:50172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kooxT-0006FV-1G
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:36:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSo-0002Of-QN
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:36 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:43369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSi-00042b-Ux
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:33 -0500
Received: by mail-oi1-x22d.google.com with SMTP id q25so19224231oij.10
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=746olrr4Rbmh5ZNHTyxNWXv98LGv+Z4R3bTpMGSCzAU=;
 b=uFZRB6fhRQLL2WjlERqxS89DDU2VB1i6SpxbhnNfpJSUbVjF15neCQnxjKJL/ZmmpD
 UNnJQLftPwHY7zBF0nYwVTXZ4YCTsu1S8fculEHhko9pOFuU+krou8jIw7/f7oxMfv9D
 dDizvbO0PzETicr7JG36vSM6vsgNQls+NEInoF+jy+XQ1EjYNdKL0PoV800zC+c1MV66
 rCw91dJlzvigG3hCQGP7+eGTXxICQjrPCtKp1eUL1Qi7fC0X+naoeQ4OJ6eOXwFhRCOF
 dyQ88jvsdsSPkWL3GU7vUCOS4kPPmJ7BdVEEzuyDr93D2vGyKYBFE3/e1njtMEalpX+M
 j4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=746olrr4Rbmh5ZNHTyxNWXv98LGv+Z4R3bTpMGSCzAU=;
 b=kMMRqfXDtaM2H7s2y53UyTQNOcxNN91UtHi6X5jqkgJq0FOS/VJ7t9sv3r/CCpLfr5
 e16YkFz9Aohy+4Ezl6NjMBa0XE5884Ck4b1WwNNGRDqw7Ub3FjnpCdZcG19sS5x9p+1X
 yCBQkwdXCBgDYVPxwHML337yPHx5KFnzXdFYgn2vholhzs6JWfEEqcxo/YDKCUApl7O/
 3oyvlmWp8vnUh0bIMRqjbHyeTu4njFHXaum5k81VQVUEanlxM+cxfXaaxkt0u/0Otanu
 DmGKRBJ9QgEPeP/QcuuVbSlOVpUpm3K1X2Kh8nzPRtbrpczL3DjIvlLGPnDWpM7D14IC
 4/qw==
X-Gm-Message-State: AOAM531Rq1k4oqVlkLRbM9AVKuvj8hSztIQIYeZxp8uVRVSYI8lKq29i
 QLwz/e+VfwYPGMW8w91Qky1L48+w6LgLtpuj
X-Google-Smtp-Source: ABdhPJy70QeOUCFvIRJIkR2uMJrCSyMwXVLGOG2yyzQNY47Uxe1Wy4pl94QDiDhjKUgJjfvfyVEHSw==
X-Received: by 2002:aca:4b16:: with SMTP id y22mr18186707oia.148.1607954665966; 
 Mon, 14 Dec 2020 06:04:25 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.04.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:04:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 40/43] tcg/arm: Support split-wx code generation
Date: Mon, 14 Dec 2020 08:03:11 -0600
Message-Id: <20201214140314.18544-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
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
index 7e04755428..856d6dd4b0 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -141,6 +141,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
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


