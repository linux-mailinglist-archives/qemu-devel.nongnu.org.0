Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B8742ECAB
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 10:43:13 +0200 (CEST)
Received: from localhost ([::1]:41544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbIo4-0006Wx-3o
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 04:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHyw-0003bb-1P
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:50:22 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:33761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHyt-0004qE-7K
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:50:21 -0400
Received: by mail-pg1-x535.google.com with SMTP id j190so1124262pgd.0
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1ADsydS6X2NXLASJIhfTXeznJf82BY4joePROPMRSgc=;
 b=Dsk0b1uy9n0y7udt7tC9BzXyjq7SkspjrI8g5Wn3mHLPkXF2WVOY3BkKnuBzlHb6dH
 8bVE6FjxciLaujdCzhrbyuFeUMy0W8RnKMujGXCXyCwQtagWAZC8QSn6vfNUU1+03xUV
 wd8WZYd6YGjpMM0FEAC4DEKnOEDiLSAeaOWiWqLGEup8CmMvd9My9kxBXrbrsdAm6Caa
 r55sTLzLJX4b7UQLKiv+ArYrrFpm5qN436aurVlUAlZ4PPW6gveoR/1aLLmH8xQd3/ue
 /bO/kItuqK7Y1Mqeh5SQnBs2pvBE1P4yAmlcvZ/WeEvTwYO2d/FqpgDXR5iuRw9SIoYQ
 nLkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1ADsydS6X2NXLASJIhfTXeznJf82BY4joePROPMRSgc=;
 b=GS2DqmiTxF7E3lRH8KkRoxZw+VF50m6VXBj+/cUzbeoNPNYug6RH1eQiChVvxC5/lS
 1bs8PEa5iU2AYe5ZehIWc8OSg2dmcMt/EIsjXx3SHl4bal8mVBIu6CL9FZdLlVQXa/VJ
 4/hSXW728qCoPi8gbDG1Wn1fz+N0nCDKco5QVSUn5evcRXBB52eDSo6yq+1zUGoIVTtf
 o/UxbgRlkohrm5WAas/z4/L66kI9o8L2iOSe/3Nhk86rQtK0T24jvm187IfrdOrMrInV
 /8IcUjzsid98AUlQhxK1u8K0p8X4kATPVZt5Fo2drpBlkqIhSOaxHaNTvP5+16RNK7gE
 dxBA==
X-Gm-Message-State: AOAM531B+zPJ/5LLym8AdC6zAAxchD2+N1wLfR8Nz38l6gtzIGlE0K7j
 50YkIKF4NtXhpFaQaxckE6bpE1AC41ZXrOe5
X-Google-Smtp-Source: ABdhPJyMTbFGbGMJCl+pSdtz7S/GCkAqj/plY08w6Z/eUhn1jf0t1HUxcRUSOABpygdEXXt00p/5BA==
X-Received: by 2002:a05:6a00:248a:b0:44c:ecc5:a165 with SMTP id
 c10-20020a056a00248a00b0044cecc5a165mr9758745pfv.43.1634284217769; 
 Fri, 15 Oct 2021 00:50:17 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:50:17 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 58/78] target/riscv: rvv-1.0: remove integer extract
 instruction
Date: Fri, 15 Oct 2021 15:46:06 +0800
Message-Id: <20211015074627.3957162-66-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x535.google.com
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

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode              |  1 -
 target/riscv/insn_trans/trans_rvv.c.inc | 23 -----------------------
 2 files changed, 24 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 82484fda751..20b3095f56c 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -632,7 +632,6 @@ viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
 vmv_x_s         010000 1 ..... 00000 010 ..... 1010111 @r2rd
 vmv_s_x         010000 1 00000 ..... 110 ..... 1010111 @r2
-vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vfmv_f_s        010000 1 ..... 00000 001 ..... 1010111 @r2rd
 vfmv_s_f        010000 1 00000 ..... 101 ..... 1010111 @r2
 vslideup_vx     001110 . ..... ..... 100 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 93f94552f5e..e113e002962 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2839,8 +2839,6 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
  *** Vector Permutation Instructions
  */
 
-/* Integer Extract Instruction */
-
 static void load_element(TCGv_i64 dest, TCGv_ptr base,
                          int ofs, int sew, bool sign)
 {
@@ -2940,27 +2938,6 @@ static void vec_element_loadi(DisasContext *s, TCGv_i64 dest,
     load_element(dest, cpu_env, endian_ofs(s, vreg, idx), s->sew, sign);
 }
 
-static bool trans_vext_x_v(DisasContext *s, arg_r *a)
-{
-    TCGv_i64 tmp = tcg_temp_new_i64();
-    TCGv dest = dest_gpr(s, a->rd);
-
-    if (a->rs1 == 0) {
-        /* Special case vmv.x.s rd, vs2. */
-        vec_element_loadi(s, tmp, a->rs2, 0, false);
-    } else {
-        /* This instruction ignores LMUL and vector register groups */
-        int vlmax = s->vlen >> (3 + s->sew);
-        vec_element_loadx(s, tmp, a->rs2, cpu_gpr[a->rs1], vlmax);
-    }
-
-    tcg_gen_trunc_i64_tl(dest, tmp);
-    gen_set_gpr(s, a->rd, dest);
-
-    tcg_temp_free_i64(tmp);
-    return true;
-}
-
 /* Integer Scalar Move Instruction */
 
 static void store_element(TCGv_i64 val, TCGv_ptr base,
-- 
2.25.1


