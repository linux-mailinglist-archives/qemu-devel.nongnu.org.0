Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C88E16FED9B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:13:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1JG-0007SV-EW; Thu, 11 May 2023 04:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1Ir-00070W-Ms
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:33 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IZ-00012d-2m
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:33 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-50bc075d6b2so15284761a12.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792312; x=1686384312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jLbBOadN4gZq1rFAvZjZjp7zJHx5OGq0m8coZ1qZSsg=;
 b=gKuIPvC86jJ849V6g5Uuanpx8nakrinYfSi5dMKOrvdBUvKaVrnO/fe7Cgx/EydUdF
 y/7Zh5CHq4sXEU3UIY5iCfhK9nbWFzRcNXJgEtSK58+ib7GL6oVaYwNdY9PZiTrQYq/7
 AVY6jqX8/fx+9RH4pGdaUThjb2+Aea/ee/U5SDsVPMJqZoz6d180avhED3pRWFL1MDxy
 T3Cm9igL0e4yWAym7mNTK59nSceYUHRPT2lc0JGcGDf831/CKxp+XOC0a+lKQBLmtQkz
 GlUK3b+kgK+GUlea4UMAbwp7CEUvo4TGBvItprWHelq/Wasg52aLiuQq6qydiOe+JcS9
 kLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792312; x=1686384312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jLbBOadN4gZq1rFAvZjZjp7zJHx5OGq0m8coZ1qZSsg=;
 b=C1eN+orU8ImKgOb+S1/0oaQ8rugLI2BaEJv2L7SoWGEv0Ft+o22jt4nmY4XLN0RKHB
 AsguaX/ZVx1VkXSdwgcI6dvd+0YTAj6q6ejYbehGodAUroQmYR7nme8ndVoz3CkkqWpq
 oel8v/NvDqE40qvxP1JaTYvQp0p7H7kjdfCn/j2+rJZcGO/vmPvMx/Lb05ojBRkeWUSn
 +CPXZYy18bisyRfZKi1QQziqqQZVA4l5FwkpFIFx+eNozjsY87+/qqqDbX8b3/c/FsW9
 WUcTtWeJi0Rferswcp/49qQvrBMtqj18hSycutkNcUNA4chJanOF6YDZWxtdv1RXmsj7
 DN9w==
X-Gm-Message-State: AC+VfDypNfmg+/VPSq6WShKAzc41CEzEnNYbvK8zEoueXZqkLcXXtF+L
 bND1FOphKKC/YO83gXrIETku/ZOdmMp5LOrJTIdZAA==
X-Google-Smtp-Source: ACHHUZ7Z4yYtPQ4eaYsOlY7S6ZaS8/Taztdpf1lafpNe8h3L1I7GLOSNbxDPOn0VGMRS8vyNTpbglQ==
X-Received: by 2002:a05:6402:295:b0:50b:c6c9:2146 with SMTP id
 l21-20020a056402029500b0050bc6c92146mr14834422edv.24.1683792312414; 
 Thu, 11 May 2023 01:05:12 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 i12-20020aa7c70c000000b0050bd7267a5csm2662095edq.58.2023.05.11.01.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:05:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 32/53] tcg/mips: Reorg tlb load within prepare_host_addr
Date: Thu, 11 May 2023 09:04:29 +0100
Message-Id: <20230511080450.860923-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Compare the address vs the tlb entry with sign-extended values.
This simplifies the page+alignment mask constant, and the
generation of the last byte address for the misaligned test.

Move the tlb addend load up, and the zero-extension down.

This frees up a register, which allows us use TMP3 as the returned base
address register instead of A0, which we were using as a 5th temporary.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 38 ++++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 31d58e1977..695c137023 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -370,6 +370,8 @@ typedef enum {
     ALIAS_PADDI    = sizeof(void *) == 4 ? OPC_ADDIU : OPC_DADDIU,
     ALIAS_TSRL     = TARGET_LONG_BITS == 32 || TCG_TARGET_REG_BITS == 32
                      ? OPC_SRL : OPC_DSRL,
+    ALIAS_TADDI    = TARGET_LONG_BITS == 32 || TCG_TARGET_REG_BITS == 32
+                     ? OPC_ADDIU : OPC_DADDIU,
 } MIPSInsn;
 
 /*
@@ -1263,14 +1265,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     int add_off = offsetof(CPUTLBEntry, addend);
     int cmp_off = is_ld ? offsetof(CPUTLBEntry, addr_read)
                         : offsetof(CPUTLBEntry, addr_write);
-    target_ulong tlb_mask;
 
     ldst = new_ldst_label(s);
     ldst->is_ld = is_ld;
     ldst->oi = oi;
     ldst->addrlo_reg = addrlo;
     ldst->addrhi_reg = addrhi;
-    base = TCG_REG_A0;
 
     /* Load tlb_mask[mmu_idx] and tlb_table[mmu_idx].  */
     QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
@@ -1290,15 +1290,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
         tcg_out_ldst(s, OPC_LW, TCG_TMP0, TCG_TMP3, cmp_off + LO_OFF);
     } else {
-        tcg_out_ldst(s, (TARGET_LONG_BITS == 64 ? OPC_LD
-                         : TCG_TARGET_REG_BITS == 64 ? OPC_LWU : OPC_LW),
-                     TCG_TMP0, TCG_TMP3, cmp_off);
+        tcg_out_ld(s, TCG_TYPE_TL, TCG_TMP0, TCG_TMP3, cmp_off);
     }
 
-    /* Zero extend a 32-bit guest address for a 64-bit host. */
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, base, addrlo);
-        addrlo = base;
+    if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+        /* Load the tlb addend for the fast path.  */
+        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP3, TCG_TMP3, add_off);
     }
 
     /*
@@ -1306,18 +1303,18 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
      * For unaligned accesses, compare against the end of the access to
      * verify that it does not cross a page boundary.
      */
-    tlb_mask = (target_ulong)TARGET_PAGE_MASK | a_mask;
-    tcg_out_movi(s, TCG_TYPE_I32, TCG_TMP1, tlb_mask);
-    if (a_mask >= s_mask) {
-        tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, addrlo);
-    } else {
-        tcg_out_opc_imm(s, ALIAS_PADDI, TCG_TMP2, addrlo, s_mask - a_mask);
+    tcg_out_movi(s, TCG_TYPE_TL, TCG_TMP1, TARGET_PAGE_MASK | a_mask);
+    if (a_mask < s_mask) {
+        tcg_out_opc_imm(s, ALIAS_TADDI, TCG_TMP2, addrlo, s_mask - a_mask);
         tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, TCG_TMP2);
+    } else {
+        tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, addrlo);
     }
 
-    if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
-        /* Load the tlb addend for the fast path.  */
-        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
+    /* Zero extend a 32-bit guest address for a 64-bit host. */
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+        tcg_out_ext32u(s, TCG_TMP2, addrlo);
+        addrlo = TCG_TMP2;
     }
 
     ldst->label_ptr[0] = s->code_ptr;
@@ -1329,14 +1326,15 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         tcg_out_ldst(s, OPC_LW, TCG_TMP0, TCG_TMP3, cmp_off + HI_OFF);
 
         /* Load the tlb addend for the fast path.  */
-        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
+        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP3, TCG_TMP3, add_off);
 
         ldst->label_ptr[1] = s->code_ptr;
         tcg_out_opc_br(s, OPC_BNE, addrhi, TCG_TMP0);
     }
 
     /* delay slot */
-    tcg_out_opc_reg(s, ALIAS_PADD, base, TCG_TMP2, addrlo);
+    base = TCG_TMP3;
+    tcg_out_opc_reg(s, ALIAS_PADD, base, TCG_TMP3, addrlo);
 #else
     if (a_mask && (use_mips32r6_instructions || a_bits != s_bits)) {
         ldst = new_ldst_label(s);
-- 
2.34.1


