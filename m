Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C44F84DA430
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 21:45:59 +0100 (CET)
Received: from localhost ([::1]:42732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUE3K-0000KG-Rk
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 16:45:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUE0l-0006Vb-UE
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 16:43:19 -0400
Received: from [2a00:1450:4864:20::335] (port=42945
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUE0d-0008Fj-Cu
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 16:43:16 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 r190-20020a1c2bc7000000b0038a1013241dso301196wmr.1
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 13:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SPgrXoGzy3toqKLy1djjjTzE0Y4JQdTSNnsnsRObao8=;
 b=E5cURpH99duc/CeE31J0jsJDxe1aoqIOe/y6lXjo4eRuSJGXjzCsKwTP6R+gzWq1T5
 MyHyQKfAQlI1vx7XMcVF/xcRkoWe9Ii6sFUVWmUpOE9V9M288VyIUXvyuPAleRk0Z3Tg
 FjUKjN5XcoHPPkKzb3jXz7PFe14hsRIJ7eY9GCkHwB87bX76xniBY6eQ/tg9LTKaecrj
 F12+v+sj3YjJTAyIFBV9q1+7c8ezuR++HKhtwGl2spsfnGBid2NVRcm8sTmKnides5LC
 f6JrEl3HiHwAB2cHmCEhNkDhbUtXtuO6ePaqIpll4bF4Mvbw2ndo/iFmVtDKNoxSirPT
 zG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SPgrXoGzy3toqKLy1djjjTzE0Y4JQdTSNnsnsRObao8=;
 b=iz1o1j3sD+D9yB04jtml9XTaePjkq0Rc9/Yvog37Q1sm4NfhDPIQJAl4oOOd6nRche
 MdV9WzxU1f3DXSzga5qIfZ/hlOBFPnSa8zn4oVkBv2G+x4KqJGr/PBd2uX7r2soMuf3d
 8xazQ3RC/9drB4U9cpWY21WioitsXwVYP/6JkaLnYgNWawaQFSxgN6q7dA9p+3RC9a6x
 M/T8eKwt+WKARyfIUwaZ7cmShzhVxKRaWCBgcNMMCHLKOLe7+ybMCf4zP7c8nYLjaADq
 GSA6WLFZLMrHfWdbpco94Kpm2qGH0vwEIZ8/sqqo1rj4GyEASDFUAKleqzgeFJvFs+pq
 oTXA==
X-Gm-Message-State: AOAM532t++YG3hDkZa4Oaov4fG5sluLZ0qzUUs8MUQ8mmmhcU/XAwZeP
 kGf9RjpQcsKMQ+Vf4Fgk2f7Epuws5w6Trg==
X-Google-Smtp-Source: ABdhPJyjZdCSo3Z4RtxmFZBegGTYpGQXhSsmGhFAsFjO8CJteqyK/EMdJbok4NsPnXXNxoxUg3bcaw==
X-Received: by 2002:a7b:ca42:0:b0:38c:6d09:1362 with SMTP id
 m2-20020a7bca42000000b0038c6d091362mr298407wml.103.1647376989709; 
 Tue, 15 Mar 2022 13:43:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a05600c414b00b0038c6c3eaee9sm465208wmm.1.2022.03.15.13.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 13:43:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/arm: Log M-profile vector table accesses
Date: Tue, 15 Mar 2022 20:43:05 +0000
Message-Id: <20220315204306.2797684-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220315204306.2797684-1-peter.maydell@linaro.org>
References: <20220315204306.2797684-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

Currently the CPU_LOG_INT logging misses some useful information
about loads from the vector table.  Add logging where we load vector
table entries.  This is particularly helpful for cases where the user
has accidentally not put a vector table in their image at all, which
can result in confusing guest crashes at startup.

Here's an example of the new logging for a case where
the vector table contains garbage:

Loaded reset SP 0x0 PC 0x0 from vector table
Loaded reset SP 0xd008f8df PC 0xf000bf00 from vector table
Taking exception 3 [Prefetch Abort] on CPU 0
...with CFSR.IACCVIOL
...BusFault with BFSR.STKERR
...taking pending nonsecure exception 3
...loading from element 3 of non-secure vector table at 0xc
...loaded new PC 0x20000558
----------------
IN:
0x20000558:  08000079  stmdaeq  r0, {r0, r3, r4, r5, r6}

(The double reset logging is the result of our long-standing
"CPUs all get reset twice" weirdness; it looks a bit ugly
but it'll go away if we ever fix that :-))

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c      | 5 +++++
 target/arm/m_helper.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 185d4e774d5..498fb9f71b3 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qemu/qemu-print.h"
 #include "qemu/timer.h"
+#include "qemu/log.h"
 #include "qemu-common.h"
 #include "target/arm/idau.h"
 #include "qemu/module.h"
@@ -366,6 +367,10 @@ static void arm_cpu_reset(DeviceState *dev)
             initial_pc = ldl_phys(s->as, vecbase + 4);
         }
 
+        qemu_log_mask(CPU_LOG_INT,
+                      "Loaded reset SP 0x%x PC 0x%x from vector table\n",
+                      initial_msp, initial_pc);
+
         env->regs[13] = initial_msp & 0xFFFFFFFC;
         env->regs[15] = initial_pc & ~1;
         env->thumb = initial_pc & 1;
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 648a3b3fc16..3bd16c0c465 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -679,6 +679,10 @@ static bool arm_v7m_load_vector(ARMCPU *cpu, int exc, bool targets_secure,
     ARMMMUIdx mmu_idx;
     bool exc_secure;
 
+    qemu_log_mask(CPU_LOG_INT,
+                  "...loading from element %d of %s vector table at 0x%x\n",
+                  exc, targets_secure ? "secure" : "non-secure", addr);
+
     mmu_idx = arm_v7m_mmu_idx_for_secstate_and_priv(env, targets_secure, true);
 
     /*
@@ -719,6 +723,7 @@ static bool arm_v7m_load_vector(ARMCPU *cpu, int exc, bool targets_secure,
         goto load_fail;
     }
     *pvec = vector_entry;
+    qemu_log_mask(CPU_LOG_INT, "...loaded new PC 0x%x\n", *pvec);
     return true;
 
 load_fail:
-- 
2.25.1


