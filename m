Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C822B362AB9
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 00:06:59 +0200 (CEST)
Received: from localhost ([::1]:33688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXWc6-0008B0-Sz
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 18:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdq-0006aG-6h
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:42 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:39692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdV-0001mL-Ua
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:41 -0400
Received: by mail-pf1-x436.google.com with SMTP id c17so19148060pfn.6
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EnSyPCZmyd4z3y6dSeIzgcP6+JdzBQ6BgXyeRXzNj2k=;
 b=XDNKqLCXgaWN9hVZRw4eOItipgPOL+l5D2RKjGcPFUTgyDk7z6jcQ5ktHKnIhLIe1u
 sWnIYWMhADRyMwox5iU22xVDz78rrHrny/9HrEII8nWUvFBIFxU89O9PU0m5wqkNTI/a
 V6kP9apnS6cwPjmJ7Ff3c418p6LdVLW3wSpNLB5fel4V5CEhjLmj/36+0I5bPHIb6EgQ
 tQKDDGJwGMvsZ5TjAms9XNKGXJ8W064ex5Yq4v7CzcJHSuHAIvEptNw16fbstOeJiKdG
 Im5Ylfrdru08Qxp9FvkPwARVXagByHpTs+lzOHjynN0lHEQFwc9Q1XPRCbNCfkCh6v38
 jkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EnSyPCZmyd4z3y6dSeIzgcP6+JdzBQ6BgXyeRXzNj2k=;
 b=cTixCkWW3fcuZKEjMSeVC62d9AOQXiGXK4+HzdU875rrygDMwD8ecJe3Jf4yF4Eop5
 bnvPKLSivYGzWhjdDRdBNpmvD7itFd1qN3rhgqfRDKvbe9c8nLmoN+YSK2Y+ilNrQ54x
 +eqIgVU3ymtMMTA+qjule9GkOxrF8e+ORe9+3ikaF86JuILqYgECuXDaCNmvl9hC8Rnn
 vXEiMvWfIE9DcjcwvkRSVTtEh5+KlPHROj+5oA8gFnxCPaTQ2Q3XH66RR/CwgMah5mjL
 vny/fO1VGzqzkQNtZ1s2Zz6Un4abYlEQpZitMCJsRZXK6DPPK/KxNSZL5pFQgD/gmPEL
 bH9Q==
X-Gm-Message-State: AOAM5336X3HoQT/Dnn8KFx41x9/gFlo3fUTZYaYpNHnXA+Rtovm8Go7t
 sDKGYUt4yPj9frG+VccHERGClmgDQ/1XOg==
X-Google-Smtp-Source: ABdhPJzDDXCbsa4HfslnoM8NZvnFRO/2QqyGjt8ANkayfb/7Wc2+XSRTruR1BZnKYwiQsiK34q/jBw==
X-Received: by 2002:a63:d755:: with SMTP id w21mr867382pgi.400.1618607060694; 
 Fri, 16 Apr 2021 14:04:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 70/81] target/arm: Implement SVE2 LD1RO
Date: Fri, 16 Apr 2021 14:02:29 -0700
Message-Id: <20210416210240.1591291-71-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
index 04efa037f2..1cc98a1447 100644
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
+    if (!dc_isar_feature(aa64_sve2_f64mm, s)) {
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
+    if (!dc_isar_feature(aa64_sve2_f64mm, s)) {
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


