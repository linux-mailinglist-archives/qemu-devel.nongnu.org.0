Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9145569A45D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 04:32:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSrSt-0004Hp-3d; Thu, 16 Feb 2023 22:31:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pSrSn-0004Dx-Ob
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 22:31:13 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pSrSi-0000DO-Kf
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 22:31:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676604664; x=1708140664;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MC4tC73/zITob98PECt1Y7BgQCU44VzhswK415cOxGg=;
 b=Q01PaqRq3cbrQ5+Cutrj9DFVkPs6UV6novbBtB6l2RKwm+6iLuDnBFQi
 lNHpRjMHYSTk628qGDIQB4V+uyJ7kVU8Ie4+BFVb/TqXxuRougqVAOkG/
 LtTB1vZfj1d8jmzqm8N2EpTdytTKxcGb/YR3eLP+DsPQ5PwvWqI2A2Ll+
 r9WXxpbs4LfDPRv1LT5KdS82uHNYOYJumiAafyUSkp0F3kmtjRf0dxGMq
 Nxlmz0KSAQtFOS/ZGYUtTZBtt09rpIMRrEJi/pxnpWYb3Y4LtI1oDN6Uj
 HQyXjVygj2fnoNWqTHuWurvjBYqoVPYyIfvxEnWiEUyrG8/IIoDJx6Agt w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="311533532"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="311533532"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 19:30:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="663747772"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="663747772"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by orsmga007.jf.intel.com with ESMTP; 16 Feb 2023 19:30:51 -0800
Date: Fri, 17 Feb 2023 11:38:43 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Pierre Morel <pmorel@linux.ibm.com>, qemu-devel@nongnu.org,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Subject: Re: [RFC 20/52] s390x: Replace MachineState.smp access with topology
 helpers
Message-ID: <Y+72wweKnk7hyWLO@liuzhao-OptiPlex-7080>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-21-zhao1.liu@linux.intel.com>
 <1f2865ee-6780-5e25-d538-43de0b367c2d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f2865ee-6780-5e25-d538-43de0b367c2d@redhat.com>
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Feb 16, 2023 at 02:38:55PM +0100, Thomas Huth wrote:
> Date: Thu, 16 Feb 2023 14:38:55 +0100
> From: Thomas Huth <thuth@redhat.com>
> Subject: Re: [RFC 20/52] s390x: Replace MachineState.smp access with
>  topology helpers
> 
> On 13/02/2023 10.50, Zhao Liu wrote:
> > From: Zhao Liu <zhao1.liu@intel.com>
> > 
> > When MachineState.topo is introduced, the topology related structures
> > become complicated. So we wrapped the access to topology fields of
> > MachineState.topo into some helpers, and we are using these helpers
> > to replace the use of MachineState.smp.
> > 
> > In hw/s390x/s390-virtio-ccw.c, s390_init_cpus() needs "threads per core".
> > Before s390x supports hybrid, here we use smp-specific interface to get
> > "threads per core".
> > 
> > For other cases, it's straightforward to replace topology access with
> > wrapped generic interfaces.
> ...
> > diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
> > index 3ac7ec9acf4e..d297daed1117 100644
> > --- a/target/s390x/kvm/kvm.c
> > +++ b/target/s390x/kvm/kvm.c
> > @@ -406,9 +406,11 @@ unsigned long kvm_arch_vcpu_id(CPUState *cpu)
> >   int kvm_arch_init_vcpu(CPUState *cs)
> >   {
> > -    unsigned int max_cpus = MACHINE(qdev_get_machine())->smp.max_cpus;
> > +    unsigned int max_cpus;
> >       S390CPU *cpu = S390_CPU(cs);
> > +
> >       kvm_s390_set_cpu_state(cpu, cpu->env.cpu_state);
> > +    max_cpus = machine_topo_get_max_cpus(MACHINE(qdev_get_machine()));
> >       cpu->irqstate = g_malloc0(VCPU_IRQ_BUF_SIZE(max_cpus));
> >       return 0;
> >   }
> > @@ -2097,14 +2099,15 @@ int kvm_s390_set_cpu_state(S390CPU *cpu, uint8_t cpu_state)
> >   void kvm_s390_vcpu_interrupt_pre_save(S390CPU *cpu)
> >   {
> > -    unsigned int max_cpus = MACHINE(qdev_get_machine())->smp.max_cpus;
> > -    struct kvm_s390_irq_state irq_state = {
> > -        .buf = (uint64_t) cpu->irqstate,
> > -        .len = VCPU_IRQ_BUF_SIZE(max_cpus),
> > -    };
> > +    unsigned int max_cpus;
> > +    struct kvm_s390_irq_state irq_state;
> >       CPUState *cs = CPU(cpu);
> >       int32_t bytes;
> > +    max_cpus = machine_topo_get_max_cpus(MACHINE(qdev_get_machine()));
> > +    irq_state.buf = (uint64_t) cpu->irqstate;
> > +    irq_state.len = VCPU_IRQ_BUF_SIZE(max_cpus);
> 
>  Hi!
> 
> Please don't replace struct initializers like this. There's a reason why
> these structs like irq_state are directly initialized with "= { ... }" at
> the beginning of the function: This automatically clears all fields that are
> not mentioned, e.g. also the "flags" field of struct kvm_s390_irq_state,
> which can be very important for structs that are passed to the kernel via an
> ioctl.
> You could use memset(..., 0, ...) instead, but people tend to forget that,
> too, so we settled on using struct initializers at the beginning instead. So
> please stick to that.

Thanks Thomas! Sorry I didn't notice this, I'll fix it and be careful in the
future.

Zhao

> 
>  Thanks,
>   Thomas
> 
> 
> >       if (!kvm_check_extension(kvm_state, KVM_CAP_S390_IRQ_STATE)) {
> >           return;
> >       }
> > diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
> > index bc767f044381..e396a89d5540 100644
> > --- a/target/s390x/tcg/excp_helper.c
> > +++ b/target/s390x/tcg/excp_helper.c
> > @@ -321,7 +321,7 @@ static void do_ext_interrupt(CPUS390XState *env)
> >       if ((env->pending_int & INTERRUPT_EMERGENCY_SIGNAL) &&
> >           (env->cregs[0] & CR0_EMERGENCY_SIGNAL_SC)) {
> >           MachineState *ms = MACHINE(qdev_get_machine());
> > -        unsigned int max_cpus = ms->smp.max_cpus;
> > +        unsigned int max_cpus = machine_topo_get_max_cpus(ms);
> >           lowcore->ext_int_code = cpu_to_be16(EXT_EMERGENCY);
> >           cpu_addr = find_first_bit(env->emergency_signals, S390_MAX_CPUS);
> 

