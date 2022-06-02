Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB00453C08C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:01:16 +0200 (CEST)
Received: from localhost ([::1]:35454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwssW-00017C-1K
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:01:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgp-0004hZ-Cf
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:11 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:45603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgm-00006r-61
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:10 -0400
Received: by mail-pf1-x432.google.com with SMTP id b135so5775806pfb.12
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jaTWEUo9dEcM6jmweyaOFnw3wtRMGNYyznA/W1CTYmM=;
 b=YE38Ne2AkxHzJiKFoOsbogSXuTyLkxPIdtNAGRFpnDi/6vfnFBIfw3QuopPK1uJNd1
 9MPLRlJerQOJOXweqHdd5Xtp/sXMYaFGC0BmmI74acCkQuI9jZHI1BXHGV4Nru4okG8a
 WMCmXVjXYVuQ/gKzRijrOeNIw9djtWjWQO5m8lx9/CwQruKGYw/6uBy4YhDnwaEYoRoL
 Uz85uAzuXqA0l14ct56TZeje54F6j0+7ekHnIeC2A62hwGL9R9t6f62GiIFkTi039oK3
 o702noYelw2eBQudgiyTPXX+75RNJVT/kjMTjRVsK2jf71rlOv39XSV91z/1zMXxyBDj
 3CiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jaTWEUo9dEcM6jmweyaOFnw3wtRMGNYyznA/W1CTYmM=;
 b=qDqVVop+Q745O/sZEAa4YviBZeQCN22X0HNFw7R5oA1Qo61X6eqgEh5XU7r0LoeniK
 kGp+IRiAStf9np2SRzKP+drCaRJ76oPD82fizfzR6JWV5ETwpm4E0Z9yguEkoMWBh0Fm
 1lwfHqdFqag63wnjUYObECh+RIbBAAfxp8J754bUtOHvnNNOKh2qZhucv5WgtLXVQPtY
 LFml+InTDVI6SKnB1S/O+0oM7j9q/k/vWBop5kTP7kX7qJndbItBy16sQpFjAAq2kJYC
 2gOUkYKreN0Bm/w1UdhYo76HaagNs9T2bB8YNqA3VHChydC2rSrVACfmIUW0gjpmBwkR
 lJAQ==
X-Gm-Message-State: AOAM53298hXfidPMzsNy3/2cNnus31dj4yj+LxL6SQeNqsowcxi01iCH
 wOn2E7wS47deN9guZsAgrg8g3OixylvV9w==
X-Google-Smtp-Source: ABdhPJyLw5LDta804Lw/h2d2libeAeAv9wRk3chofm97r3xhvTlQWtHnz16ujhKILEhHeziooTyYoQ==
X-Received: by 2002:a05:6a00:2341:b0:51b:dd96:c7c1 with SMTP id
 j1-20020a056a00234100b0051bdd96c7c1mr1484030pfj.14.1654206546554; 
 Thu, 02 Jun 2022 14:49:06 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 14/71] target/arm: Export sve contiguous ldst support functions
Date: Thu,  2 Jun 2022 14:47:56 -0700
Message-Id: <20220602214853.496211-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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


