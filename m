Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97047441FF5
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:22:40 +0100 (CET)
Received: from localhost ([::1]:35416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbx9-0002fu-NW
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:22:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9G-00087Z-29
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:06 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:40640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9E-0001FV-9s
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:05 -0400
Received: by mail-qt1-x82f.google.com with SMTP id 19so14959868qtt.7
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fVhlPoABQmS8wc89+ovGDAnkicIV2MZx6WAeJyRD9lM=;
 b=g3a3YzkCrQ0FDH+4E6/7l84PYcgf7XRqHalyloB5YOnTK1uZ0uSMgRWJEu8+0dS9z0
 pgI1ce5loLXKU2Llfw8pqUvsbhV80dgLkM0s6EXD97TF50BHvvNa2f13D1fofdUloLm2
 QYPIliZwEQwlc7YEJb+CnRtHlia2iLCQD/WfRZ8uCLRRpkmXLvvtyF5+dq2+x50TS1ZP
 1cK83TURr8BA6L/Vk7SwnRgun6hmzw6uFzfHm81q7YH6PCSkdkt6j71uf4GB11u2aJLX
 ErMgTRh2fQyFuYWao0UtLH8Xw8hOZPHdsD71cW0PvuW0EkLe6t3L6wGNvIIzw5VlSxUJ
 7QIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fVhlPoABQmS8wc89+ovGDAnkicIV2MZx6WAeJyRD9lM=;
 b=tMW+57j/jO8weTMs/zanweRgWBok/zJNbcjztzNAzOE7NQ6TG5mk7aE8cWM133pzga
 f61fi/V1SEqkNbwlR2mZeT27xmWREsFZvPoGo5pYsIK5LdRiEAmrY6jBa7irGgQ0CZ+u
 HlefZysPWM0AhmXwfoJOKcwmzHvP+LLUiQQxECeCfQmZRcMpdfBUiRMsxx4UFYDqlEsh
 RgT/LhWhpx7wgx7zOWwx3kr1bxMf03hQQ7zdhZSZqnzw9DpPRVOHq34Fm6wG3zHUVG6j
 SjGBOpklwHxntz/6HgWcINU4BRk13tMmorOFPtXIzsFsNMN48F4Dz9LNgeFsu05XC0tH
 g+Lg==
X-Gm-Message-State: AOAM532Mi9cO56ub+DFlVK6MX6bW/oPqgEfG2sP+O3E66ZVNTigKAxOs
 iBaE/bgIoq4wTdhkQZXZPdhhvLFBgR11Kw==
X-Google-Smtp-Source: ABdhPJzEcX8Gy/zLRRaGWFNuoQKQ9Cy0h5ddTW2GZn84mfAj9ajktxgrs3hn6G8GBWVQDD6znp6U8A==
X-Received: by 2002:a05:622a:4d4:: with SMTP id
 q20mr4789192qtx.142.1635787863378; 
 Mon, 01 Nov 2021 10:31:03 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id 13sm1222289qkc.40.2021.11.01.10.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:31:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 55/60] target/sparc: Split out build_sfsr
Date: Mon,  1 Nov 2021 13:27:24 -0400
Message-Id: <20211101172729.23149-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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


