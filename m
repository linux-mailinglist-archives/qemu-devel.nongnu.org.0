Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B8820AAD4
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 05:41:04 +0200 (CEST)
Received: from localhost ([::1]:33306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jofEd-0006Yf-PD
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 23:41:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof65-0008VN-Kt
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 23:32:13 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:35493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof63-0001t3-Pf
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 23:32:13 -0400
Received: by mail-pf1-x442.google.com with SMTP id h185so4065443pfg.2
 for <qemu-devel@nongnu.org>; Thu, 25 Jun 2020 20:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U/osoVY2cvsT8TlettyawEwRpLG++nKPsyGP4nM5lYM=;
 b=xT3ZqXRGjz5iJM/v5q4PV4+HaKo3BnG19PXptv0tLGGFaGf/KBlrGwRJ1kyXchldyK
 CiC16ifGaudbFxmItYd0L4UKwmgfysaRXNoZksexesUmD8icEL3RIPtd2P3kOS+p1OlI
 NUtiuTZ0x2Te3ywXC8ISiQfQdhFvit4KaRocgkfJOMk+EHyT1XhTWRMl9TZpo0cWayqd
 xZio5KzejoDahxxt8zV52enSVqu71ddF6lhKJlbaTs9cTlJL5lcj31WemgI2WUhPFlqA
 G0GY4P1FJZwOftM9SBu646+kztrP2n1QZTorxb23vxLTpMZGmrGEmokv//1zgrrrGvQa
 n57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U/osoVY2cvsT8TlettyawEwRpLG++nKPsyGP4nM5lYM=;
 b=kXWaOymySrKRRaC/8237M0Kofe2N0EY2+4x+8WmUjewgeSyYRFFxcWCFVLWk29h1eZ
 FgyvKDQtb2twDZkKPYhHfWz9uTV72qOCG7rtL1ecIcULSl9cH826UuOwkULxqF15BG1i
 yjCne9M7UGxD2tZ4EwXNRqsFJ20fdZYfx9scOZhSgHPMEnPtD19pSaXelBJhoGq0Ozj8
 rRfJ9eGXLSO0RQ54Zf0tLjqiW9siLRjwgpN/AJU11okm/OehQvYmkdXX1QbDHFUOVGvt
 BVzl4EdwsIljlzFPKkVIKu528X9EDNHxIgWSj4YoxR50x8lWMG3+GVXghzbdeHcSqj0J
 GOQw==
X-Gm-Message-State: AOAM530HcEWHakBqkvJbTWhf1inxWsikVDsUCMtgOpeYDvmIskoZqBmo
 NCfGIeua6qDPY/jsLnYbY4DXO0/gqA0=
X-Google-Smtp-Source: ABdhPJwUa7dgHcSg7VKUCab6HZo7LmMjmGkjstPyfylsrYLDBKMNwe0dlQnvPU6NBEOnwkI/bt9Xgg==
X-Received: by 2002:a62:17d8:: with SMTP id 207mr810284pfx.44.1593142330045;
 Thu, 25 Jun 2020 20:32:10 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y27sm1605256pgc.56.2020.06.25.20.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 20:32:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 18/46] target/arm: Simplify DC_ZVA
Date: Thu, 25 Jun 2020 20:31:16 -0700
Message-Id: <20200626033144.790098-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626033144.790098-1-richard.henderson@linaro.org>
References: <20200626033144.790098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we know that the operation is on a single page,
we need not loop over pages while probing.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.c | 94 +++++++++++------------------------------
 1 file changed, 25 insertions(+), 69 deletions(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index bc0649a44a..8682630ff6 100644
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
2.25.1


