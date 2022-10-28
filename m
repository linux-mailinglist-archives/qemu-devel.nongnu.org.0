Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EE8611047
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 13:59:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooO1E-0001s1-QN; Fri, 28 Oct 2022 07:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ooO1D-0001p5-3U; Fri, 28 Oct 2022 07:59:23 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ooO1A-0006ft-RQ; Fri, 28 Oct 2022 07:59:22 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4F6D775A15D;
 Fri, 28 Oct 2022 13:59:18 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0196875A135; Fri, 28 Oct 2022 13:59:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id F3BEC75A15C;
 Fri, 28 Oct 2022 13:59:17 +0200 (CEST)
Date: Fri, 28 Oct 2022 13:59:17 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v3 05/13] mac_{old|new}world: Simplify cmdline_base
 calculation
In-Reply-To: <16bb7a56-ed91-a829-ab5b-94b4be564e71@ilande.co.uk>
Message-ID: <b1c8bf62-cebe-5350-222b-11f25c0abfa@eik.bme.hu>
References: <cover.1664827008.git.balaton@eik.bme.hu>
 <2514e45b2ac438e40180cdf51e156a9dcf6a4df4.1664827008.git.balaton@eik.bme.hu>
 <1a8cace1-1401-1420-d933-0ab7c7d78bfd@ilande.co.uk>
 <2c3014a6-ad5-c595-6222-d82ae42ecf@eik.bme.hu>
 <a5fdd3f0-9f2d-4281-d73e-7cef108962a4@eik.bme.hu>
 <16bb7a56-ed91-a829-ab5b-94b4be564e71@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1420606215-1666958357=:83784"
X-Spam-Probability: 9%
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1420606215-1666958357=:83784
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 28 Oct 2022, Mark Cave-Ayland wrote:
> On 14/10/2022 16:25, BALATON Zoltan wrote:
>> On Fri, 14 Oct 2022, BALATON Zoltan wrote:
>>> On Fri, 14 Oct 2022, Mark Cave-Ayland wrote:
>>>> On 03/10/2022 21:13, BALATON Zoltan wrote:
>>>> 
>>>>> By slight reorganisation we can avoid an else branch and some code
>>>>> duplication which makes it easier to follow the code.
>>>>> 
>>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>>> ---
>>>>>   hw/ppc/mac_newworld.c | 6 +++---
>>>>>   hw/ppc/mac_oldworld.c | 7 +++----
>>>>>   2 files changed, 6 insertions(+), 7 deletions(-)
>>>>> 
>>>>> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
>>>>> index 6bc3bd19be..73b01e8c6d 100644
>>>>> --- a/hw/ppc/mac_newworld.c
>>>>> +++ b/hw/ppc/mac_newworld.c
>>>>> @@ -194,9 +194,11 @@ static void ppc_core99_init(MachineState *machine)
>>>>>                            machine->kernel_filename);
>>>>>               exit(1);
>>>>>           }
>>>>> +        cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size +
>>>>> +                                         KERNEL_GAP);
>>>>>           /* load initrd */
>>>>>           if (machine->initrd_filename) {
>>>>> -            initrd_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + 
>>>>> KERNEL_GAP);
>>>>> +            initrd_base = cmdline_base;
>>>>>               initrd_size = 
>>>>> load_image_targphys(machine->initrd_filename,
>>>>>                                                 initrd_base,
>>>>>                                                 machine->ram_size - 
>>>>> initrd_base);
>>>>> @@ -206,8 +208,6 @@ static void ppc_core99_init(MachineState *machine)
>>>>>                   exit(1);
>>>>>               }
>>>>>               cmdline_base = TARGET_PAGE_ALIGN(initrd_base + 
>>>>> initrd_size);
>>>>> -        } else {
>>>>> -            cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size 
>>>>> + KERNEL_GAP);
>>>>>           }
>>>>>           ppc_boot_device = 'm';
>>>>>       } else {
>>>>> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
>>>>> index cb67e44081..b424729a39 100644
>>>>> --- a/hw/ppc/mac_oldworld.c
>>>>> +++ b/hw/ppc/mac_oldworld.c
>>>>> @@ -168,10 +168,11 @@ static void ppc_heathrow_init(MachineState 
>>>>> *machine)
>>>>>                            machine->kernel_filename);
>>>>>               exit(1);
>>>>>           }
>>>>> +        cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size +
>>>>> +                                         KERNEL_GAP);
>>>>>           /* load initrd */
>>>>>           if (machine->initrd_filename) {
>>>>> -            initrd_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size +
>>>>> -                                            KERNEL_GAP);
>>>>> +            initrd_base = cmdline_base;
>>>>>               initrd_size = 
>>>>> load_image_targphys(machine->initrd_filename,
>>>>>                                                 initrd_base,
>>>>>                                                 machine->ram_size - 
>>>>> initrd_base);
>>>>> @@ -181,8 +182,6 @@ static void ppc_heathrow_init(MachineState *machine)
>>>>>                   exit(1);
>>>>>               }
>>>>>               cmdline_base = TARGET_PAGE_ALIGN(initrd_base + 
>>>>> initrd_size);
>>>>> -        } else {
>>>>> -            cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size 
>>>>> + KERNEL_GAP);
>>>>>           }
>>>>>           ppc_boot_device = 'm';
>>>>>       } else {
>>>> 
>>>> Is there any particular reason why you would want to avoid the else 
>>>> branch? I
>>> 
>>> It avoids code duplication and to me it's easier to follow than an else 
>>> branch. With this patch cmdline_base calculation is clearly tied to 
>>> kernel_base and kernel_size if only kernel is used and initrd_base 
>>> initrd_size when initrd is used. With the else branch it's less obvious 
>>> because it's set much later in the else branch while initrd_base 
>>> duplicates it above. So avoiding this duplication makes the code easier to 
>>> read and less prone to errors if the calculation is ever modified.
>>> 
>>>> don't feel this patch is an improvement since by always setting 
>>>> cmdline_base to a non-zero value, as a reviewer I then have to check all 
>>>> other uses of cmdline_base in the file to ensure that this doesn't cause 
>>>> any issues.
>>> 
>>> There aren't that many uses that it's difficult to check and this only 
>>> need to be done once.
>>> 
>>>> I much prefer the existing version since setting the values of 
>>>> cmdline_base and initrd_base is very clearly scoped within the if 
>>>> statement.
>>> 
>>> What can I say, it's hard to argue with preferences but avoiding code 
>>> duplication is worth the effort reviewing this patch in my opinion.
>> 
>> Also compare the before and after this series:
>> 
>> https://github.com/patchew-project/qemu/blob/master/hw/ppc/mac_newworld.c
>> https://github.com/patchew-project/qemu/blob/9c1cd2828b3d3bd3a7068134a57ae9bb07f5a681/hw/ppc/mac_newworld.c 
>> 
>> I think the result is much easier to follow without else brances as you can 
>> read it from top to bottom instead of jumping around in else branches that 
>> is less clear and also more lines. Also setting default value avoids any 
>> used uninitialised cases which you would need to check if you set vars in 
>> if-else instead so unlike what you say this does not introduce such cases 
>> but closes the possibility instead. So please take the time to review it in 
>> exchange of the time I've put it in writing it.
>
> I've revisited this looking at the links provided above, and after 
> consideration my opinion is that that having the more localised scoping of 
> the variables is more worthwhile (i.e. the compiler can better catch errors) 
> rather than eliminating the duplication for a couple of lines. Please drop 
> this patch before posting the next version of the series.

I think duplicating the same calculation for both initrd_base and 
cmdline_base in the else branch is error prone so removing that is better 
but I've sent a v6 with this patch removed so you can chose which one to 
apply before the freeze.

Regards,
BALATON Zoltan
--3866299591-1420606215-1666958357=:83784--

