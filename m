Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B763DE503
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:22:09 +0200 (CEST)
Received: from localhost ([::1]:45804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAlwO-00065q-Lc
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpb-0003A3-Dp
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:07 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:39675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpZ-0002E7-M9
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:07 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 k4-20020a17090a5144b02901731c776526so2065315pjm.4
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=r6pMzEcfW7EVV4DRyhMt2oObKL1q/e/pFG7jyQk03JM=;
 b=BeZHfIK7Pq6ADPfxBAybRFMnyaEn2LegtNwnsOikvEOnzieAMgs4Wf2NWBSQCt1ssi
 Saj6FP/17D7waLMUub+7GGXIkZWYiyKDkYvtTTuv2sM5z5ZEF1lFeFBc/F0jR2you/id
 B8SKeJVhSnoOIIJxUugjIxKsw2PJ/lWQeeg09Qgf9sq884oCmoOktQC6xOmyo5kqN4g+
 aDPiFm3W9Z3jPFD4XzMPl5R6KgH8rtqN4k0IT1Vy0MvO37C/x4hsscWMN4NPx7Liu8Od
 vTSktaLvuOaEddTIm4xFzAMlKTVtDhBTfB52mLNnjvupvKI2+neTer93mk+aSB8EFI6l
 uqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r6pMzEcfW7EVV4DRyhMt2oObKL1q/e/pFG7jyQk03JM=;
 b=rY+SgMrxLu9KD5UqgoPFh5kUx0Dp9Ni65cFuYW1yj+iuf+L7qd0prbnzeJFGHWq8tW
 J5OlUmcX/9hfwbdASIkhP/VslVaW0XjQvcUYYqAalHlFRlwsPCop31ILcImYPUk9CD0u
 k6oJgx68qDO3ObBywNk0ILUjZbQhFQ8wt46isJSV2PSQfN3iIRwW6fb3QliIIV/SOLgO
 O13kF7cz9ID16L8QgclkSGodM14M2VRljCpklfFBNKnucK1SZ9a3K0lJEfM3Tk75i3dH
 phkaElrgLnQ0n5493i9ADhNz+sVY/9FBRLA6arAwpeLrCoRoHWYCftWisdl6drZ9u1jO
 80iA==
X-Gm-Message-State: AOAM530DREDREVAonWNEv1JnqNJ2nKtzPC3EPCsDKZdiq/rEWDHcAL/w
 wIUIQTBnWG8qZ0FvneBEqzC4f5pXvwj0OQ==
X-Google-Smtp-Source: ABdhPJwJcoPqb5oLM7Ewou2HfWHIvotxHRcp5y7K+nmP4cUy6lqihWbYDzjxrbvPS59ccWok2q4KBA==
X-Received: by 2002:aa7:8298:0:b029:338:340:a085 with SMTP id
 s24-20020aa782980000b02903380340a085mr20074779pfm.46.1627964104512; 
 Mon, 02 Aug 2021 21:15:04 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.15.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:15:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/55] target/sparc: Split out build_sfsr
Date: Mon,  2 Aug 2021 18:14:04 -1000
Message-Id: <20210803041443.55452-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/mmu_helper.c | 72 +++++++++++++++++++++++++--------------
 1 file changed, 46 insertions(+), 26 deletions(-)

diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index a44473a1c7..5b2fda534a 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -526,16 +526,60 @@ static inline int ultrasparc_tag_match(SparcTLBEntry *tlb,
     return 0;
 }
 
+static uint64_t build_sfsr(CPUSPARCState *env, int mmu_idx, int rw)
+{
+    uint64_t sfsr = SFSR_VALID_BIT;
+
+    switch (mmu_idx) {
+    case MMU_PHYS_IDX:
+        sfsr |= SFSR_CT_NOTRANS;
+        break;
+    case MMU_USER_IDX:
+    case MMU_KERNEL_IDX:
+        sfsr |= SFSR_CT_PRIMARY;
+        break;
+    case MMU_USER_SECONDARY_IDX:
+    case MMU_KERNEL_SECONDARY_IDX:
+        sfsr |= SFSR_CT_SECONDARY;
+        break;
+    case MMU_NUCLEUS_IDX:
+        sfsr |= SFSR_CT_NUCLEUS;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    if (rw == 1) {
+        sfsr |= SFSR_WRITE_BIT;
+    } else if (rw == 4) {
+        sfsr |= SFSR_NF_BIT;
+    }
+
+    if (env->pstate & PS_PRIV) {
+        sfsr |= SFSR_PR_BIT;
+    }
+
+    if (env->dmmu.sfsr & SFSR_VALID_BIT) { /* Fault status register */
+        sfsr |= SFSR_OW_BIT; /* overflow (not read before another fault) */
+    }
+
+    /* FIXME: ASI field in SFSR must be set */
+
+    return sfsr;
+}
+
 static int get_physical_address_data(CPUSPARCState *env, hwaddr *physical,
                                      int *prot, MemTxAttrs *attrs,
                                      target_ulong address, int rw, int mmu_idx)
 {
     CPUState *cs = env_cpu(env);
     unsigned int i;
+    uint64_t sfsr;
     uint64_t context;
-    uint64_t sfsr = 0;
     bool is_user = false;
 
+    sfsr = build_sfsr(env, mmu_idx, rw);
+
     switch (mmu_idx) {
     case MMU_PHYS_IDX:
         g_assert_not_reached();
@@ -544,29 +588,18 @@ static int get_physical_address_data(CPUSPARCState *env, hwaddr *physical,
         /* fallthru */
     case MMU_KERNEL_IDX:
         context = env->dmmu.mmu_primary_context & 0x1fff;
-        sfsr |= SFSR_CT_PRIMARY;
         break;
     case MMU_USER_SECONDARY_IDX:
         is_user = true;
         /* fallthru */
     case MMU_KERNEL_SECONDARY_IDX:
         context = env->dmmu.mmu_secondary_context & 0x1fff;
-        sfsr |= SFSR_CT_SECONDARY;
         break;
-    case MMU_NUCLEUS_IDX:
-        sfsr |= SFSR_CT_NUCLEUS;
-        /* FALLTHRU */
     default:
         context = 0;
         break;
     }
 
-    if (rw == 1) {
-        sfsr |= SFSR_WRITE_BIT;
-    } else if (rw == 4) {
-        sfsr |= SFSR_NF_BIT;
-    }
-
     for (i = 0; i < 64; i++) {
         /* ctx match, vaddr match, valid? */
         if (ultrasparc_tag_match(&env->dtlb[i], address, context, physical)) {
@@ -616,22 +649,9 @@ static int get_physical_address_data(CPUSPARCState *env, hwaddr *physical,
                 return 0;
             }
 
-            if (env->dmmu.sfsr & SFSR_VALID_BIT) { /* Fault status register */
-                sfsr |= SFSR_OW_BIT; /* overflow (not read before
-                                        another fault) */
-            }
-
-            if (env->pstate & PS_PRIV) {
-                sfsr |= SFSR_PR_BIT;
-            }
-
-            /* FIXME: ASI field in SFSR must be set */
-            env->dmmu.sfsr = sfsr | SFSR_VALID_BIT;
-
+            env->dmmu.sfsr = sfsr;
             env->dmmu.sfar = address; /* Fault address register */
-
             env->dmmu.tag_access = (address & ~0x1fffULL) | context;
-
             return 1;
         }
     }
-- 
2.25.1


