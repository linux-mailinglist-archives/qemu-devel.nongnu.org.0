Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FE93F0CDE
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:37:19 +0200 (CEST)
Received: from localhost ([::1]:58478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGSJK-0007KF-1B
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2P-0008Fe-RK
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:49 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:46802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2O-0006K4-6N
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:49 -0400
Received: by mail-pf1-x42e.google.com with SMTP id y11so3334806pfl.13
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dmNHD8oMVOw6IiwNX8BcqXva18N9be8xhmnHYKvCR/4=;
 b=v7UUHDILwNguMjgH5Y6T4vKpTdcoX3i47kNCxlhhpWSeOpDelrxdW2+lz+tYfgt7ys
 DkEW9IZ48AY0Xwpgs9WVa4RjiTskw+AqmQd5axVAk/G7zZFW/MKxIvgcU2OBjUPPpPji
 mutlI8zBrNuIV5t34QONuY21d8obm0olGOSqxUwZnbX70kDuTRtdk6yikl/a0zAcAVUn
 tJ0oFsM6qVuNemUuH2I00EtsDJfU+mppOmZ7pV9cpP0+Z+jLaLIcSUlnM+oi5rOdpeRw
 qgQr7Y0dGrXFOhrpBHmdHeWDrUyPI5OpTZZfNF2rGxUhxPlQGKjR7UvHt4cXIsczw4vI
 EdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dmNHD8oMVOw6IiwNX8BcqXva18N9be8xhmnHYKvCR/4=;
 b=HSy1/8fYuIYJoSBhkoRqKVG0woDVXHqpiQPD3C3WmhOR1wkUJ145aSwYsjAuQSrGtA
 yW3zyEiqin3tOd1/uskrpsipfgZU/4qVB8x2t+8NB5/7RDm+aYbcL+4Naqgnk2t/I/OA
 w9ZD/qE/XHq+44i1vmCnmRTaY9k1ikcGjbL1+OFK7H1VeUYeecDP2ave1FNv6xf7nnpa
 ZwFpQiG9xerPM4sq+xEcSrKKLNrBKARglqWXjXCI3nPbb1B27POiWQcF/eHi7SBOg4SP
 zUSla+/+2pZ5Y3vQT+9XVWoaRtye3Saoorv4VTkCgXT3h/JfhHcylUCcLoQZ2yhQilaD
 +YvA==
X-Gm-Message-State: AOAM5312Dmwk8N+FQM2WYK+a/d8vxBVcl4pMGU/4chrVBtaPEDAHFckZ
 TV8loJEp1NUDlettsLTT9HHtLP7rT2sbZA==
X-Google-Smtp-Source: ABdhPJwnMZf5WTQWC2g7if8Fn44KFIj7v+GlFqmpLBtLSEid4yLAaVRIWCf0rSlFkcXaXnkzxasqtg==
X-Received: by 2002:a62:dd83:0:b029:30f:d69:895f with SMTP id
 w125-20020a62dd830000b029030f0d69895fmr11175081pff.17.1629317986868; 
 Wed, 18 Aug 2021 13:19:46 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id x13sm619621pjh.30.2021.08.18.13.19.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:19:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/16] tcg/mips: Use the constant pool for 64-bit constants
Date: Wed, 18 Aug 2021 10:19:28 -1000
Message-Id: <20210818201931.393394-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818201931.393394-1-richard.henderson@linaro.org>
References: <20210818201931.393394-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

During normal processing, the constant pool is accessible via
TCG_REG_TB.  During the prologue, it is accessible via TCG_REG_T9.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.h     |  1 +
 tcg/mips/tcg-target.c.inc | 65 +++++++++++++++++++++++++++++----------
 2 files changed, 49 insertions(+), 17 deletions(-)

diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 28c42e23e1..839364b493 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -208,5 +208,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t)
     QEMU_ERROR("code path is reachable");
 
 #define TCG_TARGET_NEED_LDST_LABELS
+#define TCG_TARGET_NEED_POOL_LABELS
 
 #endif
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index d351d53a7b..2ab37ac7c0 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -25,6 +25,7 @@
  */
 
 #include "../tcg-ldst.c.inc"
+#include "../tcg-pool.c.inc"
 
 #ifdef HOST_WORDS_BIGENDIAN
 # define MIPS_BE  1
@@ -166,9 +167,18 @@ static bool reloc_pc16(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
 static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
                         intptr_t value, intptr_t addend)
 {
-    tcg_debug_assert(type == R_MIPS_PC16);
-    tcg_debug_assert(addend == 0);
-    return reloc_pc16(code_ptr, (const tcg_insn_unit *)value);
+    value += addend;
+    switch (type) {
+    case R_MIPS_PC16:
+        return reloc_pc16(code_ptr, (const tcg_insn_unit *)value);
+    case R_MIPS_16:
+        if (value != (int16_t)value) {
+            return false;
+        }
+        *code_ptr = deposit32(*code_ptr, 0, 16, value);
+        return true;
+    }
+    g_assert_not_reached();
 }
 
 #define TCG_CT_CONST_ZERO 0x100
@@ -500,6 +510,11 @@ static void tcg_out_nop(TCGContext *s)
     tcg_out32(s, 0);
 }
 
+static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
+{
+    memset(p, 0, count * sizeof(tcg_insn_unit));
+}
+
 static void tcg_out_dsll(TCGContext *s, TCGReg rd, TCGReg rt, TCGArg sa)
 {
     tcg_out_opc_sa64(s, OPC_DSLL, OPC_DSLL32, rd, rt, sa);
@@ -557,8 +572,15 @@ static bool tcg_out_movi_two(TCGContext *s, TCGReg ret, tcg_target_long arg)
     return false;
 }
 
-static void tcg_out_movi(TCGContext *s, TCGType type,
-                         TCGReg ret, tcg_target_long arg)
+static void tcg_out_movi_pool(TCGContext *s, TCGReg ret,
+                              tcg_target_long arg, TCGReg tbreg)
+{
+    new_pool_label(s, arg, R_MIPS_16, s->code_ptr, tcg_tbrel_diff(s, NULL));
+    tcg_out_opc_imm(s, OPC_LD, ret, tbreg, 0);
+}
+
+static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
+                             tcg_target_long arg, TCGReg tbreg)
 {
     if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I32) {
         arg = (int32_t)arg;
@@ -568,18 +590,17 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     if (tcg_out_movi_two(s, ret, arg)) {
         return;
     }
+    assert(TCG_TARGET_REG_BITS == 64);
 
-    tcg_out_movi(s, TCG_TYPE_I32, ret, arg >> 31 >> 1);
-    if (arg & 0xffff0000ull) {
-        tcg_out_dsll(s, ret, ret, 16);
-        tcg_out_opc_imm(s, OPC_ORI, ret, ret, arg >> 16);
-        tcg_out_dsll(s, ret, ret, 16);
-    } else {
-        tcg_out_dsll(s, ret, ret, 32);
-    }
-    if (arg & 0xffff) {
-        tcg_out_opc_imm(s, OPC_ORI, ret, ret, arg & 0xffff);
-    }
+    /* Otherwise, put 64-bit constants into the constant pool. */
+    tcg_out_movi_pool(s, ret, arg, tbreg);
+}
+
+static void tcg_out_movi(TCGContext *s, TCGType type,
+                         TCGReg ret, tcg_target_long arg)
+{
+    TCGReg tbreg = TCG_TARGET_REG_BITS == 64 ? TCG_REG_TB : 0;
+    tcg_out_movi_int(s, type, ret, arg, tbreg);
 }
 
 static void tcg_out_bswap16(TCGContext *s, TCGReg ret, TCGReg arg, int flags)
@@ -2738,10 +2759,20 @@ static void tcg_target_qemu_prologue(TCGContext *s)
 
 #ifndef CONFIG_SOFTMMU
     if (guest_base != (int16_t)guest_base) {
-        tcg_out_movi(s, TCG_TYPE_PTR, TCG_GUEST_BASE_REG, guest_base);
+        /*
+         * The function call abi for n32 and n64 will have loaded $25 (t9)
+         * with the address of the prologue, so we can use that instead
+         * of TCG_REG_TB.
+         */
+#if TCG_TARGET_REG_BITS == 64 && !defined(__mips_abicalls)
+# error "Unknown mips abi"
+#endif
+        tcg_out_movi_int(s, TCG_TYPE_PTR, TCG_GUEST_BASE_REG, guest_base,
+                         TCG_TARGET_REG_BITS == 64 ? TCG_REG_T9 : 0);
         tcg_regset_set_reg(s->reserved_regs, TCG_GUEST_BASE_REG);
     }
 #endif
+
     if (TCG_TARGET_REG_BITS == 64) {
         tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_TB, tcg_target_call_iarg_regs[1]);
     }
-- 
2.25.1


