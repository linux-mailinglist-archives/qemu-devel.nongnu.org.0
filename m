Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EA568DBCF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:40:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPP8u-00079p-2h; Tue, 07 Feb 2023 09:40:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pPP8X-00078q-U7
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:39:57 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pPP8U-00019G-Vi
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:39:57 -0500
Received: by mail-ed1-x529.google.com with SMTP id v13so15742882eda.11
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 06:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UkmvbdPkKt/O4ynys7TZq14J34L8o3WuO0qYr/GsZaA=;
 b=g8TDq4RZwzTZ+VLjMgzHoUFGDWlxtAB3N9VrhnURpiTGt95xpoJYYdI5qdyGn2Sc8M
 7RKahHusiclibZ0uyNCC7f+vhNhU0Dkem1uN9sYUIXlGLc5g/nkItELXnWh34Xt+FUtb
 jlJc/NZDeAvE5iNnuhjcCXnE66dDnroacoT1ufqEGVh26TjG/56XvhUY5nCetJxSTynb
 5OPH7cFOR+QF6i06Qhmy3Hcx2iRC2sxgp0XMx2EXpmuH/6FrO1EUh39S8pKQc/nih39g
 Kj/RypCwNx1yVpu4bQ7GF1dAOY/2hAsOTJx62L31csmvbgTkcRTD3JaPVPAcXi7Iy5NH
 VNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UkmvbdPkKt/O4ynys7TZq14J34L8o3WuO0qYr/GsZaA=;
 b=TyUsk7DvSdwVfGtaR//yq/eb8cRPTAAKbOECSwDMQNJytY80L4vp7iywNalkZ0dL6l
 tpbslY6k+5dNBVnUNK7zqQsv6JaeJL+fA20L70knrz+R+m0kEHu6l47NxQ2/b+CIIc29
 K7jSoYs5dxGjgSkWvtTYfNqdunO7uvFq4O/RtFg3cNdi7pLlWmz51sWj9S4W6V4ChCx7
 CXxhcnPTkZbeTHKKiRlRSwdo5zB2z33HsL4dORT6+HNCjE9qCJgAAqY3N2soYA4mK7jb
 HestFzkQx+RfH2ARxy9d8JU0XKEcqXH7vfzF0Y49m/XrGDzG8VP7OHrpn+A1Nq8dzCxn
 IJ7A==
X-Gm-Message-State: AO0yUKXUkfpW2VLthmpMLk8o+82lpBUCJ+Iruluam01YVy9bWskcw4su
 CUbd1ao5bHRHAVzd4XR1Or3qADQCIEJAU8yNoa4=
X-Google-Smtp-Source: AK7set+Iq/PE8jhBYswA0avDqR7stEqBB5SpABpTZIHHNQocn4emkmNMWKfIi92WMK5rMzH0zZvisg==
X-Received: by 2002:a50:8a9b:0:b0:4aa:a504:3624 with SMTP id
 j27-20020a508a9b000000b004aaa5043624mr4071667edj.8.1675780791057; 
 Tue, 07 Feb 2023 06:39:51 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a50d595000000b004aaa09d50adsm4742249edi.94.2023.02.07.06.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 06:39:50 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Subject: [PATCH v3 1/2] target/riscv: add Zicond as an experimental extension
Date: Tue,  7 Feb 2023 15:39:43 +0100
Message-Id: <20230207143944.1883400-1-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-ed1-x529.google.com
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

This implements the Zicond (conditional integer operations) extension,
as of version 1.0-draft-20230120 as an experimental extension in QEMU
("x-zicond").

The Zicond extension acts as a building block for branchless sequences
including conditional-{arithmetic,logic,select,move}.  Refer to the
specification for usage scenarios and application guidance.

The following instructions constitute Zicond:
  - czero.eqz rd, rs1, rs2  =>  rd = (rs2 == 0) ? 0 : rs1
  - czero.nez rd, rs1, rs2  =>  rd = (rs2 != 0) ? 0 : rs1

See
  https://github.com/riscv/riscv-zicond/releases/download/v1.0-draft-20230120/riscv-zicond_1.0-draft-20230120.pdf
for the (current version of the) Zicond specification and usage details.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
---

Changes in v3:
- don't add this to MAINTAINERS, as it is an official extension

Changes in v2:
- gates availability of the instructions through a REQUIRE_ZICOND
  macro (these were previously always enabled)

 target/riscv/cpu.c                           |  4 ++
 target/riscv/cpu.h                           |  1 +
 target/riscv/insn32.decode                   |  4 ++
 target/riscv/insn_trans/trans_rvzicond.c.inc | 54 ++++++++++++++++++++
 target/riscv/translate.c                     |  1 +
 5 files changed, 64 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzicond.c.inc

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 14a7027095..98177d8328 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -73,6 +73,7 @@ struct isa_ext_data {
 static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(h, false, PRIV_VERSION_1_12_0, ext_h),
     ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_12_0, ext_v),
+    ISA_EXT_DATA_ENTRY(zicond, true, PRIV_VERSION_1_12_0, ext_zicond),
     ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ext_icsr),
     ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei),
     ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zihintpause),
@@ -1097,6 +1098,9 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
     DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
 
+    /* Zicond 1.0-draft-20230120 */
+    DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
+
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bcf0826753..aaf3acb753 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -446,6 +446,7 @@ struct RISCVCPUConfig {
     bool ext_zkt;
     bool ext_ifencei;
     bool ext_icsr;
+    bool ext_zicond;
     bool ext_zihintpause;
     bool ext_smstateen;
     bool ext_sstc;
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index b7e7613ea2..ca812c2f7a 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -890,3 +890,7 @@ sm3p1       00 01000 01001 ..... 001 ..... 0010011 @r2
 # *** RV32 Zksed Standard Extension ***
 sm4ed       .. 11000 ..... ..... 000 ..... 0110011 @k_aes
 sm4ks       .. 11010 ..... ..... 000 ..... 0110011 @k_aes
+
+# *** Zicond Standard Extension ***
+czero_eqz   0000111 ..... ..... 101 ..... 0110011 @r
+czero_nez   0000111 ..... ..... 111 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvzicond.c.inc b/target/riscv/insn_trans/trans_rvzicond.c.inc
new file mode 100644
index 0000000000..20e9694a2c
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvzicond.c.inc
@@ -0,0 +1,54 @@
+/*
+ * RISC-V translation routines for the XVentanaCondOps extension.
+ *
+ * Copyright (c) 2022 VRULL GmbH.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#define REQUIRE_ZICOND(ctx) do {                 \
+    if (!ctx->cfg_ptr->ext_zicond) {             \
+        return false;                            \
+    }                                            \
+} while (0)
+
+/* Emits "$rd = ($rs2 <cond> $zero) ? $zero : $rs1" */
+static inline void gen_czero(TCGv dest, TCGv src1, TCGv src2, TCGCond cond)
+{
+    TCGv zero = tcg_constant_tl(0);
+    tcg_gen_movcond_tl(cond, dest, src2, zero, zero, src1);
+}
+
+static inline void gen_czero_eqz(TCGv dest, TCGv src1, TCGv src2)
+{
+    gen_czero(dest, src1, src2, TCG_COND_EQ);
+}
+
+static inline void gen_czero_nez(TCGv dest, TCGv src1, TCGv src2)
+{
+    gen_czero(dest, src1, src2, TCG_COND_NE);
+}
+
+static bool trans_czero_eqz(DisasContext *ctx, arg_r *a)
+{
+    REQUIRE_ZICOND(ctx);
+
+    return gen_logic(ctx, a, gen_czero_eqz);
+}
+
+static bool trans_czero_nez(DisasContext *ctx, arg_r *a)
+{
+    REQUIRE_ZICOND(ctx);
+
+    return gen_logic(ctx, a, gen_czero_nez);
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 01cc30a365..93850938ae 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1076,6 +1076,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvv.c.inc"
 #include "insn_trans/trans_rvb.c.inc"
 #include "insn_trans/trans_rvzawrs.c.inc"
+#include "insn_trans/trans_rvzicond.c.inc"
 #include "insn_trans/trans_rvzfh.c.inc"
 #include "insn_trans/trans_rvk.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
-- 
2.34.1


