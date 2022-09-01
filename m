Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE585A90BF
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 09:43:05 +0200 (CEST)
Received: from localhost ([::1]:49844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTeqt-0002j5-TF
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 03:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe4W-0005yn-6Q
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:53:04 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe4U-0003Gu-E0
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:53:03 -0400
Received: by mail-wr1-x435.google.com with SMTP id az27so21015919wrb.6
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 23:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=aenCwLhyHz+42ttancSjHI4JZk2Ya2FL+nx6M3jTwMg=;
 b=z2D14sNY3YduiJeshwg3aEXmGQfRy716YpLt9ZO7I3RVYi8t+F3lK4ygqiYQzos1R2
 o/iXxcyyacdJ9jm/kfJrDgc3alaruPfLsub/bf8kA1WA1FPdDA/s9KdHjnrWabR2KWqQ
 nnEijWsDqwsTY0QXCQ6uC8uCiZi7WhOqxnVVan74+BN8cqnqVuDjo847lzEvd3T5LPYf
 h4x128WYje/JjPQ9J4tJx+HKm/pGtn2x69sIeyz7wS4sVW4IjDgUdG2zGhWMEjX4SZC1
 Auck4hQvwi+Mh3ozGHMq+PAGro68qZLbvMfBCvPeyWKoBLRtMXpjsZxEud3IvnYfkpUe
 CYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=aenCwLhyHz+42ttancSjHI4JZk2Ya2FL+nx6M3jTwMg=;
 b=E5WJxtE1YStRpVVTsZOAZvdkhn/lnDBmrf/Zi2XdoUhQE4tJCf1A3nKjebZWHuA7nL
 MCbUZy1KNinEwHhsFFVyLTzl8+u3J/eE5GwM1+FOe7E6ok4MFv/WSVS+/168tn5qvK1m
 ZQ0RcoJuvEdKqr8AtKsJzDZEGpwtNCMXrHpwLVdfbukkheM52EfslQHUPS1AAXFioOPv
 9gjFiWWDjhubCnVLXVoYbPYdd6kz2pk+l3/eG0mmYjyHSoitztCovTUBNgttfaOSHfsC
 /Iq03+SOvtZS+jkSG77iSJhyhvwj3LRGaH9rqxiQ+67O4MJAAYc0T4DIhXzXZJnaH/dy
 RIIw==
X-Gm-Message-State: ACgBeo1bQhzhD2kKVBwD+6xNU7h78Z+KS7AWxqUfREwTFXaxfPZPCYI2
 77gv+xGksNQP8X7GuoEpjoUhioaqt+TfZcwc
X-Google-Smtp-Source: AA6agR6FWbKjkXNfRa9sDnvcM6gnCjgMiLNfvsf9DObsGt99MvfZFv5Bpw2emnTtCyk5JiO+DbuDaQ==
X-Received: by 2002:a05:6000:81b:b0:226:bada:a5 with SMTP id
 bt27-20020a056000081b00b00226bada00a5mr13699436wrb.539.1662015181647; 
 Wed, 31 Aug 2022 23:53:01 -0700 (PDT)
Received: from stoup.. ([87.192.221.83]) by smtp.gmail.com with ESMTPSA id
 a6-20020a5d4d46000000b00226dedf1ab7sm8308153wru.76.2022.08.31.23.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 23:53:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 12/20] accel/tcg: Use probe_access_internal for softmmu
 get_page_addr_code_hostp
Date: Thu,  1 Sep 2022 07:52:02 +0100
Message-Id: <20220901065210.117081-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901065210.117081-1-richard.henderson@linaro.org>
References: <20220901065210.117081-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
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


