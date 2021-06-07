Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC0139E4CB
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:06:36 +0200 (CEST)
Received: from localhost ([::1]:51268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqIhv-00005k-9v
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIa5-0006vs-Jm
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:58:29 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIa3-0007qc-7X
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:58:29 -0400
Received: by mail-wr1-x431.google.com with SMTP id f2so18390601wri.11
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CIujDDcNE7g7Qj8fbS4YkgLm8m2I7lwGWPWf6+KDpnk=;
 b=x8Qc1BMwrOmydxqbBntBqF2ycgQMPCSpfI2fmXOOit4XEzc0qYIykTOjKCM8jWwWap
 UJ2g4bjYQRJ95TXN1BBsY4HFAKQ1X+Z5IobV77bZKoiJ61bAmxHhSwPI1Xi/REWeaRzd
 XNYG4xqZXso+SehdVME1Rx+tf4alc6rbfMfnwLSe0Wpnff5qPt+kIONJW6u8ruLq4D5+
 USYlbx9Mgc9LhEVb3wn9I6hCNelyrWl/DqKheSeh1aAGsOlN8CyqK0UQNptZRbvL3uLS
 bpw4R/8Ap0VNDTcTeCK8r5ZhUCKdT0LowWPbzw2ueo8xXP7QUThE3boOYD/ngx3Htahw
 vdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CIujDDcNE7g7Qj8fbS4YkgLm8m2I7lwGWPWf6+KDpnk=;
 b=SDLZ4G8X1s+ncP5iJ8c9Gc/SbNvhsbMBg9O7TBQN/SigMjA1k0NDNpaJJyPwYiJwTU
 YcVkYdzO7NLXnSc9PPfiMGppgDJHw7qHSs6/aafiZMTVJqPIg7ZFrkRNESC5iOlAVfd/
 BAwSPCiaZm46Or5cT8bIgU8wc7GT93RpQbA6cn+1+bi0diLSeiYtbg6I2RQ6sOrW/pKB
 1a5FF5siHOfj7wIaYd/msoNfMuwGMUzXIlhhGNe8oeBBc/RKtgGSOOcbiYhDmKaXF89I
 gfegfSyd3W4kFiiGEFQfkX/o5Mqg2DstboeDoj5navml646sXochkqm40rMTNq4yex9X
 yZdQ==
X-Gm-Message-State: AOAM530Zeu3Nfq7lPOIAdfofd/666mfC2er3FM3Y96UqXewkIZWnL6Zu
 VufHmERGy1h7vvu6eZCUIOnCfbTaMNbjU0xO
X-Google-Smtp-Source: ABdhPJzimc4ILLc97koVNzWXNuc3E0+dB8OTDNZVk1x54C4zJkiA71s9/kKl1izNAOhv6WauZov7yg==
X-Received: by 2002:a5d:5243:: with SMTP id k3mr18357427wrc.19.1623085105917; 
 Mon, 07 Jun 2021 09:58:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/55] target/arm: Enable FPSCR.QC bit for MVE
Date: Mon,  7 Jun 2021 17:57:28 +0100
Message-Id: <20210607165821.9892-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MVE has an FPSCR.QC bit similar to the A-profile Neon one; when MVE
is implemented make the bit writeable, both in the generic "load and
store FPSCR" helper functions and in the code for handling the NZCVQC
sysreg which we had previously left as "TODO when we implement MVE".

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.c | 32 +++++++++++++++++++++++---------
 target/arm/vfp_helper.c    |  3 ++-
 2 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index d01e465821b..22a619eb2c5 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -784,10 +784,19 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
     {
         TCGv_i32 fpscr;
         tmp = loadfn(s, opaque);
-        /*
-         * TODO: when we implement MVE, write the QC bit.
-         * For non-MVE, QC is RES0.
-         */
+        if (dc_isar_feature(aa32_mve, s)) {
+            /* QC is only present for MVE; otherwise RES0 */
+            TCGv_i32 qc = tcg_temp_new_i32();
+            TCGv_i32 zero;
+            tcg_gen_andi_i32(qc, tmp, FPCR_QC);
+            store_cpu_field(qc, vfp.qc[0]);
+            zero = tcg_const_i32(0);
+            store_cpu_field(zero, vfp.qc[1]);
+            zero = tcg_const_i32(0);
+            store_cpu_field(zero, vfp.qc[2]);
+            zero = tcg_const_i32(0);
+            store_cpu_field(zero, vfp.qc[3]);
+        }
         tcg_gen_andi_i32(tmp, tmp, FPCR_NZCV_MASK);
         fpscr = load_cpu_field(vfp.xregs[ARM_VFP_FPSCR]);
         tcg_gen_andi_i32(fpscr, fpscr, ~FPCR_NZCV_MASK);
@@ -869,6 +878,11 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         break;
     }
 
+    if (regno == ARM_VFP_FPSCR_NZCVQC && !dc_isar_feature(aa32_mve, s)) {
+        /* QC is RES0 without MVE, so NZCVQC simplifies to NZCV */
+        regno = QEMU_VFP_FPSCR_NZCV;
+    }
+
     switch (regno) {
     case ARM_VFP_FPSCR:
         tmp = tcg_temp_new_i32();
@@ -876,11 +890,11 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         storefn(s, opaque, tmp);
         break;
     case ARM_VFP_FPSCR_NZCVQC:
-        /*
-         * TODO: MVE has a QC bit, which we probably won't store
-         * in the xregs[] field. For non-MVE, where QC is RES0,
-         * we can just fall through to the FPSCR_NZCV case.
-         */
+        tmp = tcg_temp_new_i32();
+        gen_helper_vfp_get_fpscr(tmp, cpu_env);
+        tcg_gen_andi_i32(tmp, tmp, FPCR_NZCVQC_MASK);
+        storefn(s, opaque, tmp);
+        break;
     case QEMU_VFP_FPSCR_NZCV:
         /*
          * Read just NZCV; this is a special case to avoid the
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 496f0034772..8a716600592 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -220,7 +220,8 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
                                      FPCR_LTPSIZE_LENGTH);
     }
 
-    if (arm_feature(env, ARM_FEATURE_NEON)) {
+    if (arm_feature(env, ARM_FEATURE_NEON) ||
+        cpu_isar_feature(aa32_mve, cpu)) {
         /*
          * The bit we set within fpscr_q is arbitrary; the register as a
          * whole being zero/non-zero is what counts.
-- 
2.20.1


