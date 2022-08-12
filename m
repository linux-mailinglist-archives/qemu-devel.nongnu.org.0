Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FE659157B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 20:29:29 +0200 (CEST)
Received: from localhost ([::1]:47558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMZPU-0008Ny-9d
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 14:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ56-0003Wh-Cq
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:24 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:54179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ54-0006Wj-P6
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:24 -0400
Received: by mail-pj1-x102e.google.com with SMTP id pm17so1669115pjb.3
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 11:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=xG7LkxSPgE8989MOfr7x1M7HWGz1uhuKkBsNsQ7qQC0=;
 b=P2KJKUyyI1v8LWlO0sJ20TNjeZrkSaT9cGW+YXMMjeU/hB7XAQVzR7XH8zurWi/xaY
 3nbQu4fGMtCPWrurDM/odsLTD3SwSHP7ya4F/LDjOvjnHyZTufcRz2XmXYQjhD2J0wkB
 eAAK0N2GBiYPvx93pJ3UyDnMvucQscjXlHiCNz3WEh0/VVOnQUzIevurMe4d8LCRpAnB
 v+dybmpp5jAc1boIG3LW0GNTbGD72Cf08lQm0fes1m9Ae9XVYa4puCQV4VkKfeOh1FI5
 gQdUtf/Khe/dBcWA4uS8ih56tmAG7xrMLTVOD+uWcarLVnVxkYa+Cf2hbON806+QryIs
 kUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=xG7LkxSPgE8989MOfr7x1M7HWGz1uhuKkBsNsQ7qQC0=;
 b=cBuqLnDQFHcdlw2bAUu4KnMPqgpujVZoSzUA64rTzd6IjBEg+FW3BiREikN5xCKfEk
 FsLbGqxJNjpik+L8i2nGs+yxyggucSebFpqfUhhh9x8i8Qxp5u1j22LoJOZ6NWKJYzjV
 A4q11mzWVhUQI5I8BEUcIGexROYS4RcnjHHGqCwQfXnT5N5OL+sBsslZmBxOUcz8OKpS
 D+07glP3iqCgiQ5gSvlwdJtFoI33MDary/EnGzrFT3ODJTD+lPQfjh6i0mJA6KgxO8BB
 /9IILets/gl2o6Zo1JHbiwp09ERugNlXpmvNJrSQlmxf7kA8sYtzq/GCGqpFDXcmeryi
 bqNg==
X-Gm-Message-State: ACgBeo3muiNwlmmeA0jVvtfUZdW378WKOYRGHyytKznn/4T3aGqYBdPN
 UXvNMzLfR927G9/N0Nv5AD31+oiVFwEnPg==
X-Google-Smtp-Source: AA6agR46Ua5rsrr6BMS+V66mZzNGiaS915iFygCW7w6QSUCPgMV6YwbsBu6c2eZmQn2bI+uWCXcg2w==
X-Received: by 2002:a17:902:c401:b0:16f:b59:85a7 with SMTP id
 k1-20020a170902c40100b0016f0b5985a7mr5136106plk.115.1660327702039; 
 Fri, 12 Aug 2022 11:08:22 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:a7aa:1d1d:c857:5500])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a056a00000900b0052dee21fecdsm1914761pfk.77.2022.08.12.11.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 11:08:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	iii@linux.ibm.com,
	alex.bennee@linaro.org
Subject: [PATCH for-7.2 11/21] accel/tcg: Use probe_access_internal for
 softmmu get_page_addr_code_hostp
Date: Fri, 12 Aug 2022 11:07:56 -0700
Message-Id: <20220812180806.2128593-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220812180806.2128593-1-richard.henderson@linaro.org>
References: <20220812180806.2128593-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 76 ++++++++++++++++------------------------------
 1 file changed, 26 insertions(+), 50 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 80a3eb4f1c..2dc2affa12 100644
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
+                                cpu_mmu_index(env, true), true, &p, 0);
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


