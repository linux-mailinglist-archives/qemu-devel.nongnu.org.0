Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A61E365735
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 13:11:29 +0200 (CEST)
Received: from localhost ([::1]:52810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYoHw-0004Ia-OW
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 07:11:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lYoGt-0003n3-9R
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 07:10:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lYoGq-0006VA-WD
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 07:10:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618917020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x9ohYEw2J+bGm9t79iiOlf8z8iWRtyEQTScja3Dh7kM=;
 b=UA9eo6mmDijIzhZuCVhbal/TZAoIIopAGMbwC6bKiaqmZ14sSl6j0MabLD36lfck6twlxa
 2/XQUz+STVIK8t9TbnLvdHOZKP96eTIhF905+Cpj+KL8l/6MkmEkzQALa9SJnlO+MAiuGH
 5stNAnLB1lX8xqNSdjZsoE4kPql0jAA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-NiA-XCm1PD21oaaBt-7mGA-1; Tue, 20 Apr 2021 07:10:18 -0400
X-MC-Unique: NiA-XCm1PD21oaaBt-7mGA-1
Received: by mail-wr1-f71.google.com with SMTP id
 j4-20020adfe5040000b0290102bb319b87so10701654wrm.23
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 04:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=x9ohYEw2J+bGm9t79iiOlf8z8iWRtyEQTScja3Dh7kM=;
 b=Qibcfvf+MMO789FhcE5mCgH7BRWyfaoubPviNohvu9mHZ++ldqHipfSgk6X85reahI
 JmBDZHYaCL/noMbeIhIfbZtIW2AOYKzs0joBvkLVfueTsjbIxEKsq5mDjz0LfNkTGEJM
 f04Bvgke1Up1Jh+5JpPhm8RfH/IzNIqXXiBSnuU/vBU531bSjhuWhNh8qaxyBvA43Lw6
 C7KtN/juxXj/CMFVG3+lBANey5ok3TjNSXDPv/eRqKDANdrfOXgglpwc42Gl9JeaXuK7
 cOmkHr3270G3415lZL1h9A59k4kpxLWYMd6Nf8lzC4Rm6eeZI+87bXyeYn9s+DAIUlAE
 EELg==
X-Gm-Message-State: AOAM5318tsmSrxDyyIPOW4Sbm2CvFbyn9KRPJ497z0+Lmcv5aNj9yYYU
 A9SLI2iqZfmOMjOz6QCSWWCaHkp2VG0JKUs/sNDUqaN71Eg5DCdO4e2UPSMPSntUCUQMFw5thhl
 mUqSy4a+6/blePsA=
X-Received: by 2002:a05:600c:d4:: with SMTP id
 u20mr3896729wmm.164.1618917017545; 
 Tue, 20 Apr 2021 04:10:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEJQTGZNGmq89xGX+RbFWICbNyehRYfWObb1l/ftwjnRzNi4Gm/TbZ74ieORQV7pTW+VhWqA==
X-Received: by 2002:a05:600c:d4:: with SMTP id
 u20mr3896698wmm.164.1618917017267; 
 Tue, 20 Apr 2021 04:10:17 -0700 (PDT)
Received: from [192.168.3.132] (p4ff2390a.dip0.t-ipconnect.de. [79.242.57.10])
 by smtp.gmail.com with ESMTPSA id
 g84sm2971926wmf.30.2021.04.20.04.10.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 04:10:16 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210413091421.7707-1-david@redhat.com>
 <20210413091421.7707-6-david@redhat.com>
 <34931ee0-1bde-16f5-d929-1c9d9157f45a@redhat.com>
 <ce266bac-0bfa-4b45-0159-af3e7b17a234@redhat.com>
 <f298a62c-59e5-b562-63d1-8bdd2a44f7fe@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v5 05/14] softmmu/memory: Pass ram_flags to
 memory_region_init_ram_shared_nomigrate()
Message-ID: <5321af89-2f7d-b080-97e8-74a91db1972c@redhat.com>
Date: Tue, 20 Apr 2021 13:10:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f298a62c-59e5-b562-63d1-8bdd2a44f7fe@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.04.21 12:40, Philippe Mathieu-Daudé wrote:
> On 4/20/21 12:27 PM, David Hildenbrand wrote:
>> On 20.04.21 12:20, Philippe Mathieu-Daudé wrote:
>>> Hi David,
>>>
>>> On 4/13/21 11:14 AM, David Hildenbrand wrote:
>>>> Let's forward ram_flags instead, renaming
>>>> memory_region_init_ram_shared_nomigrate() into
>>>> memory_region_init_ram_flags_nomigrate(). Forward flags to
>>>> qemu_ram_alloc() and qemu_ram_alloc_internal().
>>>>
>>>> Reviewed-by: Peter Xu <peterx@redhat.com>
>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>> ---
>>>>    backends/hostmem-ram.c                        |  6 +++--
>>>>    hw/m68k/next-cube.c                           |  4 ++--
>>>>    include/exec/memory.h                         | 24 +++++++++----------
>>>>    include/exec/ram_addr.h                       |  2 +-
>>>>    .../memory-region-housekeeping.cocci          |  8 +++----
>>>>    softmmu/memory.c                              | 20 ++++++++--------
>>>
>>> OK up to here, but the qemu_ram_alloc_internal() changes
>>> in softmmu/physmem.c belong to a different patch (except
>>> the line adding "new_block->flags = ram_flags").
>>> Do you mind splitting it?
>>>
>>
>> Can you elaborate? Temporarily passing both "ram_flags" and "bool
>> resizeable, bool share" to qemu_ram_alloc_internal()?
>>
>> I don't see a big benefit in doing that besides even more effective
>> changes in two individual patches. But maybe if you elaborate, i can see
>> what you would like to see :)
> 
> In this patch I see
> 
> 1/ change a parameter and propagate it
> 2/ adapt assertions
> 
> I'd rather review the assertions modified / cleaned in another patch,
> simply because it required me 2 different mental efforts to review the
> first part and the second part. But maybe it is not possible, so I'll
> review the 2nd part here.

Well, previously you could pass in "bool resizeable, bool share", now 
you can pass in ram_flags with RAM_SHARED, RAM_RESIZEABLE. So that 
assertion part actually looked fairly straight forward to me.

> 
>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>> index cc59f05593..fdcd38ba61 100644
>> --- a/softmmu/physmem.c
>> +++ b/softmmu/physmem.c
>> @@ -2108,12 +2108,14 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t
> size, ram_addr_t max_size,
>>                                     void (*resized)(const char*,
>>                                                     uint64_t length,
>>                                                     void *host),
>> -                                  void *host, bool resizeable, bool
> share,
>> +                                  void *host, uint32_t ram_flags,
>>                                     MemoryRegion *mr, Error **errp)
>>   {
>>       RAMBlock *new_block;
>>       Error *local_err = NULL;
>>
> 
> Maybe also:
> 
>         assert(!host || (ram_flags & RAM_PREALLOC));

It should be even stricter I think

assert(!host ^ (ram_flags & RAM_PREALLOC));

I'd move that change definitely to a separate patch.

Thanks!

-- 
Thanks,

David / dhildenb


