Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EE25645D8
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 10:37:03 +0200 (CEST)
Received: from localhost ([::1]:58746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7v6E-00012W-TY
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 04:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uue-000790-Di
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:04 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:34484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uuc-0005tM-J6
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:04 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 cp18-20020a17090afb9200b001ef79e8484aso1073968pjb.1
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AVX4IODgIG8U+4PgU+1iyUK7c7RbVvq6xSMRTLDcW6w=;
 b=d6BK/luNlDD090aTK4Lcf/iAesoeRkE1BqmhQkCPzavf9571y1y5ju3GVZNK+Vjw6E
 +XUbvY06MyTUAaSia1Pi5DbWMHh/iKSWaObkfXNcjIQz2lvSQ2HYTcflp1P4Sk+2oGDQ
 D20es9fizccNy4fQOdncJshr8D2HI3DTIpZvaqZ79S1KFg28UroFHTj0C3mBH/fH8X1O
 KQ9P1JPX3GyvaTqvPsdbMCfrM5GLQUff6YsUzxsTtCbHtnSOzFb7iFCqVv4VrDgdUhvy
 NQTqBvhPJPcEul8ALiSi5N+CA+9TISO/m8NOexwNFi33pa+LKOs5egzX/4C4A08CG01k
 MA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AVX4IODgIG8U+4PgU+1iyUK7c7RbVvq6xSMRTLDcW6w=;
 b=0TR9RipZFDUrcngABtohiDjkZogn6OV4XzwZCIp7HfVenaQX7qZfELcjI+yrENCQxN
 rEsFAflT7sjFuquxntedYaSi9qj12/Fgb1z2FdHyfiMltYgJUu+Xyhxn7CIS/HtsW+Af
 SAjZsAxaIML0O5tsLefT71CljlTJgsPJZuoSxP3V+PMp+EcScCIgbDuILrhhRptZhJcV
 +UsvI9ofDvUH/WbFwTrt/jab0v9SimNiHDOKhmCGFKPEhPzgTJOgTbkjLcVbkENiD0yt
 cYVkj6dDRJXTYNXGJVIR8Jn/w7W4Y/uyxOVScJ8TMPYnDzrKGypA/IjokgpmRCad/mIg
 sx+Q==
X-Gm-Message-State: AJIora/qnJp4brOa4T9WMrTDpjJXx92cvpaL5+6wj3KvJFr9Ee7GOdiT
 u+pv9WoM8QHSO026lmKkg4VHEnnvRw3bMqRB
X-Google-Smtp-Source: AGRyM1uQkQoRZwwyyr6/Hkg14MFHKnRNzGC5+RhZ2z5LTRqs1h8sK2ijxO+4OYUV+25uO71KWsFawg==
X-Received: by 2002:a17:902:c7cb:b0:16b:dc5d:8959 with SMTP id
 r11-20020a170902c7cb00b0016bdc5d8959mr1945472pla.87.1656836701225; 
 Sun, 03 Jul 2022 01:25:01 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:25:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 12/62] target/arm: Use GetPhysAddrResult in get_phys_addr_v5
Date: Sun,  3 Jul 2022 13:53:29 +0530
Message-Id: <20220703082419.770989-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index d70c9120fc..490a57ec5a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -410,9 +410,7 @@ static int simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
 
 static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             hwaddr *phys_ptr, int *prot,
-                             target_ulong *page_size,
-                             ARMMMUFaultInfo *fi)
+                             GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     int level = 1;
     uint32_t table;
@@ -460,7 +458,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
         /* 1Mb section.  */
         phys_addr = (desc & 0xfff00000) | (address & 0x000fffff);
         ap = (desc >> 10) & 3;
-        *page_size = 1024 * 1024;
+        result->page_size = 1024 * 1024;
     } else {
         /* Lookup l2 entry.  */
         if (type == 1) {
@@ -482,12 +480,12 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
         case 1: /* 64k page.  */
             phys_addr = (desc & 0xffff0000) | (address & 0xffff);
             ap = (desc >> (4 + ((address >> 13) & 6))) & 3;
-            *page_size = 0x10000;
+            result->page_size = 0x10000;
             break;
         case 2: /* 4k page.  */
             phys_addr = (desc & 0xfffff000) | (address & 0xfff);
             ap = (desc >> (4 + ((address >> 9) & 6))) & 3;
-            *page_size = 0x1000;
+            result->page_size = 0x1000;
             break;
         case 3: /* 1k page, or ARMv6/XScale "extended small (4k) page" */
             if (type == 1) {
@@ -495,7 +493,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                 if (arm_feature(env, ARM_FEATURE_XSCALE)
                     || arm_feature(env, ARM_FEATURE_V6)) {
                     phys_addr = (desc & 0xfffff000) | (address & 0xfff);
-                    *page_size = 0x1000;
+                    result->page_size = 0x1000;
                 } else {
                     /*
                      * UNPREDICTABLE in ARMv5; we choose to take a
@@ -506,7 +504,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                 }
             } else {
                 phys_addr = (desc & 0xfffffc00) | (address & 0x3ff);
-                *page_size = 0x400;
+                result->page_size = 0x400;
             }
             ap = (desc >> 4) & 3;
             break;
@@ -515,14 +513,14 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
             g_assert_not_reached();
         }
     }
-    *prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
-    *prot |= *prot ? PAGE_EXEC : 0;
-    if (!(*prot & (1 << access_type))) {
+    result->prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
+    result->prot |= result->prot ? PAGE_EXEC : 0;
+    if (!(result->prot & (1 << access_type))) {
         /* Access permission fault.  */
         fi->type = ARMFault_Permission;
         goto do_fault;
     }
-    *phys_ptr = phys_addr;
+    result->phys = phys_addr;
     return false;
 do_fault:
     fi->domain = domain;
@@ -2514,8 +2512,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                                 result, fi);
     } else {
         return get_phys_addr_v5(env, address, access_type, mmu_idx,
-                                &result->phys, &result->prot,
-                                &result->page_size, fi);
+                                result, fi);
     }
 }
 
-- 
2.34.1


