Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A367D42B2F3
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 04:55:19 +0200 (CEST)
Received: from localhost ([::1]:42226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUQI-0007gS-AQ
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 22:55:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHi-0004Y5-La
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:26 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:35457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHg-0004tg-WA
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:26 -0400
Received: by mail-pf1-x42b.google.com with SMTP id c29so1173337pfp.2
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fVhlPoABQmS8wc89+ovGDAnkicIV2MZx6WAeJyRD9lM=;
 b=KM63TzmCup4SHyma7eUTFtAzoryQ2U3srtaFy+h0u9AQ00fb5203OzBWTmJA+hqSFK
 43aqlO2sBVT+O1mtwOBNVxEQwBxLq0e3e6N7yidLeCPqld/JNhZmG46uD+Th+os9776j
 yKWP2p658BukwiNfuxqY4SIF54EPKHAl0R9/A/tKrk9akmc6n+S1PSspAqlt9dAyiNXv
 YYGI5drhLo9JbNT/9PxZ2dfuW414YfnGcYVXItaHstoXWP7TSMrQSiQezQ519unX+ng8
 +lAwKrV9R48Iq+p8lBL4KhLgOSbccz5BjTvgFiDFRmGsV5eCXPrsW2ACPCGK+UMncL6q
 CiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fVhlPoABQmS8wc89+ovGDAnkicIV2MZx6WAeJyRD9lM=;
 b=sMtDT/jKFBAiuUv9KMvPAbNaOA9DJo1HfWAvyx004Anuy5wjcv9HQ0BMzGJPs30yK2
 +OhnQe27uLjyshUZr6EoOEur/eg2yIRlYhniNoQnf+2aJJohvX86hcTKUu6cHqvFYWf5
 sDlj+orDHPlnFJaS/JCcnpsmsugmYG3Sd3wZ4ySSY0k5qaiP+u+1xMsOKpY4QnmPtcFT
 pu6IY2vYNKs9wokXxC7A+ZmcgbSLeAq3//g1irHYkAAFrQBF4DU4T4hrI6fUTvFjuPfX
 ekjceWP7RNQINWoiJlmRNAh1fQE1eHpCYiwo0wYPP3d7ZY8shvYbOA5cbSl3N12B7gTL
 s2pQ==
X-Gm-Message-State: AOAM532qs6wPXq0s4A7qAkFrzaMjicOyoLhreaysioZhklwke03N21Yi
 e1NVYKMbQeLEyKf3IwITQ3T348nC/PYb6Q==
X-Google-Smtp-Source: ABdhPJzh6+1Nxz4evaVDqSLrKmWvUPi/fpKVSd9GyxZDq5aDFOgNnCBpm/o6SBaOqTdsYOlbBF8KSw==
X-Received: by 2002:a05:6a00:234f:b0:3eb:3ffd:6da2 with SMTP id
 j15-20020a056a00234f00b003eb3ffd6da2mr35152661pfj.15.1634093183485; 
 Tue, 12 Oct 2021 19:46:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/48] target/sparc: Split out build_sfsr
Date: Tue, 12 Oct 2021 19:45:33 -0700
Message-Id: <20211013024607.731881-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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


