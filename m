Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3F142ED56
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:14:31 +0200 (CEST)
Received: from localhost ([::1]:59936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJIM-0006S2-Gr
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHzr-0005Pq-PF
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:51:19 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:34362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHzo-0005hv-Ux
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:51:19 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 133so7888393pgb.1
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zIj430FIbZ9EdxzXNCCDp2iO8R3sg5cdcprIACul/Yw=;
 b=Lf1419+oahomCOE3TzdfpuOj3Tqoqg1QLvZne8rn2OxcDiMqQg+NyfyuNh2k1t0Xux
 GubQV3EYSLyIHAAreRcvKWXnzNz4ABbXlozyRrBoEIK+/fdCXPPdM4bfu5Q5bVnRwsYN
 AX/kKAO9toKOlvxBAUWhHWhBxHwslCOmF2dloas2KXA1gCYazoQC80IVt2T3TzrzLTme
 plj6N2NHVyRrmIstiwWCAvUVgSEfw79VLAp2uZx4Wj1cU/XxCdgHiKEPOUM/IwGPUGns
 l8gZ+FY19MMcU8Xq1B5c+hcNzoOI/UyMMOktrd0tG+ix9SWk7IoGiRmNg4rkmKnjn0Q4
 ih5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zIj430FIbZ9EdxzXNCCDp2iO8R3sg5cdcprIACul/Yw=;
 b=NKrhdXRoq8QlqQfEQxRZEd2QgxPBuA4Sux8+8J8VMAYyCmgPeczsmK5QDm4JHbTsOl
 4lYwZDETqvuWvl4swO2yBjH+1rQaqUy53oN7CZa1+SR9G9Z6dsweoGg4CQp2JcWmEowp
 fo5AfNMsh5ad8rZfl8/LpjtPdpprR+jqtVQ6Us8BHdNKuE1hstMm5nwNDOJEdRcT2CUE
 JdGj/xSDWZB9slulved3dn9jLNgZ2JeCbo1JMj2HSSoR61IGVE6fQgguuGkf5FBJpF1w
 YmY5OBYvM6iltFHCF2hac36P4LRAhKRLcTjBpa3BsNyikC0gKv2ulYWFCCCVZAuThtLB
 SwMA==
X-Gm-Message-State: AOAM530aQmzbRPy6qt019iJd1FFmGxJgoGqumejdnYmUMJm12/VvZ+v/
 +R+RCmhJmLsoQXbgFnvF/WnwOTHpfJpcGbK3
X-Google-Smtp-Source: ABdhPJyrQkdxqaeeJFYJALExUPNreO7i7q9RHe9mUsi7PZiRxcFz7HFDqYOShcR9of+ktQXdsjgtxg==
X-Received: by 2002:a63:b94b:: with SMTP id v11mr8109205pgo.145.1634284274871; 
 Fri, 15 Oct 2021 00:51:14 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:51:14 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 74/78] target/riscv: rvv-1.0: add vsetivli instruction
Date: Fri, 15 Oct 2021 15:46:22 +0800
Message-Id: <20211015074627.3957162-82-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
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
index d463e494b71..9dedcdf4779 100644
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
+    lookup_and_goto_ptr(s);
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


