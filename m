Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 036F447C4A2
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 18:05:04 +0100 (CET)
Received: from localhost ([::1]:48282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mziZS-0001Si-JO
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 12:05:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziJ6-0000lk-1c
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:08 -0500
Received: from [2607:f8b0:4864:20::52d] (port=46861
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIy-0007eR-Fv
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:07 -0500
Received: by mail-pg1-x52d.google.com with SMTP id r138so12808968pgr.13
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xsk+2FSM9qIPtR1lzU6kn4T2/GDRxZA6hkAgcKdEqyM=;
 b=g4Ifrn6x8aS4UPjCHhWoBsSjeEa8InJLLljGQolyzKG/5sSNpT529I5bp2YQ5weHJ9
 jxyzEg6IZWdt8A7jjGtSdgc7jv6ktACky+8Hno06dqzSgWQvR/doY9dsXzo05dGIC9GY
 DDXgGGQ7EovgUbvX3Xb5i04eKfn9de+PviYwOsIA5u0i82FTMAc0kt0Li3UrQvHmb655
 o0GrmMU54FHrdC0MxscD/jwGy9sAVb6p7LiCC1cUr6IxcuLt4zU76Xp+ehDme9PrRQkC
 POrB8TJNdh41qFG2tq45NhFbdncMF/sKkjlvocczVgT+eGBwKBKwvj+xjPd9/0BLTL1L
 WHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xsk+2FSM9qIPtR1lzU6kn4T2/GDRxZA6hkAgcKdEqyM=;
 b=MppwKh7LhnPcYnQoBqSjKoZt5fpUf7S3rCOEk6AWd+k79JWgFArkZM8kYWskhfA8tQ
 XO2+45b9EV6qngZLJtGnGiaAxkha3aWq7Itu43kJwl3Q0TvpwkTqdSj8wrYXTBuyUCKM
 mVI6a/6z6dq0ydsQD6JbgCB05AL+Ywq22Zb0GkxhvOCVwfwb8ZrkPtth3fMDYzCfzwHv
 l6xB8i33b0+gRLnuZUO0xwyWV/1hj/jYmcg5bkysQ4pO4mi1J2u3Fn8TzaOZ6EfDoxt1
 wayztT6zcKw4eiDEQo1hAYQ8lV34ZdG6z05pz7ffgEShI08R6rDubP8VsLCCXp4hyAxQ
 O4lQ==
X-Gm-Message-State: AOAM533jHG2KN8FDSiecb3ceH6X9vCaW5H/De0m84wKLJRD+Yp/1GQOO
 GLzctcwSP3Eto7sdPH1UH/sJPmRpcJCbKg==
X-Google-Smtp-Source: ABdhPJw62xgKMJvrxXIxYFL6so9FASJMfMNCBHIXu/NT2SP9zcFArVxIw+RvtLefm3WyDNdwgLFMNA==
X-Received: by 2002:a62:6497:0:b0:4ba:737c:8021 with SMTP id
 y145-20020a626497000000b004ba737c8021mr3828049pfb.18.1640105279229; 
 Tue, 21 Dec 2021 08:47:59 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2256818pga.35.2021.12.21.08.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:47:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/31] tcg/loongarch64: Implement simple load/store ops
Date: Tue, 21 Dec 2021 08:47:28 -0800
Message-Id: <20211221164737.1076007-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221164737.1076007-1-richard.henderson@linaro.org>
References: <20211221164737.1076007-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <git@xen0n.name>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211221054105.178795-23-git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target-con-set.h |   1 +
 tcg/loongarch64/tcg-target.c.inc     | 131 +++++++++++++++++++++++++++
 2 files changed, 132 insertions(+)

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
index a2ec61237e..e54ca9b2de 100644
--- a/tcg/loongarch64/tcg-target-con-set.h
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -15,6 +15,7 @@
  * tcg-target-con-str.h; the constraint combination is inclusive or.
  */
 C_O0_I1(r)
+C_O0_I2(rZ, r)
 C_O0_I2(rZ, rZ)
 C_O1_I1(r, r)
 C_O1_I2(r, r, rC)
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 151d3308ea..3d1d7c33c0 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -565,6 +565,73 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
     tcg_out_call_int(s, arg, false);
 }
 
+/*
+ * Load/store helpers
+ */
+
+static void tcg_out_ldst(TCGContext *s, LoongArchInsn opc, TCGReg data,
+                         TCGReg addr, intptr_t offset)
+{
+    intptr_t imm12 = sextreg(offset, 0, 12);
+
+    if (offset != imm12) {
+        intptr_t diff = offset - (uintptr_t)s->code_ptr;
+
+        if (addr == TCG_REG_ZERO && diff == (int32_t)diff) {
+            imm12 = sextreg(diff, 0, 12);
+            tcg_out_opc_pcaddu12i(s, TCG_REG_TMP2, (diff - imm12) >> 12);
+        } else {
+            tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_TMP2, offset - imm12);
+            if (addr != TCG_REG_ZERO) {
+                tcg_out_opc_add_d(s, TCG_REG_TMP2, TCG_REG_TMP2, addr);
+            }
+        }
+        addr = TCG_REG_TMP2;
+    }
+
+    switch (opc) {
+    case OPC_LD_B:
+    case OPC_LD_BU:
+    case OPC_LD_H:
+    case OPC_LD_HU:
+    case OPC_LD_W:
+    case OPC_LD_WU:
+    case OPC_LD_D:
+    case OPC_ST_B:
+    case OPC_ST_H:
+    case OPC_ST_W:
+    case OPC_ST_D:
+        tcg_out32(s, encode_djsk12_insn(opc, data, addr, imm12));
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg arg,
+                       TCGReg arg1, intptr_t arg2)
+{
+    bool is_32bit = type == TCG_TYPE_I32;
+    tcg_out_ldst(s, is_32bit ? OPC_LD_W : OPC_LD_D, arg, arg1, arg2);
+}
+
+static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
+                       TCGReg arg1, intptr_t arg2)
+{
+    bool is_32bit = type == TCG_TYPE_I32;
+    tcg_out_ldst(s, is_32bit ? OPC_ST_W : OPC_ST_D, arg, arg1, arg2);
+}
+
+static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
+                        TCGReg base, intptr_t ofs)
+{
+    if (val == 0) {
+        tcg_out_st(s, type, TCG_REG_ZERO, base, ofs);
+        return true;
+    }
+    return false;
+}
+
 /*
  * Entry-points
  */
@@ -913,6 +980,49 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_setcond(s, args[3], a0, a1, a2, c2);
         break;
 
+    case INDEX_op_ld8s_i32:
+    case INDEX_op_ld8s_i64:
+        tcg_out_ldst(s, OPC_LD_B, a0, a1, a2);
+        break;
+    case INDEX_op_ld8u_i32:
+    case INDEX_op_ld8u_i64:
+        tcg_out_ldst(s, OPC_LD_BU, a0, a1, a2);
+        break;
+    case INDEX_op_ld16s_i32:
+    case INDEX_op_ld16s_i64:
+        tcg_out_ldst(s, OPC_LD_H, a0, a1, a2);
+        break;
+    case INDEX_op_ld16u_i32:
+    case INDEX_op_ld16u_i64:
+        tcg_out_ldst(s, OPC_LD_HU, a0, a1, a2);
+        break;
+    case INDEX_op_ld_i32:
+    case INDEX_op_ld32s_i64:
+        tcg_out_ldst(s, OPC_LD_W, a0, a1, a2);
+        break;
+    case INDEX_op_ld32u_i64:
+        tcg_out_ldst(s, OPC_LD_WU, a0, a1, a2);
+        break;
+    case INDEX_op_ld_i64:
+        tcg_out_ldst(s, OPC_LD_D, a0, a1, a2);
+        break;
+
+    case INDEX_op_st8_i32:
+    case INDEX_op_st8_i64:
+        tcg_out_ldst(s, OPC_ST_B, a0, a1, a2);
+        break;
+    case INDEX_op_st16_i32:
+    case INDEX_op_st16_i64:
+        tcg_out_ldst(s, OPC_ST_H, a0, a1, a2);
+        break;
+    case INDEX_op_st_i32:
+    case INDEX_op_st32_i64:
+        tcg_out_ldst(s, OPC_ST_W, a0, a1, a2);
+        break;
+    case INDEX_op_st_i64:
+        tcg_out_ldst(s, OPC_ST_D, a0, a1, a2);
+        break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
@@ -927,6 +1037,15 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_goto_ptr:
         return C_O0_I1(r);
 
+    case INDEX_op_st8_i32:
+    case INDEX_op_st8_i64:
+    case INDEX_op_st16_i32:
+    case INDEX_op_st16_i64:
+    case INDEX_op_st32_i64:
+    case INDEX_op_st_i32:
+    case INDEX_op_st_i64:
+        return C_O0_I2(rZ, r);
+
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
         return C_O0_I2(rZ, rZ);
@@ -954,6 +1073,18 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_bswap32_i32:
     case INDEX_op_bswap32_i64:
     case INDEX_op_bswap64_i64:
+    case INDEX_op_ld8s_i32:
+    case INDEX_op_ld8s_i64:
+    case INDEX_op_ld8u_i32:
+    case INDEX_op_ld8u_i64:
+    case INDEX_op_ld16s_i32:
+    case INDEX_op_ld16s_i64:
+    case INDEX_op_ld16u_i32:
+    case INDEX_op_ld16u_i64:
+    case INDEX_op_ld32s_i64:
+    case INDEX_op_ld32u_i64:
+    case INDEX_op_ld_i32:
+    case INDEX_op_ld_i64:
         return C_O1_I1(r, r);
 
     case INDEX_op_andc_i32:
-- 
2.25.1


