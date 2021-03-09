Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD32332E3F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:27:09 +0100 (CET)
Received: from localhost ([::1]:58690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJh4W-0007BD-O7
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf8L-0000iW-Ah
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:58 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:45317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf81-0002sT-Kz
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:57 -0500
Received: by mail-ot1-x32b.google.com with SMTP id r24so5242110otp.12
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gp/V5Vy9Sz7v8gKnc23SVNqKOB8MLAcvhTvbwZmR4cw=;
 b=QjtuEqSlAxWuqa9Eru5+j3X3/uCBcKVXR8N0W5nUmfC77AX0WYnFs0rjxIu9Lpsxol
 nZ3QGzm9BsMQWnoILqgEUkWR7iSm2ZAFrTskYgCzbWT1UUoM7tYpnU/Gc89vp0DNJjNx
 mE11AQaEIznKY06yeMEKPjrLT9AD++1GF5zDwCaS3opkpnetyDOM1LmV6q8yAlzMWCZF
 WSH4Goe0QRiYewswc03bF0S+JORZbuuTi4G8V85gvnDsIQNwofUcmMdrDSVLPdV8eaek
 eop+rowTwtHimdqmATTzUsExyqiVIdV7fyAZON72mKBm4zD1zAEKkO2L/E8I6qjTXbXH
 9gRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gp/V5Vy9Sz7v8gKnc23SVNqKOB8MLAcvhTvbwZmR4cw=;
 b=QSNlBE+K3rIGT4ui6CQEv12g/EXAC9Z1GgwANYthg87ZzGOqslGC8wpHdXnoanCgMa
 oDe5mgVRZ2BrdkPFSUfn7boUQu2ldWgE7vNhvVMzuVEZoz6cbjqV9b2uR9llNc1LH/M6
 6TNQC4+0WHUQQvYcdDdlOECX5NWxBsJx+ad1TXp3tYqp+GxEhgX6RR2PxCMvpSQSHu2L
 nBxUuYch9ZkDthery6CbNQlz5mU20hTm0DoPxikXvsF9q5I9ME2reS3rYT0mbBRtAf1Q
 lMY/Yn4gldXY2vdgGnYYh3Da5F9ocGJrE+45lJcEaLVWboxX/cSyc1UfNP+o749XmLgA
 KD3A==
X-Gm-Message-State: AOAM530RCvteMTWHiWmLHyNtw7HBGNAc/EDr8PuA7g6Iv4VDXVjyWQ/S
 fHjxtnvbO/suwpbqr8zIGky3SebDTyAG3gHc
X-Google-Smtp-Source: ABdhPJzrd1tRCUXS6BijxdipJ7GYZsxD9tnYATDVDWb6kZRSpHsx72x2tLYmzm8EIWLY18fYb6dswA==
X-Received: by 2002:a9d:12a4:: with SMTP id g33mr24446868otg.308.1615306956664; 
 Tue, 09 Mar 2021 08:22:36 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:22:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 73/78] target/arm: Implement SVE2 LD1RO
Date: Tue,  9 Mar 2021 08:20:36 -0800
Message-Id: <20210309162041.23124-74-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  4 ++
 target/arm/translate-sve.c | 97 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 9ad017d4d1..f3b405b741 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1119,11 +1119,15 @@ LD_zpri         1010010 .. nreg:2 0.... 111 ... ..... .....     @rpri_load_msz
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
index 130abea7a5..58bebbfedd 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5637,6 +5637,103 @@ static bool trans_LD1RQ_zpri(DisasContext *s, arg_rpri_load *a)
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


