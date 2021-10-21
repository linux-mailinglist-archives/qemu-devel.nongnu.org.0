Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3A74367D8
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 18:32:58 +0200 (CEST)
Received: from localhost ([::1]:50590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdazw-0003ne-Of
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 12:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mdaxD-0000ys-Jr
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 12:30:07 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:39453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mdaxB-0007MQ-Cr
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 12:30:07 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 u6-20020a17090a3fc600b001a00250584aso3538563pjm.4
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 09:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3LSgNdiDeMo7dhPWmohey204C/BrZoJj2npi1i/6Ty8=;
 b=ORAYlQtajo2/m0oWnxbL/ym1m008aV9Y5G4cXJmyBNYdSxMTSMXmOAriDNF0AnY/UG
 cXRHelITRZNb7NiVEfboUilDdXCu12zSB3CjWcy/52ckiaeKQ4s/UPN6Spl+bqL2c0sV
 TSmZkEXDKnJsgcc/MGCFsTK+bQgYTSdeYosm3ZlwLDAMDVmn2Z0SjtR4P0IjEPGtgkBw
 v9C44zNDYvhlRf77x7O4mpTDD/8UJi+DNEbFFbZER5amB1BkCf9GP+FEFotoPkO0mpcA
 kcFNtVAaJc2r4/8IDf2bYbSiIxMHxILw1ZgEPM5/KY1FRTYni++MpcTRL+/XDjxa5JMU
 WUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3LSgNdiDeMo7dhPWmohey204C/BrZoJj2npi1i/6Ty8=;
 b=JXJYpiZb0GwRZIhZk7TgKtLapcWxv4y6T22jv9lvTkC2TVM9d25sgXSVz9xm4fA5j5
 k+1MV13GPnXAcJW0Sb8Ulk3Zqdnj1Me0X+CyvG9mAuPTRIIHEtSBtJYLNN1OjgFb2kOU
 fu2+1GsoS+AvbWxKDuCyJTvRpKYu3LUt9ZqVqAsQhDRbud3cjxlQkKzMkGzjRSkSZ/RQ
 hHK5KgPNVx6vAGSQyXy9Ntiy4lB1EwppnXLzrr83HZ/4eGF/hPYKdYBqZf13zcgq2Fs0
 AiyAkbKntscvKABN6rsOcnJCyZWl7HHmiKIzQySyN42NfaNG6Dk/0hIW/VpLixYs+krF
 av9g==
X-Gm-Message-State: AOAM532QMjrxKOIpLzbN+GbtlnBqu/6CrhZ2ww2/U99nMcsjOFnxk+vv
 HDiRj2NhJUe5WxSPtxQs3jPBnA==
X-Google-Smtp-Source: ABdhPJyu+wv75l1ULS7mVLdmnvhsIBG5OfE5d/CJQMRdFK8biEYFzc6DkZEkGQ5Sm0itSJosn0WDRg==
X-Received: by 2002:a17:90a:ac0a:: with SMTP id
 o10mr7771056pjq.125.1634833803842; 
 Thu, 21 Oct 2021 09:30:03 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id j9sm5963155pgn.24.2021.10.21.09.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 09:30:03 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-riscv@nongnu.org
Subject: [PATCH v5 1/8] target/riscv: zfh: half-precision load and store
Date: Fri, 22 Oct 2021 00:29:47 +0800
Message-Id: <20211021162956.2772656-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021162956.2772656-1-frank.chang@sifive.com>
References: <20211021162956.2772656-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1032.google.com
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
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
 target/riscv/cpu.h                        |  1 +
 target/riscv/insn32.decode                |  4 ++
 target/riscv/insn_trans/trans_rvzfh.c.inc | 65 +++++++++++++++++++++++
 target/riscv/translate.c                  |  8 +++
 4 files changed, 78 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzfh.c.inc

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a33dc30be81..da3c436987c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -299,6 +299,7 @@ struct RISCVCPU {
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
index d38f87d7188..ad963d1898f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -70,6 +70,7 @@ typedef struct DisasContext {
     RISCVMXL ol;
     bool virt_enabled;
     bool ext_ifencei;
+    bool ext_zfh;
     bool hlsx;
     /* vector extension */
     bool vill;
@@ -127,6 +128,11 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
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
@@ -550,6 +556,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvh.c.inc"
 #include "insn_trans/trans_rvv.c.inc"
 #include "insn_trans/trans_rvb.c.inc"
+#include "insn_trans/trans_rvzfh.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
 
 /* Include the auto-generated decoder for 16 bit insn */
@@ -602,6 +609,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->misa_ext = env->misa_ext;
     ctx->frm = -1;  /* unknown rounding mode */
     ctx->ext_ifencei = cpu->cfg.ext_ifencei;
+    ctx->ext_zfh = cpu->cfg.ext_zfh;
     ctx->vlen = cpu->cfg.vlen;
     ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
     ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
-- 
2.25.1


