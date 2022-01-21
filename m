Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D92495D05
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 10:44:24 +0100 (CET)
Received: from localhost ([::1]:50896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAqT1-0002RU-88
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 04:44:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nAoTz-0001gp-VY
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 02:37:21 -0500
Received: from mga02.intel.com ([134.134.136.20]:54948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nAoTv-000491-NY
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 02:37:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642750631; x=1674286631;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gJgQOiSfx63z8tJT0PWxrnBJtH2EyLOPk9yGiwBgrdc=;
 b=FW6617zXpnjvsoZs/IMDXDQbw/Md2rhv41Tl2atGrq2fG8nqQ6DSsBFe
 4ePGGefxBWmHKyWlIJlTRzpWIrETl3y5a0QFQCqkdpdQiIQj/xQ4I/I8M
 7ScFElxt7GryqAiH02yXa6OVLP7zw7iigM43HSHQRRNoPrXTPaj3y7qlF
 7CvCl6OoSkSu3KLaCCr+RxZZOCgdUlIWVgBmhNaxMw+0uGn+u8MztQt57
 f9Gfd0Cv1pNNhLYebb82zOwH+3d2pTXhtlarrsXH5LRYvtjHS3tmobFCK
 GEc9t2Pd1i/Tpxt4QsRNL+IHrtItGWzn2pGHCptmykWVoKUzZTE1PShMr A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="232949454"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="232949454"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 23:37:08 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="561775507"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 20 Jan 2022 23:37:06 -0800
Date: Fri, 21 Jan 2022 15:21:47 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 3/7] x86: Grant AMX permission for guest
Message-ID: <20220121072147.GD29921@yangzhon-Virtual>
References: <20220107093134.136441-1-yang.zhong@intel.com>
 <20220107093134.136441-4-yang.zhong@intel.com>
 <29573e51-aa21-dbf3-b626-facf72e5b9c6@redhat.com>
 <0ad4f708-f338-0742-dc69-af08e908cff5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ad4f708-f338-0742-dc69-af08e908cff5@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.20; envelope-from=yang.zhong@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 jing2.liu@linux.intel.com, qemu-devel@nongnu.org, wei.w.wang@intel.com,
 guang.zeng@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 18, 2022 at 02:06:55PM +0100, Paolo Bonzini wrote:
> Sorry, hit send on the wrong window.  This is the only patch that
> will require a bit more work.
> 
> On 1/18/22 13:52, Paolo Bonzini wrote:
> >>@@ -124,6 +150,8 @@ void x86_cpus_init(X86MachineState *x86ms,
> >>int default_cpu_version)
> >>      MachineState *ms = MACHINE(x86ms);
> >>      MachineClass *mc = MACHINE_GET_CLASS(x86ms);
> >>+    /* Request AMX pemission for guest */
> >>+    x86_xsave_req_perm();
> >>      x86_cpu_set_default_version(default_cpu_version);
> >
> >This should be done before creating a CPU with support for state
> >component 18.  It happens in kvm_init_vcpu, with the following
> >call stack:
> >
> >     kvm_init_vcpu
> >     kvm_vcpu_thread_fn
> >     kvm_start_vcpu_thread
> >     qemu_init_vcpu
> >     x86_cpu_realizefn
> >
> >The issue however is that this has to be done before
> >KVM_GET_SUPPORTED_CPUID and KVM_CHECK_EXTENSION(KVM_CAP_XSAVE2).
> >
> >For the former, you can assume that anything returned by
> >ARCH_GET_XCOMP_GUEST_PERM will be returned by
> >KVM_GET_SUPPORTED_CPUID in CPUID[0xD].EDX:EAX, so you can:
> >
> >- add it to kvm_arch_get_supported_cpuid
> 
> ... together with the other special cases (otherwise
> x86_cpu_get_supported_feature_word complains that XTILEDATA is not
> available)
> 
> - change kvm_cpu_xsave_init to use host_cpuid instead of
> kvm_arch_get_supported_cpuid.
> 
> - call ARCH_REQ_XCOMP_GUEST_PERM from
> x86_cpu_enable_xsave_components, with a conditional like
> 
>     if (kvm_enabled()) {
>         kvm_request_xsave_components(cpu, mask);
>     }
> 
> KVM_CHECK_EXTENSION(KVM_CAP_XSAVE2) is actually not a problem; the
> ioctl is only called from kvm_arch_init_vcpu and therefore after
> x86_cpu_enable_xsave_components.
>
  
  Paolo, thanks too much for those detailed steps!
  I have completed the new patch according to those steps, and work well.

  Since this is only big change patch, the next version will be removed RFC.

  Thanks!
  Yang  
  
 
> Thanks,
> 
> Paolo

