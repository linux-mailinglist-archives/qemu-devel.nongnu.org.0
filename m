Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A92511043
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 06:44:40 +0200 (CEST)
Received: from localhost ([::1]:60104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njZXb-0000rS-Lv
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 00:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njZSv-0001IA-77
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 00:39:50 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:41735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njZSs-0007SE-FO
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 00:39:48 -0400
Received: by mail-pf1-x42c.google.com with SMTP id p8so595981pfh.8
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 21:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ULcFg+YQtMFDdmUsYGTe6VlNAYytQ0q+FNB9e1xihHc=;
 b=vAHCnIJFKSGzke1kR1JTpgjaVhRtkKvSwQ0XWmYh6+yYRuhV4GN4Zbxb500XajiSIO
 BzQYgG7jaG9RYtjLGPUajRHdBaQHLe4WkUDu1rToRm+AW5uPSaCg0gIvfVmDmr+bSAx3
 Wsmu6eTK/0nXPt94V7OV+ODzefs7yfq50SmxKyKamRsQ5VGzqYjqll0Y7gTjkHV8dsFT
 NILzs8ZW0f7fqxOJfjekrIQhQBF7Zb7EfCug8xx7AKEPt6MccE3q4lXeY2F4A28y8nXg
 TQue+bT/AJlJrNaL9OVsQwSvCFcAiZ1rf92JkwHevEGUffmqY7MGqCgZUqR4APgEvPKP
 sPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ULcFg+YQtMFDdmUsYGTe6VlNAYytQ0q+FNB9e1xihHc=;
 b=s6yWLYOnVpvaRvbLuKBuPBHHyV8Yj+8v7OOduLimVXHHgL8UWoOLZ8gdnKCrEZ6ETE
 dgRvgVwAZiM+ZyjckyH8Y9jHwdh8KIBpxVCpWIUIIRRbsV9RBjVxSELg53vUU5St7afd
 p1a5c1gFdy5zf8hdRlY2MEy/BK7lKzeYfa1224RbE1B8a3vMwMhP9FpRJk3YashYx4tO
 2Sp/gwxLHJIaCR2Ig59KI3QDE6oE0qAns7i4M9RKeOlJvfyAg5lpWIJ6fCGs0IeAhsC1
 IUDkVcUCm8qSZGfBQYsQYQbZVb4/inXcoYGO5TA1cutiUHyrhSl8CwrbdhzoLjkCAWk1
 usNA==
X-Gm-Message-State: AOAM532NLQB8zh5dHyLWUobHEGZrRkBnkkkU8+pjupYFbZtNcsLutIoj
 K3OiX/IODvxhGxFHsKcc+iyqKTdi5Kdbmw==
X-Google-Smtp-Source: ABdhPJzD6IgNCVa4R4Kuq6BCJ3nd/EZx0EB2vCas3uOAMpDg05ZEIgmX9dWqIjBgJRsjYm5cweBkDQ==
X-Received: by 2002:a63:88c8:0:b0:3ab:1871:13b4 with SMTP id
 l191-20020a6388c8000000b003ab187113b4mr15034786pgd.85.1651034384548; 
 Tue, 26 Apr 2022 21:39:44 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 f16-20020aa78b10000000b0050a81508653sm16875632pfd.198.2022.04.26.21.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 21:39:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/6] accel/tcg: Assert mmu_idx in range before use in cputlb
Date: Tue, 26 Apr 2022 21:39:37 -0700
Message-Id: <20220427043942.294654-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220427043942.294654-1-richard.henderson@linaro.org>
References: <20220427043942.294654-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity reports out-of-bound accesses within cputlb.c.
This should be a false positive due to how the index is
decoded from MemOpIdx.  To be fair, nothing is checking
the correct bounds during encoding either.

Assert index in range before use, both to catch user errors
and to pacify static analysis.

Fixes: Coverity CID 1487120, 1487127, 1487170, 1487196, 1487215, 1487238
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220401170813.318609-1-richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 40 +++++++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index dd45e0467b..f90f4312ea 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1761,7 +1761,7 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
                                MemOpIdx oi, int size, int prot,
                                uintptr_t retaddr)
 {
-    size_t mmu_idx = get_mmuidx(oi);
+    uintptr_t mmu_idx = get_mmuidx(oi);
     MemOp mop = get_memop(oi);
     int a_bits = get_alignment_bits(mop);
     uintptr_t index;
@@ -1769,6 +1769,8 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
     target_ulong tlb_addr;
     void *hostaddr;
 
+    tcg_debug_assert(mmu_idx < NB_MMU_MODES);
+
     /* Adjust the given return address.  */
     retaddr -= GETPC_ADJ;
 
@@ -1908,18 +1910,20 @@ load_helper(CPUArchState *env, target_ulong addr, MemOpIdx oi,
             uintptr_t retaddr, MemOp op, bool code_read,
             FullLoadHelper *full_load)
 {
-    uintptr_t mmu_idx = get_mmuidx(oi);
-    uintptr_t index = tlb_index(env, mmu_idx, addr);
-    CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
-    target_ulong tlb_addr = code_read ? entry->addr_code : entry->addr_read;
     const size_t tlb_off = code_read ?
         offsetof(CPUTLBEntry, addr_code) : offsetof(CPUTLBEntry, addr_read);
     const MMUAccessType access_type =
         code_read ? MMU_INST_FETCH : MMU_DATA_LOAD;
-    unsigned a_bits = get_alignment_bits(get_memop(oi));
+    const unsigned a_bits = get_alignment_bits(get_memop(oi));
+    const size_t size = memop_size(op);
+    uintptr_t mmu_idx = get_mmuidx(oi);
+    uintptr_t index;
+    CPUTLBEntry *entry;
+    target_ulong tlb_addr;
     void *haddr;
     uint64_t res;
-    size_t size = memop_size(op);
+
+    tcg_debug_assert(mmu_idx < NB_MMU_MODES);
 
     /* Handle CPU specific unaligned behaviour */
     if (addr & ((1 << a_bits) - 1)) {
@@ -1927,6 +1931,10 @@ load_helper(CPUArchState *env, target_ulong addr, MemOpIdx oi,
                              mmu_idx, retaddr);
     }
 
+    index = tlb_index(env, mmu_idx, addr);
+    entry = tlb_entry(env, mmu_idx, addr);
+    tlb_addr = code_read ? entry->addr_code : entry->addr_read;
+
     /* If the TLB entry is for a different page, reload and try again.  */
     if (!tlb_hit(tlb_addr, addr)) {
         if (!victim_tlb_hit(env, mmu_idx, index, tlb_off,
@@ -2310,14 +2318,16 @@ static inline void QEMU_ALWAYS_INLINE
 store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
              MemOpIdx oi, uintptr_t retaddr, MemOp op)
 {
-    uintptr_t mmu_idx = get_mmuidx(oi);
-    uintptr_t index = tlb_index(env, mmu_idx, addr);
-    CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
-    target_ulong tlb_addr = tlb_addr_write(entry);
     const size_t tlb_off = offsetof(CPUTLBEntry, addr_write);
-    unsigned a_bits = get_alignment_bits(get_memop(oi));
+    const unsigned a_bits = get_alignment_bits(get_memop(oi));
+    const size_t size = memop_size(op);
+    uintptr_t mmu_idx = get_mmuidx(oi);
+    uintptr_t index;
+    CPUTLBEntry *entry;
+    target_ulong tlb_addr;
     void *haddr;
-    size_t size = memop_size(op);
+
+    tcg_debug_assert(mmu_idx < NB_MMU_MODES);
 
     /* Handle CPU specific unaligned behaviour */
     if (addr & ((1 << a_bits) - 1)) {
@@ -2325,6 +2335,10 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
                              mmu_idx, retaddr);
     }
 
+    index = tlb_index(env, mmu_idx, addr);
+    entry = tlb_entry(env, mmu_idx, addr);
+    tlb_addr = tlb_addr_write(entry);
+
     /* If the TLB entry is for a different page, reload and try again.  */
     if (!tlb_hit(tlb_addr, addr)) {
         if (!victim_tlb_hit(env, mmu_idx, index, tlb_off,
-- 
2.34.1


