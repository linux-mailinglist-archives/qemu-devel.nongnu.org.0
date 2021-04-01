Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B73A5351259
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 11:34:41 +0200 (CEST)
Received: from localhost ([::1]:37660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRtiq-0001P6-QA
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 05:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lRtbm-00041W-Jr
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 05:27:22 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:56084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lRtbj-0000lH-Qm
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 05:27:22 -0400
Received: by mail-pj1-x1031.google.com with SMTP id bt4so832915pjb.5
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 02:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=yRXQ7R56bwmVedE1UHd1VCnBbICL7x86UFC15hD4h74=;
 b=fhU1RCD96FUa6bOak7LBbA4OrjvGVIMrvUBeXjtTVqjeXiuox5NwYT/WVXpPtukv4E
 +fi8m0NDhZU+dlzr//kvFLOLv0Bj6CZPa6mETl2vWff8EkKV4QNijvTbG5AjzW6nnc2k
 nC9HcqgpWad5+auXO+2Hzjtb5/5i3xDWnGbEHrG+TVrFqyF9425Pq5YkwQJqp/mRn0nE
 p5ctJ9lmFoRupxvjLbCqFUPB3XPSQZy0zXYkd/YGotBoNL1S9cO/diY3Xyo5dKRtUNRs
 bHA49dA+KaVyK3gvqzAJhXDI7f/0rJF3UYRTjDlOUr2evGPZUx3vE7GH2OU0xoqC3GPb
 nq+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=yRXQ7R56bwmVedE1UHd1VCnBbICL7x86UFC15hD4h74=;
 b=aF9Md7onbNOq/h9i0z8n9DPgDwiZtCdT46VjRrj2GqhBVecRz3Wo5jE/U66qjKJGxM
 62P9VsQmdvrabPH9ytUA7uMhT0vIGRwD447fOQBmyf7uCv9cw/xy/47uBO5yVm3P1Iaf
 jtNRorTlGE/NhLjwyWTaey200xC2YrsI4tFj840k1GLDqdWcq54d8JitL/W/326ts2T9
 hEU0285h/gdHVEyyumvMEefDhH3ioFq/T2ij5qx9+yyIc7+Yubuml/a7dvmvrFBdfVc1
 iNwNhR0F5FtX29A2dPZDk+TxXbxfnT760hYU8x7frwgIjZdvISWWChCoSJ2unzI2iX1l
 jG3A==
X-Gm-Message-State: AOAM531f/1840Y7kPZmD2J2C4elqHo0+XtlKzcBkh4QaKj+etjum9gE6
 nI0yPGjANKRq4WVm6d/aPRAfVIQpZhsRoy4D
X-Google-Smtp-Source: ABdhPJzeQFCY5g/taRt/75FqGydVO/xktO/dykm6MpiAVv4atpJQLibcEIq8RU6VRhHkiZc3GvpvDw==
X-Received: by 2002:a17:90a:4d07:: with SMTP id
 c7mr8053701pjg.104.1617269238305; 
 Thu, 01 Apr 2021 02:27:18 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id i7sm4751319pgq.16.2021.04.01.02.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 02:27:17 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v2 4/4] target/riscv: add RNMI mnret instruction
Date: Thu,  1 Apr 2021 17:26:51 +0800
Message-Id: <20210401092659.12014-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210401092659.12014-1-frank.chang@sifive.com>
References: <20210401092659.12014-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Keith Packard <keithp@keithp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Frank Chang <frank.chang@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                         |  1 +
 target/riscv/insn32.decode                    |  3 ++
 .../riscv/insn_trans/trans_privileged.c.inc   | 13 ++++++++
 target/riscv/op_helper.c                      | 31 +++++++++++++++++++
 4 files changed, 48 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index e3f3f41e891..0914d777d6d 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -65,6 +65,7 @@ DEF_HELPER_4(csrrc, tl, env, tl, tl, tl)
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_2(sret, tl, env, tl)
 DEF_HELPER_2(mret, tl, env, tl)
+DEF_HELPER_2(mnret, tl, env, tl)
 DEF_HELPER_1(wfi, void, env)
 DEF_HELPER_1(tlb_flush, void, env)
 #endif
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 84080dd18ca..557f3394276 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -97,6 +97,9 @@ wfi         0001000    00101 00000 000 00000 1110011
 sfence_vma  0001001    ..... ..... 000 00000 1110011 @sfence_vma
 sfence_vm   0001000    00100 ..... 000 00000 1110011 @sfence_vm
 
+# *** NMI ***
+mnret       0111000    00010 00000 000 00000 1110011
+
 # *** RV32I Base Instruction Set ***
 lui      ....................       ..... 0110111 @u
 auipc    ....................       ..... 0010111 @u
diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index 32312be2024..63c49dfe6fb 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -106,6 +106,19 @@ static bool trans_mret(DisasContext *ctx, arg_mret *a)
 #endif
 }
 
+static bool trans_mnret(DisasContext *ctx, arg_mnret *a)
+{
+#ifndef CONFIG_USER_ONLY
+    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
+    gen_helper_mnret(cpu_pc, cpu_env, cpu_pc);
+    exit_tb(ctx); /* no chaining */
+    ctx->base.is_jmp = DISAS_NORETURN;
+    return true;
+#else
+    return false;
+#endif
+}
+
 static bool trans_wfi(DisasContext *ctx, arg_wfi *a)
 {
 #ifndef CONFIG_USER_ONLY
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 1eddcb94de7..b9601776153 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -175,6 +175,37 @@ target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
     return retpc;
 }
 
+target_ulong helper_mnret(CPURISCVState *env, target_ulong cpu_pc_deb)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_RNMI)) {
+        /* RNMI feature is not presented. */
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    }
+
+    if (!(env->priv >= PRV_M)) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    }
+
+    /* Get return PC from mnepc CSR. */
+    target_ulong retpc = env->mnepc;
+    if (!riscv_has_ext(env, RVC) && (retpc & 0x3)) {
+        riscv_raise_exception(env, RISCV_EXCP_INST_ADDR_MIS, GETPC());
+    }
+
+    /* Get previous privilege level from mnstatus CSR. */
+    target_ulong prev_priv = get_field(env->mnstatus, MNSTATUS_MPP);
+
+    if (!pmp_get_num_rules(env) && (prev_priv != PRV_M)) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    }
+
+    riscv_cpu_set_mode(env, prev_priv);
+
+    env->nmie = true;
+
+    return retpc;
+}
+
 void helper_wfi(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);
-- 
2.17.1


