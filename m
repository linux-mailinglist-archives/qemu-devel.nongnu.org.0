Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEF54CC7E8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:22:29 +0100 (CET)
Received: from localhost ([::1]:34560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsu4-0000QQ-NL
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:22:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsZ5-0006FW-88
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:49 -0500
Received: from [2607:f8b0:4864:20::534] (port=36463
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYr-0004NP-2Y
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:38 -0500
Received: by mail-pg1-x534.google.com with SMTP id t14so5755703pgr.3
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 13:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r0wjfyMxZ3d8EIn1EG2HKBbXldpMaL2Owp04sCw5aBc=;
 b=DG1e0pL5vZ/kW5TIGfgRXIjdxZA9cT6dURhP4rw+audAA+yfiI85p3ZOedku3E7bes
 kKcJ+kJszaUCrlVZaMy6lpXEClVyLFpMNwBIoyQzAoj+aKRBvcYzngjQPhWmAK+BYIfx
 AEEWs1yvFkYvqtl3KWeWwVsodLoelpRO9PhCzO21fNS0McPvGectqUnC5DI49QG2cuj7
 TEtpLFX3JDPrWLQxvLgkjOScCO++UIzWLdCQYGJv9ZPTa2NNA2SMHZAmtcr4kG9lxHuv
 5cq8JYv9O6HdNbXpkNLkDnJmWknA97+kq0uVcBAF0QnbBJRgbG+PC9b2HanLnppo9GDB
 rluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r0wjfyMxZ3d8EIn1EG2HKBbXldpMaL2Owp04sCw5aBc=;
 b=WWub2YLL4+YLoSTk9T/ftYELJmZ+JPjRwDK0BXn3R0yeOHnhsJLIpplIwjkl2/yTO/
 FxgIsZoTK5eUNUB6MO+WL0VyY2YopmDEwiHLrOIru3Moz+ecSR3hYgfLk7WlnHN15PIn
 av7Wkw8F/yqSMQIS0wOkTVp3iPUKD7WvOlf860SwtSoh4mBoacX7fKB9z/52aM14VrDm
 llcR2TAtfai0AokhXprM2kStf5Aq1OKFviBzz2eaDo6t5lPproh+NL8Q/ILCFNQ7vjaQ
 GKlAStyAzxG12Emle7lt6gULf8MAt5RtopgVm5gSR9xht69Ktc7hW/ntw8RC0kh/drc8
 yNXw==
X-Gm-Message-State: AOAM531M8xlS9a5hjwBC/VYI3pjsabD+E1RjjlbgVZUVu77D66KkUgqx
 UQMy2zKMZw3WjCcEeZ5SWtVqZdeTONi5GQ==
X-Google-Smtp-Source: ABdhPJwvLfahfW/lksHsgBNtL1/8JS2rwKsSkFPiJWa6MICc9PFjDqPv6nct6BYtQYVxaZcfRt3jKw==
X-Received: by 2002:a63:8bca:0:b0:37c:9049:103 with SMTP id
 j193-20020a638bca000000b0037c90490103mr931570pge.387.1646341228097; 
 Thu, 03 Mar 2022 13:00:28 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm2729934pgs.92.2022.03.03.13.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 13:00:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/30] tcg/aarch64: Support TCG_TARGET_SIGNED_ADDR32
Date: Thu,  3 Mar 2022 10:59:41 -1000
Message-Id: <20220303205944.469445-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303205944.469445-1-richard.henderson@linaro.org>
References: <20220303205944.469445-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AArch64 has both sign and zero-extending addressing modes, which
means that either treatment of guest addresses is equally efficient.
Enabling this for AArch64 gives us testing of the feature in CI.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target-sa32.h |  8 +++-
 tcg/aarch64/tcg-target.c.inc  | 81 ++++++++++++++++++++++++-----------
 2 files changed, 64 insertions(+), 25 deletions(-)

diff --git a/tcg/aarch64/tcg-target-sa32.h b/tcg/aarch64/tcg-target-sa32.h
index cb185b1526..c99e502e4c 100644
--- a/tcg/aarch64/tcg-target-sa32.h
+++ b/tcg/aarch64/tcg-target-sa32.h
@@ -1 +1,7 @@
-#define TCG_TARGET_SIGNED_ADDR32 0
+/*
+ * AArch64 has both SXTW and UXTW addressing modes, which means that
+ * it is agnostic to how guest addresses should be represented.
+ * Because aarch64 is more common than the other hosts that will
+ * want to use this feature, enable it for continuous testing.
+ */
+#define TCG_TARGET_SIGNED_ADDR32 1
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 077fc51401..4a3edd6963 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -361,6 +361,16 @@ typedef enum {
     LDST_LD_S_W = 3,  /* load and sign-extend into Wt */
 } AArch64LdstType;
 
+/*
+ * See aarch64/instrs/extendreg/DecodeRegExtend
+ * But note that option<1> == 0 is UNDEFINED for LDR/STR.
+ */
+typedef enum {
+    LDST_EXT_UXTW = 2,  /* zero-extend from uint32_t */
+    LDST_EXT_UXTX = 3,  /* zero-extend from uint64_t (i.e. no extension) */
+    LDST_EXT_SXTW = 6,  /* sign-extend from int32_t */
+} AArch64LdstExt;
+
 /* We encode the format of the insn into the beginning of the name, so that
    we can have the preprocessor help "typecheck" the insn vs the output
    function.  Arm didn't provide us with nice names for the formats, so we
@@ -806,12 +816,12 @@ static void tcg_out_insn_3617(TCGContext *s, AArch64Insn insn, bool q,
 }
 
 static void tcg_out_insn_3310(TCGContext *s, AArch64Insn insn,
-                              TCGReg rd, TCGReg base, TCGType ext,
+                              TCGReg rd, TCGReg base, AArch64LdstExt option,
                               TCGReg regoff)
 {
     /* Note the AArch64Insn constants above are for C3.3.12.  Adjust.  */
     tcg_out32(s, insn | I3312_TO_I3310 | regoff << 16 |
-              0x4000 | ext << 13 | base << 5 | (rd & 0x1f));
+              option << 13 | base << 5 | (rd & 0x1f));
 }
 
 static void tcg_out_insn_3312(TCGContext *s, AArch64Insn insn,
@@ -1126,7 +1136,7 @@ static void tcg_out_ldst(TCGContext *s, AArch64Insn insn, TCGReg rd,
 
     /* Worst-case scenario, move offset to temp register, use reg offset.  */
     tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP, offset);
-    tcg_out_ldst_r(s, insn, rd, rn, TCG_TYPE_I64, TCG_REG_TMP);
+    tcg_out_ldst_r(s, insn, rd, rn, LDST_EXT_UXTX, TCG_REG_TMP);
 }
 
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
@@ -1765,31 +1775,31 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType ext,
                                    TCGReg data_r, TCGReg addr_r,
-                                   TCGType otype, TCGReg off_r)
+                                   AArch64LdstExt option, TCGReg off_r)
 {
     switch (memop & MO_SSIZE) {
     case MO_UB:
-        tcg_out_ldst_r(s, I3312_LDRB, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_LDRB, data_r, addr_r, option, off_r);
         break;
     case MO_SB:
         tcg_out_ldst_r(s, ext ? I3312_LDRSBX : I3312_LDRSBW,
-                       data_r, addr_r, otype, off_r);
+                       data_r, addr_r, option, off_r);
         break;
     case MO_UW:
-        tcg_out_ldst_r(s, I3312_LDRH, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_LDRH, data_r, addr_r, option, off_r);
         break;
     case MO_SW:
         tcg_out_ldst_r(s, (ext ? I3312_LDRSHX : I3312_LDRSHW),
-                       data_r, addr_r, otype, off_r);
+                       data_r, addr_r, option, off_r);
         break;
     case MO_UL:
-        tcg_out_ldst_r(s, I3312_LDRW, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_LDRW, data_r, addr_r, option, off_r);
         break;
     case MO_SL:
-        tcg_out_ldst_r(s, I3312_LDRSWX, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_LDRSWX, data_r, addr_r, option, off_r);
         break;
     case MO_UQ:
-        tcg_out_ldst_r(s, I3312_LDRX, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_LDRX, data_r, addr_r, option, off_r);
         break;
     default:
         tcg_abort();
@@ -1798,31 +1808,52 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType ext,
 
 static void tcg_out_qemu_st_direct(TCGContext *s, MemOp memop,
                                    TCGReg data_r, TCGReg addr_r,
-                                   TCGType otype, TCGReg off_r)
+                                   AArch64LdstExt option, TCGReg off_r)
 {
     switch (memop & MO_SIZE) {
     case MO_8:
-        tcg_out_ldst_r(s, I3312_STRB, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_STRB, data_r, addr_r, option, off_r);
         break;
     case MO_16:
-        tcg_out_ldst_r(s, I3312_STRH, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_STRH, data_r, addr_r, option, off_r);
         break;
     case MO_32:
-        tcg_out_ldst_r(s, I3312_STRW, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_STRW, data_r, addr_r, option, off_r);
         break;
     case MO_64:
-        tcg_out_ldst_r(s, I3312_STRX, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_STRX, data_r, addr_r, option, off_r);
         break;
     default:
         tcg_abort();
     }
 }
 
+/*
+ * Bits for the option field of LDR/STR (register),
+ * for application to a guest address.
+ */
+static AArch64LdstExt ldst_ext_option(void)
+{
+#ifdef CONFIG_USER_ONLY
+    bool signed_addr32 = guest_base_signed_addr32;
+#else
+    bool signed_addr32 = TCG_TARGET_SIGNED_ADDR32;
+#endif
+
+    if (TARGET_LONG_BITS == 64) {
+        return LDST_EXT_UXTX;
+    } else if (signed_addr32) {
+        return LDST_EXT_SXTW;
+    } else {
+        return LDST_EXT_UXTW;
+    }
+}
+
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi, TCGType ext)
 {
     MemOp memop = get_memop(oi);
-    const TCGType otype = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    AArch64LdstExt option = ldst_ext_option();
 
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((memop & MO_BSWAP) == 0);
@@ -1833,7 +1864,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
 
     tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, mem_index, 1);
     tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
-                           TCG_REG_X1, otype, addr_reg);
+                           TCG_REG_X1, option, addr_reg);
     add_qemu_ldst_label(s, true, oi, ext, data_reg, addr_reg,
                         s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
@@ -1843,10 +1874,11 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
     }
     if (USE_GUEST_BASE) {
         tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
-                               TCG_REG_GUEST_BASE, otype, addr_reg);
+                               TCG_REG_GUEST_BASE, option, addr_reg);
     } else {
+        /* This case is always a 64-bit guest with no extension. */
         tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
-                               addr_reg, TCG_TYPE_I64, TCG_REG_XZR);
+                               addr_reg, LDST_EXT_UXTX, TCG_REG_XZR);
     }
 #endif /* CONFIG_SOFTMMU */
 }
@@ -1855,7 +1887,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi)
 {
     MemOp memop = get_memop(oi);
-    const TCGType otype = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    AArch64LdstExt option = ldst_ext_option();
 
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((memop & MO_BSWAP) == 0);
@@ -1866,7 +1898,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
 
     tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, mem_index, 0);
     tcg_out_qemu_st_direct(s, memop, data_reg,
-                           TCG_REG_X1, otype, addr_reg);
+                           TCG_REG_X1, option, addr_reg);
     add_qemu_ldst_label(s, false, oi, (memop & MO_SIZE)== MO_64,
                         data_reg, addr_reg, s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
@@ -1876,10 +1908,11 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
     }
     if (USE_GUEST_BASE) {
         tcg_out_qemu_st_direct(s, memop, data_reg,
-                               TCG_REG_GUEST_BASE, otype, addr_reg);
+                               TCG_REG_GUEST_BASE, option, addr_reg);
     } else {
+        /* This case is always a 64-bit guest with no extension. */
         tcg_out_qemu_st_direct(s, memop, data_reg,
-                               addr_reg, TCG_TYPE_I64, TCG_REG_XZR);
+                               addr_reg, LDST_EXT_UXTX, TCG_REG_XZR);
     }
 #endif /* CONFIG_SOFTMMU */
 }
-- 
2.25.1


