Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F356A43DB
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:10:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe52-0001PH-UC; Mon, 27 Feb 2023 09:02:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe4A-0000ds-Af
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:29 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe47-0007Xv-Ox
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:21 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 d41-20020a05600c4c2900b003e9e066550fso3884554wmp.4
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6hrZpnhPLRDXNa3A83fUHvIa4VTeZDIvb4ThTrNTe+A=;
 b=Kj1DMvseuh3f0ipPcHG5Sto6W8TOREEnezReAJy1Gu/ST4WQINTz8CivgrRvJ2mAQC
 UWbIDcW7iIOH0R+bfMK+194dJruazsloVtM02w0SodEKNkA+ndkwaiR27ItciFVoJ2lu
 zDv4FBoDg42h6KD1y9jhDLhd/n8Bx4QhBY6DZOfMXd9TmCCGvYhGOjLySzRXJhFJHuRn
 tg6B/Y7wAW+fgs1gEtxBHbx5lHrpcn9ofvEag2PIs1xqVL+KlLALDiLoxUKSq+W9fEDo
 qGCrXUl6UCDZFcbOEg/v4wYfI6iO9c3Zemjqkx1jYHL8R62YkttoRAMpDkb4qf2JN1hZ
 TLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6hrZpnhPLRDXNa3A83fUHvIa4VTeZDIvb4ThTrNTe+A=;
 b=UAgAHzO/u+XphMdSUxgOWUAHfRgWL2Qk8OsER8mZHE0mYKNSnuLViEAbUhXlOSA6wF
 s5+P/Y+C5OjXBNpp6JIf3JHCrZd9shDfjtIT7qj1EBoS15h6prlGcAw6Wzgfksj37Qu9
 3L6DD1jVPxGEPqFQiZrcTSiws+d/UygjqND4PxbI3SFm+LKUqFZhPuAH7j7Jw3VfoqIx
 8ZBHjRjXM1DI8KTCbc9X1HKv85Xo1T+Uk0oDB5rA+YjtAaX5ip73ad7ZAixgI0APtO/r
 nrzDVobqAgs7YqvXu57LG03iIWlk0thJ7tA7Hf64V9VLnHijk8feP0SyuXPcI/zcOSH3
 rsMQ==
X-Gm-Message-State: AO0yUKWJgdC9zxP3ZpT2W8Tfc+uFifdaRnAngYr+vIZbOsrdZanFwRnW
 eOTjY0x5CELLeG06T3+gh3zds3ktTafF+JQW
X-Google-Smtp-Source: AK7set8Ii9fEY+YAqTS9YZkMJXhBIHxpd/q74RDHPwIC52shtbeYBkfWSHBlYa6Ci+kMO7BRXJ7lYg==
X-Received: by 2002:a7b:c384:0:b0:3ea:d620:570a with SMTP id
 s4-20020a7bc384000000b003ead620570amr12963128wmj.38.1677506477153; 
 Mon, 27 Feb 2023 06:01:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a5d4249000000b002c5598c14acsm7158514wrr.6.2023.02.27.06.01.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 06:01:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/25] target/arm: Move regime_using_lpae_format into internal.h
Date: Mon, 27 Feb 2023 14:00:46 +0000
Message-Id: <20230227140102.3712344-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227140102.3712344-1-peter.maydell@linaro.org>
References: <20230227140102.3712344-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

From: Fabiano Rosas <farosas@suse.de>

This function is needed by common code (ptw.c), so move it along with
the other regime_* functions in internal.h. When we enable the build
without TCG, the tlb_helper.c file will not be present.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h      | 21 ++++++++++++++++++---
 target/arm/tcg/tlb_helper.c | 18 ------------------
 2 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index ed48f8c9a69..680c5747170 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -600,9 +600,6 @@ int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx);
 /* Return the MMU index for a v7M CPU in the specified security state */
 ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate);
 
-/* Return true if the translation regime is using LPAE format page tables */
-bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
-
 /*
  * Return true if the stage 1 translation regime is using LPAE
  * format page tables
@@ -767,6 +764,24 @@ static inline uint64_t regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
     return env->cp15.tcr_el[regime_el(env, mmu_idx)];
 }
 
+/* Return true if the translation regime is using LPAE format page tables */
+static inline bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    int el = regime_el(env, mmu_idx);
+    if (el == 2 || arm_el_is_aa64(env, el)) {
+        return true;
+    }
+    if (arm_feature(env, ARM_FEATURE_PMSA) &&
+        arm_feature(env, ARM_FEATURE_V8)) {
+        return true;
+    }
+    if (arm_feature(env, ARM_FEATURE_LPAE)
+        && (regime_tcr(env, mmu_idx) & TTBCR_EAE)) {
+        return true;
+    }
+    return false;
+}
+
 /**
  * arm_num_brps: Return number of implemented breakpoints.
  * Note that the ID register BRPS field is "number of bps - 1",
diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
index 60abcbebe64..31eb77f7df9 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -12,24 +12,6 @@
 #include "exec/helper-proto.h"
 
 
-/* Return true if the translation regime is using LPAE format page tables */
-bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    int el = regime_el(env, mmu_idx);
-    if (el == 2 || arm_el_is_aa64(env, el)) {
-        return true;
-    }
-    if (arm_feature(env, ARM_FEATURE_PMSA) &&
-        arm_feature(env, ARM_FEATURE_V8)) {
-        return true;
-    }
-    if (arm_feature(env, ARM_FEATURE_LPAE)
-        && (regime_tcr(env, mmu_idx) & TTBCR_EAE)) {
-        return true;
-    }
-    return false;
-}
-
 /*
  * Returns true if the stage 1 translation regime is using LPAE format page
  * tables. Used when raising alignment exceptions, whose FSR changes depending
-- 
2.34.1


