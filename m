Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA440681923
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 19:29:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMYqK-00016i-UW; Mon, 30 Jan 2023 13:25:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqB-00010w-Lv
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:25:16 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYq5-0008P7-QT
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:25:15 -0500
Received: by mail-wr1-x42b.google.com with SMTP id d14so11975366wrr.9
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 10:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uUpOqstoH60mQhVzBpZ4GM1GT3DjE6YD5hOQtGdm25E=;
 b=TuoPWIPX4hDhIhXa97+MR3D8H6w+92wmcxvxsZ+BzOlomH+QxPJGtCQp9Np+zTafZI
 QnWQycoAZ37xS8FVQYMUrbKUMOySC2q7CCArDurmpmrWnWoDrjo0yNRODQ90dVpSNKOy
 dgR1/t4GBlSHoD3hmGJp4YvY1iCqTbHvohnBR6z6NUQekr9kp68zIhevKM3txMe6xOAa
 WzIAfN3RdSTX9ietsZFSwlpbNFp0ZDl+aCCtLeVgQmk6kbVt3ZpKfzMAL8NduyZJu8fF
 cTe58caNvsXvX3fLM+0OtHbHZxHyP6yhHybIjRnVI/n6Mhn1nMFRgPSBHULnmY/uyFC3
 NDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uUpOqstoH60mQhVzBpZ4GM1GT3DjE6YD5hOQtGdm25E=;
 b=rxbPeAgC6DIJCdxxGa8stnxqawfRLMf8ExRPMCMyC0KHwZqiRqhWB2Q7OA+nlXgg0j
 e1iEYNMws6kLms9BedBnvQ6DZuOiFR4Y1lpXli50TcA9lua/pNMU/SgAghVDjDk3K6oP
 k5Kf3wVHK1jZkvbIrYM2pG6IQTUJFc42So/Rzrc/HyO2KiX/69oz8qdnoyQJ+mV1wQCR
 UyCF+JOBO5HQVM5fuVvG1kMIAqqyktdTRRMxiNE3LQiMTLyYYUX5X65hpn9k2oNw2WlV
 S5iTMEaecW/gOZEO8zYtalNtedXCtTIKiqtpcXAiMv7CPYGTIEUKRmHEVbwUpqhG1iwE
 Ry5w==
X-Gm-Message-State: AFqh2krQSMU/sbnzF3Q5B546vEDJkO6uf5PkzoEkFxa333NeSOgn+pdE
 OpFja7OhQ09kMB7K9+MJw2MUAg==
X-Google-Smtp-Source: AMrXdXvkXR2iepqnLdu/EYN59WDNQOyaXWMbg/3j/xhqTsHDQNXZ+TZNYE6knr469MV0RWvZxOp5Gg==
X-Received: by 2002:a5d:4e01:0:b0:2bd:e531:8e58 with SMTP id
 p1-20020a5d4e01000000b002bde5318e58mr42153976wrt.24.1675103107567; 
 Mon, 30 Jan 2023 10:25:07 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b002b8fe58d6desm12245202wrr.62.2023.01.30.10.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 10:25:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 06/23] target/arm: Make HSTR_EL2 traps take priority over
 UNDEF-at-EL1
Date: Mon, 30 Jan 2023 18:24:42 +0000
Message-Id: <20230130182459.3309057-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130182459.3309057-1-peter.maydell@linaro.org>
References: <20230130182459.3309057-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The semantics of HSTR_EL2 require that it traps cpreg accesses
to EL2 for:
 * EL1 accesses
 * EL0 accesses, if the access is not UNDEFINED when the
   trap bit is 0

(You can see this in the I_ZFGJP priority ordering, where HSTR_EL2
traps from EL1 to EL2 are priority 12, UNDEFs are priority 13, and
HSTR_EL2 traps from EL0 are priority 15.)

However, we don't get this right for EL1 accesses which UNDEF because
the register doesn't exist at all or because its ri->access bits
non-configurably forbid the access.  At EL1, check for the HSTR_EL2
trap early, before either of these UNDEF reasons.

We have to retain the HSTR_EL2 check in access_check_cp_reg(),
because at EL0 any kind of UNDEF-to-EL1 (including "no such
register", "bad ri->access" and "ri->accessfn returns 'trap to EL1'")
takes precedence over the trap to EL2.  But we only need to do that
check for EL0 now.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20230127175507.2895013-7-peter.maydell@linaro.org
---
 target/arm/op_helper.c |  6 +++++-
 target/arm/translate.c | 28 +++++++++++++++++++++++++++-
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 660dae696dd..7797a137af6 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -658,7 +658,11 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
         goto fail;
     }
 
-    if (!is_a64(env) && arm_current_el(env) < 2 && ri->cp == 15 &&
+    /*
+     * HSTR_EL2 traps from EL1 are checked earlier, in generated code;
+     * we only need to check here for traps from EL0.
+     */
+    if (!is_a64(env) && arm_current_el(env) == 0 && ri->cp == 15 &&
         (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
         uint32_t mask = 1 << ri->crn;
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9252a464a12..f4bfe55158e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4760,6 +4760,32 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
         break;
     }
 
+    if (s->hstr_active && cpnum == 15 && s->current_el == 1) {
+        /*
+         * At EL1, check for a HSTR_EL2 trap, which must take precedence
+         * over the UNDEF for "no such register" or the UNDEF for "access
+         * permissions forbid this EL1 access". HSTR_EL2 traps from EL0
+         * only happen if the cpreg doesn't UNDEF at EL0, so we do those in
+         * access_check_cp_reg(), after the checks for whether the access
+         * configurably trapped to EL1.
+         */
+        uint32_t maskbit = is64 ? crm : crn;
+
+        if (maskbit != 4 && maskbit != 14) {
+            /* T4 and T14 are RES0 so never cause traps */
+            TCGv_i32 t;
+            DisasLabel over = gen_disas_label(s);
+
+            t = load_cpu_offset(offsetoflow32(CPUARMState, cp15.hstr_el2));
+            tcg_gen_andi_i32(t, t, 1u << maskbit);
+            tcg_gen_brcondi_i32(TCG_COND_EQ, t, 0, over.label);
+            tcg_temp_free_i32(t);
+
+            gen_exception_insn(s, 0, EXCP_UDEF, syndrome);
+            set_disas_label(s, over);
+        }
+    }
+
     if (!ri) {
         /*
          * Unknown register; this might be a guest error or a QEMU
@@ -4788,7 +4814,7 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
         return;
     }
 
-    if (s->hstr_active || ri->accessfn ||
+    if ((s->hstr_active && s->current_el == 0) || ri->accessfn ||
         (arm_dc_feature(s, ARM_FEATURE_XSCALE) && cpnum < 14)) {
         /*
          * Emit code to perform further access permissions checks at
-- 
2.34.1


