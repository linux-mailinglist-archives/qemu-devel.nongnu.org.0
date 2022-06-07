Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B44FF54164E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 22:50:07 +0200 (CEST)
Received: from localhost ([::1]:56098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyg9O-0004Qh-PB
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 16:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftJ-0007lE-55
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:29 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:35680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftC-0007GS-R4
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:28 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so21930494pjo.0
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jaTWEUo9dEcM6jmweyaOFnw3wtRMGNYyznA/W1CTYmM=;
 b=mgkASMsfiHCqjdCcYtfukBtYmdOfi0ed97QuMWkvpF7oBXVOrexiZekGG7v/06Cw7J
 3TOQnfHPNLqrUOtSXg1m5vWH5ikxHdvVCymwySZUp8tXUWuF+NNc2wqIzzYj4GwJP90v
 3XwHhx8Fo3rSyJaakwC7AaOyoFDsVLhVZrr77+VxtL7rPf4Y9oSsKffLcfC3Lthl1ykj
 UUBOYlG0nLHWhHjgnDna94p9PZiQ+NGuu18KBdT1L27B5o9Gc6AV1vcFFDc9k7uxuWWE
 u3QsWArXYyBvxuH2wb/rLshamaZee6HDezDBJsOvCZV9JbqYo6pOMsPPSG3Pk+bdWIv6
 hh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jaTWEUo9dEcM6jmweyaOFnw3wtRMGNYyznA/W1CTYmM=;
 b=1f6z2K1LXgDg9mRL1dVUZ29Pv/pO4G/Pj2yexMjFVPE97Jea2B8pehcUKleiw7D1Rm
 Tb6MIZX+1xWpH0BhgOysWNkQMvowUJqwogVWrUQHklrb0mpOY07PlAhixbpuO+7h5oB8
 O1eM8/pHE6odSTKAz8J3WIJYSP0qFbZMJ+KGjZnBWkfBScLSHbuo35k0X+YEibvuyFWW
 XtGo4trjUugK5bC2tdb6QOATgKsfZglNvMqQNPrBZWxSf038gOg+2wwV8GkUknzM/s7J
 5I/KdE08aFoQ7wM6g8HgWqJEandefuBhYu5llJbyVngwPyTzn6rrGLGZAwOrnAORCrY+
 1THw==
X-Gm-Message-State: AOAM530wv3dwiCeJ78VH6IOkEuSikt0Qxt/16Euw1CB2Vq/VkPQ0bq+c
 zYYKQtjfyP/GD5qPIFS28Hlet4vmbBUPuA==
X-Google-Smtp-Source: ABdhPJyC5BslkU1osfldgjfB/BxZ593/8Ed9dCTlecqBrcX2rkPEyO144yNk9zoMGhh9sR3gPs1GEA==
X-Received: by 2002:a17:902:f68b:b0:163:f358:d4ad with SMTP id
 l11-20020a170902f68b00b00163f358d4admr31175379plg.23.1654634000395; 
 Tue, 07 Jun 2022 13:33:20 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 14/71] target/arm: Export sve contiguous ldst support
 functions
Date: Tue,  7 Jun 2022 13:32:09 -0700
Message-Id: <20220607203306.657998-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Export all of the support functions for performing bulk
fault analysis on a set of elements at contiguous addresses
controlled by a predicate.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_ldst_internal.h | 94 ++++++++++++++++++++++++++++++++++
 target/arm/sve_helper.c        | 87 ++++++-------------------------
 2 files changed, 111 insertions(+), 70 deletions(-)

diff --git a/target/arm/sve_ldst_internal.h b/target/arm/sve_ldst_internal.h
index ef9117e84c..b5c473fc48 100644
--- a/target/arm/sve_ldst_internal.h
+++ b/target/arm/sve_ldst_internal.h
@@ -124,4 +124,98 @@ DO_ST_PRIM_2(dd, H1_8, uint64_t, uint64_t, stq)
 #undef DO_LD_PRIM_2
 #undef DO_ST_PRIM_2
 
+/*
+ * Resolve the guest virtual address to info->host and info->flags.
+ * If @nofault, return false if the page is invalid, otherwise
+ * exit via page fault exception.
+ */
+
+typedef struct {
+    void *host;
+    int flags;
+    MemTxAttrs attrs;
+} SVEHostPage;
+
+bool sve_probe_page(SVEHostPage *info, bool nofault, CPUARMState *env,
+                    target_ulong addr, int mem_off, MMUAccessType access_type,
+                    int mmu_idx, uintptr_t retaddr);
+
+/*
+ * Analyse contiguous data, protected by a governing predicate.
+ */
+
+typedef enum {
+    FAULT_NO,
+    FAULT_FIRST,
+    FAULT_ALL,
+} SVEContFault;
+
+typedef struct {
+    /*
+     * First and last element wholly contained within the two pages.
+     * mem_off_first[0] and reg_off_first[0] are always set >= 0.
+     * reg_off_last[0] may be < 0 if the first element crosses pages.
+     * All of mem_off_first[1], reg_off_first[1] and reg_off_last[1]
+     * are set >= 0 only if there are complete elements on a second page.
+     *
+     * The reg_off_* offsets are relative to the internal vector register.
+     * The mem_off_first offset is relative to the memory address; the
+     * two offsets are different when a load operation extends, a store
+     * operation truncates, or for multi-register operations.
+     */
+    int16_t mem_off_first[2];
+    int16_t reg_off_first[2];
+    int16_t reg_off_last[2];
+
+    /*
+     * One element that is misaligned and spans both pages,
+     * or -1 if there is no such active element.
+     */
+    int16_t mem_off_split;
+    int16_t reg_off_split;
+
+    /*
+     * The byte offset at which the entire operation crosses a page boundary.
+     * Set >= 0 if and only if the entire operation spans two pages.
+     */
+    int16_t page_split;
+
+    /* TLB data for the two pages. */
+    SVEHostPage page[2];
+} SVEContLdSt;
+
+/*
+ * Find first active element on each page, and a loose bound for the
+ * final element on each page.  Identify any single element that spans
+ * the page boundary.  Return true if there are any active elements.
+ */
+bool sve_cont_ldst_elements(SVEContLdSt *info, target_ulong addr, uint64_t *vg,
+                            intptr_t reg_max, int esz, int msize);
+
+/*
+ * Resolve the guest virtual addresses to info->page[].
+ * Control the generation of page faults with @fault.  Return false if
+ * there is no work to do, which can only happen with @fault == FAULT_NO.
+ */
+bool sve_cont_ldst_pages(SVEContLdSt *info, SVEContFault fault,
+                         CPUARMState *env, target_ulong addr,
+                         MMUAccessType access_type, uintptr_t retaddr);
+
+#ifdef CONFIG_USER_ONLY
+static inline void
+sve_cont_ldst_watchpoints(SVEContLdSt *info, CPUARMState *env, uint64_t *vg,
+                          target_ulong addr, int esize, int msize,
+                          int wp_access, uintptr_t retaddr)
+{ }
+#else
+void sve_cont_ldst_watchpoints(SVEContLdSt *info, CPUARMState *env,
+                               uint64_t *vg, target_ulong addr,
+                               int esize, int msize, int wp_access,
+                               uintptr_t retaddr);
+#endif
+
+void sve_cont_ldst_mte_check(SVEContLdSt *info, CPUARMState *env, uint64_t *vg,
+                             target_ulong addr, int esize, int msize,
+                             uint32_t mtedesc, uintptr_t ra);
+
 #endif /* TARGET_ARM_SVE_LDST_INTERNAL_H */
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 0c6dde00aa..8cd371e3e3 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -5341,16 +5341,9 @@ static intptr_t find_next_active(uint64_t *vg, intptr_t reg_off,
  * exit via page fault exception.
  */
 
-typedef struct {
-    void *host;
-    int flags;
-    MemTxAttrs attrs;
-} SVEHostPage;
-
-static bool sve_probe_page(SVEHostPage *info, bool nofault,
-                           CPUARMState *env, target_ulong addr,
-                           int mem_off, MMUAccessType access_type,
-                           int mmu_idx, uintptr_t retaddr)
+bool sve_probe_page(SVEHostPage *info, bool nofault, CPUARMState *env,
+                    target_ulong addr, int mem_off, MMUAccessType access_type,
+                    int mmu_idx, uintptr_t retaddr)
 {
     int flags;
 
@@ -5406,59 +5399,13 @@ static bool sve_probe_page(SVEHostPage *info, bool nofault,
     return true;
 }
 
-
-/*
- * Analyse contiguous data, protected by a governing predicate.
- */
-
-typedef enum {
-    FAULT_NO,
-    FAULT_FIRST,
-    FAULT_ALL,
-} SVEContFault;
-
-typedef struct {
-    /*
-     * First and last element wholly contained within the two pages.
-     * mem_off_first[0] and reg_off_first[0] are always set >= 0.
-     * reg_off_last[0] may be < 0 if the first element crosses pages.
-     * All of mem_off_first[1], reg_off_first[1] and reg_off_last[1]
-     * are set >= 0 only if there are complete elements on a second page.
-     *
-     * The reg_off_* offsets are relative to the internal vector register.
-     * The mem_off_first offset is relative to the memory address; the
-     * two offsets are different when a load operation extends, a store
-     * operation truncates, or for multi-register operations.
-     */
-    int16_t mem_off_first[2];
-    int16_t reg_off_first[2];
-    int16_t reg_off_last[2];
-
-    /*
-     * One element that is misaligned and spans both pages,
-     * or -1 if there is no such active element.
-     */
-    int16_t mem_off_split;
-    int16_t reg_off_split;
-
-    /*
-     * The byte offset at which the entire operation crosses a page boundary.
-     * Set >= 0 if and only if the entire operation spans two pages.
-     */
-    int16_t page_split;
-
-    /* TLB data for the two pages. */
-    SVEHostPage page[2];
-} SVEContLdSt;
-
 /*
  * Find first active element on each page, and a loose bound for the
  * final element on each page.  Identify any single element that spans
  * the page boundary.  Return true if there are any active elements.
  */
-static bool sve_cont_ldst_elements(SVEContLdSt *info, target_ulong addr,
-                                   uint64_t *vg, intptr_t reg_max,
-                                   int esz, int msize)
+bool sve_cont_ldst_elements(SVEContLdSt *info, target_ulong addr, uint64_t *vg,
+                            intptr_t reg_max, int esz, int msize)
 {
     const int esize = 1 << esz;
     const uint64_t pg_mask = pred_esz_masks[esz];
@@ -5548,9 +5495,9 @@ static bool sve_cont_ldst_elements(SVEContLdSt *info, target_ulong addr,
  * Control the generation of page faults with @fault.  Return false if
  * there is no work to do, which can only happen with @fault == FAULT_NO.
  */
-static bool sve_cont_ldst_pages(SVEContLdSt *info, SVEContFault fault,
-                                CPUARMState *env, target_ulong addr,
-                                MMUAccessType access_type, uintptr_t retaddr)
+bool sve_cont_ldst_pages(SVEContLdSt *info, SVEContFault fault,
+                         CPUARMState *env, target_ulong addr,
+                         MMUAccessType access_type, uintptr_t retaddr)
 {
     int mmu_idx = cpu_mmu_index(env, false);
     int mem_off = info->mem_off_first[0];
@@ -5606,12 +5553,12 @@ static bool sve_cont_ldst_pages(SVEContLdSt *info, SVEContFault fault,
     return have_work;
 }
 
-static void sve_cont_ldst_watchpoints(SVEContLdSt *info, CPUARMState *env,
-                                      uint64_t *vg, target_ulong addr,
-                                      int esize, int msize, int wp_access,
-                                      uintptr_t retaddr)
-{
 #ifndef CONFIG_USER_ONLY
+void sve_cont_ldst_watchpoints(SVEContLdSt *info, CPUARMState *env,
+                               uint64_t *vg, target_ulong addr,
+                               int esize, int msize, int wp_access,
+                               uintptr_t retaddr)
+{
     intptr_t mem_off, reg_off, reg_last;
     int flags0 = info->page[0].flags;
     int flags1 = info->page[1].flags;
@@ -5667,12 +5614,12 @@ static void sve_cont_ldst_watchpoints(SVEContLdSt *info, CPUARMState *env,
             } while (reg_off & 63);
         } while (reg_off <= reg_last);
     }
-#endif
 }
+#endif
 
-static void sve_cont_ldst_mte_check(SVEContLdSt *info, CPUARMState *env,
-                                    uint64_t *vg, target_ulong addr, int esize,
-                                    int msize, uint32_t mtedesc, uintptr_t ra)
+void sve_cont_ldst_mte_check(SVEContLdSt *info, CPUARMState *env,
+                             uint64_t *vg, target_ulong addr, int esize,
+                             int msize, uint32_t mtedesc, uintptr_t ra)
 {
     intptr_t mem_off, reg_off, reg_last;
 
-- 
2.34.1


