Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A29E75EF588
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 14:37:01 +0200 (CEST)
Received: from localhost ([::1]:37132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odsmi-0004di-J9
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 08:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1odrmI-00008Q-6G; Thu, 29 Sep 2022 07:32:31 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:38759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1odrmF-0007yL-Ja; Thu, 29 Sep 2022 07:32:29 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3CD4275A0FE;
 Thu, 29 Sep 2022 13:32:21 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C7789759B50; Thu, 29 Sep 2022 13:32:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C4DB374633D;
 Thu, 29 Sep 2022 13:32:20 +0200 (CEST)
Date: Thu, 29 Sep 2022 13:32:20 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v2 05/13] mac_oldworld: Do not open code sysbus_mmio_map()
In-Reply-To: <7bc0d445-009e-ba7c-d79f-5c67e5b9ddd3@ilande.co.uk>
Message-ID: <41707493-e27f-53b3-dcde-4543670b7c@eik.bme.hu>
References: <cover.1664108862.git.balaton@eik.bme.hu>
 <f6b0aa3528e9bd538c7111cd29e89a0c3623fbe5.1664108862.git.balaton@eik.bme.hu>
 <7bc0d445-009e-ba7c-d79f-5c67e5b9ddd3@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Sep 2022, Mark Cave-Ayland wrote:
> On 25/09/2022 13:38, BALATON Zoltan wrote:
>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   hw/ppc/mac_oldworld.c | 8 ++------
>>   1 file changed, 2 insertions(+), 6 deletions(-)
>> 
>> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
>> index cb67e44081..75fbd2a7df 100644
>> --- a/hw/ppc/mac_oldworld.c
>> +++ b/hw/ppc/mac_oldworld.c
>> @@ -218,16 +218,12 @@ static void ppc_heathrow_init(MachineState *machine)
>>       qdev_prop_set_uint32(grackle_dev, "ofw-addr", 0x80000000);
>>       s = SYS_BUS_DEVICE(grackle_dev);
>>       sysbus_realize_and_unref(s, &error_fatal);
>> -
>>       sysbus_mmio_map(s, 0, GRACKLE_BASE);
>>       sysbus_mmio_map(s, 1, GRACKLE_BASE + 0x200000);
>>       /* PCI hole */
>> -    memory_region_add_subregion(get_system_memory(), 0x80000000ULL,
>> -                                sysbus_mmio_get_region(s, 2));
>> +    sysbus_mmio_map(s, 2, 0x80000000);
>>       /* Register 2 MB of ISA IO space */
>> -    memory_region_add_subregion(get_system_memory(), 0xfe000000,
>> -                                sysbus_mmio_get_region(s, 3));
>> -
>> +    sysbus_mmio_map(s, 3, 0xfe000000);
>>       pci_bus = PCI_HOST_BRIDGE(grackle_dev)->bus;
>>         /* MacIO */
>
> Please drop this patch for now. The code was written on assumption that both 
> sysbus and sysbus devices would be going away soon, and there are certainly 
> discussions under way about coming up with a migration strategy to allow them 
> to be completely removed.

This patch actually simplifies transition from sysbus to whatever else 
will be decided because then you'll surely have a way to replace 
sysbus_mmio_map() that's used everywhere else with something. This file 
now has both sysbus_mmio_map and sysbus mmio_get_region so using only one 
will make it easier to convert it and until then it's easier to read so I 
don't agree with this suggestion and want to stick to these patches (same 
with uninorth). Please reconsider your decision.

Regards,
BALATON Zoltan

