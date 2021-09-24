Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCE441703C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 12:21:47 +0200 (CEST)
Received: from localhost ([::1]:44364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTiKx-0001Bb-2D
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 06:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mThjj-0000tb-EE
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:43:19 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50478
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mThjg-00017P-Qf
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:43:19 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mThjV-0003ou-Dq; Fri, 24 Sep 2021 10:43:09 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, laurent@vivier.eu
References: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
 <20210923091308.13832-19-mark.cave-ayland@ilande.co.uk>
 <2e859345-2285-6b29-a3a0-7c888f73cc93@amsat.org>
 <43591fdf-045b-6c33-d54b-a3f18f0c5d58@ilande.co.uk>
 <8e879ded-3a4e-b12f-1479-62401af06927@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <c6f78afe-8a20-cfb4-5f71-e46d1d09ea5c@ilande.co.uk>
Date: Fri, 24 Sep 2021 10:43:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <8e879ded-3a4e-b12f-1479-62401af06927@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v5 18/20] nubus: add support for slot IRQs
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/09/2021 10:01, Philippe Mathieu-Daudé wrote:
> On 9/24/21 09:06, Mark Cave-Ayland wrote:
>> On 23/09/2021 10:49, Philippe Mathieu-Daudé wrote:
>>
>>> On 9/23/21 11:13, Mark Cave-Ayland wrote:
>>>> Each Nubus slot has an IRQ line that can be used to request service from the
>>>> CPU. Connect the IRQs to the Nubus bridge so that they can be wired up using qdev
>>>> gpios accordingly, and introduce a new nubus_set_irq() function that can be used
>>>> by Nubus devices to control the slot IRQ.
>>>>
>>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>>>> ---
>>>>   hw/nubus/nubus-bridge.c  | 2 ++
>>>>   hw/nubus/nubus-device.c  | 8 ++++++++
>>>>   include/hw/nubus/nubus.h | 6 ++++++
>>>>   3 files changed, 16 insertions(+)
>>>
>>>>   static Property nubus_bridge_properties[] = {
>>>> diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
>>>> index 280f40e88a..0f1852f671 100644
>>>> --- a/hw/nubus/nubus-device.c
>>>> +++ b/hw/nubus/nubus-device.c
>>>> @@ -10,12 +10,20 @@
>>>>   #include "qemu/osdep.h"
>>>>   #include "qemu/datadir.h"
>>>> +#include "hw/irq.h"
>>>>   #include "hw/loader.h"
>>>>   #include "hw/nubus/nubus.h"
>>>>   #include "qapi/error.h"
>>>>   #include "qemu/error-report.h"
>>>> +void nubus_set_irq(NubusDevice *nd, int level)
>>>> +{
>>>> +    NubusBus *nubus = NUBUS_BUS(qdev_get_parent_bus(DEVICE(nd)));
>>>> +
>>>
>>> A trace-event could be helpful here, otherwise:
>>>
>>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>
>>>> +    qemu_set_irq(nubus->irqs[nd->slot], level);
>>>> +}
>>
>> I think adding a trace event here would just be too verbose (particularly if you 
>> have more than one nubus device) and not particularly helpful: normally the part 
>> you want to debug is the in the device itself looking at which constituent flags 
>> combine to raise/lower the interrupt line. And once you've done that then you've 
>> already got a suitable trace-event in place...
> 
> But devices accessing the bus are not aware of which devices are plugged
> onto it. Wait, what is suppose to call nubus_set_irq()? Devices on the
> bus, to propagate the interrupt up to the CPU?

Yes indeed, that is correct.

> OK so then the trace
> event is irrelevant indeed. I understood this API as any external device
> could trigger an IRQ to device on the bus. I wonder if renaming as
> nubus_device_set_irq() could make it clearer. Or even simpler, add
> a comment in "hw/nubus/nubus.h" explaining what nubus_set_irq() is for
> to avoid any confusion, and we are good.

The function name and signature nubus_set_irq(NubusDevice *nd, int level) was chosen 
because it was intended to be the Nubus equivalent of PCI's pci_set_irq(PCIDevice *d, 
int level) where the first parameter of both functions nicely indicates that this is 
to be called by the device. I don't think we've had any reports of confusion with the 
existing pci_set_irq() function usage?

Another thing that makes me less worried is that the next series after this contains 
a number of changes for the macfb device, including the addition of VBL interrupts 
implemented using nubus_set_irq() so at that point there will be a grep-able usage 
example in the codebase.


ATB,

Mark.

