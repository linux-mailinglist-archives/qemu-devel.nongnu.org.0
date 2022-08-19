Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D283D59937B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 05:36:04 +0200 (CEST)
Received: from localhost ([::1]:34264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOsnj-0001r1-VF
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 23:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseX-0001sb-6l
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:33 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:41558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseV-0002iF-FM
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:32 -0400
Received: by mail-pf1-x42b.google.com with SMTP id q19so3234355pfg.8
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 20:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=xG7LkxSPgE8989MOfr7x1M7HWGz1uhuKkBsNsQ7qQC0=;
 b=JcQCQhhh7IQ1ZxG2So/tlri576lcYHY1kkIK4JJyFLsQ0lqWi/W7Nilu4SoQ8sBk5b
 mGlbSteWt3zm2lVEB0cOrkX66gMQxhQoxE9PhWGU/fHG8VvAXgvr24VWMkkz7UNNE5+m
 K+pS6YZLfn3b6bV3LhK9jUebOKeCUMqCdyE+TiB77pRfaZDXLolm5vHmHdQjw04ZOmgq
 wp2RUzAwN3dniY/KSB7sUYQPen8c7G2+CywchHFFF0idANfU5QRJsG7TsDrCMUJzyWdK
 vhP5HL0EjjaksQPAcUjvaBkNpbCe6I/OILe95suWIj7djT4kkPVvrUEtkSwpTYhlSjFM
 PJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=xG7LkxSPgE8989MOfr7x1M7HWGz1uhuKkBsNsQ7qQC0=;
 b=CJdzxY5+bstvYzZnDc2kkn/6LhrqYuAnvCvT+vsOHmqEJCRoIuOOirF4svImeS670L
 lvq1gG/pkTdqlkpzoWQ2/2DkXYvibyjTFE3EuGM8j03E+wm3GVo19V3GWFK5/ITuM3gb
 bQDDxvbiygsqDrxmqj3M50idFYentR7tYh0UeC5ZtWYgqJovr6venT+ecVPz8RIW826T
 P+eOmmrDmUk+2R3oTZ1hMojxSd1iDBPzaBonwnh//Nv0vxUoBqLeS/wB1pBaudeZoUAr
 Gi6ZeSk7QXCLX6+n3pqtdEu3Zw+Nz4sD8YTUvaN+I9WvlL8CHTHdzX/f26Ns5Z91Qz4B
 4EBw==
X-Gm-Message-State: ACgBeo2oJJThmNh1r5sLzcERPeJ7TCVWh0YWvvKre1FxoGYRFUQJvmIf
 Kh+CYDjnBW0O/S0G5h3E8yIBZrCGxprqYA==
X-Google-Smtp-Source: AA6agR6empT0iTrHJUeXcTMY6fXg0nnaXjF4PhdgZL2SCIKMSP+cFVT0/8929A8qNV3j/kHGkIECRQ==
X-Received: by 2002:a63:b58:0:b0:429:c7fb:d60c with SMTP id
 a24-20020a630b58000000b00429c7fbd60cmr4800594pgl.210.1660879590668; 
 Thu, 18 Aug 2022 20:26:30 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:bbf3:9914:aa9c:3b4e])
 by smtp.gmail.com with ESMTPSA id
 g184-20020a6252c1000000b00535d19c46d7sm2199904pfb.203.2022.08.18.20.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 20:26:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, iii@linux.ibm.com, dramforever@live.com,
 alistair.francis@wdc.com, alex.bennee@linaro.org
Subject: [PATCH v6 12/21] accel/tcg: Use probe_access_internal for softmmu
 get_page_addr_code_hostp
Date: Thu, 18 Aug 2022 20:26:06 -0700
Message-Id: <20220819032615.884847-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819032615.884847-1-richard.henderson@linaro.org>
References: <20220819032615.884847-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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


