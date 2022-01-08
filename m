Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 277A148821C
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 08:22:10 +0100 (CET)
Received: from localhost ([::1]:41066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n663E-0002TU-Fp
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 02:22:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65Ld-0005hU-OV
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:37:07 -0500
Received: from [2607:f8b0:4864:20::535] (port=40747
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65Lc-00047d-2X
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:37:05 -0500
Received: by mail-pg1-x535.google.com with SMTP id t32so7682052pgm.7
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 22:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=04Ui5ZVOanN6S96ULx7r59C8kMoqyjA71CaJbEASneY=;
 b=zi5xpJWneCBVR2piniN/oSOopsTdgRz3EJeXIJd/qCNUPIZFDpR24G6ui8F/wb8tGX
 oYfyazZePa4hnuCfE2BVjq/PLfj4bhuM+9qJXy/3eraK9Am3RWDK06T3KwBwU+a5iAMX
 bPs0yN2OsJQWJfPeJoBoJTDthVjwSVd0192iYiePclVrPxAR5kqoIagJ6/tmJJUwN+ak
 xAQXwKote8mYpH72pMedZ4lxhuZEocjD9tBlHs8u2/ScjL4JxJ92oPcu9A03ErXqk4Em
 46YCvBp/f0fR9SSVpAJmdRb4NPsBwzJVys6V+vXKTN2iLYxkqoW1H9PXhM1YkGkeB1OE
 g/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=04Ui5ZVOanN6S96ULx7r59C8kMoqyjA71CaJbEASneY=;
 b=RX/Vprrzc/tPX0rfPSup55UuFYHU4Di82z2A1BumZ5+RVdU27EyGzZH08+kw1J1bvi
 XpblA/ZU3aqVV2yo/qBLO0hvZ/4oFolFaM7eEa1FGMdCth95DzPrPvn7FcEjJRleNegG
 LhRt/ccmzws4pv+JloqTAh81a/J8U5X3+rwum7EOu4dXDSKPAfdo0hUG6YhnoNL59ySt
 ojzI7J1oiKYhO1AeykQzwxMkvW7WNg4bBxHcZIBk0RtekW/zNNz9QhHhMkwwbusnGMOP
 8TWjdzs7bOs8vLv6s5Z9k78qkSsPrREFCrsYeSiCS0K/poJbQutl7fGDYaxYifIr4nat
 np8A==
X-Gm-Message-State: AOAM5323Ha3u6QTrev7dQTi6RdDOQVLIBJrfZZYM3XenKo5aUVnifb4G
 5UXzBnL0sq4iyZSLGqJGON5c5ATKBA1v+w==
X-Google-Smtp-Source: ABdhPJwSZoTdfmXpGGewa9J/+SUvYf6K2wDvHJGpS/ZHd+le+Vf0vkWlyDZyv+GZY8uTMVxESD0AhQ==
X-Received: by 2002:a63:4f22:: with SMTP id d34mr58712782pgb.12.1641623814780; 
 Fri, 07 Jan 2022 22:36:54 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id z4sm840954pfh.215.2022.01.07.22.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 22:36:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/12] tcg/mips: Create and use TCG_REG_TB
Date: Fri,  7 Jan 2022 22:36:38 -0800
Message-Id: <20220108063644.478043-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220108063644.478043-1-richard.henderson@linaro.org>
References: <20220108063644.478043-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This vastly reduces the size of code generated for 64-bit addresses.
The code for exit_tb, for instance, where we load a (tagged) pointer
to the current TB, goes from

0x400aa9725c:  li       v0,64
0x400aa97260:  dsll     v0,v0,0x10
0x400aa97264:  ori      v0,v0,0xaa9
0x400aa97268:  dsll     v0,v0,0x10
0x400aa9726c:  j        0x400aa9703c
0x400aa97270:  ori      v0,v0,0x7083

to

0x400aa97240:  j        0x400aa97040
0x400aa97244:  daddiu   v0,s6,-189

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 75 ++++++++++++++++++++++++++++++++-------
 1 file changed, 62 insertions(+), 13 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 46616784f8..76fb1dada0 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -88,6 +88,11 @@ static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
 #ifndef CONFIG_SOFTMMU
 #define TCG_GUEST_BASE_REG TCG_REG_S7
 #endif
+#if TCG_TARGET_REG_BITS == 64
+#define TCG_REG_TB         TCG_REG_S6
+#else
+#define TCG_REG_TB         (qemu_build_not_reached(), TCG_REG_ZERO)
+#endif
 
 /* check if we really need so many registers :P */
 static const int tcg_target_reg_alloc_order[] = {
@@ -1971,34 +1976,72 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     switch (opc) {
     case INDEX_op_exit_tb:
         {
-            TCGReg b0 = TCG_REG_ZERO;
+            TCGReg base = TCG_REG_ZERO;
+            int16_t lo = 0;
 
-            a0 = (intptr_t)a0;
-            if (a0 & ~0xffff) {
-                tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_V0, a0 & ~0xffff);
-                b0 = TCG_REG_V0;
+            if (a0) {
+                intptr_t ofs;
+                if (TCG_TARGET_REG_BITS == 64) {
+                    ofs = tcg_tbrel_diff(s, (void *)a0);
+                    lo = ofs;
+                    if (ofs == lo) {
+                        base = TCG_REG_TB;
+                    } else {
+                        base = TCG_REG_V0;
+                        tcg_out_movi(s, TCG_TYPE_PTR, base, ofs - lo);
+                        tcg_out_opc_reg(s, ALIAS_PADD, base, base, TCG_REG_TB);
+                    }
+                } else {
+                    ofs = a0;
+                    lo = ofs;
+                    base = TCG_REG_V0;
+                    tcg_out_movi(s, TCG_TYPE_PTR, base, ofs - lo);
+                }
             }
             if (!tcg_out_opc_jmp(s, OPC_J, tb_ret_addr)) {
                 tcg_out_movi(s, TCG_TYPE_PTR, TCG_TMP0,
                              (uintptr_t)tb_ret_addr);
                 tcg_out_opc_reg(s, OPC_JR, 0, TCG_TMP0, 0);
             }
-            tcg_out_opc_imm(s, OPC_ORI, TCG_REG_V0, b0, a0 & 0xffff);
+            tcg_out_opc_imm(s, ALIAS_PADDI, TCG_REG_V0, base, lo);
         }
         break;
     case INDEX_op_goto_tb:
         /* indirect jump method */
         tcg_debug_assert(s->tb_jmp_insn_offset == 0);
-        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_REG_ZERO,
-                   (uintptr_t)(s->tb_jmp_target_addr + a0));
-        tcg_out_opc_reg(s, OPC_JR, 0, TCG_TMP0, 0);
-        tcg_out_nop(s);
-        set_jmp_reset_offset(s, a0);
+        {
+            TCGReg base, dest;
+            intptr_t ofs;
+
+            if (TCG_TARGET_REG_BITS == 64) {
+                dest = base = TCG_REG_TB;
+                ofs = tcg_tbrel_diff(s, s->tb_jmp_target_addr + a0);
+            } else {
+                dest = TCG_TMP0;
+                base = TCG_REG_ZERO;
+                ofs = (intptr_t)(s->tb_jmp_target_addr + a0);
+            }
+            tcg_out_ld(s, TCG_TYPE_PTR, dest, base, ofs);
+            tcg_out_opc_reg(s, OPC_JR, 0, dest, 0);
+            /* delay slot */
+            tcg_out_nop(s);
+
+            set_jmp_reset_offset(s, args[0]);
+            if (TCG_TARGET_REG_BITS == 64) {
+                /* For the unlinked case, need to reset TCG_REG_TB. */
+                tcg_out_ldst(s, ALIAS_PADDI, TCG_REG_TB, TCG_REG_TB,
+                             -tcg_current_code_size(s));
+            }
+        }
         break;
     case INDEX_op_goto_ptr:
         /* jmp to the given host address (could be epilogue) */
         tcg_out_opc_reg(s, OPC_JR, 0, a0, 0);
-        tcg_out_nop(s);
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_TB, a0);
+        } else {
+            tcg_out_nop(s);
+        }
         break;
     case INDEX_op_br:
         tcg_out_brcond(s, TCG_COND_EQ, TCG_REG_ZERO, TCG_REG_ZERO,
@@ -2554,7 +2597,7 @@ static const int tcg_target_callee_save_regs[] = {
     TCG_REG_S3,
     TCG_REG_S4,
     TCG_REG_S5,
-    TCG_REG_S6,
+    TCG_REG_S6,       /* used for the tb base (TCG_REG_TB) */
     TCG_REG_S7,       /* used for guest_base */
     TCG_REG_S8,       /* used for the global env (TCG_AREG0) */
     TCG_REG_RA,       /* should be last for ABI compliance */
@@ -2682,6 +2725,9 @@ static void tcg_target_qemu_prologue(TCGContext *s)
         tcg_regset_set_reg(s->reserved_regs, TCG_GUEST_BASE_REG);
     }
 #endif
+    if (TCG_TARGET_REG_BITS == 64) {
+        tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_TB, tcg_target_call_iarg_regs[1]);
+    }
 
     /* Call generated code */
     tcg_out_opc_reg(s, OPC_JR, 0, tcg_target_call_iarg_regs[1], 0);
@@ -2863,6 +2909,9 @@ static void tcg_target_init(TCGContext *s)
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_RA);   /* return address */
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_SP);   /* stack pointer */
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_GP);   /* global pointer */
+    if (TCG_TARGET_REG_BITS == 64) {
+        tcg_regset_set_reg(s->reserved_regs, TCG_REG_TB); /* tc->tc_ptr */
+    }
 }
 
 typedef struct {
-- 
2.25.1


