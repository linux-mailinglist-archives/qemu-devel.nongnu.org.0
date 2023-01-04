Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C96165DAC2
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 17:52:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD6zY-0008Eb-Td; Wed, 04 Jan 2023 11:51:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pD6zW-0008EC-TH; Wed, 04 Jan 2023 11:51:50 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pD6zU-0002el-Vg; Wed, 04 Jan 2023 11:51:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tyMscZuCsdbui4aXTsU7Uy7wx9bRLRfx9/o5lxPdlAg=; b=m81NsP7jCv1t0SmSkc0xkTVI2l
 tjYXZjPZErBy/8TUOaQwMAaKvPBfIFwssd7EfL2s0CHiccKm0LDfR7D14jkzx/GEfSInNd99P/DuT
 57euHILdLoOSDXkDkOzqHbHviXQXvMqg5mB+OJ4IDBO8C/dxcbcQ+lZOo5ZFHF3AnwtU56jJQ2RwX
 wS7bnA4W+htL7D1G7o9vFDPASDKirwYOfcRMHyg4/yF0anx2JL//nnTeiUneEKUJNBjHFpuJjsr2A
 0loTDTDzhrtkq61ne+O3CoopXuBq+U3nQtv8/HnXrrJLJfj96bkCO1Ub45dfM7iJ82zIhqCgaFjzq
 enapDoqeGzTCKCE2MrFYBTpfcNBGxo8YWFyrZsZxzksQI9SdOfL6EU5y9KksfNAdV144z02suPJaP
 Wz0F0RBFBahhTHs2INbTbreOWhrnm/YfafDAQ3CBXyVNciyDeejOl6+jcmW4tEKb71Uy6RY04rQMJ
 oym2zZ2tvmM2B1cnhoSPxWZN7GHq5D2N1uPo23O1+0gkrbpcBBsNSX8D1MasTpCmqCo77vda8yQn6
 qhNSYpW5IeKNPzx/CgRnNP6raZGWlv5h2/kMkH+Q1FzMHEsfezEUCttz3nm9DMAsT63oqvuhet9s/
 Rg4lyXxWBA29UQLcAHIKjQM005uBezJDQKmG73+J0=;
Received: from [2a00:23c4:8baa:1d00:e655:fde:753f:696a]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pD6yz-000AJO-Oy; Wed, 04 Jan 2023 16:51:21 +0000
Message-ID: <86feb17e-2ef5-5047-d21e-98caf3c32e06@ilande.co.uk>
Date: Wed, 4 Jan 2023 16:51:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Mark Burton <mburton@qti.qualcomm.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20221221170003.2929-1-shentey@gmail.com>
 <20221221170003.2929-13-shentey@gmail.com>
 <3986f4f2-d6bd-9abe-42ef-18311de53bf6@linaro.org>
 <112DBAA3-978C-42C5-B1A5-F614D7A2141B@gmail.com>
 <b82d440e-94e2-c01d-a09d-ce097b29f4c4@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <b82d440e-94e2-c01d-a09d-ce097b29f4c4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:1d00:e655:fde:753f:696a
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v4 12/30] hw/core: Introduce proxy-pic
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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

On 04/01/2023 16:35, Philippe Mathieu-Daudé wrote:

> On 4/1/23 17:01, Bernhard Beschow wrote:
>> Am 4. Januar 2023 14:37:29 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>>> On 21/12/22 17:59, Bernhard Beschow wrote:
>>>> Having a proxy PIC allows for ISA PICs to be created and wired up in
>>>> southbridges. This is especially useful for PIIX3 for two reasons:
>>>> First, the southbridge doesn't need to care about the virtualization
>>>> technology used (KVM, TCG, Xen) due to in-IRQs (where devices get
>>>> attached) and out-IRQs (which will trigger the IRQs of the respective
>>>> virtzalization technology) are separated. Second, since the in-IRQs are
> 
> Typo "virtualization".
> 
>>>> populated with fully initialized qemu_irq's, they can already be wired
>>>> up inside PIIX3.
>>>>
>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>>> Message-Id: <20221022150508.26830-15-shentey@gmail.com>
>>>> ---
>>>>    MAINTAINERS                 |  2 ++
>>>>    hw/core/Kconfig             |  3 ++
>>>>    hw/core/meson.build         |  1 +
>>>>    hw/core/proxy-pic.c         | 70 +++++++++++++++++++++++++++++++++++++
>>>>    include/hw/core/proxy-pic.h | 54 ++++++++++++++++++++++++++++
>>>>    5 files changed, 130 insertions(+)
>>>>    create mode 100644 hw/core/proxy-pic.c
>>>>    create mode 100644 include/hw/core/proxy-pic.h
>>>
>>> Please enable scripts/git.orderfile.
>>
>> Will do.
>>
>>>> diff --git a/include/hw/core/proxy-pic.h b/include/hw/core/proxy-pic.h
>>>> new file mode 100644
>>>> index 0000000000..0eb40c478a
>>>> --- /dev/null
>>>> +++ b/include/hw/core/proxy-pic.h
>>>> @@ -0,0 +1,54 @@
>>>> +/*
>>>> + * Proxy interrupt controller device.
>>>> + *
>>>> + * Copyright (c) 2022 Bernhard Beschow <shentey@gmail.com>
>>>> + *
>>>> + * Permission is hereby granted, free of charge, to any person obtaining a copy
>>>> + * of this software and associated documentation files (the "Software"), to deal
>>>> + * in the Software without restriction, including without limitation the rights
>>>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>>>> + * copies of the Software, and to permit persons to whom the Software is
>>>> + * furnished to do so, subject to the following conditions:
>>>> + *
>>>> + * The above copyright notice and this permission notice shall be included in
>>>> + * all copies or substantial portions of the Software.
>>>> + *
>>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
>>>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>>>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>>>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
>>>> + * THE SOFTWARE.
>>>
>>> This is the MIT license right? Do you mind adding a SPDX tag along?
>>
>> I based my implementation on TYPE_SPLIT_IRQ as you suggested before and thus 
>> preserved the license.
>>
>>> * SPDX-License-Identifier: MIT
>>
>> Or just replace the wall of text with this line? This should suffice, no?
> 
> IIUC (IANAL) I can only suggest you to add a SPDX tag to the license you
> chose, not ask you to remove the text; but since you ask/propose, the
> tag suffices indeed. I suggest the tag use because it is clearer than
> trying to match the full (often copy/pasted with typos) license text.
> 
>>>> + */
>>>> +
>>>> +#ifndef HW_PROXY_PIC_H
>>>> +#define HW_PROXY_PIC_H
>>>> +
>>>> +#include "hw/qdev-core.h"
>>>> +#include "qom/object.h"
>>>> +#include "hw/irq.h"
>>>> +
>>>> +#define TYPE_PROXY_PIC "proxy-pic"
>>>> +OBJECT_DECLARE_SIMPLE_TYPE(ProxyPICState, PROXY_PIC)
>>>> +
>>>> +#define MAX_PROXY_PIC_LINES 16
>>>> +
>>>> +/**
>>>> + * This is a simple device which has 16 pairs of GPIO input and output lines.
>>>> + * Any change on an input line is forwarded to the respective output.
>>>> + *
>>>> + * QEMU interface:
>>>> + *  + 16 unnamed GPIO inputs: the input lines
>>>> + *  + 16 unnamed GPIO outputs: the output lines
>>>> + */
>>>
>>> Why restrict to 16 and not use a class property and allocate
>>> on the heap? See TYPE_SPLIT_IRQ for example.
>>
>> TYPE_SPLIT_IRQ doesn't allocate on the heap and instead has a hardcoded limit of 
>> MAX_SPLIT_LINES which equals 16 ;)
>>
>> I was unsure on when to free the memory and how to dispose the elements so I went 
>> with this solution for simplicity. I'll look for inspitation in other device models 
>> and respin.
> 
> Oh indeed. Well this model as is is OK, but it could be more useful
> if able to proxy any range of IRQs.
> 
> I have the feeling we are cycling around this IRQ proxy:
> 
> 22ec3283ef ("irq: introduce qemu_irq_proxy()")
> 078778c5a5 ("piix4: Add an i8259 Interrupt Controller as specified in datasheet")
> fc531e7cab ("Revert "irq: introduce qemu_irq_proxy()"")
> 
> What is our problem? IRQ lines connect 2 devices in a fixed direction.
> Current model expects one edge to be wired to a device before wiring
> the other device, so device composition with IRQs in middle is
> impossible? If so, this doesn't scale with dynamic machine creation.
> 
> Maybe the IRQ wiring should be another machine phase, after all
> devices are instantiated?
> 
> Your approach is to create the 'IRQ proxy' first, like drawing the
> wires on a board, then plug the devices, like soldering chips on
> the printed board IRQs. So maybe devices shouldn't be the QOM owners
> of IRQs, the board should...
> 
> Yeah, just thinking loudly...

The main problem is that a lot of the old x86 code references QEMU IRQs directly 
instead of using qdev gpios, and so this proxy-pic device is a temporary glue which 
allows the x86 PIC board wiring to be done with qdev gpios, but still allow the 
various PIC implementations to access the QEMU IRQs directly as required.

One of my review comments from a previous version of the patch is that whilst this 
isn't a full qdev gpio conversion of all the x86 PIC implementations (which is likely 
a whole project in itself), there is a lot of good tidy-up work in this series. So as 
long as proxy-pic isn't directly exposed (for example, having qdev properties that 
are set by command line) I still think the series is worth merging in its current form.


ATB,

Mark.

