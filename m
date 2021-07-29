Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3839F3DA902
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 18:28:18 +0200 (CEST)
Received: from localhost ([::1]:33322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m98tN-0001B9-9y
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 12:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m98qw-0005yI-3t
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 12:25:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m98qu-0005YA-0l
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 12:25:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627575943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vrn5rgdfjImrrAkJBnvr8xylQh/Yo8Ink6nQuP6AVmc=;
 b=K8PCxmRNl0uNkz97lxZ6O4NiYxhD64OMIvRNb8LTs13kO7Yg/c5MTTxLoPBglhJczA9uZ6
 jLUR+ET2MYlXT2gTrHeWlmsRlwv2MkyHu6D5Y7J8WG0ldToZ/GeUXIhVG7ZxURWFjdClMV
 YLSYiyWLVTMKxSOTX+U27UgzkJkMLT8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-3P_yFWx1PbKZ4OejDzmc6A-1; Thu, 29 Jul 2021 12:19:34 -0400
X-MC-Unique: 3P_yFWx1PbKZ4OejDzmc6A-1
Received: by mail-wm1-f71.google.com with SMTP id
 k13-20020a05600c1c8db029025018ac4f7dso2169509wms.2
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 09:19:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vrn5rgdfjImrrAkJBnvr8xylQh/Yo8Ink6nQuP6AVmc=;
 b=YLH1xwZpeYKs5rTq3C6t5k46bkh4E4JnCygeEJwr4p+UlqkGZpYH8phBtvn/1+iBdJ
 mUM0io5tAyGGkIzp3zVhjKgUtY5D12Z++iVXOyeEMhQyMZ6ErmrhMamOzABVDGJ0xmIF
 X2XSpln5mLhefFGi1oyfLiUsRTMAGGm5i7qChjjEoY3Y1yuKqqCv7qm6sp8vHARDs5r4
 FFVA0bxilxxKGfQy2f12KLLwje+ncWu8kSuEbYibzHIczI6JdQlMWfeLlLMhUvw1x1IO
 r+aVivbWM7E98fo8moiUpq25BcsTvmGQ9d1+jMItOLwBg1NhzLEaTMGsrUc7QnEr795H
 UZ7w==
X-Gm-Message-State: AOAM531NkgRkfpJht6uDLQKJEMZlO+HUfcnrkXaW+wvLSjhNcujOX02Q
 Pj9WjiMpPrCuzEr8HRAsxGCf9oXoYeMXG3QbVNRK/kyGOqTh/Vm+5G06A9rwGyxlxIFzmvOXLni
 PqonBSH3wzced4M0=
X-Received: by 2002:a7b:c390:: with SMTP id s16mr5779887wmj.148.1627575572819; 
 Thu, 29 Jul 2021 09:19:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySlAHo/AfoUWDIzXciq9nBx2bMq1IanxiCKiI2mm4dkWm6o+feJsiz0vlY4gMWCZkrWDNoZA==
X-Received: by 2002:a7b:c390:: with SMTP id s16mr5779872wmj.148.1627575572644; 
 Thu, 29 Jul 2021 09:19:32 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id 19sm10163516wmj.2.2021.07.29.09.19.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 09:19:32 -0700 (PDT)
Subject: Re: [PATCH v2 0/6] migration/ram: Optimize for virtio-mem via
 RamDiscardManager
To: Peter Xu <peterx@redhat.com>
References: <YPrqfkCk7EM7QLpa@t490s>
 <ea9e9071-4ecb-9c28-9567-92585a18b4eb@redhat.com> <YPtAd+JqfNeQqGib@t490s>
 <da54f4ab-2f20-a780-1a9c-b6f4c1c50969@redhat.com> <YQA+CUCWV4YDdu9C@t490s>
 <74271964-c481-7168-2a70-ea9eb5067450@redhat.com> <YQGzLl9IHod5rJRb@t490s>
 <b54cab91-87a6-298c-e527-0f75f8c38c74@redhat.com> <YQG74AsEBE0uaN4U@t490s>
 <a1c80a40-2828-3373-c906-870f0dbb6db8@redhat.com> <YQLTUIvrVe+TM/lw@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <df5c7623-9986-d282-2ee9-eb28908d2994@redhat.com>
Date: Thu, 29 Jul 2021 18:19:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQLTUIvrVe+TM/lw@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.125, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Juan Quintela <quintela@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29.07.21 18:12, Peter Xu wrote:
> On Thu, Jul 29, 2021 at 10:14:47AM +0200, David Hildenbrand wrote:
>>>>>>> The thing is I still think this extra operation during sync() can be ignored by
>>>>>>> simply clear dirty log during bitmap init, then.. why not? :)
>>>>>>
>>>>>> I guess clearing the dirty log (especially in KVM) might be more expensive.
>>>>>
>>>>> If we send one ioctl per cb that'll be expensive for sure.  I think it'll be
>>>>> fine if we send one clear ioctl to kvm, summarizing the whole bitmap to clear.
>>>>>
>>>>> The other thing is imho having overhead during bitmap init is always better
>>>>> than having that during sync(). :)
>>>>
>>>> Oh, right, so you're saying, after we set the dirty bmap to all ones and
>>>> excluded the discarded parts, setting the respective bits to 0, we simply
>>>> issue clearing of the whole area?
>>>>
>>>> For now I assumed we would have to clear per cb.
>>>
>>> Hmm when I replied I thought we can pass in a bitmap to ->log_clear() but I
>>> just remembered memory API actually hides the bitmap interface..
>>>
>>> Reset the whole region works, but it'll slow down migration starts, more
>>> importantly that'll be with mmu write lock so we will lose most clear-log
>>> benefit for the initial round of migration and stuck the guest #pf at the
>>> meantime...
>>>
>>> Let's try do that in cb()s as you mentioned; I think that'll still be okay,
>>> because so far the clear log block size is much larger (1gb), 1tb is worst case
>>> 1000 ioctls during bitmap init, slightly better than 250k calls during sync(),
>>> maybe? :)
>>
>> Just to get it right, what you propose is calling
>> migration_clear_memory_region_dirty_bitmap_range() from each cb().
> 
> Right.  We can provide a more complicated memory api for passing in bitmap but
> I think that can be an overkill and tricky.
> 
>> Due to the clear_bmap, we will end up clearing each chunk (e.g., 1GB) at most
>> once.
>>
>> But if our layout is fragmented, we can actually end up clearing all chunks
>> (1024 ioctls for 1TB), resulting in a slower migration start.
>>
>> Any gut feeling how much slower migration start could be with largish (e.g.,
>> 1 TiB) regions?
> 
> I had a vague memory of KVM_GET_DIRTY_LOG that I used to measure which took
> ~10ms for 1g guest mem, supposing that's mostly used to protect the pages or
> clearing dirties in the EPT pgtables.  Then the worst case is ~1 second for
> 1tb.
> 
> But note that it's still during setup phase, so we should expect to see a
> somehow large setup time and longer period that migration stays in SETUP state,
> but I think it's fine.  Reasons:
> 
>    - We don't care too much about guest dirtying pages during the setup process
>      because we haven't migrated anything yet, meanwhile we should not block any
>      other thread either (e.g., we don't hold BQL).
> 
>    - We don't block guest execution too.  Unlike KVM_GET_DIRTY_LOG without CLEAR
>      we won't hold the mmu lock for a huge long time but do it only in 1g chunk,
>      so guest page faults can still be serviced.  It'll be affected somehow
>      since we'll still run with the mmu write lock critical sections for each
>      single ioctl(), but we do that for 1gb each time so we frequently yield it.
> 

Please note that we are holding the iothread lock while setting up the 
bitmaps + syncing the dirty log. I'll have to make sure that that code 
runs outside of the BQL, otherwise we'll block guest execution.

In the meantime I adjusted the code but it does the clearing under the 
iothread lock, which should not be what we want ... I'll have a look.

-- 
Thanks,

David / dhildenb


