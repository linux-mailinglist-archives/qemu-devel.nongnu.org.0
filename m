Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4A42F7F85
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:30:14 +0100 (CET)
Received: from localhost ([::1]:44904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0R3F-0003ct-Hk
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:30:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1l0R1X-0001yS-Nq
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:28:31 -0500
Received: from foss.arm.com ([217.140.110.172]:35474)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1l0R1U-0008K4-2B
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:28:26 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3CA9D6E;
 Fri, 15 Jan 2021 07:28:20 -0800 (PST)
Received: from e112269-lin.arm.com (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD3513F70D;
 Fri, 15 Jan 2021 07:28:17 -0800 (PST)
From: Steven Price <steven.price@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>
Subject: [PATCH v7 0/3] MTE support for KVM guest
Date: Fri, 15 Jan 2021 15:28:08 +0000
Message-Id: <20210115152811.8398-1-steven.price@arm.com>
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

After chasing down a bug[1] with MTE assisted KASAN and KVM, I've now
been able to rebase on v5.11-rc1 and test the combination of
KVM-with-MTE and KASAN.

For anyone new to this series, or simply pretending 2020 didn't happen,
this series adds support for Arm's Memory Tagging Extension (MTE) to KVM,
allowing KVM guests to make use of it. The first patch adds definitions
for the new registers and saves/restores them as necessary. The second
adds a new VM feature which allows the guest access to MTE.

The third patch is new and RFC for now. It adds a new ioctl allowing a
VMM to easily read/write the tags in the guest's memory even if the
memory isn't mapped with PROT_MTE in userspace. I'd particularly welcome
feedback on this new ABI.

Changes since v6[2]:
 * Moved the save/restore of RGSR_EL1, GCR_EL1 and TFSRE0_EL into asm
 * Correctly set TCO when injecting an exception to an MTE-enabled guest
 * Rebased on v5.11-rc1
 * RFC patch for new MTE tag copy ioctl

[1] https://lore.kernel.org/r/20210108161254.53674-1-steven.price@arm.com
[2] https://lore.kernel.org/r/20201127152113.13099-1-steven.price@arm.com

Steven Price (3):
  arm64: kvm: Save/restore MTE registers
  arm64: kvm: Introduce MTE VCPU feature
  KVM: arm64: ioctl to fetch/store tags in a guest

 arch/arm64/include/asm/kvm_emulate.h       |  3 +
 arch/arm64/include/asm/kvm_host.h          |  7 ++
 arch/arm64/include/asm/kvm_mte.h           | 74 ++++++++++++++++++++++
 arch/arm64/include/asm/pgtable.h           |  2 +-
 arch/arm64/include/asm/sysreg.h            |  3 +-
 arch/arm64/include/uapi/asm/kvm.h          | 13 ++++
 arch/arm64/kernel/asm-offsets.c            |  3 +
 arch/arm64/kernel/mte.c                    | 36 +++++++----
 arch/arm64/kvm/arm.c                       | 68 ++++++++++++++++++++
 arch/arm64/kvm/hyp/entry.S                 |  7 ++
 arch/arm64/kvm/hyp/exception.c             |  3 +-
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h |  4 ++
 arch/arm64/kvm/mmu.c                       | 16 +++++
 arch/arm64/kvm/sys_regs.c                  | 20 ++++--
 include/uapi/linux/kvm.h                   |  2 +
 15 files changed, 239 insertions(+), 22 deletions(-)
 create mode 100644 arch/arm64/include/asm/kvm_mte.h

-- 
2.20.1


