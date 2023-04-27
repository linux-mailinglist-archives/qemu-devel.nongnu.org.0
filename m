Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 419F76F04E5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 13:24:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1przis-0004gS-Qu; Thu, 27 Apr 2023 07:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1przih-0004g3-SX; Thu, 27 Apr 2023 07:23:29 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1przif-0002fP-G5; Thu, 27 Apr 2023 07:23:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QAtc4RVVOtmbGShcBKPKmST2qLf41s2lOq5nJwGfkUU=; b=EOLmpBNRh716N9XnpoR8yBgTp+
 UQ2xQr6pgwcxre1Xd8dFgv9UlRA1OegwNCx61Doi1GlTXjlyezTU6gD+om8M0POl7w6ICAVKVdDtd
 t/5fAnasv+voil6Ro01W1copShT6tdeQAQCDEIYF3TgnmQMo2LTwGdvCAbIPQe7ynLwHjufUNUq+O
 wVc1IXteVgXrodyGEqTMo8Cb3D5CTtS1TAH4i0QC2gk0zRMbpCAXcD8jh1B+LBseitW1zNOyA5Pbu
 YLzJjNSIAS4VWLO7WCf003QtWuKXfTzEiXHakrhOf4Y/QKPewwfFXTbaAfg8cgIepfJQrEyQNitva
 I4pi6Ns/T2mhFdUwy4UTLbhiHzSD0oO3Kyzi9MI+HK8lCpWyeMNn6vLO1eCWLvglPES6NLg9kbqxY
 L/m2F22ma20dnZdqwlACfoXJxGfMMYY/Enlzm03/YWALrt9GhNsfT4vg4UxZYYPslrU18aPPztITJ
 TokgaNgwEQegmYKhrrxQnUI0n1eNetEIAUUzz4lTr3mFo0pL0EhyRSuiEbIW8tTTuU+7W/vOdYdtq
 rJHKh5y2PDEWWYZXkv8TgkRuI75ixeukszsUGLOql4xKi4V614dpPsntYYgSmpzHxvg4RMximZOXu
 F/qASWNBF6ZDVA4KuXD9iEOgtYbPA20YtAl7bokms=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1przhb-00038v-N8; Thu, 27 Apr 2023 12:22:23 +0100
Message-ID: <df449cf0-c1f1-b9cb-8c9e-45b9ed7f1978@ilande.co.uk>
Date: Thu, 27 Apr 2023 12:23:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20230302224058.43315-1-philmd@linaro.org>
 <20230302224058.43315-4-philmd@linaro.org>
 <a233b5c7-56a6-ac94-c7c1-9fa5da9acb9c@ilande.co.uk>
 <3A39AAE9-73FC-4C56-9BD6-0DA2D78548E0@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <3A39AAE9-73FC-4C56-9BD6-0DA2D78548E0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 03/18] hw/i386/pc_piix: Wire PIIX3 IDE ouput IRQs to
 ISA bus IRQs 14/15
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

On 27/04/2023 08:58, Bernhard Beschow wrote:

> Am 26. April 2023 12:50:08 UTC schrieb Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>:
>> On 02/03/2023 22:40, Philippe Mathieu-Daudé wrote:
>>
>>> Since pc_init1() has access to the ISABus*, retrieve the
>>> ISA IRQs with isa_bus_get_irq().
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>    hw/i386/pc_piix.c | 8 +++++++-
>>>    1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>>> index 126b6c11df..1e90b9ff0d 100644
>>> --- a/hw/i386/pc_piix.c
>>> +++ b/hw/i386/pc_piix.c
>>> @@ -277,7 +277,13 @@ static void pc_init1(MachineState *machine,
>>>        if (pcmc->pci_enabled) {
>>>            PCIDevice *dev;
>>>    -        dev = pci_create_simple(pci_bus, piix3_devfn + 1, TYPE_PIIX3_IDE);
>>> +        dev = pci_new_multifunction(piix3_devfn + 1, false, TYPE_PIIX3_IDE);
>>> +        qdev_connect_gpio_out_named(DEVICE(dev), "ide-irq", 0,
>>> +                                    isa_bus_get_irq(isa_bus, 14));
>>> +        qdev_connect_gpio_out_named(DEVICE(dev), "ide-irq", 1,
>>> +                                    isa_bus_get_irq(isa_bus, 15));
>>> +        pci_realize_and_unref(dev, pci_bus, &error_fatal);
>>> +
>>>            pci_ide_create_devs(dev);
>>>            idebus[0] = qdev_get_child_bus(&dev->qdev, "ide.0");
>>>            idebus[1] = qdev_get_child_bus(&dev->qdev, "ide.1");
>>
>> Another reason this probably isn't a good idea: you're having to call qdev_connect_gpio_*() before realizing the device :(
> 
> Just curious: Resources like memory regions are assigned before realization, see e.g. i440fx or q35. Interrupts are also resources. What makes them special?

I think I've covered the .instance_init() vs. realize() part in my reply to Zoltan, 
but in terms of qdev_connect_gpio_out_named() the reasoning here is that a device 
shouldn't change it's internal behaviour depending upon how it is wired. In other 
words a standalone device will behave exactly the same as a device connected into a 
machine.

> I'm asking since this issue seems to be the main blocker for the piix consolidation to be merged.

I did have a brief catch-up with Phil at the start of the week, and he's tagged your 
series for review but he is really busy at the moment. As before I repeat my offer to 
help out if needed as I think it's a good series, but for now we're waiting for Phil 
to let us know what the next steps are...


ATB,

Mark.

