Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8141D2C593C
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 17:25:01 +0100 (CET)
Received: from localhost ([::1]:35832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiK4q-0001DX-3V
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 11:25:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kiK3Q-0000lA-5w
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 11:23:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kiK3N-0002Vo-Pl
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 11:23:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606407807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=88Ilrs/UtaOI/nuaUxZhQsBUeU6nzmFeMf8qZEvQOMs=;
 b=LfO0tElwo7l8ISqTWi/w2Rm+ZcN9GZc8WucG9qXVRCVmIZGeQtaaTwq6FkISk3gI3ZvC8e
 eh+mAKbK3NF9BwK04s/XgANxbXKfPro5IjoK/WMBcSD6Vg0xI7dtTj05OJcLqdzAqp+Vif
 RUnpaz7/8Aic7vXn0UzPg8tLWdWvB2E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-sU0mou_5ORSdcibn0sC3Xw-1; Thu, 26 Nov 2020 11:23:25 -0500
X-MC-Unique: sU0mou_5ORSdcibn0sC3Xw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1197C185E490;
 Thu, 26 Nov 2020 16:23:24 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76E335D6AC;
 Thu, 26 Nov 2020 16:23:22 +0000 (UTC)
Date: Thu, 26 Nov 2020 17:23:20 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-6.0 4/9] spapr: Set compat mode in spapr_reset_vcpu()
Message-ID: <20201126172320.4453fbd7@redhat.com>
In-Reply-To: <20201126101027.03f67ad5@bahia.lan>
References: <20201120234208.683521-1-groug@kaod.org>
 <20201120234208.683521-5-groug@kaod.org>
 <20201123051130.GL521467@yekko.fritz.box>
 <20201123125108.2118048e@bahia.lan>
 <20201125023947.GE521467@yekko.fritz.box>
 <20201125105105.05d25b1f@bahia.lan>
 <20201126045737.GA152349@yekko.fritz.box>
 <20201126101027.03f67ad5@bahia.lan>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Nov 2020 10:10:27 +0100
Greg Kurz <groug@kaod.org> wrote:

> On Thu, 26 Nov 2020 15:57:37 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
> 
> > On Wed, Nov 25, 2020 at 10:51:05AM +0100, Greg Kurz wrote:  
> > > On Wed, 25 Nov 2020 13:39:47 +1100
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >   
> > > > On Mon, Nov 23, 2020 at 12:51:08PM +0100, Greg Kurz wrote:  
> > > > > On Mon, 23 Nov 2020 16:11:30 +1100
> > > > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > > > >   
> > > > > > On Sat, Nov 21, 2020 at 12:42:03AM +0100, Greg Kurz wrote:  
> > > > > > > When it comes to resetting the compat mode of the vCPUS, there are
> > > > > > > two situations to consider:
> > > > > > > (1) machine reset should set the compat mode back to the machine default,
> > > > > > >     ie. spapr->max_compat_pvr
> > > > > > > (2) hot plugged vCPUs should set their compat mode to mach the boot vCPU,
> > > > > > >     ie. POWERPC_CPU(first_cpu)->compat_pvr
> > > > > > > 
> > > > > > > This is currently handled in two separate places: globally for all vCPUs
> > > > > > > from the machine reset code for (1) and for each thread of a core from
> > > > > > > the hotplug path for (2).
> > > > > > > 
> > > > > > > Since the machine reset code already resets all vCPUs, starting with boot
> > > > > > > vCPU, consolidate the logic in spapr_reset_vcpu(). Special case the boot
> > > > > > > vCPU so that it resets its compat mode back to the machine default. Any
> > > > > > > other vCPU just need to match the compat mode of the boot vCPU.
> > > > > > > 
> > > > > > > Failing to set the compat mode during machine reset is a fatal error,
> > > > > > > but not for hot plugged vCPUs. This is arguable because if we've been
> > > > > > > able to set the boot vCPU compat mode at CAS or during machine reset,
> > > > > > > it should definitely not fail for other vCPUs. Since spapr_reset_vcpu()
> > > > > > > already has a fatal error path for kvm_check_mmu() failures, do the
> > > > > > > same for ppc_set_compat().
> > > > > > > 
> > > > > > > This gets rid of an error path in spapr_core_plug(). It will allow
> > > > > > > further simplifications.
> > > > > > > 
> > > > > > > Signed-off-by: Greg Kurz <groug@kaod.org>
> > > > > > > ---
> > > > > > >  hw/ppc/spapr.c          | 16 ----------------
> > > > > > >  hw/ppc/spapr_cpu_core.c | 13 +++++++++++++
> > > > > > >  2 files changed, 13 insertions(+), 16 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > > > > > > index f58f77389e8e..da7586f548df 100644
> > > > > > > --- a/hw/ppc/spapr.c
> > > > > > > +++ b/hw/ppc/spapr.c
> > > > > > > @@ -1606,8 +1606,6 @@ static void spapr_machine_reset(MachineState *machine)
> > > > > > >      spapr_ovec_cleanup(spapr->ov5_cas);
> > > > > > >      spapr->ov5_cas = spapr_ovec_new();
> > > > > > >  
> > > > > > > -    ppc_set_compat_all(spapr->max_compat_pvr, &error_fatal);
> > > > > > > -
> > > > > > >      /*
> > > > > > >       * This is fixing some of the default configuration of the XIVE
> > > > > > >       * devices. To be called after the reset of the machine devices.
> > > > > > > @@ -3785,20 +3783,6 @@ static void spapr_core_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
> > > > > > >  
> > > > > > >      core_slot->cpu = OBJECT(dev);
> > > > > > >  
> > > > > > > -    /*
> > > > > > > -     * Set compatibility mode to match the boot CPU, which was either set
> > > > > > > -     * by the machine reset code or by CAS.
> > > > > > > -     */
> > > > > > > -    if (hotplugged) {
> > > > > > > -        for (i = 0; i < cc->nr_threads; i++) {
> > > > > > > -            if (ppc_set_compat(core->threads[i],
> > > > > > > -                               POWERPC_CPU(first_cpu)->compat_pvr,
> > > > > > > -                               errp) < 0) {
> > > > > > > -                return;
> > > > > > > -            }
> > > > > > > -        }
> > > > > > > -    }
> > > > > > > -
> > > > > > >      if (smc->pre_2_10_has_unused_icps) {
> > > > > > >          for (i = 0; i < cc->nr_threads; i++) {
> > > > > > >              cs = CPU(core->threads[i]);
> > > > > > > diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> > > > > > > index 2f7dc3c23ded..17741a3fb77f 100644
> > > > > > > --- a/hw/ppc/spapr_cpu_core.c
> > > > > > > +++ b/hw/ppc/spapr_cpu_core.c
> > > > > > > @@ -27,6 +27,7 @@
> > > > > > >  
> > > > > > >  static void spapr_reset_vcpu(PowerPCCPU *cpu)
> > > > > > >  {
> > > > > > > +    PowerPCCPU *first_ppc_cpu = POWERPC_CPU(first_cpu);
> > > > > > >      CPUState *cs = CPU(cpu);
> > > > > > >      CPUPPCState *env = &cpu->env;
> > > > > > >      PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
> > > > > > > @@ -69,6 +70,18 @@ static void spapr_reset_vcpu(PowerPCCPU *cpu)
> > > > > > >      kvm_check_mmu(cpu, &error_fatal);
> > > > > > >  
> > > > > > >      spapr_irq_cpu_intc_reset(spapr, cpu);
> > > > > > > +
> > > > > > > +    /*
> > > > > > > +     * The boot CPU is only reset during machine reset : reset its
> > > > > > > +     * compatibility mode to the machine default. For other CPUs,
> > > > > > > +     * either cold plugged or hot plugged, set the compatibility mode
> > > > > > > +     * to match the boot CPU, which was either set by the machine reset
> > > > > > > +     * code or by CAS.
> > > > > > > +     */
> > > > > > > +    ppc_set_compat(cpu,
> > > > > > > +                   cpu == first_ppc_cpu ?
> > > > > > > +                   spapr->max_compat_pvr : first_ppc_cpu->compat_pvr,
> > > > > > > +                   &error_fatal);  
> > > > > > 
> > > > > > This assumes that when it is called for a non-boot CPU, it has already
> > > > > > been called for the boot CPU..  Are we certain that's guaranteed by
> > > > > > the sequence of reset calls during a full machine reset?
> > > > > >   
> > > > > 
> > > > > This happens to be the case. Basically because the boot CPU core
> > > > > is created (including registering its reset handler) first and
> > > > > qemu_devices_reset() calls handlers in the same order they were
> > > > > registered.  
> > > > 
> > > > Right, I assumed it works for now, but it seems rather fragile, since
> > > > I'm not sure we're relying on guaranteed properties of the interface.  
> > > 
> > > The reset handler interface is absolutely undocumented, so I guess we
> > > have no formal guarantees at the present time. But since the current
> > > implementation has the property, would it be acceptable to carve it
> > > in stone with added documentation ? In the event of unlikely changes
> > > to the reset handler logic, people would _just_ need to make sure
> > > handlers are called in the same order they were registered.  
> > 
> > Yeah, maybe.
> > 
> > One other thing occurs to me: will we still do things in the right
> > order if the (initial) boot cpu is hot unplugged, then replugged
> > before a reset?
> >   
> 
> This can't happen AFAICT.
> 
> (qemu) qom-get /machine/unattached/device[1] core-id
> 0
> (qemu) device_del /machine/unattached/device[1]
> Error: Boot CPU core may not be unplugged
> 
> commit 62be8b044adf47327ebefdefb25f28a40316ebd0
> Author: Bharata B Rao <bharata@linux.vnet.ibm.com>
> Date:   Wed Jul 27 10:44:42 2016 +0530
> 
>     spapr: Prevent boot CPU core removal
> 
> 
> So yes, this adds yet another road block on the way to support hot
> unplug of the boot CPU. Is this a concern ?
> 
> If we go forward with this patch, maybe I should mention in the
> changelog/documentation the various assumptions which this patch
> is made under:
> - reset handlers are called in the same order they were registered
> - boot CPU registers its reset handler before other CPUs
> - boot CPU cannot be hot unplugged
> 
> These guarantee that the boot core is always reset before other
> cores during reset.
it might work for now but it seems fragile to me.

What if we  make compat mode a property and move setting it to machine code,
more precisely treat it like any other cpu feature property.
  
 if(need_compat_more)
    register_global_property(compat_mode)

that way when any cpu is created it will have this property set
and it won't depend on the order CPUs are created/reset

> 
> > > > Is there any way we could at least assert() if things are called out
> > > > of order?
> > > >   
> > > 
> > > Maybe. I'll look into it.
> > >   
> > > > >   
> > > > > > >  }
> > > > > > >  
> > > > > > >  void spapr_cpu_set_entry_state(PowerPCCPU *cpu, target_ulong nip,  
> > > > > >   
> > > > >   
> > > > 
> > > > 
> > > >   
> > >   
> > 
> > 
> >   
> 


