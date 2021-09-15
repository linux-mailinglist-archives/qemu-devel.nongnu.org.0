Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE3E40CEE6
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 23:33:28 +0200 (CEST)
Received: from localhost ([::1]:57376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQcX1-0006bt-TD
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 17:33:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQcV4-0003Zl-4O
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 17:31:26 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:55234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQcV1-0003ID-PY
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 17:31:25 -0400
Received: by mail-pj1-x1031.google.com with SMTP id i19so3074818pjv.4
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 14:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uHvPFpIuiYqhsTXY34UD3Ql4hY+bg5Ikh0pMVxAghl0=;
 b=sj0Ny+kXI27sKsIkWjYhChOR4uunuxyhwwoWHF7M1rcT9wzBjcgFL6VIUvBEK0S8Rz
 ZEJ8eTl6YuIJW36jnb7C3+sCjL2LTuU2DNl5P8U0BpQImDzUz9UQyv1dgkaCZP8dl4pR
 JB14BWru1BK1o6NXiyL/isVaDvD+QGXbPt6q0JAW11/5spWasj0C/CPS+dL57TOrFfnN
 ptBpZSAlUyHwnWiGyzYjGtUY3icAglcnqKRhfPOc9gW1AGBNEeXY3kKY5gQ1fcWSTNzP
 arIsPjC0wOhruWQG/Veg/klLX1BY02bxQzEtJvgipNDgpxToWCJ+LHH1gZF443peU6EO
 gKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uHvPFpIuiYqhsTXY34UD3Ql4hY+bg5Ikh0pMVxAghl0=;
 b=B0MLn77TPmY6akxw+61L95s+xDpPqPNoeFr0QZ6/FX90xbaVjrR3y0YP08djawxbyp
 P9NMvg94NPrQFdsXyMmI7b5UVnopmJMO6fHmmajX0ghnOrLTEAdGbdo084yQv2lfbEne
 v1sL3w1Z/x8XBnaMyZjefHasthzZMVI+gcWs8bUKErMCGlMqEcmcoHhMgAbInSrZNLKz
 KSKyMb/ZjzUkhMBltes4lepo6xxMTz2j2g6ruDphcrNX5c1i09SRsZGIdm56qK0IwdKo
 9UYm7OU7X5wulQZV40QEfOVWxM/4TXzSQgTdRzSb7b2YsH8rjwE6SvYuZCbMl7F5emO3
 0Wag==
X-Gm-Message-State: AOAM533I0sdbnrH3hj2QNoxuna807xnY89daACMr1o5JUN5LKEj//seH
 q5tBecLPYFb7xmE7891CwIeYwsNyab1t3g==
X-Google-Smtp-Source: ABdhPJw+/sI2zsv821SzK3ldsojuPZSwdvlMSh7FyFOQ90jAtu8M/Ntj9qJbH25NA3lYlbgmduClww==
X-Received: by 2002:a17:90a:bd08:: with SMTP id
 y8mr1956262pjr.123.1631741482458; 
 Wed, 15 Sep 2021 14:31:22 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q20sm837879pgu.31.2021.09.15.14.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 14:31:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/16] tcg/s390x: Implement tcg_out_ld/st for vector types
Date: Wed, 15 Sep 2021 14:31:04 -0700
Message-Id: <20210915213114.1923776-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210915213114.1923776-1-richard.henderson@linaro.org>
References: <20210915213114.1923776-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 132 +++++++++++++++++++++++++++++++++----
 1 file changed, 120 insertions(+), 12 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index c438751834..ea04aefe98 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -265,6 +265,12 @@ typedef enum S390Opcode {
     RX_STC      = 0x42,
     RX_STH      = 0x40,
 
+    VRX_VL      = 0xe706,
+    VRX_VLLEZ   = 0xe704,
+    VRX_VST     = 0xe70e,
+    VRX_VSTEF   = 0xe70b,
+    VRX_VSTEG   = 0xe70a,
+
     NOP         = 0x0707,
 } S390Opcode;
 
@@ -412,6 +418,16 @@ static void * const qemu_st_helpers[16] = {
 static const tcg_insn_unit *tb_ret_addr;
 uint64_t s390_facilities[3];
 
+static inline bool is_general_reg(TCGReg r)
+{
+    return r <= TCG_REG_R15;
+}
+
+static inline bool is_vector_reg(TCGReg r)
+{
+    return r >= TCG_REG_V0 && r <= TCG_REG_V31;
+}
+
 static bool patch_reloc(tcg_insn_unit *src_rw, int type,
                         intptr_t value, intptr_t addend)
 {
@@ -529,6 +545,31 @@ static void tcg_out_insn_RSY(TCGContext *s, S390Opcode op, TCGReg r1,
 #define tcg_out_insn_RX   tcg_out_insn_RS
 #define tcg_out_insn_RXY  tcg_out_insn_RSY
 
+static int RXB(TCGReg v1, TCGReg v2, TCGReg v3, TCGReg v4)
+{
+    /*
+     * Shift bit 4 of each regno to its corresponding bit of RXB.
+     * RXB itself begins at bit 8 of the instruction so 8 - 4 = 4
+     * is the left-shift of the 4th operand.
+     */
+    return ((v1 & 0x10) << (4 + 3))
+         | ((v2 & 0x10) << (4 + 2))
+         | ((v3 & 0x10) << (4 + 1))
+         | ((v4 & 0x10) << (4 + 0));
+}
+
+static void tcg_out_insn_VRX(TCGContext *s, S390Opcode op, TCGReg v1,
+                             TCGReg b2, TCGReg x2, intptr_t d2, int m3)
+{
+    tcg_debug_assert(is_vector_reg(v1));
+    tcg_debug_assert(d2 >= 0 && d2 <= 0xfff);
+    tcg_debug_assert(is_general_reg(x2));
+    tcg_debug_assert(is_general_reg(b2));
+    tcg_out16(s, (op & 0xff00) | ((v1 & 0xf) << 4) | x2);
+    tcg_out16(s, (b2 << 12) | d2);
+    tcg_out16(s, (op & 0x00ff) | RXB(v1, 0, 0, 0) | (m3 << 12));
+}
+
 /* Emit an opcode with "type-checking" of the format.  */
 #define tcg_out_insn(S, FMT, OP, ...) \
     glue(tcg_out_insn_,FMT)(S, glue(glue(FMT,_),OP), ## __VA_ARGS__)
@@ -705,25 +746,92 @@ static void tcg_out_mem(TCGContext *s, S390Opcode opc_rx, S390Opcode opc_rxy,
     }
 }
 
+static void tcg_out_vrx_mem(TCGContext *s, S390Opcode opc_vrx,
+                            TCGReg data, TCGReg base, TCGReg index,
+                            tcg_target_long ofs, int m3)
+{
+    if (ofs < 0 || ofs >= 0x1000) {
+        if (ofs >= -0x80000 && ofs < 0x80000) {
+            tcg_out_insn(s, RXY, LAY, TCG_TMP0, base, index, ofs);
+            base = TCG_TMP0;
+            index = TCG_REG_NONE;
+            ofs = 0;
+        } else {
+            tcg_out_movi(s, TCG_TYPE_PTR, TCG_TMP0, ofs);
+            if (index != TCG_REG_NONE) {
+                tcg_out_insn(s, RRE, AGR, TCG_TMP0, index);
+            }
+            index = TCG_TMP0;
+            ofs = 0;
+        }
+    }
+    tcg_out_insn_VRX(s, opc_vrx, data, base, index, ofs, m3);
+}
 
 /* load data without address translation or endianness conversion */
-static inline void tcg_out_ld(TCGContext *s, TCGType type, TCGReg data,
-                              TCGReg base, intptr_t ofs)
+static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg data,
+                       TCGReg base, intptr_t ofs)
 {
-    if (type == TCG_TYPE_I32) {
-        tcg_out_mem(s, RX_L, RXY_LY, data, base, TCG_REG_NONE, ofs);
-    } else {
-        tcg_out_mem(s, 0, RXY_LG, data, base, TCG_REG_NONE, ofs);
+    switch (type) {
+    case TCG_TYPE_I32:
+        if (likely(is_general_reg(data))) {
+            tcg_out_mem(s, RX_L, RXY_LY, data, base, TCG_REG_NONE, ofs);
+            break;
+        }
+        tcg_out_vrx_mem(s, VRX_VLLEZ, data, base, TCG_REG_NONE, ofs, MO_32);
+        break;
+
+    case TCG_TYPE_I64:
+        if (likely(is_general_reg(data))) {
+            tcg_out_mem(s, 0, RXY_LG, data, base, TCG_REG_NONE, ofs);
+            break;
+        }
+        /* fallthru */
+
+    case TCG_TYPE_V64:
+        tcg_out_vrx_mem(s, VRX_VLLEZ, data, base, TCG_REG_NONE, ofs, MO_64);
+        break;
+
+    case TCG_TYPE_V128:
+        /* Hint quadword aligned.  */
+        tcg_out_vrx_mem(s, VRX_VL, data, base, TCG_REG_NONE, ofs, 4);
+        break;
+
+    default:
+        g_assert_not_reached();
     }
 }
 
-static inline void tcg_out_st(TCGContext *s, TCGType type, TCGReg data,
-                              TCGReg base, intptr_t ofs)
+static void tcg_out_st(TCGContext *s, TCGType type, TCGReg data,
+                       TCGReg base, intptr_t ofs)
 {
-    if (type == TCG_TYPE_I32) {
-        tcg_out_mem(s, RX_ST, RXY_STY, data, base, TCG_REG_NONE, ofs);
-    } else {
-        tcg_out_mem(s, 0, RXY_STG, data, base, TCG_REG_NONE, ofs);
+    switch (type) {
+    case TCG_TYPE_I32:
+        if (likely(is_general_reg(data))) {
+            tcg_out_mem(s, RX_ST, RXY_STY, data, base, TCG_REG_NONE, ofs);
+        } else {
+            tcg_out_vrx_mem(s, VRX_VSTEF, data, base, TCG_REG_NONE, ofs, 1);
+        }
+        break;
+
+    case TCG_TYPE_I64:
+        if (likely(is_general_reg(data))) {
+            tcg_out_mem(s, 0, RXY_STG, data, base, TCG_REG_NONE, ofs);
+            break;
+        }
+        /* fallthru */
+
+    case TCG_TYPE_V64:
+        tcg_out_vrx_mem(s, VRX_VSTEG, data, base, TCG_REG_NONE, ofs, 0);
+        break;
+
+    case TCG_TYPE_V128:
+        /* Hint quadword aligned.  */
+        tcg_out_vrx_mem(s, VRX_VST, data, base, TCG_REG_NONE, ofs, 4);
+        break;
+
+    default:
+        g_assert_not_reached();
     }
 }
 
-- 
2.25.1


