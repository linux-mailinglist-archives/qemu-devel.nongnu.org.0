Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A4146FD56
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 10:05:26 +0100 (CET)
Received: from localhost ([::1]:58834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvbqH-0008Ej-Vq
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 04:05:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaor-0007J6-Sx
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:59:53 -0500
Received: from [2607:f8b0:4864:20::102c] (port=52129
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaon-00073J-Rw
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:59:53 -0500
Received: by mail-pj1-x102c.google.com with SMTP id gt5so6284891pjb.1
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 23:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x+RVTu7aN2UTFdV6Qfgs3LIddOffso7Fe6uhd22n5sQ=;
 b=W9rpxl1e01fXZNO16knOsROr0gm3UsjjjznUe7VrtUTmVgnB/AyHIAiufj1vycSdur
 hy3jGW1F1ISn4cBTx0gYMGi2hG5M0q+DhMrHBjYVWGy4HH/Ylsh+vmjbRPje3HI+AG3K
 fBFsevSLdZ4H9Nb92kMDf/82gFefMHT9iRnJKfGyhNBAALPyGhsXHp43ynzHEbNNWHJB
 OVDZqieu4iOVc9di0mKhMk938ROcJ+7N5wlP/lP9MKn+IA0qTWm3HEa0Ibdl7NW0+cJ0
 ber4EsXgUx7DKA1v/OyKZQEpMt7bhcICh0N9C7tRnnWRU06SCk9mAPT3eC80EXElensQ
 2HdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x+RVTu7aN2UTFdV6Qfgs3LIddOffso7Fe6uhd22n5sQ=;
 b=uOZKZzI4PTCck48oh2SpgLDth2qJoj9tIhewga0QH410sfMdEYu50Ms3QaXXzM5Jb6
 xyql8MSfxchwjTJcIrztxDr2WTFPKKbpUHkQqmiC1emuHCo0LqLoaR3eTQVwNbVQKR/R
 8EIPLn8e0JL803JM9Ez7PQkBEPtFKIP7lUfOkQ0OUC52dc6svmHrnbR2G/QGkt5r6uWe
 rW2sBnv7IaWIRyUE7Kjhu9u/V5keNIiF6su/+Gj37rTPRHUgl8hQwVPQfyDY4f+KIEHS
 UcEFwhrnWPrR1SbQHJPYIa7qwsky66Nd8E4Q58IFUIyiJ3XLSRIQxUSIJhxB6KL9iA2e
 pUQg==
X-Gm-Message-State: AOAM530BcrycPpWeyRMjTZeM5moXBabWbesvvIIuB9VvPbcYdhpm7oOp
 1wOepn3fbkksRkRYJcrAPRjPI49LZH867lXl
X-Google-Smtp-Source: ABdhPJwxf2i6wti1zSHr1hdDbMadykJPINeog1nNj/T8m+ZaHR3X/i52u3tWjfaeRzH7jnIgsTcoPw==
X-Received: by 2002:a17:90a:d49:: with SMTP id
 9mr21977680pju.115.1639123188451; 
 Thu, 09 Dec 2021 23:59:48 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:59:48 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v11 52/77] target/riscv: rvv-1.0: narrowing fixed-point clip
 instructions
Date: Fri, 10 Dec 2021 15:56:38 +0800
Message-Id: <20211210075704.23951-53-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102c.google.com
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
index 012d034377..3ea21b4a57 100644
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
index c5cc14c45c..eeab6b00a1 100644
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
index 597a367444..f5588d9832 100644
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
index 7fa5189af4..c95c8bd9db 100644
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
2.31.1


