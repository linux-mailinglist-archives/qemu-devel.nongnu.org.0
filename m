Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F38276E9F73
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 00:54:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppd9T-00087b-T5; Thu, 20 Apr 2023 18:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>) id 1ppd9Q-00087N-74
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 18:53:18 -0400
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>) id 1ppd9K-0002FZ-5J
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 18:53:15 -0400
Received: from localhost.localdomain
 (dynamic-077-004-048-045.77.4.pool.telefonica.de [77.4.48.45])
 by csgraf.de (Postfix) with ESMTPSA id 3549B6080F7D;
 Fri, 21 Apr 2023 00:52:59 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Cameron Esfahani <dirty@apple.com>,
 Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] hvf: Enable 1G page support
Date: Fri, 21 Apr 2023 00:52:58 +0200
Message-Id: <20230420225258.58009-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hvf on x86 only supported 2MiB large pages, but never bothered to strip
out the 1GiB page size capability from -cpu host. With QEMU 8.0.0 this
became a problem because OVMF started to use 1GiB pages by default.

Let's just unconditionally add 1GiB page walk support to the walker.

With this fix applied, I can successfully run OVMF again.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1603
Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reported-by: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
Reported-by: Philippe Mathieu-Daudé <philmd@linaro.org>

---

On my test VM, Linux dies later on with issues in interrupt delivery. But
those are unrelated to this patch; I confirmed that I get the same behavior
with 1GiB page support disabled.
---
 target/i386/hvf/x86_mmu.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/target/i386/hvf/x86_mmu.c b/target/i386/hvf/x86_mmu.c
index 96d117567e..1d860651c6 100644
--- a/target/i386/hvf/x86_mmu.c
+++ b/target/i386/hvf/x86_mmu.c
@@ -38,6 +38,7 @@
 #define LEGACY_PTE_PAGE_MASK        (0xffffffffllu << 12)
 #define PAE_PTE_PAGE_MASK           ((-1llu << 12) & ((1llu << 52) - 1))
 #define PAE_PTE_LARGE_PAGE_MASK     ((-1llu << (21)) & ((1llu << 52) - 1))
+#define PAE_PTE_SUPER_PAGE_MASK     ((-1llu << (30)) & ((1llu << 52) - 1))
 
 struct gpt_translation {
     target_ulong  gva;
@@ -96,7 +97,7 @@ static bool get_pt_entry(struct CPUState *cpu, struct gpt_translation *pt,
 
 /* test page table entry */
 static bool test_pt_entry(struct CPUState *cpu, struct gpt_translation *pt,
-                          int level, bool *is_large, bool pae)
+                          int level, int *largeness, bool pae)
 {
     uint64_t pte = pt->pte[level];
 
@@ -118,9 +119,9 @@ static bool test_pt_entry(struct CPUState *cpu, struct gpt_translation *pt,
         goto exit;
     }
 
-    if (1 == level && pte_large_page(pte)) {
+    if (level && pte_large_page(pte)) {
         pt->err_code |= MMU_PAGE_PT;
-        *is_large = true;
+        *largeness = level;
     }
     if (!level) {
         pt->err_code |= MMU_PAGE_PT;
@@ -152,9 +153,18 @@ static inline uint64_t pse_pte_to_page(uint64_t pte)
     return ((pte & 0x1fe000) << 19) | (pte & 0xffc00000);
 }
 
-static inline uint64_t large_page_gpa(struct gpt_translation *pt, bool pae)
+static inline uint64_t large_page_gpa(struct gpt_translation *pt, bool pae,
+                                      int largeness)
 {
-    VM_PANIC_ON(!pte_large_page(pt->pte[1]))
+    VM_PANIC_ON(!pte_large_page(pt->pte[largeness]))
+
+    /* 1Gib large page  */
+    if (pae && largeness == 2) {
+        return (pt->pte[2] & PAE_PTE_SUPER_PAGE_MASK) | (pt->gva & 0x3fffffff);
+    }
+
+    VM_PANIC_ON(largeness != 1)
+
     /* 2Mb large page  */
     if (pae) {
         return (pt->pte[1] & PAE_PTE_LARGE_PAGE_MASK) | (pt->gva & 0x1fffff);
@@ -170,7 +180,7 @@ static bool walk_gpt(struct CPUState *cpu, target_ulong addr, int err_code,
                      struct gpt_translation *pt, bool pae)
 {
     int top_level, level;
-    bool is_large = false;
+    int largeness = 0;
     target_ulong cr3 = rvmcs(cpu->hvf->fd, VMCS_GUEST_CR3);
     uint64_t page_mask = pae ? PAE_PTE_PAGE_MASK : LEGACY_PTE_PAGE_MASK;
     
@@ -186,19 +196,19 @@ static bool walk_gpt(struct CPUState *cpu, target_ulong addr, int err_code,
     for (level = top_level; level > 0; level--) {
         get_pt_entry(cpu, pt, level, pae);
 
-        if (!test_pt_entry(cpu, pt, level - 1, &is_large, pae)) {
+        if (!test_pt_entry(cpu, pt, level - 1, &largeness, pae)) {
             return false;
         }
 
-        if (is_large) {
+        if (largeness) {
             break;
         }
     }
 
-    if (!is_large) {
+    if (!largeness) {
         pt->gpa = (pt->pte[0] & page_mask) | (pt->gva & 0xfff);
     } else {
-        pt->gpa = large_page_gpa(pt, pae);
+        pt->gpa = large_page_gpa(pt, pae, largeness);
     }
 
     return true;
-- 
2.39.2 (Apple Git-143)


