Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF18120B47D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 17:27:14 +0200 (CEST)
Received: from localhost ([::1]:39610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joqG1-0006iO-Kp
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 11:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joq4G-0002nT-KO
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 11:15:04 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:36933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joq4E-0006YN-Lf
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 11:15:04 -0400
Received: by mail-wm1-x344.google.com with SMTP id o2so9723983wmh.2
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 08:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=kErye9eNnDjstzH+b9YxgalNIVLgWMD+e3T4oMN/njw=;
 b=qAWak+eV11R9viLF53UGkq2Gcrob3Vnb9jXyQwLw9aT5IPNSOPI6AIisqRounN5vmn
 vRLbQU71r5VcFYYv54mmrUBrNprPkvfcra6BYglJrzoUZFAcE3jCyscvL2ZFE5PhJwfe
 QGE9cOovv0Ht2GyKsd30qATrnFhZo/eyeLYTr6uSPuks5vjihbNHKwD/2aqJagCybPeH
 YakvGp1Ph5DVYTenvmNWp5DNIGHl9z8hqKdDTV1p1p9W+1r5KaPXupvdyLOteXkq2DVO
 6rY9IvgfqnmkXzOg5wnWcQkVqA9+WjTW2Mz5MfSjK1bAL2uU6CmCIhU8wTtWJ6KPKfR/
 m+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kErye9eNnDjstzH+b9YxgalNIVLgWMD+e3T4oMN/njw=;
 b=VqARpkMh2N/FzyvPuo/GFlnaPblDWlXYJpkkijRXrnXekkSHPvs4mmDNG7ZgPSxCeV
 4MRARe3JIUrQy0Kv3MWnuO1oG2fwxRt6bjq7tsp+EjPPQiYthmItGZwGs8tovFGhlXOI
 jClJW9l2fPtG4m4hFvSBYiFNtpWF0qHvUcV56uZuqCBsIeBAY0O0294akDNaIPf/IVsB
 vfT3zMlTQ1IVIkC9PnQFet0MSEuPusoetjr6bzcBJJCWHb2erTYFyxpaaVeIxofFSfst
 9TAk0U5ooblpdrgVccy8jmQWTEOE63qBE0mbnDWaOhZ06Taf4dxQPE+f6xgiuzFrm9e2
 JQKQ==
X-Gm-Message-State: AOAM530YDuZPeD20E7ewJViQ9CDMuqrzTQ5iy+mYRyTCTJfacI5sTR+I
 zqGaD2fPcRyUB4zw/bddaaDVZn2lMpHh7g==
X-Google-Smtp-Source: ABdhPJy4FRYW/3V3x2IpHIaF+mYv/+Ozhq0LPcNg7eBPaK5hCEiROGXXmPS8bOzts7ZPp0Zdsy91/w==
X-Received: by 2002:a7b:ca52:: with SMTP id m18mr3920667wml.92.1593184500902; 
 Fri, 26 Jun 2020 08:15:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w13sm37838852wrr.67.2020.06.26.08.14.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 08:15:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/57] target/arm: Simplify DC_ZVA
Date: Fri, 26 Jun 2020 16:13:57 +0100
Message-Id: <20200626151424.30117-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200626151424.30117-1-peter.maydell@linaro.org>
References: <20200626151424.30117-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

Now that we know that the operation is on a single page,
we need not loop over pages while probing.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200626033144.790098-19-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-a64.c | 94 +++++++++++------------------------------
 1 file changed, 25 insertions(+), 69 deletions(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index bc0649a44aa..8682630ff6c 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -1119,85 +1119,41 @@ void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr_in)
      * (which matches the usual QEMU behaviour of not implementing either
      * alignment faults or any memory attribute handling).
      */
-
-    ARMCPU *cpu = env_archcpu(env);
-    uint64_t blocklen = 4 << cpu->dcz_blocksize;
+    int blocklen = 4 << env_archcpu(env)->dcz_blocksize;
     uint64_t vaddr = vaddr_in & ~(blocklen - 1);
+    int mmu_idx = cpu_mmu_index(env, false);
+    void *mem;
+
+    /*
+     * Trapless lookup.  In addition to actual invalid page, may
+     * return NULL for I/O, watchpoints, clean pages, etc.
+     */
+    mem = tlb_vaddr_to_host(env, vaddr, MMU_DATA_STORE, mmu_idx);
 
 #ifndef CONFIG_USER_ONLY
-    {
+    if (unlikely(!mem)) {
+        uintptr_t ra = GETPC();
+
         /*
-         * Slightly awkwardly, QEMU's TARGET_PAGE_SIZE may be less than
-         * the block size so we might have to do more than one TLB lookup.
-         * We know that in fact for any v8 CPU the page size is at least 4K
-         * and the block size must be 2K or less, but TARGET_PAGE_SIZE is only
-         * 1K as an artefact of legacy v5 subpage support being present in the
-         * same QEMU executable. So in practice the hostaddr[] array has
-         * two entries, given the current setting of TARGET_PAGE_BITS_MIN.
+         * Trap if accessing an invalid page.  DC_ZVA requires that we supply
+         * the original pointer for an invalid page.  But watchpoints require
+         * that we probe the actual space.  So do both.
          */
-        int maxidx = DIV_ROUND_UP(blocklen, TARGET_PAGE_SIZE);
-        void *hostaddr[DIV_ROUND_UP(2 * KiB, 1 << TARGET_PAGE_BITS_MIN)];
-        int try, i;
-        unsigned mmu_idx = cpu_mmu_index(env, false);
-        TCGMemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
+        (void) probe_write(env, vaddr_in, 1, mmu_idx, ra);
+        mem = probe_write(env, vaddr, blocklen, mmu_idx, ra);
 
-        assert(maxidx <= ARRAY_SIZE(hostaddr));
-
-        for (try = 0; try < 2; try++) {
-
-            for (i = 0; i < maxidx; i++) {
-                hostaddr[i] = tlb_vaddr_to_host(env,
-                                                vaddr + TARGET_PAGE_SIZE * i,
-                                                1, mmu_idx);
-                if (!hostaddr[i]) {
-                    break;
-                }
-            }
-            if (i == maxidx) {
-                /*
-                 * If it's all in the TLB it's fair game for just writing to;
-                 * we know we don't need to update dirty status, etc.
-                 */
-                for (i = 0; i < maxidx - 1; i++) {
-                    memset(hostaddr[i], 0, TARGET_PAGE_SIZE);
-                }
-                memset(hostaddr[i], 0, blocklen - (i * TARGET_PAGE_SIZE));
-                return;
-            }
+        if (unlikely(!mem)) {
             /*
-             * OK, try a store and see if we can populate the tlb. This
-             * might cause an exception if the memory isn't writable,
-             * in which case we will longjmp out of here. We must for
-             * this purpose use the actual register value passed to us
-             * so that we get the fault address right.
+             * The only remaining reason for mem == NULL is I/O.
+             * Just do a series of byte writes as the architecture demands.
              */
-            helper_ret_stb_mmu(env, vaddr_in, 0, oi, GETPC());
-            /* Now we can populate the other TLB entries, if any */
-            for (i = 0; i < maxidx; i++) {
-                uint64_t va = vaddr + TARGET_PAGE_SIZE * i;
-                if (va != (vaddr_in & TARGET_PAGE_MASK)) {
-                    helper_ret_stb_mmu(env, va, 0, oi, GETPC());
-                }
+            for (int i = 0; i < blocklen; i++) {
+                cpu_stb_mmuidx_ra(env, vaddr + i, 0, mmu_idx, ra);
             }
-        }
-
-        /*
-         * Slow path (probably attempt to do this to an I/O device or
-         * similar, or clearing of a block of code we have translations
-         * cached for). Just do a series of byte writes as the architecture
-         * demands. It's not worth trying to use a cpu_physical_memory_map(),
-         * memset(), unmap() sequence here because:
-         *  + we'd need to account for the blocksize being larger than a page
-         *  + the direct-RAM access case is almost always going to be dealt
-         *    with in the fastpath code above, so there's no speed benefit
-         *  + we would have to deal with the map returning NULL because the
-         *    bounce buffer was in use
-         */
-        for (i = 0; i < blocklen; i++) {
-            helper_ret_stb_mmu(env, vaddr + i, 0, oi, GETPC());
+            return;
         }
     }
-#else
-    memset(g2h(vaddr), 0, blocklen);
 #endif
+
+    memset(mem, 0, blocklen);
 }
-- 
2.20.1


