Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B6542EB40
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 10:14:14 +0200 (CEST)
Received: from localhost ([::1]:42968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbIM1-0000MJ-7A
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 04:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxk-0000fF-A6
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:49:08 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:35487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxh-0003nU-6Q
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:49:07 -0400
Received: by mail-pg1-x52a.google.com with SMTP id e7so7884182pgk.2
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=prqC7Dsal4EuvRXwfNIhq62uBIFBXA9WHDk6BMIeH9E=;
 b=D9A3aiuHPUsE4YtlvNO/XsGzWb2irAOGxA+cUDmbC32ZiVL8Z/HCGGFfCAT1r5AGgl
 3XBEyt77vXPFHoRxS3xK0JPZKPfyJ0yE7cS/FjpDhzEkPuHPsfaBkFft7nkPlPL5sHTq
 BfnBk0VVUD2mYjzaGQC9IQhTLguQVyP+qAoiRJXhhaMUMnkSjh8tr50+DsZARVCaqp4r
 u8ecWDiPIJRIS6UA3Myfuyt4RBbyx5x5CUhnezkB1V7qp3eSCnhnRLwG/3h+odjvcXOM
 cuw2pNWWdnA0dhydE+9VvSL8Z6ptYUtM6z3FECaqZu9nWixN2EZjA8FwFgJteGawkMOf
 vtsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=prqC7Dsal4EuvRXwfNIhq62uBIFBXA9WHDk6BMIeH9E=;
 b=EK5nuwBS+iA9C3sweBcqAh9EWAG6LB8lHJiIwOLsP81m6jW2ScPw3x4P9UQxjzfhNT
 hB1lDvsSGtkmwatCH5bcsxeDSDg1NiY51EEPkROfu2O0dRviotzVjqFkj8qRqS9cWGNC
 vHhY/YoKYSdLAg22BP+cNTAd7JoYV+WtVqqCL/Bj53k9+6woyco6ai+lwe2EvmRyKN+A
 COmeB5qEVKM9LHsV8NU8wG06FEGlaQ+Vl/F0Rcb0b60jj1SBghh9JEAmMTN32i3TNxVd
 6pqwpMAtqyhQhTfyEbYo2PqKI4cipF0Sz0JLj8bZtSfBGxneA2IeRWfMeSdGbgd5EFox
 HWCg==
X-Gm-Message-State: AOAM5303FO8r2RFJGtgAbWK8wTrZiDbrUdHB/mBbwZjFd1ELugwgEjt7
 ccQUHbg74U0GMewZK4KkUG+wM/wYiO4F6Tsa
X-Google-Smtp-Source: ABdhPJwJ/uXulj7/ahUvCIC/tSpstgUMLU/Jv9mtdnDNP/0FrTI3U9ge6L+J8LRnXlOPMs64m1dM2Q==
X-Received: by 2002:aa7:824b:0:b0:44c:22ad:2763 with SMTP id
 e11-20020aa7824b000000b0044c22ad2763mr10136278pfn.63.1634284143767; 
 Fri, 15 Oct 2021 00:49:03 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:49:03 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 36/78] target/riscv: rvv-1.0: integer scalar move
 instructions
Date: Fri, 15 Oct 2021 15:45:44 +0800
Message-Id: <20211015074627.3957162-44-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

* Remove "vmv.s.x: dothing if rs1 == 0" constraint.
* Add vmv.x.s instruction.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode              |  3 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 43 ++++++++++++++++++++-----
 2 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 4653a9679ef..e33ec82fdf8 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -634,8 +634,9 @@ vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
 viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
+vmv_x_s         010000 1 ..... 00000 010 ..... 1010111 @r2rd
+vmv_s_x         010000 1 00000 ..... 110 ..... 1010111 @r2
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
-vmv_s_x         001101 1 00000 ..... 110 ..... 1010111 @r2
 vfmv_f_s        001100 1 ..... 00000 001 ..... 1010111 @r2rd
 vfmv_s_f        001101 1 00000 ..... 101 ..... 1010111 @r2
 vslideup_vx     001110 . ..... ..... 100 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 43da36f4200..42a9f2764d5 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2977,27 +2977,54 @@ static void vec_element_storei(DisasContext *s, int vreg,
     store_element(val, cpu_env, endian_ofs(s, vreg, idx), s->sew);
 }
 
+/* vmv.x.s rd, vs2 # x[rd] = vs2[0] */
+static bool trans_vmv_x_s(DisasContext *s, arg_vmv_x_s *a)
+{
+    if (require_rvv(s) &&
+        vext_check_isa_ill(s)) {
+        TCGv_i64 t1;
+        TCGv dest;
+
+        t1 = tcg_temp_new_i64();
+        dest = tcg_temp_new();
+        /*
+         * load vreg and sign-extend to 64 bits,
+         * then truncate to XLEN bits before storing to gpr.
+         */
+        vec_element_loadi(s, t1, a->rs2, 0, true);
+        tcg_gen_trunc_i64_tl(dest, t1);
+        gen_set_gpr(s, a->rd, dest);
+        tcg_temp_free_i64(t1);
+        tcg_temp_free(dest);
+
+        return true;
+    }
+    return false;
+}
+
 /* vmv.s.x vd, rs1 # vd[0] = rs1 */
 static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
 {
-    if (vext_check_isa_ill(s)) {
+    if (require_rvv(s) &&
+        vext_check_isa_ill(s)) {
         /* This instruction ignores LMUL and vector register groups */
-        int maxsz = s->vlen >> 3;
         TCGv_i64 t1;
+        TCGv s1;
         TCGLabel *over = gen_new_label();
 
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
-        tcg_gen_gvec_dup_imm(SEW64, vreg_ofs(s, a->rd), maxsz, maxsz, 0);
-        if (a->rs1 == 0) {
-            goto done;
-        }
 
         t1 = tcg_temp_new_i64();
-        tcg_gen_extu_tl_i64(t1, cpu_gpr[a->rs1]);
+
+        /*
+         * load gpr and sign-extend to 64 bits,
+         * then truncate to SEW bits when storing to vreg.
+         */
+        s1 = get_gpr(s, a->rs1, EXT_NONE);
+        tcg_gen_ext_tl_i64(t1, s1);
         vec_element_storei(s, a->rd, 0, t1);
         tcg_temp_free_i64(t1);
         mark_vs_dirty(s);
-    done:
         gen_set_label(over);
         return true;
     }
-- 
2.25.1


