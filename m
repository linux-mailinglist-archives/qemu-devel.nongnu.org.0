Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A044EF8B1
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 19:11:04 +0200 (CEST)
Received: from localhost ([::1]:49884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naKnf-0003uu-Na
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 13:11:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naKl6-0001jL-7G
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 13:08:24 -0400
Received: from [2a00:1450:4864:20::630] (port=33789
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naKl3-0000BG-O6
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 13:08:23 -0400
Received: by mail-ej1-x630.google.com with SMTP id pv16so7290663ejb.0
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 10:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vWFZ15jryi1CWSrHUmsH4G4M4Ku7z9VYRAOXXFa2ua8=;
 b=G7g+vb+3iGsrE/w3XnNkeYzPwFitwvqlpI8S0rLCXfbStEps5M3UnXRAIAIgsOf/hu
 K77pYXYYTCjaxh1JZ5/UeMafrEeJ8ZlwritNH9xQzrHSN524dOjL4Dn21Z/DJS6SvvgG
 BpBwMzap1qnZFJ2AYcM+CYhKsfy3ZYMCekLMWhSK1XqO3tfBk6jKCPm0/gM1nR6JJTQG
 DNT/5CXMA80sjNLPcUFFN0v+T6x2jX9wwb4s4JHkZSHJQOwttpxTSOKP+DjtEckoOkeP
 ZyRLEOY5exSa+YXlQmQXpXbFX4nr4hYvsI5Dvqc/oXrNv1nwEQyZhoTW4HZww45JICtG
 Qrig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vWFZ15jryi1CWSrHUmsH4G4M4Ku7z9VYRAOXXFa2ua8=;
 b=BQoH3NbNbgm3T2QHFtSPS9SXJdUWZvEneobrBW7W2p22HkS8V+ay9zgYNPSx7ndMkq
 mi9B8csgvucePhzcScOH4QW+wVLmo31BRSNctRYOX+GNbUQaVMER9z65FGEgl/AE13EM
 ZLdhFS5fXlkIYSQPamIUKL5koteUf3EmxMyo50psEcl65daPx2ed+ZVHbBvLxGNBdH5N
 qg9QtyoLnA2YHQgMXq5BM+CwD8NzfPlmLZ5FVuZ0cKgUHyVe30YA+2nYzgkBNamBi2Gh
 EHg4vOJOGXBhcg7TVXrw/e9fo7u5w0QibYi3M1YhSoQz/x1yCB6ZEv4LNYKa7PYEmk9I
 nLug==
X-Gm-Message-State: AOAM530PTABPXS1u0WswNck0NC8sTGgxKO1CKZTQC1FEbulsFzPf95r/
 oQjcsO5eP+7AaVkkU/oXSMhM3pW6hFMk1Jh4xHA=
X-Google-Smtp-Source: ABdhPJw3Bl4eInMCUEzGadtbINRZtRqYre9ArDBrTIZhJwAKaeevH1CnDCtPXHfPG8GjNzn2ODkeuQ==
X-Received: by 2002:a17:906:dc90:b0:6df:f5fb:cf91 with SMTP id
 cs16-20020a170906dc9000b006dff5fbcf91mr646873ejc.429.1648832899814; 
 Fri, 01 Apr 2022 10:08:19 -0700 (PDT)
Received: from localhost.localdomain ([185.81.138.17])
 by smtp.gmail.com with ESMTPSA id
 h9-20020aa7c949000000b0041b4d8ae50csm1415743edt.34.2022.04.01.10.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 10:08:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] accel/tcg: Assert mmu_idx in range before use in cputlb
Date: Fri,  1 Apr 2022 11:08:13 -0600
Message-Id: <20220401170813.318609-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: peter.maydell@linaro.org
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
2.25.1


