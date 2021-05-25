Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1616E3906A3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:28:00 +0200 (CEST)
Received: from localhost ([::1]:55640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZuR-0003rB-4f
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYet-0002dI-07
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:51 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYen-00071S-TB
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:50 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 f20-20020a05600c4e94b0290181f6edda88so6769285wmq.2
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BUia9A7YbDIInK6F5M3GCkhRZMdpMIlYI0Wt/pwCN6c=;
 b=jogAboiWB+Y5VzGYErSI42Zao9yz1SdECYfs1yanG9ivX4jkdOi4AlNeeemihkaOuN
 vseS8Gy4pEFK8tPT5BzBpfi0imLyNC5dp1DIENYMR6Z1WCSITAtcIkC8jq+AZf82vajL
 +O6jDeOnCCjY9gkgGXonTzc5dXz890Yqb/qB+qLyovXVogKqylEQJki7W4KDi95Cr3jZ
 NIDnVZuBUrwmF0drh3yqEspTM/LHkWLfJVLJHBP+rAGc1tH6CAWgxvXNC8SLKsq3FUsH
 gESgW5zDLDfSUwqypp0XVo3WZY5xU5YEmvZWO2osZxerfuPTBDt1Qhfe3iBDRl0c8Hjd
 kP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BUia9A7YbDIInK6F5M3GCkhRZMdpMIlYI0Wt/pwCN6c=;
 b=rrcp0I9KaZnTK+bkqDNpC8Lx0Rvu8KX3fXhv95a6jZ3plD1/JyMDq/hfjeBDCJyyez
 kMDXciNWz0HWV3+Bjyv8bHMtvW22ZRZm4XrCKx0o4ZVsUrhhLHkiaMKmFf7zBMdzCaOr
 yYT99mwM2LGWR/FlSpPv3UF/959vbge/2TeNWRJ7z8/3yjupc+bibKvdPposePuhDdY4
 DGuty8sXruujG2J9GqY0drhAPadVtwYJLIcdiW0rcjsRK9DtcB+ug0QHadyFenVkp89e
 v8Te+LA1RFhdHP1ZdPNItv2GydYVydN1a09SUcAJUiByf4tlXXJa7fHgnV/HJ5bn/jNl
 axjA==
X-Gm-Message-State: AOAM532FtxEJoQ3XnbX7Bxng16iim8H8GhsJQG5tQFminF1S+/RAnPQD
 UQDxsGxXZ00mEG7tROlG7V1Rr0+14UA2TxgA
X-Google-Smtp-Source: ABdhPJwkhHyvZc1g6i+jdOh7Hbau+ebzoeFqlG+1HYQTgPSFbDWA1D8LKQsfP57JsxxKLpdlrMaOYg==
X-Received: by 2002:a1c:a5c3:: with SMTP id o186mr24389150wme.6.1621955264424; 
 Tue, 25 May 2021 08:07:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a11sm16643357wrr.48.2021.05.25.08.07.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 100/114] target/arm: Implement SVE2 LD1RO
Date: Tue, 25 May 2021 16:07:22 +0100
Message-Id: <20210525150736.32695-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150736.32695-1-peter.maydell@linaro.org>
References: <20210525150736.32695-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-79-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve.decode      |  4 ++
 target/arm/translate-sve.c | 93 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 5a1cceccb60..884c5358eb1 100644
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
index a213450583b..1dcdbac0af0 100644
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
2.20.1


