Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E13EB1553A5
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 09:21:10 +0100 (CET)
Received: from localhost ([::1]:51908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izysw-0006c5-0b
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 03:21:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47941)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1izyru-0005mZ-O2
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 03:20:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1izyrs-0003cR-CI
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 03:20:06 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:28956
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1izyrs-0003cK-5L
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 03:20:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581063603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T3JoJ3fTtYOaVtBeDHg/6D0wPhwuYbo/FU209zVHOA0=;
 b=LQHZjrQoerGvRgCxt/ly0rNHfq2nrhZQ/J/Kz1YzIKUSzbJ/BJOHBE0WMyDQp98LwMgysO
 MbAlvVsJbO1yVwSivezErg8KwDFq81L96HXLfLusqJJdBejSInmSIrN09mi00zCsZR2azj
 ecbqS3KrZ+BjiPz+l6Okj89Pta6a0Nc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-4r0D7zj8P9Kj5vGrqgDEdA-1; Fri, 07 Feb 2020 03:19:56 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0D8085EE6B;
 Fri,  7 Feb 2020 08:19:54 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B5EB26186;
 Fri,  7 Feb 2020 08:19:52 +0000 (UTC)
Date: Fri, 7 Feb 2020 09:19:50 +0100
From: Andrew Jones <drjones@redhat.com>
To: Beata Michalska <beata.michalska@linaro.org>
Subject: Re: [PATCH v2 2/2] target/arm: kvm: Handle DABT with no valid ISS
Message-ID: <20200207081950.4gxxlzwgjgfr6zur@kamzik.brq.redhat.com>
References: <20200129202441.12745-1-beata.michalska@linaro.org>
 <20200129202441.12745-3-beata.michalska@linaro.org>
 <20200205165739.2jkklbpmy3yrdq3q@kamzik.brq.redhat.com>
 <CADSWDzu70AXg5pNY3sLr5GFbKtXaFmV_UgSm6TWw7oshv4vcEw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADSWDzu70AXg5pNY3sLr5GFbKtXaFmV_UgSm6TWw7oshv4vcEw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 4r0D7zj8P9Kj5vGrqgDEdA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Christoffer Dall <Christoffer.Dall@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 06, 2020 at 09:48:05PM +0000, Beata Michalska wrote:
> On Wed, 5 Feb 2020 at 16:57, Andrew Jones <drjones@redhat.com> wrote:
> >
> > On Wed, Jan 29, 2020 at 08:24:41PM +0000, Beata Michalska wrote:
> > > On ARMv7 & ARMv8 some load/store instructions might trigger a data ab=
ort
> > > exception with no valid ISS info to be decoded. The lack of decode in=
fo
> > > makes it at least tricky to emulate those instruction which is one of=
 the
> > > (many) reasons why KVM will not even try to do so.
> > >
> > > Add support for handling those by requesting KVM to inject external
> > > dabt into the quest.
> > >
> > > Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
> > > ---
> > >  target/arm/cpu.h     |  2 ++
> > >  target/arm/kvm.c     | 96 ++++++++++++++++++++++++++++++++++++++++++=
++++++++++
> > >  target/arm/kvm32.c   |  3 ++
> > >  target/arm/kvm64.c   |  3 ++
> > >  target/arm/kvm_arm.h | 19 +++++++++++
> > >  5 files changed, 123 insertions(+)
> > >
> > > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > > index c1aedbe..e04a8d3 100644
> > > --- a/target/arm/cpu.h
> > > +++ b/target/arm/cpu.h
> > > @@ -558,6 +558,8 @@ typedef struct CPUARMState {
> > >          uint8_t has_esr;
> > >          uint64_t esr;
> > >      } serror;
> > > +    /* Status field for pending external dabt */
> > > +    uint8_t ext_dabt_pending;
> > >
> > >      /* State of our input IRQ/FIQ/VIRQ/VFIQ lines */
> > >      uint32_t irq_line_state;
> > > diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> > > index 8d82889..e7bc9b7 100644
> > > --- a/target/arm/kvm.c
> > > +++ b/target/arm/kvm.c
> > > @@ -37,6 +37,7 @@ const KVMCapabilityInfo kvm_arch_required_capabilit=
ies[] =3D {
> > >
> > >  static bool cap_has_mp_state;
> > >  static bool cap_has_inject_serror_esr;
> > > +static bool cap_has_inject_ext_dabt; /* KVM_CAP_ARM_INJECT_EXT_DABT =
*/
> >
> > nit: the KVM_CAP_ARM_INJECT_EXT_DABT comment is unnecessary
>=20
> Might be - I just find it handy when looking for  related details.
> I will remove that one though.
>=20
> >
> > >
> > >  static ARMHostCPUFeatures arm_host_cpu_features;
> > >
> > > @@ -62,6 +63,12 @@ void kvm_arm_init_serror_injection(CPUState *cs)
> > >                                      KVM_CAP_ARM_INJECT_SERROR_ESR);
> > >  }
> > >
> > > +void kvm_arm_init_ext_dabt_injection(CPUState *cs)
> > > +{
> > > +    cap_has_inject_ext_dabt =3D kvm_check_extension(cs->kvm_state,
> > > +                                    KVM_CAP_ARM_INJECT_EXT_DABT);
> > > +}
> > > +
> > >  bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
> > >                                        int *fdarray,
> > >                                        struct kvm_vcpu_init *init)
> > > @@ -216,6 +223,11 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
> > >          ret =3D -EINVAL;
> > >      }
> > >
> > > +    if (kvm_check_extension(s, KVM_CAP_ARM_NISV_TO_USER))
> > > +        if (kvm_vm_enable_cap(s, KVM_CAP_ARM_NISV_TO_USER, 0)) {
> > > +            warn_report("Failed to enable DABT NISV cap");
> > > +        }
> > > +
> >
> > Missing {} around the outer block.
>=20
> Checkpatch didn't complain ...
> Will fix that.
>=20
> >
> > As KVM_CAP_ARM_INJECT_EXT_DABT is a VM capability then I think we shoul=
d
> > set cap_has_inject_ext_dabt here, like cap_has_mp_state gets set. I see
> > you've followed the pattern used for cap_has_inject_serror_esr, but tha=
t
> > looks wrong too since KVM_CAP_ARM_INJECT_SERROR_ESR is also a VM
> > capability. The way it is now we just keep setting
> > cap_has_inject_serror_esr to the same value, NR_VCPUS times.
> >
> You are totally right - I have completely missed that point! Thanks.
>=20
> > >      return ret;
> > >  }
> > >
> > > @@ -598,6 +610,10 @@ int kvm_put_vcpu_events(ARMCPU *cpu)
> > >          events.exception.serror_esr =3D env->serror.esr;
> > >      }
> > >
> > > +    if (cap_has_inject_ext_dabt) {
> > > +        events.exception.ext_dabt_pending =3D env->ext_dabt_pending;
> > > +    }
> > > +
> > >      ret =3D kvm_vcpu_ioctl(CPU(cpu), KVM_SET_VCPU_EVENTS, &events);
> > >      if (ret) {
> > >          error_report("failed to put vcpu events");
> > > @@ -627,6 +643,8 @@ int kvm_get_vcpu_events(ARMCPU *cpu)
> > >      env->serror.has_esr =3D events.exception.serror_has_esr;
> > >      env->serror.esr =3D events.exception.serror_esr;
> > >
> > > +    env->ext_dabt_pending =3D events.exception.ext_dabt_pending;
> > > +
> >
> > afaict from Documentation/virt/kvm/api.txt and the KVM code you cannot
> > get this state. Therefore the above line (and extra stray blank line)
> > should be dropped.
> >
> That's true, though this is a lightweight way of resetting the vcpu state=
.
> We would have to do that otherwise to mark that this case has been handle=
d
> and that the abort is no longer pending.

There's no reason to wait until get-vcpu-events time to reset this.
According to the KVM documentation (and the code) the event is
immediately delivered at vcpu_ioctl(KVM_SET_VCPU_EVENTS) time.
So I think the kvm_put_vcpu_events() patch should be

 if (env->ext_dabt_pending) {
     events.exception.ext_dabt_pending =3D env->ext_dabt_pending;
     env->ext_dabt_pending =3D 0;
 }

(env->ext_dabt_pending will only be non-zero if we have the capability)

>=20
> > >      return 0;
> > >  }
> > >
> > > @@ -634,6 +652,7 @@ void kvm_arch_pre_run(CPUState *cs, struct kvm_ru=
n *run)
> > >  {
> > >  }
> > >
> > > +
> >
> > stray blank line
> >
> > >  MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
> > >  {
> > >      ARMCPU *cpu;
> > > @@ -699,6 +718,11 @@ int kvm_arch_handle_exit(CPUState *cs, struct kv=
m_run *run)
> > >              ret =3D EXCP_DEBUG;
> > >          } /* otherwise return to guest */
> > >          break;
> > > +    case KVM_EXIT_ARM_NISV:
> > > +        /* External DABT with no valid iss to decode */
> > > +        ret =3D kvm_arm_handle_dabt_nisv(cs, run->arm_nisv.esr_iss,
> > > +                                       run->arm_nisv.fault_ipa);
> > > +        break;
> > >      default:
> > >          qemu_log_mask(LOG_UNIMP, "%s: un-handled exit reason %d\n",
> > >                        __func__, run->exit_reason);
> > > @@ -833,3 +857,75 @@ int kvm_arch_msi_data_to_gsi(uint32_t data)
> > >  {
> > >      return (data - 32) & 0xffff;
> > >  }
> > > +
> > > +int kvm_arm_handle_dabt_nisv(CPUState *cs, uint64_t esr_iss,
> > > +                             uint64_t fault_ipa)
> > > +{
> > > +    ARMCPU *cpu =3D ARM_CPU(cs);
> > > +    CPUARMState *env =3D &cpu->env;
> > > +    uint32_t ins, ins_fetched;
> >
> > ins_fetched is a bool
>=20
> Actually that's int (as per cpu_memory_rw_debug)

But that's not the way you're using it here. It you really want to
ensure the return value is converted to a bool, then you could do

 ins_fetched =3D !!cpu_memory_rw_debug()

> >
> > > +
> > > +    /*
> > > +     * Hacky workaround for kernels that for aarch32 guests, instead=
 of expected
> > > +     * external data abort, inject the IMPLEMENTATION DEFINED except=
ion with the
> > > +     * lock-down. This is actually handled by the guest which result=
s in
> > > +     * re-running the faulting instruction.
> > > +     * This intends to break the vicious cycle.
> > > +     */
> >
> > This doesn't seem like the right thing to do. What happens on real
> > hardware in this case? If an OS would get into a "vicious cycle" on
> > real hardware then it should get into one on KVM too.
> >
> That's the problem. that would not happen on a real hardware.
> We might end up here due to a KVM bug (which has been fixed recently)
> when the injected
> abort is not the one expected (as of not the one that would be
> triggered by hw in this
> particular case).
> Details in : https://patchwork.kernel.org/patch/11358083/

If KVM can be fixed (and in this case already is fixed - 21aecdbd7f3a),
then doesn't it make more sense to just fix KVM, than to add a workaround
to QEMU?

>=20
> > > +    if (!is_a64(env)) {
> > > +        static uint8_t setback;
> > > +
> > > +        /*
> > > +         * The state has not been synchronized yet, so if this is re=
-occurrence
> > > +         * of the same abort triggered by guest, the status for pend=
ing external
> > > +         * abort should not get cleared yet
> > > +         */
> > > +        if (unlikely(env->ext_dabt_pending)) {
> > > +            if (setback) {
> > > +                error_report("Most probably triggered kernel issue w=
ith"
> > > +                             " injecting external data abort.");
> > > +                error_printf("Giving up trying ...\n");
> > > +                /* Here is where the fun comes to an end */
> > > +                return -EINVAL;
> > > +            }
> > > +        }
> > > +        setback =3D env->ext_dabt_pending;
> > > +    }
> > > +
> > > +    kvm_cpu_synchronize_state(cs);
> > > +   /*
> > > +    * ISS [23:14] is invalid so there is a limited info
> > > +    * on what has just happened so the only *useful* thing that can
> > > +    * be retrieved from ISS is WnR & DFSC (though in some cases WnR
> > > +    * might be less of a value as well)
> > > +    */
> > > +
> > > +    /*
> > > +     * Get current PC before it will get updated to exception vector=
 entry
> > > +     */
> > > +    target_ulong ins_addr =3D is_a64(env) ? env->pc : env->regs[15];
> >
> > ins_addr should be declared above
> >
> > But what are we doing? pc is a guest virtual address. Oh, I see...
> >
> > > +
> > > +    /*
> > > +     * Get the faulting instruction
> > > +     * Instructions have a fixed length of 32 bits
> > > +     * and are always little-endian
> > > +     */
> > > +    ins_fetched =3D !cpu_memory_rw_debug(cs, ins_addr, (uint8_t *) &=
ins,
> > > +                                       sizeof(uint32_t), 0);
> >
> > ... we're trying to actual walk the KVM guest's page tables. That
> > seems a bit odd, and the "_debug" function name used for it makes
> > it seem even more odd.
> >
> > > +
> > > +    error_report("Data abort exception with no valid ISS generated b=
y "
> > > +                 "guest memory access at physical address: 0x" TARGE=
T_FMT_lx,
> > > +                 (target_ulong)fault_ipa);
> > > +
> > > +    error_printf(ins_fetched ? "%s : 0x%" PRIx32 " (ins encoded)\n" =
 : "%s\n",
> > > +                 "KVM unable to emulate faulting instruction",
> > > +                 (!ins_fetched ? 0 : ldl_le_p(&ins)));
> > > +    error_printf("Injecting a data abort exception into guest.\n");
> >
> > The guest shouldn't be able to generate three lines of errors on the ho=
st
> > whenever it wants. That's a security bug. One trace point here seems li=
ke
> > the most we should do. Or, after these three lines we should kill the
> > guest.
> >
> You have a point here, this can indeed be exploited by the malicious
> guest. Not sure if killing it is necessary here.
> I could limit the logging though that gets tricky for aborts triggered by
> user-space processes which would probably leave the guest running
> without much of an issue there.
> I can y get rid of logging the additional info and keep the single
> statement of an instruction not being emulated but that still leaves an
> open door for potential exploits...
>=20
> > Actually, I don't think we should attempt to get the instruction at all=
.
> > We should do what the KVM documenation suggests we do when we get
> > this exit. We should either do a user selected action: one of suspend,
> > dump, restart, or inject a dabt (as is done below). The last choice hop=
es
> > that the guest will handle it in some graceful way, or that it'll crash
> > with all the information needed for a post-mortem crash investigation.
> >
> > And I don't think we should do the "very brave" option of trying to
> > emulate the instruction, even if we identify it as a valid MMIO address=
.
> > That just sounds like a huge can of worms.
> >
> > Does QEMU already have a way for users to select a
> > don't-know-how-to-handle-guest-exception behavior?
> >
>=20
> The function is attempting to inject the external data abort. The rest is=
 for
> the aftermath analysis to easy figuring out what has happened
> which will not be so easy in case of user-space process triggering
> the DABT with no valid ISS. There is no attempt of emulating the instruct=
ion
> just simply saying the guest tried to access this address with this instr=
uction
> which couldn't be handled. Might be excessive in some cases
> (like misbehaving kernel) but it also might be handy on those rare
> occasions when there is not much to analyze.
> But as per the issue you have raised above I will rework that.
>=20
> Not sure if there is a mechanism to specify the 'preferred' behavior thou=
gh.

I think a mechanism for a preferred behavior would be nice, because
all options make sense, depending on the use case. I'm not sure what
the right default is, though. Maybe this dabt injection, but there's
a good chance it'll just loop here. So maybe QEMU should just abort.
Aborting should be the safest default (from the host's PoV).

Thanks,
drew


>=20
> BR
>=20
>=20
> Beata
>=20
>=20
> > > +    /*
> > > +     * Set pending ext dabt and trigger SET_EVENTS so that
> > > +     * KVM can inject the abort
> > > +     */
> > > +    env->ext_dabt_pending =3D 1;
> > > +
> > > +    return 0;
> > > +}
> >
> > Thanks,
> > drew
> >
>=20


