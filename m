Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4CB5AEA04
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 15:43:08 +0200 (CEST)
Received: from localhost ([::1]:56524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVYr5-0006mV-91
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 09:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1oVXbX-0005cR-FD
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 08:23:04 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:42594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1oVXbR-0003qN-7y
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 08:22:57 -0400
Received: by mail-ej1-x630.google.com with SMTP id dc5so2976660ejb.9
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 05:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Eu+amAVVQVyWILwD4hKAaZX2BvgEHifujr+Z2o9Bj7Q=;
 b=cY3XT9/BMPmus5yNSmmyEHr2VuSdXMc8M/XqRT6trPWT4wniYwOLdg97HCjmO7H3IZ
 rn+QBy/JlfztLKCzVAGp0M8mXOoQcPtCFDWTCUGB3YBwgv6e5u7heuQH9VtqA7BA4nFB
 YRaMqce9XX5T0ntKrQskKgAFWmeXj0GycLBUOLBFKJ5UHU4YWidV6XO87Gd6clS/krJc
 ng5gnn8VciueQjc6COw1NFKI6mN6qlsyD8xPlMAPvADccIt7g+EdDPXQ4+lJ/ElHHXpH
 R6uuogm5CiH5EIOLDkreRUSh2nGQVBbE/Sh3z5lczfTIOevnxOa19TdrhreVFM55CCix
 zjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Eu+amAVVQVyWILwD4hKAaZX2BvgEHifujr+Z2o9Bj7Q=;
 b=l2Ylb05OPwxX3er7EwE86CqN16wTiZeJSa9SmO3nJPR4AeOBb1fXH8maOtSXMa7sPb
 jfDVoBEl2l8PK7mOa1j1vAEV11t3EXU+KCcdnQmIyRqKknb3wPqERujOGiSE9xnwwWYe
 Tm131OYlhWj1Csfe6aAollLFa72XULhY4zYn8NThDXJzmMt8OD2Rt9e4TZ8y0hXFhF5Q
 TtKB/6qYWFuzjMBvZUdsJhcN3wVY8vnaUZqaXaSVBzxkSE/f9L8IfevInWb4xKwgC/eX
 tb0DyHf3yAnZmNb79mf5nMPtUY4J2Rfyz+h6AUQtsK4iUD68zO27ecHm59+Hfl2TbVmz
 EcmQ==
X-Gm-Message-State: ACgBeo3ySWVtmqgr06CmjFMAVXVjBpdkg2AYSHi1Dq55mlMINU91ywZA
 i0ipc7cvlWJrlprhP973iUUf7g==
X-Google-Smtp-Source: AA6agR5vXctxHrPycrpv/F3rhzuE4y2jWpdlnR6sCae4365yHLB2fC0oYaekvD9/qMHlTnlXC4GAVQ==
X-Received: by 2002:a17:907:c28:b0:73d:beb7:b9c2 with SMTP id
 ga40-20020a1709070c2800b0073dbeb7b9c2mr39094123ejc.336.1662466970288; 
 Tue, 06 Sep 2022 05:22:50 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 d21-20020a170906305500b0073d6ab5bcaasm6479034ejd.212.2022.09.06.05.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 05:22:49 -0700 (PDT)
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
Subject: [PATCH 02/11] RISC-V: Adding T-Head CMO instructions
Date: Tue,  6 Sep 2022 14:22:34 +0200
Message-Id: <20220906122243.1243354-3-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
References: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch adds support for the T-Head CMO instructions.
To avoid interfering with standard extensions, decoder and translation
are in its own T-Head specific files.
Future patches should be able to easily add additional T-Head extesions.

The implementation does not have much functionality (besides accepting
the instructions and not qualifying them as illegal instructions if
the hart executes in the required privilege level for the instruction),
as QEMU does not model CPU caches and instructions don't have any
exception behaviour (at least not documented).

The documentation shows, that the instructions are gated by
mxstatus.theadisaee and mxstatus.ucme. However, since these
settings are not changed by the upstream Linux kernel,
we simply enable the instructions in all modes.

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c                         |  1 +
 target/riscv/cpu.h                         |  1 +
 target/riscv/insn_trans/trans_xthead.c.inc | 66 ++++++++++++++++++++++
 target/riscv/meson.build                   |  1 +
 target/riscv/translate.c                   | 11 +++-
 target/riscv/xtheadcmo.decode              | 43 ++++++++++++++
 6 files changed, 120 insertions(+), 3 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_xthead.c.inc
 create mode 100644 target/riscv/xtheadcmo.decode

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ac6f82ebd0..7718ab0478 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -920,6 +920,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("zhinxmin", RISCVCPU, cfg.ext_zhinxmin, false),
 
     /* Vendor-specific custom extensions */
+    DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
 
     /* These are experimental so mark with 'x-' */
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5c7acc055a..b7ab53b7b8 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -440,6 +440,7 @@ struct RISCVCPUConfig {
     uint64_t mimpid;
 
     /* Vendor-specific custom extensions */
+    bool ext_xtheadcmo;
     bool ext_XVentanaCondOps;
 
     uint8_t pmu_num;
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
new file mode 100644
index 0000000000..1b1e21ab77
--- /dev/null
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -0,0 +1,66 @@
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
+#define REQUIRE_PRIV_MHSU(ctx)
+
+#ifndef CONFIG_USER_ONLY
+#define REQUIRE_PRIV_MHS(ctx)                                   \
+do {                                                            \
+    if (!(ctx->priv == PRV_M ||                                 \
+          ctx->priv == PRV_H ||                                 \
+          ctx->priv == PRV_S)) {                                \
+        return false;                                           \
+    }                                                           \
+} while (0)
+#else
+#define REQUIRE_PRIV_MHS(ctx)                                   \
+  return false;
+#endif
+
+#define NOP_PRIVCHECK(insn, privcheck)                          \
+static bool trans_ ## insn(DisasContext *ctx, arg_ ## insn * a) \
+{                                                               \
+    (void) a;                                                   \
+    privcheck(ctx);                                             \
+    return true;                                                \
+}
+
+NOP_PRIVCHECK(th_dcache_call, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_dcache_ciall, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_dcache_iall, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_dcache_cpa, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_dcache_cipa, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_dcache_ipa, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_dcache_cva, REQUIRE_PRIV_MHSU)
+NOP_PRIVCHECK(th_dcache_civa, REQUIRE_PRIV_MHSU)
+NOP_PRIVCHECK(th_dcache_iva, REQUIRE_PRIV_MHSU)
+NOP_PRIVCHECK(th_dcache_csw, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_dcache_cisw, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_dcache_isw, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_dcache_cpal1, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_dcache_cval1, REQUIRE_PRIV_MHS)
+
+NOP_PRIVCHECK(th_icache_iall, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_icache_ialls, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_icache_ipa, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_icache_iva, REQUIRE_PRIV_MHSU)
+
+NOP_PRIVCHECK(th_l2cache_call, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_l2cache_ciall, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_l2cache_iall, REQUIRE_PRIV_MHS)
+
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 6b9435d69a..1d149e05cd 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -2,6 +2,7 @@
 gen = [
   decodetree.process('insn16.decode', extra_args: ['--static-decode=decode_insn16', '--insnwidth=16']),
   decodetree.process('insn32.decode', extra_args: '--static-decode=decode_insn32'),
+  decodetree.process('xtheadcmo.decode', extra_args: '--static-decode=decode_xtheadcmo'),
   decodetree.process('XVentanaCondOps.decode', extra_args: '--static-decode=decode_XVentanaCodeOps'),
 ]
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index fd241ff667..d16ae63850 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -132,7 +132,8 @@ static bool always_true_p(DisasContext *ctx  __attribute__((__unused__)))
         return ctx->cfg_ptr->ext_ ## ext ; \
     }
 
-MATERIALISE_EXT_PREDICATE(XVentanaCondOps);
+MATERIALISE_EXT_PREDICATE(xtheadcmo)
+MATERIALISE_EXT_PREDICATE(XVentanaCondOps)
 
 #ifdef TARGET_RISCV32
 #define get_xl(ctx)    MXL_RV32
@@ -717,6 +718,10 @@ static int ex_rvc_shifti(DisasContext *ctx, int imm)
 /* Include the auto-generated decoder for 32 bit insn */
 #include "decode-insn32.c.inc"
 
+/* Include decoders for factored-out extensions */
+#include "decode-xtheadcmo.c.inc"
+#include "decode-XVentanaCondOps.c.inc"
+
 static bool gen_logic_imm_fn(DisasContext *ctx, arg_i *a,
                              void (*func)(TCGv, TCGv, target_long))
 {
@@ -1018,12 +1023,11 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvk.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
 #include "insn_trans/trans_svinval.c.inc"
+#include "insn_trans/trans_xthead.c.inc"
 #include "insn_trans/trans_xventanacondops.c.inc"
 
 /* Include the auto-generated decoder for 16 bit insn */
 #include "decode-insn16.c.inc"
-/* Include decoders for factored-out extensions */
-#include "decode-XVentanaCondOps.c.inc"
 
 static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
 {
@@ -1036,6 +1040,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
         bool (*decode_func)(DisasContext *, uint32_t);
     } decoders[] = {
         { always_true_p,  decode_insn32 },
+        { has_xtheadcmo_p, decode_xtheadcmo },
         { has_XVentanaCondOps_p,  decode_XVentanaCodeOps },
     };
 
diff --git a/target/riscv/xtheadcmo.decode b/target/riscv/xtheadcmo.decode
new file mode 100644
index 0000000000..8ddf9b3997
--- /dev/null
+++ b/target/riscv/xtheadcmo.decode
@@ -0,0 +1,43 @@
+#
+# RISC-V translation routines for the XTheadCmo extension
+#
+# Copyright (c) 2022 Christoph Muellner, christoph.muellner@vrull.eu
+#
+# SPDX-License-Identifier: LGPL-2.1-or-later
+#
+# The XTheadCmo extension provides instructions for cache management.
+#
+# It is documented in
+# https://github.com/T-head-Semi/thead-extension-spec/releases/download/2.0.0/xthead-2022-09-05-2.0.0.pdf
+
+# Fields:
+%rs1       15:5
+
+# Formats
+@sfence_vm  ....... ..... .....   ... ..... ....... %rs1
+
+# *** CMO instructions
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
+
+th_icache_iall   0000000 10000 00000 000 00000 0001011
+th_icache_ialls  0000000 10001 00000 000 00000 0001011
+th_icache_ipa    0000001 11000 ..... 000 00000 0001011 @sfence_vm
+th_icache_iva    0000001 10000 ..... 000 00000 0001011 @sfence_vm
+
+th_l2cache_call  0000000 10101 00000 000 00000 0001011
+th_l2cache_ciall 0000000 10111 00000 000 00000 0001011
+th_l2cache_iall  0000000 10110 00000 000 00000 0001011
+
-- 
2.37.2


