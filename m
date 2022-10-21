Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6344608038
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 22:50:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1olxU0-0000Uc-J5; Fri, 21 Oct 2022 15:15:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olvkI-0006H7-LY
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 13:23:46 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olvkG-0007lM-Ud
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 13:23:46 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 l16-20020a05600c4f1000b003c6c0d2a445so2486190wmq.4
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 10:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cU9RhXgsAuBoWahY8ojheS2Kw+9q/J8NtHNIBVaWFq0=;
 b=nCFD/ZFm+nS/CRYI5RlSfjC6CH91D5mrwKN1Tr2c+qB425kVBtYX2msX2i6qC/pLw8
 MO6EDa4lUW4cnoHGLTLUckdKJsavSgYYLqwftg7Q/CkXB415It8Wsbxd8fr5u7IFa9e6
 AAwmdruiFFRnGtU6klQuWn1x3d5Hp+iBz9DRdlVAPsgypmRuvUZ7L3hLj//ALJricwWD
 rAAiy4orJdgBgHx4vBnQy7JUVeYkNKJk/QBC99N6FwXTXHVS0D2vWxfoOlcwR3gNx0mW
 umboNTyjsaA+lb7q4mb2rRI5SIjJpntY1DacXJCWCRuISSmSSR8/bXn+9v2m2qN1HA4D
 80Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cU9RhXgsAuBoWahY8ojheS2Kw+9q/J8NtHNIBVaWFq0=;
 b=gRbRK9K5W2krpFEpPGGfUQkp+3RdSG0ywHEgLg6f4ny2r3CMLSA0O4P1+M+eE2PRi9
 pg8iV6TbxVE9MUVKjyyTSnOuOUOrCuXUAjBIAT91Sy8ION+sr0SAyVu/Gs4HVolkljST
 KwX9ji28TMe1ilN+i/zjFp2Xv+YfUwJRbmZc6L0jwFl3sx1tnUtn7Wn+kCV4+XyHX6A1
 zt6vOREQMMpTq9bEEk4gVYaoRtjOnmaciWaDBxxLl/igYbr1ntOuWiYR8zTfv06Cnpbc
 FoITQH4qTGSeXmvQ7XrOLfs4xgF2dMfp8RauVOIXGHP7Izallb3ajlz4Gc+ZCyG6jNjV
 VaMQ==
X-Gm-Message-State: ACrzQf3O06pBo68ucETshV7p5Cr2d0hdzw2HK0PImcyzIgxjF9Ko0HLH
 1s3TRRpUt9tJ0nSw2c+rvt1S9A==
X-Google-Smtp-Source: AMsMyM6UVMRIBEiq6SUuwyiApgjHIEa2439qLsrDUZ5unhcUywnE47arBmhEqr87R802tSLj+oV/sg==
X-Received: by 2002:a05:600c:15cc:b0:3c6:6ff5:21b8 with SMTP id
 v12-20020a05600c15cc00b003c66ff521b8mr13528297wmf.55.1666373023048; 
 Fri, 21 Oct 2022 10:23:43 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o18-20020adfcf12000000b0022a297950cesm19460927wrj.23.2022.10.21.10.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 10:23:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F2C0D1FFB7;
 Fri, 21 Oct 2022 18:23:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH] target/arm: don't process FCSE translations on physical
 TLBs
Date: Fri, 21 Oct 2022 18:23:38 +0100
Message-Id: <20221021172338.2782240-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

A recent change to the page table walking code missed checking if we
are at the processing the physical translation and bombs attempting to
derive the current EL. Fix this by introducing a new
helper (regime_is_phys) and extending the check around the FCSE
processing.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Fixes: f3639a64f6 (target/arm: Use softmmu tlbs for page table walking)
Cc: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 12 ++++++++++++
 target/arm/ptw.c       |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index c3c3920ded..0e753203b5 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -673,6 +673,18 @@ static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
 }
 
+static inline bool regime_is_phys(ARMMMUIdx mmu_idx)
+{
+    switch (mmu_idx) {
+    case ARMMMUIdx_Phys_NS:
+    case ARMMMUIdx_Phys_S:
+        return true;
+    default:
+        return false;
+    }
+}
+
+
 /* Return the exception level which controls this address translation regime */
 static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6c5ed56a10..1456a2f1de 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2557,7 +2557,7 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
      * Fast Context Switch Extension. This doesn't exist at all in v8.
      * In v7 and earlier it affects all stage 1 translations.
      */
-    if (address < 0x02000000 && mmu_idx != ARMMMUIdx_Stage2
+    if (address < 0x02000000 && !(mmu_idx == ARMMMUIdx_Stage2 || regime_is_phys(mmu_idx))
         && !arm_feature(env, ARM_FEATURE_V8)) {
         if (regime_el(env, mmu_idx) == 3) {
             address += env->cp15.fcseidr_s;
-- 
2.34.1


