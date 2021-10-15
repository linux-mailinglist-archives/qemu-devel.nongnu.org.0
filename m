Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC9B42EC68
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 10:32:02 +0200 (CEST)
Received: from localhost ([::1]:35406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbIdF-0000cU-EA
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 04:32:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHy0-0001Jh-8a
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:49:24 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:40559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxy-00042P-5b
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:49:24 -0400
Received: by mail-pg1-x52d.google.com with SMTP id q5so7856392pgr.7
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jLfvyHVzjAajf8hxF6UhY3LcdeW9iZkifOV2lXXcCsE=;
 b=cqmYtIyIKZB6scZs7DpgT+ZwsASz8Mxw7fGQTLcBu6vdysU79OXLkLGWbVx4VpXJ7g
 S26f/FvVx2hSJhexMfMbnK54gBCaXJrJAV8wYd2wPePbCHakGGRigNswO8dDoP/UWdj/
 j9BMepWusrMrKWKg9xpl1naAm/D/EiP6lsSMb+gQnDhbcvhn6fIOOWSN7BWjDETw+Orq
 /5CT4ORppVbq8k8AgA+AMoPOt+QdjNnPfLESZbxDCGQ9nl2ezhdRTQGZ5byXhFedSPp3
 Bu/v8J6LEKUV7ou3OzC7pm0CPwI1/wgQtSVm2YXq5e0xQO231P9x8F29vvZQGcQRRFxD
 69Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jLfvyHVzjAajf8hxF6UhY3LcdeW9iZkifOV2lXXcCsE=;
 b=UQjN8zDbESXq15FE/VFTRGoXfjbavd+7HpWakckIHvVpZC8HlIrF84pgv4zIgom6yq
 Xgo0eUbME7A25be4gvHge8UJ0VslUA9SLodFguSCCA3J5y0S/0jcE7S4jchWuyOm8KLl
 RifgL9VurUD6z0B4oCL0zaeUfcIKiiLmp32nn2oQHgCcGpJ5vZfNqVshzos0jylHuOsd
 keOcg/BVtw46CiXwrdtoKrAnb5k6or3yL3S8tkrUAdbrw4Tt+dmdtZjRNnDB+YjTROLB
 ra6dlw/VvGLhWJ1UsziR0s0UNbVx28r7QMQMZ8Um8v6aufiegx6BvuGei9sJ7TILPli4
 nmWA==
X-Gm-Message-State: AOAM532Ust5d7l4vgZG37BPWrZxl7t6+c2hMSj+B3Sgi1Yvn4KIsNjh/
 DjE0GG8EwhUDbcHHy6PKVOZUY9aWjJ0uSlVD
X-Google-Smtp-Source: ABdhPJxCZFOElVcYrayh0Wimeftap78sz5HcRQ+BOyGJ8fgH1ffN7XS6cs4sb70zyzjMyk9oU7HOCg==
X-Received: by 2002:a05:6a00:90:b0:44c:6029:7fcb with SMTP id
 c16-20020a056a00009000b0044c60297fcbmr10142941pfj.69.1634284160634; 
 Fri, 15 Oct 2021 00:49:20 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:49:20 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 41/78] target/riscv: rvv-1.0: single-width averaging add
 and subtract instructions
Date: Fri, 15 Oct 2021 15:45:49 +0800
Message-Id: <20211015074627.3957162-49-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52d.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Add the following instructions:

* vaaddu.vv
* vaaddu.vx
* vasubu.vv
* vasubu.vx

Remove the following instructions:

* vadd.vi

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   | 16 ++++++
 target/riscv/insn32.decode              | 13 +++--
 target/riscv/insn_trans/trans_rvv.c.inc |  5 +-
 target/riscv/vector_helper.c            | 74 +++++++++++++++++++++++++
 4 files changed, 102 insertions(+), 6 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 878d82caf61..f2e8d107d2f 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -648,18 +648,34 @@ DEF_HELPER_6(vaadd_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vaadd_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vaadd_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vaadd_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vaaddu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vaaddu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vaaddu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vaaddu_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vasub_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vasub_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vasub_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vasub_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vasubu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vasubu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vasubu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vasubu_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vaadd_vx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vaadd_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vaadd_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vaadd_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vaaddu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vaaddu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vaaddu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vaaddu_vx_d, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vasub_vx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vasub_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vasub_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vasub_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vasubu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vasubu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vasubu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vasubu_vx_d, void, ptr, ptr, tl, ptr, env, i32)
 
 DEF_HELPER_6(vsmul_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vsmul_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index a6f9e5dcc66..f83c8daf24e 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -493,11 +493,14 @@ vssubu_vv       100010 . ..... ..... 000 ..... 1010111 @r_vm
 vssubu_vx       100010 . ..... ..... 100 ..... 1010111 @r_vm
 vssub_vv        100011 . ..... ..... 000 ..... 1010111 @r_vm
 vssub_vx        100011 . ..... ..... 100 ..... 1010111 @r_vm
-vaadd_vv        100100 . ..... ..... 000 ..... 1010111 @r_vm
-vaadd_vx        100100 . ..... ..... 100 ..... 1010111 @r_vm
-vaadd_vi        100100 . ..... ..... 011 ..... 1010111 @r_vm
-vasub_vv        100110 . ..... ..... 000 ..... 1010111 @r_vm
-vasub_vx        100110 . ..... ..... 100 ..... 1010111 @r_vm
+vaadd_vv        001001 . ..... ..... 010 ..... 1010111 @r_vm
+vaadd_vx        001001 . ..... ..... 110 ..... 1010111 @r_vm
+vaaddu_vv       001000 . ..... ..... 010 ..... 1010111 @r_vm
+vaaddu_vx       001000 . ..... ..... 110 ..... 1010111 @r_vm
+vasub_vv        001011 . ..... ..... 010 ..... 1010111 @r_vm
+vasub_vx        001011 . ..... ..... 110 ..... 1010111 @r_vm
+vasubu_vv       001010 . ..... ..... 010 ..... 1010111 @r_vm
+vasubu_vx       001010 . ..... ..... 110 ..... 1010111 @r_vm
 vsmul_vv        100111 . ..... ..... 000 ..... 1010111 @r_vm
 vsmul_vx        100111 . ..... ..... 100 ..... 1010111 @r_vm
 vwsmaccu_vv     111100 . ..... ..... 000 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 43cdc846d9f..0fc19b19c69 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2003,10 +2003,13 @@ GEN_OPIVI_TRANS(vsadd_vi, IMM_SX, vsadd_vx, opivx_check)
 
 /* Vector Single-Width Averaging Add and Subtract */
 GEN_OPIVV_TRANS(vaadd_vv, opivv_check)
+GEN_OPIVV_TRANS(vaaddu_vv, opivv_check)
 GEN_OPIVV_TRANS(vasub_vv, opivv_check)
+GEN_OPIVV_TRANS(vasubu_vv, opivv_check)
 GEN_OPIVX_TRANS(vaadd_vx,  opivx_check)
+GEN_OPIVX_TRANS(vaaddu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vasub_vx,  opivx_check)
-GEN_OPIVI_TRANS(vaadd_vi, 0, vaadd_vx, opivx_check)
+GEN_OPIVX_TRANS(vasubu_vx,  opivx_check)
 
 /* Vector Single-Width Fractional Multiply with Rounding and Saturation */
 GEN_OPIVV_TRANS(vsmul_vv, opivv_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 58ba2a7d99b..6891f28116f 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -2295,6 +2295,43 @@ GEN_VEXT_VX_RM(vaadd_vx_h, 2, 2)
 GEN_VEXT_VX_RM(vaadd_vx_w, 4, 4)
 GEN_VEXT_VX_RM(vaadd_vx_d, 8, 8)
 
+static inline uint32_t aaddu32(CPURISCVState *env, int vxrm,
+                               uint32_t a, uint32_t b)
+{
+    uint64_t res = (uint64_t)a + b;
+    uint8_t round = get_round(vxrm, res, 1);
+
+    return (res >> 1) + round;
+}
+
+static inline uint64_t aaddu64(CPURISCVState *env, int vxrm,
+                               uint64_t a, uint64_t b)
+{
+    uint64_t res = a + b;
+    uint8_t round = get_round(vxrm, res, 1);
+    uint64_t over = (uint64_t)(res < a) << 63;
+
+    return ((res >> 1) | over) + round;
+}
+
+RVVCALL(OPIVV2_RM, vaaddu_vv_b, OP_UUU_B, H1, H1, H1, aaddu32)
+RVVCALL(OPIVV2_RM, vaaddu_vv_h, OP_UUU_H, H2, H2, H2, aaddu32)
+RVVCALL(OPIVV2_RM, vaaddu_vv_w, OP_UUU_W, H4, H4, H4, aaddu32)
+RVVCALL(OPIVV2_RM, vaaddu_vv_d, OP_UUU_D, H8, H8, H8, aaddu64)
+GEN_VEXT_VV_RM(vaaddu_vv_b, 1, 1)
+GEN_VEXT_VV_RM(vaaddu_vv_h, 2, 2)
+GEN_VEXT_VV_RM(vaaddu_vv_w, 4, 4)
+GEN_VEXT_VV_RM(vaaddu_vv_d, 8, 8)
+
+RVVCALL(OPIVX2_RM, vaaddu_vx_b, OP_UUU_B, H1, H1, aaddu32)
+RVVCALL(OPIVX2_RM, vaaddu_vx_h, OP_UUU_H, H2, H2, aaddu32)
+RVVCALL(OPIVX2_RM, vaaddu_vx_w, OP_UUU_W, H4, H4, aaddu32)
+RVVCALL(OPIVX2_RM, vaaddu_vx_d, OP_UUU_D, H8, H8, aaddu64)
+GEN_VEXT_VX_RM(vaaddu_vx_b, 1, 1)
+GEN_VEXT_VX_RM(vaaddu_vx_h, 2, 2)
+GEN_VEXT_VX_RM(vaaddu_vx_w, 4, 4)
+GEN_VEXT_VX_RM(vaaddu_vx_d, 8, 8)
+
 static inline int32_t asub32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
 {
     int64_t res = (int64_t)a - b;
@@ -2331,6 +2368,43 @@ GEN_VEXT_VX_RM(vasub_vx_h, 2, 2)
 GEN_VEXT_VX_RM(vasub_vx_w, 4, 4)
 GEN_VEXT_VX_RM(vasub_vx_d, 8, 8)
 
+static inline uint32_t asubu32(CPURISCVState *env, int vxrm,
+                               uint32_t a, uint32_t b)
+{
+    int64_t res = (int64_t)a - b;
+    uint8_t round = get_round(vxrm, res, 1);
+
+    return (res >> 1) + round;
+}
+
+static inline uint64_t asubu64(CPURISCVState *env, int vxrm,
+                               uint64_t a, uint64_t b)
+{
+    uint64_t res = (uint64_t)a - b;
+    uint8_t round = get_round(vxrm, res, 1);
+    uint64_t over = (uint64_t)(res > a) << 63;
+
+    return ((res >> 1) | over) + round;
+}
+
+RVVCALL(OPIVV2_RM, vasubu_vv_b, OP_UUU_B, H1, H1, H1, asubu32)
+RVVCALL(OPIVV2_RM, vasubu_vv_h, OP_UUU_H, H2, H2, H2, asubu32)
+RVVCALL(OPIVV2_RM, vasubu_vv_w, OP_UUU_W, H4, H4, H4, asubu32)
+RVVCALL(OPIVV2_RM, vasubu_vv_d, OP_UUU_D, H8, H8, H8, asubu64)
+GEN_VEXT_VV_RM(vasubu_vv_b, 1, 1)
+GEN_VEXT_VV_RM(vasubu_vv_h, 2, 2)
+GEN_VEXT_VV_RM(vasubu_vv_w, 4, 4)
+GEN_VEXT_VV_RM(vasubu_vv_d, 8, 8)
+
+RVVCALL(OPIVX2_RM, vasubu_vx_b, OP_UUU_B, H1, H1, asubu32)
+RVVCALL(OPIVX2_RM, vasubu_vx_h, OP_UUU_H, H2, H2, asubu32)
+RVVCALL(OPIVX2_RM, vasubu_vx_w, OP_UUU_W, H4, H4, asubu32)
+RVVCALL(OPIVX2_RM, vasubu_vx_d, OP_UUU_D, H8, H8, asubu64)
+GEN_VEXT_VX_RM(vasubu_vx_b, 1, 1)
+GEN_VEXT_VX_RM(vasubu_vx_h, 2, 2)
+GEN_VEXT_VX_RM(vasubu_vx_w, 4, 4)
+GEN_VEXT_VX_RM(vasubu_vx_d, 8, 8)
+
 /* Vector Single-Width Fractional Multiply with Rounding and Saturation */
 static inline int8_t vsmul8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
 {
-- 
2.25.1


