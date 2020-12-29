Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBB32E7144
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 15:10:29 +0100 (CET)
Received: from localhost ([::1]:59244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuFhk-0007xJ-3T
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 09:10:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kuFfP-00076F-TB; Tue, 29 Dec 2020 09:08:05 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49700
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kuFfN-000827-Lh; Tue, 29 Dec 2020 09:08:03 -0500
Received: from host86-148-34-1.range86-148.btcentralplus.com ([86.148.34.1]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kuFfG-0006xU-QB; Tue, 29 Dec 2020 14:07:59 +0000
To: David Gibson <david@gibson.dropbear.id.au>
References: <20201219104229.1964-1-mark.cave-ayland@ilande.co.uk>
 <20201219104229.1964-3-mark.cave-ayland@ilande.co.uk>
 <20201228070734.GD6952@yekko.fritz.box>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <77755607-6e1e-cb85-4201-ed042c876101@ilande.co.uk>
Date: Tue, 29 Dec 2020 14:07:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201228070734.GD6952@yekko.fritz.box>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.148.34.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 2/7] mac_oldworld: move initialisation of grackle before
 heathrow
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.07,
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
Cc: thuth@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/12/2020 07:07, David Gibson wrote:

> On Sat, Dec 19, 2020 at 10:42:24AM +0000, Mark Cave-Ayland wrote:
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> Looks correct, but it could really do with a rationale in the commit message.

It's just changing the order of initialisation since as the plan is to move the PIC 
to the macio device, the PCI bus needs to exist before the macio device is initiated 
and also before wiring up to the PIC. I'll come up with something along those lines 
for a v2.

>> ---
>>   hw/ppc/mac_oldworld.c | 30 +++++++++++++++---------------
>>   1 file changed, 15 insertions(+), 15 deletions(-)
>>
>> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
>> index 2ead34bdf1..e58e0525fe 100644
>> --- a/hw/ppc/mac_oldworld.c
>> +++ b/hw/ppc/mac_oldworld.c
>> @@ -227,6 +227,21 @@ static void ppc_heathrow_init(MachineState *machine)
>>           }
>>       }
>>   
>> +    /* Grackle PCI host bridge */
>> +    dev = qdev_new(TYPE_GRACKLE_PCI_HOST_BRIDGE);
>> +    qdev_prop_set_uint32(dev, "ofw-addr", 0x80000000);
>> +    s = SYS_BUS_DEVICE(dev);
>> +    sysbus_realize_and_unref(s, &error_fatal);
>> +
>> +    sysbus_mmio_map(s, 0, GRACKLE_BASE);
>> +    sysbus_mmio_map(s, 1, GRACKLE_BASE + 0x200000);
>> +    /* PCI hole */
>> +    memory_region_add_subregion(get_system_memory(), 0x80000000ULL,
>> +                                sysbus_mmio_get_region(s, 2));
>> +    /* Register 2 MB of ISA IO space */
>> +    memory_region_add_subregion(get_system_memory(), 0xfe000000,
>> +                                sysbus_mmio_get_region(s, 3));
>> +
>>       /* XXX: we register only 1 output pin for heathrow PIC */
>>       pic_dev = qdev_new(TYPE_HEATHROW);
>>       sysbus_realize_and_unref(SYS_BUS_DEVICE(pic_dev), &error_fatal);
>> @@ -251,21 +266,6 @@ static void ppc_heathrow_init(MachineState *machine)
>>           tbfreq = TBFREQ;
>>       }
>>   
>> -    /* Grackle PCI host bridge */
>> -    dev = qdev_new(TYPE_GRACKLE_PCI_HOST_BRIDGE);
>> -    qdev_prop_set_uint32(dev, "ofw-addr", 0x80000000);
>> -    s = SYS_BUS_DEVICE(dev);
>> -    sysbus_realize_and_unref(s, &error_fatal);
>> -
>> -    sysbus_mmio_map(s, 0, GRACKLE_BASE);
>> -    sysbus_mmio_map(s, 1, GRACKLE_BASE + 0x200000);
>> -    /* PCI hole */
>> -    memory_region_add_subregion(get_system_memory(), 0x80000000ULL,
>> -                                sysbus_mmio_get_region(s, 2));
>> -    /* Register 2 MB of ISA IO space */
>> -    memory_region_add_subregion(get_system_memory(), 0xfe000000,
>> -                                sysbus_mmio_get_region(s, 3));
>> -
>>       for (i = 0; i < 4; i++) {
>>           qdev_connect_gpio_out(dev, i, qdev_get_gpio_in(pic_dev, 0x15 + i));
>>       }


ATB,

Mark.

