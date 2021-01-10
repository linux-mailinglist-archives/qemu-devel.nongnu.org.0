Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EEC2F06A8
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 12:35:07 +0100 (CET)
Received: from localhost ([::1]:45756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyYzx-00070x-Nu
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 06:35:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyYzD-0006bU-M1
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 06:34:19 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyYzB-0005dU-U0
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 06:34:19 -0500
Received: by mail-wr1-x431.google.com with SMTP id t16so13455863wra.3
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 03:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gsLoGnCjwtzjihjv1jUdjRYewedFABB8JGU3THzOK3M=;
 b=DGMwH3GL7dB0FyL8JdhRDMbLGehpg0SjbFRYucv7rBZ1NTDIphtdYmc4h2+4g0JK7G
 8/v5HCSMA29pRaOK3G3padYWMmuvyddDh2J9v3tKhdaT3JbrsylYRHl7LCwTFCOx8G9y
 Obcv7neh17ye85w1T5oE+WfcHJlgnaMu03rvvRWIuN6Ge4piHOl/Y5OXjLqlEnYxvSM3
 V2gGM0YK6vYFSxmXgYgf4VNsvoQ1pQUdw8evoH7l8xCzIFCZdn9WKJKBt7A3KaSzlGER
 0C3jw8herv5WXMyOOYkt1B5DA4stAEM7ptN0NQWmWep7oEIE8BlTii0GiAQPmONst9dx
 TW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gsLoGnCjwtzjihjv1jUdjRYewedFABB8JGU3THzOK3M=;
 b=i1HX4ZO7S95aT6dYrpFz550FiSmVNmqeu3lPHmOPIDsslCvVSaXefjyNVjdW2Rv2eH
 wgBXyqMUq5YXsrDLE8RLoBeNVfsPDjdSxsKJFcb80DEPCW2d6cksdsh+OO4KU7oayJ+c
 rR9gsAq0Y5KyMOMio38X083c5L5T+gDFd4cVEGU9zqdNGfGSCeKpL3v9cXmsGHKKI6V2
 xMK9JnkLHKGaqGrf5Bo0Dw7+hz+GXLbCQzHQKzYeYrJknqFanGF9WI4VWacGPfvG3mNH
 bZ+CL7rUIapVDm7JV3s9nAalpxHr2kiWIhkyNcYQkmAxEw3tpKvo5V7pm3Ytw0I8Sq7A
 w7Xw==
X-Gm-Message-State: AOAM530KKAsDlmGIu+3JsFwUfIKTuHyKGWhUolqmgR7BmDICGcThH8l3
 tcM26GHiLv7N//jro596ioE=
X-Google-Smtp-Source: ABdhPJyx4zLk7q8RiyKWx54dhdJuVM6ITw3ihiwt9uh8u/mkVfCMpKgJ1kNFqmuBqkIwgW+JCgi4vQ==
X-Received: by 2002:a5d:6cc2:: with SMTP id c2mr11773131wrc.374.1610278456431; 
 Sun, 10 Jan 2021 03:34:16 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id s6sm22078930wro.79.2021.01.10.03.34.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Jan 2021 03:34:15 -0800 (PST)
Subject: Re: [PATCH v2 08/13] vt82c686: Move creation of ISA devices to the
 ISA bridge
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <cover.1610223396.git.balaton@eik.bme.hu>
 <bf9400cc8e4ddd3129aa5678de4d3cf38384805f.1610223397.git.balaton@eik.bme.hu>
 <f77d6471-d19d-a1c2-e447-18181d55ba86@amsat.org>
 <5c5ce8b9-f5c4-c58d-6f8a-76c47ad8db4d@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2a45450d-8357-c03e-7e11-bd59bffa61ae@amsat.org>
Date: Sun, 10 Jan 2021 12:34:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <5c5ce8b9-f5c4-c58d-6f8a-76c47ad8db4d@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.255,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+PCI experts

On 1/10/21 1:43 AM, BALATON Zoltan wrote:
> On Sun, 10 Jan 2021, Philippe Mathieu-Daudé wrote:
>> Hi Zoltan,
>>
>> On 1/9/21 9:16 PM, BALATON Zoltan wrote:
>>> Currently the ISA devices that are part of the VIA south bridge,
>>> superio chip are wired up by board code. Move creation of these ISA
>>> devices to the VIA ISA bridge model so that board code does not need
>>> to access ISA bus. This also allows vt82c686b-superio to be made
>>> internal to vt82c686 which allows implementing its configuration via
>>> registers in subseqent commits.
>>
>> Is this patch dependent of the VT82C686B_PM changes
>> or can it be applied before them?
> 
> I don't know but why would that be better? I thought it's clearer to
> clean up pm related parts first before moving more stuff to this file so
> that's why this patch comes after (and also because that's the order I
> did it).

Not any better, but easier for me to get your patches integrated,
as I'm reviewing your patches slowly. Finding other reviewers
would certainly help.

>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> ---
>>>  hw/isa/vt82c686.c   | 20 ++++++++++++++++++++
>>>  hw/mips/fuloong2e.c | 29 +++++------------------------
>>>  2 files changed, 25 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>>> index 58c0bba1d0..5df9be8ff4 100644
>>> --- a/hw/isa/vt82c686.c
>>> +++ b/hw/isa/vt82c686.c
>>> @@ -16,6 +16,11 @@
>>>  #include "hw/qdev-properties.h"
>>>  #include "hw/isa/isa.h"
>>>  #include "hw/isa/superio.h"
>>> +#include "hw/intc/i8259.h"
>>> +#include "hw/irq.h"
>>> +#include "hw/dma/i8257.h"
>>> +#include "hw/timer/i8254.h"
>>> +#include "hw/rtc/mc146818rtc.h"
>>>  #include "migration/vmstate.h"
>>>  #include "hw/isa/apm.h"
>>>  #include "hw/acpi/acpi.h"
>>> @@ -307,9 +312,16 @@ OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BISAState,
>>> VT82C686B_ISA)
>>>
>>>  struct VT82C686BISAState {
>>>      PCIDevice dev;
>>> +    qemu_irq cpu_intr;
>>>      SuperIOConfig superio_cfg;
>>>  };
>>>
>>> +static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
>>> +{
>>> +    VT82C686BISAState *s = opaque;
>>> +    qemu_set_irq(s->cpu_intr, level);
>>> +}
>>> +
>>>  static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
>>>                                     uint32_t val, int len)
>>>  {
>>> @@ -365,10 +377,18 @@ static void vt82c686b_realize(PCIDevice *d,
>>> Error **errp)
>>>      VT82C686BISAState *s = VT82C686B_ISA(d);
>>>      DeviceState *dev = DEVICE(d);
>>>      ISABus *isa_bus;
>>> +    qemu_irq *isa_irq;
>>>      int i;
>>>
>>> +    qdev_init_gpio_out(dev, &s->cpu_intr, 1);
>>
>> Why not use the SysBus API?
> 
> How? This is a PCIDevice not a SysBusDevice.

Indeed :)

>>> +    isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
>>>      isa_bus = isa_bus_new(dev, get_system_memory(),
>>> pci_address_space_io(d),
>>>                            &error_fatal);
>>
>> Isn't it get_system_memory() -> pci_address_space(d)?
> 
> I don't really know. Most other places that create an isa bus seem to
> also use get_system_memory(), only piix4 uses pci_address_space(dev) so
> I thought if those others are OK this should be too.

I'm not a PCI expert but my understanding is PCI device functions are
restricted to the PCI bus address space. The host bridge may map this
space within the host.

QEMU might be using get_system_memory() because for some host bridge
the mapping is not implemented so it was easier this way?

Regards,

Phil.

