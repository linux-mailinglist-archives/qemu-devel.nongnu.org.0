Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8677C60D1E2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:49:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMyr-0006UH-Tt; Tue, 25 Oct 2022 12:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyg-0006Cm-1p
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:34 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyM-0001cF-ML
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:24 -0400
Received: by mail-wm1-x335.google.com with SMTP id n14so4242064wmq.3
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AbaC8j7lSp9Xzob/VbyJAgzqpmUf06lrerwAPEuh6PU=;
 b=p/E0v1XvaWp06Wvwq3qPHFZkUb8WNrHB8oQsIyBU583B3s9b1KHdzGRkuXyoZjXtht
 KHQj/r5/jep+ZBlrzjknd0vIbz568fIUyYb9c9ebd9OvyCvWxcRpXQOQJQ9fZTWX/RGm
 Q1WEI9uomkcV5X3VZNBnwMJoM2ULAn5+PvuDs3waVRnT00JCyyyuekBggZoFNBXPh0nD
 tDPKQxs34D7NStJLhiBTSS0/O6G/PmQYrkq/GqkmzKfJEz+hdvEOZXpWLUY/6yaR78/A
 RmPArJ7WAIlm/chl064aMGzws6Tr60x0oE0uGgi7LxbixGs5Shj7IqGokV5WWmGbI6at
 ZVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AbaC8j7lSp9Xzob/VbyJAgzqpmUf06lrerwAPEuh6PU=;
 b=FajoKLk4ASf/VfQ6bqMVI03rn2fLwN+4/5pM8enOM1Cu4QfFXqbqIwWJ5rH/t2uddR
 zZOUqze4yw4RS0OqoMlyIl+jJAEg0vdbtrbwlQhA3aQh9iwEUlDYNJOd9wXSNIx7VS7V
 7YUITus26kVfJ/W3y1dQq7nLG2QcOFIvKLiWho3v42DIVWo8LBmGVziD65+rOAr4oy3e
 HlUeIz3kb4y2Bpf07JZy0Vr7C9pcgvxLsApkmd96JR32FE7e1rQydEWF5HjWqF9G4l60
 A5ClDVWYAwyPZ1U5erPZCX4VUU2cGQ3ov8MCZn7PGUHk7ebSd4QK6GjcB5GoKEJFD37I
 bRFQ==
X-Gm-Message-State: ACrzQf05gM/fOewwi+iyvIg65XN490lT5RQ/P0SsuMI/cKiy+zrO9JvG
 VXnRESDZtmx+9GCM9OEB3l40+PFJS2mP2w==
X-Google-Smtp-Source: AMsMyM4+8W4zhuZ3OF0jxo6D/XrY5VhLBcVEcBjmv4RktfwbaYY0Yvoq5XMSRXvbVukjavIYd0m3RA==
X-Received: by 2002:a05:600c:3107:b0:3c6:ff0a:c42 with SMTP id
 g7-20020a05600c310700b003c6ff0a0c42mr25797684wmo.141.1666716012108; 
 Tue, 25 Oct 2022 09:40:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c220c00b003cd9c26a0basm2971084wml.40.2022.10.25.09.40.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:40:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/30] target/arm: Fix fault reporting in get_phys_addr_lpae
Date: Tue, 25 Oct 2022 17:39:36 +0100
Message-Id: <20221025163952.4131046-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025163952.4131046-1-peter.maydell@linaro.org>
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

Always overriding fi->type was incorrect, as we would not properly
propagate the fault type from S1_ptw_translate, or arm_ldq_ptw.
Simplify things by providing a new label for a translation fault.
For other faults, store into fi directly.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20221024051851.3074715-9-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 2a5f0188357..3302376e42e 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1044,8 +1044,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     ARMCPU *cpu = env_archcpu(env);
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
     bool is_secure = ptw->in_secure;
-    /* Read an LPAE long-descriptor translation table. */
-    ARMFaultType fault_type = ARMFault_Translation;
     uint32_t level;
     ARMVAParameters param;
     uint64_t ttbr;
@@ -1082,8 +1080,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
          * so our choice is to always raise the fault.
          */
         if (param.tsz_oob) {
-            fault_type = ARMFault_Translation;
-            goto do_fault;
+            goto do_translation_fault;
         }
 
         addrsize = 64 - 8 * param.tbi;
@@ -1120,8 +1117,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
                                            addrsize - inputsize);
         if (-top_bits != param.select) {
             /* The gap between the two regions is a Translation fault */
-            fault_type = ARMFault_Translation;
-            goto do_fault;
+            goto do_translation_fault;
         }
     }
 
@@ -1147,7 +1143,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
          * Translation table walk disabled => Translation fault on TLB miss
          * Note: This is always 0 on 64-bit EL2 and EL3.
          */
-        goto do_fault;
+        goto do_translation_fault;
     }
 
     if (!regime_is_stage2(mmu_idx)) {
@@ -1178,8 +1174,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         if (param.ds && stride == 9 && sl2) {
             if (sl0 != 0) {
                 level = 0;
-                fault_type = ARMFault_Translation;
-                goto do_fault;
+                goto do_translation_fault;
             }
             startlevel = -1;
         } else if (!aarch64 || stride == 9) {
@@ -1198,8 +1193,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         ok = check_s2_mmu_setup(cpu, aarch64, startlevel,
                                 inputsize, stride, outputsize);
         if (!ok) {
-            fault_type = ARMFault_Translation;
-            goto do_fault;
+            goto do_translation_fault;
         }
         level = startlevel;
     }
@@ -1221,7 +1215,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         descaddr |= extract64(ttbr, 2, 4) << 48;
     } else if (descaddr >> outputsize) {
         level = 0;
-        fault_type = ARMFault_AddressSize;
+        fi->type = ARMFault_AddressSize;
         goto do_fault;
     }
 
@@ -1282,7 +1276,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
 
     if (!(descriptor & 1) || (!(descriptor & 2) && (level == 3))) {
         /* Invalid, or the Reserved level 3 encoding */
-        goto do_fault;
+        goto do_translation_fault;
     }
 
     descaddr = descriptor & descaddrmask;
@@ -1300,7 +1294,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
             descaddr |= extract64(descriptor, 12, 4) << 48;
         }
     } else if (descaddr >> outputsize) {
-        fault_type = ARMFault_AddressSize;
+        fi->type = ARMFault_AddressSize;
         goto do_fault;
     }
 
@@ -1357,9 +1351,9 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      * Here descaddr is the final physical address, and attributes
      * are all in attrs.
      */
-    fault_type = ARMFault_AccessFlag;
     if ((attrs & (1 << 8)) == 0) {
         /* Access flag */
+        fi->type = ARMFault_AccessFlag;
         goto do_fault;
     }
 
@@ -1376,8 +1370,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
     }
 
-    fault_type = ARMFault_Permission;
     if (!(result->f.prot & (1 << access_type))) {
+        fi->type = ARMFault_Permission;
         goto do_fault;
     }
 
@@ -1422,8 +1416,9 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     result->f.lg_page_size = ctz64(page_size);
     return false;
 
-do_fault:
-    fi->type = fault_type;
+ do_translation_fault:
+    fi->type = ARMFault_Translation;
+ do_fault:
     fi->level = level;
     /* Tag the error as S2 for failed S1 PTW at S2 or ordinary S2.  */
     fi->stage2 = fi->s1ptw || regime_is_stage2(mmu_idx);
-- 
2.25.1


