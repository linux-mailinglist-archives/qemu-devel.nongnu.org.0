Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AF45F1DD0
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 18:44:53 +0200 (CEST)
Received: from localhost ([::1]:44180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oefbg-0005rU-5v
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 12:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHY-0006ky-OE
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:06 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:46856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHW-0006Hd-0k
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:03 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id j8so4634171qvt.13
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=4bFcMUoE4kIp+2MWdZM5AsV1Ns0C4SweuGTMktPkM3A=;
 b=RmJrPXJWq/ozpee8FKrA5+CKrZFEc6P5gjFoLee1ET3rtcfkjbr9IEDLwCMC5LWfVZ
 +vdiwm/iiN+ET2ste4EwEkUtCGFbWuOLC+VlVc+uwhxfUxgMmlYPAclypK+XRcnjIXpc
 I5f3l+j3FKHsKhgJvWkD6+eSllHvCIY7JI1J9mkm4xtvdrug595RGc7bzQqqP0AkAL7C
 ecxcKq1UtgBKPCCa7qnQl9D+4WCHorv/c9zaa71V/sNGixlxyyWZZccuWhvjJRoCZ/LM
 MiDnTtoC0rZR7fWlwqzxap1pwop+YLFYSV9Z86V/Lv6HxlDQqlKnsog2s/KOP1sJPC7T
 x2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=4bFcMUoE4kIp+2MWdZM5AsV1Ns0C4SweuGTMktPkM3A=;
 b=h6EvYrt3GZzpQqT4nbAt0GzR6bQ4lmbvAiMMIxFVwVKzrtHaFUj/epo+K8+o854VyS
 c6wq0hlMW5TeeIDFs8/NY4oUKHp43Q8UlERl/cOHhhVsRHG79pxrAqfbrHrwRsW+sSq2
 jwiMMXbYw8Icxg7hI/UGep1qRp8aAElV3nsS+KmKnWviMoOIZYwgnw1mSquyMO/8j5qt
 6CRZ5EfIloQTFOUN0FvGnBPdYLDePIocsTgamM6rZlX0XrhabVN/iDOKwmyg+zrIJ+mw
 rnwBCDBk+Vm+4xUzImlfl1doW2OyU7l7AfYaJBjDqgKhGmJeIr7T8t9Zrl3r/H4UGU37
 4GpQ==
X-Gm-Message-State: ACrzQf3i3hoV9AYg8b9pGBQNf0VmVh0h7lj+FTX39Fd/ELOQqcFe3mON
 qA08GL6XjS3+0q4pYifvojVQJOUCriwDVA==
X-Google-Smtp-Source: AMsMyM4qQeuFf+gd0mRI4T02kB23/EQH8cXtYJ5I0tyVCNkkIvrysgOHOW46TL6cB+J+953SzdHwwA==
X-Received: by 2002:ad4:5966:0:b0:4ad:7832:a8ec with SMTP id
 eq6-20020ad45966000000b004ad7832a8ecmr11298393qvb.82.1664641437306; 
 Sat, 01 Oct 2022 09:23:57 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:23:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 14/42] target/arm: Hoist read of *is_secure in
 S1_ptw_translate
Date: Sat,  1 Oct 2022 09:22:50 -0700
Message-Id: <20221001162318.153420-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2a.google.com
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

Rename the argument to is_secure_ptr, and introduce a
local variable is_secure with the value.  We only write
back to the pointer toward the end of the function.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 1ea29bec58..cb072792a2 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -207,24 +207,25 @@ static bool ptw_attrs_are_device(CPUARMState *env, ARMCacheAttrs cacheattrs)
 
 /* Translate a S1 pagetable walk through S2 if needed.  */
 static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
-                               hwaddr addr, bool *is_secure,
+                               hwaddr addr, bool *is_secure_ptr,
                                ARMMMUFaultInfo *fi)
 {
-    ARMMMUIdx s2_mmu_idx = *is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
+    bool is_secure = *is_secure_ptr;
+    ARMMMUIdx s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
 
     if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
-        !regime_translation_disabled(env, s2_mmu_idx, *is_secure)) {
+        !regime_translation_disabled(env, s2_mmu_idx, is_secure)) {
         GetPhysAddrResult s2 = {};
         int ret;
 
         ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx,
-                                 *is_secure, false, &s2, fi);
+                                 is_secure, false, &s2, fi);
         if (ret) {
             assert(fi->type != ARMFault_None);
             fi->s2addr = addr;
             fi->stage2 = true;
             fi->s1ptw = true;
-            fi->s1ns = !*is_secure;
+            fi->s1ns = !is_secure;
             return ~0;
         }
         if ((arm_hcr_el2_eff(env) & HCR_PTW) &&
@@ -237,19 +238,20 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             fi->s2addr = addr;
             fi->stage2 = true;
             fi->s1ptw = true;
-            fi->s1ns = !*is_secure;
+            fi->s1ns = !is_secure;
             return ~0;
         }
 
         if (arm_is_secure_below_el3(env)) {
             /* Check if page table walk is to secure or non-secure PA space. */
-            if (*is_secure) {
-                *is_secure = !(env->cp15.vstcr_el2 & VSTCR_SW);
+            if (is_secure) {
+                is_secure = !(env->cp15.vstcr_el2 & VSTCR_SW);
             } else {
-                *is_secure = !(env->cp15.vtcr_el2 & VTCR_NSW);
+                is_secure = !(env->cp15.vtcr_el2 & VTCR_NSW);
             }
+            *is_secure_ptr = is_secure;
         } else {
-            assert(!*is_secure);
+            assert(!is_secure);
         }
 
         addr = s2.phys;
-- 
2.34.1


