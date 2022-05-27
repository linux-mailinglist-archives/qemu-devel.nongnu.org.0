Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2AE5366ED
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:29:11 +0200 (CEST)
Received: from localhost ([::1]:40706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuehy-0004lQ-Mg
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueMN-0003b4-MP
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:06:51 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:46031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueM7-0001fR-N9
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:06:51 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 w2-20020a17090ac98200b001e0519fe5a8so4991475pjt.4
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JMhstRQpYvMahAZZORKOvBycCaQ38heGB1yApy4zCv0=;
 b=OzydvdwmZRyLNXgbYML2NhaSMF2hRh6YB6He3e+dJ+5pq7mrLwdSpor7/CCwSmfHrf
 EmC8aZYQMUD/O22lQ33ZxNzKR2KGfvcPbHwsMUK9OqrFJTLmQ1ooA/o8N0IzSHsztSTG
 oq2i1vgVGuOfSG5s7oXip2MQ40/DruSEOLifT8Ee1k1BAuljXQ+SYKfa2I7tsXAWuVDH
 SgnyjuBxUTcsRQ35KtQWvzB0UN8c5KycPnJ938FneqJJ2aN5ZQWmTd8cZ22FDji3D5+h
 cKGIyz+rTu8tNLFxwJJDCzo6E7xB+ecrQHc6gCKuKIdPXpRtMGwlEAfTm/YkVN3rpSKZ
 u5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JMhstRQpYvMahAZZORKOvBycCaQ38heGB1yApy4zCv0=;
 b=meywoVW5nY/znZuTmKkBNwTc3xPDqTlL0kC1u2QQ9ncWixFQENeqnQ9DFbPff+TIL1
 B/HfOfWPP/rjKZ66xY7HnOod9dyP2de0nQDqsOL/xX5mFz6D7t2gXm3y2p+xOG29CWUg
 3VwRIuCzTpi6hZ9XlrmXMlakDHFbp9bUeO6+wlCtX/uW/ssGpJtYwbsYy8T+5DdltMfm
 mEyao7GCEOnPRuuhSz3VZ+PP4tpD0iq4BNn14v3J5O+TqYj0sma0EGeHKWbGJvHfJMel
 pQFruutUpViYYJAJ/CWX/3+OjLo00vS+U6hItz/KbEGpHl2+G62TC2P4BtOvPka4To6I
 yykQ==
X-Gm-Message-State: AOAM5336FwqX8FmyhoCsIbzy88Jk5HZYvbDfrt9JUi/bOULCNsF8YN7H
 h5yJjXp2x7iqgZaWlC0Ao0evHvciVQOxcQ==
X-Google-Smtp-Source: ABdhPJzYhjLt5AMoSUKaJ+h3JAHRWf03rtRGIW8/jfjQoM+LFhw1BZGDN4nwBcQ7hDRleVp8WSm+mg==
X-Received: by 2002:a17:902:e749:b0:163:59da:56f0 with SMTP id
 p9-20020a170902e74900b0016359da56f0mr14891123plf.116.1653674794303; 
 Fri, 27 May 2022 11:06:34 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170902cf4a00b001618fee3900sm3934492plg.196.2022.05.27.11.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:06:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 11/15] target/arm: Export sve contiguous ldst support
 functions
Date: Fri, 27 May 2022 11:06:19 -0700
Message-Id: <20220527180623.185261-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527180623.185261-1-richard.henderson@linaro.org>
References: <20220527180623.185261-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
index ea4c835689..446d7ac5cb 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -5339,16 +5339,9 @@ static intptr_t find_next_active(uint64_t *vg, intptr_t reg_off,
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
 
@@ -5404,59 +5397,13 @@ static bool sve_probe_page(SVEHostPage *info, bool nofault,
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
@@ -5546,9 +5493,9 @@ static bool sve_cont_ldst_elements(SVEContLdSt *info, target_ulong addr,
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
@@ -5604,12 +5551,12 @@ static bool sve_cont_ldst_pages(SVEContLdSt *info, SVEContFault fault,
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
@@ -5665,12 +5612,12 @@ static void sve_cont_ldst_watchpoints(SVEContLdSt *info, CPUARMState *env,
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


