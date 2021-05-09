Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE8B377747
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 17:21:39 +0200 (CEST)
Received: from localhost ([::1]:36054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lflFS-0006I8-7F
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 11:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lflAY-00058g-Vx
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:16:35 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:34461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lflAW-0005KA-Ip
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:16:34 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso8517951wmc.1
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 08:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HD4fj6kxrQwLgpLTJfwae7SL8qcS2VUCooMY8AWXtkk=;
 b=PvkmTpXtGC7Qoix9aHrX1evBwVECP908EFFpJ+AqoS0990N0+WfT0A9I85D8ymXvWY
 Fkvr8CHojIWXN4Kuvz8B1BSKY2l5GE+v3SxqFQ2Qc7tXqMyzJ6qHdrrIWS9/DCK66Uls
 dSMlBYDeHG+UOnrI4Is32PufuJwUD+TaIr6AQO8CVn9z2hft7GwJWNWiASxcXL74z67q
 1eKq94r0aWhAKTYAdcbTzOz40LcuSogoJaip2jZCntOcep82MYQQT/1PPW/MvHyruReG
 YSgHvwuZF2vfBc7SX7MwtFgVEC8kvuphORndH6AVE/p+youLFlFS47O6y+BdqPL0NZTP
 QOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HD4fj6kxrQwLgpLTJfwae7SL8qcS2VUCooMY8AWXtkk=;
 b=BUrDSbk8m60mZKnElp/SJwNL9xUA+90UXDYja1aA2JEwkH6/stvlqMAloyH0vj/+JK
 RTRWFounFxJ2zwHeo6F/HnKzX42Jlgk+VBOPF99pwnzK8N74Ps5TXoqKQHPVPmp7iyxV
 jU4zgld6OLXlFVJDFukGBuWljCH9k25KLJEYBFSVQOY427G3GAkAxQvRK622sOFEVAuy
 fMyJmflJvB5ZG4jtOnolKU0V5+MCoFou/Gwn5zAU882tIB3WEkjGYWyJBjQCM0t5yDa/
 uZ0IWwN+MgDARO0wdDFf5SIWn3ri79hBi8UkZxYQh5hag2BeCzjInQd+9UwpF+9nZ3W/
 OX1Q==
X-Gm-Message-State: AOAM533hM3bKPKKgB524gniRRnMBIwBI6lsMrBi54pst3u0UJMQgbkIk
 NsnnfNLZOOXzlkDPNxf/jtyGdY9jrmichiua
X-Google-Smtp-Source: ABdhPJwuBj47xj/TbF4/C+FRO4Z8SPSMPM5pf1MqGxbM+9gLhGGceJISpItUJWSSRHF7sXJoP7EP8g==
X-Received: by 2002:a05:600c:4ecd:: with SMTP id
 g13mr21175510wmq.173.1620573390330; 
 Sun, 09 May 2021 08:16:30 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id k16sm15830386wmi.44.2021.05.09.08.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 08:16:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/9] accel/tcg: Pass length argument to
 tlb_flush_range_locked()
Date: Sun,  9 May 2021 17:16:11 +0200
Message-Id: <20210509151618.2331764-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210509151618.2331764-1-f4bug@amsat.org>
References: <20210509151618.2331764-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Rename tlb_flush_page_bits_locked() -> tlb_flush_range_locked(), and
have callers pass a length argument (currently TARGET_PAGE_SIZE) via
the TLBFlushPageBitsByMMUIdxData structure.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210508201640.1045808-1-richard.henderson@linaro.org>
[PMD: Split from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/cputlb.c | 48 +++++++++++++++++++++++++++++++---------------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index f616b58a898..df5d5dbf879 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -707,8 +707,9 @@ void tlb_flush_page_all_cpus_synced(CPUState *src, target_ulong addr)
     tlb_flush_page_by_mmuidx_all_cpus_synced(src, addr, ALL_MMUIDX_BITS);
 }
 
-static void tlb_flush_page_bits_locked(CPUArchState *env, int midx,
-                                       target_ulong page, unsigned bits)
+static void tlb_flush_range_locked(CPUArchState *env, int midx,
+                                   target_ulong addr, target_ulong len,
+                                   unsigned bits)
 {
     CPUTLBDesc *d = &env_tlb(env)->d[midx];
     CPUTLBDescFast *f = &env_tlb(env)->f[midx];
@@ -718,20 +719,26 @@ static void tlb_flush_page_bits_locked(CPUArchState *env, int midx,
      * If @bits is smaller than the tlb size, there may be multiple entries
      * within the TLB; otherwise all addresses that match under @mask hit
      * the same TLB entry.
-     *
      * TODO: Perhaps allow bits to be a few bits less than the size.
      * For now, just flush the entire TLB.
+     *
+     * If @len is larger than the tlb size, then it will take longer to
+     * test all of the entries in the TLB than it will to flush it all.
      */
-    if (mask < f->mask) {
+    if (mask < f->mask || len > f->mask) {
         tlb_debug("forcing full flush midx %d ("
-                  TARGET_FMT_lx "/" TARGET_FMT_lx ")\n",
-                  midx, page, mask);
+                  TARGET_FMT_lx "/" TARGET_FMT_lx "+" TARGET_FMT_lx ")\n",
+                  midx, addr, mask, len);
         tlb_flush_one_mmuidx_locked(env, midx, get_clock_realtime());
         return;
     }
 
-    /* Check if we need to flush due to large pages.  */
-    if ((page & d->large_page_mask) == d->large_page_addr) {
+    /*
+     * Check if we need to flush due to large pages.
+     * Because large_page_mask contains all 1's from the msb,
+     * we only need to test the end of the range.
+     */
+    if (((addr + len - 1) & d->large_page_mask) == d->large_page_addr) {
         tlb_debug("forcing full flush midx %d ("
                   TARGET_FMT_lx "/" TARGET_FMT_lx ")\n",
                   midx, d->large_page_addr, d->large_page_mask);
@@ -739,14 +746,20 @@ static void tlb_flush_page_bits_locked(CPUArchState *env, int midx,
         return;
     }
 
-    if (tlb_flush_entry_mask_locked(tlb_entry(env, midx, page), page, mask)) {
-        tlb_n_used_entries_dec(env, midx);
+    for (target_ulong i = 0; i < len; i += TARGET_PAGE_SIZE) {
+        target_ulong page = addr + i;
+        CPUTLBEntry *entry = tlb_entry(env, midx, page);
+
+        if (tlb_flush_entry_mask_locked(entry, page, mask)) {
+            tlb_n_used_entries_dec(env, midx);
+        }
+        tlb_flush_vtlb_page_mask_locked(env, midx, page, mask);
     }
-    tlb_flush_vtlb_page_mask_locked(env, midx, page, mask);
 }
 
 typedef struct {
     target_ulong addr;
+    target_ulong len;
     uint16_t idxmap;
     uint16_t bits;
 } TLBFlushPageBitsByMMUIdxData;
@@ -760,18 +773,20 @@ tlb_flush_page_bits_by_mmuidx_async_0(CPUState *cpu,
 
     assert_cpu_is_self(cpu);
 
-    tlb_debug("page addr:" TARGET_FMT_lx "/%u mmu_map:0x%x\n",
-              d.addr, d.bits, d.idxmap);
+    tlb_debug("range:" TARGET_FMT_lx "/%u+" TARGET_FMT_lx " mmu_map:0x%x\n",
+              d.addr, d.bits, d.len, d.idxmap);
 
     qemu_spin_lock(&env_tlb(env)->c.lock);
     for (mmu_idx = 0; mmu_idx < NB_MMU_MODES; mmu_idx++) {
         if ((d.idxmap >> mmu_idx) & 1) {
-            tlb_flush_page_bits_locked(env, mmu_idx, d.addr, d.bits);
+            tlb_flush_range_locked(env, mmu_idx, d.addr, d.len, d.bits);
         }
     }
     qemu_spin_unlock(&env_tlb(env)->c.lock);
 
-    tb_flush_jmp_cache(cpu, d.addr);
+    for (target_ulong i = 0; i < d.len; i += TARGET_PAGE_SIZE) {
+        tb_flush_jmp_cache(cpu, d.addr + i);
+    }
 }
 
 static bool encode_pbm_to_runon(run_on_cpu_data *out,
@@ -829,6 +844,7 @@ void tlb_flush_page_bits_by_mmuidx(CPUState *cpu, target_ulong addr,
 
     /* This should already be page aligned */
     d.addr = addr & TARGET_PAGE_MASK;
+    d.len = TARGET_PAGE_SIZE;
     d.idxmap = idxmap;
     d.bits = bits;
 
@@ -865,6 +881,7 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *src_cpu,
 
     /* This should already be page aligned */
     d.addr = addr & TARGET_PAGE_MASK;
+    d.len = TARGET_PAGE_SIZE;
     d.idxmap = idxmap;
     d.bits = bits;
 
@@ -908,6 +925,7 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
 
     /* This should already be page aligned */
     d.addr = addr & TARGET_PAGE_MASK;
+    d.len = TARGET_PAGE_SIZE;
     d.idxmap = idxmap;
     d.bits = bits;
 
-- 
2.26.3


