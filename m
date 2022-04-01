Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7224EF233
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 17:05:22 +0200 (CEST)
Received: from localhost ([::1]:50496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naIq2-0003Mf-24
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 11:05:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naIlx-0003iC-LA
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:01:09 -0400
Received: from [2a00:1450:4864:20::32a] (port=53995
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naIlr-0005hD-U6
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:01:09 -0400
Received: by mail-wm1-x32a.google.com with SMTP id p189so1856516wmp.3
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 08:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=D7SQ68FCxztq/NMd54rgSzFbRfNvMZEmQG1HqRiAPlo=;
 b=hdRpBXvpOqETYPYX/a4v2Voa68dQe9D6kdhr48O1p0Qla+NG8uUyvKAvJwiuEXLHD1
 hzR37ZCIJ2VM7VFIZUiXQN+9HL9G50AqBN5znI24wnKYDiAqs8roinzsIiTB9Ksc3ONs
 AU8ORpBrn3D5uR7daaGA+2V0vp8JfvlHye5l75KdVMeN55JiPh4hj69ESzXAuAE9U3Jb
 FvpuuA1MBJyKvuHP366aurUU/7fAiArhLVe/SBHjtnrugO2LvMNf5KSDOqcamwL++9FR
 mbK37svt+2kYXsIxKe8LfAXDjF/YQP0pR9V/Ve0sMIOGIGiXRvS3xwcRJDwPiZWu5V48
 gnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D7SQ68FCxztq/NMd54rgSzFbRfNvMZEmQG1HqRiAPlo=;
 b=jl1Fbe41r/a+wXPBWcxo84fELpduPpVhmGcOpuL6cyas09b/qyOL3nDil9+AWXi6jd
 JxNGuL4VacaAqY2128ZTpy2pH9Qly9dGD4o4CK5pR9daRvifk2VhTu8de/Y92OS4pfNY
 AGgk2cx/nianOszmOQ7Cl01TCehbwI2Ffgk/eiBJQNS76XMFNEsk2GLFikEPTGOxUrpO
 CjHVbsZTvfurHNd/6nXInaaCpHq8gzR2ZTaNLpqCkjGeyJAxddcxYrAmjdZ9n+BYWQrQ
 4WChudWHFGty+ydhh55vPy3iaLjJRllYJ2ZpnQbFxkvCuNOzMWhxoWd7gEMTF289b24w
 4rnA==
X-Gm-Message-State: AOAM5315hXrT+EBus6J3O9GUyswXt3ex2Y+sCvIKxGbyGMoezSEBBHap
 zSezpZz/3M5CpHzQdkAA8gmDaF2GLPAJhg==
X-Google-Smtp-Source: ABdhPJxTwFkkiMjLCv0DuVCExNU/luAUiOdIahvrf0zFjV5QMxiUXQZp9ChtnUJ0AubHg4qkM3R4Ng==
X-Received: by 2002:a7b:cf03:0:b0:38e:38c0:be27 with SMTP id
 l3-20020a7bcf03000000b0038e38c0be27mr9313914wmg.150.1648825262281; 
 Fri, 01 Apr 2022 08:01:02 -0700 (PDT)
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 6-20020a05600c020600b0038cbb21fb00sm2084023wmi.39.2022.04.01.08.01.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 08:01:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/6] target/arm: Fix MTE access checks for disabled SEL2
Date: Fri,  1 Apr 2022 16:00:50 +0100
Message-Id: <20220401150055.421608-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220401150055.421608-1-peter.maydell@linaro.org>
References: <20220401150055.421608-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Idan Horowitz <idan.horowitz@gmail.com>

While not mentioned anywhere in the actual specification text, the
HCR_EL2.ATA bit is treated as '1' when EL2 is disabled at the current
security state. This can be observed in the psuedo-code implementation
of AArch64.AllocationTagAccessIsEnabled().

Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220328173107.311267-1-idan.horowitz@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 2 +-
 target/arm/helper.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index a34be2e4595..7f696cd36a8 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1094,7 +1094,7 @@ static inline bool allocation_tag_access_enabled(CPUARMState *env, int el,
         && !(env->cp15.scr_el3 & SCR_ATA)) {
         return false;
     }
-    if (el < 2 && arm_feature(env, ARM_FEATURE_EL2)) {
+    if (el < 2 && arm_is_el2_enabled(env)) {
         uint64_t hcr = arm_hcr_el2_eff(env);
         if (!(hcr & HCR_ATA) && (!(hcr & HCR_E2H) || !(hcr & HCR_TGE))) {
             return false;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 812ca591f4e..3aeaea40683 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7176,7 +7176,7 @@ static CPAccessResult access_mte(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     int el = arm_current_el(env);
 
-    if (el < 2 && arm_feature(env, ARM_FEATURE_EL2)) {
+    if (el < 2 && arm_is_el2_enabled(env)) {
         uint64_t hcr = arm_hcr_el2_eff(env);
         if (!(hcr & HCR_ATA) && (!(hcr & HCR_E2H) || !(hcr & HCR_TGE))) {
             return CP_ACCESS_TRAP_EL2;
-- 
2.25.1


