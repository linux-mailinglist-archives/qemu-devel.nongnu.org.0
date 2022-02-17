Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 808324B98C2
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 07:08:18 +0100 (CET)
Received: from localhost ([::1]:37020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKZxh-0001Az-KS
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 01:08:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nKZuE-0006av-HG
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 01:04:43 -0500
Received: from mga18.intel.com ([134.134.136.126]:2004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nKZuB-0005nn-Gi
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 01:04:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645077879; x=1676613879;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NxrIdoLQRPqFvNvcaHRHtSiiYT97pTyEhuD6ElcJPD4=;
 b=Z2mZiYyrPpWiCB2Wud7QV5qXndhPqoE62fDgD75eJTt4driiZbwaYpec
 M5Nf24Hi/i2fsay7GYvQEdq+n5L9fxzHw6+UTxHAplNNnSOREMEVwlk0H
 pATT+op9N54EyYsWVME22b2c9Xg/idE9raCZz/kynbP5t8lBUiko0WStR
 ugYKygUoql0JpBzQOkZTWDHzn+IS7m2ORA2orDzVigrRKIJHbt5WnLgTQ
 N0OGE5nxX7SYLNnpEVxmQDE+lzPQDQo5ujVg6jW0f8lUYt65UggUOo8wK
 sZtBlLSpb0MrGhU1fMoyRbAbMDmO1VlsioMXpx5+2ddjRoehfHH1sqG/v A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="234332892"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="234332892"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 22:04:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="634318683"
Received: from 984fee00bf64.jf.intel.com ([10.165.54.77])
 by fmsmga002.fm.intel.com with ESMTP; 16 Feb 2022 22:04:34 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/8] AMX support in Qemu
Date: Wed, 16 Feb 2022 22:04:26 -0800
Message-Id: <20220217060434.52460-1-yang.zhong@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=yang.zhong@intel.com; helo=mga18.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
once Qemu sync those linux-headers, I will remove those definitions. So
please ignore those changes.

[1] Intel Architecture Instruction Set Extension Programming Reference
    https://software.intel.com/content/dam/develop/external/us/en/documents/\
    architecture-instruction-set-extensions-programming-reference.pdf

Thanks,
Yang
----

Change history
--------------
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
  x86: add support for KVM_CAP_XSAVE2 and AMX state migration

Yang Zhong (2):
  x86: Grant AMX permission for guest
  linux-header: Sync the linux headers

Zeng Guang (1):
  x86: Support XFD and AMX xsave data migration

 linux-headers/asm-x86/kvm.h |  17 ++++++
 linux-headers/linux/kvm.h   |   4 ++
 target/i386/cpu.h           |  46 ++++++++++++++-
 target/i386/cpu.c           | 108 +++++++++++++++++++++++++++++++++++-
 target/i386/kvm/kvm-cpu.c   |  11 ++--
 target/i386/kvm/kvm.c       |  84 ++++++++++++++++++++++------
 target/i386/machine.c       |  42 ++++++++++++++
 target/i386/xsave_helper.c  |  33 +++++++++++
 8 files changed, 320 insertions(+), 25 deletions(-)


