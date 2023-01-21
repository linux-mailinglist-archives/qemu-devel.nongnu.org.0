Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1085067631B
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 03:36:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJ3jW-000546-TP; Fri, 20 Jan 2023 21:35:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pJ3jU-00053f-Bn
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 21:35:52 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pJ3jR-0006Lo-Qr
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 21:35:52 -0500
Received: by mail-ed1-x52d.google.com with SMTP id s3so8773184edd.4
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 18:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+IVVr+bUbQtDOcJEbeshxXlq8RasM6fzOxwU+5sIw1Y=;
 b=sgcoTMBaWnRkW/DauLuDwKhBnSO3DOyzYaND+aVOr7wj8bBtyDaV/YJ5Of0jlwFauI
 hg2OVrAZUd/1cNJMw2kB2IGUCqrJZLrGFH+CpxlN+e6p0UMrs8rtd7ijrP7W3klMYKc3
 Xv5YGxinSkR9DWpZAhmL9ytF2TBopwywLgNDYJ8Sm5Wps4K876d1Xb7Lc3imgTsaHcVz
 lGA0qxoNaZ/pg0NxVjKob3Uqc4pTR38mOCOv3Knn70Wg7QNnecx5OEBPlauIexJhFoS7
 m3rP1+UGlNAUZqvu/0QDG+4d5weS6OBI5AA8ud0ye4MEtdjGJehH+BkO+w9CaI7Z4qpg
 /5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+IVVr+bUbQtDOcJEbeshxXlq8RasM6fzOxwU+5sIw1Y=;
 b=dmbaVcJWuF3tRLDGXkjXzvvKpp85E80gg5Bj5q/+e0zvFSHQ4u/KQNuIim7pN1RQMw
 DJa/XW5OrZlUWZ7DxAVWjBoy2m5lBtnGUuFh7Sn+CAG72VTTvbYd4gk3ovikwnWO+nk9
 wxjsgOisAZHWTvD9LAl7sOUOhcrEnT6+LkUDTYeDmMMfSUA/lGGaBWxrJLe5IEml1kVq
 YPlRbkeS55ggQc5z+af6oo4la6H/Td7ySP90HgnRuX+3lIkabixPNd75XP3dBI6BxjPo
 wg7tAnxrh8a7p/mf+aiYz+fi3wsnC+1yE//n7nvdDtXyI8EGPmJHD2utsu8hCeNTAhX0
 DCLg==
X-Gm-Message-State: AFqh2krfp0IhHlGa+QyOisaAF+KGBb3ah6ZBu91BKtOGOW7wh2Fr4uWJ
 1mj4h4yhdutjH+kRZSk8bNny+mP7Q5ntWAwYPxA=
X-Google-Smtp-Source: AMrXdXuy8PnXcqo/JzDQKTAgRxwx4neQhMFb+vNPPtuJAEQ12xiKKCu2raw64/gaGywu0MeF+0XPuA==
X-Received: by 2002:a05:6402:3898:b0:499:c343:30e5 with SMTP id
 fd24-20020a056402389800b00499c34330e5mr18519352edb.3.1674268546196; 
 Fri, 20 Jan 2023 18:35:46 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906059100b007933047f923sm18742430ejn.118.2023.01.20.18.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 18:35:45 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Subject: [PATCH v2 1/2] target/riscv: add Zicond as an experimental extension
Date: Sat, 21 Jan 2023 03:35:41 +0100
Message-Id: <20230121023542.1726168-1-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-ed1-x52d.google.com
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

Changes in v2:
- gates availability of the instructions through a REQUIRE_ZICOND
  macro (these were previously always enabled)

 MAINTAINERS                                  |  7 +++
 target/riscv/cpu.c                           |  4 ++
 target/riscv/cpu.h                           |  1 +
 target/riscv/insn32.decode                   |  4 ++
 target/riscv/insn_trans/trans_rvzicond.c.inc | 54 ++++++++++++++++++++
 target/riscv/translate.c                     |  1 +
 6 files changed, 71 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzicond.c.inc

diff --git a/MAINTAINERS b/MAINTAINERS
index 08ad1e5341..ca914c42fa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -295,6 +295,13 @@ F: include/hw/riscv/
 F: linux-user/host/riscv32/
 F: linux-user/host/riscv64/
 
+RISC-V Zicond extension
+M: Philipp Tomsich <philipp.tomsich@vrull.eu>
+M: Christoph Muellner <christoph.muellner@vrull.eu>
+L: qemu-riscv@nongnu.org
+S: Supported
+F: target/riscv/insn_trans/trans_zicond.c.inc
+
 RISC-V XVentanaCondOps extension
 M: Philipp Tomsich <philipp.tomsich@vrull.eu>
 L: qemu-riscv@nongnu.org
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cc75ca7667..f214b03e95 100644
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
@@ -1080,6 +1081,9 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
     DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
 
+    /* Zicond 1.0-draft-20230120 */
+    DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
+
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f5609b62a2..4b6ff800d3 100644
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
index df38db7553..1468748835 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1061,6 +1061,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvv.c.inc"
 #include "insn_trans/trans_rvb.c.inc"
 #include "insn_trans/trans_rvzawrs.c.inc"
+#include "insn_trans/trans_rvzicond.c.inc"
 #include "insn_trans/trans_rvzfh.c.inc"
 #include "insn_trans/trans_rvk.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
-- 
2.34.1


