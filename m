Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A395523C9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 20:23:00 +0200 (CEST)
Received: from localhost ([::1]:37018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3M39-0000y2-AH
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 14:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaB-0006JR-Aq
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:53:04 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:34395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3La6-0001V8-Ke
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:53:02 -0400
Received: by mail-pl1-x62d.google.com with SMTP id i15so10385463plr.1
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=avqdFCxsw+1j3lX5y8x/bJYpy99yK5JgzP8deQXvTJY=;
 b=lPGAZd96yADi1BMlagJ0JBw+xUzoE+9SVQdrhQdFkdso19nkkhqv6JPrhNDrjKHyJ7
 //YIFdk7OEurQQ8ObfUgAQ1PKLBc/rmdclPR3Qpm1/Djz6cCuAdsuEn/d6Z/00zWRGRz
 J6WJkHJLFLQ/dxFNZEVfzRVogXhUc3wlIpW0Sw1APMCEfOvXWOrz29vXtAPkdLYZeXAc
 xHcAqqO5gW/gUw1X2Crb4nGYi4gg6QWvj8eJwmGicLh8HSKc/a1EhgjsJSbbmPCYrQjT
 5H9U8yxsQbFCv/sq/qIb4dDiCHK3S4Ik4O1jgvNvRTi+w82EVMtWsXYFA9km1AFOcyJk
 S4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=avqdFCxsw+1j3lX5y8x/bJYpy99yK5JgzP8deQXvTJY=;
 b=QofQ92pPJyDZ3WqkO4E9vGGkNys+kCE3ptg8IsZEMQfC5yBCcLD4q0geGBIVngFus/
 9EofL53Mxkzh+vNPR1Lx2MMRAZPewh9+66UUbovVWf2HgFR91b1Yfopc+Iv+GJRvag0S
 BpWDkDd1AjYWwwi9CqjLRdQGjlsDkI4tJSIKTdC923ku1ghaTd3C9owSt8CHsYUDxjGa
 V5Cb9w8y4fOxNqCwspO5HBDsbr/HeEMcejW2hS2aiPFSi87gzFbNFtnbCWGMic5XmsfA
 f9W3QLM61WZHCeYawhlWCG/BGm+/oyZBwfqzzcSzxwPmHGBU2gzVKcvFT9FzTxfJCemz
 WhlQ==
X-Gm-Message-State: AJIora9W7dblcdXGH1GT9pqva9zSOHmb1rj+aU3aHl2znThbk4BF15kA
 XAG372ZpztTNPOY2PgjvC79aZz3WEFCd1w==
X-Google-Smtp-Source: AGRyM1tmcFhbrDhnh1sYqQcp+R9fLlo1iBmYgfH5AZOi1JZ4qsSokcslcpo+wn/eeITSYPTWnz9OKw==
X-Received: by 2002:a17:90a:4e05:b0:1ec:8de4:1dd5 with SMTP id
 n5-20020a17090a4e0500b001ec8de41dd5mr14058384pjh.242.1655747577340; 
 Mon, 20 Jun 2022 10:52:57 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 24/51] target/arm: Implement SME ZERO
Date: Mon, 20 Jun 2022 10:52:08 -0700
Message-Id: <20220620175235.60881-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sme.h    |  2 ++
 target/arm/translate-a64.h |  1 +
 target/arm/sme.decode      |  4 ++++
 target/arm/sme_helper.c    | 25 +++++++++++++++++++++++++
 target/arm/translate-a64.c | 14 ++++++++++++++
 target/arm/translate-sme.c | 13 +++++++++++++
 6 files changed, 59 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index 3bd48c235f..c4ee1f09e4 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -19,3 +19,5 @@
 
 DEF_HELPER_FLAGS_2(set_pstate_sm, TCG_CALL_NO_RWG, void, env, i32)
 DEF_HELPER_FLAGS_2(set_pstate_za, TCG_CALL_NO_RWG, void, env, i32)
+
+DEF_HELPER_FLAGS_3(sme_zero, TCG_CALL_NO_RWG, void, env, i32, i32)
diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 6bd1b2eb4b..ec5d580ba0 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -30,6 +30,7 @@ bool logic_imm_decode_wmask(uint64_t *result, unsigned int immn,
                             unsigned int imms, unsigned int immr);
 bool sve_access_check(DisasContext *s);
 bool sme_enabled_check(DisasContext *s);
+bool sme_za_enabled_check(DisasContext *s);
 TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr);
 TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
                         bool tag_checked, int log2_size);
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index c25c031a71..6e4483fdce 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -18,3 +18,7 @@
 #
 # This file is processed by scripts/decodetree.py
 #
+
+### SME Misc
+
+ZERO            11000000 00 001 00000000000 imm:8
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index b215725594..e5b5723a15 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -59,3 +59,28 @@ void helper_set_pstate_za(CPUARMState *env, uint32_t i)
         memset(env->zarray, 0, sizeof(env->zarray));
     }
 }
+
+void helper_sme_zero(CPUARMState *env, uint32_t imm, uint32_t svl)
+{
+    uint32_t i;
+
+    /*
+     * Special case clearing the entire ZA space.
+     * This falls into the CONSTRAINED UNPREDICTABLE zeroing of any
+     * parts of the ZA storage outside of SVL.
+     */
+    if (imm == 0xff) {
+        memset(env->zarray, 0, sizeof(env->zarray));
+        return;
+    }
+
+    /*
+     * Recall that ZAnH.D[m] is spread across ZA[n+8*m].
+     * Unless SVL == ARM_MAX_VQ, each row is discontiguous.
+     */
+    for (i = 0; i < svl; i++) {
+        if (imm & (1 << (i % 8))) {
+            memset(&env->zarray[i], 0, svl);
+        }
+    }
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 498970f653..df9fc42635 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1231,6 +1231,20 @@ bool sme_enabled_check(DisasContext *s)
     return fp_access_check_only(s);
 }
 
+/* Note that this function corresponds to CheckSMEAndZAEnabled. */
+bool sme_za_enabled_check(DisasContext *s)
+{
+    if (!sme_enabled_check(s)) {
+        return false;
+    }
+    if (!s->pstate_za) {
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                           syn_smetrap(SME_ET_InactiveZA, false));
+        return false;
+    }
+    return true;
+}
+
 /*
  * This utility function is for doing register extension with an
  * optional shift. You will likely want to pass a temporary for the
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index 786c93fb2d..d526c74456 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -33,3 +33,16 @@
  */
 
 #include "decode-sme.c.inc"
+
+
+static bool trans_ZERO(DisasContext *s, arg_ZERO *a)
+{
+    if (!dc_isar_feature(aa64_sme, s)) {
+        return false;
+    }
+    if (sme_za_enabled_check(s)) {
+        gen_helper_sme_zero(cpu_env, tcg_constant_i32(a->imm),
+                            tcg_constant_i32(s->svl));
+    }
+    return true;
+}
-- 
2.34.1


