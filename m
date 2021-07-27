Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB9B3D71EE
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 11:26:23 +0200 (CEST)
Received: from localhost ([::1]:58742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8JLy-0001Cl-MH
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 05:26:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8JKw-0000SZ-Uj
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 05:25:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8JKs-0007KG-QW
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 05:25:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627377913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4sy5VKX6f9vv9sxpEeEkM0CmH0qj7IcENG93OrN8s6M=;
 b=YjsSQgVzR2KUgY1M4igsVYB9ZROkaBMQ5OddAjKZ+pvmzHP/SA4axXvz8qBvTeqGoDWAoL
 ZdqphBquW1SgPXa5vVG3YRsRPqfUnJW1U11LU8B2e8GYUHTvnowvjushfU9RUBWKiQ81UX
 LBVJPpHtq70A0tMvFD1/SG3Z0aJupWo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-2ASqKr13PlCb9h5iOvpGlA-1; Tue, 27 Jul 2021 05:25:12 -0400
X-MC-Unique: 2ASqKr13PlCb9h5iOvpGlA-1
Received: by mail-wr1-f69.google.com with SMTP id
 n1-20020a5d59810000b029013cd60e9baaso5756796wri.7
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 02:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=4sy5VKX6f9vv9sxpEeEkM0CmH0qj7IcENG93OrN8s6M=;
 b=l4J27Go3VHQj5XpSvdhrpSquZ2a/hV0skHNsI7O27SKy10+WLrLZv/BUp4ydbGgqMJ
 nqJMjdLSNvIT3gxXeAu7G/8RVY+Zp7e+v0i1PBxVrzxvb4nNHIMQQPwP0CU1/7ioRy/c
 ps+qMD9ypKWIxyUlJ5vp4xQYUNOEpSA7fvYeDnF7dDh05HRnWVDWRWj4Kt0pJkT0zNHV
 1z5PCrHYAj/6EjidDMBQH3xsi/rfoJaWxtdCIpe/u6PdX9Z77c2eNGWVshUyoTLGGzYl
 FSfTzJGNKbc3acULfHFvbtFhQGW2EiaZ+gtJC5xDsxnoGdJfrytGqfBkoSIlsAUZy9Ls
 By9w==
X-Gm-Message-State: AOAM532n+tvMlBSuGa+d8br/wSWxBB8ASDeMsAvwrXzVAlw6pK+O1n2f
 lP5DiXyzS26ZY1mzukZPicG99cn1ICaIxyESLfjAz2hInX7q8R9xdZTgUJTTqh2ZBxvGJT+6Hom
 3Mw74At/U5LXGnn8=
X-Received: by 2002:a5d:4c87:: with SMTP id z7mr23464697wrs.405.1627377910738; 
 Tue, 27 Jul 2021 02:25:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJ5HX0kFjlzyRsppCHUFsyxyKfZujRO3kMlbfBza8gliYGj/ilOjOz/K8QmsOJFNqkKFd3iQ==
X-Received: by 2002:a5d:4c87:: with SMTP id z7mr23464676wrs.405.1627377910415; 
 Tue, 27 Jul 2021 02:25:10 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23c36.dip0.t-ipconnect.de. [79.242.60.54])
 by smtp.gmail.com with ESMTPSA id
 p8sm2663962wrn.79.2021.07.27.02.25.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 02:25:09 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: Peter Xu <peterx@redhat.com>
References: <20210721092759.21368-1-david@redhat.com>
 <YPlWqs8N+NiFH/yj@work-vm> <800e421c-70b8-1ef2-56f7-cdbce7a7706b@redhat.com>
 <YPrqfkCk7EM7QLpa@t490s> <ea9e9071-4ecb-9c28-9567-92585a18b4eb@redhat.com>
 <YPtAd+JqfNeQqGib@t490s>
Organization: Red Hat
Subject: Re: [PATCH v2 0/6] migration/ram: Optimize for virtio-mem via
 RamDiscardManager
Message-ID: <da54f4ab-2f20-a780-1a9c-b6f4c1c50969@redhat.com>
Date: Tue, 27 Jul 2021 11:25:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPtAd+JqfNeQqGib@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

On 24.07.21 00:19, Peter Xu wrote:
> On Fri, Jul 23, 2021 at 08:41:40PM +0200, David Hildenbrand wrote:
>> On 23.07.21 18:12, Peter Xu wrote:
>>> On Thu, Jul 22, 2021 at 01:43:41PM +0200, David Hildenbrand wrote:
>>>>>> a) In precopy code, always clearing all dirty bits from the bitmap that
>>>>>>       correspond to discarded range, whenever we update the dirty bitmap. This
>>>>>>       results in logically unplugged memory to never get migrated.
>>>>>
>>>>> Have you seen cases where discarded areas are being marked as dirty?
>>>>> That suggests something somewhere is writing to them and shouldn't be.
>>>>
>>>> I have due to sub-optimal clear_bmap handling to be sorted out by
>>>>
>>>> https://lkml.kernel.org/r/20210722083055.23352-1-wei.w.wang@intel.com
>>>>
>>>> Whereby the issue is rather that initially dirty bits don't get cleared in
>>>> lower layers and keep popping up as dirty.
>>>>
>>>> The issue with postcopy recovery code setting discarded ranges dirty in
>>>> the dirty bitmap, I did not try reproducing. But from looking at the
>>>> code, it's pretty clear that it would happen.
>>>>
>>>> Apart from that, nothing should dirty that memory. Of course,
>>>> malicious guests could trigger it for now, in which case we wouldn't catch it
>>>> and migrate such pages with postcopy, because the final bitmap sync in
>>>> ram_postcopy_send_discard_bitmap() is performed without calling notifiers
>>>> right now.
>>>
>>> I have the same concern with Dave: does it mean that we don't need to touch at
>>> least ramblock_sync_dirty_bitmap in patch 3?
>>
>> Yes, see the comment in patch #3:
>>
>> "
>> Note: If discarded ranges span complete clear_bmap chunks, we'll never
>> clear the corresponding bits from clear_bmap and consequently never call
>> memory_region_clear_dirty_bitmap on the affected regions. While this is
>> perfectly fine, we're still synchronizing the bitmap of discarded ranges,
>> for example, in
>> ramblock_sync_dirty_bitmap()->cpu_physical_memory_sync_dirty_bitmap()
>> but also during memory_global_dirty_log_sync().
>>
>> In the future, it might make sense to never even synchronize the dirty log
>> of these ranges, for example in KVM code, skipping discarded ranges
>> completely.
>> "
>>
>> The KVM path might be even more interesting (with !dirty ring IIRC).
>>
>> So that might certainly be worth looking into if we find it to be a real
>> performance problem.
> 
> OK; hmm then I feel like what's missing is we didn't have the dirty bmap and
> the clear map synced - say, what if we do memory_region_clear_dirty_bitmap()
> when dropping the virtio-mem unplugged ranges too?

Is it a problem that we leave clear_bmap set and actually never clear 
some ranges? I don't think so. To me, this feels like the right thing to 
do: no need to clear something (in QEMU, in KVM) nobody cares about.

IMHO, the real optimization should be to not even sync discarded ranges 
(not from the accelerator, not from the memory region), skipping these 
ranges completely (no sync, no clear). With what you propose, we might 
end up calling into KVM to clear bitmaps of ranges we are not interested 
in, no?

> 
> If disgarded ranges are static during migration, the clear dirty log should
> happen once for them at bitmap init time.  Then IIUC when sync we don't need to
> worry about unplugged memory anymore.

Again, I'm not sure why we want to clear something we don't care about.


There are 3 cases to handle I think:

1) Initially, when the bitmap is set to 1, we want to exclude all 
discarded ranges.

2) Whenever we sync the bitmap, we don't want to get discarded ranges 
set dirty. (e.g., bits still or again dirty in KVM or the memory region)

3) When reloading the bitmap during postcopy errors.


I think for 1) and 3) we seem to agree that clearing the discarded 
ranges from the dirty bitmap is conceptually the right thing.


For 2) I see 3 options:


a) Sync everything, fixup the dirty bitmap, never clear the dirty log of 
discarded parts. It's fairly simple and straight forward, as I can 
simply reuse the existing helper. Something that's discarded will never 
be dirty, not even if a misbehaving guest touches memory it shouldn't. 
[this patch]

b) Sync only populated parts, no need to fixup the dirty bitmap, never 
clear the dirty log of discarded parts. It's a bit more complicated but 
achieves the same goal as a). [optimization I propose for the future]

c) Sync everything, don't fixup the dirty bitmap, clear the dirty log of 
discarded parts initially. There are ways we still might migrate 
discarded ranges, for example, if a misbehaving guest touches memory it 
shouldn't. [what you propose]


Is my understanding correct? Any reasons why we should chose c) over b) 
long term or c) over a) short term?

Thanks!

-- 
Thanks,

David / dhildenb



