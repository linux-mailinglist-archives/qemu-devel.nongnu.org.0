Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF6D39DB59
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 13:30:24 +0200 (CEST)
Received: from localhost ([::1]:40136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqDSZ-0000tj-Py
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 07:30:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1lqD7c-0002G1-Fn
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:08:44 -0400
Received: from foss.arm.com ([217.140.110.172]:51194)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1lqD7X-0007ZP-Eo
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:08:44 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 942B6143D;
 Mon,  7 Jun 2021 04:08:38 -0700 (PDT)
Received: from e112269-lin.arm.com (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2F5E3F73D;
 Mon,  7 Jun 2021 04:08:35 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>
Subject: [PATCH v14 2/8] arm64: Handle MTE tags zeroing in
 __alloc_zeroed_user_highpage()
Date: Mon,  7 Jun 2021 12:08:10 +0100
Message-Id: <20210607110816.25762-3-steven.price@arm.com>
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

From: Catalin Marinas <catalin.marinas@arm.com>

Currently, on an anonymous page fault, the kernel allocates a zeroed
page and maps it in user space. If the mapping is tagged (PROT_MTE),
set_pte_at() additionally clears the tags under a spinlock to avoid a
race on the page->flags. In order to optimise the lock, clear the page
tags on allocation in __alloc_zeroed_user_highpage() if the vma flags
have VM_MTE set.

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>
---
 arch/arm64/include/asm/page.h |  6 ++++--
 arch/arm64/mm/fault.c         | 21 +++++++++++++++++++++
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/page.h b/arch/arm64/include/asm/page.h
index 012cffc574e8..97853570d0f1 100644
--- a/arch/arm64/include/asm/page.h
+++ b/arch/arm64/include/asm/page.h
@@ -13,6 +13,7 @@
 #ifndef __ASSEMBLY__
 
 #include <linux/personality.h> /* for READ_IMPLIES_EXEC */
+#include <linux/types.h>
 #include <asm/pgtable-types.h>
 
 struct page;
@@ -28,8 +29,9 @@ void copy_user_highpage(struct page *to, struct page *from,
 void copy_highpage(struct page *to, struct page *from);
 #define __HAVE_ARCH_COPY_HIGHPAGE
 
-#define __alloc_zeroed_user_highpage(movableflags, vma, vaddr) \
-	alloc_page_vma(GFP_HIGHUSER | __GFP_ZERO | movableflags, vma, vaddr)
+struct page *__alloc_zeroed_user_highpage(gfp_t movableflags,
+					  struct vm_area_struct *vma,
+					  unsigned long vaddr);
 #define __HAVE_ARCH_ALLOC_ZEROED_USER_HIGHPAGE
 
 #define clear_user_page(page, vaddr, pg)	clear_page(page)
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 871c82ab0a30..5a03428e97f3 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -921,3 +921,24 @@ void do_debug_exception(unsigned long addr_if_watchpoint, unsigned int esr,
 	debug_exception_exit(regs);
 }
 NOKPROBE_SYMBOL(do_debug_exception);
+
+/*
+ * Used during anonymous page fault handling.
+ */
+struct page *__alloc_zeroed_user_highpage(gfp_t movableflags,
+					  struct vm_area_struct *vma,
+					  unsigned long vaddr)
+{
+	struct page *page;
+	bool tagged = system_supports_mte() && (vma->vm_flags & VM_MTE);
+
+	page = alloc_page_vma(GFP_HIGHUSER | __GFP_ZERO | movableflags, vma,
+			      vaddr);
+	if (tagged && page) {
+		mte_clear_page_tags(page_address(page));
+		page_kasan_tag_reset(page);
+		set_bit(PG_mte_tagged, &page->flags);
+	}
+
+	return page;
+}
-- 
2.20.1


