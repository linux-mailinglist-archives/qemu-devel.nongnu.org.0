Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D90BD4C64BA
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 09:18:12 +0100 (CET)
Received: from localhost ([::1]:47616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nObER-0004BL-Uh
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 03:18:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nOb25-0008IL-19
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 03:05:30 -0500
Received: from mga14.intel.com ([192.55.52.115]:50047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nOb21-0005Ys-MD
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 03:05:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646035521; x=1677571521;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kp6WvaEMGgeUpBp77p3+St1EhX1h2hjvMm63UoFW3/g=;
 b=mpluMz0stx9ITqZNJXXj4razSf4zArZ+Lted17t8kNkTxt8FYIeIVsIC
 9ih5UhhaOF/cVlhIolmVb5wWKR70/J14vohdf08Jv2RrvdNcFvNRYycxn
 5p85SFtbNuweiBndTeKKpaERP14ml43/bZIrcEUEoDxptnVQjvEC4D782
 KShJnfDfmEfb4hOJ6PBPheE7Dx413cojUSqfudlETGNPg1p11wArcOBQw
 ljp09+mAxkSVkmsukPL5WE2Wo95zlAa/66SfDqZNBC85Djisp8mHgx4na
 BITl4XHF6ivqzt9KwOdc78kyagQ4aLg6grFMhQ9z5MeCNY+xPY/in8n/K g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="253021627"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="253021627"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 00:05:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="778014571"
Received: from 984fee00bf64.jf.intel.com ([10.165.54.77])
 by fmsmga006.fm.intel.com with ESMTP; 28 Feb 2022 00:05:15 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/8] AMX support in Qemu
Date: Mon, 28 Feb 2022 00:05:07 -0800
Message-Id: <20220228080515.42357-1-yang.zhong@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=yang.zhong@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: yang.zhong@intel.com, kevin.tian@intel.com, seanjc@google.com,
 jing2.liu@linux.intel.com, wei.w.wang@intel.com, guang.zeng@intel.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Intel introduces Advanced Matrix Extensions (AMX) [1] feature that
consists of configurable two-dimensional "TILE" registers and new
accelerator instructions that operate on them. TMUL (Tile matrix
MULtiply) is the first accelerator instruction set to use the new
registers.

Since AMX KVM patches have been merged into Linux release, this series
is based on latest Linux release(5.17-rc4).

According to the KVM design, the userspace VMM (e.g. Qemu) is expected
to request guest permission for the dynamically-enabled XSAVE features
only once when the first vCPU is created, and KVM checks guest permission
in KVM_SET_CPUID2.

Intel AMX is XSAVE supported and XSAVE enabled. Those extended features
has large state while current kvm_xsave only allows 4KB. The AMX KVM has
extended struct kvm_xsave to meet this requirenment and added one extra
KVM_GET_XSAVE2 ioctl to handle extended features. From our test, the AMX
live migration work well.

Notice: This version still includes some definitions in the linux-headers,
once Qemu sync those linux-headers, please directly remove patch 8. So
ignore patch 8 changes.

[1] Intel Architecture Instruction Set Extension Programming Reference
    https://software.intel.com/content/dam/develop/external/us/en/documents/\
    architecture-instruction-set-extensions-programming-reference.pdf

Thanks,
Yang
----

Change history
--------------
v2->v3:
   - Patch 4, misc cleanup(David).
   - Patch 3, updated the kvm_request_xsave_components()(Paolo).
   - Patch 8, rebased the Linux-header on latest Qemu.

v1->v2:
   - Patch 1 moved "esa->ecx" into the "if{}"(Paolo).
   - Patch 3, the requiremnets from Paoalo,
     - Moved "esa->ecx" into the "if{}".
     - Used the "mask" as parameter to replace xtiledata bits in
       kvm_request_xsave_components()
     - Used the new defined KVM_X86_XCOMP_GUEST_SUPP from KVM to get
       supported_xcr0 from kvm_arch_get_supported_cpuid().
     - Updated the kvm_request_xsave_components() for future usage.
   - Patch 5 added "case 0x1e:" in kvm_arch_init_vcpu()(Paolo).
   - Patch 6 replaced "if (e->size && e->offset)" with
     "if (e->size && e->offset && buflen >= e->size + e->offset)"
     for xsave and xrstor(Paolo).
   - Patch 8, which is new added patch and is only for linux-headers.
     This patch can be directly dropped once Qemu sync linux-headers.

rfc v1->v1:
   - Patch 1 changed commit message(Kevin and Paolo).
   - Patch 2 changed commit message(Kevin and Paolo).
   - Patch 3, below requirements from Paolo,
     - Called ARCH_REQ_XCOMP_GUEST_PERM from x86_cpu_enable_xsave_components.
       Used kvm_request_xsave_components() to replace x86_xsave_req_perm().
       Replaced syscall(ARCH_GET_XCOMP_GUEST_PERM) with kvm_arch_get_supported_cpuid()
       in kvm_request_xsave_components().
     - Changed kvm_cpu_xsave_init() to use host_cpuid() instead of
       kvm_arch_get_supported_cpuid().
     - Added the "function == 0xd" handle in kvm_arch_get_supported_cpuid().
   - Patch 4, used "uint32_t ecx" to replace "uint32_t need_align, support_xfd".
   - Patch 6, below changes,
     - Changed the commit message(Kevin) and Used the new function
     - kvm_init_xsave() to replace some pieces of code(Wei).
     - Moved KVM_CAP_XSAVE2 extension check to kvm_arch_init_vcpu() to
       make the request permission before KVM_CAP_XSAVE2 extension check(Paolo).
   - Removed RFC prefix.


Jing Liu (5):
  x86: Fix the 64-byte boundary enumeration for extended state
  x86: Add AMX XTILECFG and XTILEDATA components
  x86: Add XFD faulting bit for state components
  x86: Add AMX CPUIDs enumeration
  x86: Add support for KVM_CAP_XSAVE2 and AMX state migration

Yang Zhong (2):
  x86: Grant AMX permission for guest
  linux-header: Sync the linux headers

Zeng Guang (1):
  x86: Support XFD and AMX xsave data migration

 linux-headers/asm-x86/kvm.h |   3 +
 linux-headers/linux/kvm.h   |   1 +
 target/i386/cpu.h           |  43 ++++++++++++-
 target/i386/kvm/kvm_i386.h  |   1 +
 target/i386/cpu.c           |  72 ++++++++++++++++++++-
 target/i386/kvm/kvm-cpu.c   |  11 ++--
 target/i386/kvm/kvm.c       | 121 +++++++++++++++++++++++++++++++-----
 target/i386/machine.c       |  42 +++++++++++++
 target/i386/xsave_helper.c  |  33 ++++++++++
 9 files changed, 302 insertions(+), 25 deletions(-)


