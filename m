Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF714343B6
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 05:09:49 +0200 (CEST)
Received: from localhost ([::1]:35340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md1zA-0003b9-I3
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 23:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1md1wo-00012f-PO
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 23:07:22 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:33354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1md1wn-0002kn-1M
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 23:07:22 -0400
Received: by mail-pf1-x42f.google.com with SMTP id t184so1742479pfd.0
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 20:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M5vEMQGDqblhYgmy1vz7iClbz4LBBMSFnyykkZsgWE8=;
 b=BZxmz8tEeSqPg1G2KR3aNsehJ0PWVS42LftN4vqyyB8NCKIP8SdO7vzl7bho94p3n8
 bTgs+VeB2YUMj44DWhE8SRg0wBvw42UgV3oRQWmcF4PWMIJbqyGiQa8iLpjwxBPu2IX/
 ioXgQNcGQWWGmEkI2AEnAX0oONr6SF/hWdfxPuW3THN9u19TI17p7SBy3wEAigqDxmnX
 Z9J4EC12QtWA4OaMUwD6d41thRLMdbAkC9zzrluFvFyI8LcJF5UITJo5wci3qgrkiTya
 gRT14/utFgWFCkg9cmpe+fNm6U8zuu15cqAkKm9JW4sxAWuUj7iubTQYHChai0+UnoFU
 zKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M5vEMQGDqblhYgmy1vz7iClbz4LBBMSFnyykkZsgWE8=;
 b=FdsBSUq0A6kq3HlHo38gU6/4dGcXDQqtFJz1Xs26rJXhFPu2+ZLL/DLpIi/hf/hsS1
 sWvDt1armGm6XmdO7ro6FWb1Fx4hrtW0TlrrR2ZjPdr2cgANyH3zN8iwg/npBiGX0uOE
 xpZwFafjLgdhwBx6p0fouXqRWR4bs0D2/jxUz46XPj3BNsLkGiFSYftOOEal1uezH3Xo
 HT7IfOHO7uOlTc/MHU3eUXDk8QkV9Tuj9RagAKaEwLHthaSo1HH/P0LZtFipAlNqm4wx
 Nm13bDeAV0//lL3LQON6BJ60g9Iy3eTYLm8elpLm0oMZmqvH8ibZl52kLUeMWdqWm924
 +wdQ==
X-Gm-Message-State: AOAM533PErjKNS1CW3jJc5ls9h2tRy85hgiwMKTMdhMzmp9mpHYRky/L
 PSL41e2mCROLDFefH3bxywVIdw==
X-Google-Smtp-Source: ABdhPJwmi7nW32rsHuGa1TYJeazTms6wWO8I34WEK+hvzl4IgKRzKhTvWxtENMirvuQSx5kLoRtXdg==
X-Received: by 2002:a62:2c82:0:b0:44d:71c3:8a3 with SMTP id
 s124-20020a622c82000000b0044d71c308a3mr3774446pfs.84.1634699239604; 
 Tue, 19 Oct 2021 20:07:19 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id y18sm574443pfb.106.2021.10.19.20.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 20:07:19 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-riscv@nongnu.org
Subject: [PATCH v4 4/8] target/riscv: zfh: half-precision floating-point
 compare
Date: Wed, 20 Oct 2021 11:06:47 +0800
Message-Id: <20211020030653.213565-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020030653.213565-1-frank.chang@sifive.com>
References: <20211020030653.213565-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42f.google.com
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/fpu_helper.c                 | 21 +++++++++++++
 target/riscv/helper.h                     |  3 ++
 target/riscv/insn32.decode                |  3 ++
 target/riscv/insn_trans/trans_rvzfh.c.inc | 37 +++++++++++++++++++++++
 4 files changed, 64 insertions(+)

diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 2ed9b03193c..ec2009ee65b 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -461,6 +461,27 @@ uint64_t helper_fsqrt_h(CPURISCVState *env, uint64_t rs1)
     return nanbox_h(float16_sqrt(frs1, &env->fp_status));
 }
 
+target_ulong helper_fle_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    float16 frs2 = check_nanbox_h(rs2);
+    return float16_le(frs1, frs2, &env->fp_status);
+}
+
+target_ulong helper_flt_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    float16 frs2 = check_nanbox_h(rs2);
+    return float16_lt(frs1, frs2, &env->fp_status);
+}
+
+target_ulong helper_feq_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    float16 frs2 = check_nanbox_h(rs2);
+    return float16_eq_quiet(frs1, frs2, &env->fp_status);
+}
+
 target_ulong helper_fcvt_w_h(CPURISCVState *env, uint64_t rs1)
 {
     float16 frs1 = check_nanbox_h(rs1);
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index b50672d1684..9c89521d4ad 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -74,6 +74,9 @@ DEF_HELPER_FLAGS_3(fdiv_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(fmin_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(fmax_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_2(fsqrt_h, TCG_CALL_NO_RWG, i64, env, i64)
+DEF_HELPER_FLAGS_3(fle_h, TCG_CALL_NO_RWG, tl, env, i64, i64)
+DEF_HELPER_FLAGS_3(flt_h, TCG_CALL_NO_RWG, tl, env, i64, i64)
+DEF_HELPER_FLAGS_3(feq_h, TCG_CALL_NO_RWG, tl, env, i64, i64)
 DEF_HELPER_FLAGS_2(fcvt_s_h, TCG_CALL_NO_RWG, i64, env, i64)
 DEF_HELPER_FLAGS_2(fcvt_h_s, TCG_CALL_NO_RWG, i64, env, i64)
 DEF_HELPER_FLAGS_2(fcvt_d_h, TCG_CALL_NO_RWG, i64, env, i64)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index ba40f3e7f89..3906c9fb201 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -751,6 +751,9 @@ fcvt_d_h   0100001  00010 ..... ... ..... 1010011 @r2_rm
 fcvt_w_h   1100010  00000 ..... ... ..... 1010011 @r2_rm
 fcvt_wu_h  1100010  00001 ..... ... ..... 1010011 @r2_rm
 fmv_x_h    1110010  00000 ..... 000 ..... 1010011 @r2
+feq_h      1010010  ..... ..... 010 ..... 1010011 @r
+flt_h      1010010  ..... ..... 001 ..... 1010011 @r
+fle_h      1010010  ..... ..... 000 ..... 1010011 @r
 fcvt_h_w   1101010  00000 ..... ... ..... 1010011 @r2_rm
 fcvt_h_wu  1101010  00001 ..... ... ..... 1010011 @r2_rm
 fmv_h_x    1111010  00000 ..... 000 ..... 1010011 @r2
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index d1250257666..8d0959a6671 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -335,6 +335,43 @@ static bool trans_fcvt_h_d(DisasContext *ctx, arg_fcvt_h_d *a)
     return true;
 }
 
+static bool trans_feq_h(DisasContext *ctx, arg_feq_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+
+    gen_helper_feq_h(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_flt_h(DisasContext *ctx, arg_flt_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+
+    gen_helper_flt_h(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool trans_fle_h(DisasContext *ctx, arg_fle_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+
+    gen_helper_fle_h(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
 static bool trans_fcvt_w_h(DisasContext *ctx, arg_fcvt_w_h *a)
 {
     REQUIRE_FPU;
-- 
2.25.1


