Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D47B49FC8D
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 16:16:06 +0100 (CET)
Received: from localhost ([::1]:34590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDSyr-0000OB-03
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 10:16:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nDSgK-0000Gy-8N
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 09:56:56 -0500
Received: from [2a00:1450:4864:20::12a] (port=43608
 helo=mail-lf1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nDSgI-0000vX-82
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 09:56:55 -0500
Received: by mail-lf1-x12a.google.com with SMTP id u6so12265216lfm.10
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 06:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J8A0VEoGdkoTI+wEc69bUyrhuKWLvBkAfR6t03SX5ew=;
 b=a7uEcQ5ReFbPw9WZiUkKJbTLA93RhpYPoHKJZj2b2NPmxz4ohEKPhaDjOJc86uF4Yu
 j9d3Y7wphIRpFZ863D4x4trqYpgvAWl1Atqc77PwMxZoHRFG2HiiwK40fVGA6UBbTWJC
 uESjx+nkvCS+F0nO70Be3GxCJhWbWgsHzhYj6X5gGIv78EKlw2opfSnsVJrXirwSwAYG
 eLX/85U4nnUbGQX56JU5u1up0JO/zplmyR44EbOcw949o9KJADLmYBWIPoCOSnLaKbDg
 /Uum349V4fbZVGirvi/2KRymI7hZ7YZjmLT+OI5UYb86BSySyikx+buc3YiBtgTDCiA7
 Ja5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J8A0VEoGdkoTI+wEc69bUyrhuKWLvBkAfR6t03SX5ew=;
 b=L5YWX+lNYFp860VcXsRXZPnHPORTZ3nAZHZ4lMhhYrZzmD2my96lAA6j4UjkeEcTpI
 WaC/zVmJ3iLywCADk0tkL/UI4xnHhNC/EkVtBuJ3vhX55GmD0zjDvn1oSDpRKbQmtt+N
 OarIhboW3tFxatTfewXaEFcYRBGo83YeQJfrMSHq6gANcogTIQksVt9xXRgNMRhY0TG8
 rO6l7RDxioQbFBAUFbguqm0JTsDkSHSSF1hCA7sIr55ms6lnxeSWL95mmPny5Mj3i9A3
 UcXQtgN0qxxTt3U8aZMLK3/vh1GK8zHv6f0nf7exYSeNRmE9yM8ABFIv5tInQfs1fZl9
 s9Eg==
X-Gm-Message-State: AOAM532mJzrHeAcQBE4Ler029tqt5QqC4+bbelQ1Y0GgWje52/cnC+Yf
 DEv3YVuC1gFE3InpkkNHWjo9tvBymg1LQhQU
X-Google-Smtp-Source: ABdhPJxoDIlVNCE3ylKh6Cv9v+5Qt3IE57IZ9S7q9Oik7ynSiDHsX4zdk+mUnts1OR2pzjIIeCj0Rw==
X-Received: by 2002:a05:6512:68f:: with SMTP id
 t15mr6399958lfe.124.1643381812220; 
 Fri, 28 Jan 2022 06:56:52 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id b20sm1031234lfb.51.2022.01.28.06.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 06:56:51 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/7] target/riscv: Add XVentanaCondOps custom extension
Date: Fri, 28 Jan 2022 15:56:41 +0100
Message-Id: <20220128145642.1305416-7-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128145642.1305416-1-philipp.tomsich@vrull.eu>
References: <20220128145642.1305416-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Greg Favor <gfavor@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds the decoder and translation for the XVentanaCondOps custom
extension (vendor-defined by Ventana Micro Systems), which is
documented at https://github.com/ventanamicro/ventana-custom-extensions/releases/download/v1.0.0/ventana-custom-extensions-v1.0.0.pdf

This commit then also adds a guard-function (has_XVentanaCondOps_p)
and the decoder function to the table of decoders, enabling the
support for the XVentanaCondOps extension.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

---

Changes in v3:
- rename to trans_xventanacondops.c.inc (i.e. with the '.c')
- (in MATERIALISE_EXT_PREDICATE) don't annotate the predicate function
  for testing the availability of individual extensions as 'inline'
  and don't make CPURISCVState* visible to these predicate functions

Changes in v2:
- Split off decode table into XVentanaCondOps.decode
- Wire up XVentanaCondOps in the decoder-table

 target/riscv/XVentanaCondOps.decode           | 25 ++++++++++++
 target/riscv/cpu.c                            |  3 ++
 target/riscv/cpu.h                            |  3 ++
 .../insn_trans/trans_xventanacondops.c.inc    | 39 +++++++++++++++++++
 target/riscv/meson.build                      |  1 +
 target/riscv/translate.c                      | 12 ++++++
 6 files changed, 83 insertions(+)
 create mode 100644 target/riscv/XVentanaCondOps.decode
 create mode 100644 target/riscv/insn_trans/trans_xventanacondops.c.inc

diff --git a/target/riscv/XVentanaCondOps.decode b/target/riscv/XVentanaCondOps.decode
new file mode 100644
index 0000000000..5aef7c3d72
--- /dev/null
+++ b/target/riscv/XVentanaCondOps.decode
@@ -0,0 +1,25 @@
+#
+# RISC-V translation routines for the XVentanaCondOps extension
+#
+# Copyright (c) 2022 Dr. Philipp Tomsich, philipp.tomsich@vrull.eu
+#
+# SPDX-License-Identifier: LGPL-2.1-or-later
+#
+# Reference: VTx-family custom instructions
+#            Custom ISA extensions for Ventana Micro Systems RISC-V cores
+#            (https://github.com/ventanamicro/ventana-custom-extensions/releases/download/v1.0.0/ventana-custom-extensions-v1.0.0.pdf)
+
+# Fields
+%rs2  20:5
+%rs1  15:5
+%rd    7:5
+
+# Argument sets
+&r    rd rs1 rs2  !extern
+
+# Formats
+@r         .......  ..... ..... ... ..... ....... &r                %rs2 %rs1 %rd
+
+# *** RV64 Custom-3 Extension ***
+vt_maskc   0000000  ..... ..... 110 ..... 1111011 @r
+vt_maskcn  0000000  ..... ..... 111 ..... 1111011 @r
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1cb0436187..6df07b8289 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -734,6 +734,9 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
     DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
 
+    /* Vendor-specific custom extensions */
+    DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
+
     /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     /* ePMP 0.9.3 */
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9c795089b6..ccf9ea9922 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -329,6 +329,9 @@ struct RISCVCPUConfig {
     bool ext_zve32f;
     bool ext_zve64f;
 
+    /* Vendor-specific custom extensions */
+    bool ext_XVentanaCondOps;
+
     char *priv_spec;
     char *user_spec;
     char *bext_spec;
diff --git a/target/riscv/insn_trans/trans_xventanacondops.c.inc b/target/riscv/insn_trans/trans_xventanacondops.c.inc
new file mode 100644
index 0000000000..b8a5d031b5
--- /dev/null
+++ b/target/riscv/insn_trans/trans_xventanacondops.c.inc
@@ -0,0 +1,39 @@
+/*
+ * RISC-V translation routines for the XVentanaCondOps extension.
+ *
+ * Copyright (c) 2021-2022 VRULL GmbH.
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
+static bool gen_condmask(DisasContext *ctx, arg_r *a, TCGCond cond)
+{
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    tcg_gen_movcond_tl(cond, dest, src2, ctx->zero, src1, ctx->zero);
+
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_vt_maskc(DisasContext *ctx, arg_r *a)
+{
+    return gen_condmask(ctx, a, TCG_COND_NE);
+}
+
+static bool trans_vt_maskcn(DisasContext *ctx, arg_r *a)
+{
+    return gen_condmask(ctx, a, TCG_COND_EQ);
+}
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index a3997ed580..91f0ac32ff 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -4,6 +4,7 @@ dir = meson.current_source_dir()
 gen = [
   decodetree.process('insn16.decode', extra_args: ['--static-decode=decode_insn16', '--insnwidth=16']),
   decodetree.process('insn32.decode', extra_args: '--static-decode=decode_insn32'),
+  decodetree.process('XVentanaCondOps.decode', extra_args: '--static-decode=decode_XVentanaCodeOps'),
 ]
 
 riscv_ss = ss.source_set()
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 38fdec2fd9..89cf96b2e6 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -116,6 +116,14 @@ static bool always_true_p(DisasContext *ctx  __attribute__((__unused__)))
     return true;
 }
 
+#define MATERIALISE_EXT_PREDICATE(ext)  \
+    static bool has_ ## ext ## _p(DisasContext *ctx)    \
+    { \
+        return ctx->cfg_ptr->ext_ ## ext ; \
+    }
+
+MATERIALISE_EXT_PREDICATE(XVentanaCondOps);
+
 #ifdef TARGET_RISCV32
 #define get_xl(ctx)    MXL_RV32
 #elif defined(CONFIG_USER_ONLY)
@@ -854,9 +862,12 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvb.c.inc"
 #include "insn_trans/trans_rvzfh.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
+#include "insn_trans/trans_xventanacondops.c.inc"
 
 /* Include the auto-generated decoder for 16 bit insn */
 #include "decode-insn16.c.inc"
+/* Include decoders for factored-out extensions */
+#include "decode-XVentanaCondOps.c.inc"
 
 static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
 {
@@ -869,6 +880,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
         bool (*decode_func)(DisasContext *, uint32_t);
     } decoders[] = {
         { always_true_p,  decode_insn32 },
+        { has_XVentanaCondOps_p,  decode_XVentanaCodeOps },
     };
 
     /* Check for compressed insn */
-- 
2.33.1


