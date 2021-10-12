Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C648042A1B8
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 12:13:32 +0200 (CEST)
Received: from localhost ([::1]:40084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maEmp-0000RN-Cu
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 06:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1maEj5-0007O7-Je
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:09:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1maEj3-0005Vq-Vh
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:09:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634033377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ClKN3K6ksmerflvy/OnQHpBtnCXB6sP6jvc/la0Qn74=;
 b=LUmcxqoP8qFYD4IW+h4X+k6TmwUD3WQj2DUgHnBkE1qQwjvwJtbfrou+B4uUbwtnoT7a9r
 BmBi/j2K1E/cdQNdy5qHiqjlW0zP+y5QZj5wE4hM+z1iMX0rtCTmccQhz4HjUNXvxHy752
 Zun0+XPCP+F4QlilSc3uw6HLunuRat8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-HfiTFc60M62mt5ghOeBLJw-1; Tue, 12 Oct 2021 06:09:34 -0400
X-MC-Unique: HfiTFc60M62mt5ghOeBLJw-1
Received: by mail-wr1-f70.google.com with SMTP id
 r16-20020adfb1d0000000b00160bf8972ceso15361054wra.13
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 03:09:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ClKN3K6ksmerflvy/OnQHpBtnCXB6sP6jvc/la0Qn74=;
 b=rK7jCAhtGfWibjmeBlJJICYOlPtz+sbp3zRt8e/oy8pATJ/jIa4XlUjSjTsCF8Gsqp
 IGh5FDmKH+Jjd34kwbyl9OopwbZ1RiPu/OD4hu9KuT0JzPACxFdeWO1LxZZaAU8ATVA/
 ueUQj0fes6WAqL1Zhx0cBKMSYmYMpWKO6+7wdzgtQahjZz/ONfqlo/Dezx1rB6CaizWa
 yfmsHdOX0t93tHAWBWm6Tohf1HV4/SucKOGsgoMgphn74tG16DuCYMIERM2qlivOosv7
 cFiX1usRzrDXtS/zuEowDXG/Zc3zzSzyStRrooCatxqzOknNh6OqxorDK7ttSmWyLkPG
 Dktg==
X-Gm-Message-State: AOAM532340gsf8SPrdtM549l7sQA0PY6U9fBYI0JNzzFU6eJU2UL3GHt
 VWxgDIDeKA8NKHE7wbRvCi4ShKFKvtNfhz5hq1tr8Bmx0unrN+/ZJuPabfCYzccB1CIOITQFNcf
 TmyBt8AyfZZaRvpc=
X-Received: by 2002:adf:aa4e:: with SMTP id q14mr30712133wrd.100.1634033372888; 
 Tue, 12 Oct 2021 03:09:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYjgUwszQigAywoLGggybaaOG1rs0cbWocwBbX3p6mnZOi3y1mn+tkTzcYy3/Yjl109guAYw==
X-Received: by 2002:adf:aa4e:: with SMTP id q14mr30712105wrd.100.1634033372616; 
 Tue, 12 Oct 2021 03:09:32 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6a12.dip0.t-ipconnect.de. [91.12.106.18])
 by smtp.gmail.com with ESMTPSA id
 z8sm10287695wrq.16.2021.10.12.03.09.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 03:09:32 -0700 (PDT)
To: Igor Mammedov <imammedo@redhat.com>
References: <20211011174522.14351-1-david@redhat.com>
 <20211011174522.14351-3-david@redhat.com>
 <93dead18-5ea5-0afe-18c1-de9a06773687@linaro.org>
 <8108c69d-a596-d6c9-a116-783f47904deb@amsat.org>
 <845d3d5f-f9e9-d59d-c868-5a9825eb7fba@redhat.com>
 <20211012105300.1ef25440@redhat.com>
 <a2078241-1dc9-782e-38a3-eab06c1b162c@redhat.com>
 <20211012120059.14e19dc1@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 2/2] memory: Update description of
 memory_region_is_mapped()
Message-ID: <84adb9d1-6e30-7d5e-a362-0a81ea4b8b01@redhat.com>
Date: Tue, 12 Oct 2021 12:09:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211012120059.14e19dc1@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> 
> The less confusing would be one where check works for any memory region
> involved.

Exactly, so for any alias, even in-between another alias and the target.

>   
>>>
>>>    
>>>>        I am not aware of actual issues, this is rather a cleanup.
>>>>        
>>>>        Signed-off-by: David Hildenbrand <david@redhat.com>
>>>>
>>>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>>>> index 75b4f600e3..93d0190202 100644
>>>> --- a/include/exec/memory.h
>>>> +++ b/include/exec/memory.h
>>>> @@ -728,6 +728,7 @@ struct MemoryRegion {
>>>>         const MemoryRegionOps *ops;
>>>>         void *opaque;
>>>>         MemoryRegion *container;
>>>> +    int mapped_via_alias; /* Mapped via an alias, container might be NULL */
>>>>         Int128 size;
>>>>         hwaddr addr;
>>>>         void (*destructor)(MemoryRegion *mr);
>>>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>>>> index 3bcfc3899b..1168a00819 100644
>>>> --- a/softmmu/memory.c
>>>> +++ b/softmmu/memory.c
>>>> @@ -2535,8 +2535,13 @@ static void memory_region_add_subregion_common(MemoryRegion *mr,
>>>>                                                    hwaddr offset,
>>>>                                                    MemoryRegion *subregion)
>>>>     {
>>>> +    MemoryRegion *alias;
>>>> +
>>>>         assert(!subregion->container);
>>>>         subregion->container = mr;
>>>> +    for (alias = subregion->alias; alias; alias = alias->alias) {
>>>> +       alias->mapped_via_alias++;
>>>
>>> it it necessary to update mapped_via_alias for intermediate aliases?
>>> Why not just update on counter only on leaf (aliased region)?
>>
>> Assume we have alias0 -> alias1 -> region and map alias0.
>>
>> Once alias0 is mapped it will have ->container set and
>> memory_region_is_mapped(alias0) will return "true".
>>
>> With my patch, both, "alias1" and the region will be marked
>> "mapped_via_alias" and memory_region_is_mapped() will succeed on both of
>> them. With what you propose, memory_region_is_mapped() would only
>> succeed on the region (well, and on alias 0) but not on alias1.
> 
> as long as add_subregion increments counter on leaf it doesn't matter
> how many intermediate aliases are there. Check on every one of them
> should end up at the leaf counter (at expense of traversing
> chain on every check but less state to track/think about).
> 

Sure, we could also let memory_region_is_mapped() walk all aliases to 
the leaf. Not sure though, if it really simplifies things. It merely 
adds another loop and doesn't get rid of the others :) But I don't 
particularly care.

-- 
Thanks,

David / dhildenb


