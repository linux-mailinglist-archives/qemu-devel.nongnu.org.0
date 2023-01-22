Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C23BB677376
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 00:32:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJjnY-0002Dz-4H; Sun, 22 Jan 2023 18:30:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pJjnT-0002Dj-Fi
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 18:30:47 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pJjnP-0007F6-T9
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 18:30:46 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7EEE3746346;
 Mon, 23 Jan 2023 00:28:17 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 534C6745720; Mon, 23 Jan 2023 00:28:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4D3AC745712;
 Mon, 23 Jan 2023 00:28:16 +0100 (CET)
Date: Mon, 23 Jan 2023 00:28:16 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, Joelle van Dyne <j@getutm.app>
Subject: Re: Display update issue on M1 Macs
In-Reply-To: <7380ee42-8b39-8c5d-ba60-652d411c49b1@gmail.com>
Message-ID: <5d385b04-ea56-5e30-9bcd-82c0b63f2dd4@eik.bme.hu>
References: <5921db6f-0760-c380-7af2-5710a0cd479d@eik.bme.hu>
 <3bad40aa-7920-0484-ca23-b9d424ad56f6@eik.bme.hu>
 <28025639-840a-1e19-01d5-c817235ca423@gmail.com>
 <08497582-3b11-1311-48d6-1e2db8c93559@eik.bme.hu>
 <7380ee42-8b39-8c5d-ba60-652d411c49b1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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

On Thu, 19 Jan 2023, Akihiko Odaki wrote:
> On 2023/01/15 3:11, BALATON Zoltan wrote:
>> On Sat, 14 Jan 2023, Akihiko Odaki wrote:
>>> On 2023/01/13 22:43, BALATON Zoltan wrote:
>>>> On Thu, 5 Jan 2023, BALATON Zoltan wrote:
>>>>> Hello,
>>>>> 
>>>>> I got reports from several users trying to run AmigaOS4 on sam460ex on 
>>>>> Apple silicon Macs that they get missing graphics that I can't reproduce 
>>>>> on x86_64. With help from the users who get the problem we've narrowed 
>>>>> it down to the following:
>>>>> 
>>>>> It looks like that data written to the sm501's ram in 
>>>>> qemu/hw/display/sm501.c::sm501_2d_operation() is then not seen from 
>>>>> sm501_update_display() in the same file. The sm501_2d_operation() 
>>>>> function is called when the guest accesses the emulated card so it may 
>>>>> run in a different thread than sm501_update_display() which is called by 
>>>>> the ui backend but I'm not sure how QEMU calls these. Is device code 
>>>>> running in iothread and display update in main thread? The problem is 
>>>>> also independent of the display backend and was reproduced with both 
>>>>> -display cocoa and -display sdl.
>>>>> 
>>>>> We have confirmed it's not the pixman routines that sm501_2d_operation() 
>>>>> uses as the same issue is seen also with QEMU 4.x where pixman wasn't 
>>>>> used and with all versions up to 7.2 so it's also not some bisectable 
>>>>> change in QEMU. It also happens with --enable-debug so it doesn't seem 
>>>>> to be related to optimisation either and I don't get it on x86_64 but 
>>>>> even x86_64 QEMU builds run on Apple M1 with Rosetta 2 show the problem. 
>>>>> It also only seems to affect graphics written from sm501_2d_operation() 
>>>>> which AmigaOS4 uses extensively but other OSes don't and just render 
>>>>> graphics with the vcpu which work without problem also on the M1 Macs 
>>>>> that show this problem with AmigaOS4. Theoretically this could be some 
>>>>> missing syncronisation which is something ARM and PPC may need while x86 
>>>>> doesn't but I don't know if this is really the reason and if so where 
>>>>> and how to fix it). Any idea what may cause this and what could be a fix 
>>>>> to try?
>>>> 
>>>> Any idea anyone? At least some explanation if the above is plausible or 
>>>> if there's an option to disable the iothread and run everyting in a 
>>>> single thread to verify the theory could help. I've got reports from at 
>>>> least 3 people getting this problem but I can't do much to fix it without 
>>>> some help.
>>>> 
>>>>> (Info on how to run it is here:
>>>>> http://zero.eik.bme.hu/~balaton/qemu/amiga/#amigaos
>>>>> but AmigaOS4 is not freely distributable so it's a bit hard to 
>>>>> reproduce. Some Linux X servers that support sm501/sm502 may also use 
>>>>> the card's 2d engine but I don't know about any live CDs that readily 
>>>>> run on sam460ex.)
>>>>> 
>>>>> Thank you,
>>>>> BALATON Zoltan
>>> 
>>> Sorry, I missed the email.
>>> 
>>> Indeed the ui backend should call sm501_update_display() in the main 
>>> thread, which should be different from the thread calling 
>>> sm501_2d_operation(). However, if I understand it correctly, both of the 
>>> functions should be called with iothread lock held so there should be no 
>>> race condition in theory.
>>> 
>>> But there is an exception: memory_region_snapshot_and_clear_dirty() 
>>> releases iothread lock, and that broke raspi3b display device:
>>> https://lore.kernel.org/qemu-devel/CAFEAcA9odnPo2LPip295Uztri7JfoVnQbkJ=Wn+k8dQneB_ynQ@mail.gmail.com/T/
>>> 
>>> It is unexpected that gfx_update() callback releases iothread lock so it 
>>> may break things in peculiar ways.
>>> 
>>> Peter, is there any change in the situation regarding the race introduced 
>>> by memory_region_snapshot_and_clear_dirty()?
>>> 
>>> For now, to workaround the issue, I think you can create another mutex and 
>>> make the entire sm501_2d_engine_write() and sm501_update_display() 
>>> critical sections.
>> 
>> Interesting thread but not sure it's the same problem so this workaround 
>> may not be enough to fix my issue. Here's a video posted by one of the 
>> people who reported it showing the problem on M1 Mac:
>> 
>> https://www.youtube.com/watch?v=FDqoNbp6PQs
>> 
>> and here's how it looks like on other machines:
>> 
>> https://www.youtube.com/watch?v=ML7-F4HNFKQ
>> 
>> There are also videos showing it running on RPi 4 and G5 Mac without this 
>> issue so it seems to only happen on Apple Silicon M1 Macs. What's strange 
>> is that graphics elements are not just delayed which I think should happen 
>> with missing thread synchronisation where the update callback would miss 
>> some pixels rendered during it's running but subsequent update callbacks 
>> would eventually draw those, woudn't they? Also setting full_update to 1 in 
>> sm501_update_display() callback to disable dirty tracking does not fix the 
>> problem. So it looks like as if sm501_2d_operation() running on one CPU 
>> core only writes data to the local cache of that core which 
>> sm501_update_display() running on other core can't see, so maybe some cache 
>> synchronisation is needed in memory_region_set_dirty() or if that's already 
>> there maybe I should call it for all changes not only those in the visible 
>> display area? I'm still not sure I understand the problem and don't know 
>> what could be a fix for it so anything to test to identify the issue better 
>> might also bring us closer to a solution.
>> 
>> Regards,
>> BALATON Zoltan
>
> If you set full_update to 1, you may also comment out 
> memory_region_snapshot_and_clear_dirty() and 
> memory_region_snapshot_get_dirty() to avoid the iothread mutex being 
> unlocked. The iothread mutex should ensure cache coherency as well.
>
> But as you say, it's weird that the rendered result is not just delayed but 
> missed. That may imply other possibilities (e.g., the results are overwritten 
> by someone else). If the problem persists after commenting out 
> memory_region_snapshot_and_clear_dirty() and 
> memory_region_snapshot_get_dirty(), I think you can assume the inter-thread 
> coherency between sm501_2d_operation() and sm501_update_display() is not 
> causing the problem.

I've asked people who reported and can reproduce it to test this but it 
did not change anything so confirmed it's not that race condition but 
looks more like some cache inconsistency maybe. Any other ideas?

Regards,
BALATON Zoltan

