Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D096F4282BF
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Oct 2021 19:51:30 +0200 (CEST)
Received: from localhost ([::1]:40276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZcyv-0000bl-MS
	for lists+qemu-devel@lfdr.de; Sun, 10 Oct 2021 13:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZcs1-0000UQ-0H
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 13:44:22 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:46790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZcry-00061C-Of
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 13:44:20 -0400
Received: by mail-pf1-x435.google.com with SMTP id z11so441297pfg.13
 for <qemu-devel@nongnu.org>; Sun, 10 Oct 2021 10:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AE3YCDFcRA2qGK8f6qCGrhsHOd0kXVvkieozwsdgT24=;
 b=W+rd8dD0+tZHu5G51ya5hoAhHDJDj9KFCIYTp8+Rn+mFRCBZDl1VI3vug5ZuQq2QRV
 qfyRCd/cih6EBAezKDhc2SdKmoOBtjkY6cY0eredUexigsFUBCeJ5G0j++TzIncFlW3Q
 evrQRtJN6lt2REKvygVVZAgwRmOsv3XcKfgFg6byYkNGjSTRLg/aNq1kIkdv87c613/d
 WCjqKjgTsf84eUsJq+b3F2BsbDb29iKZ5dV91eiuDJKxJbbVJSHEpVqZwDx25aCToAi/
 RKRMFrBia5ddj4SufrgRXRDJWZkzymPeQ4sYJrcF+0YW+W6M5Di/K8aGpflrqSMq6Uwr
 d4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AE3YCDFcRA2qGK8f6qCGrhsHOd0kXVvkieozwsdgT24=;
 b=cAUYs0UyXJwK0S3NiPZjSVBRU87ARxyxItswzt65djoZQZxIszZQJLqNY1n+ylP+8I
 rNcRMJVRzgX6mg9nWxURYd9msj77dGDb7hIprCoqBDHLuZTQZqrKQyL4x9kk3pciEnHY
 iHP+iEMEa2IJnxieHuDz3JlXFPB7T+qfL5boMhqUwSsPlGv4r0zMR6Uym5ZBUdfaOYKC
 d6ui3osvlegii+YGJvttRHdAiqBDR/fTpUXmdYH0tWQWnrNWbK6H3pj940wpi/4btuWN
 MTEZJePDF1rrios82j4mD0i0L+glm4QIhf08xQLECTAHaFIfWcZl0lhfz6REWvZ4IJuG
 X85Q==
X-Gm-Message-State: AOAM531vY4PWrqvodOuBvhROt7gf8xGpsYJhKVJMhQ5fpGyzXT4dsO0q
 IzoijAvkdKwGL2LX107s3qflA9njABYamBtR
X-Google-Smtp-Source: ABdhPJwcSf1+7Us+yV9cDfOP0MFu4wPn194dsGHRKrb6NP0z9ZiSDYaZXgDb02/GlKKUpAI+5OAeaw==
X-Received: by 2002:a62:1683:0:b0:3f3:814f:4367 with SMTP id
 125-20020a621683000000b003f3814f4367mr21322951pfw.68.1633887856716; 
 Sun, 10 Oct 2021 10:44:16 -0700 (PDT)
Received: from localhost.localdomain (068-185-026-038.biz.spectrum.com.
 [68.185.26.38])
 by smtp.gmail.com with ESMTPSA id 18sm5095391pfh.115.2021.10.10.10.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 10:44:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/8] tcg/aarch64: Support TCG_TARGET_SIGNED_ADDR32
Date: Sun, 10 Oct 2021 10:43:59 -0700
Message-Id: <20211010174401.141339-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211010174401.141339-1-richard.henderson@linaro.org>
References: <20211010174401.141339-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: git@xen0n.name, Alistair.Francis@wdc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AArch64 has both sign and zero-extending addressing modes, which
means that either treatment of guest addresses is equally efficient.
Enabling this for AArch64 gives us testing of the feature in CI.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target-sa32.h |  8 ++++-
 tcg/aarch64/tcg-target.c.inc  | 68 ++++++++++++++++++++++-------------
 2 files changed, 51 insertions(+), 25 deletions(-)

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
index 5edca8d44d..88b2963f9d 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -12,6 +12,7 @@
 
 #include "../tcg-pool.c.inc"
 #include "qemu/bitops.h"
+#include "tcg-target-sa32.h"
 
 /* We're going to re-use TCGType in setting of the SF bit, which controls
    the size of the operation performed.  If we know the values match, it
@@ -804,12 +805,12 @@ static void tcg_out_insn_3617(TCGContext *s, AArch64Insn insn, bool q,
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
@@ -1124,7 +1125,7 @@ static void tcg_out_ldst(TCGContext *s, AArch64Insn insn, TCGReg rd,
 
     /* Worst-case scenario, move offset to temp register, use reg offset.  */
     tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP, offset);
-    tcg_out_ldst_r(s, insn, rd, rn, TCG_TYPE_I64, TCG_REG_TMP);
+    tcg_out_ldst_r(s, insn, rd, rn, 3 /* LSL #0 */, TCG_REG_TMP);
 }
 
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
@@ -1718,34 +1719,34 @@ static void tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, MemOp opc,
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType ext,
                                    TCGReg data_r, TCGReg addr_r,
-                                   TCGType otype, TCGReg off_r)
+                                   int option, TCGReg off_r)
 {
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((memop & MO_BSWAP) == 0);
 
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
     case MO_Q:
-        tcg_out_ldst_r(s, I3312_LDRX, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_LDRX, data_r, addr_r, option, off_r);
         break;
     default:
         tcg_abort();
@@ -1754,50 +1755,68 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType ext,
 
 static void tcg_out_qemu_st_direct(TCGContext *s, MemOp memop,
                                    TCGReg data_r, TCGReg addr_r,
-                                   TCGType otype, TCGReg off_r)
+                                   int option, TCGReg off_r)
 {
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((memop & MO_BSWAP) == 0);
 
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
 
+static int guest_ext_option(void)
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
+    int option = guest_ext_option();
+
 #ifdef CONFIG_SOFTMMU
     unsigned mem_index = get_mmuidx(oi);
     tcg_insn_unit *label_ptr;
 
     tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, mem_index, 1);
     tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
-                           TCG_REG_X1, otype, addr_reg);
+                           TCG_REG_X1, option, addr_reg);
     add_qemu_ldst_label(s, true, oi, ext, data_reg, addr_reg,
                         s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
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
@@ -1806,23 +1825,24 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi)
 {
     MemOp memop = get_memop(oi);
-    const TCGType otype = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    int option = guest_ext_option();
+
 #ifdef CONFIG_SOFTMMU
     unsigned mem_index = get_mmuidx(oi);
     tcg_insn_unit *label_ptr;
 
     tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, mem_index, 0);
     tcg_out_qemu_st_direct(s, memop, data_reg,
-                           TCG_REG_X1, otype, addr_reg);
+                           TCG_REG_X1, option, addr_reg);
     add_qemu_ldst_label(s, false, oi, (memop & MO_SIZE)== MO_64,
                         data_reg, addr_reg, s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
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


