Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD50439DB6B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 13:33:58 +0200 (CEST)
Received: from localhost ([::1]:50254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqDW1-0007u7-S1
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 07:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1lqD7a-0002EJ-4A
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:08:43 -0400
Received: from foss.arm.com ([217.140.110.172]:51174)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1lqD7U-0007XO-96
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:08:41 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75CA511D4;
 Mon,  7 Jun 2021 04:08:35 -0700 (PDT)
Received: from e112269-lin.arm.com (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B45A3F73D;
 Mon,  7 Jun 2021 04:08:32 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>
Subject: [PATCH v14 1/8] arm64: mte: Handle race when synchronising tags
Date: Mon,  7 Jun 2021 12:08:09 +0100
Message-Id: <20210607110816.25762-2-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607110816.25762-1-steven.price@arm.com>
References: <20210607110816.25762-1-steven.price@arm.com>
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

mte_sync_tags() used test_and_set_bit() to set the PG_mte_tagged flag
before restoring/zeroing the MTE tags. However if another thread were to
race and attempt to sync the tags on the same page before the first
thread had completed restoring/zeroing then it would see the flag is
already set and continue without waiting. This would potentially expose
the previous contents of the tags to user space, and cause any updates
that user space makes before the restoring/zeroing has completed to
potentially be lost.

Since this code is run from atomic contexts we can't just lock the page
during the process. Instead implement a new (global) spinlock to protect
the mte_sync_page_tags() function.

Fixes: 34bfeea4a9e9 ("arm64: mte: Clear the tags when a page is mapped in user-space with PROT_MTE")
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>
---
 arch/arm64/kernel/mte.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index 125a10e413e9..a3583a7fd400 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -25,6 +25,7 @@
 u64 gcr_kernel_excl __ro_after_init;
 
 static bool report_fault_once = true;
+static DEFINE_SPINLOCK(tag_sync_lock);
 
 #ifdef CONFIG_KASAN_HW_TAGS
 /* Whether the MTE asynchronous mode is enabled. */
@@ -34,13 +35,22 @@ EXPORT_SYMBOL_GPL(mte_async_mode);
 
 static void mte_sync_page_tags(struct page *page, pte_t *ptep, bool check_swap)
 {
+	unsigned long flags;
 	pte_t old_pte = READ_ONCE(*ptep);
 
+	spin_lock_irqsave(&tag_sync_lock, flags);
+
+	/* Recheck with the lock held */
+	if (test_bit(PG_mte_tagged, &page->flags))
+		goto out;
+
 	if (check_swap && is_swap_pte(old_pte)) {
 		swp_entry_t entry = pte_to_swp_entry(old_pte);
 
-		if (!non_swap_entry(entry) && mte_restore_tags(entry, page))
-			return;
+		if (!non_swap_entry(entry) && mte_restore_tags(entry, page)) {
+			set_bit(PG_mte_tagged, &page->flags);
+			goto out;
+		}
 	}
 
 	page_kasan_tag_reset(page);
@@ -53,6 +63,10 @@ static void mte_sync_page_tags(struct page *page, pte_t *ptep, bool check_swap)
 	 */
 	smp_wmb();
 	mte_clear_page_tags(page_address(page));
+	set_bit(PG_mte_tagged, &page->flags);
+
+out:
+	spin_unlock_irqrestore(&tag_sync_lock, flags);
 }
 
 void mte_sync_tags(pte_t *ptep, pte_t pte)
@@ -63,7 +77,7 @@ void mte_sync_tags(pte_t *ptep, pte_t pte)
 
 	/* if PG_mte_tagged is set, tags have already been initialised */
 	for (i = 0; i < nr_pages; i++, page++) {
-		if (!test_and_set_bit(PG_mte_tagged, &page->flags))
+		if (!test_bit(PG_mte_tagged, &page->flags))
 			mte_sync_page_tags(page, ptep, check_swap);
 	}
 }
-- 
2.20.1


