Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7654240DED7
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 18:00:00 +0200 (CEST)
Received: from localhost ([::1]:55052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtnr-00049i-FS
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLo-0001oY-EZ
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:31:00 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:41879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLe-0002e4-Vy
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:31:00 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 m21-20020a17090a859500b00197688449c4so5077647pjn.0
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5xOsJ/q61bGEcfr8bVryci8I2a76P5P5Z/hHe2uiGQU=;
 b=X5Bj0xlWqkjbhNdkvMen8D+0vTEV/wPMyOe5ySGvZGeTpwuSsddlyiW7gPEoYAwvJw
 1O49OUjgiRJ1ARv721m1snsbiCGrgeWHUTsCzA318bD2i7KcOyP3F7bAil3E0bsWj3c1
 Pm/Raqih2UIaz9G46EJtjUFcObygQFxbuCxFybZjYE1DwyZ+Xf1X9RrUhDX+aXf8HpPW
 YJ1+vap8C6vSt+xB6nE/GdK6+OTLav5RhIlxdS7+s4idYQ7j2UB31/7ydjZS0rYPwg+3
 qEWF2mnz1e6vzxCRiK4xaRkp/IF3Id6PNDOcljPOeXlyGe3tIVgLtdZEWSUrR/DEa/Md
 c7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5xOsJ/q61bGEcfr8bVryci8I2a76P5P5Z/hHe2uiGQU=;
 b=vdas28vKRg5IpVp3ViMm8rZCyWk7DujtDQqjYYi5NFvuyB2n7rdW7W5zQeypb0Aj3Z
 wml+xTWfSaegzaR0+rWyeA25I9evYH+KpVUHgqKzfs89A1TgQyE1aB4DggLI9Z0y3dmX
 4Bp9SPAvJ1SpirSAwZ91peX7o0RcSKk5z3NboBC+KkleF6xG6dNo3uYdjAuIFC92d/hO
 La9G/HL+n/uCwhn+vs8PXg/ANLojwqf4XEWe/HHPlADWQef6slgq5rwYcwxQW7IOFS+o
 hUnO14atUnGMmkEMa/8+3qZhS76oRoQoSb4CLKzpnbIPy1/Yfe3O/5zuhtPwbzKVQvf8
 MFTA==
X-Gm-Message-State: AOAM533uLdIiPyETlRRnD7x3pWUVE3CAwxQFvnzhh6pOaB9CZDRiViHO
 edKNwPaDg50J3fAZTs43zzbPmrgC/7+7RQ==
X-Google-Smtp-Source: ABdhPJyhNdOYiGmEfmh/U0oFO8q7IjkWPwWik8erLEjMuoEm3/h4L7ROeXY49NfQ2bjrE91oJXInwQ==
X-Received: by 2002:a17:902:680d:b0:13a:503f:f381 with SMTP id
 h13-20020a170902680d00b0013a503ff381mr5353832plk.30.1631806248651; 
 Thu, 16 Sep 2021 08:30:48 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/35] tcg/mips: Drop inline markers
Date: Thu, 16 Sep 2021 08:30:22 -0700
Message-Id: <20210916153025.1944763-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let the compiler decide about inlining.
Remove tcg_out_ext8s and tcg_out_ext16s as unused.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 76 ++++++++++++++-------------------------
 1 file changed, 27 insertions(+), 49 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index bf0eb84e2d..320795a637 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -187,7 +187,7 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
 #endif
 
 
-static inline bool is_p2m1(tcg_target_long val)
+static bool is_p2m1(tcg_target_long val)
 {
     return val && ((val + 1) & val) == 0;
 }
@@ -361,8 +361,8 @@ typedef enum {
 /*
  * Type reg
  */
-static inline void tcg_out_opc_reg(TCGContext *s, MIPSInsn opc,
-                                   TCGReg rd, TCGReg rs, TCGReg rt)
+static void tcg_out_opc_reg(TCGContext *s, MIPSInsn opc,
+                            TCGReg rd, TCGReg rs, TCGReg rt)
 {
     int32_t inst;
 
@@ -376,8 +376,8 @@ static inline void tcg_out_opc_reg(TCGContext *s, MIPSInsn opc,
 /*
  * Type immediate
  */
-static inline void tcg_out_opc_imm(TCGContext *s, MIPSInsn opc,
-                                   TCGReg rt, TCGReg rs, TCGArg imm)
+static void tcg_out_opc_imm(TCGContext *s, MIPSInsn opc,
+                            TCGReg rt, TCGReg rs, TCGArg imm)
 {
     int32_t inst;
 
@@ -391,8 +391,8 @@ static inline void tcg_out_opc_imm(TCGContext *s, MIPSInsn opc,
 /*
  * Type bitfield
  */
-static inline void tcg_out_opc_bf(TCGContext *s, MIPSInsn opc, TCGReg rt,
-                                  TCGReg rs, int msb, int lsb)
+static void tcg_out_opc_bf(TCGContext *s, MIPSInsn opc, TCGReg rt,
+                           TCGReg rs, int msb, int lsb)
 {
     int32_t inst;
 
@@ -404,8 +404,8 @@ static inline void tcg_out_opc_bf(TCGContext *s, MIPSInsn opc, TCGReg rt,
     tcg_out32(s, inst);
 }
 
-static inline void tcg_out_opc_bf64(TCGContext *s, MIPSInsn opc, MIPSInsn opm,
-                                    MIPSInsn oph, TCGReg rt, TCGReg rs,
+static void tcg_out_opc_bf64(TCGContext *s, MIPSInsn opc, MIPSInsn opm,
+                             MIPSInsn oph, TCGReg rt, TCGReg rs,
                                     int msb, int lsb)
 {
     if (lsb >= 32) {
@@ -422,8 +422,7 @@ static inline void tcg_out_opc_bf64(TCGContext *s, MIPSInsn opc, MIPSInsn opm,
 /*
  * Type branch
  */
-static inline void tcg_out_opc_br(TCGContext *s, MIPSInsn opc,
-                                  TCGReg rt, TCGReg rs)
+static void tcg_out_opc_br(TCGContext *s, MIPSInsn opc, TCGReg rt, TCGReg rs)
 {
     tcg_out_opc_imm(s, opc, rt, rs, 0);
 }
@@ -431,8 +430,8 @@ static inline void tcg_out_opc_br(TCGContext *s, MIPSInsn opc,
 /*
  * Type sa
  */
-static inline void tcg_out_opc_sa(TCGContext *s, MIPSInsn opc,
-                                  TCGReg rd, TCGReg rt, TCGArg sa)
+static void tcg_out_opc_sa(TCGContext *s, MIPSInsn opc,
+                           TCGReg rd, TCGReg rt, TCGArg sa)
 {
     int32_t inst;
 
@@ -479,28 +478,27 @@ static bool tcg_out_opc_jmp(TCGContext *s, MIPSInsn opc, const void *target)
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
@@ -612,27 +610,7 @@ static void tcg_out_bswap64(TCGContext *s, TCGReg ret, TCGReg arg)
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
@@ -656,8 +634,8 @@ static void tcg_out_ldst(TCGContext *s, MIPSInsn opc, TCGReg data,
     tcg_out_opc_imm(s, opc, data, addr, lo);
 }
 
-static inline void tcg_out_ld(TCGContext *s, TCGType type, TCGReg arg,
-                              TCGReg arg1, intptr_t arg2)
+static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg arg,
+                       TCGReg arg1, intptr_t arg2)
 {
     MIPSInsn opc = OPC_LD;
     if (TCG_TARGET_REG_BITS == 32 || type == TCG_TYPE_I32) {
@@ -666,8 +644,8 @@ static inline void tcg_out_ld(TCGContext *s, TCGType type, TCGReg arg,
     tcg_out_ldst(s, opc, arg, arg1, arg2);
 }
 
-static inline void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
-                              TCGReg arg1, intptr_t arg2)
+static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
+                       TCGReg arg1, intptr_t arg2)
 {
     MIPSInsn opc = OPC_SD;
     if (TCG_TARGET_REG_BITS == 32 || type == TCG_TYPE_I32) {
@@ -676,8 +654,8 @@ static inline void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
     tcg_out_ldst(s, opc, arg, arg1, arg2);
 }
 
-static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
-                               TCGReg base, intptr_t ofs)
+static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
+                        TCGReg base, intptr_t ofs)
 {
     if (val == 0) {
         tcg_out_st(s, type, TCG_REG_ZERO, base, ofs);
@@ -1637,9 +1615,9 @@ static void tcg_out_clz(TCGContext *s, MIPSInsn opcv2, MIPSInsn opcv6,
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


