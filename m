Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 753F96825A7
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 08:39:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMlDV-0008EW-1Z; Tue, 31 Jan 2023 02:38:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pMlDT-0008EN-2r
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 02:38:07 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pMlDQ-0005yf-Qp
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 02:38:06 -0500
Received: by mail-pj1-x1032.google.com with SMTP id o13so13456847pjg.2
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 23:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xQ+mklTgYr8M0X+3WElQije4sJSsiasXSJ6rxapQOCo=;
 b=U8NVKrDoKkLcPXTBwtwLRH/pAGzBhZKcVcQtNoVQiUaWWrOOHqYp2tLDEIR9JayNO1
 0MuZdt+S09nhcCI/BrK4pD70YUMCObXt1SW8WkSamgQbPvBX7sj8XaskYstQbro5hP/J
 GgdGqcSDhTuFHR60k2Jh4wrI2fYa8gaiJFy6ERXdAXLyJfNteMJQUqLu6zaQ1MR2E0Zs
 Kf9gfGfLZNthhaeb+wZbOTcbq4yTsLRC/0eTcywUQrPzmQxY1yY1nTL5Xek0U6i0dpk3
 V1vGCa8htbsJsbvm/cRm6ImgLSK7LuCS8MPSzWJ5YhT4AF6ayJevO8ODuFOyvP4PRudq
 BEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xQ+mklTgYr8M0X+3WElQije4sJSsiasXSJ6rxapQOCo=;
 b=cb/lGezQS6JBzPNA6S76l/mIeFLSuGjBj9lLF4XDKy5zth4XSQoZlJjcZDcR5Kya1A
 X3nor6NXR/oIWhuftPe3Cyb4zZHRr3qgdF4xnXfIry1M8SOLvxx+JDOTFgFZrVLxWBHo
 vN1r31jCMXHJls3ghljhM9f32kmG2oTH9HFuPX/0DWdiL8QTrHi07kidsNzoRCDYHYix
 AMGSS94ND7WcYopUDgK9jR/L/A4EL2Fb1K41bGrl9HwoOztAt5jABAiTDuJW2SiITOpu
 DhEbAZgG0tppGqMltzFHUTpmlSWO1/pzCvdm2UKb+n1lIOUbKkw1Pn75MpR0MOyfA86I
 ZDQA==
X-Gm-Message-State: AO0yUKUHsJP6erpyoB1Gq4codD5AyhI3BcTw4fwyTq6d2jEOXTAjDL7u
 5tjUc13Avxa27WajTpI3rDs=
X-Google-Smtp-Source: AK7set8pat0/EggdFYHphASZ0BXWUw68BwWDAHZdb3UML+iWO9WsyxEZEXZd2yMBTD39cOKN2n58tw==
X-Received: by 2002:a17:902:e850:b0:196:5cb8:60e0 with SMTP id
 t16-20020a170902e85000b001965cb860e0mr14610128plg.20.1675150682348; 
 Mon, 30 Jan 2023 23:38:02 -0800 (PST)
Received: from [10.213.26.147] ([157.82.194.13])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a170902694500b001967580f60fsm4459138plt.260.2023.01.30.23.38.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 23:38:01 -0800 (PST)
Message-ID: <08551d7d-c17e-7a35-3908-e2b8b3465366@gmail.com>
Date: Tue, 31 Jan 2023 16:37:59 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: Display update issue on M1 Macs
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Joelle van Dyne <j@getutm.app>
References: <5921db6f-0760-c380-7af2-5710a0cd479d@eik.bme.hu>
 <3bad40aa-7920-0484-ca23-b9d424ad56f6@eik.bme.hu>
 <28025639-840a-1e19-01d5-c817235ca423@gmail.com>
 <08497582-3b11-1311-48d6-1e2db8c93559@eik.bme.hu>
 <7380ee42-8b39-8c5d-ba60-652d411c49b1@gmail.com>
 <5d385b04-ea56-5e30-9bcd-82c0b63f2dd4@eik.bme.hu>
 <b0c72670-b6f9-0f63-9bb1-1a1bf27ffe8e@gmail.com>
 <b8403b65-7c55-20fb-1ee5-730e4eb9833c@eik.bme.hu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <b8403b65-7c55-20fb-1ee5-730e4eb9833c@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 2023/01/31 8:58, BALATON Zoltan wrote:
> On Sat, 28 Jan 2023, Akihiko Odaki wrote:
>> On 2023/01/23 8:28, BALATON Zoltan wrote:
>>> On Thu, 19 Jan 2023, Akihiko Odaki wrote:
>>>> On 2023/01/15 3:11, BALATON Zoltan wrote:
>>>>> On Sat, 14 Jan 2023, Akihiko Odaki wrote:
>>>>>> On 2023/01/13 22:43, BALATON Zoltan wrote:
>>>>>>> On Thu, 5 Jan 2023, BALATON Zoltan wrote:
>>>>>>>> Hello,
>>>>>>>>
>>>>>>>> I got reports from several users trying to run AmigaOS4 on 
>>>>>>>> sam460ex on Apple silicon Macs that they get missing graphics 
>>>>>>>> that I can't reproduce on x86_64. With help from the users who 
>>>>>>>> get the problem we've narrowed it down to the following:
>>>>>>>>
>>>>>>>> It looks like that data written to the sm501's ram in 
>>>>>>>> qemu/hw/display/sm501.c::sm501_2d_operation() is then not seen 
>>>>>>>> from sm501_update_display() in the same file. The 
>>>>>>>> sm501_2d_operation() function is called when the guest accesses 
>>>>>>>> the emulated card so it may run in a different thread than 
>>>>>>>> sm501_update_display() which is called by the ui backend but I'm 
>>>>>>>> not sure how QEMU calls these. Is device code running in 
>>>>>>>> iothread and display update in main thread? The problem is also 
>>>>>>>> independent of the display backend and was reproduced with both 
>>>>>>>> -display cocoa and -display sdl.
>>>>>>>>
>>>>>>>> We have confirmed it's not the pixman routines that 
>>>>>>>> sm501_2d_operation() uses as the same issue is seen also with 
>>>>>>>> QEMU 4.x where pixman wasn't used and with all versions up to 
>>>>>>>> 7.2 so it's also not some bisectable change in QEMU. It also 
>>>>>>>> happens with --enable-debug so it doesn't seem to be related to 
>>>>>>>> optimisation either and I don't get it on x86_64 but even x86_64 
>>>>>>>> QEMU builds run on Apple M1 with Rosetta 2 show the problem. It 
>>>>>>>> also only seems to affect graphics written from 
>>>>>>>> sm501_2d_operation() which AmigaOS4 uses extensively but other 
>>>>>>>> OSes don't and just render graphics with the vcpu which work 
>>>>>>>> without problem also on the M1 Macs that show this problem with 
>>>>>>>> AmigaOS4. Theoretically this could be some missing 
>>>>>>>> syncronisation which is something ARM and PPC may need while x86 
>>>>>>>> doesn't but I don't know if this is really the reason and if so 
>>>>>>>> where and how to fix it). Any idea what may cause this and what 
>>>>>>>> could be a fix to try?
>>>>>>>
>>>>>>> Any idea anyone? At least some explanation if the above is 
>>>>>>> plausible or if there's an option to disable the iothread and run 
>>>>>>> everyting in a single thread to verify the theory could help. 
>>>>>>> I've got reports from at least 3 people getting this problem but 
>>>>>>> I can't do much to fix it without some help.
>>>>>>>
>>>>>>>> (Info on how to run it is here:
>>>>>>>> http://zero.eik.bme.hu/~balaton/qemu/amiga/#amigaos
>>>>>>>> but AmigaOS4 is not freely distributable so it's a bit hard to 
>>>>>>>> reproduce. Some Linux X servers that support sm501/sm502 may 
>>>>>>>> also use the card's 2d engine but I don't know about any live 
>>>>>>>> CDs that readily run on sam460ex.)
>>>>>>>>
>>>>>>>> Thank you,
>>>>>>>> BALATON Zoltan
>>>>>>
>>>>>> Sorry, I missed the email.
>>>>>>
>>>>>> Indeed the ui backend should call sm501_update_display() in the 
>>>>>> main thread, which should be different from the thread calling 
>>>>>> sm501_2d_operation(). However, if I understand it correctly, both 
>>>>>> of the functions should be called with iothread lock held so there 
>>>>>> should be no race condition in theory.
>>>>>>
>>>>>> But there is an exception: 
>>>>>> memory_region_snapshot_and_clear_dirty() releases iothread lock, 
>>>>>> and that broke raspi3b display device:
>>>>>> https://lore.kernel.org/qemu-devel/CAFEAcA9odnPo2LPip295Uztri7JfoVnQbkJ=Wn+k8dQneB_ynQ@mail.gmail.com/T/
>>>>>>
>>>>>> It is unexpected that gfx_update() callback releases iothread lock 
>>>>>> so it may break things in peculiar ways.
>>>>>>
>>>>>> Peter, is there any change in the situation regarding the race 
>>>>>> introduced by memory_region_snapshot_and_clear_dirty()?
>>>>>>
>>>>>> For now, to workaround the issue, I think you can create another 
>>>>>> mutex and make the entire sm501_2d_engine_write() and 
>>>>>> sm501_update_display() critical sections.
>>>>>
>>>>> Interesting thread but not sure it's the same problem so this 
>>>>> workaround may not be enough to fix my issue. Here's a video posted 
>>>>> by one of the people who reported it showing the problem on M1 Mac:
>>>>>
>>>>> https://www.youtube.com/watch?v=FDqoNbp6PQs
>>>>>
>>>>> and here's how it looks like on other machines:
>>>>>
>>>>> https://www.youtube.com/watch?v=ML7-F4HNFKQ
>>>>>
>>>>> There are also videos showing it running on RPi 4 and G5 Mac 
>>>>> without this issue so it seems to only happen on Apple Silicon M1 
>>>>> Macs. What's strange is that graphics elements are not just delayed 
>>>>> which I think should happen with missing thread synchronisation 
>>>>> where the update callback would miss some pixels rendered during 
>>>>> it's running but subsequent update callbacks would eventually draw 
>>>>> those, woudn't they? Also setting full_update to 1 in 
>>>>> sm501_update_display() callback to disable dirty tracking does not 
>>>>> fix the problem. So it looks like as if sm501_2d_operation() 
>>>>> running on one CPU core only writes data to the local cache of that 
>>>>> core which sm501_update_display() running on other core can't see, 
>>>>> so maybe some cache synchronisation is needed in 
>>>>> memory_region_set_dirty() or if that's already there maybe I should 
>>>>> call it for all changes not only those in the visible display area? 
>>>>> I'm still not sure I understand the problem and don't know what 
>>>>> could be a fix for it so anything to test to identify the issue 
>>>>> better might also bring us closer to a solution.
>>>>>
>>>>> Regards,
>>>>> BALATON Zoltan
>>>>
>>>> If you set full_update to 1, you may also comment out 
>>>> memory_region_snapshot_and_clear_dirty() and 
>>>> memory_region_snapshot_get_dirty() to avoid the iothread mutex being 
>>>> unlocked. The iothread mutex should ensure cache coherency as well.
>>>>
>>>> But as you say, it's weird that the rendered result is not just 
>>>> delayed but missed. That may imply other possibilities (e.g., the 
>>>> results are overwritten by someone else). If the problem persists 
>>>> after commenting out memory_region_snapshot_and_clear_dirty() and 
>>>> memory_region_snapshot_get_dirty(), I think you can assume the 
>>>> inter-thread coherency between sm501_2d_operation() and 
>>>> sm501_update_display() is not causing the problem.
>>>
>>> I've asked people who reported and can reproduce it to test this but 
>>> it did not change anything so confirmed it's not that race condition 
>>> but looks more like some cache inconsistency maybe. Any other ideas?
>>>
>>> Regards,
>>> BALATON Zoltan
>>
>> I can come up with two important differences between x86 and Arm which 
>> can affect the execution of QEMU:
>> 1. Memory model. Arm uses a memory model more relaxed than x86 so it 
>> is more sensitive for synchronization failures among threads.
>> 2. Different instructions. TCG uses JIT so differences in instructions 
>> matter.
>>
>> We should be able to exclude 1) as a potential cause of the problem. 
>> iothread mutex should take care of race condition and even cache 
>> coherency problem; mutex includes memory barrier functionality.
> 
> Where is this barrier in QEMU code? Does this also ensure cache 
> coherency between different cores or only memory sync in one core? From 
> the testing I suspect it's probably not becuase of the weak ordering of 
> ARM but something to do with different threads writing and reading the 
> memory area. Is there a way to disable separate vcpu thread and run 
> everything in a single thread to verify this theory? (We only have one 
> vcpu so it's not an MTTCG issue but something between the vcpu and main 
> thread maybe.)

QEMU uses pthread_mutex for macOS, and pthread_mutex (or any sane mutex 
implementation for SMP systems) should also ensure memory 
synchronization across different cores.

That said, it is still possible that we miss something that prevents 
memory synchronization. Ideally the theory should be confirmed by 
experiments, but it is not easy with Mac.

The easiest option is to run QEMU/sam460ex on Linux on QEMU/hvf. Running 
the entire Linux system without -smp option may be too slow so you may 
use taskset command on Linux to pin QEMU/sam460ex process to a 
particular vCPU. This is somewhat incomplete as virtualization 
interferes with caches and hide problems or trigger other bugs. The 
difference of the operating systems is also concerning.

Another option is to use taskset command on Asahi Linux. Installing 
Asahi Linux is easy, but uninstalling it is a bit complicated.

m1n1 hypervisor from Asahi Linux project allows to restrict CPUs to use, 
and I think it also allows to change the memory model to x86 TSO. Unlike 
QEMU/hvf on macOS, it is very minimalistic so its interference to e.g.m 
caches is limited. It is very useful for debugging XNU or Linux, but 
hard to set up and requires another computer to control it.

Finally, you can patch XNU kernel, but this is obviously not easy.

> 
>> For difference 2), you may try to use TCI. You can find details of TCI 
>> in tcg/tci/README.
> 
> This was tested and also with TCI got the same results just much slower.
> 
>> The common sense tells, however, the memory model is usually the cause 
>> of the problem when you see behavioral differences between x86 and 
>> Arm, and TCG should work fine with both of x86 and Arm as they should 
>> have been tested well.
> 
> It's not only between x86 and ARM but also between different ARM CPUs it 
> seems as there are videos of this test case running on Raspberry Pi 4 
> but all QEMU versions failed on Apple M1 so maybe it's something 
> specific to that CPU.

It is likely that the combination of Apple's microarchitecture and Arm 
instruction set causes the problem. For example, even though the memory 
model in x86 is weaker than x86, such difference may not surface 
depending on the design of load/store unit or the size of load/store 
buffers.

Fortunately macOS provides Rosetta 2 for x86 emulation on Apple M1, 
which makes it possible to compare x86 and Arm without concerning the 
difference of the microarchitecture.

Regards,
Akihiko Odaki

> 
> Regards,
> BALATON Zoltan


