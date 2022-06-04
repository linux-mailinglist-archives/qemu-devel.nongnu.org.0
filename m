Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A48F53D520
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 06:09:25 +0200 (CEST)
Received: from localhost ([::1]:46148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxL6J-0001sY-0i
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 00:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3G-0007VQ-Fu
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:14 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:53097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3E-0008V3-PC
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:14 -0400
Received: by mail-pj1-x102e.google.com with SMTP id gd1so8715234pjb.2
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 21:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v1YInfzaAA9SifUwQDUL6mgen5CgObSCAov/OgV6gGs=;
 b=KShepmRT//gHC2o2e57xF4JmK+vnhCKPzXXsyz+SE+/jLTwQuFOGx9JCR8criEsokW
 FaND9EWWVQIXnhqXBURUSlxFlUZqP4H3Dldfa4DTjycHIxnTQUlMXMqLI6QPhI3oV4hC
 4MznhXwHaFOTw0+cUNkEfdkNb+bd1xwauBZAgvDqwEIBiHYCq7rcvPxUmlKJ7InPcXrn
 MJbPOekfOhyLKRYMHkGahMY8/QB2eikc7T3uEcM3bPXMfvugxrEnevXApQySMGAv5bxg
 pUZc4i2MwZMpeDzQUs99GfCZg7YItPkWZ+cUthZndGsAJeZNVX0q9pjT2i+BtRUFUMeO
 dbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v1YInfzaAA9SifUwQDUL6mgen5CgObSCAov/OgV6gGs=;
 b=lEq2LMWX9y7o4fVdf3V6KF9fbooCnpbBJ5ThJ70MBRWDWYmC1Nf4IFPxcR/veb5sIm
 Rv46Q3Aj0oN3nFWJ/+K8+HX9ZPYOdV1n84a7QkI1kN9AMDv+t+Drss1LFRYbFLpSf1bB
 xBGuFqXIemxD7NYbSKFvdkaBsMimeUQ5c9lKkMZf2sYwc+eSEgTcnZ/Bu4/D9vK9nW+z
 ky5WkNVQCuyZBEDXMYgbBRkgv9Bv29cBly7kOFkHK8MtCf+9ZjGlXdlcBo8UHlhitaQ3
 EcfxpZDKtatgxsXkxrd8/bRWHhyzseLCNSR760yoz3M0s9AXGm0pYczXvbavet884s9p
 V8nQ==
X-Gm-Message-State: AOAM533s/RYv8D6zTH9gG+EYNQaVOPto9JTzkEtedBU0VacmP9Eaj+rS
 my/TkJFr+x5mWEEOszP9kOpzjVEZN5TGMg==
X-Google-Smtp-Source: ABdhPJyE03WkoB7ez0ScQYv2HNzFy7OANl9wynIDBOlfiNBzjP59zOPy3rVVWje3zRGGEAphjHXYEA==
X-Received: by 2002:a17:90b:4b0a:b0:1e3:1823:ca9f with SMTP id
 lx10-20020a17090b4b0a00b001e31823ca9fmr28760993pjb.12.1654315570436; 
 Fri, 03 Jun 2022 21:06:10 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 01/28] target/arm: Move stage_1_mmu_idx decl to internals.h
Date: Fri,  3 Jun 2022 21:05:40 -0700
Message-Id: <20220604040607.269301-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Move the decl from ptw.h to internals.h.  Provide an inline
version for user-only, just as we do for arm_stage1_mmu_idx.
Move an endif down to make the definition in helper.c be
system only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 5 +++++
 target/arm/helper.c    | 5 ++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index b654bee468..72b6af5559 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -979,11 +979,16 @@ ARMMMUIdx arm_mmu_idx(CPUARMState *env);
  * Return the ARMMMUIdx for the stage1 traversal for the current regime.
  */
 #ifdef CONFIG_USER_ONLY
+static inline ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
+{
+    return ARMMMUIdx_Stage1_E0;
+}
 static inline ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env)
 {
     return ARMMMUIdx_Stage1_E0;
 }
 #else
+ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx);
 ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env);
 #endif
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 40da63913c..d0460d3a0b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10481,12 +10481,10 @@ static inline uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx,
     }
 }
 
-#endif /* !CONFIG_USER_ONLY */
-
 /* Convert a possible stage1+2 MMU index into the appropriate
  * stage 1 MMU index
  */
-static inline ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
+ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
     case ARMMMUIdx_SE10_0:
@@ -10505,6 +10503,7 @@ static inline ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
         return mmu_idx;
     }
 }
+#endif /* !CONFIG_USER_ONLY */
 
 /* Return true if the translation regime is using LPAE format page tables */
 static inline bool regime_using_lpae_format(CPUARMState *env,
-- 
2.34.1


