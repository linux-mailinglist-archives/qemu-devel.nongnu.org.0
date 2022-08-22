Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DD959C4EA
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 19:22:09 +0200 (CEST)
Received: from localhost ([::1]:50816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQB7o-0000vZ-Pz
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 13:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9PC-0004v1-Fs
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:58 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:36386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Ov-0001hw-BS
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:58 -0400
Received: by mail-pf1-x433.google.com with SMTP id w29so5121499pfj.3
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=85RaASzLJRUjYB2qlDOH84qmiuMV9YHjafoqZXxUOdU=;
 b=MxYK43xoqwGL/CXWmMqzDSBIbQLaX9W2NsN3UHIBRH4DnjD8MuvRi2KrB+V/VsUEqI
 vBDwA1G+JXUnQgQFWBFBgt0ts1n1pVsq0Wzh517Ilg1aY9TqztBqHs1lCRuYsCT5lJ98
 MluMV914+p6At911sebK3aMozAjUV4EXwHeJy47JnxInQ//0BQZKj/DOXwF6F3sT4crv
 kIySKgyKsWDoYipbtQOsLBca3Qc6n74Af96d5jt3rKQrMY6oAB9JBLjs56XDeWQuAufm
 tqj1wh1+szapDXdd/weTyCbjN8kXv4pynqPXi252eQDiMQbr6C2/Pw7DmHr+mLwdngTL
 rIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=85RaASzLJRUjYB2qlDOH84qmiuMV9YHjafoqZXxUOdU=;
 b=ZNbhElg7heeP/nrslcH7MCO0V3NrA1rEAH/4s2lMNRweLUMc3LP8SkNH3Z7zLUQAV7
 ClbBnauTbNU8MGjKKSKWOH7wwXAxpAHQGTebli/R9mzipNFz+xtN9wupKiEYsTsJCf46
 jYtqt7GuHEylkKws45AroP3n2C5QL/PD/uVpdBK0efqdsx3XKI05b+qx2VIW3WszrmES
 11ZXUjhVqh512hAyYAE2Gj1OXB6IYFRKjuu+L8bOy5KNEjC3ykk0byCIkaSY0ppfSban
 NfH1Stkytge2ynqOQx9YA4X5NQspnWjLVMw9dByJ9TQNmNR1uYrKNV0eb6Z1RVx9l1EM
 q0dQ==
X-Gm-Message-State: ACgBeo3QNOaC052CPjSCGlqDVEbU8B8WsnfEGvKhzALRZOx1B0Whs2Z7
 48a8gTYAM2Debf+Q3X+5m3ZXd1E8gxTDzQ==
X-Google-Smtp-Source: AA6agR7YdU83dgsioDJnOJfdAKvHGrEeyxt3KkG9b6ZmTetxDFnl5fzghzF71Xhwyvdd2601SxDZ0Q==
X-Received: by 2002:a63:89c6:0:b0:429:a28d:7b4 with SMTP id
 v189-20020a6389c6000000b00429a28d07b4mr17261788pgd.42.1661182297019; 
 Mon, 22 Aug 2022 08:31:37 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 63/66] target/arm: Fix fault reporting in get_phys_addr_lpae
Date: Mon, 22 Aug 2022 08:27:38 -0700
Message-Id: <20220822152741.1617527-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
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
index d0981d94d1..5f3841b466 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1015,8 +1015,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
-    /* Read an LPAE long-descriptor translation table. */
-    ARMFaultType fault_type = ARMFault_Translation;
     uint32_t level;
     ARMVAParameters param;
     uint64_t ttbr;
@@ -1054,8 +1052,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
          * so our choice is to always raise the fault.
          */
         if (param.tsz_oob) {
-            fault_type = ARMFault_Translation;
-            goto do_fault;
+            goto do_translation_fault;
         }
 
         addrsize = 64 - 8 * param.tbi;
@@ -1092,8 +1089,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                            addrsize - inputsize);
         if (-top_bits != param.select) {
             /* The gap between the two regions is a Translation fault */
-            fault_type = ARMFault_Translation;
-            goto do_fault;
+            goto do_translation_fault;
         }
     }
 
@@ -1125,7 +1121,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
          * Translation table walk disabled => Translation fault on TLB miss
          * Note: This is always 0 on 64-bit EL2 and EL3.
          */
-        goto do_fault;
+        goto do_translation_fault;
     }
 
     if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
@@ -1156,8 +1152,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         if (param.ds && stride == 9 && sl2) {
             if (sl0 != 0) {
                 level = 0;
-                fault_type = ARMFault_Translation;
-                goto do_fault;
+                goto do_translation_fault;
             }
             startlevel = -1;
         } else if (!aarch64 || stride == 9) {
@@ -1176,8 +1171,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         ok = check_s2_mmu_setup(cpu, aarch64, startlevel,
                                 inputsize, stride, outputsize);
         if (!ok) {
-            fault_type = ARMFault_Translation;
-            goto do_fault;
+            goto do_translation_fault;
         }
         level = startlevel;
     }
@@ -1199,7 +1193,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         descaddr |= extract64(ttbr, 2, 4) << 48;
     } else if (descaddr >> outputsize) {
         level = 0;
-        fault_type = ARMFault_AddressSize;
+        fi->type = ARMFault_AddressSize;
         goto do_fault;
     }
 
@@ -1249,7 +1243,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
     if (!(descriptor & 1) || (!(descriptor & 2) && (level == 3))) {
         /* Invalid, or the Reserved level 3 encoding */
-        goto do_fault;
+        goto do_translation_fault;
     }
 
     descaddr = descriptor & descaddrmask;
@@ -1267,7 +1261,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
             descaddr |= extract64(descriptor, 12, 4) << 48;
         }
     } else if (descaddr >> outputsize) {
-        fault_type = ARMFault_AddressSize;
+        fi->type = ARMFault_AddressSize;
         goto do_fault;
     }
 
@@ -1324,9 +1318,9 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
      * Here descaddr is the final physical address, and attributes
      * are all in attrs.
      */
-    fault_type = ARMFault_AccessFlag;
     if ((attrs & (1 << 8)) == 0) {
         /* Access flag */
+        fi->type = ARMFault_AccessFlag;
         goto do_fault;
     }
 
@@ -1343,8 +1337,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
     }
 
-    fault_type = ARMFault_Permission;
     if (!(result->f.prot & (1 << access_type))) {
+        fi->type = ARMFault_Permission;
         goto do_fault;
     }
 
@@ -1389,8 +1383,9 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
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


