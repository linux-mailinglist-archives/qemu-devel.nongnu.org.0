Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F87322908
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 11:52:10 +0100 (CET)
Received: from localhost ([::1]:42464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEVIX-0004B4-BL
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 05:52:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lEVHB-0003ie-0Z
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 05:50:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lEVH7-00055B-Jo
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 05:50:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614077440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ASdY3KCOVxzqeRHWsLmgXivP5flg5UUrBWr4qShR2Dw=;
 b=IGoYqB0k+Ft3WZl790T2EcMYrkFN8h+8gyW6JSMp4d6FH5Gk2o6AbLwwOce/G1rGLP+GlH
 r3KrRuipJLEC6P7rljmHisYlcaIgUbSEzBRfWp8aogNGnaGGcB6SJpPZW6KFHOSDxD5TtA
 xPYIwp2X9Cu9ODDWML7S3MxpRmii6b0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-B3WPqqWvN_2vcOuV0OuZAA-1; Tue, 23 Feb 2021 05:50:38 -0500
X-MC-Unique: B3WPqqWvN_2vcOuV0OuZAA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2501801975;
 Tue, 23 Feb 2021 10:50:36 +0000 (UTC)
Received: from [10.36.114.0] (ovpn-114-0.ams2.redhat.com [10.36.114.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57AA160DA0;
 Tue, 23 Feb 2021 10:50:11 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210222115708.7623-1-david@redhat.com>
 <20210222115708.7623-2-david@redhat.com>
 <7137d1ad-2741-7536-5a3c-58d0c4f8306b@redhat.com>
 <0277759d-bb9a-6bf3-0ca4-53d3f7ec98f5@redhat.com>
 <a6f7de7a-72c3-a6c6-0a14-3e21a0cc833b@redhat.com>
 <24562156-457f-90b5-dcaf-c55fba1e881b@redhat.com>
 <adedbbe8-cf77-7ede-1291-a1d6f6082451@redhat.com>
 <82e6faad-7d45-0f37-eda5-aef42e353972@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v6 01/12] memory: Introduce RamDiscardMgr for RAM memory
 regions
Message-ID: <1409acfe-86eb-a4db-b35a-b45f5c046a2e@redhat.com>
Date: Tue, 23 Feb 2021 11:50:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <82e6faad-7d45-0f37-eda5-aef42e353972@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.02.21 20:43, David Hildenbrand wrote:
>>>>> The main motivation is to let listener decide how it wants to handle the
>>>>> memory region. For example, for vhost, vdpa, kvm, ... I only want a
>>>>> single region, not separate ones for each and every populated range,
>>>>> punching out discarded ranges. Note that there are cases (i.e.,
>>>>> anonymous memory), where it's even valid for the guest to read discarded
>>>>> memory.
>>>>
>>>> Yes, I agree with that.  You would still have the same
>>>> region-add/region_nop/region_del callbacks for KVM and friends; on top
>>>> of that you would have region_populate/region_discard callbacks for VFIO.
>>>
>>> I think instead of region_populate/region_discard we would want
>>> individual region_add/region_del when populating/discarding for all
>>> MemoryListeners that opt-in somehow (e.g., VFIO, dump-guest-memory,
>>> ...). Similarly, we would want to call log_sync()/log_clear() then only
>>> for these parts.
>>>
>>> But what happens when I populate/discard some memory? I don't want to
>>> trigger an address space transaction (begin()...region_nop()...commit())
>>> - whenever I populate/discard memory (e.g., in 2 MB granularity).
>>> Especially not, if nothing might have changed for most other
>>> MemoryListeners.
>>
>> Right, that was the reason why I was suggesting different callbacks.
>> For the VFIO listener, which doesn't have begin or commit callbacks, I
>> think you could just rename region_add to region_populate, and point
>> both region_del and region_discard to the existing region_del commit.
>>
>> Calling log_sync/log_clear only for populated parts also makes sense.
>> log_sync and log_clear do not have to be within begin/commit, so you can
>> change the semantics to call them more than once.
> 
> So I looked at the simplest of all cases (discard) and I am not convinced yet
> that this is the right approach. I can understand why it looks like this fits
> into the MemoryListener, but I am not sure if gives us any real benefits or
> makes the code any clearer (I'd even say it's the contrary).
> 
> 
> +void memory_region_notify_discard(MemoryRegion *mr, hwaddr offset,
> +                                  hwaddr size)
> +{
> +    hwaddr mr_start, mr_end;
> +    MemoryRegionSection mrs;
> +    MemoryListener *listener;
> +    AddressSpace *as;
> +    FlatView *view;
> +    FlatRange *fr;
> +
> +    QTAILQ_FOREACH(listener, &memory_listeners, link) {
> +        if (!listener->region_discard) {
> +            continue;
> +        }
> +        as = listener->address_space;
> +        view = address_space_get_flatview(as);
> +        FOR_EACH_FLAT_RANGE(fr, view) {
> +            if (fr->mr != mr) {
> +                continue;
> +            }
> +
> +            mrs = section_from_flat_range(fr, view);
> +
> +            mr_start = MAX(mrs.offset_within_region, offset);
> +            mr_end = MIN(offset + size,
> +                          mrs.offset_within_region + int128_get64(mrs.size));
> +            mr_end = MIN(mr_end, offset + size);
> +
> +            if (mr_start >= mr_end) {
> +                continue;
> +            }
> +
> +            mrs.offset_within_address_space += mr_start -
> +                                               mrs.offset_within_region;
> +            mrs.offset_within_region = mr_start;
> +            mrs.size = int128_make64(mr_end - mr_start);
> +            listener->region_discard(listener, &mrs);
> +        }
> +        flatview_unref(view);
> +    }
> +}
> 
> Maybe I am missing something important. This looks highly inefficient.
> 
> 1. Although we know the memory region we have to walk over the whole address
>      space ... over and over again for each potential listener.
> 
> 2. Even without any applicable listeners (=> ! VFIO) we loop over all listeners.
>      There are ways around that but it doesn't make the code nicer IMHO.
> 
> 3. In the future I am planning on sending populate/discard events
>      without the BQL (in my approach, synchronizing internally against
>      register/unregister/populate/discard ...). I don't see an easy way
>      to achieve that here. I think we are required to hold the BQL on any
>      updates.
> 
> memory_region_notify_populate() gets quite ugly when we realize halfway that
> we have to revert what we already did by notifying about already populated
> pieces ...
> 

So, the more I look into it the more I doubt this should go into the 
MemoryListener.

The RamDiscardManager is specific to RAM memory regions - similarly the 
IOMMU notifier is specific to IOMMU regions.

In the near future we will have two "clients" (vfio, 
tpm/dump-guest-memory), whereby only vfio will actually has to register 
for updates at runtime.

I really want to have a dedicated registration/notifier mechanism, for 
reasons already mentioned in my last mail, but also to later reuse that 
mechanism in other context as noted in the cover letter:

"Note: At some point, we might want to let RAMBlock users (esp. vfio 
used for nvme://) consume this interface as well. We'll need RAMBlock 
notifier calls when a RAMBlock is getting mapped/unmapped (via the 
corresponding memory region), so we can properly register a listener 
there as well."


However, I do agree that the notifier should work with 
MemoryRegionSection - this will make the "client" code much easier.

The register()/replay_populate() mechanism should consume a 
MemoryRegionSection to work on, and call the listener via (adjusted) 
MemoryRegionSection.

Maybe I'm even able to simplify/get rid of the discard_all() callback.

-- 
Thanks,

David / dhildenb


