Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D54DB670FA7
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 02:12:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHwzH-00020W-8K; Tue, 17 Jan 2023 20:11:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHwzF-0001zS-Dw
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 20:11:33 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHwzD-0002EI-Pm
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 20:11:33 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 a14-20020a17090a70ce00b00229a2f73c56so708566pjm.3
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 17:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vX/i9PddUxPpu4wKsNIpRjvexpTXXwf910s7846V1ss=;
 b=s3UPhLDxxfSmawKS23EyN6J7QF1stx430KGbnjPhvJn8vqi0SkDH3UPJfsQ1dTuei/
 ssP5O34Kl8C+2ReW7a+DEai5ra5MFlOadnfm1edNwvRb0p6TEDblc9b9YhlFa+DgI6lH
 uEenrbqAsowGcXJhaMgprMdCEUssJ3lUJWMdCoU2BayBa7nh1QTAsgUxznpjGJtzZcUG
 50ssdK0xiOyDwzPU74XlSRMSC2bFPFS7R+fWbgm2ZUz/416ozrH2+5MMIC/DZiCOnsdT
 nQdkc+HVg/gzp9Dk07Tge9/BtLI+AZdTZE40KlpuFN8F7ECeswSVoPwEOGu/RiwHB/NY
 M6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vX/i9PddUxPpu4wKsNIpRjvexpTXXwf910s7846V1ss=;
 b=LCs8on5aEIy6vxu9dNanojTyB3qXfbBhJGU6Bk8hysczVuClLdX4p+4xz/NtDsX5v2
 NmR5KT0oNFppkPS33FUuAF43fWRLfOWKlcqHsz4jYVsb1jkhE4XbGdwTH12/0lyT+D3B
 YLPBZUK/4qaSGOS9zkF0YhNIKK8m/Cs0IrPJCKgUFVr64iExlt/rz3E4nErhpkZ6sK4q
 ZTMcss75rji3Yq2S0p9jjS+DS9oM6bquKLT2oAOEDb0OCxl39xHPdlY8Jc4q1J1w9Wyb
 B34LEVBW7CvhNZC8gHCAPXfk3CfciZtoa5sstc8097KKulbRZIN1IIbZGtWECSx+pvP3
 BbjQ==
X-Gm-Message-State: AFqh2kpx5csVDt/j3WOiPgY0Ij+RZjJJgkniKRcVMDTBbHM5DqOjOMKp
 3O1GolvCvZrAQVsuVZ2pHN+dBYp8eHD2XOTj
X-Google-Smtp-Source: AMrXdXvJtMUAMKk/0sjdPoJ9yhhVGanWQeyasG3h4pc3b/y/H4PBTPJp/fL7y5X0eBSJkvJqO9Sr5g==
X-Received: by 2002:a17:902:bf03:b0:194:9847:9cd4 with SMTP id
 bi3-20020a170902bf0300b0019498479cd4mr5092959plb.60.1674004290009; 
 Tue, 17 Jan 2023 17:11:30 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a170902988700b0017ec1b1bf9fsm21660259plp.217.2023.01.17.17.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 17:11:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name
Subject: [PATCH v2 02/10] target/loongarch: Disassemble jirl properly
Date: Tue, 17 Jan 2023 15:11:15 -1000
Message-Id: <20230118011123.392823-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118011123.392823-1-richard.henderson@linaro.org>
References: <20230118011123.392823-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

While jirl shares the same instruction format as bne etc,
it is not assembled the same.  In particular, rd is printed
first not second and the immediate is not pc-relative.

Decode into the arg_rr_i structure, which prints correctly.
This changes the "offs" member to "imm", to update translate.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/disas.c                       | 2 +-
 target/loongarch/insn_trans/trans_branch.c.inc | 2 +-
 target/loongarch/insns.decode                  | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 858dfcc53a..7cffd853ec 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -628,7 +628,7 @@ INSN(beqz,         r_offs)
 INSN(bnez,         r_offs)
 INSN(bceqz,        c_offs)
 INSN(bcnez,        c_offs)
-INSN(jirl,         rr_offs)
+INSN(jirl,         rr_i)
 INSN(b,            offs)
 INSN(bl,           offs)
 INSN(beq,          rr_offs)
diff --git a/target/loongarch/insn_trans/trans_branch.c.inc b/target/loongarch/insn_trans/trans_branch.c.inc
index 65dbdff41e..a860f7e733 100644
--- a/target/loongarch/insn_trans/trans_branch.c.inc
+++ b/target/loongarch/insn_trans/trans_branch.c.inc
@@ -23,7 +23,7 @@ static bool trans_jirl(DisasContext *ctx, arg_jirl *a)
     TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
     TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
 
-    tcg_gen_addi_tl(cpu_pc, src1, a->offs);
+    tcg_gen_addi_tl(cpu_pc, src1, a->imm);
     tcg_gen_movi_tl(dest, ctx->base.pc_next + 4);
     gen_set_gpr(a->rd, dest, EXT_NONE);
     tcg_gen_lookup_and_goto_ptr();
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 3fdc6e148c..de7b8f0f3c 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -67,6 +67,7 @@
 @rr_ui12                 .... ...... imm:12 rj:5 rd:5    &rr_i
 @rr_i14s2         .... ....  .............. rj:5 rd:5    &rr_i imm=%i14s2
 @rr_i16                     .... .. imm:s16 rj:5 rd:5    &rr_i
+@rr_i16s2         .... ..  ................ rj:5 rd:5    &rr_i imm=%offs16
 @hint_r_i12           .... ...... imm:s12 rj:5 hint:5    &hint_r_i
 @rrr_sa2p1        .... ........ ... .. rk:5 rj:5 rd:5    &rrr_sa  sa=%sa2p1
 @rrr_sa2        .... ........ ... sa:2 rk:5 rj:5 rd:5    &rrr_sa
@@ -444,7 +445,7 @@ beqz            0100 00 ................ ..... .....     @r_offs21
 bnez            0100 01 ................ ..... .....     @r_offs21
 bceqz           0100 10 ................ 00 ... .....    @c_offs21
 bcnez           0100 10 ................ 01 ... .....    @c_offs21
-jirl            0100 11 ................ ..... .....     @rr_offs16
+jirl            0100 11 ................ ..... .....     @rr_i16s2
 b               0101 00 ..........................       @offs26
 bl              0101 01 ..........................       @offs26
 beq             0101 10 ................ ..... .....     @rr_offs16
-- 
2.34.1


