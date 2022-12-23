Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E46A655366
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 19:01:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8mLZ-000806-Mo; Fri, 23 Dec 2022 13:00:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1p8mLJ-0007yo-CZ
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 13:00:26 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1p8mLG-0003G7-TO
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 13:00:25 -0500
Received: by mail-ed1-x52d.google.com with SMTP id u18so6566720eda.9
 for <qemu-devel@nongnu.org>; Fri, 23 Dec 2022 10:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IxpdVGw9r54+jhRqMBQzuv6ZR9vY2lQ9BejO3rtKUWo=;
 b=oE0EmuHa/2rP2P8fr6f5K84YgVvQ4Et10obwyoIhsqFH2FJTKois8MlKyDS9nOsb5y
 47cEjMucjfjTIcKKHDl9W7LiXT9L74eSV7sRF9Zh/fRtm7RB/8FJ4Kd4v31csdEbMYp7
 IXsC6riOnZAg4PhuQrhcBsiLFKWyKGgI1gPvI/EvDcHQkecfJHLM9nol9C+9FQEOpt/W
 mSgDWjgJr6nvosVjAKPmb0IzWdASZzqr2QHuQ0HMkNwqFx4bj6hPVkQp9pl6Cl6LImpo
 ITtwvcPU76OPoE6M8+XH+Uds3z9AjfA7D61Y9k8nI8/X+60ZaO1in0KmA0n2mb8Or2MR
 +Mfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IxpdVGw9r54+jhRqMBQzuv6ZR9vY2lQ9BejO3rtKUWo=;
 b=UFHIwqs/Fqr+TovOxvG6604n5/P/qKrQR/+Skwf9u38NUaflt5molsuOlueqZHvf4H
 FKkqH3URPC9lB5c+ifpG06vIKJSwvLymnF7iHv4lH1NW24kCNxcyNoPznR9mBfOKe56A
 XUNXPuzvoPQoPAnUTuJAXC5wSUyW3oQAy9Haf9O1wVcx202Q2ys/mB4eljS7gMGXkF64
 dLPNeQ9shGOuewobHuaoW3SuC35EKTTPF0F0rC3RN57uba7RmXX5SBhTNPldkEus6Bm+
 stUJvvFR37yHzhCVEdFgVXVKKKEiZUQNXmTtmu/X3LEziUbgdhg2dUnjnMb0HHV9yibz
 gYkw==
X-Gm-Message-State: AFqh2kpc9E7yP430I2tUie2fOhCvt9SAACHjFLXRlsFkmNpWoW3+DZ8R
 KxMeJnRk3hul4cbpII7eU6tdLw==
X-Google-Smtp-Source: AMrXdXsggoSSfUF9Qx7Q9SPMHwAWQb1tig6cutqzVKU0JuNNXzUVmxiBFMK60zIv8D0yBuufCIMD7A==
X-Received: by 2002:a05:6402:88d:b0:46f:fb60:8bd0 with SMTP id
 e13-20020a056402088d00b0046ffb608bd0mr8889531edy.5.1671818421337; 
 Fri, 23 Dec 2022 10:00:21 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 p14-20020a056402154e00b0047d4685878esm1734937edx.51.2022.12.23.10.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 10:00:20 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH v2 01/15] RISC-V: Adding XTheadCmo ISA extension
Date: Fri, 23 Dec 2022 19:00:01 +0100
Message-Id: <20221223180016.2068508-2-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
References: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ed1-x52d.google.com
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

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch adds support for the XTheadCmo ISA extension.
To avoid interfering with standard extensions, decoder and translation
are in its own xthead* specific files.
Future patches should be able to easily add additional T-Head extension.

The implementation does not have much functionality (besides accepting
the instructions and not qualifying them as illegal instructions if
the hart executes in the required privilege level for the instruction),
as QEMU does not model CPU caches and instructions are documented
to not raise any exceptions.

Changes in v2:
- Add ISA_EXT_DATA_ENTRY()
- Explicit test for PRV_U
- Encapsule access to env-priv in inline function
- Use single decoder for XThead extensions

Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c                         |  2 +
 target/riscv/cpu.h                         |  1 +
 target/riscv/insn_trans/trans_xthead.c.inc | 89 ++++++++++++++++++++++
 target/riscv/meson.build                   |  1 +
 target/riscv/translate.c                   | 15 +++-
 target/riscv/xthead.decode                 | 38 +++++++++
 6 files changed, 143 insertions(+), 3 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_xthead.c.inc
 create mode 100644 target/riscv/xthead.decode

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6fe176e483..a90b82c5c5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -108,6 +108,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinval),
     ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
     ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
+    ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadcmo),
     ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
 };
 
@@ -1060,6 +1061,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
 
     /* Vendor-specific custom extensions */
+    DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
 
     /* These are experimental so mark with 'x-' */
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 443d15a47c..ad1c19f870 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -465,6 +465,7 @@ struct RISCVCPUConfig {
     uint64_t mimpid;
 
     /* Vendor-specific custom extensions */
+    bool ext_xtheadcmo;
     bool ext_XVentanaCondOps;
 
     uint8_t pmu_num;
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
new file mode 100644
index 0000000000..00e75c7dca
--- /dev/null
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -0,0 +1,89 @@
+/*
+ * RISC-V translation routines for the T-Head vendor extensions (xthead*).
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
+#define REQUIRE_XTHEADCMO(ctx) do {              \
+    if (!ctx->cfg_ptr->ext_xtheadcmo) {          \
+        return false;                            \
+    }                                            \
+} while (0)
+
+/* XTheadCmo */
+
+static inline int priv_level(DisasContext *ctx)
+{
+#ifdef CONFIG_USER_ONLY
+    return PRV_U;
+#else
+     /* Priv level equals mem_idx -- see cpu_mmu_index. */
+    return ctx->mem_idx;
+#endif
+}
+
+#define REQUIRE_PRIV_MHSU(ctx)                                  \
+do {                                                            \
+    int priv = priv_level(ctx);                                 \
+    if (!(priv == PRV_M ||                                      \
+          priv == PRV_H ||                                      \
+          priv == PRV_S ||                                      \
+          priv == PRV_U)) {                                     \
+        return false;                                           \
+    }                                                           \
+} while (0)
+
+#define REQUIRE_PRIV_MHS(ctx)                                   \
+do {                                                            \
+    int priv = priv_level(ctx);                                 \
+    if (!(priv == PRV_M ||                                      \
+          priv == PRV_H ||                                      \
+          priv == PRV_S)) {                                     \
+        return false;                                           \
+    }                                                           \
+} while (0)
+
+#define NOP_PRIVCHECK(insn, extcheck, privcheck)                \
+static bool trans_ ## insn(DisasContext *ctx, arg_ ## insn * a) \
+{                                                               \
+    (void) a;                                                   \
+    extcheck(ctx);                                              \
+    privcheck(ctx);                                             \
+    return true;                                                \
+}
+
+NOP_PRIVCHECK(th_dcache_call, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_dcache_ciall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_dcache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_dcache_cpa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_dcache_cipa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_dcache_ipa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_dcache_cva, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHSU)
+NOP_PRIVCHECK(th_dcache_civa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHSU)
+NOP_PRIVCHECK(th_dcache_iva, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHSU)
+NOP_PRIVCHECK(th_dcache_csw, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_dcache_cisw, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_dcache_isw, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_dcache_cpal1, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_dcache_cval1, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
+
+NOP_PRIVCHECK(th_icache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_icache_ialls, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_icache_ipa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_icache_iva, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHSU)
+
+NOP_PRIVCHECK(th_l2cache_call, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_l2cache_ciall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_l2cache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index ba25164d74..5dee37a242 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -2,6 +2,7 @@
 gen = [
   decodetree.process('insn16.decode', extra_args: ['--static-decode=decode_insn16', '--insnwidth=16']),
   decodetree.process('insn32.decode', extra_args: '--static-decode=decode_insn32'),
+  decodetree.process('xthead.decode', extra_args: '--static-decode=decode_xthead'),
   decodetree.process('XVentanaCondOps.decode', extra_args: '--static-decode=decode_XVentanaCodeOps'),
 ]
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index db123da5ec..14d9116975 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -125,13 +125,18 @@ static bool always_true_p(DisasContext *ctx  __attribute__((__unused__)))
     return true;
 }
 
+static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
+{
+    return ctx->cfg_ptr->ext_xtheadcmo;
+}
+
 #define MATERIALISE_EXT_PREDICATE(ext)  \
     static bool has_ ## ext ## _p(DisasContext *ctx)    \
     { \
         return ctx->cfg_ptr->ext_ ## ext ; \
     }
 
-MATERIALISE_EXT_PREDICATE(XVentanaCondOps);
+MATERIALISE_EXT_PREDICATE(XVentanaCondOps)
 
 #ifdef TARGET_RISCV32
 #define get_xl(ctx)    MXL_RV32
@@ -732,6 +737,10 @@ static int ex_rvc_shiftri(DisasContext *ctx, int imm)
 /* Include the auto-generated decoder for 32 bit insn */
 #include "decode-insn32.c.inc"
 
+/* Include decoders for factored-out extensions */
+#include "decode-xthead.c.inc"
+#include "decode-XVentanaCondOps.c.inc"
+
 static bool gen_logic_imm_fn(DisasContext *ctx, arg_i *a,
                              void (*func)(TCGv, TCGv, target_long))
 {
@@ -1033,12 +1042,11 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvk.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
 #include "insn_trans/trans_svinval.c.inc"
+#include "insn_trans/trans_xthead.c.inc"
 #include "insn_trans/trans_xventanacondops.c.inc"
 
 /* Include the auto-generated decoder for 16 bit insn */
 #include "decode-insn16.c.inc"
-/* Include decoders for factored-out extensions */
-#include "decode-XVentanaCondOps.c.inc"
 
 /* The specification allows for longer insns, but not supported by qemu. */
 #define MAX_INSN_LEN  4
@@ -1059,6 +1067,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
         bool (*decode_func)(DisasContext *, uint32_t);
     } decoders[] = {
         { always_true_p,  decode_insn32 },
+        { has_xthead_p, decode_xthead },
         { has_XVentanaCondOps_p,  decode_XVentanaCodeOps },
     };
 
diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
new file mode 100644
index 0000000000..30533a66f5
--- /dev/null
+++ b/target/riscv/xthead.decode
@@ -0,0 +1,38 @@
+#
+# Translation routines for the instructions of the XThead* ISA extensions
+#
+# Copyright (c) 2022 Christoph Muellner, christoph.muellner@vrull.eu
+#
+# SPDX-License-Identifier: LGPL-2.1-or-later
+#
+# The documentation of the ISA extensions can be found here:
+#   https://github.com/T-head-Semi/thead-extension-spec/releases/latest
+
+# Fields:
+%rs1       15:5
+
+# Formats
+@sfence_vm  ....... ..... .....   ... ..... ....... %rs1
+
+# XTheadCmo
+th_dcache_call   0000000 00001 00000 000 00000 0001011
+th_dcache_ciall  0000000 00011 00000 000 00000 0001011
+th_dcache_iall   0000000 00010 00000 000 00000 0001011
+th_dcache_cpa    0000001 01001 ..... 000 00000 0001011 @sfence_vm
+th_dcache_cipa   0000001 01011 ..... 000 00000 0001011 @sfence_vm
+th_dcache_ipa    0000001 01010 ..... 000 00000 0001011 @sfence_vm
+th_dcache_cva    0000001 00101 ..... 000 00000 0001011 @sfence_vm
+th_dcache_civa   0000001 00111 ..... 000 00000 0001011 @sfence_vm
+th_dcache_iva    0000001 00110 ..... 000 00000 0001011 @sfence_vm
+th_dcache_csw    0000001 00001 ..... 000 00000 0001011 @sfence_vm
+th_dcache_cisw   0000001 00011 ..... 000 00000 0001011 @sfence_vm
+th_dcache_isw    0000001 00010 ..... 000 00000 0001011 @sfence_vm
+th_dcache_cpal1  0000001 01000 ..... 000 00000 0001011 @sfence_vm
+th_dcache_cval1  0000001 00100 ..... 000 00000 0001011 @sfence_vm
+th_icache_iall   0000000 10000 00000 000 00000 0001011
+th_icache_ialls  0000000 10001 00000 000 00000 0001011
+th_icache_ipa    0000001 11000 ..... 000 00000 0001011 @sfence_vm
+th_icache_iva    0000001 10000 ..... 000 00000 0001011 @sfence_vm
+th_l2cache_call  0000000 10101 00000 000 00000 0001011
+th_l2cache_ciall 0000000 10111 00000 000 00000 0001011
+th_l2cache_iall  0000000 10110 00000 000 00000 0001011
-- 
2.38.1


