Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4A83904D6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:14:51 +0200 (CEST)
Received: from localhost ([::1]:32898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYle-0003IW-NU
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYau-0001vZ-8f
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:44 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:45740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYaq-00047Q-N5
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:43 -0400
Received: by mail-wr1-x429.google.com with SMTP id x7so13000991wrt.12
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xpZFcdstDaNKmxiPXYo2caZIIwvU5lTXwO2/jGEIUi0=;
 b=hiCmdw+Y3hWbW9hFFKLzgr+AU87G2Cj1zQW8UgU4X9CgV0jNDwmjzNkIijgbbKUFp/
 2zKV0uE+oSM598+MKNhCISEaboQGUVnIRD/F9BgyvS1VEISgbTKD7tGHjgy9ELdow+1Y
 bziu7OmPodNztLr9/LvfL/9u2tUl/NVkEJGj7wqIdDsFzytaV2UhkH9ciyEWMo/0RClp
 oDNE4bjCvdWvrjJM5u1h/O0IBE9wVNRmFtBAq2JHqhIUVrSwLIeHrfQrJs/Wt2cC5JoC
 g3Fg5adwVgI36/AMYAI6J3Im0TEzOd5K9zqEBeoXmvhe8YpJo0Z/R6LiWz+LiMLcUGBu
 6RFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xpZFcdstDaNKmxiPXYo2caZIIwvU5lTXwO2/jGEIUi0=;
 b=deNKHuTbNv+V4qx1FBfo181v9i9g4O3t6SV0Bm0Uwo7M+736Vu1IuXnAKjviDstlNM
 Pqz7n4NoHCtJZtD29ApzgROD2sPjGDrzofauR2m899TkqJqp4e5xwUHBs/ryTOrg/oEB
 mHFePXhjvx04hemL6OWJhlR/LHxVzB3gJ5va1Sfxi/7dxBKCyv5svsgHFdyJs0Otpnb5
 vP2i6Fqdy1yLoA1jiKq2nsTYDqHxxSaq2YfcFmniTlw+bAYUaWRtTFkf2P/QeysfLp2d
 VOgH7L+7UvxZ8koW0GC1BDTamMDXrF961pPlfOXBDkDfX4BNtEiYhK/VdJMwK75N64l5
 sQ7g==
X-Gm-Message-State: AOAM532LfNYRdPW//dkSrk2Arm4UWi3K/qxXOM2lpk+iLtG32DI/NJzU
 oO+/Qvvl7EflxLU/uMU6BRAwpTJpLFXPDBUG
X-Google-Smtp-Source: ABdhPJzwyaP8gewm8NzBRwRCPAraAKmVNHEgZhLrWB6ZDnPvamb7q+vOJAvEK5iH10+1JNHrcTw0Ng==
X-Received: by 2002:adf:e8c8:: with SMTP id k8mr28035348wrn.368.1621955019184; 
 Tue, 25 May 2021 08:03:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.03.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:03:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 011/114] accel/tcg: Pass length argument to
 tlb_flush_range_locked()
Date: Tue, 25 May 2021 16:01:41 +0100
Message-Id: <20210525150324.32370-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Rename tlb_flush_page_bits_locked() -> tlb_flush_range_locked(), and
have callers pass a length argument (currently TARGET_PAGE_SIZE) via
the TLBFlushPageBitsByMMUIdxData structure.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210509151618.2331764-3-f4bug@amsat.org
Message-Id: <20210508201640.1045808-1-richard.henderson@linaro.org>
[PMD: Split from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
2.20.1


