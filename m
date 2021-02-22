Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E129F3219B8
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 15:05:58 +0100 (CET)
Received: from localhost ([::1]:42794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEBqX-000266-Uc
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 09:05:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lEBoq-0000bu-A2
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:04:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lEBoo-0004mo-E0
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:04:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614002649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E/JgckOFOmJTqfFdrQ/wR4KyPHje2l8p4nft054+ibg=;
 b=JqSyvbmA74QmyfqMAwdYJgS4HILkGOOQZ4z11tA2xpxT7Cj0eElx4PwIl5IRbkUS5/BKDp
 5PNw2UM+J4Hl5UQgpDLwZWebQ1P6msnjkaeAMTvDRUqcfLWHhViKEBaE3NFvcKpq2hD+/O
 M/PtujpP5v3wMdx8jEeu/LfwJdBDdSc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-jVuRBpBxOYKY3nr6Rfnhmw-1; Mon, 22 Feb 2021 09:04:07 -0500
X-MC-Unique: jVuRBpBxOYKY3nr6Rfnhmw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 120E380197A;
 Mon, 22 Feb 2021 14:04:06 +0000 (UTC)
Received: from [10.36.115.16] (ovpn-115-16.ams2.redhat.com [10.36.115.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D094A19C81;
 Mon, 22 Feb 2021 14:03:50 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210222115708.7623-1-david@redhat.com>
 <20210222115708.7623-2-david@redhat.com>
 <7137d1ad-2741-7536-5a3c-58d0c4f8306b@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v6 01/12] memory: Introduce RamDiscardMgr for RAM memory
 regions
Message-ID: <0277759d-bb9a-6bf3-0ca4-53d3f7ec98f5@redhat.com>
Date: Mon, 22 Feb 2021 15:03:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <7137d1ad-2741-7536-5a3c-58d0c4f8306b@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
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


>> +    /**
>> +     * @replay_populated:
>> +     *
>> +     * Notify the #RamDiscardListener about all populated parts within the
>> +     * #MemoryRegion via the #RamDiscardMgr.
>> +     *
>> +     * In case any notification fails, no further notifications are triggered.
>> +     * The listener is not required to be registered.
>> +     *
>> +     * @rdm: the #RamDiscardMgr
>> +     * @mr: the #MemoryRegion
>> +     * @rdl: the #RamDiscardListener
>> +     *
>> +     * Returns 0 on success, or a negative error if any notification failed.
>> +     */
>> +    int (*replay_populated)(const RamDiscardMgr *rdm, const MemoryRegion *mr,
>> +                            RamDiscardListener *rdl);
> 
> If this function is only going to use a single callback, just pass it
> (together with a void *opaque) as the argument.
>> +};
>> +
>>   typedef struct CoalescedMemoryRange CoalescedMemoryRange;
>>   typedef struct MemoryRegionIoeventfd MemoryRegionIoeventfd;
>>   
>> @@ -487,6 +683,7 @@ struct MemoryRegion {
>>       const char *name;
>>       unsigned ioeventfd_nb;
>>       MemoryRegionIoeventfd *ioeventfds;
>> +    RamDiscardMgr *rdm; /* Only for RAM */
>>   };
> 
> 
> The idea of sending discard notifications is obviously good.  I have a
> couple of questions on the design that you used for the interface; I'm
> not saying that it should be done differently, I would only like to
> understand the trade offs that you chose:

Sure!

> 
> 1) can the RamDiscardManager (no abbreviations :)) be just the owner of

I used to call it "SparseRamManager", but wanted to stress the semantics 
- and can use RamDiscardManager ;) . Suggestions welcome.

> the memory region (obj->parent)?  Alternatively, if you want to make it
> separate from the owner, does it make sense for it to be a separate
> reusable object, sitting between virtio-mem and the MemoryRegion, so
> that the implementation can be reused?

virtio-mem consumes a memory backend (e.g., memory-backend-ram). That 
one logically "ownes" the memory region (and thereby the RAMBlock).

The memory backend gets assigned to virtio-mem. At that point, 
virtio-mem "owns" the memory backend. It will set itself as the 
RamDiscardsManager before mapping the memory region into system address 
space (whereby it will get exposed to the system).

This flow made sense to me. Regarding "reusable object" - I think the 
only stuff we could fit in there would be e.g., maintaining the lists of 
notifiers. I'd rather wait until we actually have a second user to see 
what we can factor out.

If you have any suggestion/preference, please let me know.

> 
> 2) why have the new RamDiscardListener instead of just extending
> MemoryListener? Conveniently, vfio already has a MemoryListener that can

It behaves more like the IOMMU notifier in that regard.

> be extended, and you wouldn't need the list of RamDiscardListeners.
> There is already a precedent of replaying the current state when a
> listener is added (see listener_add_address_space), so this is not
> something different between ML and RDL.

The main motivation is to let listener decide how it wants to handle the 
memory region. For example, for vhost, vdpa, kvm, ... I only want a 
single region, not separate ones for each and every populated range, 
punching out discarded ranges. Note that there are cases (i.e., 
anonymous memory), where it's even valid for the guest to read discarded 
memory.

Special cases are only required in corner cases, namely whenever we 
unconditionally:

a) Read memory inside a memory region. (e.g., guest-memory-dump)
b) Write memory inside a memory region. (e.g., TPM, migration)
c) Populate memory inside a memory region. (e.g., vfio)

> 
> Also, if you add a new interface, you should have "method call" wrappers
> similar to user_creatable_complete or user_creatable_can_be_deleted.

I think I had those at some point but decided to drop them. Can readd them.


-- 
Thanks,

David / dhildenb


