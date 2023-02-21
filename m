Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AD969DF36
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 12:47:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUR62-00052e-NI; Tue, 21 Feb 2023 06:46:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUR5z-00051Z-6Z
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:46:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUR5v-0001N5-Nz
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:46:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676979962;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ll50IUA6DikFcVDu7oK6Hv5H9T+vTlPWWj6lHX6sOHQ=;
 b=ZyJ7vMz9EUHkSZKRbooY1CL2qKtn3FXw1YFqYTPY1P6DJ6YYwHum6/LN6DRtIurx+nIQHR
 8TumxZ4McQRTXGJgpxptjbqDoTAGRKxK4ar+zLbL2J807Ex8ln8BTEwU3a6WaPB3uCxCLT
 a96fAZa44Y4PvlWGAelFOAVhvpedOi8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-W1ikLYC1MC2tAEfy6lYIMg-1; Tue, 21 Feb 2023 06:45:59 -0500
X-MC-Unique: W1ikLYC1MC2tAEfy6lYIMg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0E0D802314;
 Tue, 21 Feb 2023 11:45:58 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CFD47C15BA0;
 Tue, 21 Feb 2023 11:45:55 +0000 (UTC)
Date: Tue, 21 Feb 2023 11:45:53 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Bernhard Beschow <shentey@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-ppc@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>
Subject: Re: [PATCH v2 07/18] hw/ide/piix: Ensure IDE output IRQs are wired
 at realization
Message-ID: <Y/Su8eB2nIO0INOX@redhat.com>
References: <20230215161641.32663-1-philmd@linaro.org>
 <20230215161641.32663-8-philmd@linaro.org>
 <CAG4p6K6zMEMT07qDzPyEgc1F+FPp-AHyhgZWRhYAaJsfOUZD=g@mail.gmail.com>
 <0350214d-fd70-4d24-8db8-66185f5d6780@linaro.org>
 <666316cf-6f1e-8f62-dab7-8b0da698faa7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <666316cf-6f1e-8f62-dab7-8b0da698faa7@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, Feb 19, 2023 at 10:54:34PM +0100, Philippe Mathieu-Daudé wrote:
> +Daniel, Igor, Marcel & libvirt
> 
> On 16/2/23 16:33, Philippe Mathieu-Daudé wrote:
> > On 16/2/23 15:43, Bernhard Beschow wrote:
> > > 
> > > 
> > > On Wed, Feb 15, 2023 at 5:20 PM Philippe Mathieu-Daudé
> > > <philmd@linaro.org <mailto:philmd@linaro.org>> wrote:
> > > 
> > >     Ensure both IDE output IRQ lines are wired.
> > > 
> > >     We can remove the last use of isa_get_irq(NULL).
> > > 
> > >     Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org
> > >     <mailto:philmd@linaro.org>>
> > >     ---
> > >       hw/ide/piix.c | 13 ++++++++-----
> > >       1 file changed, 8 insertions(+), 5 deletions(-)
> > > 
> > >     diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> > >     index 9d876dd4a7..b75a4ddcca 100644
> > >     --- a/hw/ide/piix.c
> > >     +++ b/hw/ide/piix.c
> > >     @@ -133,14 +133,17 @@ static bool pci_piix_init_bus(PCIIDEState *d,
> > >     unsigned i, Error **errp)
> > >           static const struct {
> > >               int iobase;
> > >               int iobase2;
> > >     -        int isairq;
> > >           } port_info[] = {
> > >     -        {0x1f0, 0x3f6, 14},
> > >     -        {0x170, 0x376, 15},
> > >     +        {0x1f0, 0x3f6},
> > >     +        {0x170, 0x376},
> > >           };
> > >           int ret;
> > > 
> > >     -    qemu_irq irq_out = d->irq[i] ? : isa_get_irq(NULL,
> > >     port_info[i].isairq);
> > >     +    if (!d->irq[i]) {
> > >     +        error_setg(errp, "output IDE IRQ %u not connected", i);
> > >     +        return false;
> > >     +    }
> > >     +
> > >           ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
> > >           ret = ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
> > >                                 port_info[i].iobase2);
> > >     @@ -149,7 +152,7 @@ static bool pci_piix_init_bus(PCIIDEState *d,
> > >     unsigned i, Error **errp)
> > >                                object_get_typename(OBJECT(d)), i);
> > >               return false;
> > >           }
> > >     -    ide_bus_init_output_irq(&d->bus[i], irq_out);
> > >     +    ide_bus_init_output_irq(&d->bus[i], d->irq[i]);
> > > 
> > >           bmdma_init(&d->bus[i], &d->bmdma[i], d);
> > >           d->bmdma[i].bus = &d->bus[i];
> > >     --     2.38.1
> > > 
> > > 
> > > This now breaks user-created  piix3-ide:
> > > 
> > >    qemu-system-x86_64 -M q35 -device piix3-ide
> > > 
> > > Results in:
> > > 
> > >    qemu-system-x86_64: -device piix3-ide: output IDE IRQ 0 not connected
> > 
> > Thank you for this real-life-impossible-but-exists-in-QEMU test-case!
> 
> Do we really want to maintain this Frankenstein use case?
> 
> 1/ Q35 comes with a PCIe bus on which sits a ICH chipset, which already
>    contains a AHCI function exposing multiple IDE buses.
>    What is the point on using an older tech?
> 
> 2/ Why can we plug a PCI function on a PCIe bridge without using a
>    pcie-pci-bridge?

FYI, this scenario is explicitly permitted by QEMU's PCIE docs,
as without any bus= attr, the -device piix3-ide will end up
attached to the PCI-E root complex. It thus becomes an integrated
endpoint and does not support hotplug.

If you want hotpluggable PCI-only device, you need to add a
pcie-pci-bridge and a pci-bridge, attaching the endpoint to
the latter

PCE-E endpoints should always be in a pcie-root-port (or
switch downstream port)

> 3/ Chipsets come as a whole. Software drivers might expect all PCI
>    functions working (Linux considering each function individually
>    is not the norm)


> But the hardware really looks Frankenstein now:
> 
> (qemu) info qom-tree
> /machine (pc-q35-8.0-machine)
>   /peripheral-anon (container)
>     /device[0] (piix3-ide)
>       /bmdma[0] (memory-region)
>       /bmdma[1] (memory-region)
>       /bus master container[0] (memory-region)
>       /bus master[0] (memory-region)
>       /ide.6 (IDE)
>       /ide.7 (IDE)
>       /ide[0] (memory-region)
>       /ide[1] (memory-region)
>       /ide[2] (memory-region)
>       /ide[3] (memory-region)
>       /piix-bmdma-container[0] (memory-region)
>       /piix-bmdma[0] (memory-region)
>       /piix-bmdma[1] (memory-region)
>   /q35 (q35-pcihost)
>   /unattached (container)
>     /device[17] (ich9-ahci)
>       /ahci-idp[0] (memory-region)
>       /ahci[0] (memory-region)
>       /bus master container[0] (memory-region)
>       /bus master[0] (memory-region)
>       /ide.0 (IDE)
>       /ide.1 (IDE)
>       /ide.2 (IDE)
>       /ide.3 (IDE)
>       /ide.4 (IDE)
>       /ide.5 (IDE)
>     /device[2] (ICH9-LPC)
>       /bus master container[0] (memory-region)
>       /bus master[0] (memory-region)
>       /ich9-pm[0] (memory-region)
>       /isa.0 (ISA)
> 
> I guess the diff [*] is acceptable as a kludge, but we might consider
> deprecating such use.
> 
> Paolo, Michael & libvirt folks, what do you think?

AFAICT, libvirt will never use '-device piix3-ide'. I vaguely recall
that we discussed allowing it to enable use of > 4 IDE units, but
decide it was too niche to care about.

With q35 we'll just use ahci only

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


