Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D623430167
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 11:10:46 +0200 (CEST)
Received: from localhost ([::1]:38852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbfiG-0005QO-KC
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 05:10:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbffX-0002kV-9t
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 05:07:56 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:43586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbffT-0001Ei-Q7
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 05:07:54 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 e5-20020a17090a804500b001a116ad95caso3528581pjw.2
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 02:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qaljOxD19bpx2xLWEmDMSmrtvZSVxeVJ80a+3ifadSQ=;
 b=c389cipCgobao28vili55lICmHxyoYglL5HnHCIBlkcA5zynFvpJI6xKi1eaGQDy8O
 HMpUnXb7akZmPqglMoXg7YEpotOF0IxHyhS+wvhFjvTl3SMJNioXuA5woJqZxQsJp8C4
 FAkEAgjsl93gX3DiNPUyuxlpGmrcNW2+fslj1qkAHz04JbkKrlfNOCY1pn/kmlOB2p/Z
 JJ9LyuN/STqGNL9ankyin9s+5I3yy067geEZPBCAtPGURl0L1r1ojAzQGPBLf7RcVwyR
 oVfZYW1sNoC74Y4aeDVNC5hYDGxwETs/EwM8veeBcLGyZLfGGWiNcpQoHd0xlKvaQ2LM
 AvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qaljOxD19bpx2xLWEmDMSmrtvZSVxeVJ80a+3ifadSQ=;
 b=Tb/25E7x1+dV1CEqHud/0t8VpPC29743tDqghAPGEr5VU9XxEHfTCxiGF0FPpSImA4
 sKAbGglKe6kX+cOBXu9p94wQyXzJD5RvtieGIe7nmH/yl1fmCIZjYHbiPhRXtE1A2ZQ0
 catkW1LLLwhrhsuFZlcceSl6u3H1j2F350bAHnixfYOH2w76KHK9al6W4kz0pcMp2+aX
 QP7lWut3Q4Qp34cojl7OOduZyY2+ZvRfsLMCY0SpX4jC5es9+UStI3u02hlw0hw375pa
 nTgP+yaDkRd6Y7PRAt7GtY8CNlPJ+JuczpiUEocjhB37vUMY52kdlqJjMlb51fIuDEAx
 em7g==
X-Gm-Message-State: AOAM5302p1Ih+BeH8D7gzC6K2hDYt/RXcyBlt8qKeE+C4GbJwXMngxfz
 BXERbNwjwnn+l3G+DHpx4f+4WST1hTunCg==
X-Google-Smtp-Source: ABdhPJw0t6UX4+NFSi7z3rqaRupJ9PtbB6OL/FsIi3UiPwdIR8oKJTY6AKiy0e+gJVWl6kQXhYntfw==
X-Received: by 2002:a17:903:234d:b0:13f:3180:626a with SMTP id
 c13-20020a170903234d00b0013f3180626amr15732863plh.49.1634375270275; 
 Sat, 16 Oct 2021 02:07:50 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:487:fa85:301f:cc98:b428:6b86])
 by smtp.gmail.com with ESMTPSA id d138sm7208936pfd.74.2021.10.16.02.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 02:07:50 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v3 1/6] target/riscv: zfh: half-precision load and store
Date: Sat, 16 Oct 2021 17:07:36 +0800
Message-Id: <20211016090742.3034669-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016090742.3034669-1-frank.chang@sifive.com>
References: <20211016090742.3034669-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chih-Min Chao <chihmin.chao@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.c                        |  1 +
 target/riscv/cpu.h                        |  1 +
 target/riscv/insn32.decode                |  4 ++
 target/riscv/insn_trans/trans_rvzfh.c.inc | 65 +++++++++++++++++++++++
 target/riscv/translate.c                  |  8 +++
 5 files changed, 79 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzfh.c.inc

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1d69d1887e6..8c579dc297b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -601,6 +601,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
+    DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9e55b2f5b17..88684e72be1 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -297,6 +297,7 @@ struct RISCVCPU {
         bool ext_counters;
         bool ext_ifencei;
         bool ext_icsr;
+        bool ext_zfh;
 
         char *priv_spec;
         char *user_spec;
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 2f251dac1bb..b36a3d8dbf8 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -726,3 +726,7 @@ binv       0110100 .......... 001 ..... 0110011 @r
 binvi      01101. ........... 001 ..... 0010011 @sh
 bset       0010100 .......... 001 ..... 0110011 @r
 bseti      00101. ........... 001 ..... 0010011 @sh
+
+# *** RV32 Zfh Extension ***
+flh        ............   ..... 001 ..... 0000111 @i
+fsh        .......  ..... ..... 001 ..... 0100111 @s
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
new file mode 100644
index 00000000000..dad1d703d72
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -0,0 +1,65 @@
+/*
+ * RISC-V translation routines for the RV64Zfh Standard Extension.
+ *
+ * Copyright (c) 2020 Chih-Min Chao, chihmin.chao@sifive.com
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
+#define REQUIRE_ZFH(ctx) do { \
+    if (!ctx->ext_zfh) {      \
+        return false;         \
+    }                         \
+} while (0)
+
+static bool trans_flh(DisasContext *ctx, arg_flh *a)
+{
+    TCGv_i64 dest;
+    TCGv t0;
+
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    t0 = get_gpr(ctx, a->rs1, EXT_NONE);
+    if (a->imm) {
+        TCGv temp = temp_new(ctx);
+        tcg_gen_addi_tl(temp, t0, a->imm);
+        t0 = temp;
+    }
+
+    dest = cpu_fpr[a->rd];
+    tcg_gen_qemu_ld_i64(dest, t0, ctx->mem_idx, MO_TEUW);
+    gen_nanbox_h(dest, dest);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
+{
+    TCGv t0;
+
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    t0 = get_gpr(ctx, a->rs1, EXT_NONE);
+    if (a->imm) {
+        TCGv temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, t0, a->imm);
+        t0 = temp;
+    }
+
+    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEUW);
+
+    return true;
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d2442f0cf5d..75048149f5a 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -69,6 +69,7 @@ typedef struct DisasContext {
     bool w;
     bool virt_enabled;
     bool ext_ifencei;
+    bool ext_zfh;
     bool hlsx;
     /* vector extension */
     bool vill;
@@ -118,6 +119,11 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
     tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(32, 32));
 }
 
+static void gen_nanbox_h(TCGv_i64 out, TCGv_i64 in)
+{
+    tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(16, 48));
+}
+
 /*
  * A narrow n-bit operation, where n < FLEN, checks that input operands
  * are correctly Nan-boxed, i.e., all upper FLEN - n bits are 1.
@@ -489,6 +495,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvh.c.inc"
 #include "insn_trans/trans_rvv.c.inc"
 #include "insn_trans/trans_rvb.c.inc"
+#include "insn_trans/trans_rvzfh.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
 
 /* Include the auto-generated decoder for 16 bit insn */
@@ -541,6 +548,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->misa = env->misa;
     ctx->frm = -1;  /* unknown rounding mode */
     ctx->ext_ifencei = cpu->cfg.ext_ifencei;
+    ctx->ext_zfh = cpu->cfg.ext_zfh;
     ctx->vlen = cpu->cfg.vlen;
     ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
     ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
-- 
2.25.1


