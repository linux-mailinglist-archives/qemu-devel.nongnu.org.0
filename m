Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93027382C43
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 14:35:34 +0200 (CEST)
Received: from localhost ([::1]:40398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1licT7-0000f9-Lu
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 08:35:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1licQs-0006WB-M5
 for qemu-devel@nongnu.org; Mon, 17 May 2021 08:33:14 -0400
Received: from foss.arm.com ([217.140.110.172]:42694)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1licQp-0007kJ-Q0
 for qemu-devel@nongnu.org; Mon, 17 May 2021 08:33:14 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF98F113E;
 Mon, 17 May 2021 05:33:08 -0700 (PDT)
Received: from e112269-lin.arm.com (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0111E3F73B;
 Mon, 17 May 2021 05:33:05 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>
Subject: [PATCH v12 0/8] MTE support for KVM guest
Date: Mon, 17 May 2021 13:32:31 +0100
Message-Id: <20210517123239.8025-1-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
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

This series adds support for using the Arm Memory Tagging Extensions
(MTE) in a KVM guest.

Changes since v11[1]:

 * Series is prefixed with a bug fix for a potential race synchronising
   tags. This is basically race as was recently[2] fixed for
   PG_dcache_clean where the update of the page flag cannot be done
   atomically with the work that flag represents.

   For the PG_dcache_clean case the problem is easier because extra
   cache maintenance isn't a problem, but here restoring the tags twice
   could cause data loss.

   The current solution is a global spinlock for mte_sync_page_tags().
   If we hit scalability problems that other solutions such as
   potentially using another page flag as a lock will need to be
   investigated.

 * The second patch is from Catalin to mitigate the performance impact
   of the first - by handling the page zeroing case explicitly we can
   avoid entering mte_sync_page_tags() at all in most cases. Peter
   Collingbourne has a patch which similarly improves this case using
   the DC GZVA instruction. So this patch may be dropped in favour of
   Peter's, however Catalin's is likely easier to backport.

 * Use pte_access_permitted() in set_pte_at() to identify pages which
   may be accessed by the user rather than open-coding a check for
   PTE_USER. Also add a comment documenting what's going on.
   There's also some short-cuts added in mte_sync_tags() compared to the
   previous post, to again mitigate the performance impact of the first
   patch.

 * Move the code to sanitise tags out of user_mem_abort() into its own
   function. Also call this new function from kvm_set_spte_gfn() as that
   path was missing the sanitising.

   Originally I was going to move the code all the way down to
   kvm_pgtable_stage2_map(). Sadly as that also part of the EL2
   hypervisor this breaks nVHE as the code needs to perform actions in
   the host.

 * Drop the union in struct kvm_vcpu_events - it served no purpose and
   was confusing.

 * Update CAP number (again) and other minor conflict resolutions.

[1] https://lore.kernel.org/r/20210416154309.22129-1-steven.price@arm.com/
[2] https://lore.kernel.org/r/20210514095001.13236-1-catalin.marinas@arm.com/
[3] https://lore.kernel.org/r/de812a02fd94a0dba07d43606bd893c564aa4528.1620849613.git.pcc@google.com/

Catalin Marinas (1):
  arm64: Handle MTE tags zeroing in __alloc_zeroed_user_highpage()

Steven Price (7):
  arm64: mte: Handle race when synchronising tags
  arm64: mte: Sync tags for pages where PTE is untagged
  arm64: kvm: Introduce MTE VM feature
  arm64: kvm: Save/restore MTE registers
  arm64: kvm: Expose KVM_ARM_CAP_MTE
  KVM: arm64: ioctl to fetch/store tags in a guest
  KVM: arm64: Document MTE capability and ioctl

 Documentation/virt/kvm/api.rst             | 53 +++++++++++++++
 arch/arm64/include/asm/kvm_emulate.h       |  3 +
 arch/arm64/include/asm/kvm_host.h          |  9 +++
 arch/arm64/include/asm/kvm_mte.h           | 66 ++++++++++++++++++
 arch/arm64/include/asm/page.h              |  6 +-
 arch/arm64/include/asm/pgtable.h           |  9 ++-
 arch/arm64/include/asm/sysreg.h            |  3 +-
 arch/arm64/include/uapi/asm/kvm.h          | 11 +++
 arch/arm64/kernel/asm-offsets.c            |  3 +
 arch/arm64/kernel/mte.c                    | 37 ++++++++--
 arch/arm64/kvm/arm.c                       | 78 ++++++++++++++++++++++
 arch/arm64/kvm/hyp/entry.S                 |  7 ++
 arch/arm64/kvm/hyp/exception.c             |  3 +-
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 21 ++++++
 arch/arm64/kvm/mmu.c                       | 37 +++++++++-
 arch/arm64/kvm/sys_regs.c                  | 28 ++++++--
 arch/arm64/mm/fault.c                      | 21 ++++++
 include/uapi/linux/kvm.h                   |  2 +
 18 files changed, 381 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm64/include/asm/kvm_mte.h

-- 
2.20.1


