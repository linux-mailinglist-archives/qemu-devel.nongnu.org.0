Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBD15E68FF
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 19:01:52 +0200 (CEST)
Received: from localhost ([::1]:59808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obPaB-0004fj-Uj
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 13:01:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPB2-0002Bq-Ji
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:06 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPB0-0005O2-Lr
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:52 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 v3-20020a1cac03000000b003b4fd0fe6c0so1682468wme.5
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=LvDKHoXAgkm2T+dsnl2sSCZXSWJJItk6xpHr063ViKM=;
 b=TgBOxyk35E9wrSEjxxe2z4PR27+miDty3MB5IeZstYCo0hW8fKSczre0suZOeBu4Mi
 jyOXi/wV++aaUv57TicuxoOS02BaOIHi5InHm9EsVmLkWcKvbI4JN8gCsd2dBuX5rOeD
 p9pLXPabkmQQ9uIsYbV9e6RubBWQ7xa802a+N6tT1gTRSk5QBgURzEH9C0hFZmAiNy71
 3cjvaaBsjwZ8rhP+vcd0axAHQ8WeKiywkIgEU/8Vqwnt/I1vEvdLi66I04NcTs4L/TYv
 GhLgaU94nkkYjD1LpNYhVlzFCf9HDVqVhftIIEmifPL12/sU4bsGSce9wX1ELhnIpaMg
 Bu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=LvDKHoXAgkm2T+dsnl2sSCZXSWJJItk6xpHr063ViKM=;
 b=p08WhgBJTP2hmnJ+n6C6M/cnjrSITFNw00tQ7hrjNANHupeb5mvtDzlKeLhhjHsDUl
 FN8DU1R/+FY9qIDw6PDMXIV0gcziAW53GYjSTzS+PueiQbMy+b1UtQUXooO7VqkJMf6F
 KJ/kfHQTpLESKTYhLkkGo3VLzQ9tZkjEQaotUWya0Mb7FNaHnffYSw+e46kw4jqJHS4L
 9ySE5JIEwLN0Ir1lw0MOaGmcam5tbTN95dEydCEuy6B3ZW4x5qKhLw3SMbxQqwAFMaU1
 R32M0DkZEW6hdZY7uGbQ8SwWgsKChjJ2hZSCGLtSgTU4X+z8fsA5dCzHmBaRwRJriRQn
 9cQg==
X-Gm-Message-State: ACrzQf31hO5WbyujgmDzz8CHFVZkwmBH3JFNe0kMiAjheBldAy1AjKdL
 DS9TA3OinNVwCdm4D0d0lLPVFfOMjuvi6A==
X-Google-Smtp-Source: AMsMyM6hhsQiuvqXQLuqAYKb1comrVsZr0+QCooGnRBOJ87CyvOyNyjhj1sfEGqv8kFWZyTBSucwmQ==
X-Received: by 2002:a05:600c:3844:b0:3b4:becc:e43 with SMTP id
 s4-20020a05600c384400b003b4becc0e43mr10156155wmr.33.1663864549915; 
 Thu, 22 Sep 2022 09:35:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/39] target/arm: Add is_secure parameter to
 pmsav7_use_background_region
Date: Thu, 22 Sep 2022 17:35:14 +0100
Message-Id: <20220922163536.1096175-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Remove the use of regime_is_secure from pmsav7_use_background_region,
using the new parameter instead.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220822152741.1617527-17-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6a73f16e092..9e1f60d10b4 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1489,7 +1489,7 @@ static bool m_is_system_region(CPUARMState *env, uint32_t address)
 }
 
 static bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx,
-                                         bool is_user)
+                                         bool is_secure, bool is_user)
 {
     /*
      * Return true if we should use the default memory map as a
@@ -1502,8 +1502,7 @@ static bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx,
     }
 
     if (arm_feature(env, ARM_FEATURE_M)) {
-        return env->v7m.mpu_ctrl[regime_is_secure(env, mmu_idx)]
-            & R_V7M_MPU_CTRL_PRIVDEFENA_MASK;
+        return env->v7m.mpu_ctrl[is_secure] & R_V7M_MPU_CTRL_PRIVDEFENA_MASK;
     } else {
         return regime_sctlr(env, mmu_idx) & SCTLR_BR;
     }
@@ -1516,6 +1515,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
 {
     ARMCPU *cpu = env_archcpu(env);
     int n;
+    bool secure = regime_is_secure(env, mmu_idx);
     bool is_user = regime_is_user(env, mmu_idx);
 
     result->phys = address;
@@ -1618,7 +1618,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
         }
 
         if (n == -1) { /* no hits */
-            if (!pmsav7_use_background_region(cpu, mmu_idx, is_user)) {
+            if (!pmsav7_use_background_region(cpu, mmu_idx, secure, is_user)) {
                 /* background fault */
                 fi->type = ARMFault_Background;
                 return true;
@@ -1739,7 +1739,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
     } else if (m_is_ppb_region(env, address)) {
         hit = true;
     } else {
-        if (pmsav7_use_background_region(cpu, mmu_idx, is_user)) {
+        if (pmsav7_use_background_region(cpu, mmu_idx, secure, is_user)) {
             hit = true;
         }
 
-- 
2.25.1


