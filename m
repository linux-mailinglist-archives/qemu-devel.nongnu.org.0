Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2A6362469
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 17:48:29 +0200 (CEST)
Received: from localhost ([::1]:47760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXQho-0001E1-Kf
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 11:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1lXQd4-0005m4-IK
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:43:36 -0400
Received: from foss.arm.com ([217.140.110.172]:37196)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1lXQcw-0005p8-4f
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:43:34 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5113612FC;
 Fri, 16 Apr 2021 08:43:25 -0700 (PDT)
Received: from e112269-lin.arm.com (autoplooker.cambridge.arm.com
 [10.1.194.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 854F53F99C;
 Fri, 16 Apr 2021 08:43:22 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>
Subject: [PATCH v11 1/6] arm64: mte: Sync tags for pages where PTE is untagged
Date: Fri, 16 Apr 2021 16:43:04 +0100
Message-Id: <20210416154309.22129-2-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210416154309.22129-1-steven.price@arm.com>
References: <20210416154309.22129-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=steven.price@arm.com; helo=foss.arm.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Haibo Xu <Haibo.Xu@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, qemu-devel@nongnu.org,
 Dave Martin <Dave.Martin@arm.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 Steven Price <steven.price@arm.com>, James Morse <james.morse@arm.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A KVM guest could store tags in a page even if the VMM hasn't mapped
the page with PROT_MTE. So when restoring pages from swap we will
need to check to see if there are any saved tags even if !pte_tagged().

However don't check pages which are !pte_valid_user() as these will
not have been swapped out.

Signed-off-by: Steven Price <steven.price@arm.com>
---
 arch/arm64/include/asm/pgtable.h |  2 +-
 arch/arm64/kernel/mte.c          | 16 ++++++++++++----
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index e17b96d0e4b5..cf4b52a33b3c 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -312,7 +312,7 @@ static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
 		__sync_icache_dcache(pte);
 
 	if (system_supports_mte() &&
-	    pte_present(pte) && pte_tagged(pte) && !pte_special(pte))
+	    pte_present(pte) && (pte_val(pte) & PTE_USER) && !pte_special(pte))
 		mte_sync_tags(ptep, pte);
 
 	__check_racy_pte_update(mm, ptep, pte);
diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index b3c70a612c7a..e016ab57ea36 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -26,17 +26,23 @@ u64 gcr_kernel_excl __ro_after_init;
 
 static bool report_fault_once = true;
 
-static void mte_sync_page_tags(struct page *page, pte_t *ptep, bool check_swap)
+static void mte_sync_page_tags(struct page *page, pte_t *ptep, bool check_swap,
+			       bool pte_is_tagged)
 {
 	pte_t old_pte = READ_ONCE(*ptep);
 
 	if (check_swap && is_swap_pte(old_pte)) {
 		swp_entry_t entry = pte_to_swp_entry(old_pte);
 
-		if (!non_swap_entry(entry) && mte_restore_tags(entry, page))
+		if (!non_swap_entry(entry) && mte_restore_tags(entry, page)) {
+			set_bit(PG_mte_tagged, &page->flags);
 			return;
+		}
 	}
 
+	if (!pte_is_tagged || test_and_set_bit(PG_mte_tagged, &page->flags))
+		return;
+
 	page_kasan_tag_reset(page);
 	/*
 	 * We need smp_wmb() in between setting the flags and clearing the
@@ -54,11 +60,13 @@ void mte_sync_tags(pte_t *ptep, pte_t pte)
 	struct page *page = pte_page(pte);
 	long i, nr_pages = compound_nr(page);
 	bool check_swap = nr_pages == 1;
+	bool pte_is_tagged = pte_tagged(pte);
 
 	/* if PG_mte_tagged is set, tags have already been initialised */
 	for (i = 0; i < nr_pages; i++, page++) {
-		if (!test_and_set_bit(PG_mte_tagged, &page->flags))
-			mte_sync_page_tags(page, ptep, check_swap);
+		if (!test_bit(PG_mte_tagged, &page->flags))
+			mte_sync_page_tags(page, ptep, check_swap,
+					   pte_is_tagged);
 	}
 }
 
-- 
2.20.1


