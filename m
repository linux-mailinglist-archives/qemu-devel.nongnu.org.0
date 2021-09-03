Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F1B3FFB42
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 09:46:53 +0200 (CEST)
Received: from localhost ([::1]:51042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM3uW-0006YL-De
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 03:46:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mM3tG-0005dI-0H
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 03:45:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mM3t6-0005nK-Dd
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 03:45:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630655121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DVYbHmeU9jl+c4bxopH6ycdQWQoW1mnrq3s116PxjPc=;
 b=YDouL3dWqWxLLEa7dmEF+ctkMdYNME3Hp+08FDUaIvQ20LBm6XirjCiQj4fwV0nisXzenF
 wituXPtdHRJtgtzeq+Ds58v82yxizib3eLmBltoErLOoXI0ZMo5FHvWvdHbwVFzqRIaspn
 HdqURBj1g/A3HoRmtcbKPQDF0DP18Yo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-SFIs0KQ6N9CSBCp_0EYU-w-1; Fri, 03 Sep 2021 03:45:18 -0400
X-MC-Unique: SFIs0KQ6N9CSBCp_0EYU-w-1
Received: by mail-wm1-f69.google.com with SMTP id
 b126-20020a1c8084000000b002f152a868a2so1520337wmd.1
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 00:45:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=DVYbHmeU9jl+c4bxopH6ycdQWQoW1mnrq3s116PxjPc=;
 b=pfA3jE6KMU4J2R9TF+ICdgUV29M4UJM/8KK5TiZPNtmONZ9B+s1dXoHngA0y2g+ri7
 a6xCn1bW7PuJvU2Ppmg4yG6Sp7NqUtLL1k7SBFKTayheUQqMhUxQryllujjQqkIDRzMT
 E46AHctZbah9EYyGgOn/+6KSdYGYW7RLx1RbZx17uXHfmtDkikhBkiY0f3ei28DvtL6L
 JnGT0ggNXGMc5Op1PHI0dcI5F7anjhMdG4u7uwM/XeawcnJklY/b1bvT/Qtj5pKEB6rC
 AB5Q6NUeal/sQ7QH1HCAnz58iahfMM2njiKjysqmDk8hq0DhNjmudl9tWlN/plsAgTUd
 4rMg==
X-Gm-Message-State: AOAM533QxsUJcu4vCg+TzuHNYrObfcBvX6cdf0FtrgrZmKCGIhzoHz0k
 RBCXq0J+bsDc/odonvXxocqWayWnjZ548I5CpwLgK8j8fRQy/WS7knZrCeqCiJA7gtRH8UDn1zf
 pkBl9IbIri47JhhQ=
X-Received: by 2002:a05:600c:4ca2:: with SMTP id
 g34mr7037614wmp.46.1630655117288; 
 Fri, 03 Sep 2021 00:45:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmnso23puXpcW0IWmHHsU38Gq9dc5TnUvU1ddfAyEVYdmMRVpAsb8f0DW+j2QdVmJahg22vA==
X-Received: by 2002:a05:600c:4ca2:: with SMTP id
 g34mr7037584wmp.46.1630655117041; 
 Fri, 03 Sep 2021 00:45:17 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23e05.dip0.t-ipconnect.de. [79.242.62.5])
 by smtp.gmail.com with ESMTPSA id
 t23sm4215282wrb.71.2021.09.03.00.45.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 00:45:16 -0700 (PDT)
Subject: Re: [PATCH v4 8/9] migration/ram: Factor out populating pages
 readable in ram_block_populate_pages()
To: Peter Xu <peterx@redhat.com>
References: <20210902131432.23103-1-david@redhat.com>
 <20210902131432.23103-9-david@redhat.com> <YTFQKKPK3evHAMWN@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <bcdb8e57-7032-f5c4-469c-f423cce923ab@redhat.com>
Date: Fri, 3 Sep 2021 09:45:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTFQKKPK3evHAMWN@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.225, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.09.21 00:28, Peter Xu wrote:
> On Thu, Sep 02, 2021 at 03:14:31PM +0200, David Hildenbrand wrote:
>> Let's factor out prefaulting/populating to make further changes easier to
>> review. While at it, use the actual page size of the ramblock, which
>> defaults to qemu_real_host_page_size for anonymous memory.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   migration/ram.c | 21 ++++++++++++---------
>>   1 file changed, 12 insertions(+), 9 deletions(-)
>>
>> diff --git a/migration/ram.c b/migration/ram.c
>> index e1c158dc92..de47650c90 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -1639,6 +1639,17 @@ out:
>>       return ret;
>>   }
>>   
>> +static inline void populate_range(RAMBlock *block, ram_addr_t offset,
>> +                                  ram_addr_t size)
>> +{
>> +    for (; offset < size; offset += block->page_size) {
>> +        char tmp = *((char *)block->host + offset);
>> +
>> +        /* Don't optimize the read out */
>> +        asm volatile("" : "+r" (tmp));
>> +    }
>> +}
> 
> If to make it a common function, make it populate_range_read()?

Indeed, makes sense.

> 
> Just to identify from RW, as we'll fill the holes with zero pages only, not
> doing page allocations yet, so not a complete "populate".

Well, depending on the actual memory backend ...

> 
> That'll be good enough for live snapshot as uffd-wp works for zero pages,
> however I'm just afraid it may stop working for some new users of it when zero
> pages won't suffice.

I thought about that as well. But snapshots/migration will read all 
memory either way and consume real memory when there is no shared zero 
page. So it's just shifting the point in time when we allocate all these 
pages I guess.

> 
> Maybe some comment would help too?
>
Yes, will do, thanks!

-- 
Thanks,

David / dhildenb


