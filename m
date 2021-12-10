Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836CA46FC0F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 08:47:10 +0100 (CET)
Received: from localhost ([::1]:37214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvacX-0005eA-L5
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 02:47:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaZR-0002EO-6B
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:43:58 -0500
Received: from [2607:f8b0:4864:20::102d] (port=41502
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaZK-0007qp-L8
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:43:52 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso6883305pjb.0
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 23:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RnljGES47aRGjRwLhghoKD/eLHNu8pGbJDtQiGqwAuk=;
 b=W9wGMEiSyGz7mLP5XQ64u4vU3yfJIceZqeu9LufamEAh+PkEPAzxtLljl41OIqchap
 j8f/lLBSwNMSZyJu6IdoA95oiBvLQkuCRxNuIhYAuO4sOf9qMOIxjOOqcBPuoFTAMACD
 VYzCaY+vJdiknFGRBiA3rAQQfIQhfALqrqWEqiXt1t75fLIY/+7SbY47YbF0Oe1o8rPq
 uS6PyhPzBmrB24H+bS7A47hLTcZxswd2fmi080w0ZToIkwD5m60iHvcd/08zH9xp2I37
 gUkPXqS6J/GU37NauYvL9/7a0tezwFDzGXkhf2ocaizIjntLMurEMzxmzq8Cg4a8Ov5H
 upkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RnljGES47aRGjRwLhghoKD/eLHNu8pGbJDtQiGqwAuk=;
 b=zyaOi9sITkcalTQjZ4YDI/uHgD0yz1knB7wo45zWkzHmfvr9ZF+1OsB2XOdFoUbX/h
 mcDOKR6EjddZaLMZfIOyMX0NFHnFRzCkSwNIZzL+2ZZItl4pMmMGRs2jPVHJvfFSh+Hb
 9vfEk2kQy9OoxrTtU9+Y6Nz2Odafe8MwQzXQvc94NWkPY3+VQPEvklggDXCWuW7UQvKX
 Qzrwuge5K2i8LyGdMzOH7WPW6cK1RszOysrFfkx4Wn/E/VBNZGdu1pbSllE5ah6CGqmu
 D8BbW/QH1ErZ1a40Ovkjj/ilBBVJoWNuKNFUWUvD168Ibx059IgUFls3+ryGPzQ6ZKjr
 5w3g==
X-Gm-Message-State: AOAM5320ci+DWemRAhAwcQx22oQ9CyEOHzH2fW7HiL37O0vL0u13pwdV
 vDFsP/eXMuhBeqv29idpi61wtcqZzXF2vM3N
X-Google-Smtp-Source: ABdhPJwzaSq7YspwjB8iM3qzvqiWPvBgrSvDVdpG4+yf7DwRU57ZIVwQvkN74mBIOYtvtthlyfJ6RA==
X-Received: by 2002:a17:90b:1648:: with SMTP id
 il8mr21535574pjb.246.1639122229000; 
 Thu, 09 Dec 2021 23:43:49 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id g17sm1737704pgh.46.2021.12.09.23.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:43:48 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v6 2/8] target/riscv: zfh: half-precision computational
Date: Fri, 10 Dec 2021 15:43:21 +0800
Message-Id: <20211210074329.5775-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210074329.5775-1-frank.chang@sifive.com>
References: <20211210074329.5775-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chih-Min Chao <chihmin.chao@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/fpu_helper.c                 |  86 +++++++++++++++
 target/riscv/helper.h                     |  13 +++
 target/riscv/insn32.decode                |  11 ++
 target/riscv/insn_trans/trans_rvzfh.c.inc | 129 ++++++++++++++++++++++
 target/riscv/internals.h                  |  16 +++
 5 files changed, 255 insertions(+)

diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index d62f470900..20bb89ad14 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -81,6 +81,15 @@ void helper_set_rounding_mode(CPURISCVState *env, uint32_t rm)
     set_float_rounding_mode(softrm, &env->fp_status);
 }
 
+static uint64_t do_fmadd_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2,
+                           uint64_t rs3, int flags)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    float16 frs2 = check_nanbox_h(rs2);
+    float16 frs3 = check_nanbox_h(rs3);
+    return nanbox_h(float16_muladd(frs1, frs2, frs3, flags, &env->fp_status));
+}
+
 static uint64_t do_fmadd_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2,
                            uint64_t rs3, int flags)
 {
@@ -102,6 +111,12 @@ uint64_t helper_fmadd_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
     return float64_muladd(frs1, frs2, frs3, 0, &env->fp_status);
 }
 
+uint64_t helper_fmadd_h(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
+                        uint64_t frs3)
+{
+    return do_fmadd_h(env, frs1, frs2, frs3, 0);
+}
+
 uint64_t helper_fmsub_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
                         uint64_t frs3)
 {
@@ -115,6 +130,12 @@ uint64_t helper_fmsub_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
                           &env->fp_status);
 }
 
+uint64_t helper_fmsub_h(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
+                        uint64_t frs3)
+{
+    return do_fmadd_h(env, frs1, frs2, frs3, float_muladd_negate_c);
+}
+
 uint64_t helper_fnmsub_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
                          uint64_t frs3)
 {
@@ -128,6 +149,12 @@ uint64_t helper_fnmsub_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
                           &env->fp_status);
 }
 
+uint64_t helper_fnmsub_h(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
+                         uint64_t frs3)
+{
+    return do_fmadd_h(env, frs1, frs2, frs3, float_muladd_negate_product);
+}
+
 uint64_t helper_fnmadd_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
                          uint64_t frs3)
 {
@@ -142,6 +169,13 @@ uint64_t helper_fnmadd_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
                           float_muladd_negate_product, &env->fp_status);
 }
 
+uint64_t helper_fnmadd_h(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
+                         uint64_t frs3)
+{
+    return do_fmadd_h(env, frs1, frs2, frs3,
+                      float_muladd_negate_c | float_muladd_negate_product);
+}
+
 uint64_t helper_fadd_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
     float32 frs1 = check_nanbox_s(rs1);
@@ -374,3 +408,55 @@ target_ulong helper_fclass_d(uint64_t frs1)
 {
     return fclass_d(frs1);
 }
+
+uint64_t helper_fadd_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    float16 frs2 = check_nanbox_h(rs2);
+    return nanbox_h(float16_add(frs1, frs2, &env->fp_status));
+}
+
+uint64_t helper_fsub_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    float16 frs2 = check_nanbox_h(rs2);
+    return nanbox_h(float16_sub(frs1, frs2, &env->fp_status));
+}
+
+uint64_t helper_fmul_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    float16 frs2 = check_nanbox_h(rs2);
+    return nanbox_h(float16_mul(frs1, frs2, &env->fp_status));
+}
+
+uint64_t helper_fdiv_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    float16 frs2 = check_nanbox_h(rs2);
+    return nanbox_h(float16_div(frs1, frs2, &env->fp_status));
+}
+
+uint64_t helper_fmin_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    float16 frs2 = check_nanbox_h(rs2);
+    return nanbox_h(env->priv_ver < PRIV_VERSION_1_11_0 ?
+                    float16_minnum(frs1, frs2, &env->fp_status) :
+                    float16_minimum_number(frs1, frs2, &env->fp_status));
+}
+
+uint64_t helper_fmax_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    float16 frs2 = check_nanbox_h(rs2);
+    return nanbox_h(env->priv_ver < PRIV_VERSION_1_11_0 ?
+                    float16_maxnum(frs1, frs2, &env->fp_status) :
+                    float16_maximum_number(frs1, frs2, &env->fp_status));
+}
+
+uint64_t helper_fsqrt_h(CPURISCVState *env, uint64_t rs1)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    return nanbox_h(float16_sqrt(frs1, &env->fp_status));
+}
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index c7a5376227..c6c0323faf 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -7,12 +7,16 @@ DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_WG, void, env, i32)
 /* Floating Point - fused */
 DEF_HELPER_FLAGS_4(fmadd_s, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(fmadd_d, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
+DEF_HELPER_FLAGS_4(fmadd_h, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(fmsub_s, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(fmsub_d, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
+DEF_HELPER_FLAGS_4(fmsub_h, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(fnmsub_s, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(fnmsub_d, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
+DEF_HELPER_FLAGS_4(fnmsub_h, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(fnmadd_s, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(fnmadd_d, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
+DEF_HELPER_FLAGS_4(fnmadd_h, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
 
 /* Floating Point - Single Precision */
 DEF_HELPER_FLAGS_3(fadd_s, TCG_CALL_NO_RWG, i64, env, i64, i64)
@@ -62,6 +66,15 @@ DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i64)
 DEF_HELPER_FLAGS_2(clmul, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(clmulr, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 
+/* Floating Point - Half Precision */
+DEF_HELPER_FLAGS_3(fadd_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fsub_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fmul_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fdiv_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fmin_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fmax_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_2(fsqrt_h, TCG_CALL_NO_RWG, i64, env, i64)
+
 /* Special functions */
 DEF_HELPER_2(csrr, tl, env, int)
 DEF_HELPER_3(csrw, void, env, int, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index b36a3d8dbf..66c231a301 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -730,3 +730,14 @@ bseti      00101. ........... 001 ..... 0010011 @sh
 # *** RV32 Zfh Extension ***
 flh        ............   ..... 001 ..... 0000111 @i
 fsh        .......  ..... ..... 001 ..... 0100111 @s
+fmadd_h    ..... 10 ..... ..... ... ..... 1000011 @r4_rm
+fmsub_h    ..... 10 ..... ..... ... ..... 1000111 @r4_rm
+fnmsub_h   ..... 10 ..... ..... ... ..... 1001011 @r4_rm
+fnmadd_h   ..... 10 ..... ..... ... ..... 1001111 @r4_rm
+fadd_h     0000010  ..... ..... ... ..... 1010011 @r_rm
+fsub_h     0000110  ..... ..... ... ..... 1010011 @r_rm
+fmul_h     0001010  ..... ..... ... ..... 1010011 @r_rm
+fdiv_h     0001110  ..... ..... ... ..... 1010011 @r_rm
+fsqrt_h    0101110  00000 ..... ... ..... 1010011 @r2_rm
+fmin_h     0010110  ..... ..... 000 ..... 1010011 @r
+fmax_h     0010110  ..... ..... 001 ..... 1010011 @r
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index dad1d703d7..9764d76f8b 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -63,3 +63,132 @@ static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
 
     return true;
 }
+
+static bool trans_fmadd_h(DisasContext *ctx, arg_fmadd_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fmadd_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                       cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fmsub_h(DisasContext *ctx, arg_fmsub_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fmsub_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                       cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fnmsub_h(DisasContext *ctx, arg_fnmsub_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fnmsub_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                        cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fnmadd_h(DisasContext *ctx, arg_fnmadd_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fnmadd_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                        cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fadd_h(DisasContext *ctx, arg_fadd_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fadd_h(cpu_fpr[a->rd], cpu_env,
+                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fsub_h(DisasContext *ctx, arg_fsub_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fsub_h(cpu_fpr[a->rd], cpu_env,
+                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fmul_h(DisasContext *ctx, arg_fmul_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fmul_h(cpu_fpr[a->rd], cpu_env,
+                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fdiv_h(DisasContext *ctx, arg_fdiv_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fdiv_h(cpu_fpr[a->rd], cpu_env,
+                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fsqrt_h(DisasContext *ctx, arg_fsqrt_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fsqrt_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fmin_h(DisasContext *ctx, arg_fmin_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_helper_fmin_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                      cpu_fpr[a->rs2]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fmax_h(DisasContext *ctx, arg_fmax_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_helper_fmax_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                      cpu_fpr[a->rs2]);
+    mark_fs_dirty(ctx);
+    return true;
+}
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index b15ad394bb..bce91da11a 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -58,4 +58,20 @@ static inline float32 check_nanbox_s(uint64_t f)
     }
 }
 
+static inline uint64_t nanbox_h(float16 f)
+{
+    return f | MAKE_64BIT_MASK(16, 48);
+}
+
+static inline float16 check_nanbox_h(uint64_t f)
+{
+    uint64_t mask = MAKE_64BIT_MASK(16, 48);
+
+    if (likely((f & mask) == mask)) {
+        return (uint16_t)f;
+    } else {
+        return 0x7E00u; /* default qnan */
+    }
+}
+
 #endif
-- 
2.31.1


