Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EC468A853
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 06:21:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOAy1-0003X5-VA; Sat, 04 Feb 2023 00:20:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pOAxz-0003Wf-Bt
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 00:19:59 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pOAxx-0000bl-4v
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 00:19:59 -0500
Received: by mail-pj1-x1031.google.com with SMTP id d2so3294747pjd.5
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 21:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5aszPbhYFbq9JhXl9PJfC14zWWRxgwe+lifRjsLFgQI=;
 b=g2l3yk6aP3AusNpCXDGoUmS3dr6h1dYxCYVCN+rIlup4u4Mr0vsIPYRWEDqDRFAEBg
 oByfmkRyq/NVtyAhV/f6MdCsQfAcD67Kw0vxUMYjWEtiVCSbChBq7aFojxlUBPZvVvZV
 deNgrHDCQvrMQjHWJWlikvEuxDJraJP//X0mjv7cilS0BnxJFNDd4jt6qmFDpA0z32VJ
 +DBuZFs5GxFA6da8OYGeXt2lTA3XoBpccKtVX0vlkepwg42w6oBNrCI40sekcom6DrTV
 SZQclITPsarpdQTxxkKhnO1TvXpKW2y3HiapqL9/A1lEfR90wUX9uaMW6GlRWf8hwG3u
 9oJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5aszPbhYFbq9JhXl9PJfC14zWWRxgwe+lifRjsLFgQI=;
 b=ilrOkz29eJ6Rey+j4hHv+VkZVXz9MrphqJ618y7ZOYUIfoubTx1sIEwB21QAiwiz5c
 ibC3pIYmQkMS7wl33iDNutlN6BM6x2pGuhVTwRqw52MlcfPkd9MN9NJ0o5gohXNb23SK
 qmoh5EeY/1byXcGnG7toA+yu5omtl5lsc0ACp2WQcy9phPhYZBWi6HbsOnwrkzHHp6QN
 zdRLRsOaYrB1W4KbLOsOL27Wm3AwCniVSQs0j1xc6D6+M2G/+Stsfpbf11ADHGY7qz5G
 hYRSRqzsDXUrOIBRJ2xJcZTQo9HnsewDC/gkQtwP1nu+mXyQDbLkHo+k1TiPiqRuGErK
 S1PA==
X-Gm-Message-State: AO0yUKXHedJPLU3vJjjsVNqP9Ml7IFoaIkWI8QOQ6Uhr4tVJTohQuoxX
 uhWUQMMmrKKXAYsCRej2qWY=
X-Google-Smtp-Source: AK7set+/wR2JgXcbHdY42Kcwsu+QS9bJ8R1fgUD9sxvNEwg6hyENsLC4aGV3ZYElO7KTvN20hQvehg==
X-Received: by 2002:a17:903:41c8:b0:198:d004:bfcd with SMTP id
 u8-20020a17090341c800b00198d004bfcdmr8184513ple.32.1675487995454; 
 Fri, 03 Feb 2023 21:19:55 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a170902aa9300b0019625428cefsm2466809plr.281.2023.02.03.21.19.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 21:19:54 -0800 (PST)
Message-ID: <4550ebac-9ff5-038d-8675-bee9bde1a96f@gmail.com>
Date: Sat, 4 Feb 2023 14:19:52 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: Display update issue on M1 Macs
Content-Language: en-US
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
 <08551d7d-c17e-7a35-3908-e2b8b3465366@gmail.com>
 <386b21f7-ce14-3237-5f51-7ec1d7d86411@eik.bme.hu>
 <483662d9-2565-db44-0e19-fb9128f28bde@eik.bme.hu>
 <499a1290-1e90-20ef-881d-9434cbce8115@gmail.com>
 <7b61f595-964b-5113-dbf8-1e4a167c4954@eik.bme.hu>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <7b61f595-964b-5113-dbf8-1e4a167c4954@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 2023/02/03 22:45, BALATON Zoltan wrote:
> On Fri, 3 Feb 2023, Akihiko Odaki wrote:
>> On 2023/02/02 19:51, BALATON Zoltan wrote:
>>> On Tue, 31 Jan 2023, BALATON Zoltan wrote:
>>>> On Tue, 31 Jan 2023, Akihiko Odaki wrote:
>>> [...]
>>> To summarise previous discussion:
>>>
>>> - There's a problem on Apple M1 Macs with sm501 and ati-vga 2d accel 
>>> functions drawing from device model into the video memory of the 
>>> emulated card which is not shown on screen when the display update 
>>> callback is called from another thread. This works on x86_64 host so 
>>> I suspect it may be related to missing memory synchronisation that 
>>> ARM may need.
>>>
>>> - This can be reproduced running AmigaOS4 on sam460ex or MorphOS 
>>> (demo iso downliadable from their web site) on sam460ex, pegasos2 or 
>>> mac99,via=pmu with -device ati-vga,romfile="" as described here: 
>>> http://zero.eik.bme.hu/~balaton/qemu/amiga/
>>>
>>> - I can't test it myself lacking hardware so I have to rely on 
>>> reports from people who have this hardware so there may be some 
>>> uncertainity in the info I get.
>>>
>>> - We have confirmed it's not related to a known race condition as 
>>> disabling dirty tracking and always doing full updates of whole 
>>> screen did not fix it:
>>>
>>>>>>>>>>> But there is an exception: 
>>>>>>>>>>> memory_region_snapshot_and_clear_dirty() releases iothread 
>>>>>>>>>>> lock, and that broke raspi3b display device:
>>>>>>>>>>> https://lore.kernel.org/qemu-devel/CAFEAcA9odnPo2LPip295Uztri7JfoVnQbkJ=Wn+k8dQneB_ynQ@mail.gmail.com/T/
>>>>>>>>>>>
>>>>>>>>>>> It is unexpected that gfx_update() callback releases iothread 
>>>>>>>>>>> lock so it may break things in peculiar ways.
>>>>>>>>>>>
>>>>>>>>>>> Peter, is there any change in the situation regarding the 
>>>>>>>>>>> race introduced by memory_region_snapshot_and_clear_dirty()?
>>>>>>>>>>>
>>>>>>>>>>> For now, to workaround the issue, I think you can create 
>>>>>>>>>>> another mutex and make the entire sm501_2d_engine_write() and 
>>>>>>>>>>> sm501_update_display() critical sections.
>>>>>>>>>>
>>>>>>>>>> Interesting thread but not sure it's the same problem so this 
>>>>>>>>>> workaround may not be enough to fix my issue. Here's a video 
>>>>>>>>>> posted by one of the people who reported it showing the 
>>>>>>>>>> problem on M1 Mac:
>>>>>>>>>>
>>>>>>>>>> https://www.youtube.com/watch?v=FDqoNbp6PQs
>>>>>>>>>>
>>>>>>>>>> and here's how it looks like on other machines:
>>>>>>>>>>
>>>>>>>>>> https://www.youtube.com/watch?v=ML7-F4HNFKQ
>>>>>>>>>>
>>>>>>>>>> There are also videos showing it running on RPi 4 and G5 Mac 
>>>>>>>>>> without this issue so it seems to only happen on Apple Silicon 
>>>>>>>>>> M1 Macs. What's strange is that graphics elements are not just 
>>>>>>>>>> delayed which I think should happen with missing thread 
>>>>>>>>>> synchronisation where the update callback would miss some 
>>>>>>>>>> pixels rendered during it's running but subsequent update 
>>>>>>>>>> callbacks would eventually draw those, woudn't they? Also 
>>>>>>>>>> setting full_update to 1 in sm501_update_display() callback to 
>>>>>>>>>> disable dirty tracking does not fix the problem. So it looks 
>>>>>>>>>> like as if sm501_2d_operation() running on one CPU core only 
>>>>>>>>>> writes data to the local cache of that core which 
>>>>>>>>>> sm501_update_display() running on other core can't see, so 
>>>>>>>>>> maybe some cache synchronisation is needed in 
>>>>>>>>>> memory_region_set_dirty() or if that's already there maybe I 
>>>>>>>>>> should call it for all changes not only those in the visible 
>>>>>>>>>> display area? I'm still not sure I understand the problem and 
>>>>>>>>>> don't know what could be a fix for it so anything to test to 
>>>>>>>>>> identify the issue better might also bring us closer to a 
>>>>>>>>>> solution.
>>>>>>>>>
>>>>>>>>> If you set full_update to 1, you may also comment out 
>>>>>>>>> memory_region_snapshot_and_clear_dirty() and 
>>>>>>>>> memory_region_snapshot_get_dirty() to avoid the iothread mutex 
>>>>>>>>> being unlocked. The iothread mutex should ensure cache 
>>>>>>>>> coherency as well.
>>>>>>>>>
>>>>>>>>> But as you say, it's weird that the rendered result is not just 
>>>>>>>>> delayed but missed. That may imply other possibilities (e.g., 
>>>>>>>>> the results are overwritten by someone else). If the problem 
>>>>>>>>> persists after commenting out 
>>>>>>>>> memory_region_snapshot_and_clear_dirty() and 
>>>>>>>>> memory_region_snapshot_get_dirty(), I think you can assume the 
>>>>>>>>> inter-thread coherency between sm501_2d_operation() and 
>>>>>>>>> sm501_update_display() is not causing the problem.
>>>>>>>>
>>>>>>>> I've asked people who reported and can reproduce it to test this 
>>>>>>>> but it did not change anything so confirmed it's not that race 
>>>>>>>> condition but looks more like some cache inconsistency maybe. 
>>>>>>>> Any other ideas?
>>>>>>>
>>>>>>> I can come up with two important differences between x86 and Arm 
>>>>>>> which can affect the execution of QEMU:
>>>>>>> 1. Memory model. Arm uses a memory model more relaxed than x86 so 
>>>>>>> it is more sensitive for synchronization failures among threads.
>>>>>>> 2. Different instructions. TCG uses JIT so differences in 
>>>>>>> instructions matter.
>>>>>>>
>>>>>>> We should be able to exclude 1) as a potential cause of the 
>>>>>>> problem. iothread mutex should take care of race condition and 
>>>>>>> even cache coherency problem; mutex includes memory barrier 
>>>>>>> functionality.
>>> [...]
>>>>>>> For difference 2), you may try to use TCI. You can find details 
>>>>>>> of TCI in tcg/tci/README.
>>>>>>
>>>>>> This was tested and also with TCI got the same results just much 
>>>>>> slower.
>>>>>>
>>>>>>> The common sense tells, however, the memory model is usually the 
>>>>>>> cause of the problem when you see behavioral differences between 
>>>>>>> x86 and Arm, and TCG should work fine with both of x86 and Arm as 
>>>>>>> they should have been tested well.
>>> [...]
>>>>> Fortunately macOS provides Rosetta 2 for x86 emulation on Apple M1, 
>>>>> which makes it possible to compare x86 and Arm without concerning 
>>>>> the difference of the microarchitecture.
>>>>
>>>> We've tried that before and even running x86 QEMU on M1 with Rosetta 
>>>> 2 it was the same so it's probably not something about the code 
>>>> itself but how it's
>>>
>>> As this was odd I've asked to re-test this and now I'm told at least 
>>> QEMU 5.1 x86_64 build from emaculation.com is working with Rosetta on 
>>> M1 Mac so this suggests it may be a problem with memory sync but 
>>> still don't know where and what to try. We're now try newer X86_64 
>>> builds to see if it broke somewhere along the way.
>>>
>>> Anybody else with an M1 Mac wants to help testing? Can you reproduce 
>>> the same with UTM with MorphOS and ati-vga? Here's what I've got 
>>> showing the problem: https://www.youtube.com/watch?v=j5Ag5_Yq-Mk
>>>
>>> Regards,
>>> BALATON Zoltan
>>
>> Hi,
>>
>> I finally reproduced the issue with MorphOS and ati-vga and figured 
>> out its cause.
> 
> Great, thanks a lot. After establishing it works with x86 version we 
> were about to test with aarch64 QEMU 5.0 where sm501 did not yet use 
> pixman but ati-vga did so we could check if it's related to pixman as 
> previous test results with old version were all wrong it seems. But you 
> were faster.
> 
>> The problem is that pixman_blt() is disabled because its backend is 
>> written in GNU assembly, and GNU assembler is not available on macOS. 
>> There is no fallback written in C, unfortunately. The issue is tracked 
>> by the upstream at:
>> https://gitlab.freedesktop.org/pixman/pixman/-/issues/59
> 
> Hm, OK but that ticket is just about compile error and suggests to 
> disable it and does not say it won't work then. Are they aware this is a 
> problem? Maybe we should write to their mailing list after we're sure 
> what's happening.

That's a good idea. They may prioritize the issue if they realize that 
disables pixman_blt().

> 
>> I hit the same problem on Asahi Linux, which is based on Arch Linux 
>> ARM. It is because Arch Linux copied PKGBUILD from x86 Arch Linux, 
>> which disables Arm backends. It is easy to enable the backend for the 
>> platform so I proposed a change at:
>> https://github.com/archlinuxarm/PKGBUILDs/pull/1985
> 
> On macOS one source of pixman most people use is brew.sh where this 
> seems to be disabled:
> 
> https://github.com/Homebrew/homebrew-core/blob/master/Formula/pixman.rb
> 
> another source is macports which has an older version and no such options:
> 
> https://github.com/macports/macports-ports/blob/master/graphics/libpixman-devel/Portfile
> 
> I wonder if it compiles from macports on aarch64 then.

It's more likely that it is just outdated. It does not carry a patch to 
fix the issue.

> 
> I wait if I can get some more test results and try to check pixman but 
> its source is not too clear to me and there are no docs either so maybe 
> the best way is to ask on their list. If this is a pixman issue I hope 
> it can be fixed there and we don't need to implement a fallback in QEMU.

This is certainly a pixman issue.

If you read the source, you can see pixman_blt() calls 
_pixman_implementation_blt(). _pixman_implementation_blt() calls blt 
member of pixman_implementation_t in turn. Grepping for "blt =" tells it 
is only assigned in:
pixman/pixman-arm-neon.c
pixman/pixman-arm-simd.c
pixman/pixman-mips-dspr2.c
pixman/pixman-mmx.c
pixman/pixman-sse2.c

For AArch64, only pixman/pixman-arm-neon.c is relevant, and it needs to 
be disabled to build the library on macOS.

Regards,
Akihiko Odaki

> 
> Regards,
> BALATON Zoltan

