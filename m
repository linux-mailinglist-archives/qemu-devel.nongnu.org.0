Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1204C58F1
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 03:09:56 +0100 (CET)
Received: from localhost ([::1]:49792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO90V-0001x6-UT
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 21:09:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO8vD-0002aT-EG
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 21:04:27 -0500
Received: from [2607:f8b0:4864:20::42c] (port=38869
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO8vB-0007So-DA
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 21:04:26 -0500
Received: by mail-pf1-x42c.google.com with SMTP id x18so7974202pfh.5
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 18:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8vH0fMEcymRft7GXIj1tzbSVVNyhzNV6JRuTvLxvGxk=;
 b=zNT8LlnWcj2SCNxy7M8QMzyc4szPXfSzyRya+GoPU5YccFJB1IDGeUoMh9SyWiK7XX
 3NJ65ji6cm8OI0IEKR/2g8My4/Rf5OrVM3CIbeT6cKNtkilwF+82zeR/InyN1T1bQnMC
 pR+Xrl4mZyqA7MkpvRWAxAapRuDydJ9aJK6HuiUA/cszht6FxT74c/cE96gTEdU/hi6i
 0NjP5M0d4+83nQObc7RxThLyLZwBGYCHjuN3Eyaq5zjE1isQ2I0tDu8M7F4AD2Eg3jWP
 L35BlBNrXuQFg9J2H7z3MsYeVv2/FeaJYlYRIQmXoVucsdh5PsYe9kCnXIMiXHkirmC+
 lcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8vH0fMEcymRft7GXIj1tzbSVVNyhzNV6JRuTvLxvGxk=;
 b=cP19inkZIEb/MsRhRe+EAHZW5iAx6T6YEK9FoaqZ8lG905Ivb2C4tPwb4F82eqoY5O
 +0c3zSQNHQ5BCpI8gFF9HvTP4I51w33TF5SJ/LHSJjmHTH7T3I9aTBuHnyrT99UUTPHO
 VIVVF3JwjN2rdh2JRfmN7vdQyYucIvhjFcvyL/dTZsnMiARa4PqlqfR9O7+8OU9+i4p3
 mFLBqZ3mOJgNucOAuyZuXNjpS9xw7KrzXo93R9fZY86Tqi4/xJE0ploJSZVMac/VRjsk
 SJnAMNhwNrnU/EgwykUQUrPv3/ZICTDIp4Ub4vhCyr2OSCGPQOkMovFxBTY24ETuXxSo
 FWIA==
X-Gm-Message-State: AOAM532xu/ELyrqtNKIA3vo5tdWJvKS//ksASMOhcofIRW1m4cMgP9Iq
 x893Gz+HAngnBhLO2hykrgWa0vPMS48DEGBV
X-Google-Smtp-Source: ABdhPJxStXHhUIGJVgP2WS6syd+T8iM7bxDvcrl87n/xI2VmOrdhP7VWTt9BSrsaMyXznYE4BUQTtg==
X-Received: by 2002:a65:5bce:0:b0:372:cada:865d with SMTP id
 o14-20020a655bce000000b00372cada865dmr11844734pgr.199.1645927463989; 
 Sat, 26 Feb 2022 18:04:23 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-9001-d56a-9ee0-0246.res6.spectrum.com.
 [2603:800c:1201:c600:9001:d56a:9ee0:246])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a056a00088d00b004e1bea9c582sm8304021pfj.43.2022.02.26.18.04.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 18:04:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/9] tcg/aarch64: Support TCG_TARGET_SIGNED_ADDR32
Date: Sat, 26 Feb 2022 16:04:10 -1000
Message-Id: <20220227020413.11741-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220227020413.11741-1-richard.henderson@linaro.org>
References: <20220227020413.11741-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AArch64 has both sign and zero-extending addressing modes, which
means that either treatment of guest addresses is equally efficient.
Enabling this for AArch64 gives us testing of the feature in CI.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target-sa32.h |  8 +++-
 tcg/aarch64/tcg-target.c.inc  | 69 +++++++++++++++++++++++------------
 2 files changed, 52 insertions(+), 25 deletions(-)

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
index 077fc51401..65cab73ea0 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -806,12 +806,12 @@ static void tcg_out_insn_3617(TCGContext *s, AArch64Insn insn, bool q,
 }
 
 static void tcg_out_insn_3310(TCGContext *s, AArch64Insn insn,
-                              TCGReg rd, TCGReg base, TCGType ext,
+                              TCGReg rd, TCGReg base, int option,
                               TCGReg regoff)
 {
     /* Note the AArch64Insn constants above are for C3.3.12.  Adjust.  */
     tcg_out32(s, insn | I3312_TO_I3310 | regoff << 16 |
-              0x4000 | ext << 13 | base << 5 | (rd & 0x1f));
+              option << 13 | base << 5 | (rd & 0x1f));
 }
 
 static void tcg_out_insn_3312(TCGContext *s, AArch64Insn insn,
@@ -1126,7 +1126,7 @@ static void tcg_out_ldst(TCGContext *s, AArch64Insn insn, TCGReg rd,
 
     /* Worst-case scenario, move offset to temp register, use reg offset.  */
     tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP, offset);
-    tcg_out_ldst_r(s, insn, rd, rn, TCG_TYPE_I64, TCG_REG_TMP);
+    tcg_out_ldst_r(s, insn, rd, rn, 3 /* LSL #0 */, TCG_REG_TMP);
 }
 
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
@@ -1765,31 +1765,31 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType ext,
                                    TCGReg data_r, TCGReg addr_r,
-                                   TCGType otype, TCGReg off_r)
+                                   int option, TCGReg off_r)
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
@@ -1798,31 +1798,52 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType ext,
 
 static void tcg_out_qemu_st_direct(TCGContext *s, MemOp memop,
                                    TCGReg data_r, TCGReg addr_r,
-                                   TCGType otype, TCGReg off_r)
+                                   int option, TCGReg off_r)
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
+static int ldst_ext_option(void)
+{
+#ifdef CONFIG_USER_ONLY
+    bool signed_addr32 = guest_base_signed_addr32;
+#else
+    bool signed_addr32 = TCG_TARGET_SIGNED_ADDR32;
+#endif
+
+    if (TARGET_LONG_BITS == 64) {
+        return 3; /* LSL #0 */
+    } else if (signed_addr32) {
+        return 6; /* SXTW */
+    } else {
+        return 2; /* UXTW */
+    }
+}
+
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi, TCGType ext)
 {
     MemOp memop = get_memop(oi);
-    const TCGType otype = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    int option = ldst_ext_option();
 
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((memop & MO_BSWAP) == 0);
@@ -1833,7 +1854,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
 
     tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, mem_index, 1);
     tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
-                           TCG_REG_X1, otype, addr_reg);
+                           TCG_REG_X1, option, addr_reg);
     add_qemu_ldst_label(s, true, oi, ext, data_reg, addr_reg,
                         s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
@@ -1843,10 +1864,10 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
     }
     if (USE_GUEST_BASE) {
         tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
-                               TCG_REG_GUEST_BASE, otype, addr_reg);
+                               TCG_REG_GUEST_BASE, option, addr_reg);
     } else {
         tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
-                               addr_reg, TCG_TYPE_I64, TCG_REG_XZR);
+                               addr_reg, option, TCG_REG_XZR);
     }
 #endif /* CONFIG_SOFTMMU */
 }
@@ -1855,7 +1876,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi)
 {
     MemOp memop = get_memop(oi);
-    const TCGType otype = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    int option = ldst_ext_option();
 
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((memop & MO_BSWAP) == 0);
@@ -1866,7 +1887,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
 
     tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, mem_index, 0);
     tcg_out_qemu_st_direct(s, memop, data_reg,
-                           TCG_REG_X1, otype, addr_reg);
+                           TCG_REG_X1, option, addr_reg);
     add_qemu_ldst_label(s, false, oi, (memop & MO_SIZE)== MO_64,
                         data_reg, addr_reg, s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
@@ -1876,10 +1897,10 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
     }
     if (USE_GUEST_BASE) {
         tcg_out_qemu_st_direct(s, memop, data_reg,
-                               TCG_REG_GUEST_BASE, otype, addr_reg);
+                               TCG_REG_GUEST_BASE, option, addr_reg);
     } else {
         tcg_out_qemu_st_direct(s, memop, data_reg,
-                               addr_reg, TCG_TYPE_I64, TCG_REG_XZR);
+                               addr_reg, option, TCG_REG_XZR);
     }
 #endif /* CONFIG_SOFTMMU */
 }
-- 
2.25.1


