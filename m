Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 132025B75BB
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 17:54:31 +0200 (CEST)
Received: from localhost ([::1]:51550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY8F3-0005BW-M3
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 11:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY8BQ-0000ad-D7
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 11:50:44 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY8BB-0006L6-37
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 11:50:44 -0400
Received: by mail-wr1-x42c.google.com with SMTP id cc5so11649258wrb.6
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 08:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=zPgXvBKfJfKdVLVw1MwG7vyTC/gmDC+uf6dtarBonqk=;
 b=EVrQjH9jDMdGKX9O1t9EWc8QgvM7RB3VVDSRWN9fO45AbDo2+4Md1b1DpeTsPSlghZ
 CcmCIBXcErm8dhO/aaX9flANv+O4GOjpbdNOX5vZ8DM/ih+fiAkcHGiG5+Yy9I4YrmcH
 uVUVDvSkzcAafwQ0a3nDsP32SBMm9x+DoIJTL+nN5lJ/y4rVDlvcwuyuhd50axJvGazW
 kEK3+eYLwo0/wB4GGUPCFQVIxiHHVsEsWDZYSUE777YXhVOXiV9CPloUm2iuseHbC9vD
 HhZoZknZCog7pykj+N/qmyao/X/uOh45c7AhjkakPyUbYbe4RE3x08Cluuozgox8W2eB
 mwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=zPgXvBKfJfKdVLVw1MwG7vyTC/gmDC+uf6dtarBonqk=;
 b=4b/aIkrcDowzC6s5Q+FYHo/FR3cfQkyoeCgdDMNPR0i+eFP6cKXkguZTFcBvA/5VRT
 id4uXclj5Tx+3gDN6nKSV7nuNeAcL5JgfmE7+FoMVO493C8wnT04CHeFNdjpelBXpn3+
 +QAiMZQuIKPgakMZa9+u9DbZHDRubN0cj7Ier2AIqOvAF6MTcDLmxOu3DleJhOrl4lTs
 51ipz1QdfOtMjXWlqZAt0I9U0ggQ8PzQc3OkjRsjLlmZ8cEpOdIKIOSnC3o0Tcg/GY/p
 lWOAEEv/n0tjZMtqgwBWB1IS+NCJKsb4LUBlily32TzFPSw6mkbXyHnNytzlAiRCdITu
 SdVg==
X-Gm-Message-State: ACgBeo1X/ymLRHTRWsLyE5REMgnKx/TxaZqlWEDovsFlfYvtq05HsjXD
 +c21a3mOoBbjP3zC12J8IUbH27ff0yAcnbRu
X-Google-Smtp-Source: AA6agR5LfYAUxsLYbXAuqbpC+AHvdwrdY9mv1n0w9SrNRadOA459QgC933mqzS2DRPpwvI8llmRRjQ==
X-Received: by 2002:adf:d1cc:0:b0:22a:450c:6208 with SMTP id
 b12-20020adfd1cc000000b0022a450c6208mr11600820wrd.696.1663084218167; 
 Tue, 13 Sep 2022 08:50:18 -0700 (PDT)
Received: from stoup.. ([89.101.193.68]) by smtp.gmail.com with ESMTPSA id
 b11-20020a05600c4e0b00b003b492753826sm5164972wmq.43.2022.09.13.08.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 08:50:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Idan Horowitz <idan.horowitz@gmail.com>
Subject: [PATCH] target/arm: Do alignment check when translation disabled
Date: Tue, 13 Sep 2022 16:49:56 +0100
Message-Id: <20220913154956.12731-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
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

If translation is disabled, the default memory type is Device,
which requires alignment checking.  Document, but defer, the
more general case of per-page alignment checking.

Reported-by: Idan Horowitz <idan.horowitz@gmail.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1204
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d7bc467a2a..79609443aa 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10713,6 +10713,39 @@ ARMMMUIdx arm_mmu_idx(CPUARMState *env)
     return arm_mmu_idx_el(env, arm_current_el(env));
 }
 
+/*
+ * Return true if memory alignment should be enforced.
+ */
+static bool aprofile_require_alignment(CPUARMState *env, int el, uint64_t sctlr)
+{
+    /* Check the alignment enable bit. */
+    if (sctlr & SCTLR_A) {
+        return true;
+    }
+
+    /*
+     * If translation is disabled, then the default memory type
+     * may be Device(-nGnRnE) instead of Normal, which requires that
+     * alignment be enforced.
+     *
+     * TODO: The more general case is translation enabled, with a per-page
+     * check of the memory type as assigned via MAIR_ELx and the PTE.
+     * We could arrange for a bit in MemTxAttrs to enforce alignment
+     * via forced use of the softmmu slow path.  Given that such pages
+     * are intended for MMIO, where the slow path is required anyhow,
+     * this should not result in extra overhead.
+     */
+    if (sctlr & SCTLR_M) {
+        /* Translation enabled: memory type in PTE via MAIR_ELx. */
+        return false;
+    }
+    if (el < 2 && (arm_hcr_el2_eff(env) & (HCR_DC | HCR_VM))) {
+        /* Stage 2 translation enabled: memory type in PTE. */
+        return false;
+    }
+    return true;
+}
+
 static CPUARMTBFlags rebuild_hflags_common(CPUARMState *env, int fp_el,
                                            ARMMMUIdx mmu_idx,
                                            CPUARMTBFlags flags)
@@ -10777,8 +10810,9 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
 {
     CPUARMTBFlags flags = {};
     int el = arm_current_el(env);
+    uint64_t sctlr = arm_sctlr(env, el);
 
-    if (arm_sctlr(env, el) & SCTLR_A) {
+    if (aprofile_require_alignment(env, el, sctlr)) {
         DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
     }
 
@@ -10871,7 +10905,7 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
 
     sctlr = regime_sctlr(env, stage1);
 
-    if (sctlr & SCTLR_A) {
+    if (aprofile_require_alignment(env, el, sctlr)) {
         DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
     }
 
-- 
2.34.1


