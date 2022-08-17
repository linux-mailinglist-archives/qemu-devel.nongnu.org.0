Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D0559673C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 04:07:59 +0200 (CEST)
Received: from localhost ([::1]:51918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO8TO-0005hW-64
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 22:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1oO8OS-0008OV-LM
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 22:02:52 -0400
Received: from mga09.intel.com ([134.134.136.24]:11447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1oO8OO-0004ZZ-ET
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 22:02:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660701768; x=1692237768;
 h=from:to:cc:subject:date:message-id;
 bh=Sl693IxK0Tv2IMegSNQ5h3hCL9MM2a2gImQ/QH6/NK0=;
 b=m9PJu5Wfp2kyft9g3psBVAiAoknuyuxM8zmEC9n+vJITQYHrRsadOcgI
 tYiUS8MvRS4L//a2GwtRZWljP72Juuffwau805hiteZqomxB3bW1HmTft
 gSdIBGQiyMArxUHYrM1RpiI0P+6ap/qiCw5O12mAcg7kujI1PJ1JxdsLr
 +H7O/ag4TQrtJfH1WdXnAutiDXrj6oKmva0gXZRnmoe44Umn5uQxR0gJW
 wtM0er+JtvWFAyeIJrXdrfppJ83046nIeJkdZJcDDwj5piWwT9sojQIA2
 10n2HNvOV6CgD7ndiwdhB1v3WK+8ZoKjrAD+Jf+82K1LDW8Cq9Q2ruImT Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10441"; a="293173523"
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; d="scan'208";a="293173523"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 19:02:40 -0700
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; d="scan'208";a="675456968"
Received: from chenyi-pc.sh.intel.com ([10.239.159.73])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 19:02:38 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Chenyi Qiang <chenyi.qiang@intel.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Subject: [PATCH v5 0/3] Enable notify VM exit
Date: Wed, 17 Aug 2022 10:08:42 +0800
Message-Id: <20220817020845.21855-1-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=134.134.136.24;
 envelope-from=chenyi.qiang@intel.com; helo=mga09.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Notify VM exit is introduced to mitigate the potential DOS attach from
malicious VM. This series is the userspace part to enable this feature
through a new KVM capability KVM_CAP_X86_NOTIFY_VMEXIT. The detailed
info can be seen in Patch 3.

The corresponding KVM support can be found in linux 6.0-rc1:
(2f4073e08f4c KVM: VMX: Enable Notify VM exit)

---
Change logs:
v4 -> v5
- Remove the assert check to avoid the nop in NDEBUG case. (Yuan)
- v4: https://lore.kernel.org/qemu-devel/20220524140302.23272-1-chenyi.qiang@intel.com/

v3 -> v4
- Add a new KVM cap KVM_CAP_TRIPLE_FAULT_EVENT to guard the extension of triple fault
  event save&restore.
- v3: https://lore.kernel.org/qemu-devel/20220421074028.18196-1-chenyi.qiang@intel.com/

v2 -> v3
- Extend the argument to include both the notify window and some flags
  when enabling KVM_CAP_X86_BUS_LOCK_EXIT CAP.
- Change to use KVM_VCPUEVENTS_VALID_TRIPLE_FAULT in flags field and add
  pending_triple_fault field in struct kvm_vcpu_events.
- v2: https://lore.kernel.org/qemu-devel/20220318082934.25030-1-chenyi.qiang@intel.com/

v1 -> v2
- Add some commit message to explain why we disable Notify VM exit by default.
- Rename KVM_VCPUEVENT_SHUTDOWN to KVM_VCPUEVENT_TRIPLE_FAULT.
- Do the corresponding change to use the KVM_VCPUEVENTS_TRIPLE_FAULT
  to save/restore the triple fault event to avoid lose some synthesized
  triple fault from KVM.
- v1: https://lore.kernel.org/qemu-devel/20220310090205.10645-1-chenyi.qiang@intel.com/

---

Chenyi Qiang (3):
  Update linux headers to 6.0-rc1
  i386: kvm: extend kvm_{get, put}_vcpu_events to support pending triple
    fault
  i386: Add notify VM exit support

 hw/i386/x86.c                                 |  45 +++++
 include/hw/i386/x86.h                         |   5 +
 include/standard-headers/asm-x86/bootparam.h  |   7 +-
 include/standard-headers/drm/drm_fourcc.h     |  73 +++++++-
 include/standard-headers/linux/ethtool.h      |  29 +--
 include/standard-headers/linux/input.h        |  12 +-
 include/standard-headers/linux/pci_regs.h     |  30 ++-
 include/standard-headers/linux/vhost_types.h  |  17 +-
 include/standard-headers/linux/virtio_9p.h    |   2 +-
 .../standard-headers/linux/virtio_config.h    |   7 +-
 include/standard-headers/linux/virtio_ids.h   |  14 +-
 include/standard-headers/linux/virtio_net.h   |  34 +++-
 include/standard-headers/linux/virtio_pci.h   |   2 +
 linux-headers/asm-arm64/kvm.h                 |  27 +++
 linux-headers/asm-generic/unistd.h            |   4 +-
 linux-headers/asm-riscv/kvm.h                 |  22 +++
 linux-headers/asm-riscv/unistd.h              |   3 +-
 linux-headers/asm-s390/kvm.h                  |   1 +
 linux-headers/asm-x86/kvm.h                   |  33 ++--
 linux-headers/asm-x86/mman.h                  |  14 --
 linux-headers/linux/kvm.h                     | 172 +++++++++++++++++-
 linux-headers/linux/userfaultfd.h             |  10 +-
 linux-headers/linux/vduse.h                   |  47 +++++
 linux-headers/linux/vfio.h                    |   4 +-
 linux-headers/linux/vfio_zdev.h               |   7 +
 linux-headers/linux/vhost.h                   |  35 +++-
 target/i386/cpu.c                             |   1 +
 target/i386/cpu.h                             |   1 +
 target/i386/kvm/kvm.c                         |  48 +++++
 29 files changed, 623 insertions(+), 83 deletions(-)

-- 
2.17.1


