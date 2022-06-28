Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3997C55BE54
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 07:07:34 +0200 (CEST)
Received: from localhost ([::1]:59062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o63Rk-00010D-QX
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 01:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62k1-00028F-Ka
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:22:21 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:46940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jm-0003jj-UD
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:22:21 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 h9-20020a17090a648900b001ecb8596e43so11396656pjj.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8q6UgHZNxgLAwjYyD3emx4pnHnGEMm3xg5CqdRKZ5yA=;
 b=nMHrFNGYDi/NUNXEogGwiq/O1hHL5qWjpeGrlOBZ1gWVxd8190i8RdpUW+qJ/nllzm
 QWxYwcy6smdO19PsjSzIEKrPc0IRTKFg2OWymKqCaI8CUtCg/lUm1+CnK1GvaVPfliZG
 e4XSjRulLGrAeX80QmojPSqa/RmdOU0nNUpAWAMz8x+gomn5iUDng9Hb6ETJoT2y06Z3
 FVT2i3OJQ1QI6WktLFgzM5cifz3QnUMxgSX0zwScNdC+G6KcVQtZL4AZN9LGbnRE84FJ
 5PVSwVR1YL0151x9QXTvVpXewZBXkru6RqcQ39jt4wHvHwB22+Sue+k/odWxHS6/YnpO
 RQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8q6UgHZNxgLAwjYyD3emx4pnHnGEMm3xg5CqdRKZ5yA=;
 b=vy7t7eYw39353cRUPCrDlt6bDzoXQEpyJeXnrZmLYLAvOzJSwOldmyez3K3sPV1TXp
 RsJDlvnxQrCCtaGoF4OZWcL82SJr87bhkDK1fF71BlGv1rdO/owBDxM7xySr3Zvy7Ozd
 qW/l3lrNJjEFiFOcLPUHL+12uLHFtE2YKDr35aDrMRRMrd0kuqUHKkRItvQvZUqjraHi
 5vTl69kdSIZvUyhpVJOeGAoVZkbEdjPxB2rmCUhIz4SteVh1Nk8v4cLEaWmcWiC0IUMu
 m0wP5nww/duGNfORxl8riXVJH6m025cMiO9rgeqy6tpcId64ypPLRSFerln4oG48AQ3N
 ip5w==
X-Gm-Message-State: AJIora9QdzIEDvXDs1yyTE3reCUoV1d0t9v5j35PO5c9LLO1oyafF8UU
 neTSedwITEobxQHWrq/Qum1tyZMVpJBV4g==
X-Google-Smtp-Source: AGRyM1tclIBD7Jj6395bY+7B48vE6bOZ03q/SVzirGK/xAjShSa1dTrGHSESzsVCaQMRPTxdBaLPgw==
X-Received: by 2002:a17:902:f683:b0:16a:6456:5369 with SMTP id
 l3-20020a170902f68300b0016a64565369mr1641887plg.136.1656390124644; 
 Mon, 27 Jun 2022 21:22:04 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:22:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 18/45] target/arm: Implement SME ZERO
Date: Tue, 28 Jun 2022 09:50:50 +0530
Message-Id: <20220628042117.368549-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v4: Fix ZA[] comment in helper_sme_zero.
---
 target/arm/helper-sme.h    |  2 ++
 target/arm/sme.decode      |  4 ++++
 target/arm/sme_helper.c    | 25 +++++++++++++++++++++++++
 target/arm/translate-sme.c | 13 +++++++++++++
 4 files changed, 44 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index 3bd48c235f..c4ee1f09e4 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -19,3 +19,5 @@
 
 DEF_HELPER_FLAGS_2(set_pstate_sm, TCG_CALL_NO_RWG, void, env, i32)
 DEF_HELPER_FLAGS_2(set_pstate_za, TCG_CALL_NO_RWG, void, env, i32)
+
+DEF_HELPER_FLAGS_3(sme_zero, TCG_CALL_NO_RWG, void, env, i32, i32)
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
index b215725594..eef2df73e1 100644
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
+     * Recall that ZAnH.D[m] is spread across ZA[n+8*m],
+     * so each row is discontiguous within ZA[].
+     */
+    for (i = 0; i < svl; i++) {
+        if (imm & (1 << (i % 8))) {
+            memset(&env->zarray[i], 0, svl);
+        }
+    }
+}
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index 786c93fb2d..971504559b 100644
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
+                            tcg_constant_i32(streaming_vec_reg_size(s)));
+    }
+    return true;
+}
-- 
2.34.1


