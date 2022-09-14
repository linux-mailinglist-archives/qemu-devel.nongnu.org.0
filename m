Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4C05B8906
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 15:22:03 +0200 (CEST)
Received: from localhost ([::1]:44476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYSL3-0005OU-V0
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 09:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwd-0000aL-RX
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:43 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:51716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwI-0008V6-4d
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:43 -0400
Received: by mail-wm1-x330.google.com with SMTP id o5so7350951wms.1
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 04:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=zPgXvBKfJfKdVLVw1MwG7vyTC/gmDC+uf6dtarBonqk=;
 b=lodtsBi89wJHnt1FzXvuR/o1FB8WIV/qDbI/+EHwVyj+xbMFqUMlP48c3iqGq/V/Fk
 eP0c8HqHbhwl/w8iOHD4F1OO6+4r1PXwNgS6w+60zwFdjTLqiwKx57Mi0HUz4djCdjaR
 1lOu9ssBTyD4Uhy0cHQAyn5s5heANLdfqw1eMzMHx+2eDP32niRszXSnPX/MwvGqyYxH
 YbODtHITuuopHSzKB6BEjCrLbBE46Osz59N6tnONQ8sFESmVO1i5HUrsogKLahTNZMWf
 6jKydRJBN2fPMQ8i5KbsS6XGNb2ZzKDiLBWcUa8lLxdwSm5+Lxks9L8Vj2hJ2MS29Dya
 UpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=zPgXvBKfJfKdVLVw1MwG7vyTC/gmDC+uf6dtarBonqk=;
 b=19eS0kwLxZXopYDu7J8NuAKRyTodFUjsDv+uwfrE0L7BZpF2sJKymDpVrbt2CFVv/4
 +MeDQvZpgIz9VBYpg3DsCHPutKIdailYlT1Cn9EdOaiRvZuKHxZD+si2p4n3ayTeMcPK
 blMbY/3+1Myv+8ooY9aFMS/nkgMQWtqmbArLRiGFFQ02sHRYIXeaxOHSpOgt9dt1tJA9
 A78GYfX0bRST9+Z+KrKARnIpVPmcETR2gTn5U9UpkKsJk9tJfQmOMXoObiZK54pvMs0E
 TDxoen+RDyf6HKjFdJs7AsNtA3PpvAuVRcwVoEOzBuFZDlXcfoYZkf7z8IXme5olxRcT
 2CBA==
X-Gm-Message-State: ACgBeo1pvPfNlTZY7JEnnVHfLmjRzvpQ30DTPWhqnQ1XsGvO6tS82U3M
 EtHvoOix+PlCaoiXuzd1ODSoc2gCOlx2X4+q
X-Google-Smtp-Source: AA6agR5p3TJSOCSyTYFTpu/ab83Ho3+zigI7wwUICuwG7Vqa67xAeNFvcWtweOWgQXRIEjUoTvB4WQ==
X-Received: by 2002:a05:600c:3d93:b0:3a6:1ac3:adf8 with SMTP id
 bi19-20020a05600c3d9300b003a61ac3adf8mr2757603wmb.125.1663156340563; 
 Wed, 14 Sep 2022 04:52:20 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Idan Horowitz <idan.horowitz@gmail.com>
Subject: [PATCH] target/arm: Do alignment check when translation disabled
Date: Wed, 14 Sep 2022 12:51:58 +0100
Message-Id: <20220914115217.117532-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
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


