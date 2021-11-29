Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6748B460DD9
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 04:51:07 +0100 (CET)
Received: from localhost ([::1]:36566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrXh4-0001Lp-GE
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 22:51:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX3Y-0006Ka-0t
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:10:16 -0500
Received: from [2607:f8b0:4864:20::1036] (port=52112
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX3V-0000z4-Jj
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:10:15 -0500
Received: by mail-pj1-x1036.google.com with SMTP id gt5so11513284pjb.1
 for <qemu-devel@nongnu.org>; Sun, 28 Nov 2021 19:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sYipsOeTG6EdNPKqvKVV8vo/aYWv/COS3+lr8OPQNRM=;
 b=DX6xGjDsOZIXQdScgmKiFGINcu0cPhXWXw8p/LtzUQcpXSn4f0Hj7DeFigEqLxMFGk
 62SIKC+EzTLejYa4JJly6raGaMQRyN9OxOO/TTOLHhAlTTsXwryhS4U5wRJa07VT1pFu
 w/MtaJ8llLfgUnm5JHogHgWTuRHggCwBR9200viuEGnBAEw/Fm1V+J8BWbpNMNBaGRlU
 B/UF38D463p+JZ8nNszO4bDWPWB7cGkRXQhHgeMENyE2kpOrsy1Kyk0oom1+CTe94UgM
 wZmGr+3nA7ySbgVLVoRXsW3q8iBuS8o3Ux6UBr5HXdSZo1g9yUiGRxaeNT7zHP3JJp/h
 rZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sYipsOeTG6EdNPKqvKVV8vo/aYWv/COS3+lr8OPQNRM=;
 b=MUJ30T0289Zhueq5zn1CwMnTEWgsRWTVZPcudRoC+MpsXBC0Uk68VJxR0ci/9i+0p+
 vbIrRgewmD+NkFcVRcDdjTwQ6nbJXEaRGt3jNzCW7nPEVgA+iN8exn6Q6toeVHAGLHnj
 cbCkIxxIu3gv1tEniYz8oVHq/UhPGE4drhRLZlg370vZM6eJnNInY8VXaiXWR3yeVME6
 x4Gmh5UJh4j8ovYTCaTBvLG6Yd2+IlgO3fM1RJRwygIbHAm+O8L9R49Dgdem7mvwcpI2
 /jzPe5R2Sq7CprxPxYIR1L9TqUTq8yRaLHQ624dIAIudIT55mZRGrgwoffIG4n1MRntm
 XafA==
X-Gm-Message-State: AOAM5338u7DloIiHqUBreV9wWFzn804ihc+QG6RIJWqZqjROm1xP+3VC
 NgnQiqsFWrGF38Ob2kGyP5NUkSrTAUr/6gET
X-Google-Smtp-Source: ABdhPJzM48CalLlaYa1OQRe3WE1SrhDvznWvRlFe+FRbvwpMfl0UiRSAlgQwDBSQuiEOwwxg5TVDOw==
X-Received: by 2002:a17:90b:3e8b:: with SMTP id
 rj11mr35228893pjb.63.1638155412196; 
 Sun, 28 Nov 2021 19:10:12 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:10:11 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v10 72/77] target/riscv: rvv-1.0: add vsetivli instruction
Date: Mon, 29 Nov 2021 11:03:32 +0800
Message-Id: <20211129030340.429689-73-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1036.google.com
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  2 ++
 target/riscv/insn_trans/trans_rvv.c.inc | 27 +++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index d7c6bc9af26..3b6524bad91 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -79,6 +79,7 @@
 @r_vm_1  ...... . ..... ..... ... ..... .......    &rmrr vm=1 %rs2 %rs1 %rd
 @r_vm_0  ...... . ..... ..... ... ..... .......    &rmrr vm=0 %rs2 %rs1 %rd
 @r2_zimm11 . zimm:11  ..... ... ..... ....... %rs1 %rd
+@r2_zimm10 .. zimm:10  ..... ... ..... ....... %rs1 %rd
 @r2_s    .......   ..... ..... ... ..... ....... %rs2 %rs1
 
 @hfence_gvma ....... ..... .....   ... ..... ....... %rs2 %rs1
@@ -672,6 +673,7 @@ vsext_vf4       010010 . ..... 00101 010 ..... 1010111 @r2_vm
 vsext_vf8       010010 . ..... 00011 010 ..... 1010111 @r2_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm11
+vsetivli        11 .......... ..... 111 ..... 1010111  @r2_zimm10
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
 
 # *** RV32 Zba Standard Extension ***
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index ff8f6df8f7b..e540b5d33c2 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -160,6 +160,26 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
     return true;
 }
 
+static bool do_vsetivli(DisasContext *s, int rd, TCGv s1, TCGv s2)
+{
+    TCGv dst;
+
+    if (!require_rvv(s) || !has_ext(s, RVV)) {
+        return false;
+    }
+
+    dst = dest_gpr(s, rd);
+
+    gen_helper_vsetvl(dst, cpu_env, s1, s2);
+    gen_set_gpr(s, rd, dst);
+    mark_vs_dirty(s);
+    tcg_gen_movi_tl(cpu_pc, s->pc_succ_insn);
+    tcg_gen_lookup_and_goto_ptr();
+    s->base.is_jmp = DISAS_NORETURN;
+
+    return true;
+}
+
 static bool trans_vsetvl(DisasContext *s, arg_vsetvl *a)
 {
     TCGv s2 = get_gpr(s, a->rs2, EXT_ZERO);
@@ -172,6 +192,13 @@ static bool trans_vsetvli(DisasContext *s, arg_vsetvli *a)
     return do_vsetvl(s, a->rd, a->rs1, s2);
 }
 
+static bool trans_vsetivli(DisasContext *s, arg_vsetivli *a)
+{
+    TCGv s1 = tcg_const_tl(a->rs1);
+    TCGv s2 = tcg_const_tl(a->zimm);
+    return do_vsetivli(s, a->rd, s1, s2);
+}
+
 /* vector register offset from env */
 static uint32_t vreg_ofs(DisasContext *s, int reg)
 {
-- 
2.25.1


