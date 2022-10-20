Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E553606B92
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 00:48:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oleKy-0005zb-DB
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:48:28 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ole9x-0007Ws-3g
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9n-0006ws-Gg
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:36:55 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9l-0000yZ-Lu
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:36:55 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 t10-20020a17090a4e4a00b0020af4bcae10so1041132pjl.3
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 15:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sdisIrMnl1TYgX+y3Jca2Lvj3mz6slgwmrdpC7jGGrw=;
 b=uZlkEVVZbjtdheSQ0PptYSIW9spXJguEU8StOTfpBUDMoMSSxPycObL8y11FkbmuHL
 OBnDYXMoHMaGdQwQx6aIOObpJgNfKVyCwQspJjSgTLT45JjDzVFaoajL6cT9TDxaGJr0
 w89+MlJXuESUvQ4YHFm9NDQ6O/fmmZrcekLLrSa8lmKKLgaLnk52RIrQwRZZ2KwSCZk+
 2o/Cly2srTT/HmMFVE0wPJMXKLOx1c6M/zkcthobXmlWEKzphgkjywjzQv9u7RAFM3fz
 fbErwWH3MO46OyQRyzga+TTDpWFH/4AT+ta5ojjLs28i4xjdXF1+hri16PuM0AmHoM1R
 em9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sdisIrMnl1TYgX+y3Jca2Lvj3mz6slgwmrdpC7jGGrw=;
 b=ssBQQxSLoZUGKHxjEfwF64svXzCiDWJLeZYLKIw71GgNP47U3fT6DLHmFIFvU/pzrK
 28Ff5XytOEFWeMOKlaMq/mCy0NKXwoJ6HWpvVOCooKpv2hnpMM569GnNjsJs0fTx1npO
 3eMy9pgTNvcJXlvQMgp8bJjTR1qy5oZCXmgALPehQratqUcOOfyeTnGiv+KXSGb04CFK
 P/nHuinkED18G3WmzdjbRLnfU8M2inhAXPycoRb43ohC8NDaYr29RUA1uST2dXR9xe9s
 CSifUYG3uJvBjFKkMJ5PusBRmG02LDs7K5OAZREULG3tUPd/0ypO2EcBsEZnvnBNIdtb
 oQ3Q==
X-Gm-Message-State: ACrzQf047cQBB7bUYP0kPRKM6JVq2zXhI1lEV3/NKeyT5j91g9/0Nx2r
 EPGZYRV/7I1uv1so/hrHiPn3tJ+M3GXZEH+A
X-Google-Smtp-Source: AMsMyM7GEdQAC4HJqZ4TtpV38wzFG4uhdPapS7xP+WtmagpEafl5fyY7xTPOvI3FlrNoi33q2RNLAA==
X-Received: by 2002:a17:903:32ce:b0:17f:75dd:de88 with SMTP id
 i14-20020a17090332ce00b0017f75ddde88mr16188405plr.5.1666305412792; 
 Thu, 20 Oct 2022 15:36:52 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 r10-20020aa7988a000000b0054cd16c9f6bsm13753841pfl.200.2022.10.20.15.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 15:36:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 08/14] target/arm: Fix fault reporting in get_phys_addr_lpae
Date: Fri, 21 Oct 2022 08:35:42 +1000
Message-Id: <20221020223548.2310496-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020223548.2310496-1-richard.henderson@linaro.org>
References: <20221020223548.2310496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Always overriding fi->type was incorrect, as we would not properly
propagate the fault type from S1_ptw_translate, or arm_ldq_ptw.
Simplify things by providing a new label for a translation fault.
For other faults, store into fi directly.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 615471699e..cd16b42c96 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1063,8 +1063,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     ARMCPU *cpu = env_archcpu(env);
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
     bool is_secure = ptw->in_secure;
-    /* Read an LPAE long-descriptor translation table. */
-    ARMFaultType fault_type = ARMFault_Translation;
     uint32_t level;
     ARMVAParameters param;
     uint64_t ttbr;
@@ -1101,8 +1099,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
          * so our choice is to always raise the fault.
          */
         if (param.tsz_oob) {
-            fault_type = ARMFault_Translation;
-            goto do_fault;
+            goto do_translation_fault;
         }
 
         addrsize = 64 - 8 * param.tbi;
@@ -1139,8 +1136,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
                                            addrsize - inputsize);
         if (-top_bits != param.select) {
             /* The gap between the two regions is a Translation fault */
-            fault_type = ARMFault_Translation;
-            goto do_fault;
+            goto do_translation_fault;
         }
     }
 
@@ -1166,7 +1162,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
          * Translation table walk disabled => Translation fault on TLB miss
          * Note: This is always 0 on 64-bit EL2 and EL3.
          */
-        goto do_fault;
+        goto do_translation_fault;
     }
 
     if (!regime_is_stage2(mmu_idx)) {
@@ -1197,8 +1193,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         if (param.ds && stride == 9 && sl2) {
             if (sl0 != 0) {
                 level = 0;
-                fault_type = ARMFault_Translation;
-                goto do_fault;
+                goto do_translation_fault;
             }
             startlevel = -1;
         } else if (!aarch64 || stride == 9) {
@@ -1217,8 +1212,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         ok = check_s2_mmu_setup(cpu, aarch64, startlevel,
                                 inputsize, stride, outputsize);
         if (!ok) {
-            fault_type = ARMFault_Translation;
-            goto do_fault;
+            goto do_translation_fault;
         }
         level = startlevel;
     }
@@ -1240,7 +1234,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         descaddr |= extract64(ttbr, 2, 4) << 48;
     } else if (descaddr >> outputsize) {
         level = 0;
-        fault_type = ARMFault_AddressSize;
+        fi->type = ARMFault_AddressSize;
         goto do_fault;
     }
 
@@ -1301,7 +1295,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
 
     if (!(descriptor & 1) || (!(descriptor & 2) && (level == 3))) {
         /* Invalid, or the Reserved level 3 encoding */
-        goto do_fault;
+        goto do_translation_fault;
     }
 
     descaddr = descriptor & descaddrmask;
@@ -1319,7 +1313,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
             descaddr |= extract64(descriptor, 12, 4) << 48;
         }
     } else if (descaddr >> outputsize) {
-        fault_type = ARMFault_AddressSize;
+        fi->type = ARMFault_AddressSize;
         goto do_fault;
     }
 
@@ -1376,9 +1370,9 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      * Here descaddr is the final physical address, and attributes
      * are all in attrs.
      */
-    fault_type = ARMFault_AccessFlag;
     if ((attrs & (1 << 8)) == 0) {
         /* Access flag */
+        fi->type = ARMFault_AccessFlag;
         goto do_fault;
     }
 
@@ -1395,8 +1389,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
     }
 
-    fault_type = ARMFault_Permission;
     if (!(result->f.prot & (1 << access_type))) {
+        fi->type = ARMFault_Permission;
         goto do_fault;
     }
 
@@ -1441,8 +1435,9 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
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
2.34.1


