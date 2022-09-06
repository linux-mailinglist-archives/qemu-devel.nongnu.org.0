Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC055AE3E5
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 11:13:54 +0200 (CEST)
Received: from localhost ([::1]:37730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVUeX-0001A7-OG
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 05:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6N-0002hx-8G
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:35 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:54234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6L-0005XW-B8
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:34 -0400
Received: by mail-wm1-x333.google.com with SMTP id h1so6462857wmd.3
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 01:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=aenCwLhyHz+42ttancSjHI4JZk2Ya2FL+nx6M3jTwMg=;
 b=wy3USSW76aYavO93m07j917YyBifQiuaHzXbg7cdn5BIbPMHe3OVS274KsAbXQuVsi
 8W+Vo8SB1rUPWRAe9R50OSZLrzgxtRtPq+HrhgolSF044WsF8DYS9vqzs1/tyuJ5QmuG
 QkHcYJLQiLMzmg6T+FxvrqmcGAEyPGYmkzziVsouvYnMVNQvoXwUGfeMKbCkrvRtsvuU
 46aZu1cMchW/oHo/kBMrRz1p1gii8Momsqoe7/7N5D/HJrYBB2h/EUp0r58uq+v7zpd2
 vPhpw6z5XtDDcVNVkka7u1fcL1uf9hqROoORn5r2OBjEUkIYifwsq76BV+jrrw9f+jr9
 9OBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=aenCwLhyHz+42ttancSjHI4JZk2Ya2FL+nx6M3jTwMg=;
 b=IhtFaddm62fN1mLw7z9wstVE5/gPHt08KT2WNeZtwzJJavTl0S87K4A8lzh9xszebR
 1zPTYy4whLTG27xFGhcalsZsiR10xfES2ezlmblXgAlaEh4+tJxYqfm5zlo7Q0aNyj5y
 kOnmEip3A/LyxrquPM6po/C1VTEw+niOY5WxwrXTPfrYVznfH5bakvGizEGi+qjVrRuE
 rdOm8iCpSX98cl7y/d3YYeoYCoPiJC0VubbVUo35Cbr9W+/POlUrVGI6spwi2av9OkMP
 Y0e89Swlttb9EtBasl0WbdNdUUjz90siT9223yQO7WYeqXbFlXU8/tGXDfOx/vSpJkGm
 PjDw==
X-Gm-Message-State: ACgBeo0rZZzmRll1t/rtCcqa2PKfudVuB71GSojNZ/9WFMMXhkmsz5HZ
 H65x0ZXPukaGfEqprlm2YVfkfqFHBBDUFhsV
X-Google-Smtp-Source: AA6agR7YqdoyDL/LBQb8YGGopgWlTOqaRJYBUD11xnqJlNn92WZweiHlMTe7a3/JlurQUuHS5ZwCDQ==
X-Received: by 2002:a05:600c:3781:b0:3a6:804a:afc with SMTP id
 o1-20020a05600c378100b003a6804a0afcmr12769506wmr.27.1662453511984; 
 Tue, 06 Sep 2022 01:38:31 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 g26-20020a7bc4da000000b003a54f49c1c8sm13421859wmk.12.2022.09.06.01.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 01:38:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL v3 12/20] accel/tcg: Use probe_access_internal for softmmu
 get_page_addr_code_hostp
Date: Tue,  6 Sep 2022 09:38:07 +0100
Message-Id: <20220906083815.252478-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906083815.252478-1-richard.henderson@linaro.org>
References: <20220906083815.252478-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
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


