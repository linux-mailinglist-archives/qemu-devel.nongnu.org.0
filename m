Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1DC39F46C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 12:56:54 +0200 (CEST)
Received: from localhost ([::1]:43466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqZPh-0003W2-HJ
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 06:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7860c40c5=sidcha@amazon.de>)
 id 1lqZOX-0002ju-NO
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 06:55:41 -0400
Received: from smtp-fw-4101.amazon.com ([72.21.198.25]:6084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7860c40c5=sidcha@amazon.de>)
 id 1lqZOV-0007LX-MX
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 06:55:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1623149740; x=1654685740;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VFNUYMCXgLnKWM5t5Fx231DNWPiTnzstf+PtLSBsRlw=;
 b=kNsYQmltcXjqchcteV7/AkT+opwA6w3GoZOnW9NDSey9BeG8BpxYZYtz
 rdVb85l9RTFhR/nIBVUQOnITL6zXmNFqPvo29253+EWYPMfCXA5egGLUv
 WjACFjoKV/2rZe8qj6xziyzs2AEAPQIozUW1xCrYHCTRwJLerBAI+DgFR Q=;
X-IronPort-AV: E=Sophos;i="5.83,257,1616457600"; d="scan'208";a="112831480"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-16425a8d.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-4101.iad4.amazon.com with ESMTP; 08 Jun 2021 10:55:31 +0000
Received: from EX13D28EUC003.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-16425a8d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 0E7BC100AC4; Tue,  8 Jun 2021 10:55:31 +0000 (UTC)
Received: from u366d62d47e3651.ant.amazon.com (10.43.162.147) by
 EX13D28EUC003.ant.amazon.com (10.43.164.43) with Microsoft SMTP Server (TLS)
 id 15.0.1497.18; Tue, 8 Jun 2021 10:55:27 +0000
Date: Tue, 8 Jun 2021 12:55:22 +0200
From: Siddharth Chandrasekaran <sidcha@amazon.de>
To: Alexander Graf <graf@amazon.com>
CC: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Siddharth Chandrasekaran <sidcha.dev@gmail.com>,
 Evgeny Iakovlev <eyakovl@amazon.de>, Liran Alon <liran@amazon.com>, Ioannis
 Aslanidis <iaslan@amazon.de>, <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>
Subject: Re: [PATCH 6/6] hyper-v: Handle hypercall code page as an overlay page
Message-ID: <20210608105521.GB25597@u366d62d47e3651.ant.amazon.com>
References: <cover.1621885749.git.sidcha@amazon.de>
 <8f62de7363c68b52200d864c8e0139221617dba2.1621885749.git.sidcha@amazon.de>
 <7235ab66-8741-efff-727c-74d31089be5b@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7235ab66-8741-efff-727c-74d31089be5b@amazon.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.43.162.147]
X-ClientProxiedBy: EX13D40UWA001.ant.amazon.com (10.43.160.53) To
 EX13D28EUC003.ant.amazon.com (10.43.164.43)
Precedence: Bulk
Received-SPF: pass client-ip=72.21.198.25;
 envelope-from=prvs=7860c40c5=sidcha@amazon.de; helo=smtp-fw-4101.amazon.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Jun 08, 2021 at 11:02:45AM +0200, Alexander Graf wrote:
> On 24.05.21 22:02, Siddharth Chandrasekaran wrote:
> > Hypercall code page is specified in the Hyper-V TLFS to be an overlay
> > page, ie., guest chooses a GPA and the host _places_ a page at that
> > location, making it visible to the guest and the existing page becomes
> > inaccessible. Similarly when disabled, the host should _remove_ the
> > overlay and the old page should become visible to the guest.
> > 
> > Until now, KVM patched the hypercall code directly into the guest
> > chosen GPA which is incorrect; instead, use the new user space MSR
> > filtering feature to trap hypercall page MSR writes, overlay it as
> > requested and then invoke a KVM_SET_MSR from user space to bounce back
> > control KVM. This bounce back is needed as KVM may have to write data
> > into the newly overlaid page.
> > 
> > Signed-off-by: Siddharth Chandrasekaran <sidcha@amazon.de>
> > ---
> >   hw/hyperv/hyperv.c         | 10 ++++-
> >   include/hw/hyperv/hyperv.h |  5 +++
> >   target/i386/kvm/hyperv.c   | 84 ++++++++++++++++++++++++++++++++++++++
> >   target/i386/kvm/hyperv.h   |  4 ++
> >   target/i386/kvm/kvm.c      | 26 +++++++++++-
> >   5 files changed, 127 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/hyperv/hyperv.c b/hw/hyperv/hyperv.c
> > index ac45e8e139..aa5ac5226e 100644
> > --- a/hw/hyperv/hyperv.c
> > +++ b/hw/hyperv/hyperv.c
> > @@ -36,6 +36,7 @@ struct SynICState {
> >   OBJECT_DECLARE_SIMPLE_TYPE(SynICState, SYNIC)
> >   static bool synic_enabled;
> > +struct hyperv_overlay_page hcall_page;
> >   static void alloc_overlay_page(struct hyperv_overlay_page *overlay,
> >                                  Object *owner, const char *name)
> > @@ -50,7 +51,7 @@ static void alloc_overlay_page(struct hyperv_overlay_page *overlay,
> >    * This method must be called with iothread lock taken as it modifies
> >    * the memory hierarchy.
> >    */
> > -static void hyperv_overlay_update(struct hyperv_overlay_page *overlay, hwaddr addr)
> > +void hyperv_overlay_update(struct hyperv_overlay_page *overlay, hwaddr addr)
> >   {
> >       if (addr != HYPERV_INVALID_OVERLAY_GPA) {
> >           /* check if overlay page is enabled */
> > @@ -70,6 +71,13 @@ static void hyperv_overlay_update(struct hyperv_overlay_page *overlay, hwaddr ad
> >       }
> >   }
> > +void hyperv_overlay_init(void)
> > +{
> > +    memory_region_init_ram(&hcall_page.mr, NULL, "hyperv.hcall_page",
> > +                           qemu_real_host_page_size, &error_abort);
> > +    hcall_page.addr = HYPERV_INVALID_OVERLAY_GPA;
> > +}
> > +
> >   static void synic_update(SynICState *synic, bool enable,
> >                            hwaddr msg_page_addr, hwaddr event_page_addr)
> >   {
> > diff --git a/include/hw/hyperv/hyperv.h b/include/hw/hyperv/hyperv.h
> > index d989193e84..f444431a81 100644
> > --- a/include/hw/hyperv/hyperv.h
> > +++ b/include/hw/hyperv/hyperv.h
> > @@ -85,6 +85,11 @@ static inline uint32_t hyperv_vp_index(CPUState *cs)
> >       return cs->cpu_index;
> >   }
> > +extern struct hyperv_overlay_page hcall_page;
> > +
> > +void hyperv_overlay_init(void);
> > +void hyperv_overlay_update(struct hyperv_overlay_page *page, hwaddr addr);
> > +
> >   void hyperv_synic_add(CPUState *cs);
> >   void hyperv_synic_reset(CPUState *cs);
> >   void hyperv_synic_update(CPUState *cs, bool enable,
> > diff --git a/target/i386/kvm/hyperv.c b/target/i386/kvm/hyperv.c
> > index f49ed2621d..01c9c2468c 100644
> > --- a/target/i386/kvm/hyperv.c
> > +++ b/target/i386/kvm/hyperv.c
> > @@ -16,6 +16,76 @@
> >   #include "hyperv.h"
> >   #include "hw/hyperv/hyperv.h"
> >   #include "hyperv-proto.h"
> > +#include "kvm_i386.h"
> > +
> > +struct x86_hv_overlay {
> > +    struct hyperv_overlay_page *page;
> > +    uint32_t msr;
> > +    hwaddr gpa;
> > +};
> > +
> > +static void async_overlay_update(CPUState *cs, run_on_cpu_data data)
> > +{
> > +    X86CPU *cpu = X86_CPU(cs);
> > +    struct x86_hv_overlay *overlay = data.host_ptr;
> > +
> > +    qemu_mutex_lock_iothread();
> > +    hyperv_overlay_update(overlay->page, overlay->gpa);
> > +    qemu_mutex_unlock_iothread();
> > +
> > +    /**
> > +     * Call KVM so it can keep a copy of the MSR data and do other post-overlay
> > +     * actions such as filling the overlay page contents before returning to
> > +     * guest. This works because MSR filtering is inactive for KVM_SET_MSRS
> > +     */
> > +    kvm_put_one_msr(cpu, overlay->msr, overlay->gpa);
> > +
> > +    g_free(overlay);
> > +}
> > +
> > +static void do_overlay_update(X86CPU *cpu, struct hyperv_overlay_page *page,
> > +                              uint32_t msr, uint64_t data)
> > +{
> > +    struct x86_hv_overlay *overlay = g_malloc(sizeof(struct x86_hv_overlay));
> > +
> > +    *overlay = (struct x86_hv_overlay) {
> > +        .page = page,
> > +        .msr = msr,
> > +        .gpa = data
> > +    };
> > +
> > +    /**
> > +     * This will run in this cpu thread before it returns to KVM, but in a
> > +     * safe environment (i.e. when all cpus are quiescent) -- this is
> > +     * necessary because memory hierarchy is being changed
> > +     */
> > +    async_safe_run_on_cpu(CPU(cpu), async_overlay_update,
> > +                          RUN_ON_CPU_HOST_PTR(overlay));
> > +}
> > +
> > +static void overlay_update(X86CPU *cpu, uint32_t msr, uint64_t data)
> > +{
> > +    switch (msr) {
> > +    case HV_X64_MSR_GUEST_OS_ID:
> > +        /**
> > +         * When GUEST_OS_ID is cleared, hypercall overlay should be removed;
> > +         * otherwise it is a NOP. We still need to do a SET_MSR here as the
> > +         * kernel need to keep a copy of data.
> > +         */
> > +        if (data != 0) {
> > +            kvm_put_one_msr(cpu, msr, data);
> > +            return;
> > +        }
> > +        /* Fake a zero write to the overlay page hcall to invalidate the mapping */
> > +        do_overlay_update(cpu, &hcall_page, msr, 0);
> > +        break;
> > +    case HV_X64_MSR_HYPERCALL:
> > +        do_overlay_update(cpu, &hcall_page, msr, data);
> > +        break;
> > +    default:
> > +        return;
> > +    }
> > +}
> >   int hyperv_x86_synic_add(X86CPU *cpu)
> >   {
> > @@ -44,6 +114,20 @@ static void async_synic_update(CPUState *cs, run_on_cpu_data data)
> >       qemu_mutex_unlock_iothread();
> >   }
> > +int kvm_hv_handle_wrmsr(X86CPU *cpu, uint32_t msr, uint64_t data)
> > +{
> > +    switch (msr) {
> > +    case HV_X64_MSR_GUEST_OS_ID:
> > +    case HV_X64_MSR_HYPERCALL:
> > +        overlay_update(cpu, msr, data);
> > +        break;
> > +    default:
> > +        return -1;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >   int kvm_hv_handle_exit(X86CPU *cpu, struct kvm_hyperv_exit *exit)
> >   {
> >       CPUX86State *env = &cpu->env;
> > diff --git a/target/i386/kvm/hyperv.h b/target/i386/kvm/hyperv.h
> > index 67543296c3..8e90fa949f 100644
> > --- a/target/i386/kvm/hyperv.h
> > +++ b/target/i386/kvm/hyperv.h
> > @@ -20,8 +20,12 @@
> >   #ifdef CONFIG_KVM
> >   int kvm_hv_handle_exit(X86CPU *cpu, struct kvm_hyperv_exit *exit);
> > +int kvm_hv_handle_wrmsr(X86CPU *cpu, uint32_t msr, uint64_t data);
> > +
> >   #endif
> > +void hyperv_x86_hcall_page_update(X86CPU *cpu);
> > +
> >   int hyperv_x86_synic_add(X86CPU *cpu);
> >   void hyperv_x86_synic_reset(X86CPU *cpu);
> >   void hyperv_x86_synic_update(X86CPU *cpu);
> > diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> > index 3591f8cecc..bfb9eff440 100644
> > --- a/target/i386/kvm/kvm.c
> > +++ b/target/i386/kvm/kvm.c
> > @@ -2333,6 +2333,10 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
> >           }
> >       }
> > +    if (has_hyperv && msr_filters_active) {
> > +        hyperv_overlay_init();
> > +    }
> > +
> >       return 0;
> >   }
> > @@ -4608,7 +4612,27 @@ static bool host_supports_vmx(void)
> >   static int kvm_handle_wrmsr(X86CPU *cpu, struct kvm_run *run)
> >   {
> > -    return 0;
> > +    int r = -1;
> > +    uint32_t msr;
> > +    uint64_t data;
> > +
> > +    if (run->msr.reason != KVM_MSR_EXIT_REASON_FILTER) {
> > +        return -1;
> > +    }
> > +
> > +    msr = run->msr.index;
> > +    data = run->msr.data;
> > +
> > +    switch (msr) {
> > +    case HV_X64_MSR_GUEST_OS_ID:
> > +    case HV_X64_MSR_HYPERCALL:
> > +        r = kvm_hv_handle_wrmsr(cpu, msr, data);
> > +        break;
> > +    default:
> > +        error_report("Unknown MSR exit");
> > +    }
> > +
> > +    return r;
> 
> I think you can always return 0 here, as long as you set msr.error=1.

Ack, will do that in v2. Thanks for your review.

~ Sid.



Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




