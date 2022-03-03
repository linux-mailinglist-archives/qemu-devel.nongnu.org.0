Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB054CC5EC
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:21:14 +0100 (CET)
Received: from localhost ([::1]:35956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPr0j-0005kq-Is
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:21:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPqvo-0001sN-La
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:16:08 -0500
Received: from [2607:f8b0:4864:20::52b] (port=41813
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPqvk-0007SQ-0B
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:16:08 -0500
Received: by mail-pg1-x52b.google.com with SMTP id o26so5450723pgb.8
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 11:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f5NF1Xhw+Erdj+thQwPRUzILFmSAD0uMaYQuiNMvI6I=;
 b=CTTYz6SRD4maCA0i70BHCznp+kU+4cuT7ar01WLuhcim92aPZHQaT5xcbtU7I1UEsn
 lxrlEgM05kKu4BX34Bnal8cfTXBwzh6spoDoMhBnFRybL64izNK/GKvRudfN+DtG7lCH
 hA1IwV2hRl5KRL/Pe0ht7p5oxrxWmrXn0ZHuoYFgz9eYKSsoeWLHyHvnzg1vL99pz5mK
 q8pP4HG3Bffm+yYMZjB0WKcY/ekDq4GPud49aPFYtwRW0Lj72Hegbj0Q3wtx9l3qbPZC
 Sw6ot4j7f/vwVsavaYHRNSoU6wp/6ucqGyHxYPII9428SA62pbCetMPcJ7e5vSB6EmIg
 lClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f5NF1Xhw+Erdj+thQwPRUzILFmSAD0uMaYQuiNMvI6I=;
 b=qwATwJjeN6I6pCzHgFs2YjKqMfwr8I+ckhz8/NHNdI5O1LMk3Vq6IRoPOC95eyoeY7
 dWsaENOCK9BwR4fhhM1n7FX7BGWh4jhJe7564iIzA2VT8O1xDkJ8BlhAFW2hHQfNILhe
 BQkWhF7od+xpKCmCaIsv6MqJJs03hirL09JbfIGTtSqlsv/IswEtPVzTCV4d/sxrDag4
 6R41OHjWkmkOO97GWBFMeiT2HvfnRkb5uJqTBByGOTWtffwnEAtkRxa52fLgePLDzJoW
 uvVBzvo6wL/QggLyUwriiNge8wmGbg1LxSplfcUXAQZuCfD1XHBdrHZfY3Ax1+pWD158
 9Y3Q==
X-Gm-Message-State: AOAM532Iu51fC82Bk8PSdnr4fQySlQ/87R0bxl/aiKjLzBRhoeyLkK2D
 EMzv4oUvw+5Rim2ZgRgIlKDBRIBQ8IbNsw==
X-Google-Smtp-Source: ABdhPJxKmA2HQNTNxWCVgOioqII/Ou6aIh2R9erfQIjw0yVqUNNJqqZLxU2E3svFaxKGJjY1d8JaBA==
X-Received: by 2002:a05:6a00:24c7:b0:4e1:cb76:32d1 with SMTP id
 d7-20020a056a0024c700b004e1cb7632d1mr39486434pfv.36.1646334956978; 
 Thu, 03 Mar 2022 11:15:56 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a62ed19000000b004f140515d56sm3318043pfh.46.2022.03.03.11.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 11:15:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/9] accel/tcg: Split out g2h_tlbe
Date: Thu,  3 Mar 2022 09:15:44 -1000
Message-Id: <20220303191551.466631-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303191551.466631-1-richard.henderson@linaro.org>
References: <20220303191551.466631-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create a new function to combine a CPUTLBEntry addend
with the guest address to form a host address.

Reviewed-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 3b918fe018..0e62aa5d7c 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -91,6 +91,11 @@ static inline size_t sizeof_tlb(CPUTLBDescFast *fast)
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
@@ -986,8 +991,7 @@ static void tlb_reset_dirty_range_locked(CPUTLBEntry *tlb_entry,
 
     if ((addr & (TLB_INVALID_MASK | TLB_MMIO |
                  TLB_DISCARD_WRITE | TLB_NOTDIRTY)) == 0) {
-        addr &= TARGET_PAGE_MASK;
-        addr += tlb_entry->addend;
+        addr = g2h_tlbe(tlb_entry, addr & TARGET_PAGE_MASK);
         if ((addr - start) < length) {
 #if TCG_OVERSIZED_GUEST
             tlb_entry->addr_write |= TLB_NOTDIRTY;
@@ -1537,7 +1541,7 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
         return -1;
     }
 
-    p = (void *)((uintptr_t)addr + entry->addend);
+    p = (void *)g2h_tlbe(entry, addr);
     if (hostp) {
         *hostp = p;
     }
@@ -1629,7 +1633,7 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
     }
 
     /* Everything else is RAM. */
-    *phost = (void *)((uintptr_t)addr + entry->addend);
+    *phost = (void *)g2h_tlbe(entry, addr);
     return flags;
 }
 
@@ -1737,7 +1741,7 @@ bool tlb_plugin_lookup(CPUState *cpu, target_ulong addr, int mmu_idx,
             data->v.io.offset = (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
         } else {
             data->is_io = false;
-            data->v.ram.hostaddr = (void *)((uintptr_t)addr + tlbe->addend);
+            data->v.ram.hostaddr = (void *)g2h_tlbe(tlbe, addr);
         }
         return true;
     } else {
@@ -1836,7 +1840,7 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
         goto stop_the_world;
     }
 
-    hostaddr = (void *)((uintptr_t)addr + tlbe->addend);
+    hostaddr = (void *)g2h_tlbe(tlbe, addr);
 
     if (unlikely(tlb_addr & TLB_NOTDIRTY)) {
         notdirty_write(env_cpu(env), addr, size,
@@ -1967,7 +1971,7 @@ load_helper(CPUArchState *env, target_ulong addr, MemOpIdx oi,
                             access_type, op ^ (need_swap * MO_BSWAP));
         }
 
-        haddr = (void *)((uintptr_t)addr + entry->addend);
+        haddr = (void *)g2h_tlbe(entry, addr);
 
         /*
          * Keep these two load_memop separate to ensure that the compiler
@@ -2004,7 +2008,7 @@ load_helper(CPUArchState *env, target_ulong addr, MemOpIdx oi,
         return res & MAKE_64BIT_MASK(0, size * 8);
     }
 
-    haddr = (void *)((uintptr_t)addr + entry->addend);
+    haddr = (void *)g2h_tlbe(entry, addr);
     return load_memop(haddr, op);
 }
 
@@ -2375,7 +2379,7 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
             notdirty_write(env_cpu(env), addr, size, iotlbentry, retaddr);
         }
 
-        haddr = (void *)((uintptr_t)addr + entry->addend);
+        haddr = (void *)g2h_tlbe(entry, addr);
 
         /*
          * Keep these two store_memop separate to ensure that the compiler
@@ -2400,7 +2404,7 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
         return;
     }
 
-    haddr = (void *)((uintptr_t)addr + entry->addend);
+    haddr = (void *)g2h_tlbe(entry, addr);
     store_memop(haddr, val, op);
 }
 
-- 
2.25.1


