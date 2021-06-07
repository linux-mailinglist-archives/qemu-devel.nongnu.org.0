Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8593D39DB34
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 13:26:18 +0200 (CEST)
Received: from localhost ([::1]:53732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqDOb-0007v0-Ce
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 07:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1lqD7t-00036e-T5
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:09:01 -0400
Received: from foss.arm.com ([217.140.110.172]:51328)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1lqD7r-0007j4-9j
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:09:01 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05D3311D4;
 Mon,  7 Jun 2021 04:08:58 -0700 (PDT)
Received: from e112269-lin.arm.com (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C30D3F73D;
 Mon,  7 Jun 2021 04:08:55 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>
Subject: [PATCH v14 8/8] KVM: arm64: Document MTE capability and ioctl
Date: Mon,  7 Jun 2021 12:08:16 +0100
Message-Id: <20210607110816.25762-9-steven.price@arm.com>
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

A new capability (KVM_CAP_ARM_MTE) identifies that the kernel supports
granting a guest access to the tags, and provides a mechanism for the
VMM to enable it.

A new ioctl (KVM_ARM_MTE_COPY_TAGS) provides a simple way for a VMM to
access the tags of a guest without having to maintain a PROT_MTE mapping
in userspace. The above capability gates access to the ioctl.

Signed-off-by: Steven Price <steven.price@arm.com>
---
 Documentation/virt/kvm/api.rst | 57 ++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 22d077562149..fc6f0cbc30b3 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -5034,6 +5034,42 @@ see KVM_XEN_VCPU_SET_ATTR above.
 The KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_ADJUST type may not be used
 with the KVM_XEN_VCPU_GET_ATTR ioctl.
 
+4.130 KVM_ARM_MTE_COPY_TAGS
+---------------------------
+
+:Capability: KVM_CAP_ARM_MTE
+:Architectures: arm64
+:Type: vm ioctl
+:Parameters: struct kvm_arm_copy_mte_tags
+:Returns: number of bytes copied, < 0 on error
+
+::
+
+  struct kvm_arm_copy_mte_tags {
+	__u64 guest_ipa;
+	__u64 length;
+	void __user *addr;
+	__u64 flags;
+	__u64 reserved[2];
+  };
+
+Copies Memory Tagging Extension (MTE) tags to/from guest tag memory. The
+``guest_ipa`` and ``length`` fields must be ``PAGE_SIZE`` aligned. The ``addr``
+fieldmust point to a buffer which the tags will be copied to or from.
+
+``flags`` specifies the direction of copy, either ``KVM_ARM_TAGS_TO_GUEST`` or
+``KVM_ARM_TAGS_FROM_GUEST``.
+
+The size of the buffer to store the tags is ``(length / 16)`` bytes
+(granules in MTE are 16 bytes long). Each byte contains a single tag
+value. This matches the format of ``PTRACE_PEEKMTETAGS`` and
+``PTRACE_POKEMTETAGS``.
+
+If an error occurs before any data is copied then a negative error code is
+returned. If some tags have been copied before an error occurs then the number
+of bytes successfully copied is returned. If the call completes successfully
+then ``length`` is returned.
+
 5. The kvm_run structure
 ========================
 
@@ -6362,6 +6398,27 @@ default.
 
 See Documentation/x86/sgx/2.Kernel-internals.rst for more details.
 
+7.26 KVM_CAP_ARM_MTE
+--------------------
+
+:Architectures: arm64
+:Parameters: none
+
+This capability indicates that KVM (and the hardware) supports exposing the
+Memory Tagging Extensions (MTE) to the guest. It must also be enabled by the
+VMM before creating any VCPUs to allow the guest access. Note that MTE is only
+available to a guest running in AArch64 mode and enabling this capability will
+cause attempts to create AArch32 VCPUs to fail.
+
+When enabled the guest is able to access tags associated with any memory given
+to the guest. KVM will ensure that the pages are flagged ``PG_mte_tagged`` so
+that the tags are maintained during swap or hibernation of the host; however
+the VMM needs to manually save/restore the tags as appropriate if the VM is
+migrated.
+
+When enabled the VMM may make use of the ``KVM_ARM_MTE_COPY_TAGS`` ioctl to
+perform a bulk copy of tags to/from the guest.
+
 8. Other capabilities.
 ======================
 
-- 
2.20.1


