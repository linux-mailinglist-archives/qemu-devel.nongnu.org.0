Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E66855FEDCC
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 14:03:55 +0200 (CEST)
Received: from localhost ([::1]:60704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojJPs-0004BK-CF
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 08:03:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ojJJE-0007gK-Mo; Fri, 14 Oct 2022 07:57:00 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:43923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ojJJB-000663-Pk; Fri, 14 Oct 2022 07:56:59 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9338C75A157;
 Fri, 14 Oct 2022 13:56:51 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 56665759B50; Fri, 14 Oct 2022 13:56:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 54D20746324;
 Fri, 14 Oct 2022 13:56:51 +0200 (CEST)
Date: Fri, 14 Oct 2022 13:56:51 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v3 05/13] mac_{old|new}world: Simplify cmdline_base
 calculation
In-Reply-To: <1a8cace1-1401-1420-d933-0ab7c7d78bfd@ilande.co.uk>
Message-ID: <2c3014a6-ad5-c595-6222-d82ae42ecf@eik.bme.hu>
References: <cover.1664827008.git.balaton@eik.bme.hu>
 <2514e45b2ac438e40180cdf51e156a9dcf6a4df4.1664827008.git.balaton@eik.bme.hu>
 <1a8cace1-1401-1420-d933-0ab7c7d78bfd@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 14 Oct 2022, Mark Cave-Ayland wrote:
> On 03/10/2022 21:13, BALATON Zoltan wrote:
>
>> By slight reorganisation we can avoid an else branch and some code
>> duplication which makes it easier to follow the code.
>> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   hw/ppc/mac_newworld.c | 6 +++---
>>   hw/ppc/mac_oldworld.c | 7 +++----
>>   2 files changed, 6 insertions(+), 7 deletions(-)
>> 
>> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
>> index 6bc3bd19be..73b01e8c6d 100644
>> --- a/hw/ppc/mac_newworld.c
>> +++ b/hw/ppc/mac_newworld.c
>> @@ -194,9 +194,11 @@ static void ppc_core99_init(MachineState *machine)
>>                            machine->kernel_filename);
>>               exit(1);
>>           }
>> +        cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size +
>> +                                         KERNEL_GAP);
>>           /* load initrd */
>>           if (machine->initrd_filename) {
>> -            initrd_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + 
>> KERNEL_GAP);
>> +            initrd_base = cmdline_base;
>>               initrd_size = load_image_targphys(machine->initrd_filename,
>>                                                 initrd_base,
>>                                                 machine->ram_size - 
>> initrd_base);
>> @@ -206,8 +208,6 @@ static void ppc_core99_init(MachineState *machine)
>>                   exit(1);
>>               }
>>               cmdline_base = TARGET_PAGE_ALIGN(initrd_base + initrd_size);
>> -        } else {
>> -            cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + 
>> KERNEL_GAP);
>>           }
>>           ppc_boot_device = 'm';
>>       } else {
>> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
>> index cb67e44081..b424729a39 100644
>> --- a/hw/ppc/mac_oldworld.c
>> +++ b/hw/ppc/mac_oldworld.c
>> @@ -168,10 +168,11 @@ static void ppc_heathrow_init(MachineState *machine)
>>                            machine->kernel_filename);
>>               exit(1);
>>           }
>> +        cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size +
>> +                                         KERNEL_GAP);
>>           /* load initrd */
>>           if (machine->initrd_filename) {
>> -            initrd_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size +
>> -                                            KERNEL_GAP);
>> +            initrd_base = cmdline_base;
>>               initrd_size = load_image_targphys(machine->initrd_filename,
>>                                                 initrd_base,
>>                                                 machine->ram_size - 
>> initrd_base);
>> @@ -181,8 +182,6 @@ static void ppc_heathrow_init(MachineState *machine)
>>                   exit(1);
>>               }
>>               cmdline_base = TARGET_PAGE_ALIGN(initrd_base + initrd_size);
>> -        } else {
>> -            cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + 
>> KERNEL_GAP);
>>           }
>>           ppc_boot_device = 'm';
>>       } else {
>
> Is there any particular reason why you would want to avoid the else branch? I

It avoids code duplication and to me it's easier to follow than an else 
branch. With this patch cmdline_base calculation is clearly tied to 
kernel_base and kernel_size if only kernel is used and initrd_base 
initrd_size when initrd is used. With the else branch it's less obvious 
because it's set much later in the else branch while initrd_base 
duplicates it above. So avoiding this duplication makes the code easier to 
read and less prone to errors if the calculation is ever modified.

> don't feel this patch is an improvement since by always setting cmdline_base 
> to a non-zero value, as a reviewer I then have to check all other uses of 
> cmdline_base in the file to ensure that this doesn't cause any issues.

There aren't that many uses that it's difficult to check and this only 
need to be done once.

> I much prefer the existing version since setting the values of cmdline_base 
> and initrd_base is very clearly scoped within the if statement.

What can I say, it's hard to argue with preferences but avoiding code 
duplication is worth the effort reviewing this patch in my opinion.

Regards,
BALATON Zoltan


