Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4797B39F455
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 12:54:38 +0200 (CEST)
Received: from localhost ([::1]:40636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqZNV-0001YJ-CE
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 06:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7860c40c5=sidcha@amazon.de>)
 id 1lqZMc-0000rH-7w
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 06:53:42 -0400
Received: from smtp-fw-80006.amazon.com ([99.78.197.217]:42124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7860c40c5=sidcha@amazon.de>)
 id 1lqZMa-0005yU-7u
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 06:53:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1623149621; x=1654685621;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uX+6vxzOIqUGEe98wxCwdwW4P7Vy8FBVLE5fGr5L0cY=;
 b=IEfE3TBTfh1DcdlYvPEED8IzBBe0fUFLTSrjzsB5w5wUimfSqtkW2HGD
 KhQbsdhNsIzKMpnt9OBu7H9IFxDUdiQOGu9rt90UnkUtMzWhFCrbUJ/VN
 RYi5pPVS+BuZM33VajEfbHHoPCV/c87gVogLVw9H2FzrEe7yx64cK+xoa k=;
X-IronPort-AV: E=Sophos;i="5.83,257,1616457600"; 
   d="scan'208";a="5486107"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-1e-27fb8269.us-east-1.amazon.com) ([10.25.36.214])
 by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP;
 08 Jun 2021 10:53:29 +0000
Received: from EX13D28EUC003.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-27fb8269.us-east-1.amazon.com (Postfix) with ESMTPS
 id 64B9AA06D7; Tue,  8 Jun 2021 10:53:27 +0000 (UTC)
Received: from u366d62d47e3651.ant.amazon.com (10.43.160.41) by
 EX13D28EUC003.ant.amazon.com (10.43.164.43) with Microsoft SMTP Server (TLS)
 id 15.0.1497.18; Tue, 8 Jun 2021 10:53:23 +0000
Date: Tue, 8 Jun 2021 12:53:18 +0200
From: Siddharth Chandrasekaran <sidcha@amazon.de>
To: Alexander Graf <graf@amazon.com>
CC: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Siddharth Chandrasekaran <sidcha.dev@gmail.com>,
 Evgeny Iakovlev <eyakovl@amazon.de>, Liran Alon <liran@amazon.com>, Ioannis
 Aslanidis <iaslan@amazon.de>, <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>
Subject: Re: [PATCH 5/6] kvm/i386: Add support for user space MSR filtering
Message-ID: <20210608105317.GA25597@u366d62d47e3651.ant.amazon.com>
References: <cover.1621885749.git.sidcha@amazon.de>
 <4c7ecaab0295e8420ee03baf37c7722e01bb81ce.1621885749.git.sidcha@amazon.de>
 <2c6375b0-e7e0-a19e-8cc9-a8b81a64dfc1@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2c6375b0-e7e0-a19e-8cc9-a8b81a64dfc1@amazon.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.43.160.41]
X-ClientProxiedBy: EX13D32UWB001.ant.amazon.com (10.43.161.248) To
 EX13D28EUC003.ant.amazon.com (10.43.164.43)
Precedence: Bulk
Received-SPF: pass client-ip=99.78.197.217;
 envelope-from=prvs=7860c40c5=sidcha@amazon.de; helo=smtp-fw-80006.amazon.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On Tue, Jun 08, 2021 at 10:48:53AM +0200, Alexander Graf wrote:
> On 24.05.21 22:01, Siddharth Chandrasekaran wrote:
> > Check and enable user space MSR filtering capability and handle new exit
> > reason KVM_EXIT_X86_WRMSR. This will be used in a follow up patch to
> > implement hyper-v overlay pages.
> > 
> > Signed-off-by: Siddharth Chandrasekaran <sidcha@amazon.de>
> 
> This patch will break bisection, because we're no longer handling the writes
> in kernel space after this, but we also don't have user space handling
> available yet, right? It might be better to move all logic in this patch
> that sets up the filter for Hyper-V MSRs into the next one.

Yes, that's correct. I'll just bounce back all reads/writes to KVM. That
should maintain the existing behaviour.

> > ---
> >   target/i386/kvm/kvm.c | 72 +++++++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 72 insertions(+)
> > 
> > diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> > index 362f04ab3f..3591f8cecc 100644
> > --- a/target/i386/kvm/kvm.c
> > +++ b/target/i386/kvm/kvm.c
> > @@ -117,6 +117,8 @@ static bool has_msr_ucode_rev;
> >   static bool has_msr_vmx_procbased_ctls2;
> >   static bool has_msr_perf_capabs;
> >   static bool has_msr_pkrs;
> > +static bool has_msr_filtering;
> > +static bool msr_filters_active;
> >   static uint32_t has_architectural_pmu_version;
> >   static uint32_t num_architectural_pmu_gp_counters;
> > @@ -2138,6 +2140,57 @@ static void register_smram_listener(Notifier *n, void *unused)
> >                                    &smram_address_space, 1);
> >   }
> > +static void kvm_set_msr_filter_range(struct kvm_msr_filter_range *range, uint32_t flags,
> > +                                     uint32_t base, uint32_t nmsrs, ...)
> > +{
> > +    int i, filter_to_userspace;
> > +    va_list ap;
> > +
> > +    range->flags = flags;
> > +    range->nmsrs = nmsrs;
> > +    range->base = base;
> > +
> > +    va_start(ap, nmsrs);
> > +    for (i = 0; i < nmsrs; i++) {
> > +        filter_to_userspace = va_arg(ap, int);
> > +        if (!filter_to_userspace) {
> > +            range->bitmap[i / 8] = 1 << (i % 8);
> > +        }
> > +    }
> > +    va_end(ap);
> > +}
> > +
> > +static int kvm_set_msr_filters(KVMState *s)
> > +{
> > +    int r, nmsrs, nfilt = 0, bitmap_pos = 0;
> > +    struct kvm_msr_filter filter = { };
> > +    struct kvm_msr_filter_range *range;
> > +    uint8_t bitmap_buf[KVM_MSR_FILTER_MAX_RANGES * 8] = {0};
> > +
> > +    filter.flags = KVM_MSR_FILTER_DEFAULT_ALLOW;
> > +
> > +    if (has_hyperv) {
> > +        /* Hyper-V overlay page MSRs */
> 
> I think you want to extend this comment and indicate in a human readable
> form that you set the filter on WRMSR to trap HV_X64_MSR_GUEST_OS_ID and
> HV_X64_MSR_HYPERCALL into user space here.

Sure.

> > +        nmsrs = 2;
> > +        range = &filter.ranges[nfilt++];
> > +        range->bitmap = &bitmap_buf[bitmap_pos];
> > +        kvm_set_msr_filter_range(range, KVM_MSR_FILTER_WRITE,
> > +                                 HV_X64_MSR_GUEST_OS_ID, nmsrs,
> > +                                 true, /* HV_X64_MSR_GUEST_OS_ID */
> > +                                 true  /* HV_X64_MSR_HYPERCALL */);
> > +        bitmap_pos += ROUND_UP(nmsrs, 8) / 8;
> > +        assert(bitmap_pos < sizeof(bitmap_buf));
> > +    }
> > +
> > +    r = kvm_vm_ioctl(s, KVM_X86_SET_MSR_FILTER, &filter);
> > +    if (r != 0) {
> > +        error_report("kvm: failed to set MSR filters");
> > +        return -1;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >   int kvm_arch_init(MachineState *ms, KVMState *s)
> >   {
> >       uint64_t identity_base = 0xfffbc000;
> > @@ -2269,6 +2322,17 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
> >           }
> >       }
> > +    has_msr_filtering = kvm_check_extension(s, KVM_CAP_X86_USER_SPACE_MSR) &&
> > +                        kvm_check_extension(s, KVM_CAP_X86_MSR_FILTER);
> > +    if (has_msr_filtering) {
> > +        ret = kvm_vm_enable_cap(s, KVM_CAP_X86_USER_SPACE_MSR, 0,
> > +                                KVM_MSR_EXIT_REASON_FILTER);
> > +        if (ret == 0) {
> > +            ret = kvm_set_msr_filters(s);
> > +            msr_filters_active = (ret == 0);
> > +        }
> > +    }
> > +
> >       return 0;
> >   }
> > @@ -4542,6 +4606,11 @@ static bool host_supports_vmx(void)
> >       return ecx & CPUID_EXT_VMX;
> >   }
> > +static int kvm_handle_wrmsr(X86CPU *cpu, struct kvm_run *run)
> > +{
> > +    return 0;
> 
> The default handler should always set run->msr.error = 1 to mimic the
> existing behavior.

Will do, thanks.

> > +}
> > +
> >   #define VMX_INVALID_GUEST_STATE 0x80000021
> >   int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
> > @@ -4600,6 +4669,9 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
> >           ioapic_eoi_broadcast(run->eoi.vector);
> >           ret = 0;
> >           break;
> > +    case KVM_EXIT_X86_WRMSR:
> > +        ret = kvm_handle_wrmsr(cpu, run);
> 
> Please provide a default RDMSR handler as well here.

Ack.

~ Sid.



Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




