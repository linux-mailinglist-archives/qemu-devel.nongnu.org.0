Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B41CD5F1E5E
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 19:17:11 +0200 (CEST)
Received: from localhost ([::1]:41176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeg6w-0005f8-Rs
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 13:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefIQ-0000kp-28
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:58 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:35429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefIN-0006Nb-9o
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:57 -0400
Received: by mail-qt1-x82b.google.com with SMTP id g23so4351921qtu.2
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=oFbrxWVVhP20S+fjmMivVlKkgtDc/8Dpni4vZ5iFbtA=;
 b=vU6wYrs17obk+VOuEmRB21oaSwR9txXT/QMl6b74uvukqjgfMUbO6G1TTiOBx0DskI
 vv4C9+MClcLhODLJvWo4zKm+/QYFkix2zlKvndv9gfX8kDDm3vZZOYISfCbf3MUrZb/B
 6vcrjf2QezPOBafCTssBp8OI0+ePYO7QYp6N2ojcEJrVXBzgBgrhoaFKJOvTJn0D4ghM
 idiwF2jTnEnpMEA0YIgwCtTPGsgcgIaX+Mr84qzLBNguHveXuTOU9G75Fr0TZ7BGL5Zj
 ez/sMI/9uSFzcgvXHnZahBcYwVDptqvb9lAoXHXT8+TD/F/jMEROex5Sbov3ajTaZmlA
 S/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=oFbrxWVVhP20S+fjmMivVlKkgtDc/8Dpni4vZ5iFbtA=;
 b=V6HmMsFFObJhnRK7c/b6NsIAoA1YuaFOr7vsvAm9xXk8/ph3Ky47IL/v9MUsfVASEC
 BEI8ZV7sUeX2gK517PPcXtwXy/R/xpRicKde/LkG1q6GJ/5OZ7crsEmL5fwPoW0q0IpY
 RT2Ttp9n33FvUSQwXGPMGEXmL/XQFROIoctc7ufH8x+/WRsHhlOEfj4dh/WgIdpFge+O
 dzZNITdLJhly4QtE4JbyTjvp2mv51gj6Ft+DTv5kUcSGOChmDcEzO2cFTnXAlIp2XsLS
 VSiyiFsRKG4WQFBn83L65s+OWWVPv8SoAB+Fwmtv20GGfiMbHOwG2NgcgfC1Gts+7b/w
 447w==
X-Gm-Message-State: ACrzQf05eUpOt7/jSkAu2sfjK7Pa441pecgRHn5Zxj+NLUrDScga4PUB
 /lkCHaAuuvGUsxK5AaDNS3OjxEw6eLzjcw==
X-Google-Smtp-Source: AMsMyM7mNP5uLqVjvorujFAGivQtVwSRXiI2BjXz4kHa+cvqx1huaQMJ5iVlY/QJxDqCdS+tPytP2A==
X-Received: by 2002:ac8:4e48:0:b0:35d:5831:af31 with SMTP id
 e8-20020ac84e48000000b0035d5831af31mr11206288qtw.188.1664641494564; 
 Sat, 01 Oct 2022 09:24:54 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 38/42] target/arm: Fix fault reporting in get_phys_addr_lpae
Date: Sat,  1 Oct 2022 09:23:14 -0700
Message-Id: <20221001162318.153420-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index e6b385a8b1..01a27b30fb 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1065,8 +1065,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
-    /* Read an LPAE long-descriptor translation table. */
-    ARMFaultType fault_type = ARMFault_Translation;
     uint32_t level;
     ARMVAParameters param;
     uint64_t ttbr;
@@ -1104,8 +1102,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
          * so our choice is to always raise the fault.
          */
         if (param.tsz_oob) {
-            fault_type = ARMFault_Translation;
-            goto do_fault;
+            goto do_translation_fault;
         }
 
         addrsize = 64 - 8 * param.tbi;
@@ -1142,8 +1139,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                            addrsize - inputsize);
         if (-top_bits != param.select) {
             /* The gap between the two regions is a Translation fault */
-            fault_type = ARMFault_Translation;
-            goto do_fault;
+            goto do_translation_fault;
         }
     }
 
@@ -1175,7 +1171,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
          * Translation table walk disabled => Translation fault on TLB miss
          * Note: This is always 0 on 64-bit EL2 and EL3.
          */
-        goto do_fault;
+        goto do_translation_fault;
     }
 
     if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
@@ -1206,8 +1202,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         if (param.ds && stride == 9 && sl2) {
             if (sl0 != 0) {
                 level = 0;
-                fault_type = ARMFault_Translation;
-                goto do_fault;
+                goto do_translation_fault;
             }
             startlevel = -1;
         } else if (!aarch64 || stride == 9) {
@@ -1226,8 +1221,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         ok = check_s2_mmu_setup(cpu, aarch64, startlevel,
                                 inputsize, stride, outputsize);
         if (!ok) {
-            fault_type = ARMFault_Translation;
-            goto do_fault;
+            goto do_translation_fault;
         }
         level = startlevel;
     }
@@ -1249,7 +1243,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         descaddr |= extract64(ttbr, 2, 4) << 48;
     } else if (descaddr >> outputsize) {
         level = 0;
-        fault_type = ARMFault_AddressSize;
+        fi->type = ARMFault_AddressSize;
         goto do_fault;
     }
 
@@ -1299,7 +1293,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
     if (!(descriptor & 1) || (!(descriptor & 2) && (level == 3))) {
         /* Invalid, or the Reserved level 3 encoding */
-        goto do_fault;
+        goto do_translation_fault;
     }
 
     descaddr = descriptor & descaddrmask;
@@ -1317,7 +1311,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
             descaddr |= extract64(descriptor, 12, 4) << 48;
         }
     } else if (descaddr >> outputsize) {
-        fault_type = ARMFault_AddressSize;
+        fi->type = ARMFault_AddressSize;
         goto do_fault;
     }
 
@@ -1374,9 +1368,9 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
      * Here descaddr is the final physical address, and attributes
      * are all in attrs.
      */
-    fault_type = ARMFault_AccessFlag;
     if ((attrs & (1 << 8)) == 0) {
         /* Access flag */
+        fi->type = ARMFault_AccessFlag;
         goto do_fault;
     }
 
@@ -1393,8 +1387,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
     }
 
-    fault_type = ARMFault_Permission;
     if (!(result->f.prot & (1 << access_type))) {
+        fi->type = ARMFault_Permission;
         goto do_fault;
     }
 
@@ -1439,8 +1433,9 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     result->f.lg_page_size = ctz64(page_size);
     return false;
 
-do_fault:
-    fi->type = fault_type;
+ do_translation_fault:
+    fi->type = ARMFault_Translation;
+ do_fault:
     fi->level = level;
     /* Tag the error as S2 for failed S1 PTW at S2 or ordinary S2.  */
     fi->stage2 = fi->s1ptw || (mmu_idx == ARMMMUIdx_Stage2 ||
-- 
2.34.1


