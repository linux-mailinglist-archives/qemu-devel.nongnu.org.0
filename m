Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB324282B6
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Oct 2021 19:48:44 +0200 (CEST)
Received: from localhost ([::1]:59960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZcwE-0003Mo-F5
	for lists+qemu-devel@lfdr.de; Sun, 10 Oct 2021 13:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZcrt-0000Tu-F9
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 13:44:18 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:46958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZcrr-0005o5-Dw
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 13:44:13 -0400
Received: by mail-pg1-x531.google.com with SMTP id m21so8603035pgu.13
 for <qemu-devel@nongnu.org>; Sun, 10 Oct 2021 10:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xCbmEUSl+ecOqyB7Q5IjpUvL5Is3ROPOJlxFtpvTKsc=;
 b=eCq2A/fiVcwtgmukaGZYFER9X3cG+V6WA7EOZnM7oMm/W7wZvzEumXo5XTrWTGqvVt
 P7ArcQgV01wWv4l/WKutDmom77hDQ1uUbzKPIFFexvFhhY4GjkQ8wIj0Mt8g4P+uFC5+
 6wfHmsijXzsS+IzyhqRsvi7EGgGbyu5OWdEoz4hpIzceKLtRgmoUkWB5LhpAmUWiqDb+
 FwHgLVT5hF5Q/om6rfx+m8VcRRHfxfyy+jkbQmMxXmxOun3Bc1iY0cZ65tj48aOBxAJe
 SgdjEegqF0vIL0mK/qoooq1ptDo+F1N7WgIBljpZAfuhkRzbO9BAX1J405g5clWF/dES
 9cXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xCbmEUSl+ecOqyB7Q5IjpUvL5Is3ROPOJlxFtpvTKsc=;
 b=C2XDqj3eACvOt66yr3JRytP/GbRqwhn0OS56CcEORaKJO4hrNvx+hoTawjHi8QmEVD
 g0+abzWijdztTi5rp6eqrbHvC/flJboMxmIW2hb0YRNfrcYM8l5qgH2pcJ5G6J012grY
 fttPRZkdUCHARBS0GzjdmDEdiFD1P1280ip9iIYpSCEAKIq8lf0y5Dc3dbX8rK4nedbf
 s8qybxAmYZpzhR0XcHXCF+rRTmh4kSRztNdfGWEvdBpCdDYFDb301kEqiifDqXNzvWwM
 7XmTUy1WbiuyXIjV3d741C0bnzV7J+9sZwcPbrUa1Z4OU2zVUtOK4qxLIga5VtZknLjy
 1yMw==
X-Gm-Message-State: AOAM533BsuiNOXrfdqm0yMH746VSxFYJqoOZte62+C2TdGigPcA4w/X0
 uR3VfHVhG//PpTYy2vMCBPtnZQVWjLvyXkXo
X-Google-Smtp-Source: ABdhPJxjS1mmHbV97+OerkMm+/QyAsNri4SnwM+XMXcJZWawncLPmh0jlq1PX2e4302XAlnCVd5qXw==
X-Received: by 2002:a62:17d3:0:b0:44c:6022:9428 with SMTP id
 202-20020a6217d3000000b0044c60229428mr20938600pfx.65.1633887849090; 
 Sun, 10 Oct 2021 10:44:09 -0700 (PDT)
Received: from localhost.localdomain (068-185-026-038.biz.spectrum.com.
 [68.185.26.38])
 by smtp.gmail.com with ESMTPSA id 18sm5095391pfh.115.2021.10.10.10.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 10:44:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/8] accel/tcg: Split out g2h_tlbe
Date: Sun, 10 Oct 2021 10:43:55 -0700
Message-Id: <20211010174401.141339-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211010174401.141339-1-richard.henderson@linaro.org>
References: <20211010174401.141339-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: git@xen0n.name, Alistair.Francis@wdc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create a new function to combine a CPUTLBEntry addend
with the guest address to form a host address.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 46140ccff3..761f726722 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -90,6 +90,11 @@ static inline size_t sizeof_tlb(CPUTLBDescFast *fast)
     return fast->mask + (1 << CPU_TLB_ENTRY_BITS);
 }
 
+static inline uintptr_t g2h_tlbe(const CPUTLBEntry *tlb, target_ulong gaddr)
+{
+    return tlb->addend + (uintptr_t)gaddr;
+}
+
 static void tlb_window_reset(CPUTLBDesc *desc, int64_t ns,
                              size_t max_entries)
 {
@@ -976,8 +981,7 @@ static void tlb_reset_dirty_range_locked(CPUTLBEntry *tlb_entry,
 
     if ((addr & (TLB_INVALID_MASK | TLB_MMIO |
                  TLB_DISCARD_WRITE | TLB_NOTDIRTY)) == 0) {
-        addr &= TARGET_PAGE_MASK;
-        addr += tlb_entry->addend;
+        addr = g2h_tlbe(tlb_entry, addr & TARGET_PAGE_MASK);
         if ((addr - start) < length) {
 #if TCG_OVERSIZED_GUEST
             tlb_entry->addr_write |= TLB_NOTDIRTY;
@@ -1527,7 +1531,7 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
         return -1;
     }
 
-    p = (void *)((uintptr_t)addr + entry->addend);
+    p = (void *)g2h_tlbe(entry, addr);
     if (hostp) {
         *hostp = p;
     }
@@ -1619,7 +1623,7 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
     }
 
     /* Everything else is RAM. */
-    *phost = (void *)((uintptr_t)addr + entry->addend);
+    *phost = (void *)g2h_tlbe(entry, addr);
     return flags;
 }
 
@@ -1727,7 +1731,7 @@ bool tlb_plugin_lookup(CPUState *cpu, target_ulong addr, int mmu_idx,
             data->v.io.offset = (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
         } else {
             data->is_io = false;
-            data->v.ram.hostaddr = (void *)((uintptr_t)addr + tlbe->addend);
+            data->v.ram.hostaddr = (void *)g2h_tlbe(tlbe, addr);
         }
         return true;
     } else {
@@ -1826,7 +1830,7 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
         goto stop_the_world;
     }
 
-    hostaddr = (void *)((uintptr_t)addr + tlbe->addend);
+    hostaddr = (void *)g2h_tlbe(tlbe, addr);
 
     if (unlikely(tlb_addr & TLB_NOTDIRTY)) {
         notdirty_write(env_cpu(env), addr, size,
@@ -1938,7 +1942,7 @@ load_helper(CPUArchState *env, target_ulong addr, MemOpIdx oi,
                             access_type, op ^ (need_swap * MO_BSWAP));
         }
 
-        haddr = (void *)((uintptr_t)addr + entry->addend);
+        haddr = (void *)g2h_tlbe(entry, addr);
 
         /*
          * Keep these two load_memop separate to ensure that the compiler
@@ -1975,7 +1979,7 @@ load_helper(CPUArchState *env, target_ulong addr, MemOpIdx oi,
         return res & MAKE_64BIT_MASK(0, size * 8);
     }
 
-    haddr = (void *)((uintptr_t)addr + entry->addend);
+    haddr = (void *)g2h_tlbe(entry, addr);
     return load_memop(haddr, op);
 }
 
@@ -2467,7 +2471,7 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
             notdirty_write(env_cpu(env), addr, size, iotlbentry, retaddr);
         }
 
-        haddr = (void *)((uintptr_t)addr + entry->addend);
+        haddr = (void *)g2h_tlbe(entry, addr);
 
         /*
          * Keep these two store_memop separate to ensure that the compiler
@@ -2492,7 +2496,7 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
         return;
     }
 
-    haddr = (void *)((uintptr_t)addr + entry->addend);
+    haddr = (void *)g2h_tlbe(entry, addr);
     store_memop(haddr, val, op);
 }
 
-- 
2.25.1


