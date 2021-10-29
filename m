Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E2643FA27
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 11:44:14 +0200 (CEST)
Received: from localhost ([::1]:37502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgOQm-0001rd-VR
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 05:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNlp-0006Fa-92
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:01:58 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:56076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNlm-00065X-DC
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:01:53 -0400
Received: by mail-pj1-x102f.google.com with SMTP id om14so6747195pjb.5
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 02:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N0zPqYfFtGW0a+BkcfSm8itmF1ojGb58P29lcL1LPsA=;
 b=lOxTMWcdsKV5YlVJ0A1G3SeaOCvoFZqfm8oeYuZJy4scNj2cpqWX2Z98HsDB31rDbv
 SIgyo2yTwQKXc8M21Bd8W/eVKoar8E+saSEPqTxF/lsoxRaawP25EmSiqQ5HvTyYXTwJ
 qHTVo/pnOhYqM194VwJD6hnVeO2GiX6aq0xtnWNsvbYTqpt4wXCf+xgWufeP9bELO7Mo
 g+KqhMzVQ6CTo+wy/9dnnNwI2wmXTsvwHbBz6QAiGWvRe9DcRwjGHRVS/N4kF7PNxt/9
 GyfH07a4yrXX+9k47UI8WeMalLBNU22h9n2qGSrOuAFs0lZVW+456eSXF8Ylg4xaw6Mo
 5wcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N0zPqYfFtGW0a+BkcfSm8itmF1ojGb58P29lcL1LPsA=;
 b=r7UBW6KbzwrCz8aYS92TK1XsID4O6iW/XgdLsfKZSz/0ctxEmzWg4EcPI0p7cbF6Nh
 zht2Mltr8qjIoovwYl+US196WnbWPXjqQpDb3X6eV/tAC05BPHOruW5VVBvlwgw69ctf
 oZHS9hVTOgwZXKHxKlJeHUntJXAyPlIktpDXwQIW/OVOn8F3luhHRsmJq+a7Wi95BL7E
 SZjAVqRllnWojsftsOOszfmTFOe4/RzAABsgl1eDPQkNBAG+dTE7sx3QewhGx/AJGVRJ
 bigu+lujPmzfBKN+9Th6QMV5j9rRnOgRcvzVogpeSz7NmGN/iNxg3oPIOmwXoGGBQ4TS
 bAWA==
X-Gm-Message-State: AOAM533xDnShYKjYClnfIpTF1iogzDjy8xwP4148khIZBdAdqNRyA3nn
 L5dv/BrcnXpnQiK2u8REzDAXBCNhWBg4MGXj
X-Google-Smtp-Source: ABdhPJwCKZBGNT1rMVJNrF8Gbce0RhitMID4NL58RSJ1OWG6AT15VxMmIAC6bSvz3FZ4p0rm0+wLgA==
X-Received: by 2002:a17:90b:1bcc:: with SMTP id
 oa12mr10022113pjb.212.1635498109053; 
 Fri, 29 Oct 2021 02:01:49 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:01:48 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v9 36/76] target/riscv: rvv-1.0: integer scalar move
 instructions
Date: Fri, 29 Oct 2021 16:58:41 +0800
Message-Id: <20211029085922.255197-37-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

* Remove "vmv.s.x: dothing if rs1 == 0" constraint.
* Add vmv.x.s instruction.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
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
index 322fc5c4aae..c250943dde8 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2978,27 +2978,54 @@ static void vec_element_storei(DisasContext *s, int vreg,
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


