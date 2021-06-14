Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE7B3A5EFB
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 11:15:35 +0200 (CEST)
Received: from localhost ([::1]:52096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsigw-0001xM-6S
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 05:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1lsiXS-0000wv-Kt
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 05:05:46 -0400
Received: from foss.arm.com ([217.140.110.172]:50862)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1lsiXP-0005lB-6D
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 05:05:45 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C54F61FB;
 Mon, 14 Jun 2021 02:05:40 -0700 (PDT)
Received: from e112269-lin.arm.com (autoplooker.cambridge.arm.com
 [10.1.194.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 062103F694;
 Mon, 14 Jun 2021 02:05:37 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>
Subject: [PATCH v15 0/7] MTE support for KVM guest
Date: Mon, 14 Jun 2021 10:05:18 +0100
Message-Id: <20210614090525.4338-1-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=steven.price@arm.com; helo=foss.arm.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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

I realise there are still open questions[1] around the performance of
this series (the 'big lock', tag_sync_lock, introduced in the first
patch). But there should be no impact on non-MTE workloads and until we
get real MTE-enabled hardware it's hard to know whether there is a need
for something more sophisticated or not. Peter Collingbourne's patch[3]
to clear the tags at page allocation time should hide more of the impact
for non-VM cases. So the remaining concern is around VM startup which
could be effectively serialised through the lock.

Changes since v14[2]:

 * Dropped "Handle MTE tags zeroing" patch in favour of Peter's similar
   patch[3] (now in arm64 tree).

 * Improved documentation following Catalin's review.

[1]: https://lore.kernel.org/r/874ke7z3ng.wl-maz%40kernel.org
[2]: https://lore.kernel.org/r/20210607110816.25762-1-steven.price@arm.com/
[3]: https://lore.kernel.org/r/20210602235230.3928842-4-pcc@google.com/

Steven Price (7):
  arm64: mte: Handle race when synchronising tags
  arm64: mte: Sync tags for pages where PTE is untagged
  KVM: arm64: Introduce MTE VM feature
  KVM: arm64: Save/restore MTE registers
  KVM: arm64: Expose KVM_ARM_CAP_MTE
  KVM: arm64: ioctl to fetch/store tags in a guest
  KVM: arm64: Document MTE capability and ioctl

 Documentation/virt/kvm/api.rst             | 57 +++++++++++++++
 arch/arm64/include/asm/kvm_arm.h           |  3 +-
 arch/arm64/include/asm/kvm_emulate.h       |  3 +
 arch/arm64/include/asm/kvm_host.h          | 12 ++++
 arch/arm64/include/asm/kvm_mte.h           | 66 +++++++++++++++++
 arch/arm64/include/asm/mte-def.h           |  1 +
 arch/arm64/include/asm/mte.h               |  8 ++-
 arch/arm64/include/asm/pgtable.h           | 22 +++++-
 arch/arm64/include/asm/sysreg.h            |  3 +-
 arch/arm64/include/uapi/asm/kvm.h          | 11 +++
 arch/arm64/kernel/asm-offsets.c            |  2 +
 arch/arm64/kernel/mte.c                    | 54 ++++++++++++--
 arch/arm64/kvm/arm.c                       | 16 +++++
 arch/arm64/kvm/guest.c                     | 82 ++++++++++++++++++++++
 arch/arm64/kvm/hyp/entry.S                 |  7 ++
 arch/arm64/kvm/hyp/exception.c             |  3 +-
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 21 ++++++
 arch/arm64/kvm/mmu.c                       | 42 ++++++++++-
 arch/arm64/kvm/reset.c                     |  3 +-
 arch/arm64/kvm/sys_regs.c                  | 32 +++++++--
 include/uapi/linux/kvm.h                   |  2 +
 21 files changed, 429 insertions(+), 21 deletions(-)
 create mode 100644 arch/arm64/include/asm/kvm_mte.h

-- 
2.20.1


