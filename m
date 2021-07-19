Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0A33CD42C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 13:52:05 +0200 (CEST)
Received: from localhost ([::1]:35488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Roa-0002hZ-Nw
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 07:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m5RST-0007uQ-HT
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:29:13 -0400
Received: from mga09.intel.com ([134.134.136.24]:16187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m5RSR-00065D-8b
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:29:13 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10049"; a="211035369"
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="211035369"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 04:28:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="656813788"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by fmsmga006.fm.intel.com with ESMTP; 19 Jul 2021 04:28:08 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 33/33] doc: Add the SGX doc
Date: Mon, 19 Jul 2021 19:21:36 +0800
Message-Id: <20210719112136.57018-34-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210719112136.57018-1-yang.zhong@intel.com>
References: <20210719112136.57018-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24; envelope-from=yang.zhong@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yang.zhong@intel.com, seanjc@google.com, kai.huang@intel.com,
 jarkko@kernel.org, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 docs/intel-sgx.txt | 167 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 167 insertions(+)
 create mode 100644 docs/intel-sgx.txt

diff --git a/docs/intel-sgx.txt b/docs/intel-sgx.txt
new file mode 100644
index 0000000000..f934d92f37
--- /dev/null
+++ b/docs/intel-sgx.txt
@@ -0,0 +1,167 @@
+===============================
+Software Guard eXtensions (SGX)
+===============================
+
+Overview
+========
+
+Intel Software Guard eXtensions (SGX) is a set of instructions and mechanisms
+for memory accesses in order to provide security accesses for sensitive
+applications and data. SGX allows an application to use it's pariticular
+address space as an *enclave*, which is a protected area provides confidentiality
+and integrity even in the presence of privileged malware. Accesses to the
+enclave memory area from any software not resident in the enclave are prevented,
+including those from privileged software.
+
+Virtual SGX
+===========
+
+SGX feature is exposed to guest via SGX CPUID. Looking at SGX CPUID, we can
+report the same CPUID info to guest as on host for most of SGX CPUID. With
+reporting the same CPUID guest is able to use full capacity of SGX, and KVM
+doesn't need to emulate those info.
+
+The guest's EPC base and size are determined by Qemu, and KVM needs Qemu to
+notify such info to it before it can initialize SGX for guest.
+
+Virtual EPC
+-----------
+
+By default, Qemu does not assign EPC to a VM, i.e. fully enabling SGX in a VM
+requires explicit allocation of EPC to the VM. Similar to other specialized
+memory types, e.g. hugetlbfs, EPC is exposed as a memory backend.
+
+SGX EPC is enumerated through CPUID, i.e. EPC "devices" need to be realized
+prior to realizing the vCPUs themselves, which occurs long before generic
+devices are parsed and realized.  This limitation means that EPC does not
+require -maxmem as EPC is not treated as {cold,hot}plugged memory.
+
+Qemu does not artificially restrict the number of EPC sections exposed to a
+guest, e.g. Qemu will happily allow you to create 64 1M EPC sections. Be aware
+that some kernels may not recognize all EPC sections, e.g. the Linux SGX driver
+is hardwired to support only 8 EPC sections.
+
+The following Qemu snippet creates two EPC sections, with 64M pre-allocated
+to the VM and an additional 28M mapped but not allocated:
+
+ -object memory-backend-epc,id=mem1,size=64M,prealloc=on \
+ -object memory-backend-epc,id=mem2,size=28M \
+ -M sgx-epc.0.memdev=mem1,sgx-epc.1.memdev=mem2
+
+Note:
+
+The size and location of the virtual EPC are far less restricted compared
+to physical EPC. Because physical EPC is protected via range registers,
+the size of the physical EPC must be a power of two (though software sees
+a subset of the full EPC, e.g. 92M or 128M) and the EPC must be naturally
+aligned.  KVM SGX's virtual EPC is purely a software construct and only
+requires the size and location to be page aligned. Qemu enforces the EPC
+size is a multiple of 4k and will ensure the base of the EPC is 4k aligned.
+To simplify the implementation, EPC is always located above 4g in the guest
+physical address space.
+
+Migration
+---------
+
+Qemu/KVM doesn't prevent live migrating SGX VMs, although from hardware's
+perspective, SGX doesn't support live migration, since both EPC and the SGX
+key hierarchy are bound to the physical platform. However live migration
+can be supported in the sense if guest software stack can support recreating
+enclaves when it suffers sudden lose of EPC; and if guest enclaves can detect
+SGX keys being changed, and handle gracefully. For instance, when ERESUME fails
+with #PF.SGX, guest software can gracefully detect it and recreate enclaves;
+and when enclave fails to unseal sensitive information from outside, it can
+detect such error and sensitive information can be provisioned to it again.
+
+CPUID
+-----
+
+Due to its myriad dependencies, SGX is currently not listed as supported
+in any of Qemu's built-in CPU configuration. To expose SGX (and SGX Launch
+Control) to a guest, you must either use `-cpu host` to pass-through the
+host CPU model, or explicitly enable SGX when using a built-in CPU model,
+e.g. via `-cpu <model>,+sgx` or `-cpu <model>,+sgx,+sgxlc`.
+
+All SGX sub-features enumerated through CPUID, e.g. SGX2, MISCSELECT,
+ATTRIBUTES, etc... can be restricted via CPUID flags. Be aware that enforcing
+restriction of MISCSELECT, ATTRIBUTES and XFRM requires intercepting ECREATE,
+i.e. may marginally reduce SGX performance in the guest. All SGX sub-features
+controlled via -cpu are prefixed with "sgx", e.g.:
+
+$ qemu-system-x86_64 -cpu help | xargs printf "%s\n" | grep sgx
+  sgx
+  sgx-debug
+  sgx-encls-c
+  sgx-enclv
+  sgx-exinfo
+  sgx-kss
+  sgx-mode64
+  sgx-provisionkey
+  sgx-tokenkey
+  sgx1
+  sgx2
+  sgxlc
+
+The following Qemu snippet passes through the host CPU (and host physical
+address width) but restricts access to the provision and EINIT token keys:
+
+ -cpu host,host-phys-bits,-sgx-provisionkey,-sgx-tokenkey
+
+Note:
+
+SGX sub-features cannot be emulated, i.e. sub-features that are not present
+in hardware cannot be forced on via '-cpu'.
+
+Virtualize SGX Launch Control
+-----------------------------
+
+Qemu SGX support for Launch Control (LC) is passive, in the sense that it
+does not actively change the LC configuration.  Qemu SGX provides the user
+the ability to set/clear the CPUID flag (and by extension the associated
+IA32_FEATURE_CONTROL MSR bit in fw_cfg) and saves/restores the LE Hash MSRs
+when getting/putting guest state, but Qemu does not add new controls to
+directly modify the LC configuration.  Similar to hardware behavior, locking
+the LC configuration to a non-Intel value is left to guest firmware.  Unlike
+host bios setting for SGX launch control(LC), there is no special bios setting
+for SGX guest by our design. If host is in locked mode, we can still allow
+creating VM with SGX.
+
+Feature Control
+---------------
+
+Qemu SGX updates the `etc/msr_feature_control` fw_cfg entry to set the SGX
+(bit 18) and SGX LC (bit 17) flags based on their respective CPUID support,
+i.e. existing guest firmware will automatically set SGX and SGX LC accordingly,
+assuming said firmware supports fw_cfg.msr_feature_control.
+
+Launch a guest
+==============
+
+To launch a SGX guest
+${QEMU} \
+   -cpu host,+sgx-provisionkey \
+   -object memory-backend-epc,id=mem1,size=64M,prealloc=on \
+   -object memory-backend-epc,id=mem2,size=28M \
+   -M sgx-epc.0.memdev=mem1,sgx-epc.1.memdev=mem2
+
+Utilizing SGX in the guest requires a kernel/OS with SGX support.
+
+The support can be determined in guest by:
+$ grep sgx /proc/cpuinfo
+
+Check the SGX epc info in the Guest:
+$ dmesg | grep sgx
+[    1.242142] sgx: EPC section 0x180000000-0x181bfffff
+[    1.242319] sgx: EPC section 0x181c00000-0x1837fffff
+
+References
+==========
+
+SGX Homepage:
+https://software.intel.com/sgx
+
+SGX SDK:
+https://github.com/intel/linux-sgx.git
+
+SGX SPEC:
+Intel SDM Volume 3

