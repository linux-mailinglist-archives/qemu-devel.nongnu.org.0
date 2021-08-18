Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 190343F0CAD
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:24:49 +0200 (CEST)
Received: from localhost ([::1]:51556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGS7E-0008OD-56
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2N-00087Q-39
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:47 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:36541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2H-00068W-8c
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:46 -0400
Received: by mail-pf1-x42d.google.com with SMTP id m26so3335441pff.3
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wtevaJ7IG8tKFN4eF5alBUKWgZUImY9MLHAChMV4wyA=;
 b=hc3AtgXEfCSMbkeOqtNFiOP9bYpwAOYeZ7Fl1Jw4hCnAOkloMv8O0Y9KKCbRX+djPR
 czAagsKl13mcn+Xx38Vt190I1FlbfGhLzOTiKZ531nYs5fPux6ObKXrMgH3MYGVj9Dv5
 lMgPwCLAlGV7AxWsX7fuYEc9TG5elKjVsWnrDt1VzEhc7vYdnhMIHZ3RfhmY79LgcPCf
 7hPu8XUxBR1TgrCegc4Qo3yNGabt6yP7D+NBsFIk28GzN6Rp46w6Tcymi9i2zt56R2jE
 crYkgT6VXi9+iI4AvUV1auwhxuO5RcLXHPrrqeZWRbNtWYooaZxo585RAmhptJy740Uy
 Is9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wtevaJ7IG8tKFN4eF5alBUKWgZUImY9MLHAChMV4wyA=;
 b=RBuu6v+crFiZiWe4GVXtFXAVI9TMLz9ZqRNhWsok+f6kSgk3Pv1yj9KEWCqgIqPY0A
 YbkqX8Am0qNbpOMNlO2piubdCqUkVuh6I54L76mHlEz4eLYjUdwqLqezEpmOrHKO60Gi
 cSlqoZ+iC0PWY8zYYF8SEgmcUHp6UkL1OUBWRxOwOtb2+6GTkrE/AxEQ+TnjcnOkQpc0
 RXICP78uIhfAgnbqxb918jItHc6X9lWCJOwSO9NwOFRrz+WRJy4g5+gumbKNtAjFE1Nq
 5aLRrbHtbD1DNInX96FtDkuy6ucqLdbUnNcv8rA9mhJHEX7BIJrlvPUoYPJh08tQX04I
 F8aA==
X-Gm-Message-State: AOAM532giTuGzAAzY8bgJIunf/51lSWOLS7+M2ST9H2VMZcqYIvV6dfi
 3k4oTXp7x7Kyn0lPv5CbYkQIndKyVR7lpg==
X-Google-Smtp-Source: ABdhPJwOdkzH3nz87ORrrKUOkVHf0DwcM3RmCuj8U3zdsfTBVEFcoUa7Le2MItfAcGxfWMkbSfh21w==
X-Received: by 2002:a63:2024:: with SMTP id g36mr10474207pgg.213.1629317977238; 
 Wed, 18 Aug 2021 13:19:37 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id x13sm619621pjh.30.2021.08.18.13.19.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:19:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/16] tcg/mips: Drop inline markers
Date: Wed, 18 Aug 2021 10:19:18 -1000
Message-Id: <20210818201931.393394-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818201931.393394-1-richard.henderson@linaro.org>
References: <20210818201931.393394-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Let the compiler decide about inlining.
Remove tcg_out_ext8s and tcg_out_ext16s as unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 76 ++++++++++++++-------------------------
 1 file changed, 27 insertions(+), 49 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 3d6a0ba39e..94f1bebdba 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -189,7 +189,7 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
 #endif
 
 
-static inline bool is_p2m1(tcg_target_long val)
+static bool is_p2m1(tcg_target_long val)
 {
     return val && ((val + 1) & val) == 0;
 }
@@ -373,8 +373,8 @@ typedef enum {
 /*
  * Type reg
  */
-static inline void tcg_out_opc_reg(TCGContext *s, MIPSInsn opc,
-                                   TCGReg rd, TCGReg rs, TCGReg rt)
+static void tcg_out_opc_reg(TCGContext *s, MIPSInsn opc,
+                            TCGReg rd, TCGReg rs, TCGReg rt)
 {
     int32_t inst;
 
@@ -388,8 +388,8 @@ static inline void tcg_out_opc_reg(TCGContext *s, MIPSInsn opc,
 /*
  * Type immediate
  */
-static inline void tcg_out_opc_imm(TCGContext *s, MIPSInsn opc,
-                                   TCGReg rt, TCGReg rs, TCGArg imm)
+static void tcg_out_opc_imm(TCGContext *s, MIPSInsn opc,
+                            TCGReg rt, TCGReg rs, TCGArg imm)
 {
     int32_t inst;
 
@@ -403,8 +403,8 @@ static inline void tcg_out_opc_imm(TCGContext *s, MIPSInsn opc,
 /*
  * Type bitfield
  */
-static inline void tcg_out_opc_bf(TCGContext *s, MIPSInsn opc, TCGReg rt,
-                                  TCGReg rs, int msb, int lsb)
+static void tcg_out_opc_bf(TCGContext *s, MIPSInsn opc, TCGReg rt,
+                           TCGReg rs, int msb, int lsb)
 {
     int32_t inst;
 
@@ -416,8 +416,8 @@ static inline void tcg_out_opc_bf(TCGContext *s, MIPSInsn opc, TCGReg rt,
     tcg_out32(s, inst);
 }
 
-static inline void tcg_out_opc_bf64(TCGContext *s, MIPSInsn opc, MIPSInsn opm,
-                                    MIPSInsn oph, TCGReg rt, TCGReg rs,
+static void tcg_out_opc_bf64(TCGContext *s, MIPSInsn opc, MIPSInsn opm,
+                             MIPSInsn oph, TCGReg rt, TCGReg rs,
                                     int msb, int lsb)
 {
     if (lsb >= 32) {
@@ -434,8 +434,7 @@ static inline void tcg_out_opc_bf64(TCGContext *s, MIPSInsn opc, MIPSInsn opm,
 /*
  * Type branch
  */
-static inline void tcg_out_opc_br(TCGContext *s, MIPSInsn opc,
-                                  TCGReg rt, TCGReg rs)
+static void tcg_out_opc_br(TCGContext *s, MIPSInsn opc, TCGReg rt, TCGReg rs)
 {
     tcg_out_opc_imm(s, opc, rt, rs, 0);
 }
@@ -443,8 +442,8 @@ static inline void tcg_out_opc_br(TCGContext *s, MIPSInsn opc,
 /*
  * Type sa
  */
-static inline void tcg_out_opc_sa(TCGContext *s, MIPSInsn opc,
-                                  TCGReg rd, TCGReg rt, TCGArg sa)
+static void tcg_out_opc_sa(TCGContext *s, MIPSInsn opc,
+                           TCGReg rd, TCGReg rt, TCGArg sa)
 {
     int32_t inst;
 
@@ -491,28 +490,27 @@ static bool tcg_out_opc_jmp(TCGContext *s, MIPSInsn opc, const void *target)
     return true;
 }
 
-static inline void tcg_out_nop(TCGContext *s)
+static void tcg_out_nop(TCGContext *s)
 {
     tcg_out32(s, 0);
 }
 
-static inline void tcg_out_dsll(TCGContext *s, TCGReg rd, TCGReg rt, TCGArg sa)
+static void tcg_out_dsll(TCGContext *s, TCGReg rd, TCGReg rt, TCGArg sa)
 {
     tcg_out_opc_sa64(s, OPC_DSLL, OPC_DSLL32, rd, rt, sa);
 }
 
-static inline void tcg_out_dsrl(TCGContext *s, TCGReg rd, TCGReg rt, TCGArg sa)
+static void tcg_out_dsrl(TCGContext *s, TCGReg rd, TCGReg rt, TCGArg sa)
 {
     tcg_out_opc_sa64(s, OPC_DSRL, OPC_DSRL32, rd, rt, sa);
 }
 
-static inline void tcg_out_dsra(TCGContext *s, TCGReg rd, TCGReg rt, TCGArg sa)
+static void tcg_out_dsra(TCGContext *s, TCGReg rd, TCGReg rt, TCGArg sa)
 {
     tcg_out_opc_sa64(s, OPC_DSRA, OPC_DSRA32, rd, rt, sa);
 }
 
-static inline bool tcg_out_mov(TCGContext *s, TCGType type,
-                               TCGReg ret, TCGReg arg)
+static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 {
     /* Simple reg-reg move, optimising out the 'do nothing' case */
     if (ret != arg) {
@@ -624,27 +622,7 @@ static void tcg_out_bswap64(TCGContext *s, TCGReg ret, TCGReg arg)
     }
 }
 
-static inline void tcg_out_ext8s(TCGContext *s, TCGReg ret, TCGReg arg)
-{
-    if (use_mips32r2_instructions) {
-        tcg_out_opc_reg(s, OPC_SEB, ret, 0, arg);
-    } else {
-        tcg_out_opc_sa(s, OPC_SLL, ret, arg, 24);
-        tcg_out_opc_sa(s, OPC_SRA, ret, ret, 24);
-    }
-}
-
-static inline void tcg_out_ext16s(TCGContext *s, TCGReg ret, TCGReg arg)
-{
-    if (use_mips32r2_instructions) {
-        tcg_out_opc_reg(s, OPC_SEH, ret, 0, arg);
-    } else {
-        tcg_out_opc_sa(s, OPC_SLL, ret, arg, 16);
-        tcg_out_opc_sa(s, OPC_SRA, ret, ret, 16);
-    }
-}
-
-static inline void tcg_out_ext32u(TCGContext *s, TCGReg ret, TCGReg arg)
+static void tcg_out_ext32u(TCGContext *s, TCGReg ret, TCGReg arg)
 {
     if (use_mips32r2_instructions) {
         tcg_out_opc_bf(s, OPC_DEXT, ret, arg, 31, 0);
@@ -668,8 +646,8 @@ static void tcg_out_ldst(TCGContext *s, MIPSInsn opc, TCGReg data,
     tcg_out_opc_imm(s, opc, data, addr, lo);
 }
 
-static inline void tcg_out_ld(TCGContext *s, TCGType type, TCGReg arg,
-                              TCGReg arg1, intptr_t arg2)
+static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg arg,
+                       TCGReg arg1, intptr_t arg2)
 {
     MIPSInsn opc = OPC_LD;
     if (TCG_TARGET_REG_BITS == 32 || type == TCG_TYPE_I32) {
@@ -678,8 +656,8 @@ static inline void tcg_out_ld(TCGContext *s, TCGType type, TCGReg arg,
     tcg_out_ldst(s, opc, arg, arg1, arg2);
 }
 
-static inline void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
-                              TCGReg arg1, intptr_t arg2)
+static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
+                       TCGReg arg1, intptr_t arg2)
 {
     MIPSInsn opc = OPC_SD;
     if (TCG_TARGET_REG_BITS == 32 || type == TCG_TYPE_I32) {
@@ -688,8 +666,8 @@ static inline void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
     tcg_out_ldst(s, opc, arg, arg1, arg2);
 }
 
-static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
-                               TCGReg base, intptr_t ofs)
+static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
+                        TCGReg base, intptr_t ofs)
 {
     if (val == 0) {
         tcg_out_st(s, type, TCG_REG_ZERO, base, ofs);
@@ -1960,9 +1938,9 @@ static void tcg_out_clz(TCGContext *s, MIPSInsn opcv2, MIPSInsn opcv6,
     }
 }
 
-static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
-                              const TCGArg args[TCG_MAX_OP_ARGS],
-                              const int const_args[TCG_MAX_OP_ARGS])
+static void tcg_out_op(TCGContext *s, TCGOpcode opc,
+                       const TCGArg args[TCG_MAX_OP_ARGS],
+                       const int const_args[TCG_MAX_OP_ARGS])
 {
     MIPSInsn i1, i2;
     TCGArg a0, a1, a2;
-- 
2.25.1


