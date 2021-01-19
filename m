Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D59F42FBB38
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:32:47 +0100 (CET)
Received: from localhost ([::1]:53284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1szu-0008FF-V5
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:32:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfH-0007iq-Sb
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:27 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfC-0001H2-Py
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:27 -0500
Received: by mail-wr1-x436.google.com with SMTP id a12so20053691wrv.8
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YN39R4c0KMjFC7RtaixmdY3gC9uLkKWu7HgTkhu0Fjw=;
 b=Di5eKBio/dIjWuqiA6liUpUD1jq5gFYtsN/HA5lN5BVdUHlm5BGBICHl4NJ1Yabf4Y
 6cqslZBshwcYwR/oZ/OYPVhfEol7YvXlXxxKOtpSpgf5e8jZpfy0YaORm8hKg6dWBzDz
 mC2+9A2z7BydqCfb3/0xU81mG5x4WTgApMskLd+uzD1zksHw1iejntd8MbgU4jNN6fGo
 mfCXJPrXa7ej8ozyDZwB3DxJVpfzjyZLENBSpDdoqpxCvo4MUPH2GxGePORCw/IVD2US
 kLvaM/JDLuvC0MZfGbhB7qGdYk3Xae/eOihRSVncNH5+8oIcd2RmizGtyW7xGIp9JKen
 DwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YN39R4c0KMjFC7RtaixmdY3gC9uLkKWu7HgTkhu0Fjw=;
 b=QwfcAMlBcBZ1TiFBUNbggRnDsxJlDFCcnd9ErdnrA09KIJrf+i/xrS+/aYXQzR7Uca
 lBPm7ZksbC04G7EZChSkqy6aQF2xqhtdDmRLxpbI3Iaq7rRI60tr0zz96ea5qLoB6JJx
 pWVwJDFNEd3+/UNdGdpvc4NG8KGHs4OJDDCQ+BbUvsTesoiQoOqDe4TO3hyJnyeZEQcp
 M9p5y7QdMC8SiCKOK0aL4MGxOtEhmn0/pmC3JhzzBjIP2HJrzLuq39WEz4FnhopwhTlc
 xQX5kn5GNRv86V0g4MaeWkIqH3ImtxOXnLR03BmMc5DWhAiCYgW/j6tNQZehLP9mBMlv
 kEog==
X-Gm-Message-State: AOAM530d6lQBnacc3ESEXtoGvsgcHk0mbZS70Ndn8BlEzFSNVRJQzs8D
 aHOZlIVrGiaAGu6w2GYLFsBJ943hO06+6A==
X-Google-Smtp-Source: ABdhPJzVUzQY5rxzLPb4JAXzSXEEXFIwc22y2qMsD/yBQgISmzP92SCcWJ2eGRi08FwpbK3LftL7Ww==
X-Received: by 2002:adf:e883:: with SMTP id d3mr4866617wrm.139.1611069081405; 
 Tue, 19 Jan 2021 07:11:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/33] target/arm: set HPFAR_EL2.NS on secure stage 2 faults
Date: Tue, 19 Jan 2021 15:10:49 +0000
Message-Id: <20210119151104.16264-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119151104.16264-1-peter.maydell@linaro.org>
References: <20210119151104.16264-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210112104511.36576-15-remi.denis.courmont@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h        | 2 ++
 target/arm/internals.h  | 2 ++
 target/arm/helper.c     | 6 ++++++
 target/arm/tlb_helper.c | 3 +++
 4 files changed, 13 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 235df64cd7a..b115da59359 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1484,6 +1484,8 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define HCR_TWEDEN    (1ULL << 59)
 #define HCR_TWEDEL    MAKE_64BIT_MASK(60, 4)
 
+#define HPFAR_NS      (1ULL << 63)
+
 #define SCR_NS                (1U << 0)
 #define SCR_IRQ               (1U << 1)
 #define SCR_FIQ               (1U << 2)
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 3aec10263e0..27cc93f15ac 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -593,6 +593,7 @@ typedef enum ARMFaultType {
  * @s2addr: Address that caused a fault at stage 2
  * @stage2: True if we faulted at stage 2
  * @s1ptw: True if we faulted at stage 2 while doing a stage 1 page-table walk
+ * @s1ns: True if we faulted on a non-secure IPA while in secure state
  * @ea: True if we should set the EA (external abort type) bit in syndrome
  */
 typedef struct ARMMMUFaultInfo ARMMMUFaultInfo;
@@ -603,6 +604,7 @@ struct ARMMMUFaultInfo {
     int domain;
     bool stage2;
     bool s1ptw;
+    bool s1ns;
     bool ea;
 };
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index fae5611c603..79164a03e07 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3445,6 +3445,9 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
                 target_el = 3;
             } else {
                 env->cp15.hpfar_el2 = extract64(fi.s2addr, 12, 47) << 4;
+                if (arm_is_secure_below_el3(env) && fi.s1ns) {
+                    env->cp15.hpfar_el2 |= HPFAR_NS;
+                }
                 target_el = 2;
             }
             take_exc = true;
@@ -10427,6 +10430,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             fi->s2addr = addr;
             fi->stage2 = true;
             fi->s1ptw = true;
+            fi->s1ns = !*is_secure;
             return ~0;
         }
         if ((arm_hcr_el2_eff(env) & HCR_PTW) &&
@@ -10439,6 +10443,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             fi->s2addr = addr;
             fi->stage2 = true;
             fi->s1ptw = true;
+            fi->s1ns = !*is_secure;
             return ~0;
         }
 
@@ -11356,6 +11361,7 @@ do_fault:
     /* Tag the error as S2 for failed S1 PTW at S2 or ordinary S2.  */
     fi->stage2 = fi->s1ptw || (mmu_idx == ARMMMUIdx_Stage2 ||
                                mmu_idx == ARMMMUIdx_Stage2_S);
+    fi->s1ns = mmu_idx == ARMMMUIdx_Stage2;
     return true;
 }
 
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index b35dc8a0118..df85079d9f0 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -63,6 +63,9 @@ static void QEMU_NORETURN arm_deliver_fault(ARMCPU *cpu, vaddr addr,
     if (fi->stage2) {
         target_el = 2;
         env->cp15.hpfar_el2 = extract64(fi->s2addr, 12, 47) << 4;
+        if (arm_is_secure_below_el3(env) && fi->s1ns) {
+            env->cp15.hpfar_el2 |= HPFAR_NS;
+        }
     }
     same_el = (arm_current_el(env) == target_el);
 
-- 
2.20.1


