Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2292AD71B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 14:08:01 +0100 (CET)
Received: from localhost ([::1]:56156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcTNQ-0001ge-S4
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 08:08:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kcTMe-0001C4-0D
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 08:07:12 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43554
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kcTMc-0002DW-98
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 08:07:11 -0500
Received: from host86-184-131-53.range86-184.btcentralplus.com
 ([86.184.131.53] helo=[192.168.1.110])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kcTMj-0006Fd-SC; Tue, 10 Nov 2020 13:07:22 +0000
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201106235109.7066-1-peter.maydell@linaro.org>
 <20201106235109.7066-2-peter.maydell@linaro.org>
 <11e6fcf5-fbd3-d2d8-ab20-c017080599d4@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <7ac6db3a-fd30-f55d-bf65-25e29628347e@ilande.co.uk>
Date: Tue, 10 Nov 2020 13:07:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <11e6fcf5-fbd3-d2d8-ab20-c017080599d4@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.184.131.53
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 1/2] hw/m68k/q800: Don't connect two qemu_irqs directly to
 the same input
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Laurent Vivier <laurent@vivier.eu>, Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/11/2020 14:52, Philippe Mathieu-Daudé wrote:

> Cc'ing SPARC maintainers ...
> 
> On 11/7/20 12:51 AM, Peter Maydell wrote:
>> The q800 board code connects both of the IRQ outputs of the ESCC
>> to the same pic[3] qemu_irq. Connecting two qemu_irqs outputs directly
>> to the same input is not valid as it produces subtly wrong behaviour
>> (for instance if both the IRQ lines are high, and then one goes
>> low, the PIC input will see this as a high-to-low transition
>> even though the second IRQ line should still be holding it high).
>>
>> This kind of wiring needs an explicitly created OR gate; add one.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>   hw/m68k/q800.c  | 12 ++++++++++--
>>   hw/m68k/Kconfig |  1 +
>>   2 files changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
>> index ce4b47c3e34..dc13007aaf2 100644
>> --- a/hw/m68k/q800.c
>> +++ b/hw/m68k/q800.c
>> @@ -28,6 +28,7 @@
>>   #include "hw/hw.h"
>>   #include "hw/boards.h"
>>   #include "hw/irq.h"
>> +#include "hw/or-irq.h"
>>   #include "elf.h"
>>   #include "hw/loader.h"
>>   #include "ui/console.h"
>> @@ -171,6 +172,7 @@ static void q800_init(MachineState *machine)
>>       CPUState *cs;
>>       DeviceState *dev;
>>       DeviceState *via_dev;
>> +    DeviceState *escc_orgate;
>>       SysBusESPState *sysbus_esp;
>>       ESPState *esp;
>>       SysBusDevice *sysbus;
>> @@ -283,8 +285,14 @@ static void q800_init(MachineState *machine)
>>       qdev_prop_set_uint32(dev, "chnAtype", 0);
>>       sysbus = SYS_BUS_DEVICE(dev);
>>       sysbus_realize_and_unref(sysbus, &error_fatal);
>> -    sysbus_connect_irq(sysbus, 0, pic[3]);
>> -    sysbus_connect_irq(sysbus, 1, pic[3]);
> 
> ... because sun4m_hw_init() has the same issue:
> 
>   986     dev = qdev_new(TYPE_ESCC);
> ...
>   996     sysbus_connect_irq(s, 0, slavio_irq[14]);
>   997     sysbus_connect_irq(s, 1, slavio_irq[14]);
> ...
> 1011     sysbus_connect_irq(s, 0, slavio_irq[15]);
> 1012     sysbus_connect_irq(s, 1,  slavio_irq[15]);

Good spot. I'm fairly confident the code has been like this for a long time, so I 
don't see this is a being a critical fix for 5.2. I'll add it to my 6.0 TODO list.


ATB,

Mark.

