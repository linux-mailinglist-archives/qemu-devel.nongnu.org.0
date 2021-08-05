Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 892663E1026
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 10:23:03 +0200 (CEST)
Received: from localhost ([::1]:47066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBYec-0000VR-K0
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 04:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mBYdA-0007NV-30
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 04:21:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mBYd8-0005NL-G3
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 04:21:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628151689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=frexNnUQZ9Lrvye9AdQ1Af41hcfUA7y/cCt0rEwJD/o=;
 b=BPM/Pjx2fUW3tAHJRUZk9kXdy7Gui07byEL4tjQNMd+/sXHD98lHhC8jojptOBIdfIzPWV
 yfYaOYY7lqDR6GFrSdpz1QdlURXodDf7Am8+RIBO74X5DH/FO6LQXncxH2t4vORwJ76j7w
 xDNRlxpTt3JeJ8A0kiMuzEN2Zu7AyVY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-Hf88XepyPO-62qJ6H1uzEw-1; Thu, 05 Aug 2021 04:21:27 -0400
X-MC-Unique: Hf88XepyPO-62qJ6H1uzEw-1
Received: by mail-wm1-f71.google.com with SMTP id
 l19-20020a05600c4f13b029025b036c91c6so999076wmq.2
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 01:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=frexNnUQZ9Lrvye9AdQ1Af41hcfUA7y/cCt0rEwJD/o=;
 b=fRr8WGPrA6ADU4NTMnrL6BWHhgz/punqHFxtsMhmpK7aK+9SdhIVIVWf7WEh71ctgG
 tbZbVbcsbJraEwUK+zFNaN7mHbPc0qozy3ZeLIC1WE9a0jvImGXqHJ3gqFD3CYCMVZdY
 Lhbkig4O6K+0g/rr60GYeSZ7bj9+1HX6zTzPSRvsWe3mC17G9pmQFUx8DVlQBGgJr7pg
 vN/3lFrU2/3yinnEUrPKQgWlIMcNsycCio26ccE/OUplynvv6ZwVTg3jiSrAVdQftgGP
 sD+afJSyZiIoyLNL0gp5pZylK5Smwj5CONUHQBSmqkA2O9KRvUd6ULYkGGhKprtGLLC7
 mSyw==
X-Gm-Message-State: AOAM533y9cjfptePD1MuRVRjqts59QAkmkswYcSlZCU7+6Cq/9bKH4gM
 DDzO/m2AAKySaHtuGHI0FavLzz4ZmV+6bP1aIL4Drgscud+sQ+pnwcsCgd12EiLAv3B5zK+o5HD
 olMRW9klVJ8wfaig=
X-Received: by 2002:a5d:4b81:: with SMTP id b1mr3639042wrt.180.1628151686679; 
 Thu, 05 Aug 2021 01:21:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8ABc1ipI/OyaG29JiAoUFOMufxMKOgzh5r8T5xrG7SqC0AlVUUmlrj2MOaV3dshgvwYjJjw==
X-Received: by 2002:a5d:4b81:: with SMTP id b1mr3639023wrt.180.1628151686508; 
 Thu, 05 Aug 2021 01:21:26 -0700 (PDT)
Received: from [192.168.43.238] (109.red-95-127-154.staticip.rima-tde.net.
 [95.127.154.109])
 by smtp.gmail.com with ESMTPSA id t1sm5082222wrm.42.2021.08.05.01.21.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 01:21:26 -0700 (PDT)
Subject: Re: [PATCH v3 7/7] migration/ram: Handle RAMBlocks with a
 RamDiscardManager on background snapshots
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210730085249.8246-1-david@redhat.com>
 <20210730085249.8246-8-david@redhat.com>
 <fd43555b-5661-33a5-a4da-2a38939704f7@redhat.com>
 <265427ef-ea74-e352-8148-7e4353af6ceb@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <025af202-759f-3d8b-b40a-dba346a36696@redhat.com>
Date: Thu, 5 Aug 2021 10:21:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <265427ef-ea74-e352-8148-7e4353af6ceb@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/5/21 10:11 AM, David Hildenbrand wrote:
> On 05.08.21 10:04, Philippe Mathieu-Daudé wrote:
>> On 7/30/21 10:52 AM, David Hildenbrand wrote:
>>> We already don't ever migrate memory that corresponds to discarded
>>> ranges
>>> as managed by a RamDiscardManager responsible for the mapped memory
>>> region
>>> of the RAMBlock.
>>>
>>> virtio-mem uses this mechanism to logically unplug parts of a RAMBlock.
>>> Right now, we still populate zeropages for the whole usable part of the
>>> RAMBlock, which is undesired because:
>>>
>>> 1. Even populating the shared zeropage will result in memory getting
>>>     consumed for page tables.
>>> 2. Memory backends without a shared zeropage (like hugetlbfs and shmem)
>>>     will populate an actual, fresh page, resulting in an unintended
>>>     memory consumption.
>>>
>>> Discarded ("logically unplugged") parts have to remain discarded. As
>>> these pages are never part of the migration stream, there is no need to
>>> track modifications via userfaultfd WP reliably for these parts.
>>>
>>> Further, any writes to these ranges by the VM are invalid and the
>>> behavior is undefined.
>>>
>>> Note that Linux only supports userfaultfd WP on private anonymous memory
>>> for now, which usually results in the shared zeropage getting populated.
>>> The issue will become more relevant once userfaultfd WP supports shmem
>>> and hugetlb.
>>>
>>> Acked-by: Peter Xu <peterx@redhat.com>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>> ---
>>>   migration/ram.c | 53 +++++++++++++++++++++++++++++++++++++++++--------
>>>   1 file changed, 45 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/migration/ram.c b/migration/ram.c
>>> index 01cea01774..fd5949734e 100644
>>> --- a/migration/ram.c
>>> +++ b/migration/ram.c
>>> @@ -1639,6 +1639,28 @@ out:
>>>       return ret;
>>>   }
>>>   +static inline void populate_range(RAMBlock *block, hwaddr offset,
>>> hwaddr size)
>>> +{
>>> +    char *ptr = (char *) block->host;
>>> +
>>> +    for (; offset < size; offset += qemu_real_host_page_size) {
>>> +        char tmp = *(ptr + offset);
>>> +
>>> +        /* Don't optimize the read out */
>>> +        asm volatile("" : "+r" (tmp));
>>> +    }
>>
>> This template is now used 3 times, a good opportunity to extract it as
>> an (inline?) helper.
>>
> 
> Can you point me at the other users?

Oops I got lost reviewing the series.

> Isn't populate_range() the inline helper you are looking for? :)

Indeed :)

Being a bit picky, I'd appreciate if you split this patch in 2,
extracting populate_range() as a first trivial step.


