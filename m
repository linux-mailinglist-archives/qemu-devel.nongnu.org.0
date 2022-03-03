Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 404DD4CC604
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:28:33 +0100 (CET)
Received: from localhost ([::1]:50812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPr7o-000842-Bx
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:28:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPqvr-00020i-6D
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:16:11 -0500
Received: from [2607:f8b0:4864:20::1035] (port=46951
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPqvk-0007Sw-Av
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:16:10 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 15-20020a17090a098f00b001bef0376d5cso5852133pjo.5
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 11:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pw9Lr6A1xqwAKDrOkoPeST8MZRplOG8Yhjei+xoRZSc=;
 b=T8uFcHJVb5cZtLnkkuWDRvdv8MuCTZGOzFdSpuhjFllSUUM08OzJZVAJBau0P08S/y
 34Pm9st0Cve+yTtdFt/FE3cOFaKZOE7RG7js9I/kamQbo9iabij92jwvLLbQS4AOWIlm
 p5EI8RWE8ct9c6mhE/MP3lr/RBfIBpXn5B8AYriMWCaRb9uqZ0hX2/ed15lEqkgWIiem
 FCc5lRmaqB/MwPRrOqo2wAcCB+QIzW6nSTuZSHLwR8dYm5vRo1ZUOxe1mZd6tcR52v+4
 yFef33XCTc5ozqjhNSqUFgu03+rZSdVLgw/wV7943zX11O/la6+Dxdby7KkkWSeVsg4B
 rdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pw9Lr6A1xqwAKDrOkoPeST8MZRplOG8Yhjei+xoRZSc=;
 b=enZ/9/IQNL40EN44/aCl6GQUOu/IPDRgI63jwrhgYPkjovsESj3GqcSFDaKWG7CHpJ
 mKU6mReFR7J0vicbkb6PgPeOeMotiuh+4gVfvJRtcSBY/Rj8+i8VmzaTE9oqOzokef91
 tzwmOal1aL6rr9Thd2OOXoauqxQCIejn/QEKxHVKl0lK6gsVF+5JeAVuK1a90PxSfS4Z
 kDGRfCY9vt+kfXXljdVSsYJKKBpwcxXa64Pc6rF57WzjipoqNdFAO2Cm66upMVvfJEmz
 JqWrKqp0lVstuqx9jH+ivPYxZSfl0i47WFuMfxUM9T8sgUX3PQvaCGa0T+sGLH9LLYhN
 7wtA==
X-Gm-Message-State: AOAM531XABuugilWknTT5VFu6zCP9gzseaNMqoGAzT7Nqcl0H5lBOGfy
 PVbavEF3/byF43VgX/T3vd1VESudSuJnUg==
X-Google-Smtp-Source: ABdhPJyIQ4Y+Y9HSnKIKfY3chexxEb0vPkcbLggZ8beagP/KNUiTyUjJJScd5XqEYc2j5LBk9bH5qg==
X-Received: by 2002:a17:90b:4c44:b0:1bf:f00:3735 with SMTP id
 np4-20020a17090b4c4400b001bf0f003735mr4192115pjb.168.1646334962949; 
 Thu, 03 Mar 2022 11:16:02 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a62ed19000000b004f140515d56sm3318043pfh.46.2022.03.03.11.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 11:16:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/9] tcg/aarch64: Support TCG_TARGET_SIGNED_ADDR32
Date: Thu,  3 Mar 2022 09:15:48 -1000
Message-Id: <20220303191551.466631-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303191551.466631-1-richard.henderson@linaro.org>
References: <20220303191551.466631-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AArch64 has both sign and zero-extending addressing modes, which
means that either treatment of guest addresses is equally efficient.
Enabling this for AArch64 gives us testing of the feature in CI.

Cc: Peter Maydell <peter.maydell@linaro.org>
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


