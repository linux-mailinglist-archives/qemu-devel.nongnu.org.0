Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A88460D73
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 04:42:59 +0100 (CET)
Received: from localhost ([::1]:35976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrXZC-0006V1-BX
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 22:42:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX1S-0001c8-Oq
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:08:06 -0500
Received: from [2607:f8b0:4864:20::102e] (port=52097
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX1Q-0000ix-TS
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:08:06 -0500
Received: by mail-pj1-x102e.google.com with SMTP id gt5so11509712pjb.1
 for <qemu-devel@nongnu.org>; Sun, 28 Nov 2021 19:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xf5tpZXCRD0n9JwPouUPPNJR4N9EmWXXjKWWY52NHpE=;
 b=km6dlanTNzXCKuUvzZlmPMsJSm6E5z+ci4zszt/rdJ2bWTV5ax4NbbUVO4qpBiMIWi
 u2O4PcQx5La/ZFrmbMmQbp+jRvBu/VFYyba8jffRUbdviCkqHH3O9MAtv9XfHknckbq5
 fLZL8Y6U86TrUXPr7qE5CjXedg03rD+4y+/3S/Nbc+FzNWZyabC2roYRl9pfJl+X5aWt
 FNWIBuiFFHONnbOe7BSzx97cQG3LfViUNb4i4ysFm0EYSUWsfzZcEPNIoeXokb8349aB
 dEMe3Pjz5npVKgQc6M/8vg8HG6l7miy6Jjwi9pYrxhA4JahRLrOstq2yBHBPfUqcMot0
 MzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xf5tpZXCRD0n9JwPouUPPNJR4N9EmWXXjKWWY52NHpE=;
 b=ZtjK57cn1yQu3KwdTm7WPFE7WlIfbDPOtLoqKSj/jFiOAM6l9S2Zg3OzM65SV6X+Gy
 gBInzCWeTMySAjfGJpjZTXIalTxQdeqxDE5PHVsYZrFVC9PSTb1cKj0RhaQI5j3qd2/C
 1XqrQYzpRqAhBU+mFRTS1q+VwyRQzaNnDarHqfej4IrlpJAwW5l4QwfIB5izr00pHHld
 FJ/i2u9DtyUi1iJEZO4OPWiiJ3KB4PAwraZFjlR8tcfA0u9ly0v3s88Up8Y/Peq1rCQs
 ekpcTt1a+xZxCFsgx2GlwadXESkpdgHE5vanOIbswx7S8EQl9wU2E59vkYxS/ElYfj69
 5Klg==
X-Gm-Message-State: AOAM532U4MaoRTjFrH/jKc6TZkYZHtd/Lt81eXwhwP4rC0/Ey4c6HNPn
 RAqAT5MYxvpKLpVqTpjuQmBhpoqj5zrjEMk8
X-Google-Smtp-Source: ABdhPJxQgjZq1T6esQtRE16y9ifWN1MOysI6oTMNFM9Y57tYH9/Uue4wa0GX4pUUEBefiDreHQ2WIA==
X-Received: by 2002:a17:90a:e7d1:: with SMTP id
 kb17mr35223658pjb.124.1638155283569; 
 Sun, 28 Nov 2021 19:08:03 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:08:03 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v10 52/77] target/riscv: rvv-1.0: narrowing fixed-point clip
 instructions
Date: Mon, 29 Nov 2021 11:03:12 +0800
Message-Id: <20211129030340.429689-53-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   | 24 ++++++------
 target/riscv/insn32.decode              | 12 +++---
 target/riscv/insn_trans/trans_rvv.c.inc | 12 +++---
 target/riscv/vector_helper.c            | 52 ++++++++++++-------------
 4 files changed, 50 insertions(+), 50 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 012d0343771..3ea21b4a578 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -725,18 +725,18 @@ DEF_HELPER_6(vssra_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vssra_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vssra_vx_d, void, ptr, ptr, tl, ptr, env, i32)
 
-DEF_HELPER_6(vnclip_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vnclip_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vnclip_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vnclipu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vnclipu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vnclipu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vnclipu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vnclipu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vnclipu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vnclip_vx_b, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vnclip_vx_h, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vnclip_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnclip_wv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnclip_wv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnclip_wv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnclipu_wv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnclipu_wv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnclipu_wv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnclipu_wx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnclipu_wx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnclipu_wx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnclip_wx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnclip_wx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnclip_wx_w, void, ptr, ptr, tl, ptr, env, i32)
 
 DEF_HELPER_6(vfadd_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vfadd_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index c5cc14c45c4..eeab6b00a1b 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -516,12 +516,12 @@ vssrl_vi        101010 . ..... ..... 011 ..... 1010111 @r_vm
 vssra_vv        101011 . ..... ..... 000 ..... 1010111 @r_vm
 vssra_vx        101011 . ..... ..... 100 ..... 1010111 @r_vm
 vssra_vi        101011 . ..... ..... 011 ..... 1010111 @r_vm
-vnclipu_vv      101110 . ..... ..... 000 ..... 1010111 @r_vm
-vnclipu_vx      101110 . ..... ..... 100 ..... 1010111 @r_vm
-vnclipu_vi      101110 . ..... ..... 011 ..... 1010111 @r_vm
-vnclip_vv       101111 . ..... ..... 000 ..... 1010111 @r_vm
-vnclip_vx       101111 . ..... ..... 100 ..... 1010111 @r_vm
-vnclip_vi       101111 . ..... ..... 011 ..... 1010111 @r_vm
+vnclipu_wv      101110 . ..... ..... 000 ..... 1010111 @r_vm
+vnclipu_wx      101110 . ..... ..... 100 ..... 1010111 @r_vm
+vnclipu_wi      101110 . ..... ..... 011 ..... 1010111 @r_vm
+vnclip_wv       101111 . ..... ..... 000 ..... 1010111 @r_vm
+vnclip_wx       101111 . ..... ..... 100 ..... 1010111 @r_vm
+vnclip_wi       101111 . ..... ..... 011 ..... 1010111 @r_vm
 vfadd_vv        000000 . ..... ..... 001 ..... 1010111 @r_vm
 vfadd_vf        000000 . ..... ..... 101 ..... 1010111 @r_vm
 vfsub_vv        000010 . ..... ..... 001 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 597a367444a..f5588d9832c 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2034,12 +2034,12 @@ GEN_OPIVI_TRANS(vssrl_vi, IMM_ZX, vssrl_vx, opivx_check)
 GEN_OPIVI_TRANS(vssra_vi, IMM_SX, vssra_vx, opivx_check)
 
 /* Vector Narrowing Fixed-Point Clip Instructions */
-GEN_OPIWV_NARROW_TRANS(vnclipu_vv)
-GEN_OPIWV_NARROW_TRANS(vnclip_vv)
-GEN_OPIWX_NARROW_TRANS(vnclipu_vx)
-GEN_OPIWX_NARROW_TRANS(vnclip_vx)
-GEN_OPIWI_NARROW_TRANS(vnclipu_vi, IMM_ZX, vnclipu_vx)
-GEN_OPIWI_NARROW_TRANS(vnclip_vi, IMM_ZX, vnclip_vx)
+GEN_OPIWV_NARROW_TRANS(vnclipu_wv)
+GEN_OPIWV_NARROW_TRANS(vnclip_wv)
+GEN_OPIWX_NARROW_TRANS(vnclipu_wx)
+GEN_OPIWX_NARROW_TRANS(vnclip_wx)
+GEN_OPIWI_NARROW_TRANS(vnclipu_wi, IMM_ZX, vnclipu_wx)
+GEN_OPIWI_NARROW_TRANS(vnclip_wi, IMM_ZX, vnclip_wx)
 
 /*
  *** Vector Float Point Arithmetic Instructions
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 7fa5189af4e..c95c8bd9db3 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -2875,19 +2875,19 @@ vnclip32(CPURISCVState *env, int vxrm, int64_t a, int32_t b)
     }
 }
 
-RVVCALL(OPIVV2_RM, vnclip_vv_b, NOP_SSS_B, H1, H2, H1, vnclip8)
-RVVCALL(OPIVV2_RM, vnclip_vv_h, NOP_SSS_H, H2, H4, H2, vnclip16)
-RVVCALL(OPIVV2_RM, vnclip_vv_w, NOP_SSS_W, H4, H8, H4, vnclip32)
-GEN_VEXT_VV_RM(vnclip_vv_b, 1, 1)
-GEN_VEXT_VV_RM(vnclip_vv_h, 2, 2)
-GEN_VEXT_VV_RM(vnclip_vv_w, 4, 4)
-
-RVVCALL(OPIVX2_RM, vnclip_vx_b, NOP_SSS_B, H1, H2, vnclip8)
-RVVCALL(OPIVX2_RM, vnclip_vx_h, NOP_SSS_H, H2, H4, vnclip16)
-RVVCALL(OPIVX2_RM, vnclip_vx_w, NOP_SSS_W, H4, H8, vnclip32)
-GEN_VEXT_VX_RM(vnclip_vx_b, 1, 1)
-GEN_VEXT_VX_RM(vnclip_vx_h, 2, 2)
-GEN_VEXT_VX_RM(vnclip_vx_w, 4, 4)
+RVVCALL(OPIVV2_RM, vnclip_wv_b, NOP_SSS_B, H1, H2, H1, vnclip8)
+RVVCALL(OPIVV2_RM, vnclip_wv_h, NOP_SSS_H, H2, H4, H2, vnclip16)
+RVVCALL(OPIVV2_RM, vnclip_wv_w, NOP_SSS_W, H4, H8, H4, vnclip32)
+GEN_VEXT_VV_RM(vnclip_wv_b, 1, 1)
+GEN_VEXT_VV_RM(vnclip_wv_h, 2, 2)
+GEN_VEXT_VV_RM(vnclip_wv_w, 4, 4)
+
+RVVCALL(OPIVX2_RM, vnclip_wx_b, NOP_SSS_B, H1, H2, vnclip8)
+RVVCALL(OPIVX2_RM, vnclip_wx_h, NOP_SSS_H, H2, H4, vnclip16)
+RVVCALL(OPIVX2_RM, vnclip_wx_w, NOP_SSS_W, H4, H8, vnclip32)
+GEN_VEXT_VX_RM(vnclip_wx_b, 1, 1)
+GEN_VEXT_VX_RM(vnclip_wx_h, 2, 2)
+GEN_VEXT_VX_RM(vnclip_wx_w, 4, 4)
 
 static inline uint8_t
 vnclipu8(CPURISCVState *env, int vxrm, uint16_t a, uint8_t b)
@@ -2925,7 +2925,7 @@ static inline uint32_t
 vnclipu32(CPURISCVState *env, int vxrm, uint64_t a, uint32_t b)
 {
     uint8_t round, shift = b & 0x3f;
-    int64_t res;
+    uint64_t res;
 
     round = get_round(vxrm, a, shift);
     res   = (a >> shift)  + round;
@@ -2937,19 +2937,19 @@ vnclipu32(CPURISCVState *env, int vxrm, uint64_t a, uint32_t b)
     }
 }
 
-RVVCALL(OPIVV2_RM, vnclipu_vv_b, NOP_UUU_B, H1, H2, H1, vnclipu8)
-RVVCALL(OPIVV2_RM, vnclipu_vv_h, NOP_UUU_H, H2, H4, H2, vnclipu16)
-RVVCALL(OPIVV2_RM, vnclipu_vv_w, NOP_UUU_W, H4, H8, H4, vnclipu32)
-GEN_VEXT_VV_RM(vnclipu_vv_b, 1, 1)
-GEN_VEXT_VV_RM(vnclipu_vv_h, 2, 2)
-GEN_VEXT_VV_RM(vnclipu_vv_w, 4, 4)
+RVVCALL(OPIVV2_RM, vnclipu_wv_b, NOP_UUU_B, H1, H2, H1, vnclipu8)
+RVVCALL(OPIVV2_RM, vnclipu_wv_h, NOP_UUU_H, H2, H4, H2, vnclipu16)
+RVVCALL(OPIVV2_RM, vnclipu_wv_w, NOP_UUU_W, H4, H8, H4, vnclipu32)
+GEN_VEXT_VV_RM(vnclipu_wv_b, 1, 1)
+GEN_VEXT_VV_RM(vnclipu_wv_h, 2, 2)
+GEN_VEXT_VV_RM(vnclipu_wv_w, 4, 4)
 
-RVVCALL(OPIVX2_RM, vnclipu_vx_b, NOP_UUU_B, H1, H2, vnclipu8)
-RVVCALL(OPIVX2_RM, vnclipu_vx_h, NOP_UUU_H, H2, H4, vnclipu16)
-RVVCALL(OPIVX2_RM, vnclipu_vx_w, NOP_UUU_W, H4, H8, vnclipu32)
-GEN_VEXT_VX_RM(vnclipu_vx_b, 1, 1)
-GEN_VEXT_VX_RM(vnclipu_vx_h, 2, 2)
-GEN_VEXT_VX_RM(vnclipu_vx_w, 4, 4)
+RVVCALL(OPIVX2_RM, vnclipu_wx_b, NOP_UUU_B, H1, H2, vnclipu8)
+RVVCALL(OPIVX2_RM, vnclipu_wx_h, NOP_UUU_H, H2, H4, vnclipu16)
+RVVCALL(OPIVX2_RM, vnclipu_wx_w, NOP_UUU_W, H4, H8, vnclipu32)
+GEN_VEXT_VX_RM(vnclipu_wx_b, 1, 1)
+GEN_VEXT_VX_RM(vnclipu_wx_h, 2, 2)
+GEN_VEXT_VX_RM(vnclipu_wx_w, 4, 4)
 
 /*
  *** Vector Float Point Arithmetic Instructions
-- 
2.25.1


