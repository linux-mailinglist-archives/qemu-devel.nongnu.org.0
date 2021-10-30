Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA49E440B55
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:47:06 +0200 (CEST)
Received: from localhost ([::1]:50374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgtNh-00009l-Ur
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1w-0001Zg-Ep
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:33 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:37654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1t-0002Ef-F3
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:32 -0400
Received: by mail-pf1-x435.google.com with SMTP id y20so1550796pfi.4
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fVhlPoABQmS8wc89+ovGDAnkicIV2MZx6WAeJyRD9lM=;
 b=qYSk/QX9tweVQgiN6T21Jk1xMq6dXZ14bP+mcdhoat6acq4AyoVnkDZ2Bmx9Oj754K
 qPrYnl3gdAiDJ0t0tIScihaHhkyfbkUqq72jVSGae5mjHyc/Pid0QuSt/hMQnCRuDHp7
 Qh8GlpKQ9i2SZ5CasI9ZfKWO5m/mHG5lzSarbgskaGo5tt6pW3ZxDyyYfi8ilIA/8K6i
 /ofsdddjDhUBvxEc5jzHNUVHANzZmg7Cnt8yuUk8mXlgVg8ZSFahHZ1F2WOhh81tKpH4
 +soIJzpF6b2oLQz15FK8hlRZrqJbSnHS1Q8OwFJXiUA0tR/ETFdRN2W/q6FB2+6MXjRo
 prDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fVhlPoABQmS8wc89+ovGDAnkicIV2MZx6WAeJyRD9lM=;
 b=bSw16Dam4Qe8hOsOv/rB2YHkIFx0kH8YFBvo0fVPv/C1eqJP3BxGZ6yNEA0Jv88u+z
 Xj8vng7qogUj6Xl+AEksYoADfPnj06i05bczC5hoH8eAWR7Wz0bbKVtO0nRKscEOukH0
 qkLvDqcaRGr3VrZqGfLJk3t6VMRel9S09TkB8iQ6L27tlVBNzCHisVPA7cNm8x4aTFmP
 Yf9GzHa7Te0Y7i9aWc6rklzkMvQXhcUm7b09vRJjnDnYfO3EHM/TMKfAuvr75uLEPJ0i
 cmH4w3E+gQsP0dDh/MSv6yyRBEaLyClODmSpuw6xsHgpwFJhV+s9AZ936GXXPmFqkElr
 WKDw==
X-Gm-Message-State: AOAM530DAsBuSNoJF9ZzdADflVdloq53TRrClwFbrb4ggigqkdj4FJtW
 H2h6ISFa4mjMzP4oSh4rvCvo4CHsVbv3lQ==
X-Google-Smtp-Source: ABdhPJzGlD+tZvsFcucm+ScsaCHfhmJhzU2KZyM8MAyoZtt07nEk1Wfh98EeV4ukFDiDp7f/l5g9cg==
X-Received: by 2002:a65:6215:: with SMTP id d21mr13887598pgv.62.1635614427287; 
 Sat, 30 Oct 2021 10:20:27 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k14sm9584798pji.45.2021.10.30.10.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:20:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 55/66] target/sparc: Split out build_sfsr
Date: Sat, 30 Oct 2021 10:16:24 -0700
Message-Id: <20211030171635.1689530-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, alex.bennee@linaro.org,
 laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/mmu_helper.c | 72 +++++++++++++++++++++++++--------------
 1 file changed, 46 insertions(+), 26 deletions(-)

diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index 2ad47391d0..014601e701 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -502,16 +502,60 @@ static inline int ultrasparc_tag_match(SparcTLBEntry *tlb,
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
@@ -520,29 +564,18 @@ static int get_physical_address_data(CPUSPARCState *env, hwaddr *physical,
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
@@ -592,22 +625,9 @@ static int get_physical_address_data(CPUSPARCState *env, hwaddr *physical,
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


