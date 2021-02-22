Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAED321ECD
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 19:07:20 +0100 (CET)
Received: from localhost ([::1]:44658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEFc7-00034D-T3
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 13:07:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lEFK4-0001Ws-QM
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:48:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lEFK1-00022W-Qr
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:48:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614016116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nP1PZoxlNW+qMpGXzOj0SGa8MkHEpQBJTCSxH09F34g=;
 b=QbMihySCf5hJeO/bOS7M2I1NnJIgHFygX28JGYk4j9BaWbp0LjcytVvo/ic6xwMrEu/bLs
 uqwFa+4KxsclE0ovthIBCYzI5lv19mDCd8hfwLkz++ePSs7z1/WbBLVBAJeqZkb2ZPQpTr
 avktSYE8dXuFT9OiFsW/xhrAFzwLGWI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-lor-cN4AP-q8vwG5HZhPYw-1; Mon, 22 Feb 2021 12:48:30 -0500
X-MC-Unique: lor-cN4AP-q8vwG5HZhPYw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BC6C107ACC7;
 Mon, 22 Feb 2021 17:48:29 +0000 (UTC)
Received: from [10.36.115.16] (ovpn-115-16.ams2.redhat.com [10.36.115.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1AF045C255;
 Mon, 22 Feb 2021 17:48:06 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210222115708.7623-1-david@redhat.com>
 <20210222115708.7623-2-david@redhat.com>
 <7137d1ad-2741-7536-5a3c-58d0c4f8306b@redhat.com>
 <0277759d-bb9a-6bf3-0ca4-53d3f7ec98f5@redhat.com>
 <a6f7de7a-72c3-a6c6-0a14-3e21a0cc833b@redhat.com>
 <24562156-457f-90b5-dcaf-c55fba1e881b@redhat.com>
 <adedbbe8-cf77-7ede-1291-a1d6f6082451@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v6 01/12] memory: Introduce RamDiscardMgr for RAM memory
 regions
Message-ID: <f7609b57-f239-bb07-90ec-1a13475cfc6f@redhat.com>
Date: Mon, 22 Feb 2021 18:48:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <adedbbe8-cf77-7ede-1291-a1d6f6082451@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

On 22.02.21 18:37, Paolo Bonzini wrote:
> On 22/02/21 15:53, David Hildenbrand wrote:
>>> Yes, but does it behave more like the IOMMU notifier in other regards?
>>> :)  The IOMMU notifier is concerned with an iova concept that doesn't
>>> exist at the MemoryRegion level, while RamDiscardListener works at the
>>> (MemoryRegion, offset) level that can easily be represented by a
>>> MemoryRegionSection.  Using MemoryRegionSection might even simplify the
>>> listener code.
>>
>> It's similarly concerned with rather small, lightweight updates I would
>> say.
> 
> Why does that matter?  I think if it's concerned with the MemoryRegion
> address space it should use MemoryListener and MemoryRegionSection.
> 
>>>> The main motivation is to let listener decide how it wants to handle the
>>>> memory region. For example, for vhost, vdpa, kvm, ... I only want a
>>>> single region, not separate ones for each and every populated range,
>>>> punching out discarded ranges. Note that there are cases (i.e.,
>>>> anonymous memory), where it's even valid for the guest to read discarded
>>>> memory.
>>>
>>> Yes, I agree with that.  You would still have the same
>>> region-add/region_nop/region_del callbacks for KVM and friends; on top
>>> of that you would have region_populate/region_discard callbacks for VFIO.
>>
>> I think instead of region_populate/region_discard we would want
>> individual region_add/region_del when populating/discarding for all
>> MemoryListeners that opt-in somehow (e.g., VFIO, dump-guest-memory,
>> ...). Similarly, we would want to call log_sync()/log_clear() then only
>> for these parts.
>>
>> But what happens when I populate/discard some memory? I don't want to
>> trigger an address space transaction (begin()...region_nop()...commit())
>> - whenever I populate/discard memory (e.g., in 2 MB granularity).
>> Especially not, if nothing might have changed for most other
>> MemoryListeners.
> 
> Right, that was the reason why I was suggesting different callbacks.
> For the VFIO listener, which doesn't have begin or commit callbacks, I
> think you could just rename region_add to region_populate, and point
> both region_del and region_discard to the existing region_del commit.
> 
> Calling log_sync/log_clear only for populated parts also makes sense.
> log_sync and log_clear do not have to be within begin/commit, so you can
> change the semantics to call them more than once.

I'll prototype to see how it looks/feels. As long as it's moving logic 
out of the VFIO code into the address space update code it could be 
quite alright.

-- 
Thanks,

David / dhildenb


