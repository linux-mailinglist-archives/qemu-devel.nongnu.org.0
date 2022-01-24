Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A9E4979F2
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 09:05:43 +0100 (CET)
Received: from localhost ([::1]:45326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBuMA-00018a-Df
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 03:05:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nBuCH-0004Tn-9G
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 02:55:29 -0500
Received: from mga07.intel.com ([134.134.136.100]:15222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nBuCD-0001Wn-RD
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 02:55:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643010925; x=1674546925;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XPbDKe4rIR3RnaoQS0CyOFcu32AW4BYLmRgEoXsQIDI=;
 b=PHFi5TIEQTO2kRSHE53zOc18KgoK+/b7KBdTSk/X7AqSnS03bC1sIwOB
 4JhlOP0yEHBWm5QdqlTaEa1/srrsuUJvzGwMO3/MbOWQ2PrJwfU/72G58
 ceY29Mm4Slm/ov92LdI8olt72i/01UNA32HRNmnO76ivfSIAPmEiurp4z
 mb6HQbtzjdQjBLLZOCsGVR4HjExRgRpDe/2BewXnn9YiN4kvc1ADJUJF9
 /7MPE0tVG6DVo7lz4rtv43S7gz+V0yxzj6kX2RwzhxQhZ+0bEWTQTVN/L
 ZQThSpegCPvuPNnela8vlNGS4Irwza16xRX52jjzxrj0GDs4KEcR/g2d+ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="309310862"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="309310862"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 23:55:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="494530968"
Received: from 984fee00bf64.jf.intel.com ([10.165.54.77])
 by orsmga002.jf.intel.com with ESMTP; 23 Jan 2022 23:55:23 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] AMX support in Qemu
Date: Sun, 23 Jan 2022 23:55:16 -0800
Message-Id: <20220124075523.108875-1-yang.zhong@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=yang.zhong@intel.com; helo=mga07.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
is based on latest Linux release.

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

change history
--------------
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

Yang Zhong (1):
  x86: Grant AMX permission for guest

Zeng Guang (1):
  x86: Support XFD and AMX xsave data migration

 linux-headers/asm-x86/kvm.h | 14 ++++++
 linux-headers/linux/kvm.h   |  2 +
 target/i386/cpu.h           | 46 +++++++++++++++++-
 target/i386/cpu.c           | 96 +++++++++++++++++++++++++++++++++++--
 target/i386/kvm/kvm-cpu.c   | 12 +++--
 target/i386/kvm/kvm.c       | 69 +++++++++++++++++++-------
 target/i386/machine.c       | 42 ++++++++++++++++
 target/i386/xsave_helper.c  | 35 ++++++++++++++
 8 files changed, 291 insertions(+), 25 deletions(-)


