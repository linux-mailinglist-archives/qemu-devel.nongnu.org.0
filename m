Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F1C3F0BE3
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:37:57 +0200 (CEST)
Received: from localhost ([::1]:35052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRNs-0004cC-11
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6I-0000cp-HT
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:46 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:44774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6G-00006y-Ta
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:46 -0400
Received: by mail-pl1-x62e.google.com with SMTP id q2so2408617plr.11
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=58UQKC3posC0m4R67J23FYTFiRPtzZJmRmPtZTSaHcw=;
 b=IFKomIg6VUpf9Qs1sL+aRCfAVBQSNsnXyc6auOE1y8skpmFn4I5sK+ID0G70NDEZen
 i4Pl4od4hFEneiQRU4ok+FfNq+Ejk9SEFevof2oMAYdVsKm6znz1AgeMe4qVUnck7Alv
 9yauopF4gIG0Di6yuBEFYkbGlgBT+q3gu9Ru509t89wWqbc9vA8Rx5bMpNBRTbh+owpo
 Axbm9Sn2S0AvMNAKl66kp+ccYufwJUys5BsZrguBmnlUSbTcsHZCQu1sDEFEHW7QsHu6
 d3BL2KHdUKwhlV8mUaLUHoI5DlhLn7a23oVZ448J2A/PLMSgNPmfeUZ9DlfbqS/W7sZa
 YgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=58UQKC3posC0m4R67J23FYTFiRPtzZJmRmPtZTSaHcw=;
 b=CyVq2R9IwCUhUTejS/BWHj0oqWfrLsWIYhu46dqA5nEMjeqdOrMJETWZRSXIhNM2i9
 4oACMFmPXNddktnEGPHHZ1wTru+rtt0mxaFcGXKioaaytcMm8qoICGSllkjhb8V/6gxe
 aFelNiXMET6c9633vZodR0frNkA7wWXagGf/mzjK+Ytj6ryHhAMIEcMhKwZO7DXAH4fa
 E5d1zjox6t4UUqhWuT8q82OiXoQIFvHOHIrljsnCYOsrHoabnwPaTwJ6PXLD4TXAZqNJ
 TBD9twY+53vzZ3XVMlaCiYmSd9Klt/+NX5/Kcvt1oev+5dLbcdVfRAel8OYVzLWwFdgv
 yiVQ==
X-Gm-Message-State: AOAM5308xjDNhUQg7TNTDhGVsXCiSwJ5ezpZMbX2zL+RT5yGMhBG2xPt
 zx/taHcWrEHgciCWdXvCIVsSDgkxSMFbug==
X-Google-Smtp-Source: ABdhPJy4xFCHZA2RNcNfju2uWJ90NKObePg4TCbMAQg87pJXNRjLzh/rc7reOBnUzeZYd4C3DgVTdw==
X-Received: by 2002:a17:902:f242:b029:12d:1fbb:aa12 with SMTP id
 j2-20020a170902f242b029012d1fbbaa12mr8619370plc.3.1629314383578; 
 Wed, 18 Aug 2021 12:19:43 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:19:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/66] target/sparc: Split out build_sfsr
Date: Wed, 18 Aug 2021 09:18:31 -1000
Message-Id: <20210818191920.390759-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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


