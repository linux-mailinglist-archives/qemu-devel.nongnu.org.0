Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25BF3702FD
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 23:31:46 +0200 (CEST)
Received: from localhost ([::1]:41706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcajh-0001iq-Fm
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 17:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZml-00051y-HF
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:51 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:45596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlx-0007nj-2y
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:51 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 gc22-20020a17090b3116b02901558435aec1so2375243pjb.4
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I+TBcwieytkPS2OYIsYtt2Bc7+CxcGyhXME8l9tBoxY=;
 b=turO+97EA0Uxp80NQc82rF2bja7TdY8v5e1KWIEUYF6qbzkt+a9vCsEDl5FrfqRPbp
 ILT883tYcTn6+1mCqE2rG6LAgF9vMHUX/eaby+Pgfd97g/ZGlZtuDqJ9dnfUTpJrGJHL
 NBcXTzdNJuHN7M1u+dHfVip4xpGXYPcH+SXV3WPAF2YO1KSgxjgS4rS4NvcFnkoq+py4
 4AueR3Gz2kWKnaxYmuhp0nGMjdy8G9a3WFxfBUNLIduKwaY2mGOC16mYhKf96/SV+daB
 JjZbTsXpJ/VTukLr15jjuLl9R9h1jjKzJn3OgVuwH/kVJKE21c9DCtLyolNWNAK1X/lD
 kCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I+TBcwieytkPS2OYIsYtt2Bc7+CxcGyhXME8l9tBoxY=;
 b=ctZxolPRidE4+ym1FWY284uzC8M7bIJFQX0YpZPVfoNx2Bt7HYZhw/YABkjVJmm9Qo
 YdQQgL7p8yrSmydwv4GpDizmtJ9r8xTgrqewCPFWauWiRVwazBQDLjSDh35s9deVO3cs
 9t0Ph5pyYLkgZ8Q5oVkhtyU9FyjlN/C4voGdq2uVGudNn3dBqDIl5vFG9tC5YfdaDG0e
 Eq9WAZVTXwZc6JA5swX344k/6Bz/R8FxlyfsRJDV7tflHbwryyCFQP5pwdS+xOa9yrmW
 e/MmEPca1ltFcK6nlNeWY+KRMszkTCC5vhgtQgWdkn0yOmi7GCObi7ZMM/MdSzp9SANy
 BvGQ==
X-Gm-Message-State: AOAM531fz5ENh2k+R1+vtgOgG7EeUyVJmrK/qeE6BitAhfs/EMzSWBD5
 r7WkNGMs4SfJSnjWXgL7OVOIOY/Mw07+Xg==
X-Google-Smtp-Source: ABdhPJz5B//I6KDYzzlzKXByR9+S2PsOp6FGEuuR6fRvsVv6u8qeIZ2VZDvVEePkENSVeX7OeUwLEg==
X-Received: by 2002:a17:903:3106:b029:e9:15e8:250e with SMTP id
 w6-20020a1709033106b02900e915e8250emr6933921plc.33.1619814594579; 
 Fri, 30 Apr 2021 13:29:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 70/82] target/arm: Implement SVE2 LD1RO
Date: Fri, 30 Apr 2021 13:25:58 -0700
Message-Id: <20210430202610.1136687-71-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  4 ++
 target/arm/translate-sve.c | 97 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 17adb393ff..df870ce23b 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1077,11 +1077,15 @@ LD_zpri         1010010 .. nreg:2 0.... 111 ... ..... .....     @rpri_load_msz
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
index ca393164bc..8a4eb8542f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5586,6 +5586,103 @@ static bool trans_LD1RQ_zpri(DisasContext *s, arg_rpri_load *a)
     return true;
 }
 
+static void do_ldro(DisasContext *s, int zt, int pg, TCGv_i64 addr, int dtype)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    unsigned vsz_r32;
+    TCGv_ptr t_pg;
+    TCGv_i32 t_desc;
+    int desc, poff, doff;
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
+    desc = simd_desc(32, 32, zt);
+    t_desc = tcg_const_i32(desc);
+
+    gen_helper_gvec_mem *fn
+        = ldr_fns[s->mte_active[0]][s->be_data == MO_BE][dtype][0];
+    fn(cpu_env, t_pg, addr, t_desc);
+
+    tcg_temp_free_ptr(t_pg);
+    tcg_temp_free_i32(t_desc);
+
+    /*
+     * Replicate that first octaword.
+     * The replication happens in units of 32; if the full vector size
+     * is not a multiple of 32, the final bits are zeroed.
+     */
+    doff = vec_full_reg_offset(s, zt);
+    vsz_r32 = QEMU_ALIGN_DOWN(vsz, 32);
+    if (vsz >= 64) {
+        tcg_gen_gvec_dup_mem(5, doff + 32, doff, vsz_r32 - 32, vsz - 32);
+    } else if (vsz > vsz_r32) {
+        /* Nop move, with side effect of clearing the tail. */
+        tcg_gen_gvec_mov(MO_64, doff, doff, vsz_r32, vsz);
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


