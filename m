Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 184E0379FEA
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 08:46:21 +0200 (CEST)
Received: from localhost ([::1]:44472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgM9s-0008TX-4y
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 02:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lgLtr-0008Lv-5g
 for qemu-devel@nongnu.org; Tue, 11 May 2021 02:29:47 -0400
Received: from mga06.intel.com ([134.134.136.31]:46423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lgLtn-0004ZR-7V
 for qemu-devel@nongnu.org; Tue, 11 May 2021 02:29:46 -0400
IronPort-SDR: I5ii4iU23HvKPch7SXE1gGEop7Qb+cCTLV5KuMb7RZtI/NK+in6g0n+/q1+q6KVEls/ilanTas
 PbL6r91nXL1w==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="260631603"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="260631603"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 23:28:33 -0700
IronPort-SDR: J+W1VN4I0vfF+mTIGT/HVy9zNduy7GqSAh+jv6uF1WjH3iyw56aIRdQpZmwbVvE/nZa8ALyw3s
 mVWVLvQifHIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="391281453"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga003.jf.intel.com with ESMTP; 10 May 2021 23:28:31 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 32/32] doc: Add the SGX doc
Date: Tue, 11 May 2021 14:20:51 +0800
Message-Id: <20210511062051.41948-33-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210511062051.41948-1-yang.zhong@intel.com>
References: <20210511062051.41948-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=yang.zhong@intel.com;
 helo=mga06.intel.com
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, kai.huang@intel.com,
 seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 docs/intel-sgx.txt | 173 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 173 insertions(+)
 create mode 100644 docs/intel-sgx.txt

diff --git a/docs/intel-sgx.txt b/docs/intel-sgx.txt
new file mode 100644
index 0000000000..4fc3fd3564
--- /dev/null
+++ b/docs/intel-sgx.txt
@@ -0,0 +1,173 @@
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
+memory types, e.g. hugetlbfs, EPC is exposed as a memory backend. For a number
+of reasons, a EPC memory backend can only be realized via an 'sgx-epc' device.
+Standard memory backend options such as prealloc are supported by EPC.
+
+SGX EPC is enumerated through CPUID, i.e. EPC "devices" need to be realized
+prior to realizing the vCPUs themselves, which occurs long before generic
+devices are parsed and realized.  Because of this, 'sgx-epc' devices must be
+created via the dedicated -sgx-epc command, i.e. cannot be created through
+the generic -devices command.  On the plus side, this limitation means that
+EPC does not require -maxmem as EPC is not treated as {cold,hot}plugged memory.
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
+ -sgx-epc id=epc1,memdev=mem1 \
+ -object memory-backend-epc,id=mem2,size=28M \
+ -sgx-epc id=epc2,memdev=mem2
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
+   -sgx-epc id=epc1,memdev=mem1 \
+   -object memory-backend-epc,id=mem2,size=28M \
+   -sgx-epc id=epc2,memdev=mem2
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
-- 
2.29.2.334.gfaefdd61ec


