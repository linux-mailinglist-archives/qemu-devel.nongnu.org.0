Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E45D67399F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 14:11:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIUgx-0007qm-2c; Thu, 19 Jan 2023 08:10:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pIUgu-0007qL-6Y
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:10:52 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pIUgq-0005Tg-IQ
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:10:51 -0500
Received: by mail-pj1-x1033.google.com with SMTP id b10so2357776pjo.1
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 05:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Sqb1AtwDV8EKT/Y3mVLzu24oF1C9JK4BLP/3ZMCOZr0=;
 b=MwsPncOPoZJGwbIyGYwXvXsqA/HfJszt56FjqJDkS6jcnKlAtd9Cv/f2mjjVuk7JWx
 QKHyz5+mxZ9rKw3UBAXh/Rx2KeXJjh0KAGiT2Ir9CYz5InmxjSMGO86brT3+pkEbPQhI
 ObRZBjWUxfV9DuxxOplzaFad2UhU2VOT6QJDn9kgWBG2UVVG+qBGKygEI3jXOjlwMwCS
 LFV28DiqSsNSoju5Ot3mvyqeaScxFX4J8t4YEc1s1vqAkgqq56iMwfDC945nHxR74K61
 qiK8Xo8MrLrS1QYY1BdtxEor7vZwrUfrke+0ER6SiC9WSbCSbkSE6adsObVsoPhSGadP
 UEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sqb1AtwDV8EKT/Y3mVLzu24oF1C9JK4BLP/3ZMCOZr0=;
 b=bbYemI+g4vt8uVoOHXejTGNNzby7yWqTSkwmYv+gW/TPSxZ3rCPs7mx2kz7m713QIM
 iOL2N9CKo8O/yQDY+SYJU5XtgaJhH8OF4P4U2pPJi0F8+EKRn7dLM/H750AKFd8zWwHq
 HiRVcjFdN4nlvi8xubclCM5BfM/KBMORQCyMtnV7BOhmxxDwewwUAv9/iHQ/ifjzLk4C
 wbBmRt4ntotGzw/SF6FdkFJfLQ0sNYtzcWxqeA0vWBW4Nytffwf2Z5/S/cBuIEUlodQS
 dIVzTXEhRUOHZL6fjkJ2I/wmZehDxmykoMIVcTrngtrYInuzgNku9WdfbsWcaHUgdfvd
 P0yw==
X-Gm-Message-State: AFqh2krCvJl6pd6KvEstNnDk3mmtsrirOjtEesk7+IHtP79E6ELADkV9
 2PVRuLT/tviGJhYuRRN//4c=
X-Google-Smtp-Source: AMrXdXtUxn900RFAD0N40I+hQG0a1ugrOPXvyImomjRtfPd6fjfFsxcHyUC0cagZb1FoXAJuROHTIg==
X-Received: by 2002:a17:903:328b:b0:194:cd07:a8bb with SMTP id
 jh11-20020a170903328b00b00194cd07a8bbmr1885295plb.30.1674133845746; 
 Thu, 19 Jan 2023 05:10:45 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:d54:e521:8bac:7bed?
 ([2400:4050:a840:1e00:d54:e521:8bac:7bed])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a170902a40e00b00194afb5a405sm4663338plq.118.2023.01.19.05.10.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 05:10:44 -0800 (PST)
Message-ID: <7380ee42-8b39-8c5d-ba60-652d411c49b1@gmail.com>
Date: Thu, 19 Jan 2023 22:10:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: Display update issue on M1 Macs
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Joelle van Dyne <j@getutm.app>
References: <5921db6f-0760-c380-7af2-5710a0cd479d@eik.bme.hu>
 <3bad40aa-7920-0484-ca23-b9d424ad56f6@eik.bme.hu>
 <28025639-840a-1e19-01d5-c817235ca423@gmail.com>
 <08497582-3b11-1311-48d6-1e2db8c93559@eik.bme.hu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <08497582-3b11-1311-48d6-1e2db8c93559@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2023/01/15 3:11, BALATON Zoltan wrote:
> On Sat, 14 Jan 2023, Akihiko Odaki wrote:
>> On 2023/01/13 22:43, BALATON Zoltan wrote:
>>> On Thu, 5 Jan 2023, BALATON Zoltan wrote:
>>>> Hello,
>>>>
>>>> I got reports from several users trying to run AmigaOS4 on sam460ex 
>>>> on Apple silicon Macs that they get missing graphics that I can't 
>>>> reproduce on x86_64. With help from the users who get the problem 
>>>> we've narrowed it down to the following:
>>>>
>>>> It looks like that data written to the sm501's ram in 
>>>> qemu/hw/display/sm501.c::sm501_2d_operation() is then not seen from 
>>>> sm501_update_display() in the same file. The sm501_2d_operation() 
>>>> function is called when the guest accesses the emulated card so it 
>>>> may run in a different thread than sm501_update_display() which is 
>>>> called by the ui backend but I'm not sure how QEMU calls these. Is 
>>>> device code running in iothread and display update in main thread? 
>>>> The problem is also independent of the display backend and was 
>>>> reproduced with both -display cocoa and -display sdl.
>>>>
>>>> We have confirmed it's not the pixman routines that 
>>>> sm501_2d_operation() uses as the same issue is seen also with QEMU 
>>>> 4.x where pixman wasn't used and with all versions up to 7.2 so it's 
>>>> also not some bisectable change in QEMU. It also happens with 
>>>> --enable-debug so it doesn't seem to be related to optimisation 
>>>> either and I don't get it on x86_64 but even x86_64 QEMU builds run 
>>>> on Apple M1 with Rosetta 2 show the problem. It also only seems to 
>>>> affect graphics written from sm501_2d_operation() which AmigaOS4 
>>>> uses extensively but other OSes don't and just render graphics with 
>>>> the vcpu which work without problem also on the M1 Macs that show 
>>>> this problem with AmigaOS4. Theoretically this could be some missing 
>>>> syncronisation which is something ARM and PPC may need while x86 
>>>> doesn't but I don't know if this is really the reason and if so 
>>>> where and how to fix it). Any idea what may cause this and what 
>>>> could be a fix to try?
>>>
>>> Any idea anyone? At least some explanation if the above is plausible 
>>> or if there's an option to disable the iothread and run everyting in 
>>> a single thread to verify the theory could help. I've got reports 
>>> from at least 3 people getting this problem but I can't do much to 
>>> fix it without some help.
>>>
>>>> (Info on how to run it is here:
>>>> http://zero.eik.bme.hu/~balaton/qemu/amiga/#amigaos
>>>> but AmigaOS4 is not freely distributable so it's a bit hard to 
>>>> reproduce. Some Linux X servers that support sm501/sm502 may also 
>>>> use the card's 2d engine but I don't know about any live CDs that 
>>>> readily run on sam460ex.)
>>>>
>>>> Thank you,
>>>> BALATON Zoltan
>>
>> Sorry, I missed the email.
>>
>> Indeed the ui backend should call sm501_update_display() in the main 
>> thread, which should be different from the thread calling 
>> sm501_2d_operation(). However, if I understand it correctly, both of 
>> the functions should be called with iothread lock held so there should 
>> be no race condition in theory.
>>
>> But there is an exception: memory_region_snapshot_and_clear_dirty() 
>> releases iothread lock, and that broke raspi3b display device:
>> https://lore.kernel.org/qemu-devel/CAFEAcA9odnPo2LPip295Uztri7JfoVnQbkJ=Wn+k8dQneB_ynQ@mail.gmail.com/T/
>>
>> It is unexpected that gfx_update() callback releases iothread lock so 
>> it may break things in peculiar ways.
>>
>> Peter, is there any change in the situation regarding the race 
>> introduced by memory_region_snapshot_and_clear_dirty()?
>>
>> For now, to workaround the issue, I think you can create another mutex 
>> and make the entire sm501_2d_engine_write() and sm501_update_display() 
>> critical sections.
> 
> Interesting thread but not sure it's the same problem so this workaround 
> may not be enough to fix my issue. Here's a video posted by one of the 
> people who reported it showing the problem on M1 Mac:
> 
> https://www.youtube.com/watch?v=FDqoNbp6PQs
> 
> and here's how it looks like on other machines:
> 
> https://www.youtube.com/watch?v=ML7-F4HNFKQ
> 
> There are also videos showing it running on RPi 4 and G5 Mac without 
> this issue so it seems to only happen on Apple Silicon M1 Macs. What's 
> strange is that graphics elements are not just delayed which I think 
> should happen with missing thread synchronisation where the update 
> callback would miss some pixels rendered during it's running but 
> subsequent update callbacks would eventually draw those, woudn't they? 
> Also setting full_update to 1 in sm501_update_display() callback to 
> disable dirty tracking does not fix the problem. So it looks like as if 
> sm501_2d_operation() running on one CPU core only writes data to the 
> local cache of that core which sm501_update_display() running on other 
> core can't see, so maybe some cache synchronisation is needed in 
> memory_region_set_dirty() or if that's already there maybe I should call 
> it for all changes not only those in the visible display area? I'm still 
> not sure I understand the problem and don't know what could be a fix for 
> it so anything to test to identify the issue better might also bring us 
> closer to a solution.
> 
> Regards,
> BALATON Zoltan

If you set full_update to 1, you may also comment out 
memory_region_snapshot_and_clear_dirty() and 
memory_region_snapshot_get_dirty() to avoid the iothread mutex being 
unlocked. The iothread mutex should ensure cache coherency as well.

But as you say, it's weird that the rendered result is not just delayed 
but missed. That may imply other possibilities (e.g., the results are 
overwritten by someone else). If the problem persists after commenting 
out memory_region_snapshot_and_clear_dirty() and 
memory_region_snapshot_get_dirty(), I think you can assume the 
inter-thread coherency between sm501_2d_operation() and 
sm501_update_display() is not causing the problem.

Regards,
Akihiko Odaki

