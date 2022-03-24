Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF464E5FC5
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 08:56:18 +0100 (CET)
Received: from localhost ([::1]:40906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXIKP-0002LM-Ls
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 03:56:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nXIJ5-0001ZC-1E
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 03:54:55 -0400
Received: from mga01.intel.com ([192.55.52.88]:59621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nXIJ1-0006iv-Iq
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 03:54:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648108491; x=1679644491;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=J21RMn0weBShKkf+nNEuRG6UiLR1zTxLSaW9+iprKHU=;
 b=MUivoxhw1Pkhy/ILgTjQp3AdRYY90qYU9X5JtkRF9YJi5q1Xy4jEl5GD
 lhOrvrTw66zG1lps15j95YxEtZxas0yoiem5Q25nx/M3IujinxobcmLjX
 74nW7WbgoBx96vrmOYkvvp2nf63Y84hRJL74qvFaMWXdOngu/I3NSaLfB
 TB/WkrZ3/xMOJU/uzUNY5WQ2zhrEifN18Oxw6Nw5vJ0sb9sWlPH2LOOwT
 KSxdmzI2rbZaaG21drH3PQIm/Wl3UkgieA6+I7xo9D1d/cfnuX0l3LmoG
 guA6MFXjPr69Je8oE0q++c3MBoWgB9CyOzR1yeehEzq2ghxu+Ooti+1qd A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="283168042"
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; d="scan'208";a="283168042"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 00:54:49 -0700
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; d="scan'208";a="561264555"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 24 Mar 2022 00:54:47 -0700
Date: Thu, 24 Mar 2022 15:38:48 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] target/i386: Return right size value after dynamic
 xfeature enabled
Message-ID: <20220324073848.GA2150@yangzhon-Virtual>
References: <20220324031846.11943-1-yang.zhong@intel.com>
 <8650f038-15ce-a67b-c5d7-1960c3ac6695@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8650f038-15ce-a67b-c5d7-1960c3ac6695@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.88; envelope-from=yang.zhong@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: yang.zhong@intel.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 08:35:10AM +0100, Paolo Bonzini wrote:
> On 3/24/22 04:18, Yang Zhong wrote:
> >The kvm_arch_get_supported_cpuid() only call KVM_GET_SUPPORTED_CPUID one
> >time, so the cpuid buffer information still keep older value. Once Qemu
> >enable new dynamic xfeature, like XTILEDATA, the cpuid[0D,0].{EBX,ECX}
> >still return older value.
> >
> >This patch can return right size value in kvm_init_xsave() if XTILEDATA
> >has been enabled by arch_prctl.
> >
> >assert(kvm_arch_get_supported_cpuid(kvm_state, 0xd, 0, R_ECX) <=
> >            env->xsave_buf_len);
> >
> >Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> 
> I don't understand, is this a bugfix for an assertion failure or
> just a cleanup?
> 

  In fact, no assert issue here.
  The issue is after we enable dynamic xfeature, and if we still use
  kvm_arch_get_supported_cpuid(kvm_state, 0xd, 0, R_ECX) to get size,
  the size is older value(size:2816), not the size(11008) we expected.

  The code for cpuid[0D,0].{EBX,ECX} by kvm_arch_get_supported_cpuid()
  need cleanup here, or we can't get the real value here. thanks!

  Yang



> Either way, while I like the idea of modifying
> kvm_arch_get_supported_cpuid, I think the right thing to do is to
> just use has_xsave2 as the return value if it is nonzero.  And then
> kvm_init_xsave can just do
> 
> if (!has_xsave) {
>     return;
> }
> env->xsave_buf_len = kvm_arch_get_supported_cpuid(kvm_state, 0xd, 0, R_ECX);
> 
> without the assertion that is now obvious.
> 
> Paolo
> 
> >---
> >  target/i386/cpu.h     |  3 +++
> >  target/i386/kvm/kvm.c | 15 +++++++++++++--
> >  2 files changed, 16 insertions(+), 2 deletions(-)
> >
> >diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> >index 5e406088a9..814ba4020b 100644
> >--- a/target/i386/cpu.h
> >+++ b/target/i386/cpu.h
> >@@ -565,6 +565,9 @@ typedef enum X86Seg {
> >  #define ESA_FEATURE_ALIGN64_MASK        (1U << ESA_FEATURE_ALIGN64_BIT)
> >  #define ESA_FEATURE_XFD_MASK            (1U << ESA_FEATURE_XFD_BIT)
> >+#define ARCH_GET_XCOMP_GUEST_PERM       0x1024
> >+#define ARCH_REQ_XCOMP_GUEST_PERM       0x1025
> >+
> >  /* CPUID feature words */
> >  typedef enum FeatureWord {
> >diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> >index 06901c2a43..312d4fccf8 100644
> >--- a/target/i386/kvm/kvm.c
> >+++ b/target/i386/kvm/kvm.c
> >@@ -46,6 +46,7 @@
> >  #include "hw/i386/intel_iommu.h"
> >  #include "hw/i386/x86-iommu.h"
> >  #include "hw/i386/e820_memory_layout.h"
> >+#include "target/i386/cpu.h"
> >  #include "hw/pci/pci.h"
> >  #include "hw/pci/msi.h"
> >@@ -437,6 +438,18 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
> >              return ret;
> >          }
> >          ret = (reg == R_EAX) ? bitmask : bitmask >> 32;
> >+    } else if (function == 0xd && index == 0 &&
> >+               (reg == R_EBX || reg == R_ECX)) {
> >+        /*
> >+         * The value returned by KVM_GET_SUPPORTED_CPUID does not include
> >+         * features that already be enabled with the arch_prctl system call.
> >+         */
> >+        int rc = syscall(SYS_arch_prctl, ARCH_GET_XCOMP_GUEST_PERM, &bitmask);
> >+        if (rc) {
> >+            warn_report("prctl(ARCH_GET_XCOMP_GUEST_PERM) error: %d", rc);
> >+        } else if (bitmask & XSTATE_XTILE_DATA_MASK) {
> >+            ret += sizeof(XSaveXTILEDATA);
> >+        }
> >      } else if (function == 0x80000001 && reg == R_ECX) {
> >          /*
> >           * It's safe to enable TOPOEXT even if it's not returned by
> >@@ -5214,8 +5227,6 @@ bool kvm_arch_cpu_check_are_resettable(void)
> >      return !sev_es_enabled();
> >  }
> >-#define ARCH_REQ_XCOMP_GUEST_PERM       0x1025
> >-
> >  void kvm_request_xsave_components(X86CPU *cpu, uint64_t mask)
> >  {
> >      KVMState *s = kvm_state;
> >

