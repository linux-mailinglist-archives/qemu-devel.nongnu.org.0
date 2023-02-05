Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EB768B210
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 23:03:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOn5V-00024e-6g; Sun, 05 Feb 2023 17:02:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOn5S-00023g-FH; Sun, 05 Feb 2023 17:02:14 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOn5Q-0002Dz-DU; Sun, 05 Feb 2023 17:02:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yv+KZ+0C8hNMQS3noWF/ilcSzE6+ZKJPRvWHUtlppbA=; b=rNTqEB++0ExkQqsE5rB27DdISZ
 aCvwseiZhRmrNt196nCY/bVyvYl8hYq12PEjWB8mSPVnZvGrqPYQC9jbkJ0slUue8aS9f6ECe8/q/
 hGj6oEguWxxXIlMLFLrQnktvG4z1t8DPruYD6EL4pmCKk/hvKoypZLG8g8fM6/z5wyf8xGohtEk0h
 zL19lArtfCJ1iguraOVuMPSBJtF/jQQVzrDNWC9fPcri2mXcj8y2sO1U8wUOa4DhCtBzP3ghP+Kuu
 QFpjjtJG36/ohQF1X35wZ8SFu4yCHugyouJsQ2mdYY5mwh6qOiakB2VdrGFdXHjEWOaAWHfFsEq9o
 zQmqnOFr+SDniuQTL0FDDxoMqnWkLGNOa3/h8HLdHbBmGnEr7zxAT9s6zmMyJZwOJjDHi2qR9IiWO
 mJy8VKJM8o5VzOgCNUSsQP5iDg69+Z3TUBKbnVuryaoJQ38U+zcSQfQCe6rEAwfGV0oc4En9bO6eO
 uPFThpSlXQwv2rrjkmmOKeyXASWlAxvs6NKeqMiliTKRszJQbvmsg3ztJqtaS/GEUnoy2j4sAVqHe
 YOPmaMRhYEpe1WtJW9evLesLJ0Ba2Y0PFZ4fXC9QSbUH9fc7Uk+Vg7fBY74hZpbIMU4Txu8qYGO6Q
 w8GljofmPqo3NZ+LMLfOhJevwFJ94SV0hRQZG+xrc=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOn4o-0007sA-V8; Sun, 05 Feb 2023 22:01:35 +0000
Message-ID: <8c433dc2-80d2-c01b-0b01-cd5e2749e60b@ilande.co.uk>
Date: Sun, 5 Feb 2023 22:02:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 20210518215545.1793947-10-philmd@redhat.com
References: <20230126211740.66874-1-shentey@gmail.com>
 <20230126211740.66874-9-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230126211740.66874-9-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 08/10] hw/ide: Let ide_init_ioport() take a
 MemoryRegion argument instead of ISADevice
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 26/01/2023 21:17, Bernhard Beschow wrote:

> Both callers to ide_init_ioport() have access to the I/O memory region
> of the ISA bus, so can pass it directly. This allows ide_init_ioport()
> to directly call portio_list_init().
> 
> Note, now the callers become the owner of the PortioList.
> 
> Inspired-by: <20210518215545.1793947-10-philmd@redhat.com>
>    'hw/ide: Let ide_init_ioport() take an ISA bus argument instead of device'
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/ide/internal.h |  3 ++-
>   hw/ide/ioport.c           | 15 ++++++++-------
>   hw/ide/isa.c              |  4 +++-
>   hw/ide/piix.c             |  8 ++++++--
>   4 files changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
> index 42c49414f4..c3e4d192fa 100644
> --- a/include/hw/ide/internal.h
> +++ b/include/hw/ide/internal.h
> @@ -628,7 +628,8 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, IDEDriveKind kind,
>                      int chs_trans, Error **errp);
>   void ide_init2(IDEBus *bus, qemu_irq irq);
>   void ide_exit(IDEState *s);
> -void ide_init_ioport(IDEBus *bus, ISADevice *isa, int iobase, int iobase2);
> +void ide_init_ioport(IDEBus *bus, MemoryRegion *address_space_io, Object *owner,
> +                     int iobase, int iobase2);
>   void ide_register_restart_cb(IDEBus *bus);
>   
>   void ide_exec_cmd(IDEBus *bus, uint32_t val);
> diff --git a/hw/ide/ioport.c b/hw/ide/ioport.c
> index b613ff3bba..00e9baf0d1 100644
> --- a/hw/ide/ioport.c
> +++ b/hw/ide/ioport.c
> @@ -50,15 +50,16 @@ static const MemoryRegionPortio ide_portio2_list[] = {
>       PORTIO_END_OF_LIST(),
>   };
>   
> -void ide_init_ioport(IDEBus *bus, ISADevice *dev, int iobase, int iobase2)
> +void ide_init_ioport(IDEBus *bus, MemoryRegion *address_space_io, Object *owner,
> +                     int iobase, int iobase2)
>   {
> -    /* ??? Assume only ISA and PCI configurations, and that the PCI-ISA
> -       bridge has been setup properly to always register with ISA.  */
> -    isa_register_portio_list(dev, &bus->portio_list,
> -                             iobase, ide_portio_list, bus, "ide");
> +    assert(address_space_io);
> +
> +    portio_list_init(&bus->portio_list, owner, ide_portio_list, bus, "ide",
> +                     address_space_io, iobase);
>   
>       if (iobase2) {
> -        isa_register_portio_list(dev, &bus->portio2_list,
> -                                 iobase2, ide_portio2_list, bus, "ide");
> +        portio_list_init(&bus->portio2_list, owner, ide_portio2_list, bus,
> +                         "ide", address_space_io, iobase2);
>       }
>   }
> diff --git a/hw/ide/isa.c b/hw/ide/isa.c
> index 8bedbd13f1..cab5d0a07a 100644
> --- a/hw/ide/isa.c
> +++ b/hw/ide/isa.c
> @@ -72,9 +72,11 @@ static void isa_ide_realizefn(DeviceState *dev, Error **errp)
>   {
>       ISADevice *isadev = ISA_DEVICE(dev);
>       ISAIDEState *s = ISA_IDE(dev);
> +    ISABus *isabus = isa_bus_from_device(isadev);
>   
>       ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
> -    ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
> +    ide_init_ioport(&s->bus, isabus->address_space_io, OBJECT(dev),
> +                    s->iobase, s->iobase2);
>       s->irq = isa_get_irq(isadev, s->isairq);
>       ide_init2(&s->bus, s->irq);
>       vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index f0d95761ac..236b5b7416 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -29,6 +29,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "hw/pci/pci.h"
> +#include "hw/pci/pci_bus.h"
>   #include "migration/vmstate.h"
>   #include "qapi/error.h"
>   #include "qemu/module.h"
> @@ -143,8 +144,11 @@ static void pci_piix_init_ports(PCIIDEState *d, ISABus *isa_bus)
>           {0x1f0, 0x3f6, 14},
>           {0x170, 0x376, 15},
>       };
> +    PCIBus *pci_bus = pci_get_bus(&d->parent_obj);
>       int i;
>   
> +    assert(pci_bus);
> +
>       if (isa_bus) {
>           d->isa_irqs[0] = isa_bus->irqs[port_info[0].isairq];
>           d->isa_irqs[1] = isa_bus->irqs[port_info[1].isairq];
> @@ -154,8 +158,8 @@ static void pci_piix_init_ports(PCIIDEState *d, ISABus *isa_bus)
>   
>       for (i = 0; i < 2; i++) {
>           ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
> -        ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
> -                        port_info[i].iobase2);
> +        ide_init_ioport(&d->bus[i], pci_bus->address_space_io, OBJECT(d),
> +                        port_info[i].iobase, port_info[i].iobase2);
>           ide_init2(&d->bus[i], qdev_get_gpio_in(DEVICE(d), i));
>   
>           bmdma_init(&d->bus[i], &d->bmdma[i], d);

Again, given that I suspect ioports are specific to x86 I'd be inclined to leave this 
as a reference to ISA. I could see there being a function that exists such as 
isa_get_address_space_io(ISADevice *isa) in the same way as pci_address_space_io(), 
for example.


ATB,

Mark.

