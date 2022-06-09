Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BFA54496B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 12:47:22 +0200 (CEST)
Received: from localhost ([::1]:36708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzFhB-00064Z-OI
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 06:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7i-0001lt-E0
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:38 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:53919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7d-00067I-9J
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:37 -0400
Received: by mail-wm1-x331.google.com with SMTP id z9so5330339wmf.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=F9/bTgmopMaBQ0OD2oJr6RwZaHaOzv4367oHJLRZpW4=;
 b=OJEvjqJyKIiIBkJceysPIhW243YMUSKb6cTvXTQeY+PLTvgSfIboX35HdPDqA9KKFn
 GMYBGIW8O0Kg8r/0pRN/EXOubKbX+A6XBBkaXn2ZNYbzbcKIFj8TGWL2VzycdHIEH8rF
 oq5XkxqxlqUySs3deCbiQgRQc8H+oggTjaeDk8lxqyMIgF4c0oNa8ypttrxoMJtbj/K/
 7rcPvlouKGdPhM3943JNs5uD10SS522tvtY8G984X05S4Ng/u3boe/nRKOK1Msdp01N1
 LCziZQBiA/nr1I1z54ZqC3DyMaOjJptTHZQyq/m/fEQKXdBEXwwR7dyyELx4iqLd20It
 0oMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F9/bTgmopMaBQ0OD2oJr6RwZaHaOzv4367oHJLRZpW4=;
 b=c+tnp+hVgFK0gLCMrRdkgkKxUMa5IigJSXOtlSWo5pgQDYzMBQMQXc9ICbBAoKyIjK
 ZV7bdWmtte9MTbAvLigLZ7Wl5kUOO/bV2yBzh2MvsLh3bUTPMakKllmXk1PLYmog/yYo
 zEAquOrSbVL7HX7ZZ85cJ00xi5mrc1Jisj1vRNPQVX2AmbI8GNNm0N5xBtBuNPbSbM37
 sVJH/cRDzIGFPUcwmDQlP1SkMJ3d93ymVyyQ43rzCZXtX9Hr/59WzbcM6ba5dnNAVvIl
 4SPm1WGoGsFXWiGmHuLB5l2+wxqVU6FQ2LtlUI+BcCpVQJY5Bmt7jYEp1xP3v15/Jtb1
 wu+Q==
X-Gm-Message-State: AOAM532GmZTfIcq/ptgbWYStzbUxM3pP/OFidb6FB6CNpxa2tUdO3nNi
 J2dJaA6TBZoo5oIdloRAcUCGzv5WBgxicQ==
X-Google-Smtp-Source: ABdhPJyz3x3eV4DbRep4XvGR6Ck0kFBiokbPZiwL/r9QE5U1vM6Kgm0MPtMBvWuzI1wXT+zMArVHWQ==
X-Received: by 2002:a05:600c:2e14:b0:39c:58c4:c6ed with SMTP id
 o20-20020a05600c2e1400b0039c58c4c6edmr2308116wmf.156.1654765592275; 
 Thu, 09 Jun 2022 02:06:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 49/55] target/arm: Export sve contiguous ldst support functions
Date: Thu,  9 Jun 2022 10:05:31 +0100
Message-Id: <20220609090537.1971756-50-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Export all of the support functions for performing bulk
fault analysis on a set of elements at contiguous addresses
controlled by a predicate.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220607203306.657998-15-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve_ldst_internal.h | 94 ++++++++++++++++++++++++++++++++++
 target/arm/sve_helper.c        | 87 ++++++-------------------------
 2 files changed, 111 insertions(+), 70 deletions(-)

diff --git a/target/arm/sve_ldst_internal.h b/target/arm/sve_ldst_internal.h
index ef9117e84c1..b5c473fc48b 100644
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
index 0c6dde00aa6..8cd371e3e37 100644
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
2.25.1


