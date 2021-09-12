Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 430C1407F1C
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 20:02:56 +0200 (CEST)
Received: from localhost ([::1]:51706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTod-0002Pf-C1
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 14:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTK8-0004Ie-Cb
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:31:24 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:35757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTK6-0006ZD-DG
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:31:23 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 r128-20020a1c4486000000b003065f0bc631so586847wma.0
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fRR+WTJwmJ89CeuK2LElXPeIVqMe2SOmPTsqZRuOwNo=;
 b=i67RBcqVHatvVw84HM9ZVcgVBiTKyhF+j/UY8u/KON8VlyKrD8qMrU8iR0GXJZgaEM
 Ps0OT6vPFbcpbS9X8d76CmmUA5BokVFJaLWCTkTTUq64ZO9jKidcfr4n3IiQCtY3GaKA
 bHgeeIIkqhs/8mKtgCgga9g2CcXB5//w/1e5cytFi85Rq47wGzIkjZYbLPL94RcOX7hO
 tY7kGOplLVpwX3jh6YDOMRr3IzftDM2/kFVdWC/03odhdYv2UC8a699usTpG+3zK7u2L
 Mc40sVXpd55HVANBvL4YPydndjjpef/l34J9hNSefPF1LjeZKaw6RSbw4L7iQlFmblQf
 RK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fRR+WTJwmJ89CeuK2LElXPeIVqMe2SOmPTsqZRuOwNo=;
 b=6vWAA5rvAZsliks5e5XUJkAB9lNtDb6aPgaZddZeYAAJgJz6uxM18j4C1Op4zb9Wga
 ClunZzdI88bcvRt/nqTCrJEz9OOeYzxe5hQBJrMC7EgjQFlWmSHDkaMQ3+AOaFxdqSs3
 RMbbG29XkHgND1WOeDwmexvJYcjpuXUxPq1auYazyUc2/WjKZmnaxFi3M022GbkAqbk1
 02uqkXYx13H67CET0Q1Yla3bvwRpmADxPYZ417P9YDt2BKaJwmWWp6M5YzSbIQO1f8Ov
 YP0FNwjgsBiLNjoWC7g5oZj6YPzLequnW5s407/8GGCA4vq6aeOKr9ykrvO9zbzVi4Oy
 F6LQ==
X-Gm-Message-State: AOAM532uQt75uCdLTHcaAmtI8oLTZi6roTvFoCvq/wOqxb4Ier6E/U+n
 SLDyFS9DIpKCXHAKFW+JqdFsnKGAXXY=
X-Google-Smtp-Source: ABdhPJwNnsMbM6NAomJ+ruv+ay2tnW/w0uytcC/WEYyoqBXtON083dK7uox/9JkrEafpx+wR9iK0bQ==
X-Received: by 2002:a05:600c:4109:: with SMTP id
 j9mr7591591wmi.88.1631467881095; 
 Sun, 12 Sep 2021 10:31:21 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id q128sm5526637wma.27.2021.09.12.10.31.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 10:31:20 -0700 (PDT)
Subject: Re: [PATCH 02/20] nubus-device: expose separate super slot memory
 region
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
 <20210912074914.22048-3-mark.cave-ayland@ilande.co.uk>
 <68bd423d-caf6-53eb-f68b-68c14a1e82a9@amsat.org>
 <7fef53a0-b003-ed11-470d-441b3edfeb22@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <363bdb30-860c-9a5a-e1e1-37491ab13a52@amsat.org>
Date: Sun, 12 Sep 2021 19:31:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7fef53a0-b003-ed11-470d-441b3edfeb22@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.584,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/21 7:20 PM, Mark Cave-Ayland wrote:
> On 12/09/2021 16:50, Philippe Mathieu-Daudé wrote:
> 
>> On 9/12/21 9:48 AM, Mark Cave-Ayland wrote:
>>> According to "Designing Cards and Drivers for the Macintosh Family"
>>> each physical
>>> nubus slot can access 2 separate address ranges: a super slot memory
>>> region which
>>> is 256MB and a standard slot memory region which is 16MB.
>>>
>>> Currently a Nubus device uses the physical slot number to determine
>>> whether it is
>>> using a standard slot memory region or a super slot memory region
>>> rather than
>>> exposing both memory regions for use as required.
>>>
>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> ---
>>>   hw/nubus/nubus-device.c  | 36 ++++++++++++++++++------------------
>>>   include/hw/nubus/nubus.h |  1 +
>>>   2 files changed, 19 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
>>> index be01269563..36203848e5 100644
>>> --- a/hw/nubus/nubus-device.c
>>> +++ b/hw/nubus/nubus-device.c
>>> @@ -168,26 +168,26 @@ static void nubus_device_realize(DeviceState
>>> *dev, Error **errp)
>>>       }
>>>         nd->slot = nubus->current_slot++;
>>> -    name = g_strdup_printf("nubus-slot-%d", nd->slot);
>>> -
>>> -    if (nd->slot < NUBUS_FIRST_SLOT) {
>>> -        /* Super */
>>> -        slot_offset = (nd->slot - 6) * NUBUS_SUPER_SLOT_SIZE;
>>> -
>>> -        memory_region_init(&nd->slot_mem, OBJECT(dev), name,
>>> -                           NUBUS_SUPER_SLOT_SIZE);
>>> -        memory_region_add_subregion(&nubus->super_slot_io, slot_offset,
>>> -                                    &nd->slot_mem);
>>> -    } else {
>>> -        /* Normal */
>>> -        slot_offset = nd->slot * NUBUS_SLOT_SIZE;
>>> -
>>> -        memory_region_init(&nd->slot_mem, OBJECT(dev), name,
>>> NUBUS_SLOT_SIZE);
>>> -        memory_region_add_subregion(&nubus->slot_io, slot_offset,
>>> -                                    &nd->slot_mem);
>>> -    }
>>>   +    /* Super */
>>> +    slot_offset = (nd->slot - 6) * NUBUS_SUPER_SLOT_SIZE;
>>> +
>>> +    name = g_strdup_printf("nubus-super-slot-%x", nd->slot);
>>> +    memory_region_init(&nd->super_slot_mem, OBJECT(dev), name,
>>> +                        NUBUS_SUPER_SLOT_SIZE);
>>> +    memory_region_add_subregion(&nubus->super_slot_io, slot_offset,
>>> +                                &nd->super_slot_mem);
>>> +    g_free(name);
>>> +
>>> +    /* Normal */
>>> +    slot_offset = nd->slot * NUBUS_SLOT_SIZE;
>>> +
>>> +    name = g_strdup_printf("nubus-slot-%x", nd->slot);
>>
>> I'd rather use "nubus-standard-slot-%x" or "nubus-normal-slot-%x"
>> to differentiate from super-bus. (This also applies to variable
>> names and trace events in this series).
> 
> I can see how this may seem ambiguous, however in "Designing Cards and
> Drivers for the Macintosh Family" the documentation always refers to
> "slot" as a standard slot so there shouldn't be any confusion for
> developers here.

OK, fine then.

>> Anyway,
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

