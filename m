Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED08B43F9F6
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 11:33:34 +0200 (CEST)
Received: from localhost ([::1]:39758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgOGU-0001LA-0q
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 05:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNlU-00062a-HC
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:01:33 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:42964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNlO-0005xa-Kx
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:01:30 -0400
Received: by mail-pg1-x531.google.com with SMTP id t7so9290305pgl.9
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 02:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mFtSZUdjeBlKUIHHZ7AnuPxZmIzGa/DanIR24aLooS8=;
 b=WR9KvsQemzmtW99W/qPUiWjL2EzhGaNMSBccGV/5AOfhr3TE8Dv7s/OwSuCj4I3+fe
 UVuFcyla7bJIIphYAIwm7p7etYKyS1P8GXgzGLzHJ6HqS9e//TuP3j/VzjB/BsHh6/5L
 LlOILOaDwkctHWCvyig0sTMdd5vdanIJB2RSR6F91u7DZfOAOAiY10M2YArKQlrg91/Q
 QWk/rvLq9bbbmCWbe+0JLi9ZNoht92YdFxqER6ukp68P+ff+5Wb2DZqgxTM6JTnYDLXA
 CMtFp4o/plsCCVKghzyu3DwsatEy6zZN3d7+7/bnnurSFmyFgRTKaCTAvyvik0j5kEGN
 6pHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mFtSZUdjeBlKUIHHZ7AnuPxZmIzGa/DanIR24aLooS8=;
 b=RAkwmzx+6XC5sEpMdUgmCKA9IbTvBLWoLHVeit2HIS+Ze4iqWGN3kOndLi4q4mEyBI
 /8PjdQE6X0Nzo/jpr/JKAPAsSEI72qlf+h797SaiwwnmMGwRyedurjmYKlIKqude908q
 o6fts2KfvKZxxaxxrZNV/ESH4GED75+Np/+n1bXmfCaPzRdvK+87Cm59Xy8JEVyXWEOP
 I4uNiefHux/E0YQtjr9U4Mh1PMhflZHcm+V57YIb8XXZgRuq0yj9swS1drR1+6bPFUXd
 PNaiby9trhGbJ2TIpYne3owPefMnMjXeeBI8e9HMvpJJj5bqhbFNNI+LH9X27f675hSX
 bn/A==
X-Gm-Message-State: AOAM533CqzWadxZ/02jhTPlXBsHc5VkDeD8/OggPLEr4eQoNbpiWmwp7
 GgFs3wtNXG1tbNkszy/61th+53vc1+ORNTP2
X-Google-Smtp-Source: ABdhPJzCeSoV1hHs7HuX3Iub3gRl+oq65Ig3Ja7AtytZMugdX5KR/uojQPuAAHDQOrPCU5oi8UMDbA==
X-Received: by 2002:a63:2cd8:: with SMTP id s207mr7247566pgs.312.1635498084211; 
 Fri, 29 Oct 2021 02:01:24 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:01:23 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v9 30/76] target/riscv: rvv-1.0: find-first-set mask bit
 instruction
Date: Fri, 29 Oct 2021 16:58:35 +0800
Message-Id: <20211029085922.255197-31-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x531.google.com
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   | 2 +-
 target/riscv/insn32.decode              | 2 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 target/riscv/vector_helper.c            | 6 +++---
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 3f30882aec4..7646567eb27 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1022,7 +1022,7 @@ DEF_HELPER_6(vmxnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_4(vcpop_m, tl, ptr, ptr, env, i32)
 
-DEF_HELPER_4(vmfirst_m, tl, ptr, ptr, env, i32)
+DEF_HELPER_4(vfirst_m, tl, ptr, ptr, env, i32)
 
 DEF_HELPER_5(vmsbf_m, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vmsif_m, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index e748f7ca714..4df2aa9cddc 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -628,7 +628,7 @@ vmnor_mm        011110 - ..... ..... 010 ..... 1010111 @r
 vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
 vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
 vcpop_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
-vmfirst_m       010101 . ..... ----- 010 ..... 1010111 @r2_vm
+vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
 vmsbf_m         010110 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010110 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010110 . ..... 00010 010 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index b53cd2e6f37..3645bb96356 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2696,7 +2696,7 @@ static bool trans_vcpop_m(DisasContext *s, arg_rmr *a)
 }
 
 /* vmfirst find-first-set mask bit */
-static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
+static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
 {
     if (require_rvv(s) &&
         vext_check_isa_ill(s)) {
@@ -2715,7 +2715,7 @@ static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
         tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
 
-        gen_helper_vmfirst_m(dst, mask, src2, cpu_env, desc);
+        gen_helper_vfirst_m(dst, mask, src2, cpu_env, desc);
         gen_set_gpr(s, a->rd, dst);
 
         tcg_temp_free_ptr(mask);
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 9451112b3da..f97783acf05 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4233,9 +4233,9 @@ target_ulong HELPER(vcpop_m)(void *v0, void *vs2, CPURISCVState *env,
     return cnt;
 }
 
-/* vmfirst find-first-set mask bit*/
-target_ulong HELPER(vmfirst_m)(void *v0, void *vs2, CPURISCVState *env,
-                               uint32_t desc)
+/* vfirst find-first-set mask bit*/
+target_ulong HELPER(vfirst_m)(void *v0, void *vs2, CPURISCVState *env,
+                              uint32_t desc)
 {
     uint32_t vm = vext_vm(desc);
     uint32_t vl = env->vl;
-- 
2.25.1


