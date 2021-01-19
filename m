Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C443B2FBB10
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:26:56 +0100 (CET)
Received: from localhost ([::1]:39982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1suF-0002DF-Rt
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:26:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfH-0007h5-61
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:27 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfB-0001GG-4r
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:26 -0500
Received: by mail-wr1-x436.google.com with SMTP id 7so12823146wrz.0
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jG2GWPX6YkVm/xdUi9wcQxF5zIPYf/783tV2JvfrF9M=;
 b=Ua8+dor7QHPSJH6yZ3lRlcGe2yMVmU2TivnRMfGwyVKsbaUBReD5k349zZPccblFz2
 4AtUgw7gBmxzvgLlZ1u+qZngw+JuoMIqo+SKyJPIW/BfrPvjojkclPii4wjyMq1OnfNy
 +NnzbQFzNYxE4L83zF5u57WwQNqYs/VLFSO+BlgvAk7c7VMolTD/kPUZxW1hqay/yAv8
 mk0aaMtma+rk0458aUIuhCQ/Ny0aGc3fOzNqlyFmAKa1Xi7MSIBl2EyXTZaLR0skOgkx
 WnQ63IQMSKpJk/1dx7JyxB/R26TPfaEXgGMOwFq6XCHEoY/2SegNJixCop1ucoK2KKnR
 rTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jG2GWPX6YkVm/xdUi9wcQxF5zIPYf/783tV2JvfrF9M=;
 b=lWsdfByF9MG54Rq3xOYl3FQ4U/XynfcVoUEQxpBm97JM0xby/wFiHeeY73AxpsHjqa
 g5tp1cqVIEEwWELpR3VmxuoYaq62Pcu+oOAkHiUu+tg7UD9pSAEvXV0715/hsS4yoafo
 nXm8oGRd+LXDWolYEd8dDhfolOoTHHE6NjETYmRnGtLKCAQ/OgEQoygQYmPBUzc8E0H/
 kIMmc8kHQfwSPXVSfCJIaHeAlD5R2+y9PIDmjl39uiMqXaQOfaPUhyODA2zbidJDEGMz
 M9awDzAemtV0lpC1j2d/w+ai6STewo+eneZLU1rE2DFixAxgtKNryJMWRcoOnzPsKtVQ
 pO9A==
X-Gm-Message-State: AOAM530IhtV+78UnBCMz7SukWvOZGTE1FM6NAva8M9hhikeIeSPanrCW
 ToRiCxIJlI2n69DdaQFWXph9Ik5Bo+c8nw==
X-Google-Smtp-Source: ABdhPJwDoVGSSt5FHMI0rmwih66w78N1eFGL8wedPq31sIogoicjOzsZjDHChfB8wIqZ1ghFsQVHfQ==
X-Received: by 2002:a5d:6cc9:: with SMTP id c9mr4710471wrc.411.1611069079645; 
 Tue, 19 Jan 2021 07:11:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/33] target/arm: generalize 2-stage page-walk condition
Date: Tue, 19 Jan 2021 15:10:47 +0000
Message-Id: <20210119151104.16264-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119151104.16264-1-peter.maydell@linaro.org>
References: <20210119151104.16264-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

The stage_1_mmu_idx() already effectively keeps track of which
translation regimes have two stages. Don't hard-code another test.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210112104511.36576-13-remi.denis.courmont@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 521f85a695a..75166a21583 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12160,11 +12160,11 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                    target_ulong *page_size,
                    ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
 {
-    if (mmu_idx == ARMMMUIdx_E10_0 ||
-        mmu_idx == ARMMMUIdx_E10_1 ||
-        mmu_idx == ARMMMUIdx_E10_1_PAN) {
+    ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
+
+    if (mmu_idx != s1_mmu_idx) {
         /* Call ourselves recursively to do the stage 1 and then stage 2
-         * translations.
+         * translations if mmu_idx is a two-stage regime.
          */
         if (arm_feature(env, ARM_FEATURE_EL2)) {
             hwaddr ipa;
@@ -12172,9 +12172,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             int ret;
             ARMCacheAttrs cacheattrs2 = {};
 
-            ret = get_phys_addr(env, address, access_type,
-                                stage_1_mmu_idx(mmu_idx), &ipa, attrs,
-                                prot, page_size, fi, cacheattrs);
+            ret = get_phys_addr(env, address, access_type, s1_mmu_idx, &ipa,
+                                attrs, prot, page_size, fi, cacheattrs);
 
             /* If S1 fails or S2 is disabled, return early.  */
             if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2)) {
-- 
2.20.1


