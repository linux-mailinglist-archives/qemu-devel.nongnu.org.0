Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 335D42C68A7
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:24:05 +0100 (CET)
Received: from localhost ([::1]:59088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifbQ-0003Tj-6D
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:24:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1kifYy-0001jl-5H
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 10:21:33 -0500
Received: from foss.arm.com ([217.140.110.172]:37118)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1kifYu-0006x8-20
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 10:21:31 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7499A1516;
 Fri, 27 Nov 2020 07:21:25 -0800 (PST)
Received: from e112269-lin.arm.com (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9B463F70D;
 Fri, 27 Nov 2020 07:21:22 -0800 (PST)
From: Steven Price <steven.price@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>
Subject: [PATCH v6 0/2] MTE support for KVM guest
Date: Fri, 27 Nov 2020 15:21:11 +0000
Message-Id: <20201127152113.13099-1-steven.price@arm.com>
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

It's been a week, and I think the comments on v5 made it clear that
enforcing PROT_MTE requirements on the VMM was probably the wrong
approach. So since I've got swap working correctly without that I
thought I'd post a v6 which hopefully addresses all the comments so far.

This series adds support for Arm's Memory Tagging Extension (MTE) to
KVM, allowing KVM guests to make use of it. This builds on the existing
user space support already in v5.10-rc4, see [1] for an overview.

[1] https://lwn.net/Articles/834289/

Changes since v5[2]:

 * Revert back to not requiring the VMM to map all guest memory
   PROT_MTE. Instead KVM will set the PG_mte_tagged flag automatically
   if not present.

 * Fixed swap behaviour vs v4 by always checking for saved MTE tags for
   user entries in set_pte_at().

[2] https://lore.kernel.org/r/20201119153901.53705-1-steven.price%40arm.com

Steven Price (2):
  arm64: kvm: Save/restore MTE registers
  arm64: kvm: Introduce MTE VCPU feature

 arch/arm64/include/asm/kvm_emulate.h       |  3 +++
 arch/arm64/include/asm/kvm_host.h          |  8 ++++++++
 arch/arm64/include/asm/pgtable.h           |  2 +-
 arch/arm64/include/asm/sysreg.h            |  3 ++-
 arch/arm64/kernel/mte.c                    | 18 +++++++++++++-----
 arch/arm64/kvm/arm.c                       |  9 +++++++++
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 14 ++++++++++++++
 arch/arm64/kvm/mmu.c                       | 16 ++++++++++++++++
 arch/arm64/kvm/sys_regs.c                  | 20 +++++++++++++++-----
 include/uapi/linux/kvm.h                   |  1 +
 10 files changed, 82 insertions(+), 12 deletions(-)

-- 
2.20.1


