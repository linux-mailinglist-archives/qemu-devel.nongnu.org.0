Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 274475AE96C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 15:24:09 +0200 (CEST)
Received: from localhost ([::1]:40062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVYYi-0006DK-8g
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 09:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1oVXbV-0005bV-Gs
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 08:22:58 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:35359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1oVXbS-0003qr-2U
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 08:22:57 -0400
Received: by mail-ed1-x52d.google.com with SMTP id 29so9829042edv.2
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 05:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Q2A8+IgzZZwHIAVpxiQKqj6xI8wMhMdEYDyHApPPink=;
 b=Kzi9UAd30HHZrd1grTPc4KyjEoakABvnUDqxpHZxiTvIQU50gNjMTaih1EhQ0UDU/J
 PjXQ8QfvWJ/kJ3KGAIJy8gkYBXovEbDMlSu8YF9bPiTOBdGuM6iW0uICheajvG6f9Ita
 q0vv0/FZVJ9M5oDPrYir4Fgdufvl7A165Dlz0YDPdFIrSuejQxd/Ez1ETFSatNtkvhN+
 mE2gPpfPFcJKEzypdseToSK9hYXfjtVR1ZtNGB65zYxrNZYLFP3jx5uisO3upjKsVbHo
 fTfvVjD/7pXOeCDYNTe6KTOMcipI2xXZ0r5M3IiGYVyK2W9PFcI7n9+yeaFZNR0/MUhW
 w5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Q2A8+IgzZZwHIAVpxiQKqj6xI8wMhMdEYDyHApPPink=;
 b=pYcLH8JizVDSjLwWGzsAt94kbou1/E5OLYZK3Vfx2Qpb4buZx2tLD5Oyhbd3Ve6YFj
 tHzK85UGK0Tjkr9KwNLJUfMZ/T4Yyd8viR8BZOb2ro90gYNLQfjbuJeLtEovu9UEj7Yi
 8dGgpwG1k06wuT/ynIGcqBAD0xNEpBxckIPjRPnqex2LbgA+tNShX1FsH5tOo10D+zDV
 fRidC9/iWRIJ5gYLoUjeHZC/XyNraK20cd1A1TgAJF80qHZUZYeKJdwAdspGN6/NOFDP
 V5FmwKYpqcS/RHOvb2YwqtWD7kM1gyth3tpPKRXDh6uR9hqT2MDW8aK54H7tKdc1LaGl
 roGg==
X-Gm-Message-State: ACgBeo22qcxQlyzBrB9/G6s6QDQ9r7CXTOz+W9doS/DCj1c6REvQ2AMb
 qv/W/0sP/e4Za2OUNp7bZI8a9A==
X-Google-Smtp-Source: AA6agR47qxP/IwjtPFA5e/ISdOt9g+g26haHekCASCrc5gChBPvrNaD5lRme+cdxIV/BOZqBAgvydg==
X-Received: by 2002:a05:6402:4517:b0:443:7fe1:2d60 with SMTP id
 ez23-20020a056402451700b004437fe12d60mr47627146edb.133.1662466971797; 
 Tue, 06 Sep 2022 05:22:51 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 d21-20020a170906305500b0073d6ab5bcaasm6479034ejd.212.2022.09.06.05.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 05:22:51 -0700 (PDT)
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
Subject: [PATCH 03/11] RISC-V: Adding T-Head SYNC instructions
Date: Tue,  6 Sep 2022 14:22:35 +0200
Message-Id: <20220906122243.1243354-4-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
References: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
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

This patch adds support for the T-Head SYNC instructions.
The patch uses the T-Head specific decoder and translation.

The implementation does not have much functionality (besides accepting
the instructions and not qualifying them as illegal instructions if
the hart executes in the required privilege level for the instruction),
as QEMU does not model CPU caches, or out-of-order execution.
Further the instructions don't have any exception behaviour
(at least not documented).

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c                         |  1 +
 target/riscv/cpu.h                         |  1 +
 target/riscv/insn_trans/trans_xthead.c.inc |  6 ++++++
 target/riscv/meson.build                   |  1 +
 target/riscv/translate.c                   |  3 +++
 target/riscv/xtheadsync.decode             | 25 ++++++++++++++++++++++
 6 files changed, 37 insertions(+)
 create mode 100644 target/riscv/xtheadsync.decode

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7718ab0478..a72722cfa6 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -921,6 +921,7 @@ static Property riscv_cpu_extensions[] = {
 
     /* Vendor-specific custom extensions */
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
+    DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
 
     /* These are experimental so mark with 'x-' */
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index b7ab53b7b8..4ae22cf529 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -441,6 +441,7 @@ struct RISCVCPUConfig {
 
     /* Vendor-specific custom extensions */
     bool ext_xtheadcmo;
+    bool ext_xtheadsync;
     bool ext_XVentanaCondOps;
 
     uint8_t pmu_num;
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index 1b1e21ab77..0a6719b2e2 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -64,3 +64,9 @@ NOP_PRIVCHECK(th_l2cache_call, REQUIRE_PRIV_MHS)
 NOP_PRIVCHECK(th_l2cache_ciall, REQUIRE_PRIV_MHS)
 NOP_PRIVCHECK(th_l2cache_iall, REQUIRE_PRIV_MHS)
 
+NOP_PRIVCHECK(th_sfence_vmas, REQUIRE_PRIV_MHS)
+NOP_PRIVCHECK(th_sync, REQUIRE_PRIV_MHSU)
+NOP_PRIVCHECK(th_sync_i, REQUIRE_PRIV_MHSU)
+NOP_PRIVCHECK(th_sync_is, REQUIRE_PRIV_MHSU)
+NOP_PRIVCHECK(th_sync_s, REQUIRE_PRIV_MHSU)
+
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 1d149e05cd..f201cc6997 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -3,6 +3,7 @@ gen = [
   decodetree.process('insn16.decode', extra_args: ['--static-decode=decode_insn16', '--insnwidth=16']),
   decodetree.process('insn32.decode', extra_args: '--static-decode=decode_insn32'),
   decodetree.process('xtheadcmo.decode', extra_args: '--static-decode=decode_xtheadcmo'),
+  decodetree.process('xtheadsync.decode', extra_args: '--static-decode=decode_xtheadsync'),
   decodetree.process('XVentanaCondOps.decode', extra_args: '--static-decode=decode_XVentanaCodeOps'),
 ]
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d16ae63850..a63cc3de46 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -133,6 +133,7 @@ static bool always_true_p(DisasContext *ctx  __attribute__((__unused__)))
     }
 
 MATERIALISE_EXT_PREDICATE(xtheadcmo)
+MATERIALISE_EXT_PREDICATE(xtheadsync)
 MATERIALISE_EXT_PREDICATE(XVentanaCondOps)
 
 #ifdef TARGET_RISCV32
@@ -720,6 +721,7 @@ static int ex_rvc_shifti(DisasContext *ctx, int imm)
 
 /* Include decoders for factored-out extensions */
 #include "decode-xtheadcmo.c.inc"
+#include "decode-xtheadsync.c.inc"
 #include "decode-XVentanaCondOps.c.inc"
 
 static bool gen_logic_imm_fn(DisasContext *ctx, arg_i *a,
@@ -1041,6 +1043,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
     } decoders[] = {
         { always_true_p,  decode_insn32 },
         { has_xtheadcmo_p, decode_xtheadcmo },
+        { has_xtheadsync_p, decode_xtheadsync },
         { has_XVentanaCondOps_p,  decode_XVentanaCodeOps },
     };
 
diff --git a/target/riscv/xtheadsync.decode b/target/riscv/xtheadsync.decode
new file mode 100644
index 0000000000..d25735cce8
--- /dev/null
+++ b/target/riscv/xtheadsync.decode
@@ -0,0 +1,25 @@
+#
+# RISC-V translation routines for the XTheadSync extension
+#
+# Copyright (c) 2022 Christoph Muellner, christoph.muellner@vrull.eu
+#
+# SPDX-License-Identifier: LGPL-2.1-or-later
+#
+# The XTheadSync extension provides instructions for multi-processor synchronization.
+#
+# It is documented in
+# https://github.com/T-head-Semi/thead-extension-spec/releases/download/2.0.0/xthead-2022-09-05-2.0.0.pdf
+
+# Fields:
+%rs1  15:5
+%rs2  20:5
+
+# Formats
+@rs2_s          ....... ..... ..... ... ..... ....... %rs2 %rs1
+
+# *** SYNC instructions
+th_sfence_vmas   0000010 ..... ..... 000 00000 0001011 @rs2_s
+th_sync          0000000 11000 00000 000 00000 0001011
+th_sync_i        0000000 11010 00000 000 00000 0001011
+th_sync_is       0000000 11011 00000 000 00000 0001011
+th_sync_s        0000000 11001 00000 000 00000 0001011
-- 
2.37.2


