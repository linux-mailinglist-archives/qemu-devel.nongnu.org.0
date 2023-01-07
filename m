Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE17D66129F
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 00:47:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEIsu-00021V-FB; Sat, 07 Jan 2023 18:45:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pEIsq-00020o-1E; Sat, 07 Jan 2023 18:45:55 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pEIsm-0005YT-Jy; Sat, 07 Jan 2023 18:45:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ik2dSyQeGAYjkUDxz2pQhk593s6WuSygAFelxgRupeY=; b=0kZyyQ68Zu82wQCibrwO2BXMB3
 KRg3wIRwKZfVUhoDgi65ZUTuZCsVX+f3MHI4/N11udhd9V2DYnywgYeucOLvhwq/VdmcXP5+pd+yC
 0u8QLwUakcch3cxJwSWX7cv25qH6ARL169AucHN7XDjbXKaH5N1boE2bz/naZfxA2x8rFxlnQ1eXt
 9FjqljhRVGvqj4TJ3IyKTpemM+m9VP6CWhH38b2tszNt//2FfxCg5JFF+MpihCBsh+LHAmrIUvWGF
 q6cakjgeYuXbnh2W6ruwmwVKLa7ymePfWlMesuktq81pxRRr9npHcpnl92l9fFd+wjXaHST8JZw4p
 rZGSMBSwru8K1hEFFlQgzWt/ChZZHZOs1pLE76yETBp0eARtXmznXb1PF+flBrn26UK4g0wBRdrdG
 7yhB2rc31TP65RoBa9vfpBKb/AH3bD0xnhw4HFgO3kchD++xvEMESqUukC1onkGqQfwcFt42iMt/L
 HhqmBaVsEaVL2DIqZhAjK1cwfGBz4WoppLgUThijizY/6Ty50E4jFHntv7SNhY1qYu0hXwAURhMkU
 GDBoeM8lEz9i0KcLtS+H1BZ6+dgOXm4PLA6q3FG04P8DcAMY2jAb9FkzgLFATLGkKRCwqeubqsL8v
 rGkNCLUkwgOtwks0DYR7lWawn+PL2YOWh9d+VAkjw=;
Received: from [2a00:23c4:8baa:1d00:e655:fde:753f:696a]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pEIsK-000BIm-72; Sat, 07 Jan 2023 23:45:24 +0000
Message-ID: <9724624c-4848-4308-4dc6-d77bfcc8fc0f@ilande.co.uk>
Date: Sat, 7 Jan 2023 23:45:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Ani Sinha <ani@anisinha.ca>, Richard Henderson
 <richard.henderson@linaro.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, John Snow <jsnow@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20230105143228.244965-1-shentey@gmail.com>
 <20230105143228.244965-14-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230105143228.244965-14-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:1d00:e655:fde:753f:696a
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v5 13/31] hw/intc/i8259: Introduce i8259 proxy "isa-pic"
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.114,
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

On 05/01/2023 14:32, Bernhard Beschow wrote:

> Having an i8259 proxy allows for ISA PICs to be created and wired up in
> southbridges. This is especially interesting for PIIX3 for two reasons:
> First, the southbridge doesn't need to care about the virtualization
> technology used (KVM, TCG, Xen) due to in-IRQs (where devices get
> attached) and out-IRQs (which will trigger the IRQs of the respective
> virtualization technology) are separated. Second, since the in-IRQs are
> populated with fully initialized qemu_irq's, they can already be wired
> up inside PIIX3.
> 
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/intc/i8259.h | 19 +++++++++++++++++++
>   hw/intc/i8259.c         | 27 +++++++++++++++++++++++++++
>   2 files changed, 46 insertions(+)
> 
> diff --git a/include/hw/intc/i8259.h b/include/hw/intc/i8259.h
> index a0e34dd990..f666f5ee09 100644
> --- a/include/hw/intc/i8259.h
> +++ b/include/hw/intc/i8259.h
> @@ -1,6 +1,25 @@
>   #ifndef HW_I8259_H
>   #define HW_I8259_H
>   
> +#include "qom/object.h"
> +#include "hw/isa/isa.h"
> +#include "qemu/typedefs.h"
> +
> +#define TYPE_ISA_PIC "isa-pic"
> +OBJECT_DECLARE_SIMPLE_TYPE(ISAPICState, ISA_PIC)
> +
> +/*
> + * TYPE_ISA_PIC is currently a PIC proxy which allows for interrupt wiring in
> + * a virtualization technology agnostic way. It could be turned into a proper
> + * GPIO-based ISA PIC in the future.
> + */

I would say that the last sentence isn't true, since when all PIC implementations 
have been converted to qdev the mechanism for choosing the PIC implementation is 
currently unspecified. As an example once this has been done "isa-pic" could be 
removed completely and the code in the following patch changed to something like:

     object_initialize_child(obj, "pic", &d->pic, kvm_enabled() ?  TYPE_KVM_I8259 :
                             TYPE_I8259);

Perhaps change the last sentence to something like: "It provides a temporary bridge 
between older x86 code where qemu_irqs are passed around directly and devices that 
use qdev gpios."?

Other than that the implementation looks sensible to me, so:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

> +struct ISAPICState {
> +    DeviceState parent_obj;
> +
> +    qemu_irq in_irqs[ISA_NUM_IRQS];
> +    qemu_irq out_irqs[ISA_NUM_IRQS];
> +};
> +
>   /* i8259.c */
>   
>   extern PICCommonState *isa_pic;
> diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
> index 0261f087b2..e99d02136d 100644
> --- a/hw/intc/i8259.c
> +++ b/hw/intc/i8259.c
> @@ -455,9 +455,36 @@ static const TypeInfo i8259_info = {
>       .class_size = sizeof(PICClass),
>   };
>   
> +static void isapic_set_irq(void *opaque, int irq, int level)
> +{
> +    ISAPICState *s = opaque;
> +
> +    qemu_set_irq(s->out_irqs[irq], level);
> +}
> +
> +static void isapic_init(Object *obj)
> +{
> +    ISAPICState *s = ISA_PIC(obj);
> +
> +    qdev_init_gpio_in(DEVICE(s), isapic_set_irq, ISA_NUM_IRQS);
> +    qdev_init_gpio_out(DEVICE(s), s->out_irqs, ISA_NUM_IRQS);
> +
> +    for (int i = 0; i < ISA_NUM_IRQS; ++i) {
> +        s->in_irqs[i] = qdev_get_gpio_in(DEVICE(s), i);
> +    }
> +}
> +
> +static const TypeInfo isapic_info = {
> +    .name          = TYPE_ISA_PIC,
> +    .parent        = TYPE_DEVICE,
> +    .instance_size = sizeof(ISAPICState),
> +    .instance_init = isapic_init,
> +};
> +
>   static void pic_register_types(void)
>   {
>       type_register_static(&i8259_info);
> +    type_register_static(&isapic_info);
>   }
>   
>   type_init(pic_register_types)


ATB,

Mark.

