Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 026EA3894D2
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 19:54:13 +0200 (CEST)
Received: from localhost ([::1]:49436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljQOZ-0008Ak-Qi
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 13:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ljQNJ-0006wl-54
 for qemu-devel@nongnu.org; Wed, 19 May 2021 13:52:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ljQNG-0001kC-SW
 for qemu-devel@nongnu.org; Wed, 19 May 2021 13:52:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621446769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZBGx9Xswh4Fpkgj59nd1ygI8NwG/mh+Yy6cKVBWlQ2s=;
 b=eUd0oHTbKl1+SK1AinB8HFvwFjUWykLhON378QNzk/l+HCSAdejz08M6RxrBpbT9fi1gDe
 OCMtaEsEiI+Bd1966bRbyiResUCj488BMm6mDfiRICf478VgimR2JFzkPFQ8Cq6AhDL7N4
 veLVNnVWj/qKP0mI2Re+kSbYiMazJMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-5kxllunlPEua3q0uS4O4Iw-1; Wed, 19 May 2021 13:52:46 -0400
X-MC-Unique: 5kxllunlPEua3q0uS4O4Iw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED07E100C61E;
 Wed, 19 May 2021 17:52:45 +0000 (UTC)
Received: from localhost (ovpn-119-37.rdu2.redhat.com [10.10.119.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62C9660BF1;
 Wed, 19 May 2021 17:52:42 +0000 (UTC)
Date: Wed, 19 May 2021 08:08:27 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Chenyi Qiang <chenyi.qiang@intel.com>
Subject: Re: [PATCH v3] i386: Add ratelimit for bus locks acquired in guest
Message-ID: <20210519120827.ojd7jjqtuepel3au@habkost.net>
References: <20210430103305.28849-1-chenyi.qiang@intel.com>
 <20210517194629.k4aff57k74lukywd@habkost.net>
 <db3234a1-5bf2-de6e-c40d-93b6398bafba@intel.com>
MIME-Version: 1.0
In-Reply-To: <db3234a1-5bf2-de6e-c40d-93b6398bafba@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIMWL_WL_HIGH=-0.39, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 19, 2021 at 06:00:18PM +0800, Chenyi Qiang wrote:
> 
> 
> On 5/18/2021 3:46 AM, Eduardo Habkost wrote:
> > +Stefan
> > 
> > I have a question about ratelimit_set_speed() below:
> > 
> > On Fri, Apr 30, 2021 at 06:33:05PM +0800, Chenyi Qiang wrote:
> > > A bus lock is acquired through either split locked access to writeback
> > > (WB) memory or any locked access to non-WB memory. It is typically >1000
> > > cycles slower than an atomic operation within a cache and can also
> > > disrupts performance on other cores.
> > > 
> > > Virtual Machines can exploit bus locks to degrade the performance of
> > > system. To address this kind of performance DOS attack coming from the
> > > VMs, bus lock VM exit is introduced in KVM and it can report the bus
> > > locks detected in guest. If enabled in KVM, it would exit to the
> > > userspace to let the user enforce throttling policies once bus locks
> > > acquired in VMs.
> > > 
> > > The availability of bus lock VM exit can be detected through the
> > > KVM_CAP_X86_BUS_LOCK_EXIT. The returned bitmap contains the potential
> > > policies supported by KVM. The field KVM_BUS_LOCK_DETECTION_EXIT in
> > > bitmap is the only supported strategy at present. It indicates that KVM
> > > will exit to userspace to handle the bus locks.
> > > 
> > > This patch adds a ratelimit on the bus locks acquired in guest as a
> > > mitigation policy.
> > > 
> > > Introduce a new field "bus_lock_ratelimit" to record the limited speed
> > > of bus locks in the target VM. The user can specify it through the
> > > "bus-lock-ratelimit" as a machine property. In current implementation,
> > > the default value of the speed is 0 per second, which means no
> > > restrictions on the bus locks
> > > 
> > > As for ratelimit on detected bus locks, simply set the ratelimit
> > > interval to 1s and restrict the quota of bus lock occurence to the value
> > > of "bus_lock_ratelimit". A potential alternative is to introduce the
> > > time slice as a property which can help the user achieve more precise
> > > control.
> > > 
> > > The detail of Bus lock VM exit can be found in spec:
> > > https://software.intel.com/content/www/us/en/develop/download/intel-architecture-instruction-set-extensions-programming-reference.html
> > > 
> > > Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
> > > 
> > > ---
> > > Changes from v2:
> > >    - do some rename work (bus-lock-ratelimit and BUS_LOCK_TIME_SLICE).
> > >      (Eduardo)
> > >    - change to register a class property at the x86_machine_class_init()
> > >      and write the gettter/setter for the bus_lock_ratelimit property.
> > >      (Eduardo)
> > >    - add the lock to access the Ratelimit instance to avoid vcpu thread
> > >      race condition. (Eduardo)
> > >    - v2: https://lore.kernel.org/qemu-devel/20210420093736.17613-1-chenyi.qiang@intel.com/
> > > 
> > > Changes from RFC v1:
> > >    - Remove the rip info output, as the rip can't reflect the bus lock
> > >      position correctly. (Xiaoyao)
> > >    - RFC v1: https://lore.kernel.org/qemu-devel/20210317084709.15605-1-chenyi.qiang@intel.com/
> > [...]
> > > diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
> > > index c09b648dff..49b130a649 100644
> > > --- a/include/hw/i386/x86.h
> > > +++ b/include/hw/i386/x86.h
> > > @@ -74,12 +74,21 @@ struct X86MachineState {
> > >        * will be translated to MSI messages in the address space.
> > >        */
> > >       AddressSpace *ioapic_as;
> > > +
> > > +    /*
> > > +     * Ratelimit enforced on detected bus locks in guest.
> > > +     * The default value of the bus_lock_ratelimit is 0 per second,
> > > +     * which means no limitation on the guest's bus locks.
> > > +     */
> > > +    uint64_t bus_lock_ratelimit;
> > > +    RateLimit bus_lock_ratelimit_ctrl;
> > >   };
> > >   #define X86_MACHINE_SMM              "smm"
> > >   #define X86_MACHINE_ACPI             "acpi"
> > >   #define X86_MACHINE_OEM_ID           "x-oem-id"
> > >   #define X86_MACHINE_OEM_TABLE_ID     "x-oem-table-id"
> > > +#define X86_MACHINE_BUS_LOCK_RATELIMIT  "bus-lock-ratelimit"
> > >   #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
> > >   OBJECT_DECLARE_TYPE(X86MachineState, X86MachineClass, X86_MACHINE)
> > > diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> > > index 7fe9f52710..19b6c4a7e8 100644
> > > --- a/target/i386/kvm/kvm.c
> > > +++ b/target/i386/kvm/kvm.c
> > > @@ -130,6 +130,9 @@ static bool has_msr_mcg_ext_ctl;
> > >   static struct kvm_cpuid2 *cpuid_cache;
> > >   static struct kvm_msr_list *kvm_feature_msrs;
> > > +#define BUS_LOCK_SLICE_TIME 1000000000ULL /* ns */
> > > +static QemuMutex bus_lock_ratelimit_lock;
> > > +
> > >   int kvm_has_pit_state2(void)
> > >   {
> > >       return has_pit_state2;
> > > @@ -2267,6 +2270,28 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
> > >           }
> > >       }
> > > +    if (object_dynamic_cast(OBJECT(ms), TYPE_X86_MACHINE)) {
> > > +        X86MachineState *x86ms = X86_MACHINE(ms);
> > > +
> > > +        if (x86ms->bus_lock_ratelimit > 0) {
> > > +            ret = kvm_check_extension(s, KVM_CAP_X86_BUS_LOCK_EXIT);
> > > +            if (!(ret & KVM_BUS_LOCK_DETECTION_EXIT)) {
> > > +                error_report("kvm: bus lock detection unsupported");
> > > +                return -ENOTSUP;
> > > +            }
> > > +            ret = kvm_vm_enable_cap(s, KVM_CAP_X86_BUS_LOCK_EXIT, 0,
> > > +                                    KVM_BUS_LOCK_DETECTION_EXIT);
> > > +            if (ret < 0) {
> > > +                error_report("kvm: Failed to enable bus lock detection cap: %s",
> > > +                             strerror(-ret));
> > > +                return ret;
> > > +            }
> > > +            qemu_mutex_init(&bus_lock_ratelimit_lock);
> > > +            ratelimit_set_speed(&x86ms->bus_lock_ratelimit_ctrl, x86ms->bus_lock_ratelimit,
> > > +                                BUS_LOCK_SLICE_TIME);
> > > +        }
> > > +    }
> > > +
> > >       return 0;
> > >   }
> > > @@ -4221,6 +4246,20 @@ void kvm_arch_pre_run(CPUState *cpu, struct kvm_run *run)
> > >       }
> > >   }
> > > +static void kvm_rate_limit_on_bus_lock(void)
> > > +{
> > > +    MachineState *ms = MACHINE(qdev_get_machine());
> > 
> > qdev_get_machine() seems thread safe except for the first call,
> > but it's not documented as such.
> > 
> > Until it is documented as thread safe (which could take a while,
> > considering that there are ongoing attempts to clean it up), I
> > would avoid calling without the BQL, just in case.
> > 
> 
> OK, I would add the BQL here.

My suggestion was to avoid calling qdev_get_machine() at all, so
you don't need the BQL.  The static variable mentioned below
would solve this.

> 
> > > +    X86MachineState *x86ms = X86_MACHINE(ms);
> > > +
> > > +    qemu_mutex_lock(&bus_lock_ratelimit_lock);
> > > +    uint64_t delay_ns = ratelimit_calculate_delay(&x86ms->bus_lock_ratelimit_ctrl, 1);
> > > +    qemu_mutex_unlock(&bus_lock_ratelimit_lock);
> > 
> > Stefan, ratelimit_calculate_delay() is supposed to be thread
> > safe, correct?
> > 
> > In that case, bus_lock_ratelimit_lock would be completely unnecessary.
> > 
> 
> Will remove it.
> 
> > I normally prefer to avoid static variables, but in this case a
> > 
> >     static RateLimit bus_lock_ratelimit_ctrl;
> > 
> > variable could be the simplest solution here.
> > 
> 
> Yes, static variable is simpler. will change it if acceptable.

Thanks.

The static variable sounds good enough to me, despite not being
the ideal solution.  Maybe other people have suggestions.

Note: don't forget to call ratelimit_init(), which is a new
requirement of the ratelimit API added by commit 4951967d84a0
("ratelimit: protect with a mutex").


> 
> > 
> > > +
> > > +    if (delay_ns) {
> > > +        g_usleep(delay_ns / SCALE_US);
> > > +    }
> > > +}
> > > +
> > >   MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
> > >   {
> > >       X86CPU *x86_cpu = X86_CPU(cpu);
> > > @@ -4236,6 +4275,9 @@ MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
> > >       } else {
> > >           env->eflags &= ~IF_MASK;
> > >       }
> > > +    if (run->flags & KVM_RUN_X86_BUS_LOCK) {
> > > +        kvm_rate_limit_on_bus_lock();
> > > +    }
> > >       /* We need to protect the apic state against concurrent accesses from
> > >        * different threads in case the userspace irqchip is used. */
> > > @@ -4594,6 +4636,10 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
> > >           ioapic_eoi_broadcast(run->eoi.vector);
> > >           ret = 0;
> > >           break;
> > > +    case KVM_EXIT_X86_BUS_LOCK:
> > > +        /* already handled in kvm_arch_post_run */
> > > +        ret = 0;
> > > +        break;
> > >       default:
> > >           fprintf(stderr, "KVM: unknown exit reason %d\n", run->exit_reason);
> > >           ret = -1;
> > > -- 
> > > 2.17.1
> > > 
> > 
> 

-- 
Eduardo


