Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8057F321A4D
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 15:28:45 +0100 (CET)
Received: from localhost ([::1]:60708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lECCa-0005pq-Ka
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 09:28:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEC2T-0005oo-6d
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:18:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEC2Q-0002Ff-K7
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:18:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614003492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iDGFCxjg7HsvHpH3LPTKWHzyz+SbGiW2Syjf+3bEImY=;
 b=QsUaIbHnL30wU9YaZCy2AREU2gNUQk/2su9hEV/8BIMsqBhD0xpglxsbIzdw3SODaZYK+5
 W82VNAsWWbCjjAQWHxnIk/gQ629GY7/FXGLwVeyu5QlmG6KcJoR9AKZSh9YQVvB+N9H+FA
 fJtWjIXsy/4cJyDxCBNik9HEnTTBtds=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-Dky8ZN46Nr-fVyvOhzDQGA-1; Mon, 22 Feb 2021 09:18:09 -0500
X-MC-Unique: Dky8ZN46Nr-fVyvOhzDQGA-1
Received: by mail-ed1-f69.google.com with SMTP id h1so6358012edq.1
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 06:18:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iDGFCxjg7HsvHpH3LPTKWHzyz+SbGiW2Syjf+3bEImY=;
 b=lf7AsoWYZjbzrXbiVIU8rVltO7XWd+912KtVHC9q9xp99aI9co8ktvCrvekiSbL3ua
 ur4fMHRSktnHvCaYDX/5QMmDW4n9j1+kQuDyYOyrMyBYrbmZBRR2kgTLd4jIAj2ySkCd
 tOzpFnnWGWByUPS/1xhhT4PNNE4exBUPdKEeobeqnSd7/3FSwPG1w6EhUlJzZIAQnEKa
 UPKQejhbj4fFcuwW4j7T2Qs9KZG31uDzZB/jvA7GEfIro6z9he2smGIW7bQQMjN7VWoO
 +jDLOHqshHhifx55vb4sogXpqU4IMyrkTSKsGqRP+ljrKUHuLk5tNmU2SENatWIyWNlo
 EIQA==
X-Gm-Message-State: AOAM5327ABEfTdrmOEvAhBIOUIdqCjRbgm2hCDrCAJIlPFgTyqjEqFkI
 8uC4co8vSFHm/tTM1X3NrkVgWzlsxJQX7zFSUj1hNcQHVPvU/vxJBz48+Dqn3HTRc/JdLVZZzPe
 X4wnAHV+8mnaoH1c=
X-Received: by 2002:a50:c00b:: with SMTP id r11mr23130874edb.35.1614003487500; 
 Mon, 22 Feb 2021 06:18:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVdgSQejg1Oyzy9Uao1kCWFW+wTAIt0d+ovjWSfXtYIh6GffUQOhgP0Gw7D2yE6YSlpGX0xA==
X-Received: by 2002:a50:c00b:: with SMTP id r11mr23130850edb.35.1614003487348; 
 Mon, 22 Feb 2021 06:18:07 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o1sm3155256eds.26.2021.02.22.06.18.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 06:18:06 -0800 (PST)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210222115708.7623-1-david@redhat.com>
 <20210222115708.7623-2-david@redhat.com>
 <7137d1ad-2741-7536-5a3c-58d0c4f8306b@redhat.com>
 <0277759d-bb9a-6bf3-0ca4-53d3f7ec98f5@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 01/12] memory: Introduce RamDiscardMgr for RAM memory
 regions
Message-ID: <a6f7de7a-72c3-a6c6-0a14-3e21a0cc833b@redhat.com>
Date: Mon, 22 Feb 2021 15:18:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <0277759d-bb9a-6bf3-0ca4-53d3f7ec98f5@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

On 22/02/21 15:03, David Hildenbrand wrote:
> 
>>> +    /**
>>> +     * @replay_populated:
>>> +     *
>>> +     * Notify the #RamDiscardListener about all populated parts 
>>> within the
>>> +     * #MemoryRegion via the #RamDiscardMgr.
>>> +     *
>>> +     * In case any notification fails, no further notifications are 
>>> triggered.
>>> +     * The listener is not required to be registered.
>>> +     *
>>> +     * @rdm: the #RamDiscardMgr
>>> +     * @mr: the #MemoryRegion
>>> +     * @rdl: the #RamDiscardListener
>>> +     *
>>> +     * Returns 0 on success, or a negative error if any notification 
>>> failed.
>>> +     */
>>> +    int (*replay_populated)(const RamDiscardMgr *rdm, const 
>>> MemoryRegion *mr,
>>> +                            RamDiscardListener *rdl);
>>
>> If this function is only going to use a single callback, just pass it
>> (together with a void *opaque) as the argument.
>>> +};
>>> +
>>>   typedef struct CoalescedMemoryRange CoalescedMemoryRange;
>>>   typedef struct MemoryRegionIoeventfd MemoryRegionIoeventfd;
>>> @@ -487,6 +683,7 @@ struct MemoryRegion {
>>>       const char *name;
>>>       unsigned ioeventfd_nb;
>>>       MemoryRegionIoeventfd *ioeventfds;
>>> +    RamDiscardMgr *rdm; /* Only for RAM */
>>>   };
>>
>>
>> The idea of sending discard notifications is obviously good.  I have a
>> couple of questions on the design that you used for the interface; I'm
>> not saying that it should be done differently, I would only like to
>> understand the trade offs that you chose:
> 
> Sure!
> 
>>
>> 1) can the RamDiscardManager (no abbreviations :)) be just the owner of
> 
> I used to call it "SparseRamManager", but wanted to stress the semantics 
> - and can use RamDiscardManager ;) . Suggestions welcome.
> 
>> the memory region (obj->parent)?  Alternatively, if you want to make it
>> separate from the owner, does it make sense for it to be a separate
>> reusable object, sitting between virtio-mem and the MemoryRegion, so
>> that the implementation can be reused?
> 
> virtio-mem consumes a memory backend (e.g., memory-backend-ram). That 
> one logically "ownes" the memory region (and thereby the RAMBlock).
> 
> The memory backend gets assigned to virtio-mem. At that point, 
> virtio-mem "owns" the memory backend. It will set itself as the 
> RamDiscardsManager before mapping the memory region into system address 
> space (whereby it will get exposed to the system).
> 
> This flow made sense to me. Regarding "reusable object" - I think the 
> only stuff we could fit in there would be e.g., maintaining the lists of 
> notifiers. I'd rather wait until we actually have a second user to see 
> what we can factor out.
> 
> If you have any suggestion/preference, please let me know.
> 
>>
>> 2) why have the new RamDiscardListener instead of just extending
>> MemoryListener? Conveniently, vfio already has a MemoryListener that can
> 
> It behaves more like the IOMMU notifier in that regard.

Yes, but does it behave more like the IOMMU notifier in other regards? 
:)  The IOMMU notifier is concerned with an iova concept that doesn't 
exist at the MemoryRegion level, while RamDiscardListener works at the 
(MemoryRegion, offset) level that can easily be represented by a 
MemoryRegionSection.  Using MemoryRegionSection might even simplify the 
listener code.

>> be extended, and you wouldn't need the list of RamDiscardListeners.
>> There is already a precedent of replaying the current state when a
>> listener is added (see listener_add_address_space), so this is not
>> something different between ML and RDL.
> 
> The main motivation is to let listener decide how it wants to handle the 
> memory region. For example, for vhost, vdpa, kvm, ... I only want a 
> single region, not separate ones for each and every populated range, 
> punching out discarded ranges. Note that there are cases (i.e., 
> anonymous memory), where it's even valid for the guest to read discarded 
> memory.

Yes, I agree with that.  You would still have the same 
region-add/region_nop/region_del callbacks for KVM and friends; on top 
of that you would have region_populate/region_discard callbacks for VFIO.

Populated regions would be replayed after region_add, while I don't 
think it makes sense to have a region_discard_all callback before 
region_discard.

Paolo

> Special cases are only required in corner cases, namely whenever we 
> unconditionally:
> 
> a) Read memory inside a memory region. (e.g., guest-memory-dump)
> b) Write memory inside a memory region. (e.g., TPM, migration)
> c) Populate memory inside a memory region. (e.g., vfio)
> 
>>
>> Also, if you add a new interface, you should have "method call" wrappers
>> similar to user_creatable_complete or user_creatable_can_be_deleted.
> 
> I think I had those at some point but decided to drop them. Can readd them.
> 
> 


