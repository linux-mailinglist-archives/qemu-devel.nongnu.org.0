Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B7A2C695F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 17:28:02 +0100 (CET)
Received: from localhost ([::1]:33682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kigbJ-0002eD-5i
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 11:28:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kiga1-000253-GU
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 11:26:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kigZy-0001iR-Vs
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 11:26:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606494397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TrvBDi9yZGeY5Vbt3RGNQX372OakVVQv1ebR/1++2uo=;
 b=VX+oFksGoEh8uZ8twUXOFC97kptTlutX9Ar705Gk7jVNeCCx9CAp0P3pFHVzgk26OINB+Y
 ljW2iCMmfH0mf4FBr7dkALwcdT+wBeM55/ANvmhb5pVRANbjt3RnG9yDpIIzhA2XgSUav7
 8u/jXnAfwPxTiU315w1GW6QUnMg1Wnk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-jiQkH88kN--0iwqy45zqVA-1; Fri, 27 Nov 2020 11:26:36 -0500
X-MC-Unique: jiQkH88kN--0iwqy45zqVA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2FD910066FC;
 Fri, 27 Nov 2020 16:26:34 +0000 (UTC)
Received: from localhost (unknown [10.10.67.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 395495C1C2;
 Fri, 27 Nov 2020 16:26:34 +0000 (UTC)
Date: Fri, 27 Nov 2020 11:26:33 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 8/8] hw/arm/virt: Disable highmem when on
 hypervisor.framework
Message-ID: <20201127162633.GY2271382@habkost.net>
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-9-agraf@csgraf.de>
 <20201126221405.GT2271382@habkost.net>
 <CAFEAcA_Nc0Jp-3PPigt1YdqHfNhGToovCOO16DOPPC9Bt663qg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_Nc0Jp-3PPigt1YdqHfNhGToovCOO16DOPPC9Bt663qg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Claudio Fontana <cfontana@suse.de>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 26, 2020 at 10:29:01PM +0000, Peter Maydell wrote:
> On Thu, 26 Nov 2020 at 22:14, Eduardo Habkost <ehabkost@redhat.com> wrote:
> >
> > On Thu, Nov 26, 2020 at 10:50:17PM +0100, Alexander Graf wrote:
> > > The Apple M1 only supports up to 36 bits of physical address space. That
> > > means we can not fit the 64bit MMIO BAR region into our address space.
> > >
> > > To fix this, let's not expose a 64bit MMIO BAR region when running on
> > > Apple Silicon.
> > >
> > > I have not been able to find a way to enumerate that easily, so let's
> > > just assume we always have that little PA space on hypervisor.framework
> > > systems.
> > >
> > > Signed-off-by: Alexander Graf <agraf@csgraf.de>
> > > ---
> > >  hw/arm/virt.c | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > > index 27dbeb549e..d74053ecd4 100644
> > > --- a/hw/arm/virt.c
> > > +++ b/hw/arm/virt.c
> > > @@ -45,6 +45,7 @@
> > >  #include "hw/display/ramfb.h"
> > >  #include "net/net.h"
> > >  #include "sysemu/device_tree.h"
> > > +#include "sysemu/hvf.h"
> > >  #include "sysemu/numa.h"
> > >  #include "sysemu/runstate.h"
> > >  #include "sysemu/sysemu.h"
> > > @@ -1746,6 +1747,14 @@ static void machvirt_init(MachineState *machine)
> > >      unsigned int smp_cpus = machine->smp.cpus;
> > >      unsigned int max_cpus = machine->smp.max_cpus;
> > >
> > > +    /*
> > > +     * On Hypervisor.framework capable systems, we only have 36 bits of PA
> > > +     * space, which is not enough to fit a 64bit BAR space
> > > +     */
> > > +    if (hvf_enabled()) {
> > > +        vms->highmem = false;
> > > +    }
> >
> > Direct checks for *_enabled() are a pain to clean up later when
> > we add support to new accelerators.  Can't this be implemented as
> > (e.g.) a AccelClass::max_physical_address_bits field?
> 
> It's a property of the CPU (eg our emulated TCG CPUs may have
> varying supported numbers of physical address bits). So the
> virt board ought to look at the CPU, and the CPU should be
> set up with the right information for all of KVM, TCG, HVF
> (either a specific max_phys_addr_bits value or just ensure
> its ID_AA64MMFR0_EL1.PARange is right, not sure which would
> be easier/nicer).

Agreed.

My suggestion would still apply to the CPU code that will pick
the address size; ideally, accel-specific behaviour should be
represented as meaningful fields in AccelClass (either data or
virtual methods) instead of direct *_enabled() checks.

-- 
Eduardo


