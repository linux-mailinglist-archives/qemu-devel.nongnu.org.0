Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 102C23496F8
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 17:41:14 +0100 (CET)
Received: from localhost ([::1]:50454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPT2m-0002pn-T7
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 12:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPSp6-0002am-N2
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:27:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPSp3-0000nn-8A
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:27:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616689619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fkGjtH4GU7IgmhC79H7qitBuXA1014KzU9qoeCbdIV8=;
 b=BLkdKPBqGEwostr2TZSvcUQ0GZDJPs0yotyHBnYfzxw3GKJTwaW5PUrxu26/+jHwAgQ5aE
 E1dvGz4sTRPJFFKqd00IZY8e0MXXq0ZiP2teFkaM7/EYmuoIx3m1lgRat+kFa/I/IsZF0C
 QrwXE208Wm4M98DXY7rc2PU1i1Hi9UU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-IWJ0pvmnN4iMdk5ohdNmhA-1; Thu, 25 Mar 2021 12:26:58 -0400
X-MC-Unique: IWJ0pvmnN4iMdk5ohdNmhA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C777E108BD0C;
 Thu, 25 Mar 2021 16:26:56 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A449E19716;
 Thu, 25 Mar 2021 16:26:55 +0000 (UTC)
Subject: Re: [PATCH 5/6] hw/ide/via: Connect IDE function output IRQs to the
 ISA function input
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210324175438.680310-1-f4bug@amsat.org>
 <20210324175438.680310-6-f4bug@amsat.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <55f9bb30-6ab4-5b10-a13e-0dc29b5fc0cd@redhat.com>
Date: Thu, 25 Mar 2021 12:26:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210324175438.680310-6-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 1:54 PM, Philippe Mathieu-Daudé wrote:
> To avoid abusing isa_get_irq(NULL) using a hidden ISA bridge
> under the hood, let the IDE function expose 2 output IRQs,
> and connect them to the ISA function inputs when creating
> the south bridge chipset model in vt82c686b_southbridge_init.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

No real opinion, how was it tested? Can probably ack in good faith after 
review comments from Richard Henderson and BALATON Zoltan.

--js

> ---
>   hw/ide/via.c        | 19 +++++++++++++++++--
>   hw/mips/fuloong2e.c |  9 ++++++++-
>   2 files changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/ide/via.c b/hw/ide/via.c
> index 6c667a92130..7887bf181e6 100644
> --- a/hw/ide/via.c
> +++ b/hw/ide/via.c
> @@ -33,6 +33,17 @@
>   #include "hw/ide/pci.h"
>   #include "trace.h"
>   
> +#define TYPE_VIA_IDE "via-ide"
> +OBJECT_DECLARE_SIMPLE_TYPE(VIAIDEState, VIA_IDE)
> +
> +struct VIAIDEState {
> +    /* <private> */
> +    PCIIDEState parent_obj;
> +    /* <public> */
> +
> +    qemu_irq irq[2];
> +};
> +
>   static uint64_t bmdma_read(void *opaque, hwaddr addr,
>                              unsigned size)
>   {
> @@ -105,6 +116,7 @@ static void bmdma_setup_bar(PCIIDEState *d)
>   static void via_ide_set_irq(void *opaque, int n, int level)
>   {
>       PCIDevice *d = PCI_DEVICE(opaque);
> +    VIAIDEState *s = VIA_IDE(d);
>   
>       if (level) {
>           d->config[0x70 + n * 8] |= 0x80;
> @@ -112,7 +124,7 @@ static void via_ide_set_irq(void *opaque, int n, int level)
>           d->config[0x70 + n * 8] &= ~0x80;
>       }
>   
> -    qemu_set_irq(isa_get_irq(NULL, 14 + n), level);
> +    qemu_set_irq(s->irq[n], level);
>   }
>   
>   static void via_ide_reset(DeviceState *dev)
> @@ -159,6 +171,7 @@ static void via_ide_reset(DeviceState *dev)
>   
>   static void via_ide_realize(PCIDevice *dev, Error **errp)
>   {
> +    VIAIDEState *s = VIA_IDE(dev);
>       PCIIDEState *d = PCI_IDE(dev);
>       DeviceState *ds = DEVICE(dev);
>       uint8_t *pci_conf = dev->config;
> @@ -188,6 +201,7 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
>       bmdma_setup_bar(d);
>       pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
>   
> +    qdev_init_gpio_out_named(ds, s->irq, "ide-irq", ARRAY_SIZE(s->irq));
>       qdev_init_gpio_in(ds, via_ide_set_irq, ARRAY_SIZE(d->bus));
>       for (i = 0; i < ARRAY_SIZE(d->bus); i++) {
>           ide_bus_new(&d->bus[i], sizeof(d->bus[i]), ds, i, MAX_IDE_DEVS);
> @@ -227,8 +241,9 @@ static void via_ide_class_init(ObjectClass *klass, void *data)
>   }
>   
>   static const TypeInfo via_ide_info = {
> -    .name          = "via-ide",
> +    .name          = TYPE_VIA_IDE,
>       .parent        = TYPE_PCI_IDE,
> +    .instance_size = sizeof(VIAIDEState),
>       .class_init    = via_ide_class_init,
>   };
>   
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 931385c760f..f1c5db13b78 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -203,12 +203,19 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
>                                          I2CBus **i2c_bus)
>   {
>       PCIDevice *dev;
> +    DeviceState *isa;
>   
>       dev = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
>                                             TYPE_VT82C686B_ISA);
> -    qdev_connect_gpio_out_named(DEVICE(dev), "intr", 0, intc);
> +    isa = DEVICE(dev);
> +    qdev_connect_gpio_out_named(isa, "intr", 0, intc);
>   
>       dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
> +    for (unsigned i = 0; i < 2; i++) {
> +        qdev_connect_gpio_out_named(DEVICE(dev), "ide-irq", i,
> +                                    qdev_get_gpio_in_named(isa,
> +                                                           "isa-irq", 14 + i));
> +    }
>       pci_ide_create_devs(dev);
>   
>       pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
> 


