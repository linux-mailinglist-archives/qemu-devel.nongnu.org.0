Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE8E6EF584
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 15:29:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prfCJ-0000ff-48; Wed, 26 Apr 2023 09:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prfCG-0000fE-Mb; Wed, 26 Apr 2023 09:28:36 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prfCE-0004NQ-9F; Wed, 26 Apr 2023 09:28:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G6Nidosb2zwl5AMDvYvTPPQmnBO1/upI8LD7JTLSBxQ=; b=UOU37y8WuUtnK01Jr7OlVpoXXm
 UESRYvWBLW6e2OzqtfYU7DzkGv+QYBzwe5kthaZCENi6ZU4qK0+tBSDjyfTzdrdrdjxW2ntdxkGSU
 GxuYkxkMQ3Ie77DiaG8GYU8Qe6EDRz4eoie8XnJO8MuxOGVhlpKJ/MBdnNPFNP1l3qhijMBrH6YZw
 0iTuaklWAQrHWtqUVTq/ksHI3TZGeXppCD39+bq8usaK78/AxYhv/Ms0iKWn/6wWbd07KnKM8fKbI
 1pfIPAKX72nx5TSLS+VizpRtuRzZ3gYAF7XQoacMyoOJjQrXqVkJg2C/EI4E3pRJY+SkNN/xHRy+G
 B1VVttkr7wHBX0rlQp5dDo0+ndv6iw4VGYXyLSDEMnd/IKJmp2AbXJNJiKDfAG5fFbP3IzX1SS8FA
 ezCtNKqtT4S2Rh/R2p8CYpumqtpJCmyBKR4v8GHVfvaGGa1n1RYcGQbt4sJj8lVLiF5ivcahKfKSh
 CyiNOfxsulgErSk4tT29i8rbcg5z+2lqM/27eP/ztWCplcUPVcml2uVW3WrQAjX60ztkhzreZaIXL
 XMevmV1y4fo0eOpU6+bf92NFd8oRkN2CW+BIO4KPS394zRxnf3b1oTmoX9AkRx1BdXWfCbFwks7g0
 Vuak/dGIw4dGPXWQPl8Gp68j+t7UaRRjRF1damxG8=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prfBB-0002mU-Hk; Wed, 26 Apr 2023 14:27:33 +0100
Message-ID: <bc425ba8-c739-dca0-dbd1-cbbaf65e876a@ilande.co.uk>
Date: Wed, 26 Apr 2023 14:28:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-block@nongnu.org
References: <20230302224058.43315-1-philmd@linaro.org>
 <20230302224058.43315-15-philmd@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230302224058.43315-15-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 14/18] exec/ioport: Factor portio_list_register() out
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 02/03/2023 22:40, Philippe Mathieu-Daudé wrote:

> We always follow the same pattern when registering
> non-coalesced portio:
> 
>    - portio_list_init()
>    - portio_list_add()
> 
> Factor these 2 operations in a single helper named
> portio_list_register(). Since both calls become local
> to ioport.c, reduce their scope by declaring them static.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Message-Id: <20230207234615.77300-3-philmd@linaro.org>
> ---
>   hw/audio/adlib.c        |  4 ++--
>   hw/display/vga.c        |  4 ++--
>   hw/dma/i82374.c         |  7 +++----
>   hw/ide/ioport.c         |  9 ++++-----
>   hw/isa/isa-bus.c        |  5 ++---
>   hw/watchdog/wdt_ib700.c |  4 ++--
>   include/exec/ioport.h   | 10 ++++------
>   softmmu/ioport.c        | 21 ++++++++++++++-------
>   8 files changed, 33 insertions(+), 31 deletions(-)
> 
> diff --git a/hw/audio/adlib.c b/hw/audio/adlib.c
> index 5f979b1487..cc03c99306 100644
> --- a/hw/audio/adlib.c
> +++ b/hw/audio/adlib.c
> @@ -291,8 +291,8 @@ static void adlib_realizefn (DeviceState *dev, Error **errp)
>   
>       adlib_portio_list[0].offset = s->port;
>       adlib_portio_list[1].offset = s->port + 8;
> -    portio_list_init (&s->port_list, OBJECT(s), adlib_portio_list, s, "adlib");
> -    portio_list_add (&s->port_list, isa_address_space_io(&s->parent_obj), 0);
> +    portio_list_register(&s->port_list, OBJECT(s), adlib_portio_list, s,
> +                         "adlib", isa_address_space_io(&s->parent_obj), 0);
>   }
>   
>   static Property adlib_properties[] = {
> diff --git a/hw/display/vga.c b/hw/display/vga.c
> index 98d644922e..aa899fddc3 100644
> --- a/hw/display/vga.c
> +++ b/hw/display/vga.c
> @@ -2313,7 +2313,7 @@ void vga_init(VGACommonState *s, Object *obj, MemoryRegion *address_space,
>                                                s, "vga", address_space_io, 0x3b0);
>       }
>       if (vbe_ports) {
> -        portio_list_init(&s->vbe_port_list, obj, vbe_ports, s, "vbe");
> -        portio_list_add(&s->vbe_port_list, address_space_io, 0x1ce);
> +        portio_list_register(&s->vbe_port_list, obj, vbe_ports, s,
> +                             "vbe", address_space_io, 0x1ce);
>       }
>   }
> diff --git a/hw/dma/i82374.c b/hw/dma/i82374.c
> index 63734c22c9..aeca0e8323 100644
> --- a/hw/dma/i82374.c
> +++ b/hw/dma/i82374.c
> @@ -131,10 +131,9 @@ static void i82374_realize(DeviceState *dev, Error **errp)
>       }
>       i8257_dma_init(isa_bus, true);
>   
> -    portio_list_init(&s->port_list, OBJECT(s), i82374_portio_list, s,
> -                     "i82374");
> -    portio_list_add(&s->port_list, isa_address_space_io(&s->parent_obj),
> -                    s->iobase);
> +    portio_list_register(&s->port_list, OBJECT(s), i82374_portio_list, s,
> +                         "i82374", isa_address_space_io(&s->parent_obj),
> +                         s->iobase);
>   
>       memset(s->commands, 0, sizeof(s->commands));
>   }
> diff --git a/hw/ide/ioport.c b/hw/ide/ioport.c
> index ed7957dbae..7a6f29955f 100644
> --- a/hw/ide/ioport.c
> +++ b/hw/ide/ioport.c
> @@ -60,9 +60,8 @@ int ide_bus_init_ioport_isa(IDEBus *bus, ISADevice *dev,
>   void ide_bus_init_ioport(IDEBus *bus, Object *owner, MemoryRegion *io,
>                            int iobase, int iobase2)
>   {
> -    portio_list_init(&bus->portio_list, owner, ide_portio_list, bus, "ide");
> -    portio_list_add(&bus->portio_list, io, iobase);
> -
> -    portio_list_init(&bus->portio2_list, owner, ide_portio2_list, bus, "ide");
> -    portio_list_add(&bus->portio_list, io, iobase2);
> +    portio_list_register(&bus->portio_list, owner, ide_portio_list,
> +                         bus, "ide", io, iobase);
> +    portio_list_register(&bus->portio2_list, owner, ide_portio2_list,
> +                         bus, "ide", io, iobase2);
>   }
> diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
> index 8e3ca3785e..087293108e 100644
> --- a/hw/isa/isa-bus.c
> +++ b/hw/isa/isa-bus.c
> @@ -130,15 +130,14 @@ int isa_register_portio_list(ISADevice *dev,
>                                void *opaque, const char *name)
>   {
>       assert(dev);
> -    assert(piolist && !piolist->owner);
>   
>       /* START is how we should treat DEV, regardless of the actual
>          contents of the portio array.  This is how the old code
>          actually handled e.g. the FDC device.  */
>       isa_init_ioport(dev, start);
>   
> -    portio_list_init(piolist, OBJECT(dev), pio_start, opaque, name);
> -    portio_list_add(piolist, isa_address_space_io(dev), start);
> +    portio_list_register(piolist, OBJECT(dev), pio_start, opaque, name,
> +                         isa_address_space_io(dev), start);
>   
>       return 0;
>   }
> diff --git a/hw/watchdog/wdt_ib700.c b/hw/watchdog/wdt_ib700.c
> index b116c3a3aa..ac4f0be7d8 100644
> --- a/hw/watchdog/wdt_ib700.c
> +++ b/hw/watchdog/wdt_ib700.c
> @@ -115,8 +115,8 @@ static void wdt_ib700_realize(DeviceState *dev, Error **errp)
>   
>       s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, ib700_timer_expired, s);
>   
> -    portio_list_init(&s->port_list, OBJECT(s), wdt_portio_list, s, "ib700");
> -    portio_list_add(&s->port_list, isa_address_space_io(&s->parent_obj), 0);
> +    portio_list_register(&s->port_list, OBJECT(s), wdt_portio_list, s,
> +                         "ib700", isa_address_space_io(&s->parent_obj), 0);
>   }
>   
>   static void wdt_ib700_reset(DeviceState *dev)
> diff --git a/include/exec/ioport.h b/include/exec/ioport.h
> index eb9882a3ee..ca44f269ea 100644
> --- a/include/exec/ioport.h
> +++ b/include/exec/ioport.h
> @@ -62,17 +62,15 @@ typedef struct PortioList {
>       bool flush_coalesced_mmio;
>   } PortioList;
>   
> -void portio_list_init(PortioList *piolist, Object *owner,
> -                      const struct MemoryRegionPortio *callbacks,
> -                      void *opaque, const char *name);
> +void portio_list_register(PortioList *piolist, Object *owner,
> +                          const MemoryRegionPortio *callbacks,
> +                          void *opaque, const char *name,
> +                          MemoryRegion *mr, uint32_t offset);
>   void portio_list_register_flush_coalesced(PortioList *piolist, Object *owner,
>                                             const MemoryRegionPortio *callbacks,
>                                             void *opaque, const char *name,
>                                             MemoryRegion *mr, uint32_t offset);
>   void portio_list_destroy(PortioList *piolist);
> -void portio_list_add(PortioList *piolist,
> -                     struct MemoryRegion *address_space,
> -                     uint32_t addr);
>   void portio_list_del(PortioList *piolist);
>   
>   #endif /* IOPORT_H */
> diff --git a/softmmu/ioport.c b/softmmu/ioport.c
> index be0c920c5c..42d43f8b27 100644
> --- a/softmmu/ioport.c
> +++ b/softmmu/ioport.c
> @@ -113,10 +113,9 @@ uint32_t cpu_inl(uint32_t addr)
>       return val;
>   }
>   
> -void portio_list_init(PortioList *piolist,
> -                      Object *owner,
> -                      const MemoryRegionPortio *callbacks,
> -                      void *opaque, const char *name)
> +static void portio_list_init(PortioList *piolist, Object *owner,
> +                             const MemoryRegionPortio *callbacks,
> +                             void *opaque, const char *name)
>   {
>       unsigned n = 0;
>   
> @@ -246,9 +245,8 @@ static void portio_list_add_1(PortioList *piolist,
>       ++piolist->nr;
>   }
>   
> -void portio_list_add(PortioList *piolist,
> -                     MemoryRegion *address_space,
> -                     uint32_t start)
> +static void portio_list_add(PortioList *piolist, MemoryRegion *address_space,
> +                            uint32_t start)
>   {
>       const MemoryRegionPortio *pio, *pio_start = piolist->ports;
>       unsigned int off_low, off_high, off_last, count;
> @@ -314,3 +312,12 @@ void portio_list_register_flush_coalesced(PortioList *piolist, Object *owner,
>       do_portio_list_register(piolist, owner, callbacks,
>                               opaque, name, mr, offset, true);
>   }
> +
> +void portio_list_register(PortioList *piolist, Object *owner,
> +                          const MemoryRegionPortio *callbacks,
> +                          void *opaque, const char *name,
> +                          MemoryRegion *mr, uint32_t offset)
> +{
> +    do_portio_list_register(piolist, owner, callbacks,
> +                            opaque, name, mr, offset, false);
> +}

Ah, and you beat me to it :)  I'm not 100% sold on the previous patch, but this makes 
sense so:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

