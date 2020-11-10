Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 657932ACE71
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 05:13:21 +0100 (CET)
Received: from localhost ([::1]:37912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcL20-0000Xy-EO
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 23:13:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=57671029a=alistair.francis@wdc.com>)
 id 1kcKy2-0004x4-P3
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 23:09:14 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:21667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=57671029a=alistair.francis@wdc.com>)
 id 1kcKxw-0000Tc-SD
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 23:09:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604981601; x=1636517601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hB8LiVky8fXRLaw0rj7s+UsoSXhMKe5Fs0cj5o5qqyk=;
 b=gxw32Lmyt6EGtXeCG7rJPo7ZpQN801OaJSUkmx310CJyL+o1OxOUXR/Y
 fvpecQyZ3376K2LnJ30irYD5Df9eeVvs9yD11+Abo9rCPpdEwQL0kPUd8
 8bgb3IhaOUuGKD52mpUxKNdRHFpujXOMYlD9UlP8Y61uR4AcJWosd9EWq
 8ErqKDBI7JZ65O5Ga35NVw+Re8MVNRuqefMuES+fo4+H9wTvIL+YNpWNf
 lB0xOWtOOwOrOX27/V0x+UyR1v9PscLQWnjMKHYx+lCXdXrQT3Um9RC+T
 UszwzkoiYtf1T9jff09V0kmopK/sU7FVxdO+mIA1CzTvMD8SUReonYfK4 A==;
IronPort-SDR: ozLrzY/CArZDeeb1ytsQGQ1pRq8g6DpsmZB657AxDu+JD9YMqnI7pUyqpXQPL3hp1sRtu37FNR
 P7O8R3GduUn3pksb9XJbV4yFtD89wEzYjISqtTAdEwqhyDJZUZbmsDG6rOwITFbj3fiOR0he0X
 jFESp7fY6b46/vcsFa33McLhDJuDbaZaKBDeyqXx50455SVceUu5itSXfBFkkSCrMvtMCF8JNH
 9dO7/VAeGEDOWrT66eVvyfw+9cBkh0we5FGkEDDkurJWI5Mt9zExL1imaj9/YvPdW1JZsNzWXa
 a+I=
X-IronPort-AV: E=Sophos;i="5.77,465,1596470400"; d="scan'208";a="255803603"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Nov 2020 12:13:09 +0800
IronPort-SDR: s4jv5fHuhbaL0eJSxenxI+eGEQKe9fBq1MIutuJtmvjiYJzYXT/HIc6QJD4cko2w72YcdbdCBw
 s3SLt/rQMTcP03+03kihrZqNvld/ZMqRq3+doq4XIevWAmE2mYBCMNmITShvn77TR6og/+zMFG
 3BtQakjIXVRCgdxfBLFIkRsTnRWL+glsy8zqshEIP1mh2DP/aknSVR4ZXbLbGOKATJENKrsKDQ
 TnULNsu6yIV4aRYztKGy9FOULin/20/LtnMkIPFcBPI7JSwP9DKGpFml6AbX8Y5nPaun3ehrN0
 ny+yFkIQNwy6sN4Arpx1sCDc
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 19:55:01 -0800
IronPort-SDR: BAjuFm0S5PmJX1vd0ExQpE4YH2W/JOlS8HLg2tYU+fouTaW++IapL8gmBTs8FbWzLOgN9ct3vj
 wvVwa+P6KvE6fDXO8rgtYjxbbVnYArPdbmtV2PGYDdvj+gToDR+jqOWWYrhsjjXhT2egAXkuEe
 gltUyHObjdD2JCClGs3Jn9e9kkDbq9MJLzN9fZQyAMoc8c1omV/585zfn3qhIp6JyZB3axyczd
 N0uUvcohr+ZzhF0N3UH4yqzzfGhD9nL/lVOQya8935WYEO775h4nnEBxdn4Mp1wyr6Rihp4Qet
 FO4=
WDCIronportException: Internal
Received: from usa001882.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.60.209])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Nov 2020 20:09:00 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 5/6] target/riscv: Split the Hypervisor execute load helpers
Date: Mon,  9 Nov 2020 19:57:02 -0800
Message-Id: <20201110035703.83786-6-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201110035703.83786-1-alistair.francis@wdc.com>
References: <20201110035703.83786-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=57671029a=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 23:09:00
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split the hypervisor execute load functions into two seperate functions.
This avoids us having to pass the memop to the C helper functions.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 5b1550f0faa3c435cc77f3c1ae811dea98ab9e36.1604464950.git.alistair.francis@wdc.com
---
 target/riscv/helper.h                   |  3 ++-
 target/riscv/op_helper.c                | 36 +++++++------------------
 target/riscv/insn_trans/trans_rvh.c.inc | 20 +++++---------
 3 files changed, 17 insertions(+), 42 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index ee35311052..939731c345 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -81,7 +81,8 @@ DEF_HELPER_1(tlb_flush, void, env)
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_1(hyp_tlb_flush, void, env)
 DEF_HELPER_1(hyp_gvma_tlb_flush, void, env)
-DEF_HELPER_4(hyp_x_load, tl, env, tl, tl, tl)
+DEF_HELPER_2(hyp_hlvx_hu, tl, env, tl)
+DEF_HELPER_2(hyp_hlvx_wu, tl, env, tl)
 #endif
 
 /* Vector functions */
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 980d4f39e1..d55def76cf 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -227,36 +227,18 @@ void helper_hyp_gvma_tlb_flush(CPURISCVState *env)
     helper_hyp_tlb_flush(env);
 }
 
-target_ulong helper_hyp_x_load(CPURISCVState *env, target_ulong address,
-                               target_ulong attrs, target_ulong memop)
+target_ulong helper_hyp_hlvx_hu(CPURISCVState *env, target_ulong address)
 {
-    if (env->priv == PRV_M ||
-        (env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
-        (env->priv == PRV_U && !riscv_cpu_virt_enabled(env) &&
-            get_field(env->hstatus, HSTATUS_HU))) {
-        target_ulong pte;
-        int mmu_idx = cpu_mmu_index(env, false) | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
-
-        switch (memop) {
-        case MO_TEUW:
-            pte = cpu_lduw_mmuidx_ra(env, address, mmu_idx, GETPC());
-            break;
-        case MO_TEUL:
-            pte = cpu_ldl_mmuidx_ra(env, address, mmu_idx, GETPC());
-            break;
-        default:
-            g_assert_not_reached();
-        }
+    int mmu_idx = cpu_mmu_index(env, true) | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
 
-        return pte;
-    }
+    return cpu_lduw_mmuidx_ra(env, address, mmu_idx, GETPC());
+}
 
-    if (riscv_cpu_virt_enabled(env)) {
-        riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
-    } else {
-        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
-    }
-    return 0;
+target_ulong helper_hyp_hlvx_wu(CPURISCVState *env, target_ulong address)
+{
+    int mmu_idx = cpu_mmu_index(env, true) | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+
+    return cpu_ldl_mmuidx_ra(env, address, mmu_idx, GETPC());
 }
 
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_trans/trans_rvh.c.inc
index cc197e7186..ce7ed5affb 100644
--- a/target/riscv/insn_trans/trans_rvh.c.inc
+++ b/target/riscv/insn_trans/trans_rvh.c.inc
@@ -277,20 +277,16 @@ static bool trans_hlvx_hu(DisasContext *ctx, arg_hlvx_hu *a)
 #ifndef CONFIG_USER_ONLY
     TCGv t0 = tcg_temp_new();
     TCGv t1 = tcg_temp_new();
-    TCGv mem_idx = tcg_temp_new();
-    TCGv memop = tcg_temp_new();
+
+    check_access(ctx);
 
     gen_get_gpr(t0, a->rs1);
-    tcg_gen_movi_tl(mem_idx, ctx->mem_idx);
-    tcg_gen_movi_tl(memop, MO_TEUW);
 
-    gen_helper_hyp_x_load(t1, cpu_env, t0, mem_idx, memop);
+    gen_helper_hyp_hlvx_hu(t1, cpu_env, t0);
     gen_set_gpr(a->rd, t1);
 
     tcg_temp_free(t0);
     tcg_temp_free(t1);
-    tcg_temp_free(mem_idx);
-    tcg_temp_free(memop);
     return true;
 #else
     return false;
@@ -303,20 +299,16 @@ static bool trans_hlvx_wu(DisasContext *ctx, arg_hlvx_wu *a)
 #ifndef CONFIG_USER_ONLY
     TCGv t0 = tcg_temp_new();
     TCGv t1 = tcg_temp_new();
-    TCGv mem_idx = tcg_temp_new();
-    TCGv memop = tcg_temp_new();
+
+    check_access(ctx);
 
     gen_get_gpr(t0, a->rs1);
-    tcg_gen_movi_tl(mem_idx, ctx->mem_idx);
-    tcg_gen_movi_tl(memop, MO_TEUL);
 
-    gen_helper_hyp_x_load(t1, cpu_env, t0, mem_idx, memop);
+    gen_helper_hyp_hlvx_wu(t1, cpu_env, t0);
     gen_set_gpr(a->rd, t1);
 
     tcg_temp_free(t0);
     tcg_temp_free(t1);
-    tcg_temp_free(mem_idx);
-    tcg_temp_free(memop);
     return true;
 #else
     return false;
-- 
2.29.2


