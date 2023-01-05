Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0917665F24F
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:13:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTLy-0000SN-U1; Thu, 05 Jan 2023 11:44:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTLu-0000O9-OY
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:26 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTLs-0007MR-VS
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:26 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 ay2-20020a05600c1e0200b003d22e3e796dso1803494wmb.0
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=V04Q2CJZVVTmActVLx4PP0ERtalL12YnqZ2E3ccFR8A=;
 b=T8mjqMBc9Ht3YjC0UpJ8/V4IBgXv8kOLjG3I6S7ydweegYUBloGCSV3Um/YyUlxeb8
 feWmBvRJxf8M0EHR8mypWPxzQlxpn+zY3iqG8K6Yn7FIzFaFTL2Gh5oyjQAHxF8/Phle
 uvy7WWZ7hRy1MqOJBIKp11LUOSNMK1a5LX9HbQYU5Mko6wX3TGTTTq5S9Z564hide39H
 2SAzMv6kICm+kQHhF/DvDzRvLV9HTrKQ193zTYH5brCA0ThKrXI9pQ4MelwZuho1CXLk
 S275ySYSOznboEohF6hOomvPZqgXEPNbzAFKW56GekmBcH3SwW8/79zlMUUSmVehaIXy
 CpzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V04Q2CJZVVTmActVLx4PP0ERtalL12YnqZ2E3ccFR8A=;
 b=5Ou3SghOxykaAMBjNzFA1AO6t6+ZUp5ORR6xO1NSqrwtbnU/RWz2EuaJUk+acAIwVo
 BPuB2h/+6q4DuTse3dkYNxQBwREHGFs7VmKITVE0apGiAJlSCo3DjK8JhHhk6VgYxvtb
 9LaFsBQ+UCaombVs6IyAdEB7B+bCZI0BUq6wPkOz+j13tjihPhrlOWkvgPIwC6VqcOm5
 rj44fnd3hbhSVJ5ocKFDTeWXuAJyW4UQmJVYuLw/9KNZ4M8PJTkc63Jw0b6HvL/ZuX3A
 UvLQ7z0pPRHIqM/S7XL64mmg3jEy8u+OkQUs7SlWSf6jCKFrthh+LLxba8iMUKUZMnqW
 8Cbw==
X-Gm-Message-State: AFqh2kppZHYYZs6h1KjJ6oSY/hH7G1+T7MibeeLT2VrDCLGtK5e4HPkc
 byj3oM9PSNUfr3KQIMFk2gb/hFWiJNfF8KYs
X-Google-Smtp-Source: AMrXdXu9PxyepZfLFZxESJLBdbs4YrJHwKvEaAheQxQvIQgqM/dQ+E7BdVJS8UPP9FRIDrOf1b5PVA==
X-Received: by 2002:a05:600c:4b1d:b0:3d3:3deb:d916 with SMTP id
 i29-20020a05600c4b1d00b003d33debd916mr37333688wmp.4.1672937063602; 
 Thu, 05 Jan 2023 08:44:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/34] target/arm: Enable TTBCR_EAE for ARMv8-R AArch32
Date: Thu,  5 Jan 2023 16:43:48 +0000
Message-Id: <20230105164417.3994639-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>

ARMv8-R AArch32 CPUs behave as if TTBCR.EAE is always 1 even
tough they don't have the TTBCR register.
See ARM Architecture Reference Manual Supplement - ARMv8, for the ARMv8-R
AArch32 architecture profile Version:A.c section C1.2.

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20221206102504.165775-5-tobias.roehmel@rwth-aachen.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h    | 4 ++++
 target/arm/debug_helper.c | 3 +++
 target/arm/tlb_helper.c   | 4 ++++
 3 files changed, 11 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 161e42d50f4..d9555309df0 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -257,6 +257,10 @@ unsigned int arm_pamax(ARMCPU *cpu);
 static inline bool extended_addresses_enabled(CPUARMState *env)
 {
     uint64_t tcr = env->cp15.tcr_el[arm_is_secure(env) ? 3 : 1];
+    if (arm_feature(env, ARM_FEATURE_PMSA) &&
+        arm_feature(env, ARM_FEATURE_V8)) {
+        return true;
+    }
     return arm_el_is_aa64(env, 1) ||
            (arm_feature(env, ARM_FEATURE_LPAE) && (tcr & TTBCR_EAE));
 }
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index c21739242c5..2f6ddc0da57 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -437,6 +437,9 @@ static uint32_t arm_debug_exception_fsr(CPUARMState *env)
 
     if (target_el == 2 || arm_el_is_aa64(env, target_el)) {
         using_lpae = true;
+    } else if (arm_feature(env, ARM_FEATURE_PMSA) &&
+               arm_feature(env, ARM_FEATURE_V8)) {
+        using_lpae = true;
     } else {
         if (arm_feature(env, ARM_FEATURE_LPAE) &&
             (env->cp15.tcr_el[target_el] & TTBCR_EAE)) {
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 0f4f4fc8094..60abcbebe64 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -19,6 +19,10 @@ bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
     if (el == 2 || arm_el_is_aa64(env, el)) {
         return true;
     }
+    if (arm_feature(env, ARM_FEATURE_PMSA) &&
+        arm_feature(env, ARM_FEATURE_V8)) {
+        return true;
+    }
     if (arm_feature(env, ARM_FEATURE_LPAE)
         && (regime_tcr(env, mmu_idx) & TTBCR_EAE)) {
         return true;
-- 
2.25.1


