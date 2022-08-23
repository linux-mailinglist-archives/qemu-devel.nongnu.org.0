Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB11C59EEE8
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 00:19:23 +0200 (CEST)
Received: from localhost ([::1]:33232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQcF1-00060P-29
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 18:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc26-0000Ai-W4
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:06:03 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:46025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc24-0001QH-7t
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:06:02 -0400
Received: by mail-pf1-x42f.google.com with SMTP id z187so14704679pfb.12
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 15:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=aenCwLhyHz+42ttancSjHI4JZk2Ya2FL+nx6M3jTwMg=;
 b=Yvd06h/xswgFj6DgEE4F6BlJ4RtnT/OS2rf3y1TL9+ilAwFs/mSvo2O/vRKUjixJQ1
 reyGWL5y/5U4aRycoSHkSW7KLsbKWL/A5F0/OvFlbJ0ocYG305LUUBQH0BTME3AoXkG1
 PJ4lGGC4M7uelwptoGWv3fZM6c+zOfSqH91PLirQqKmAQ3ayqLVZlxL2BdIa1P5MJO9B
 r/qY1lRMa5ucfj6RQCxgWLI+ooTGo4Nsj7wmsNYoO8teCGhsfjBmoekSTjG//uTY8Iyp
 P+GLu7OzwzpExDOv3qHWyAVSh0ck6jySNeukgz7AM7DjNzGQx87GtURZg6B+9YxHEK4y
 xuQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=aenCwLhyHz+42ttancSjHI4JZk2Ya2FL+nx6M3jTwMg=;
 b=z4Yheb9UE2Dby+1BVJMEbrWaZjGGYHm9Pn4+CNfP2A3VNSkzoHh6jk12K1Os5r9CtK
 4fnO0hPUgOLlmnaP0sosw4PiWWok9vhDXMX8HE0gZx51K9CSaYnk/cD1VtkFuk/7hgyN
 kkh7GdYeHFmP+RzDB3Sl7KiosHw3LiKczrLAA03Cr3RRW5tLFN7//axK0KTon9k5jD4T
 ppyQ0Q1aSeHfb+INKnJNIKoo3up4VFG1911OOHMvqWo/QXw1tqJZJCBwHBRCRx4AhaZn
 Rnf7W4+X8+RoB51JsWbFIUMeBS/+fUx/qoBCzcnbvbF3/FJ6fGVH3KFvU2xQxk5MIn+j
 D8+A==
X-Gm-Message-State: ACgBeo01ik4W4u3Odl+1tFEf5RobzGZqaeAIxx+ahTlxgGsLVYaeXYd5
 xuQ+FglnBRfPUOdVNQPA5uB71odTEyg5Xg==
X-Google-Smtp-Source: AA6agR6URotv+vFEFiEemFN3o5N1NMkfebHwuWBHe7ZD0iGoZXS4+Mmvaly0b3sNiGUdnPk6X3L8rg==
X-Received: by 2002:a63:1063:0:b0:42b:1b01:b394 with SMTP id
 35-20020a631063000000b0042b1b01b394mr150276pgq.602.1661292358956; 
 Tue, 23 Aug 2022 15:05:58 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902f60c00b0017292073839sm11020974plg.178.2022.08.23.15.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 15:05:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: iii@linux.ibm.com,
	laurent@vivier.eu,
	alex.bennee@linaro.org
Subject: [PATCH v7 12/20] accel/tcg: Use probe_access_internal for softmmu
 get_page_addr_code_hostp
Date: Tue, 23 Aug 2022 15:05:34 -0700
Message-Id: <20220823220542.1993395-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220823220542.1993395-1-richard.henderson@linaro.org>
References: <20220823220542.1993395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Simplify the implementation of get_page_addr_code_hostp
by reusing the existing probe_access infrastructure.

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Tested-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 76 ++++++++++++++++------------------------------
 1 file changed, 26 insertions(+), 50 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 80a3eb4f1c..8fad2d9b83 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1482,56 +1482,6 @@ static bool victim_tlb_hit(CPUArchState *env, size_t mmu_idx, size_t index,
   victim_tlb_hit(env, mmu_idx, index, offsetof(CPUTLBEntry, TY), \
                  (ADDR) & TARGET_PAGE_MASK)
 
-/*
- * Return a ram_addr_t for the virtual address for execution.
- *
- * Return -1 if we can't translate and execute from an entire page
- * of RAM.  This will force us to execute by loading and translating
- * one insn at a time, without caching.
- *
- * NOTE: This function will trigger an exception if the page is
- * not executable.
- */
-tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
-                                        void **hostp)
-{
-    uintptr_t mmu_idx = cpu_mmu_index(env, true);
-    uintptr_t index = tlb_index(env, mmu_idx, addr);
-    CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
-    void *p;
-
-    if (unlikely(!tlb_hit(entry->addr_code, addr))) {
-        if (!VICTIM_TLB_HIT(addr_code, addr)) {
-            tlb_fill(env_cpu(env), addr, 0, MMU_INST_FETCH, mmu_idx, 0);
-            index = tlb_index(env, mmu_idx, addr);
-            entry = tlb_entry(env, mmu_idx, addr);
-
-            if (unlikely(entry->addr_code & TLB_INVALID_MASK)) {
-                /*
-                 * The MMU protection covers a smaller range than a target
-                 * page, so we must redo the MMU check for every insn.
-                 */
-                return -1;
-            }
-        }
-        assert(tlb_hit(entry->addr_code, addr));
-    }
-
-    if (unlikely(entry->addr_code & TLB_MMIO)) {
-        /* The region is not backed by RAM.  */
-        if (hostp) {
-            *hostp = NULL;
-        }
-        return -1;
-    }
-
-    p = (void *)((uintptr_t)addr + entry->addend);
-    if (hostp) {
-        *hostp = p;
-    }
-    return qemu_ram_addr_from_host_nofail(p);
-}
-
 static void notdirty_write(CPUState *cpu, vaddr mem_vaddr, unsigned size,
                            CPUIOTLBEntry *iotlbentry, uintptr_t retaddr)
 {
@@ -1687,6 +1637,32 @@ void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
     return flags ? NULL : host;
 }
 
+/*
+ * Return a ram_addr_t for the virtual address for execution.
+ *
+ * Return -1 if we can't translate and execute from an entire page
+ * of RAM.  This will force us to execute by loading and translating
+ * one insn at a time, without caching.
+ *
+ * NOTE: This function will trigger an exception if the page is
+ * not executable.
+ */
+tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
+                                        void **hostp)
+{
+    void *p;
+
+    (void)probe_access_internal(env, addr, 1, MMU_INST_FETCH,
+                                cpu_mmu_index(env, true), false, &p, 0);
+    if (p == NULL) {
+        return -1;
+    }
+    if (hostp) {
+        *hostp = p;
+    }
+    return qemu_ram_addr_from_host_nofail(p);
+}
+
 #ifdef CONFIG_PLUGIN
 /*
  * Perform a TLB lookup and populate the qemu_plugin_hwaddr structure.
-- 
2.34.1


