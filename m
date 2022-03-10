Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F994D4650
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:52:46 +0100 (CET)
Received: from localhost ([::1]:55700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHLZ-0000Y0-UT
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:52:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxN-0005PD-VD
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:46 -0500
Received: from [2607:f8b0:4864:20::635] (port=33544
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxM-0007xW-AO
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:45 -0500
Received: by mail-pl1-x635.google.com with SMTP id m2so4642091pll.0
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f9kEO6gPHdFHbcVjWJEx3cRnSvZ1MpAPY6GCaaYYMWU=;
 b=v8U0sjgFWHyqvmqJGP/YPh3JcCGOqJHBjXqaxDD6pnBcgtV0GI5adzXGXDgnqmJSos
 NXjmn/UN8cobecQslh9/+UgzBr9ev+OuCaYMKfb3ua2KFXCSj2SanDatw0YS6DAPiH/f
 l2/KOejZBXxxUdJ75zqPaD00uiz8oSOQyq/v6SRpfulaluqsFJFhOndIwXqpgLEOQCov
 O7oT827s9Y0wQ/SHOzFLN0ruoVYFC1zYluU8y4mNtJlzlpLXDnVen88xIXarTfPOzzBY
 3aMP5Q6kM5fUvGRa7z7RqB/uSdLb0JGREvSBl/zCyYh1Xib86ucA26pfaYJWWp/8nhWu
 AfQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f9kEO6gPHdFHbcVjWJEx3cRnSvZ1MpAPY6GCaaYYMWU=;
 b=ZFmk315DH9dYSoh6jFXvWtyWZIusmnp9vUa1ZX6VfTVHa+HQ2bb5PMFejJBq8Nc6o7
 flNmxqmy9+c/kRK4p84fheTPPpqIhbW8d+7wW2fMxRHviE2zWTymc1jTFxTR0WdFCqRE
 5lWjscI+hsJB32vh8mAP836hUKYeqRuqWnS4tmdcg2Zq9lt1mJe0tOq4vpZ/xZo8AEpg
 1u9ttNXZXp+DusWZ+PEHWhE2Xa02t9QkrSFLK3kJu06IHTsQ1h3dDTZmeRD2t1fRpaGj
 pzVgOVa0Gc3SOnxMteFgyC5B22e/ee1XXFwSbMzSCP8wkqCM6kx48RPtXjjNzlln7mrL
 7PjA==
X-Gm-Message-State: AOAM531bznT8OZrs8paDK/K0zNnhoASHRZJLMMUqs3BX2bKbORPEBfzS
 mXh0WCnGLgCmmKHQNI84ZKmq0aU57yekDA==
X-Google-Smtp-Source: ABdhPJwoupIaLyZ0shfGkGDKFZSJTe/gDbDxJcJKVM+VE9A+bYB1PNUPf5hVnVlpqqlP3j7ItnRyZg==
X-Received: by 2002:a17:902:6b8b:b0:14d:66c4:f704 with SMTP id
 p11-20020a1709026b8b00b0014d66c4f704mr4617398plk.53.1646911663043; 
 Thu, 10 Mar 2022 03:27:43 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:27:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 15/48] target/nios2: Use hw/registerfields.h for CR_TLBADDR
 fields
Date: Thu, 10 Mar 2022 03:26:52 -0800
Message-Id: <20220310112725.570053-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use FIELD_EX32 and FIELD_DP32 instead of manual manipulation
of the fields.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h       |  8 ++++----
 target/nios2/helper.c    |  4 ++--
 target/nios2/mmu.c       | 17 +++++++++--------
 target/nios2/translate.c |  2 +-
 4 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 963cdec161..e1c2bf8c31 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -110,10 +110,10 @@ FIELD(CR_EXCEPTION, CAUSE, 2, 5)
 FIELD(CR_EXCEPTION, ECCFTL, 31, 1)
 
 #define CR_PTEADDR       8
-#define   CR_PTEADDR_PTBASE_SHIFT 22
-#define   CR_PTEADDR_PTBASE_MASK  (0x3FF << CR_PTEADDR_PTBASE_SHIFT)
-#define   CR_PTEADDR_VPN_SHIFT    2
-#define   CR_PTEADDR_VPN_MASK     (0xFFFFF << CR_PTEADDR_VPN_SHIFT)
+
+FIELD(CR_PTEADDR, VPN, 2, 20)
+FIELD(CR_PTEADDR, PTBASE, 22, 10)
+
 #define CR_TLBACC        9
 #define   CR_TLBACC_IGN_SHIFT 25
 #define   CR_TLBACC_IGN_MASK  (0x7F << CR_TLBACC_IGN_SHIFT)
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 54458a5447..da3a289fc7 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -306,8 +306,8 @@ bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     } else {
         env->ctrl[CR_TLBMISC] |= CR_TLBMISC_D;
     }
-    env->ctrl[CR_PTEADDR] &= CR_PTEADDR_PTBASE_MASK;
-    env->ctrl[CR_PTEADDR] |= (address >> 10) & CR_PTEADDR_VPN_MASK;
+    env->ctrl[CR_PTEADDR] = FIELD_DP32(env->ctrl[CR_PTEADDR], CR_PTEADDR, VPN,
+                                       address >> TARGET_PAGE_BITS);
     env->mmu.pteaddr_wr = env->ctrl[CR_PTEADDR];
 
     cs->exception_index = excp;
diff --git a/target/nios2/mmu.c b/target/nios2/mmu.c
index 95900724e8..75afc56daf 100644
--- a/target/nios2/mmu.c
+++ b/target/nios2/mmu.c
@@ -97,7 +97,7 @@ void helper_mmu_write_tlbacc(CPUNios2State *env, uint32_t v)
     /* if tlbmisc.WE == 1 then trigger a TLB write on writes to TLBACC */
     if (env->ctrl[CR_TLBMISC] & CR_TLBMISC_WR) {
         int way = (env->ctrl[CR_TLBMISC] >> CR_TLBMISC_WAY_SHIFT);
-        int vpn = (env->mmu.pteaddr_wr & CR_PTEADDR_VPN_MASK) >> 2;
+        int vpn = FIELD_EX32(env->mmu.pteaddr_wr, CR_PTEADDR, VPN);
         int pid = (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >> 4;
         int g = (v & CR_TLBACC_G) ? 1 : 0;
         int valid = ((vpn & CR_TLBACC_PFN_MASK) < 0xC0000) ? 1 : 0;
@@ -148,7 +148,7 @@ void helper_mmu_write_tlbmisc(CPUNios2State *env, uint32_t v)
     /* if tlbmisc.RD == 1 then trigger a TLB read on writes to TLBMISC */
     if (v & CR_TLBMISC_RD) {
         int way = (v >> CR_TLBMISC_WAY_SHIFT);
-        int vpn = (env->mmu.pteaddr_wr & CR_PTEADDR_VPN_MASK) >> 2;
+        int vpn = FIELD_EX32(env->mmu.pteaddr_wr, CR_PTEADDR, VPN);
         Nios2TLBEntry *entry =
             &env->mmu.tlb[(way * cpu->tlb_num_ways) +
                           (vpn & env->mmu.tlb_entry_mask)];
@@ -160,8 +160,9 @@ void helper_mmu_write_tlbmisc(CPUNios2State *env, uint32_t v)
             (v & ~CR_TLBMISC_PID_MASK) |
             ((entry->tag & ((1 << cpu->pid_num_bits) - 1)) <<
              CR_TLBMISC_PID_SHIFT);
-        env->ctrl[CR_PTEADDR] &= ~CR_PTEADDR_VPN_MASK;
-        env->ctrl[CR_PTEADDR] |= (entry->tag >> 12) << CR_PTEADDR_VPN_SHIFT;
+        env->ctrl[CR_PTEADDR] = FIELD_DP32(env->ctrl[CR_PTEADDR],
+                                           CR_PTEADDR, VPN,
+                                           entry->tag >> TARGET_PAGE_BITS);
     } else {
         env->ctrl[CR_TLBMISC] = v;
     }
@@ -171,12 +172,12 @@ void helper_mmu_write_tlbmisc(CPUNios2State *env, uint32_t v)
 
 void helper_mmu_write_pteaddr(CPUNios2State *env, uint32_t v)
 {
-    trace_nios2_mmu_write_pteaddr(v >> CR_PTEADDR_PTBASE_SHIFT,
-                                  (v & CR_PTEADDR_VPN_MASK) >> CR_PTEADDR_VPN_SHIFT);
+    trace_nios2_mmu_write_pteaddr(FIELD_EX32(v, CR_PTEADDR, PTBASE),
+                                  FIELD_EX32(v, CR_PTEADDR, VPN));
 
     /* Writes to PTEADDR don't change the read-back VPN value */
-    env->ctrl[CR_PTEADDR] = ((v & ~CR_PTEADDR_VPN_MASK) |
-                             (env->ctrl[CR_PTEADDR] & CR_PTEADDR_VPN_MASK));
+    env->ctrl[CR_PTEADDR] = ((v & ~R_CR_PTEADDR_VPN_MASK) |
+                             (env->ctrl[CR_PTEADDR] & R_CR_PTEADDR_VPN_MASK));
     env->mmu.pteaddr_wr = v;
 }
 
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 45fe2f9a05..9b81a2b29e 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -923,7 +923,7 @@ void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         }
     }
     qemu_fprintf(f, " mmu write: VPN=%05X PID %02X TLBACC %08X\n",
-                 env->mmu.pteaddr_wr & CR_PTEADDR_VPN_MASK,
+                 env->mmu.pteaddr_wr & R_CR_PTEADDR_VPN_MASK,
                  (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >> 4,
                  env->mmu.tlbacc_wr);
 #endif
-- 
2.25.1


