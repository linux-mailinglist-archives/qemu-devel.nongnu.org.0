Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0006EF512
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 15:07:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prepv-0005De-Mn; Wed, 26 Apr 2023 09:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prept-0005DJ-7V; Wed, 26 Apr 2023 09:05:29 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prepr-0007jt-Cb; Wed, 26 Apr 2023 09:05:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3dC9nD/HyvEOuhACml2Q3QN500IB9JMiLNGDZ+YRvws=; b=Girp11/0l4tJ510Yi93byolInw
 KtI7FtmRTGcO70jaGZRcbe8VSVY3RF2JfXOsCF/nt3sfofwN6yovpuLMbCU1xaZ01JQ2QchHz6ckc
 V7FLsBwf1USuJ+UW3nxQ8aMzpGACVwbfoOgAbvyqA0XwcboNjg1GQpq0AQzxyZkjNCWyknwqyHinP
 GEPWux2MJXWk31618Z10nSFeIE57TdtOfIztUhlSISExgL4DUVl9MBzc2PKF7jmWdB9ty31m28N5f
 uGoRHpNS/TvnOyC010RzRSmuMU6mrvxVSaViqx9AbQUsi3o7meErgaoozbYvz29XGJ5KRH9PK4dra
 tkvH6MqU5io/LLxjPgCUbwoUJNK9GpirN7UgZDZQ5pyfzgVtc1/zrvhKbloQoxOMyMFD0VMXJQIb/
 azl5vJyxXoP9W+o2rao9WWWirD3uCbXzRA09N6BUthquTzoaKJg6oXXmpUcNBLEpeHtyxgKbUztuI
 VyCKWwPlqnniqjxNcYqyW+Hl2qeRM3W0iXr2HXhhZTFcdRdzcCItCnR5R8Ou571k36U0JFijTFkVH
 8NknEtju0/v+SecnFDH64W8TFqGutUamwcVwlANk8obCc+XIwHlKsnYCbszwcg2umxvLHG8FCUjqm
 sTe0n4fjIWeHC62XpQUsSoY+XunzkoSL9T9oJ8n58=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1preoj-0002XE-Ki; Wed, 26 Apr 2023 14:04:21 +0100
Message-ID: <715c66a8-5df3-e607-ed46-077b4bef9293@ilande.co.uk>
Date: Wed, 26 Apr 2023 14:05:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org
References: <20230302224058.43315-1-philmd@linaro.org>
 <20230302224058.43315-6-philmd@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230302224058.43315-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 05/18] hw/ide: Rename ISA specific ide_init_ioport ->
 ide_bus_init_ioport_isa
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

> Rename ide_init_ioport() as ide_bus_init_ioport_isa() to make
> explicit it expects an ISA device. Move the declaration to
> "hw/ide/isa.h" where it belongs.
> 
> Message-Id: <20230215161641.32663-13-philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/ide/ioport.c           | 4 +++-
>   hw/ide/isa.c              | 2 +-
>   hw/ide/piix.c             | 5 +++--
>   include/hw/ide/internal.h | 1 -
>   include/hw/ide/isa.h      | 3 +++
>   5 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/ide/ioport.c b/hw/ide/ioport.c
> index e2ecc6230c..d869f8018a 100644
> --- a/hw/ide/ioport.c
> +++ b/hw/ide/ioport.c
> @@ -25,6 +25,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "hw/isa/isa.h"
> +#include "hw/ide/isa.h"
>   #include "hw/ide/internal.h"
>   #include "trace.h"
>   
> @@ -40,7 +41,8 @@ static const MemoryRegionPortio ide_portio2_list[] = {
>       PORTIO_END_OF_LIST(),
>   };
>   
> -int ide_init_ioport(IDEBus *bus, ISADevice *dev, int iobase, int iobase2)
> +int ide_bus_init_ioport_isa(IDEBus *bus, ISADevice *dev,
> +                            int iobase, int iobase2)
>   {
>       int ret;
>   
> diff --git a/hw/ide/isa.c b/hw/ide/isa.c
> index 95053e026f..6eed16bf87 100644
> --- a/hw/ide/isa.c
> +++ b/hw/ide/isa.c
> @@ -71,7 +71,7 @@ static void isa_ide_realizefn(DeviceState *dev, Error **errp)
>       ISAIDEState *s = ISA_IDE(dev);
>   
>       ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
> -    ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
> +    ide_bus_init_ioport_isa(&s->bus, isadev, s->iobase, s->iobase2);
>       ide_bus_init_output_irq(&s->bus, isa_get_irq(isadev, s->irqnum));
>       vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
>       ide_bus_register_restart_cb(&s->bus);
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index 7cb96ef67f..cb527553e2 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -33,6 +33,7 @@
>   #include "hw/pci/pci.h"
>   #include "hw/ide/piix.h"
>   #include "hw/ide/pci.h"
> +#include "hw/ide/isa.h"
>   #include "trace.h"
>   
>   static uint64_t bmdma_read(void *opaque, hwaddr addr, unsigned size)
> @@ -142,8 +143,8 @@ static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
>   
>       qemu_irq irq_out = d->isa_irq[i] ? : isa_get_irq(NULL, port_info[i].isairq);
>       ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
> -    ret = ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
> -                          port_info[i].iobase2);
> +    ret = ide_bus_init_ioport_isa(&d->bus[i], NULL, port_info[i].iobase,
> +                                  port_info[i].iobase2);
>       if (ret) {
>           error_setg_errno(errp, -ret, "Failed to realize %s port %u",
>                            object_get_typename(OBJECT(d)), i);
> diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
> index d9f1f77dd5..d3b7fdc504 100644
> --- a/include/hw/ide/internal.h
> +++ b/include/hw/ide/internal.h
> @@ -618,7 +618,6 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, IDEDriveKind kind,
>                      int chs_trans, Error **errp);
>   void ide_exit(IDEState *s);
>   void ide_bus_init_output_irq(IDEBus *bus, qemu_irq irq_out);
> -int ide_init_ioport(IDEBus *bus, ISADevice *isa, int iobase, int iobase2);
>   void ide_bus_set_irq(IDEBus *bus);
>   void ide_bus_register_restart_cb(IDEBus *bus);
>   
> diff --git a/include/hw/ide/isa.h b/include/hw/ide/isa.h
> index 1cd0ff1fa6..7f7a850265 100644
> --- a/include/hw/ide/isa.h
> +++ b/include/hw/ide/isa.h
> @@ -10,11 +10,14 @@
>   #define HW_IDE_ISA_H
>   
>   #include "qom/object.h"
> +#include "hw/ide/internal.h"
>   
>   #define TYPE_ISA_IDE "isa-ide"
>   OBJECT_DECLARE_SIMPLE_TYPE(ISAIDEState, ISA_IDE)
>   
>   ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int irqnum,
>                           DriveInfo *hd0, DriveInfo *hd1);
> +int ide_bus_init_ioport_isa(IDEBus *bus, ISADevice *isa,
> +                            int iobase, int iobase2);
>   
>   #endif

I have a similar, but opposite patch to this in one of my branches where I have a PCI 
IDE controller that can switch between legacy and native modes :)

 From my perspective the use of ide_init_ioport() in hw/ide/isa.c is the outlier 
here, because that is the only instance that works on ISADevice, all the other uses 
are PCIDevices. Hence I've gone the other way which is to inline the ISA ioport 
initialisation into isa_ide_realizefn(): 
https://github.com/mcayland/qemu/commit/e94b004d259e5831beadface100e6bb41beca92c.


ATB,

Mark.

