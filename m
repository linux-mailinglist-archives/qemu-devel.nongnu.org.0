Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A166834C2
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 19:08:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMuzE-0000Ml-Dq; Tue, 31 Jan 2023 13:04:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMuxc-0007J3-6g
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 13:02:28 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMuxY-0000qM-GP
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 13:02:23 -0500
Received: by mail-wr1-x42a.google.com with SMTP id r2so15013350wrv.7
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 10:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r+kiZARfX39h0W3E92AelcVKwIGTOeFWHuugTuB05/g=;
 b=soHiw8vxQ+PHQz8JvT3nuj0Nq+t+f2JX6rcnBccNU8Eex8j4z6wVOQ2NFw1F8OTGv6
 tnBnVhwAsQ1jkEbJjdbEHix1H7fEB35sO6REsk42tnELqJuxDp3zsw6IlGBIWvRN2Zou
 q1+QaVD+gkjm+V37F7XQggKW1iquNWhzixgEwbnzYCRbjolRVEf4JZudWqlXpvxM16j2
 gGX7dZC+3WP8MdzQNPGP8PfbOHSQ+02mmtePYkyBN3IyOdK7ePldRHCr1XerbzjgI+SM
 Bx8bardmIXyBGZuJFUvehJvZfxFmQGWftz8uwAOQsUeBYi20NcciaDVQRmJ478kNpUWE
 6j+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r+kiZARfX39h0W3E92AelcVKwIGTOeFWHuugTuB05/g=;
 b=mZT4zLIm6pEAcL+p8Cbxae5Kxbk1FoDRQcOoJGI0mb8jQnY5UU5at552v0uWZ7n1L6
 MvuskF04z7Luq27J6ynD8RaFFLMDNsNILJ18bgvqm4y9Rojr7TErVUxPI9oygrlWG42m
 O6twUVduQ9Jbs3KhWFf/P5pJ2eNQdzo6M/fd3IxvhY659WDUFDTQotTqKcGNZcPDI3LE
 UQY4yyc7pILPn1PGp/YC0BK98AA+EE+Bt+OIniLE92TowR+TYcedMvh4YgmsJFvOhNuA
 x6/VsOoLS0LrpvT+FhaKv5+wAHrbTIRqh+PrBRBkmzAUdLhGbyQH6MXmZ2rmeopeEQK2
 0SGg==
X-Gm-Message-State: AO0yUKWXXYJcb1jdC/q68BhkYWUpJp2ck3TKILNuVD9/LR5vfdIDNIz8
 H37GYyBT3e1mTU2bkB7GsNFLow==
X-Google-Smtp-Source: AK7set86v89w0P+IKKkvpldCG7dPSbD5n4a9X7709UioU99KCvpavsiOF8gnr0DRYRdAD3Tp0WADZA==
X-Received: by 2002:adf:eb50:0:b0:2bf:eec5:390e with SMTP id
 u16-20020adfeb50000000b002bfeec5390emr6537081wrn.66.1675188139045; 
 Tue, 31 Jan 2023 10:02:19 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 c17-20020adffb11000000b002bc8130cca7sm15453146wrr.23.2023.01.31.10.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 10:02:18 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH v4 09/14] RISC-V: Adding T-Head MemIdx extension
Date: Tue, 31 Jan 2023 19:01:53 +0100
Message-Id: <20230131180158.2471047-10-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131180158.2471047-1-christoph.muellner@vrull.eu>
References: <20230131180158.2471047-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch adds support for the T-Head MemIdx instructions.
The patch uses the T-Head specific decoder and translation.

Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
Changes in v2:
- Add ISA_EXT_DATA_ENTRY()
- Use single decoder for XThead extensions
- Avoid signed-bitfield-extraction by using signed immediate field imm5
- Use get_address() to calculate addresses
- Introduce helper get_th_address_indexed for rs1+(rs2<<imm2) calculation
- Introduce get_address_indexed() for register offsets (like get_address())

Changes in v4:
- Remove duplicated call to get_address()
- Proper calculation of updated address register value
- Don't handle overlapping registers in gen_load_inc()

 target/riscv/cpu.c                         |   2 +
 target/riscv/cpu.h                         |   1 +
 target/riscv/insn_trans/trans_xthead.c.inc | 387 +++++++++++++++++++++
 target/riscv/translate.c                   |  21 +-
 target/riscv/xthead.decode                 |  54 +++
 5 files changed, 464 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b7047d139d..2d5a0881f1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -115,6 +115,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadcmo),
     ISA_EXT_DATA_ENTRY(xtheadcondmov, true, PRIV_VERSION_1_11_0, ext_xtheadcondmov),
     ISA_EXT_DATA_ENTRY(xtheadmac, true, PRIV_VERSION_1_11_0, ext_xtheadmac),
+    ISA_EXT_DATA_ENTRY(xtheadmemidx, true, PRIV_VERSION_1_11_0, ext_xtheadmemidx),
     ISA_EXT_DATA_ENTRY(xtheadmempair, true, PRIV_VERSION_1_11_0, ext_xtheadmempair),
     ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xtheadsync),
     ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
@@ -1102,6 +1103,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, false),
     DEFINE_PROP_BOOL("xtheadmac", RISCVCPU, cfg.ext_xtheadmac, false),
+    DEFINE_PROP_BOOL("xtheadmemidx", RISCVCPU, cfg.ext_xtheadmemidx, false),
     DEFINE_PROP_BOOL("xtheadmempair", RISCVCPU, cfg.ext_xtheadmempair, false),
     DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 38e80d44d5..d776fea760 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -479,6 +479,7 @@ struct RISCVCPUConfig {
     bool ext_xtheadcmo;
     bool ext_xtheadcondmov;
     bool ext_xtheadmac;
+    bool ext_xtheadmemidx;
     bool ext_xtheadmempair;
     bool ext_xtheadsync;
     bool ext_XVentanaCondOps;
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index 059c6529f3..4f56032903 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -52,6 +52,12 @@
     }                                            \
 } while (0)
 
+#define REQUIRE_XTHEADMEMIDX(ctx) do {           \
+    if (!ctx->cfg_ptr->ext_xtheadmemidx) {       \
+        return false;                            \
+    }                                            \
+} while (0)
+
 #define REQUIRE_XTHEADMEMPAIR(ctx) do {          \
     if (!ctx->cfg_ptr->ext_xtheadmempair) {      \
         return false;                            \
@@ -64,6 +70,30 @@
     }                                            \
 } while (0)
 
+/*
+ * Calculate and return the address for indexed mem operations:
+ * If !zext_offs, then the address is rs1 + (rs2 << imm2).
+ * If  zext_offs, then the address is rs1 + (zext(rs2[31:0]) << imm2).
+ */
+static TCGv get_th_address_indexed(DisasContext *ctx, int rs1, int rs2,
+                                   int imm2, bool zext_offs)
+{
+    TCGv src2 = get_gpr(ctx, rs2, EXT_NONE);
+    TCGv offs = tcg_temp_new();
+
+    if (zext_offs) {
+        tcg_gen_extract_tl(offs, src2, 0, 32);
+        tcg_gen_shli_tl(offs, offs, imm2);
+    } else {
+        tcg_gen_shli_tl(offs, src2, imm2);
+    }
+
+    TCGv addr = get_address_indexed(ctx, rs1, offs);
+
+    tcg_temp_free(offs);
+    return addr;
+}
+
 /* XTheadBa */
 
 /*
@@ -388,6 +418,363 @@ static bool trans_th_mulsw(DisasContext *ctx, arg_th_mulsw *a)
     return gen_th_mac(ctx, a, tcg_gen_sub_tl, NULL);
 }
 
+/* XTheadMemIdx */
+
+/*
+ * Load with memop from indexed address and add (imm5 << imm2) to rs1.
+ * If !preinc, then the load address is rs1.
+ * If  preinc, then the load address is rs1 + (imm5) << imm2).
+ */
+static bool gen_load_inc(DisasContext *ctx, arg_th_meminc *a, MemOp memop,
+                         bool preinc)
+{
+    if (a->rs1 == a->rd) {
+        return false;
+    }
+
+    int imm = a->imm5 << a->imm2;
+    TCGv addr = get_address(ctx, a->rs1, preinc ? imm : 0);
+    TCGv rd = dest_gpr(ctx, a->rd);
+    TCGv rs1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    tcg_gen_qemu_ld_tl(rd, addr, ctx->mem_idx, memop);
+    tcg_gen_addi_tl(rs1, rs1, imm);
+    gen_set_gpr(ctx, a->rd, rd);
+    gen_set_gpr(ctx, a->rs1, rs1);
+
+    tcg_temp_free(addr);
+    return true;
+}
+
+/*
+ * Store with memop to indexed address and add (imm5 << imm2) to rs1.
+ * If !preinc, then the store address is rs1.
+ * If  preinc, then the store address is rs1 + (imm5) << imm2).
+ */
+static bool gen_store_inc(DisasContext *ctx, arg_th_meminc *a, MemOp memop,
+                          bool preinc)
+{
+    int imm = a->imm5 << a->imm2;
+    TCGv addr = get_address(ctx, a->rs1, preinc ? imm : 0);
+    TCGv data = get_gpr(ctx, a->rd, EXT_NONE);
+    TCGv rs1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
+    tcg_gen_addi_tl(rs1, rs1, imm);
+    gen_set_gpr(ctx, a->rs1, rs1);
+
+    tcg_temp_free(addr);
+    return true;
+}
+
+static bool trans_th_ldia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_load_inc(ctx, a, MO_TESQ, false);
+}
+
+static bool trans_th_ldib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_load_inc(ctx, a, MO_TESQ, true);
+}
+
+static bool trans_th_lwia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_inc(ctx, a, MO_TESL, false);
+}
+
+static bool trans_th_lwib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_inc(ctx, a, MO_TESL, true);
+}
+
+static bool trans_th_lwuia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_load_inc(ctx, a, MO_TEUL, false);
+}
+
+static bool trans_th_lwuib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_load_inc(ctx, a, MO_TEUL, true);
+}
+
+static bool trans_th_lhia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_inc(ctx, a, MO_TESW, false);
+}
+
+static bool trans_th_lhib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_inc(ctx, a, MO_TESW, true);
+}
+
+static bool trans_th_lhuia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_inc(ctx, a, MO_TEUW, false);
+}
+
+static bool trans_th_lhuib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_inc(ctx, a, MO_TEUW, true);
+}
+
+static bool trans_th_lbia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_inc(ctx, a, MO_SB, false);
+}
+
+static bool trans_th_lbib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_inc(ctx, a, MO_SB, true);
+}
+
+static bool trans_th_lbuia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_inc(ctx, a, MO_UB, false);
+}
+
+static bool trans_th_lbuib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_inc(ctx, a, MO_UB, true);
+}
+
+static bool trans_th_sdia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_store_inc(ctx, a, MO_TESQ, false);
+}
+
+static bool trans_th_sdib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_store_inc(ctx, a, MO_TESQ, true);
+}
+
+static bool trans_th_swia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_inc(ctx, a, MO_TESL, false);
+}
+
+static bool trans_th_swib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_inc(ctx, a, MO_TESL, true);
+}
+
+static bool trans_th_shia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_inc(ctx, a, MO_TESW, false);
+}
+
+static bool trans_th_shib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_inc(ctx, a, MO_TESW, true);
+}
+
+static bool trans_th_sbia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_inc(ctx, a, MO_SB, false);
+}
+
+static bool trans_th_sbib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_inc(ctx, a, MO_SB, true);
+}
+
+/*
+ * Load with memop from indexed address.
+ * If !zext_offs, then address is rs1 + (rs2 << imm2).
+ * If  zext_offs, then address is rs1 + (zext(rs2[31:0]) << imm2).
+ */
+static bool gen_load_idx(DisasContext *ctx, arg_th_memidx *a, MemOp memop,
+                         bool zext_offs)
+{
+    TCGv rd = dest_gpr(ctx, a->rd);
+    TCGv addr = get_th_address_indexed(ctx, a->rs1, a->rs2, a->imm2, zext_offs);
+
+    tcg_gen_qemu_ld_tl(rd, addr, ctx->mem_idx, memop);
+    gen_set_gpr(ctx, a->rd, rd);
+
+    return true;
+}
+
+/*
+ * Store with memop to indexed address.
+ * If !zext_offs, then address is rs1 + (rs2 << imm2).
+ * If  zext_offs, then address is rs1 + (zext(rs2[31:0]) << imm2).
+ */
+static bool gen_store_idx(DisasContext *ctx, arg_th_memidx *a, MemOp memop,
+                          bool zext_offs)
+{
+    TCGv data = get_gpr(ctx, a->rd, EXT_NONE);
+    TCGv addr = get_th_address_indexed(ctx, a->rs1, a->rs2, a->imm2, zext_offs);
+
+    tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
+
+    return true;
+}
+
+static bool trans_th_lrd(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_load_idx(ctx, a, MO_TESQ, false);
+}
+
+static bool trans_th_lrw(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_idx(ctx, a, MO_TESL, false);
+}
+
+static bool trans_th_lrwu(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_load_idx(ctx, a, MO_TEUL, false);
+}
+
+static bool trans_th_lrh(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_idx(ctx, a, MO_TESW, false);
+}
+
+static bool trans_th_lrhu(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_idx(ctx, a, MO_TEUW, false);
+}
+
+static bool trans_th_lrb(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_idx(ctx, a, MO_SB, false);
+}
+
+static bool trans_th_lrbu(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_idx(ctx, a, MO_UB, false);
+}
+
+static bool trans_th_srd(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_store_idx(ctx, a, MO_TESQ, false);
+}
+
+static bool trans_th_srw(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_idx(ctx, a, MO_TESL, false);
+}
+
+static bool trans_th_srh(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_idx(ctx, a, MO_TESW, false);
+}
+
+static bool trans_th_srb(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_idx(ctx, a, MO_SB, false);
+}
+static bool trans_th_lurd(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_load_idx(ctx, a, MO_TESQ, true);
+}
+
+static bool trans_th_lurw(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_idx(ctx, a, MO_TESL, true);
+}
+
+static bool trans_th_lurwu(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_load_idx(ctx, a, MO_TEUL, true);
+}
+
+static bool trans_th_lurh(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_idx(ctx, a, MO_TESW, true);
+}
+
+static bool trans_th_lurhu(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_idx(ctx, a, MO_TEUW, true);
+}
+
+static bool trans_th_lurb(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_idx(ctx, a, MO_SB, true);
+}
+
+static bool trans_th_lurbu(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_idx(ctx, a, MO_UB, true);
+}
+
+static bool trans_th_surd(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_store_idx(ctx, a, MO_TESQ, true);
+}
+
+static bool trans_th_surw(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_idx(ctx, a, MO_TESL, true);
+}
+
+static bool trans_th_surh(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_idx(ctx, a, MO_TESW, true);
+}
+
+static bool trans_th_surb(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_idx(ctx, a, MO_SB, true);
+}
+
 /* XTheadMemPair */
 
 static bool gen_loadpair_tl(DisasContext *ctx, arg_th_pair *a, MemOp memop,
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f383e69db3..a979d43a6a 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -135,7 +135,8 @@ static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
     return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
            ctx->cfg_ptr->ext_xtheadbs || ctx->cfg_ptr->ext_xtheadcmo ||
            ctx->cfg_ptr->ext_xtheadcondmov || ctx->cfg_ptr->ext_xtheadmac ||
-           ctx->cfg_ptr->ext_xtheadmempair || ctx->cfg_ptr->ext_xtheadsync;
+           ctx->cfg_ptr->ext_xtheadmemidx || ctx->cfg_ptr->ext_xtheadmempair ||
+           ctx->cfg_ptr->ext_xtheadsync;
 }
 
 #define MATERIALISE_EXT_PREDICATE(ext)  \
@@ -597,6 +598,24 @@ static TCGv get_address(DisasContext *ctx, int rs1, int imm)
     return addr;
 }
 
+/* Compute a canonical address from a register plus reg offset. */
+static TCGv get_address_indexed(DisasContext *ctx, int rs1, TCGv offs)
+{
+    TCGv addr = temp_new(ctx);
+    TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
+
+    tcg_gen_add_tl(addr, src1, offs);
+    if (ctx->pm_mask_enabled) {
+        tcg_gen_andc_tl(addr, addr, pm_mask);
+    } else if (get_xl(ctx) == MXL_RV32) {
+        tcg_gen_ext32u_tl(addr, addr);
+    }
+    if (ctx->pm_base_enabled) {
+        tcg_gen_or_tl(addr, addr, pm_base);
+    }
+    return addr;
+}
+
 #ifndef CONFIG_USER_ONLY
 /* The states of mstatus_fs are:
  * 0 = disabled, 1 = initial, 2 = clean, 3 = dirty
diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
index ff2a83b56d..69e40f22dc 100644
--- a/target/riscv/xthead.decode
+++ b/target/riscv/xthead.decode
@@ -17,8 +17,10 @@
 %rd2       20:5
 %rs2       20:5
 %sh5       20:5
+%imm5      20:s5
 %sh6       20:6
 %sh2       25:2
+%imm2      25:2
 
 # Argument sets
 &r         rd rs1 rs2                               !extern
@@ -26,6 +28,8 @@
 &shift     shamt rs1 rd                             !extern
 &th_bfext  msb lsb rs1 rd
 &th_pair   rd1 rs rd2 sh2
+&th_memidx rd rs1 rs2 imm2
+&th_meminc rd rs1 imm5 imm2
 
 # Formats
 @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
@@ -36,6 +40,8 @@
 @sh5        ....... ..... .....  ... ..... .......  &shift  shamt=%sh5      %rs1 %rd
 @sh6        ...... ...... .....  ... ..... .......  &shift shamt=%sh6 %rs1 %rd
 @th_pair    ..... .. ..... ..... ... ..... .......  &th_pair %rd1 %rs %rd2 %sh2
+@th_memidx  ..... .. ..... ..... ... ..... .......  &th_memidx %rd %rs1 %rs2 %imm2
+@th_meminc  ..... .. ..... ..... ... ..... .......  &th_meminc %rd %rs1 %imm5 %imm2
 
 # XTheadBa
 # Instead of defining a new encoding, we simply use the decoder to
@@ -102,6 +108,54 @@ th_muls          00100 01 ..... ..... 001 ..... 0001011 @r
 th_mulsh         00101 01 ..... ..... 001 ..... 0001011 @r
 th_mulsw         00100 11 ..... ..... 001 ..... 0001011 @r
 
+# XTheadMemIdx
+th_ldia          01111 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_ldib          01101 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lwia          01011 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lwib          01001 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lwuia         11011 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lwuib         11001 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lhia          00111 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lhib          00101 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lhuia         10111 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lhuib         10101 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lbia          00011 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lbib          00001 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lbuia         10011 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lbuib         10001 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_sdia          01111 .. ..... ..... 101 ..... 0001011 @th_meminc
+th_sdib          01101 .. ..... ..... 101 ..... 0001011 @th_meminc
+th_swia          01011 .. ..... ..... 101 ..... 0001011 @th_meminc
+th_swib          01001 .. ..... ..... 101 ..... 0001011 @th_meminc
+th_shia          00111 .. ..... ..... 101 ..... 0001011 @th_meminc
+th_shib          00101 .. ..... ..... 101 ..... 0001011 @th_meminc
+th_sbia          00011 .. ..... ..... 101 ..... 0001011 @th_meminc
+th_sbib          00001 .. ..... ..... 101 ..... 0001011 @th_meminc
+
+th_lrd           01100 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lrw           01000 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lrwu          11000 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lrh           00100 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lrhu          10100 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lrb           00000 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lrbu          10000 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_srd           01100 .. ..... ..... 101 ..... 0001011 @th_memidx
+th_srw           01000 .. ..... ..... 101 ..... 0001011 @th_memidx
+th_srh           00100 .. ..... ..... 101 ..... 0001011 @th_memidx
+th_srb           00000 .. ..... ..... 101 ..... 0001011 @th_memidx
+
+th_lurd          01110 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lurw          01010 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lurwu         11010 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lurh          00110 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lurhu         10110 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lurb          00010 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lurbu         10010 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_surd          01110 .. ..... ..... 101 ..... 0001011 @th_memidx
+th_surw          01010 .. ..... ..... 101 ..... 0001011 @th_memidx
+th_surh          00110 .. ..... ..... 101 ..... 0001011 @th_memidx
+th_surb          00010 .. ..... ..... 101 ..... 0001011 @th_memidx
+
 # XTheadMemPair
 th_ldd           11111 .. ..... ..... 100 ..... 0001011 @th_pair
 th_lwd           11100 .. ..... ..... 100 ..... 0001011 @th_pair
-- 
2.39.1


