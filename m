Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A87D85A62F5
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 14:13:36 +0200 (CEST)
Received: from localhost ([::1]:54916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT07b-00049t-Hr
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 08:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT00y-0005de-QI
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 08:07:03 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:36630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT00w-0005ob-NW
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 08:06:44 -0400
Received: by mail-pl1-x62e.google.com with SMTP id c2so10906165plo.3
 for <qemu-devel@nongnu.org>; Tue, 30 Aug 2022 05:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=BHPxseXnbLvtanD2tjSZdyf+SlzZS08tvZMdGKudPgg=;
 b=JVr1fRoTGBy7ctmxTnzieaPQ3kouTI6q6YnPGQ3YHVEJp9zfKhrJgvMamXdD9CgUMQ
 LZR1kntkTAj2jZF5m4zd6gQ41spJ8Hzq3Y6dadXrcIfwfq7ixjgHoYdZX+aD64SaDljk
 +QYiRUdgsP3cKI2HE8D1EG+gQQJHAZgTZ/dQs1pgVabovM6tfiv2Wgwho2rPapAqENQf
 5xO75IKKBMJ3iejY8MVG6YguUfBqu6UD06ZCBeb92BwZ7S45mYvRC3EpREeaiDEPWRdP
 /2QXqVio0K7PsVQsCjKB18AtPm1z5va6jVnUI48SZWILpHkOc7sN+NTWR+r2FHdGC1ke
 THQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=BHPxseXnbLvtanD2tjSZdyf+SlzZS08tvZMdGKudPgg=;
 b=XTWrcPyZeRa2c55g8EdwD+luIXWY6qm3DzKwwkGgkMRyILfx3aSw9WEWTTB3eGZSaq
 dG18xuC19omuc07h7pSI1y6q9SEAYr9ldibcZ5sPn4c8eMJ+dz5hvpyxLiOXAmAwfO/X
 CQQR14NydAYUl2w0LUOK5T/zsHQldsZVWK1GmM1/9ppWlBchqcG6ce+B500q7EDMXc8p
 2N+DoqYcQsNyQ+Jnbpl8enqihSLLBSSumUwPa7RXUmI6vzZTw2Id76Km39AwxXqSBo94
 n+nv05y4KAawfyYCe0oLtYOZ3cZBAj3AdGfjePuBuiyh4bezIqcf6geHoyijzGpVnGlI
 FMBw==
X-Gm-Message-State: ACgBeo2lmM2Qebq0rp3FVcyVHbdFmmQbnldNcqpjMWjsJgKqWYxo8gOc
 Ggc03vXaThLZycml5L6RPhY=
X-Google-Smtp-Source: AA6agR6pHAZ5M2nv2gy1iK7WuE+nIcD3uqiyzvMEe3m/K3K8TvILOgtjMF+NQsQ9xUY4/kU0LzFS1g==
X-Received: by 2002:a17:90a:d151:b0:1fa:b2a6:226a with SMTP id
 t17-20020a17090ad15100b001fab2a6226amr23596077pjw.104.1661861197942; 
 Tue, 30 Aug 2022 05:06:37 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a170902c94d00b0015e8d4eb1d5sm7650055pla.31.2022.08.30.05.06.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 05:06:37 -0700 (PDT)
Message-ID: <f79cbf92-bb68-67c2-7e7d-a4ac2e09151a@amsat.org>
Date: Tue, 30 Aug 2022 14:06:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH] softmmu/physmem: Fix address of FlatView access in
 address_space_(read|write)_cached_slow()
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220826160927.322797-1-afaria@redhat.com>
 <YwppmYUOLTqQ7K25@xz-m1.local>
In-Reply-To: <YwppmYUOLTqQ7K25@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 27/8/22 20:59, Peter Xu wrote:
> Hi, Alberto,
> 
> On Fri, Aug 26, 2022 at 05:09:27PM +0100, Alberto Faria wrote:
>> Apply cache->xlat to addr before passing it to
>> flatview_(read|write)_continue(), to convert it from the
>> MemoryRegionCache's address space to the FlatView's.
> 
> Any bug encountered?  It'll be great to add more information into the
> commit message if there is.  We could also mention the issue was observed
> by code review or so.

Agreed.

>>
>> Fixes: 48564041a7 ("exec: reintroduce MemoryRegion caching")
>> Co-Developed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>> Signed-off-by: Alberto Faria <afaria@redhat.com>
>> ---
>>   softmmu/physmem.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>> index dc3c3e5f2e..95d4c77cc3 100644
>> --- a/softmmu/physmem.c
>> +++ b/softmmu/physmem.c
>> @@ -3450,9 +3450,9 @@ address_space_read_cached_slow(MemoryRegionCache *cache, hwaddr addr,
>>       l = len;
>>       mr = address_space_translate_cached(cache, addr, &addr1, &l, false,
>>                                           MEMTXATTRS_UNSPECIFIED);
>> -    return flatview_read_continue(cache->fv,
>> -                                  addr, MEMTXATTRS_UNSPECIFIED, buf, len,
>> -                                  addr1, l, mr);
>> +    return flatview_read_continue(cache->fv, cache->xlat + addr,

So this is just addr1...

>> +                                  MEMTXATTRS_UNSPECIFIED, buf, len, addr1, l,
>> +                                  mr);
>>   }
>>   
>>   /* Called from RCU critical section. address_space_write_cached uses this
>> @@ -3468,9 +3468,9 @@ address_space_write_cached_slow(MemoryRegionCache *cache, hwaddr addr,
>>       l = len;
>>       mr = address_space_translate_cached(cache, addr, &addr1, &l, true,
>>                                           MEMTXATTRS_UNSPECIFIED);
>> -    return flatview_write_continue(cache->fv,
>> -                                   addr, MEMTXATTRS_UNSPECIFIED, buf, len,
>> -                                   addr1, l, mr);
>> +    return flatview_write_continue(cache->fv, cache->xlat + addr,
>> +                                   MEMTXATTRS_UNSPECIFIED, buf, len, addr1, l,
>> +                                   mr);
>>   }
> 
> The issue looks correct, but I hesitate on the fix.. since afaict
> cache->xlat is per memory region not flat view, so the new calculation is
> offset within memory region but not flat view too.
> 
> So I'm wondering whether it should become:
> 
>    cache->xlat + addr - cache.mrs.offset_within_region +
>      cache.mrs.offset_within_address_space

If so, shouldn't this be calculated [*] within 
address_space_translate_cached() instead of the caller?

[*] Maybe passed as another pointer to hwaddr

> If the issue happens on vIOMMU+virtio on x86, then offset_within_region and
> offset_within_address_space should be all zeros for vt-d emulation since
> vt-d only has one huge vIOMMU window, then the outcome could be the same.
> However maybe there might be a difference with other vIOMMUs.
> 
> Thanks,
> 


