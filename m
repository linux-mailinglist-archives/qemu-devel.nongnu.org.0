Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6640687AE6
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 11:54:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNXEP-0007f8-Fr; Thu, 02 Feb 2023 05:54:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pNXEJ-0007Ux-Ps
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:54:12 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pNXEH-0003S5-3O
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:54:11 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3213274635C;
 Thu,  2 Feb 2023 11:51:39 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C7B7374634B; Thu,  2 Feb 2023 11:51:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C63D6745712;
 Thu,  2 Feb 2023 11:51:38 +0100 (CET)
Date: Thu, 2 Feb 2023 11:51:38 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, Joelle van Dyne <j@getutm.app>
Subject: Re: Display update issue on M1 Macs
In-Reply-To: <386b21f7-ce14-3237-5f51-7ec1d7d86411@eik.bme.hu>
Message-ID: <483662d9-2565-db44-0e19-fb9128f28bde@eik.bme.hu>
References: <5921db6f-0760-c380-7af2-5710a0cd479d@eik.bme.hu>
 <3bad40aa-7920-0484-ca23-b9d424ad56f6@eik.bme.hu>
 <28025639-840a-1e19-01d5-c817235ca423@gmail.com>
 <08497582-3b11-1311-48d6-1e2db8c93559@eik.bme.hu>
 <7380ee42-8b39-8c5d-ba60-652d411c49b1@gmail.com>
 <5d385b04-ea56-5e30-9bcd-82c0b63f2dd4@eik.bme.hu>
 <b0c72670-b6f9-0f63-9bb1-1a1bf27ffe8e@gmail.com>
 <b8403b65-7c55-20fb-1ee5-730e4eb9833c@eik.bme.hu>
 <08551d7d-c17e-7a35-3908-e2b8b3465366@gmail.com>
 <386b21f7-ce14-3237-5f51-7ec1d7d86411@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 31 Jan 2023, BALATON Zoltan wrote:
> On Tue, 31 Jan 2023, Akihiko Odaki wrote:
[...]
To summarise previous discussion:

- There's a problem on Apple M1 Macs with sm501 and ati-vga 2d accel 
functions drawing from device model into the video memory of the emulated 
card which is not shown on screen when the display update callback is 
called from another thread. This works on x86_64 host so I suspect it may 
be related to missing memory synchronisation that ARM may need.

- This can be reproduced running AmigaOS4 on sam460ex or MorphOS (demo iso 
downliadable from their web site) on sam460ex, pegasos2 or mac99,via=pmu 
with -device ati-vga,romfile="" as described here: 
http://zero.eik.bme.hu/~balaton/qemu/amiga/

- I can't test it myself lacking hardware so I have to rely on reports 
from people who have this hardware so there may be some uncertainity in 
the info I get.

- We have confirmed it's not related to a known race condition as 
disabling dirty tracking and always doing full updates of whole screen 
did not fix it:

>>>>>>>> But there is an exception: memory_region_snapshot_and_clear_dirty() 
>>>>>>>> releases iothread lock, and that broke raspi3b display device:
>>>>>>>> https://lore.kernel.org/qemu-devel/CAFEAcA9odnPo2LPip295Uztri7JfoVnQbkJ=Wn+k8dQneB_ynQ@mail.gmail.com/T/
>>>>>>>> 
>>>>>>>> It is unexpected that gfx_update() callback releases iothread lock so 
>>>>>>>> it may break things in peculiar ways.
>>>>>>>> 
>>>>>>>> Peter, is there any change in the situation regarding the race 
>>>>>>>> introduced by memory_region_snapshot_and_clear_dirty()?
>>>>>>>> 
>>>>>>>> For now, to workaround the issue, I think you can create another 
>>>>>>>> mutex and make the entire sm501_2d_engine_write() and 
>>>>>>>> sm501_update_display() critical sections.
>>>>>>> 
>>>>>>> Interesting thread but not sure it's the same problem so this 
>>>>>>> workaround may not be enough to fix my issue. Here's a video posted by 
>>>>>>> one of the people who reported it showing the problem on M1 Mac:
>>>>>>> 
>>>>>>> https://www.youtube.com/watch?v=FDqoNbp6PQs
>>>>>>> 
>>>>>>> and here's how it looks like on other machines:
>>>>>>> 
>>>>>>> https://www.youtube.com/watch?v=ML7-F4HNFKQ
>>>>>>> 
>>>>>>> There are also videos showing it running on RPi 4 and G5 Mac without 
>>>>>>> this issue so it seems to only happen on Apple Silicon M1 Macs. What's 
>>>>>>> strange is that graphics elements are not just delayed which I think 
>>>>>>> should happen with missing thread synchronisation where the update 
>>>>>>> callback would miss some pixels rendered during it's running but 
>>>>>>> subsequent update callbacks would eventually draw those, woudn't they? 
>>>>>>> Also setting full_update to 1 in sm501_update_display() callback to 
>>>>>>> disable dirty tracking does not fix the problem. So it looks like as 
>>>>>>> if sm501_2d_operation() running on one CPU core only writes data to 
>>>>>>> the local cache of that core which sm501_update_display() running on 
>>>>>>> other core can't see, so maybe some cache synchronisation is needed in 
>>>>>>> memory_region_set_dirty() or if that's already there maybe I should 
>>>>>>> call it for all changes not only those in the visible display area? 
>>>>>>> I'm still not sure I understand the problem and don't know what could 
>>>>>>> be a fix for it so anything to test to identify the issue better might 
>>>>>>> also bring us closer to a solution.
>>>>>> 
>>>>>> If you set full_update to 1, you may also comment out 
>>>>>> memory_region_snapshot_and_clear_dirty() and 
>>>>>> memory_region_snapshot_get_dirty() to avoid the iothread mutex being 
>>>>>> unlocked. The iothread mutex should ensure cache coherency as well.
>>>>>> 
>>>>>> But as you say, it's weird that the rendered result is not just delayed 
>>>>>> but missed. That may imply other possibilities (e.g., the results are 
>>>>>> overwritten by someone else). If the problem persists after commenting 
>>>>>> out memory_region_snapshot_and_clear_dirty() and 
>>>>>> memory_region_snapshot_get_dirty(), I think you can assume the 
>>>>>> inter-thread coherency between sm501_2d_operation() and 
>>>>>> sm501_update_display() is not causing the problem.
>>>>> 
>>>>> I've asked people who reported and can reproduce it to test this but it 
>>>>> did not change anything so confirmed it's not that race condition but 
>>>>> looks more like some cache inconsistency maybe. Any other ideas?
>>>> 
>>>> I can come up with two important differences between x86 and Arm which 
>>>> can affect the execution of QEMU:
>>>> 1. Memory model. Arm uses a memory model more relaxed than x86 so it is 
>>>> more sensitive for synchronization failures among threads.
>>>> 2. Different instructions. TCG uses JIT so differences in instructions 
>>>> matter.
>>>> 
>>>> We should be able to exclude 1) as a potential cause of the problem. 
>>>> iothread mutex should take care of race condition and even cache 
>>>> coherency problem; mutex includes memory barrier functionality.
[...]
>>>> For difference 2), you may try to use TCI. You can find details of TCI in 
>>>> tcg/tci/README.
>>> 
>>> This was tested and also with TCI got the same results just much slower.
>>> 
>>>> The common sense tells, however, the memory model is usually the cause of 
>>>> the problem when you see behavioral differences between x86 and Arm, and 
>>>> TCG should work fine with both of x86 and Arm as they should have been 
>>>> tested well.
[...]
>> Fortunately macOS provides Rosetta 2 for x86 emulation on Apple M1, which 
>> makes it possible to compare x86 and Arm without concerning the difference 
>> of the microarchitecture.
>
> We've tried that before and even running x86 QEMU on M1 with Rosetta 2 it was 
> the same so it's probably not something about the code itself but how it's

As this was odd I've asked to re-test this and now I'm told at least QEMU 
5.1 x86_64 build from emaculation.com is working with Rosetta on M1 Mac so 
this suggests it may be a problem with memory sync but still don't know 
where and what to try. We're now try newer X86_64 builds to see if it 
broke somewhere along the way.

Anybody else with an M1 Mac wants to help testing? Can you reproduce the 
same with UTM with MorphOS and ati-vga? Here's what I've got showing the 
problem: https://www.youtube.com/watch?v=j5Ag5_Yq-Mk

Regards,
BALATON Zoltan

