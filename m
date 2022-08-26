Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDCC5A2547
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 12:03:12 +0200 (CEST)
Received: from localhost ([::1]:37120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRWBD-0003AV-HQ
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 06:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oRW6b-0005tA-Ge
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 05:58:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oRW6Y-0006ep-Ed
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 05:58:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661507901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OsKQkLuLnelipPkDVWXK08CsOcRr59BZ1RGZMtg1Qn4=;
 b=Rr7DzEZeCYRaNnVpWXzIyCIqrf1Ge4Iud3D5mgJJYPb1FZguiQ0EeeSpceo6qXULeQxlg2
 cvVsTv8Cui88na7H4lXoTjToLnYRwaRSas0YI/6xJ/XlDyZkiLFyehQiRp90ALs49OZ/d4
 zYw4H4aizG9Fd5GROPxMT1DyqLeMa0M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-463-Ka6-dD2fO0upg3O-o0zDJw-1; Fri, 26 Aug 2022 05:58:20 -0400
X-MC-Unique: Ka6-dD2fO0upg3O-o0zDJw-1
Received: by mail-wm1-f69.google.com with SMTP id
 f7-20020a1c6a07000000b003a60ede816cso293741wmc.0
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 02:58:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=OsKQkLuLnelipPkDVWXK08CsOcRr59BZ1RGZMtg1Qn4=;
 b=HOUJ3e9vSFP1lglN+YgH0HXEysEn4bP1COSZf77RPw8Oxa8JbNFgHAY6WI6BeVqH1V
 UWV3vf5j+IPCG8eUkBbtuIFH27sQ+kRDqJzKD9wR2XSHEiYQKGa3WodeC3bSKwjDlJlw
 ws/B2K/XVyKH6d+7K9lqB8HMVjvURWRsXuGL3YJ7ABCKRX09J0X+qWu9ZmeAbFcJpY7X
 PNL9/ddIhISygSWRPoFK6S6leOBiohs8WgzpNcoM7ay5HzLwFH2WVb4wHZXKxwaovaHW
 FJUlIItsjbFz3W8sjYkLGwOCJFxAUtitxHEdtxpEBDTTc08zYVvfqRchOQkLkp0Pmy9R
 FH5g==
X-Gm-Message-State: ACgBeo2q4FZu1XPWE8i1Fn1q//iTK/AZk+vK5+irCm0yo60dLzkExmxg
 vc4aOce5RA87jEyBNz0t/6mskNb+jpV1Qkmf24X5tny2XwHDEIUagygneK6FsDLZF/ln6R3ZrxX
 tgKMAwstpsGEfRTw=
X-Received: by 2002:a5d:6245:0:b0:225:41ae:a930 with SMTP id
 m5-20020a5d6245000000b0022541aea930mr4536504wrv.342.1661507899285; 
 Fri, 26 Aug 2022 02:58:19 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6JDifAkz/lHvgWkLiso7FU1Q6QLToBAoJv7qIHpzlGBbhy/MNKUYWIynWCC9Z3HTzQ5BFJMg==
X-Received: by 2002:a5d:6245:0:b0:225:41ae:a930 with SMTP id
 m5-20020a5d6245000000b0022541aea930mr4536489wrv.342.1661507898984; 
 Fri, 26 Aug 2022 02:58:18 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:f600:abad:360:c840:33fa?
 (p200300cbc708f600abad0360c84033fa.dip0.t-ipconnect.de.
 [2003:cb:c708:f600:abad:360:c840:33fa])
 by smtp.gmail.com with ESMTPSA id
 q62-20020a1c4341000000b003a3442f1229sm7962345wma.29.2022.08.26.02.58.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 02:58:18 -0700 (PDT)
Message-ID: <fa741ccc-5ec3-de3f-83ef-54383803878a@redhat.com>
Date: Fri, 26 Aug 2022 11:58:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] dump: simplify a bit kdump get_next_page()
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qiaonuohan@cn.fujitsu.com, Peter Maydell <peter.maydell@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20220825132110.1500330-1-marcandre.lureau@redhat.com>
 <20220825132110.1500330-2-marcandre.lureau@redhat.com>
 <b56c6030-8976-f2a1-d411-d892d362d486@redhat.com>
 <CAMxuvayO8fNWOwY43dpKC9kUxsZnxo0VY3++avAesu_VBhhbjA@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAMxuvayO8fNWOwY43dpKC9kUxsZnxo0VY3++avAesu_VBhhbjA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 26.08.22 11:56, Marc-André Lureau wrote:
> Hi
> 
> On Fri, Aug 26, 2022 at 1:45 PM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 25.08.22 15:21, marcandre.lureau@redhat.com wrote:
>>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>
>>> This should be functionally equivalent, but slightly easier to read,
>>> with simplified paths and checks at the end of the function.
>>>
>>> The following patch is a major rewrite to get rid of the assert().
>>>
>>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>> ---
>>>  dump/dump.c | 30 ++++++++++++------------------
>>>  1 file changed, 12 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/dump/dump.c b/dump/dump.c
>>> index 4d9658ffa2..18f06cffe2 100644
>>> --- a/dump/dump.c
>>> +++ b/dump/dump.c
>>> @@ -1107,37 +1107,31 @@ static bool get_next_page(GuestPhysBlock **blockptr, uint64_t *pfnptr,
>>>      uint8_t *buf;
>>>
>>>      /* block == NULL means the start of the iteration */
>>> -    if (!block) {
>>> -        block = QTAILQ_FIRST(&s->guest_phys_blocks.head);
>>> -        *blockptr = block;
>>> -        assert((block->target_start & ~target_page_mask) == 0);
>>> -        assert((block->target_end & ~target_page_mask) == 0);
>>> -        *pfnptr = dump_paddr_to_pfn(s, block->target_start);
>>> -        if (bufptr) {
>>> -            *bufptr = block->host_addr;
>>> -        }
>>> -        return true;
>>
>>
>> Instead of the "return true" we'll now do take the  "if ((addr >=
>> block->target_start) &&" path below I guess, always ending up with
>> essentially "buf = buf;" because addr == block->target_start.
>>
>> I guess that's fine.
>>
>>> +    if (block == NULL) {
>>
>> What's wrong with keeping the "if (!block) {" ? :)
> 
> That's just to be consistent with the comment above.
> 
>>
>>> +        *blockptr = block = QTAILQ_FIRST(&s->guest_phys_blocks.head);
>>
>> Another unnecessary change.
>>
>>> +        addr = block->target_start;
>>> +    } else {
>>> +        addr = dump_pfn_to_paddr(s, *pfnptr + 1);
>>>      }
>>> -
>>> -    *pfnptr = *pfnptr + 1;
>>> -    addr = dump_pfn_to_paddr(s, *pfnptr);
>>> +    assert(block != NULL);
>>>
>>>      if ((addr >= block->target_start) &&
>>>          (addr + s->dump_info.page_size <= block->target_end)) {
>>>          buf = block->host_addr + (addr - block->target_start);
>>>      } else {
>>>          /* the next page is in the next block */
>>> -        block = QTAILQ_NEXT(block, next);
>>> -        *blockptr = block;
>>> +        *blockptr = block = QTAILQ_NEXT(block, next);
>>
>> Another unnecessary change. (avoiding these really eases review, because
>> the focus is then completely on the actual code changes)
>>
>>>          if (!block) {
>>>              return false;
>>>          }
>>> -        assert((block->target_start & ~target_page_mask) == 0);
>>> -        assert((block->target_end & ~target_page_mask) == 0);
>>> -        *pfnptr = dump_paddr_to_pfn(s, block->target_start);
>>> +        addr = block->target_start;
>>>          buf = block->host_addr;
>>>      }
>>>
>>> +    /* those checks are going away next */
>>
>> This comment seems to imply a story documented in code. Rather just drop
>> it -- the patch description already points that out.
>>
>>> +    assert((block->target_start & ~target_page_mask) == 0);
>>> +    assert((block->target_end & ~target_page_mask) == 0);
>>> +    *pfnptr = dump_paddr_to_pfn(s, addr);
>>>      if (bufptr) {
>>>          *bufptr = buf;
>>>      }
>>
>>
>> Apart from the nits, LGTM.
> 
> We could also drop this patch, it helped me to rewrite the function next mostly.

I think it's fine. Small logical changes are easier to review -- at
least for me.

-- 
Thanks,

David / dhildenb


