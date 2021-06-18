Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 734273ACC39
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 15:30:19 +0200 (CEST)
Received: from localhost ([::1]:45248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luEZc-0007In-OW
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 09:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1luEY8-0004yr-8I
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 09:28:44 -0400
Received: from foss.arm.com ([217.140.110.172]:33586)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1luEY5-0001av-6l
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 09:28:43 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D06931424;
 Fri, 18 Jun 2021 06:28:37 -0700 (PDT)
Received: from e112269-lin.arm.com (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19E483F719;
 Fri, 18 Jun 2021 06:28:34 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>
Subject: [PATCH v16 0/7] MTE support for KVM guest
Date: Fri, 18 Jun 2021 14:28:19 +0100
Message-Id: <20210618132826.54670-1-steven.price@arm.com>
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
 Andrew Jones <drjones@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 qemu-devel@nongnu.org, Dave Martin <Dave.Martin@arm.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 Steven Price <steven.price@arm.com>, James Morse <james.morse@arm.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series adds support for using the Arm Memory Tagging Extensions
(MTE) in a KVM guest.

This time with less BKL but hopefully no new races!

Changes since v15[1]:

 - Prevent VM_SHARED mappings with an MTE-enabled VM.

 - Dropped the mte_prepare_page_tags() function, sanitise_mte_tags() now
   does the PG_mte_tagged dance without extra locks.

 - Added a comment to sanitise_mte_tags() explaining why the apparent
   race with the test/set of page->flags is safe.

 - Added a sentence to kvm/api.rst explaining that VM_SHARED is not
   permitted when used with MTE in a guest.

 - Dropped the Reviewed-by tags on patches 3 and 7 due to the changes.

[1] https://lore.kernel.org/r/20210614090525.4338-1-steven.price%40arm.com

Steven Price (7):
  arm64: mte: Handle race when synchronising tags
  arm64: mte: Sync tags for pages where PTE is untagged
  KVM: arm64: Introduce MTE VM feature
  KVM: arm64: Save/restore MTE registers
  KVM: arm64: Expose KVM_ARM_CAP_MTE
  KVM: arm64: ioctl to fetch/store tags in a guest
  KVM: arm64: Document MTE capability and ioctl

 Documentation/virt/kvm/api.rst             | 61 ++++++++++++++++
 arch/arm64/include/asm/kvm_arm.h           |  3 +-
 arch/arm64/include/asm/kvm_emulate.h       |  3 +
 arch/arm64/include/asm/kvm_host.h          | 12 ++++
 arch/arm64/include/asm/kvm_mte.h           | 66 +++++++++++++++++
 arch/arm64/include/asm/mte-def.h           |  1 +
 arch/arm64/include/asm/mte.h               |  4 +-
 arch/arm64/include/asm/pgtable.h           | 22 +++++-
 arch/arm64/include/asm/sysreg.h            |  3 +-
 arch/arm64/include/uapi/asm/kvm.h          | 11 +++
 arch/arm64/kernel/asm-offsets.c            |  2 +
 arch/arm64/kernel/mte.c                    | 37 ++++++++--
 arch/arm64/kvm/arm.c                       | 16 +++++
 arch/arm64/kvm/guest.c                     | 82 ++++++++++++++++++++++
 arch/arm64/kvm/hyp/entry.S                 |  7 ++
 arch/arm64/kvm/hyp/exception.c             |  3 +-
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 21 ++++++
 arch/arm64/kvm/mmu.c                       | 62 +++++++++++++++-
 arch/arm64/kvm/reset.c                     |  3 +-
 arch/arm64/kvm/sys_regs.c                  | 32 +++++++--
 include/uapi/linux/kvm.h                   |  2 +
 21 files changed, 432 insertions(+), 21 deletions(-)
 create mode 100644 arch/arm64/include/asm/kvm_mte.h

-- 
2.20.1


