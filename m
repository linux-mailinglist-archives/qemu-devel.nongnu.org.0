Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AB538F7D2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:01:53 +0200 (CEST)
Received: from localhost ([::1]:35160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMOG-0005bE-QK
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:01:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYi-0001PI-JJ
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:36 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:39923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXx-0004Aw-2q
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:36 -0400
Received: by mail-pl1-x62f.google.com with SMTP id t9so7067083ply.6
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MRoEXb+hFWdGI7cAvPOu5pferN66dwnHaCJBRFHxmfQ=;
 b=ZV/mlyKxFNjR8eNHKEzeYJ/cJAALbFsRDP3IS8GLYWjyUXZTVfh6Ltd9k5tMZ/nbrL
 pBb9wZ2M2B7hvLP6pTtCYuEv/pl57D+V+Yxt2kqoQYbuJcrFl+bwd/QP0GrcqdZpVQ+/
 XjRvu1zk9h/o8omAh8Tr94DZBXg8NCK2u3qHPh+aBrGd8dg5ekwLn2Z4q1JFbccP8PeH
 zgRQ59LpDP5Ng22tu7NUgP3+tzjhXZQ+WOhiyJ2Vv0sJ3+nlnLNUCu69YoWoIlSRQxT0
 FSc8hDVLz+e+1wfxuYSDFPtK7lXKmnjXNuUZIRDCdwRSEmn9M7ZzZICQjSOel6kuLdya
 tLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MRoEXb+hFWdGI7cAvPOu5pferN66dwnHaCJBRFHxmfQ=;
 b=dAfWi3jL1v2eDqL8yTZRskDS9fPLSVKz+JcR90b9fUj1cihF4PbHiec8Iq77EgNc5R
 EHZm6cpo5yqBlWw9Oxp2cbyi8KZyK5j736ybCZNfR13wOLSBUNA4aO98uLfhzEStf2FM
 lfNcrOnN2Mi99BuwG/qM52ABZwl2i6q2PYiw1LAA5OaWcGvfaR32voDa0ml9KQ36Q9Cc
 51A8dOCqYV5ikoOztfdvnhc82l/GiJXHGc1EJ6l9qXe6s/BKmweMD5mnCQ2hbIMADw+F
 JZtkGogIcX7RfAIE8eKLnG1yR5GWew7Inkk4KLl1zYhI3qGsSrg3tqLFOrodoNPsj7ci
 +zcQ==
X-Gm-Message-State: AOAM530J7Uou5Wz0IrPJIJ/KvJkgRqpM5O/K9jYPtxC2cQrsKl9oKr/A
 1qmUu+iyzRuLX3uzw7blzEv19fk9Erce/Q==
X-Google-Smtp-Source: ABdhPJwQDPwKT5S0a8lZQh8JjW5HGAMjiqm7+qJZ1k114pgluSG+CkMt8GNf/RZ8v5Ho8mBVrJBTmA==
X-Received: by 2002:a17:90a:a013:: with SMTP id
 q19mr1988242pjp.29.1621904867453; 
 Mon, 24 May 2021 18:07:47 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 78/92] target/arm: Implement SVE2 LD1RO
Date: Mon, 24 May 2021 18:03:44 -0700
Message-Id: <20210525010358.152808-79-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v7: Fix replication and tail clearing vs e2e7168a214.
---
 target/arm/sve.decode      |  4 ++
 target/arm/translate-sve.c | 93 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 5a1cceccb6..884c5358eb 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1126,11 +1126,15 @@ LD_zpri         1010010 .. nreg:2 0.... 111 ... ..... .....     @rpri_load_msz
 # SVE load and broadcast quadword (scalar plus scalar)
 LD1RQ_zprr      1010010 .. 00 ..... 000 ... ..... ..... \
                 @rprr_load_msz nreg=0
+LD1RO_zprr      1010010 .. 01 ..... 000 ... ..... ..... \
+                @rprr_load_msz nreg=0
 
 # SVE load and broadcast quadword (scalar plus immediate)
 # LD1RQB, LD1RQH, LD1RQS, LD1RQD
 LD1RQ_zpri      1010010 .. 00 0.... 001 ... ..... ..... \
                 @rpri_load_msz nreg=0
+LD1RO_zpri      1010010 .. 01 0.... 001 ... ..... ..... \
+                @rpri_load_msz nreg=0
 
 # SVE 32-bit gather prefetch (scalar plus 32-bit scaled offsets)
 PRF             1000010 00 -1 ----- 0-- --- ----- 0 ----
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index a213450583..1dcdbac0af 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5643,6 +5643,99 @@ static bool trans_LD1RQ_zpri(DisasContext *s, arg_rpri_load *a)
     return true;
 }
 
+static void do_ldro(DisasContext *s, int zt, int pg, TCGv_i64 addr, int dtype)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    unsigned vsz_r32;
+    TCGv_ptr t_pg;
+    int poff, doff;
+
+    if (vsz < 32) {
+        /*
+         * Note that this UNDEFINED check comes after CheckSVEEnabled()
+         * in the ARM pseudocode, which is the sve_access_check() done
+         * in our caller.  We should not now return false from the caller.
+         */
+        unallocated_encoding(s);
+        return;
+    }
+
+    /* Load the first octaword using the normal predicated load helpers.  */
+
+    poff = pred_full_reg_offset(s, pg);
+    if (vsz > 32) {
+        /*
+         * Zero-extend the first 32 bits of the predicate into a temporary.
+         * This avoids triggering an assert making sure we don't have bits
+         * set within a predicate beyond VQ, but we have lowered VQ to 2
+         * for this load operation.
+         */
+        TCGv_i64 tmp = tcg_temp_new_i64();
+#ifdef HOST_WORDS_BIGENDIAN
+        poff += 4;
+#endif
+        tcg_gen_ld32u_i64(tmp, cpu_env, poff);
+
+        poff = offsetof(CPUARMState, vfp.preg_tmp);
+        tcg_gen_st_i64(tmp, cpu_env, poff);
+        tcg_temp_free_i64(tmp);
+    }
+
+    t_pg = tcg_temp_new_ptr();
+    tcg_gen_addi_ptr(t_pg, cpu_env, poff);
+
+    gen_helper_gvec_mem *fn
+        = ldr_fns[s->mte_active[0]][s->be_data == MO_BE][dtype][0];
+    fn(cpu_env, t_pg, addr, tcg_constant_i32(simd_desc(32, 32, zt)));
+
+    tcg_temp_free_ptr(t_pg);
+
+    /*
+     * Replicate that first octaword.
+     * The replication happens in units of 32; if the full vector size
+     * is not a multiple of 32, the final bits are zeroed.
+     */
+    doff = vec_full_reg_offset(s, zt);
+    vsz_r32 = QEMU_ALIGN_DOWN(vsz, 32);
+    if (vsz >= 64) {
+        tcg_gen_gvec_dup_mem(5, doff + 32, doff, vsz_r32 - 32, vsz_r32 - 32);
+    }
+    vsz -= vsz_r32;
+    if (vsz) {
+        tcg_gen_gvec_dup_imm(MO_64, doff + vsz_r32, vsz, vsz, 0);
+    }
+}
+
+static bool trans_LD1RO_zprr(DisasContext *s, arg_rprr_load *a)
+{
+    if (!dc_isar_feature(aa64_sve_f64mm, s)) {
+        return false;
+    }
+    if (a->rm == 31) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        TCGv_i64 addr = new_tmp_a64(s);
+        tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), dtype_msz(a->dtype));
+        tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rn));
+        do_ldro(s, a->rd, a->pg, addr, a->dtype);
+    }
+    return true;
+}
+
+static bool trans_LD1RO_zpri(DisasContext *s, arg_rpri_load *a)
+{
+    if (!dc_isar_feature(aa64_sve_f64mm, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        TCGv_i64 addr = new_tmp_a64(s);
+        tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn), a->imm * 32);
+        do_ldro(s, a->rd, a->pg, addr, a->dtype);
+    }
+    return true;
+}
+
 /* Load and broadcast element.  */
 static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
 {
-- 
2.25.1


