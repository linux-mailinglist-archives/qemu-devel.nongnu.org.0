Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAED22D9993
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:17:23 +0100 (CET)
Received: from localhost ([::1]:51548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koofC-0000Yz-Pn
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:17:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSh-0002MP-Dj
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:27 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:38651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSd-00042Q-KE
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:27 -0500
Received: by mail-oi1-x242.google.com with SMTP id x13so10203090oic.5
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9/TRkK1ohPG7NzFVdGar1E3FliGdhxt5t+NNXefLhVw=;
 b=MZYjn4RB697EkkCaK4MQzT7k9JoSojr0sQdClHXHo1uJxLAaw31NWGGo/V9sHmS1sz
 4IwRIfypPeEBr901puW0Rz7oWEei/u18kvMfXxfLbucsbSLlX8wHDLhm5gYntCIb3NFQ
 iZ5oBudFy/5dlys23+fE50nc+ZPr8yKC2qsJNjSrZNaPuFmYdGblB6pziopVnf2YhzEW
 MGM7UxZsvGwFh1rGDT5SvBi4bh7ej8Fp8lvoJ5rpKFZLa/zw0ohenxuKQoXRZGByMoy0
 ncDZePvchnK6GqhKjgWqAhJXTE3xs7rB88aDKm0zUGFRjBJu3a9fDM++0fBSTXAH0ijJ
 dkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9/TRkK1ohPG7NzFVdGar1E3FliGdhxt5t+NNXefLhVw=;
 b=Y0Yz9OKDQ03IshXNj4z48/G0PrkKdbq9C5wB/lxlA2UeuKU33nGQcZp1LrpqmtcGTL
 JLLnRPt7lUjH5PW79vLilu78YjKzvwVNnRqgp8T/s2GOS16nM4IczTCtuWHcgdlUD9Ug
 elsUZViCbWEzvnHQD1r0xiVHTNSuB6PHdI5q8o26FqubimSLNLuFd4Yg+bIdr3abA6lL
 /ZZAFSaHzjMb3ElLJco9dIVysZArZY5AA5rE2s0shblJFDkrEVgQEcaIjNl/xq0mARGV
 4jRA+uFT2oZ2vtXtB+/ChAzVEdAZYoZZskcMYVvymgCChsCTqp3Q14Yzw5KSRH7gQDW8
 PG0g==
X-Gm-Message-State: AOAM530SnGZ5YKQ95K6CMYvufCH5M/2k3zhUPNL6Z/s6QGs1qNJ7gLUP
 DYRo3TWmUCJ8W32p5o5txL4tJ+QFqe1ZQWd1
X-Google-Smtp-Source: ABdhPJyBe42f3kN2Zb103V6SYk9tu6DhcJ8qJsAfEz84x6MwObHoQYIQyDWIlwqX7O1lycoJRHlrbA==
X-Received: by 2002:aca:51d8:: with SMTP id f207mr10129136oib.20.1607954662058; 
 Mon, 14 Dec 2020 06:04:22 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.04.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:04:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 38/43] tcg/mips: Do not assert on relocation overflow
Date: Mon, 14 Dec 2020 08:03:09 -0600
Message-Id: <20201214140314.18544-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x242.google.com
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


