Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 594153280B5
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 15:25:10 +0100 (CET)
Received: from localhost ([::1]:48238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGjTx-0003C6-Cr
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 09:25:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1lGjSV-0002Kk-PJ
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 09:23:39 -0500
Received: from foss.arm.com ([217.140.110.172]:51594)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1lGjSR-0004mk-VG
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 09:23:39 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 440931042;
 Mon,  1 Mar 2021 06:23:33 -0800 (PST)
Received: from e112269-lin.arm.com (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C1183F70D;
 Mon,  1 Mar 2021 06:23:30 -0800 (PST)
From: Steven Price <steven.price@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>
Subject: [PATCH v9 0/6] MTE support for KVM guest
Date: Mon,  1 Mar 2021 14:23:09 +0000
Message-Id: <20210301142315.30920-1-steven.price@arm.com>
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

This version is rebased on v5.12-rc1 and added a documentation patch,
but is otherwise unchanged from the v8[1] posting.

Changes since v8[1]:
 * Rebased on v5.12-rc1 (note new CAP number)
 * New documentation patch

[1] https://lore.kernel.org/r/20210205135803.48321-1-steven.price@arm.com/

Steven Price (6):
  arm64: mte: Sync tags for pages where PTE is untagged
  arm64: kvm: Introduce MTE VM feature
  arm64: kvm: Save/restore MTE registers
  arm64: kvm: Expose KVM_ARM_CAP_MTE
  KVM: arm64: ioctl to fetch/store tags in a guest
  KVM: arm64: Document MTE capability and ioctl

 Documentation/virt/kvm/api.rst             | 37 ++++++++++++
 arch/arm64/include/asm/kvm_emulate.h       |  3 +
 arch/arm64/include/asm/kvm_host.h          |  9 +++
 arch/arm64/include/asm/kvm_mte.h           | 66 ++++++++++++++++++++++
 arch/arm64/include/asm/pgtable.h           |  2 +-
 arch/arm64/include/asm/sysreg.h            |  3 +-
 arch/arm64/include/uapi/asm/kvm.h          | 13 +++++
 arch/arm64/kernel/asm-offsets.c            |  3 +
 arch/arm64/kernel/mte.c                    | 16 ++++--
 arch/arm64/kvm/arm.c                       | 66 ++++++++++++++++++++++
 arch/arm64/kvm/hyp/entry.S                 |  7 +++
 arch/arm64/kvm/hyp/exception.c             |  3 +-
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 21 +++++++
 arch/arm64/kvm/mmu.c                       | 16 ++++++
 arch/arm64/kvm/sys_regs.c                  | 28 +++++++--
 include/uapi/linux/kvm.h                   |  2 +
 16 files changed, 283 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm64/include/asm/kvm_mte.h

-- 
2.20.1


