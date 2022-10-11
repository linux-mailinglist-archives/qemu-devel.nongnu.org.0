Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAD75FAB47
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 05:42:53 +0200 (CEST)
Received: from localhost ([::1]:56920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi6AP-0006nd-0T
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 23:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5o9-0002hm-2C
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:53 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:33661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5o7-00038P-Bw
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:52 -0400
Received: by mail-pg1-x52f.google.com with SMTP id f193so11830100pgc.0
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 20:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JyqDFzcDDxaZLADzD0GCm51gPMwBsgamq3ZkxmoSGeA=;
 b=OE0TB5uLs6bj9+ksRf+VC0vrhDph/IcghoHXZ+0fe7Bpa37UwGcpOOOh4g+jr16yYr
 1aUqITTHb0ncwSAlbcFHPewMfS0FR3q84+8AQuuuDHZKH0lUUVDIWNNzXCskWwkhOki4
 ktt0zvqtgY9AXgwCind0tqnv3fwupMOKAXULW+V/5+v8KlHgTT8tWacUcwZgBwmH50Eu
 WukUXpkefB62D5K7X01LjU9CKfKve+LB6iiGEVZOxhfFkaLM/W2Nqmb4JloJjyp4DYm7
 esfZB16nPRfzZxrJ+A+IQ0hs8KSBXEb/LvFLVUQ2yu5Pbz5eBNBguxk/8yisH0+N/TpB
 OuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JyqDFzcDDxaZLADzD0GCm51gPMwBsgamq3ZkxmoSGeA=;
 b=Uu1d6yHRyzEllXgW3dzlXUwDB48mySOb0tj0AsL4w/HLNQsvI9u21XT5/gKFeClNqA
 8iIhFQr30fF50rIP0VkUr475hsNqfhyNAv5bPEMpNQxy+0oGBNTp4DVtwWPT+pIdrPal
 ndrg2ttdUV2xrA1zbQYuFwguYCt2Jqq8kdBQp/eX+UlbN8Mas5R+ohaKUZzjOeXg1jO7
 jCUYgW3kiWybcdlOZm9WFeITp5TByFaJ0HEFfAg60KYRJGo+f986tGRRXmPIU93F+soH
 XGUwYq17NRJMArHUCHGlchma37iqYDqp63Jm8zmWFmJeqLyR7+JJpneVBzurVM5WMTtJ
 Qijg==
X-Gm-Message-State: ACrzQf2VYGRj8kZPbZhVaRGwGmnCbWSeE0oWSWc8qZFhmpA7jpBiAp/B
 Lp3eCIhn3Fb5FlXHUaPK5vg0YByw0o+4DQ==
X-Google-Smtp-Source: AMsMyM7atgxgrTs0hbeIu+E+Iquw60TLnhFPZWCHFiwz/ptDqo8yErbzQsQtD/ZrtzZvnGEA0WWbpw==
X-Received: by 2002:a05:6a00:134f:b0:563:7aa8:5cea with SMTP id
 k15-20020a056a00134f00b005637aa85ceamr6098400pfu.69.1665458389473; 
 Mon, 10 Oct 2022 20:19:49 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 19/24] target/arm: Fix fault reporting in get_phys_addr_lpae
Date: Mon, 10 Oct 2022 20:19:06 -0700
Message-Id: <20221011031911.2408754-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index 9b767f8236..acbf09cce8 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1065,8 +1065,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     ARMCPU *cpu = env_archcpu(env);
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
     bool is_secure = ptw->in_secure;
-    /* Read an LPAE long-descriptor translation table. */
-    ARMFaultType fault_type = ARMFault_Translation;
     uint32_t level;
     ARMVAParameters param;
     uint64_t ttbr;
@@ -1103,8 +1101,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
          * so our choice is to always raise the fault.
          */
         if (param.tsz_oob) {
-            fault_type = ARMFault_Translation;
-            goto do_fault;
+            goto do_translation_fault;
         }
 
         addrsize = 64 - 8 * param.tbi;
@@ -1141,8 +1138,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
                                            addrsize - inputsize);
         if (-top_bits != param.select) {
             /* The gap between the two regions is a Translation fault */
-            fault_type = ARMFault_Translation;
-            goto do_fault;
+            goto do_translation_fault;
         }
     }
 
@@ -1168,7 +1164,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
          * Translation table walk disabled => Translation fault on TLB miss
          * Note: This is always 0 on 64-bit EL2 and EL3.
          */
-        goto do_fault;
+        goto do_translation_fault;
     }
 
     if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
@@ -1199,8 +1195,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         if (param.ds && stride == 9 && sl2) {
             if (sl0 != 0) {
                 level = 0;
-                fault_type = ARMFault_Translation;
-                goto do_fault;
+                goto do_translation_fault;
             }
             startlevel = -1;
         } else if (!aarch64 || stride == 9) {
@@ -1219,8 +1214,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         ok = check_s2_mmu_setup(cpu, aarch64, startlevel,
                                 inputsize, stride, outputsize);
         if (!ok) {
-            fault_type = ARMFault_Translation;
-            goto do_fault;
+            goto do_translation_fault;
         }
         level = startlevel;
     }
@@ -1242,7 +1236,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         descaddr |= extract64(ttbr, 2, 4) << 48;
     } else if (descaddr >> outputsize) {
         level = 0;
-        fault_type = ARMFault_AddressSize;
+        fi->type = ARMFault_AddressSize;
         goto do_fault;
     }
 
@@ -1296,7 +1290,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
 
     if (!(descriptor & 1) || (!(descriptor & 2) && (level == 3))) {
         /* Invalid, or the Reserved level 3 encoding */
-        goto do_fault;
+        goto do_translation_fault;
     }
 
     descaddr = descriptor & descaddrmask;
@@ -1314,7 +1308,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
             descaddr |= extract64(descriptor, 12, 4) << 48;
         }
     } else if (descaddr >> outputsize) {
-        fault_type = ARMFault_AddressSize;
+        fi->type = ARMFault_AddressSize;
         goto do_fault;
     }
 
@@ -1371,9 +1365,9 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      * Here descaddr is the final physical address, and attributes
      * are all in attrs.
      */
-    fault_type = ARMFault_AccessFlag;
     if ((attrs & (1 << 8)) == 0) {
         /* Access flag */
+        fi->type = ARMFault_AccessFlag;
         goto do_fault;
     }
 
@@ -1390,8 +1384,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
     }
 
-    fault_type = ARMFault_Permission;
     if (!(result->f.prot & (1 << access_type))) {
+        fi->type = ARMFault_Permission;
         goto do_fault;
     }
 
@@ -1436,8 +1430,9 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
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


