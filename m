Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C5D31EDFE
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 19:09:31 +0100 (CET)
Received: from localhost ([::1]:44706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCnk2-0001KE-5c
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 13:09:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lCnhT-0007xx-Ry
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 13:06:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lCnhR-0000xx-9C
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 13:06:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613671608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nSld4aixnoTgg0EmtGuTilM3MduU4YljZOgjJX5i678=;
 b=ENDbfzq6I9qNiZ8b6ifHOPUAynJJfv6KTqnQCvFAnI8eGnJOAQw9EelCO7z5zsllx/ttpY
 vEPjx961ukWQxaT7NOeBDeXPiwDemmnPsDu2k32U1g6fTzF71f6XrRHLXHqw//cA8aYW03
 mfTyfJ/a8WKYVZDGm/BQyZVgcYgcUXo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-x9sw-l62MyGad8t8U0sycw-1; Thu, 18 Feb 2021 13:06:46 -0500
X-MC-Unique: x9sw-l62MyGad8t8U0sycw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BC7D192CC43;
 Thu, 18 Feb 2021 18:06:44 +0000 (UTC)
Received: from [10.36.114.34] (ovpn-114-34.ams2.redhat.com [10.36.114.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72A7719C47;
 Thu, 18 Feb 2021 18:06:39 +0000 (UTC)
Subject: Re: [PATCH] virtio-iommu: Handle non power of 2 range invalidations
To: Peter Xu <peterx@redhat.com>
References: <20210218141650.424967-1-eric.auger@redhat.com>
 <20210218164203.GA108961@xz-x1>
 <b2781e6b-d3db-8d89-4ae2-f81f12251793@redhat.com>
 <20210218174804.GB108961@xz-x1>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <1b0441dd-e0bf-52bc-ea43-4597a4cfc32b@redhat.com>
Date: Thu, 18 Feb 2021 19:06:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210218174804.GB108961@xz-x1>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, jean-philippe@linaro.org, jasowang@redhat.com,
 qemu-devel@nongnu.org, vivek.gautam@arm.com, qemu-arm@nongnu.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 2/18/21 6:48 PM, Peter Xu wrote:
> On Thu, Feb 18, 2021 at 06:18:22PM +0100, Auger Eric wrote:
>> Hi Peter,
>>
>> On 2/18/21 5:42 PM, Peter Xu wrote:
>>> Eric,
>>>
>>> On Thu, Feb 18, 2021 at 03:16:50PM +0100, Eric Auger wrote:
>>>> @@ -164,12 +166,27 @@ static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr virt_start,
>>>>  
>>>>      event.type = IOMMU_NOTIFIER_UNMAP;
>>>>      event.entry.target_as = &address_space_memory;
>>>> -    event.entry.addr_mask = virt_end - virt_start;
>>>> -    event.entry.iova = virt_start;
>>>>      event.entry.perm = IOMMU_NONE;
>>>>      event.entry.translated_addr = 0;
>>>> +    event.entry.addr_mask = mask;
>>>> +    event.entry.iova = virt_start;
>>>>  
>>>> -    memory_region_notify_iommu(mr, 0, event);
>>>> +    if (mask == UINT64_MAX) {
>>>> +        memory_region_notify_iommu(mr, 0, event);
>>>> +    }
>>>> +
>>>> +    size = mask + 1;
>>>> +
>>>> +    while (size) {
>>>> +        uint8_t highest_bit = 64 - clz64(size) - 1;
>>>
>>> I'm not sure fetching highest bit would work right. E.g., with start=0x11000
>>> and size=0x11000 (then we need to unmap 0x11000-0x22000), current code will
>>> first try to invalidate range (0x11000, 0x10000), that seems still invalid
>>> since 0x11000 is not aligned to 0x10000 page mask.
>>
>> Hum I thought aligning the size was sufficient. Where is it checked exactly?
> 
> I don't remember all the context either.. :)
> 
> Firstly - It makes sense to do that since hardware does it, and emulation code
> would make sense to follow that.>
> There's some more info where I looked into the src of when vt-d got introduced
> with the similar change:
> 
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg625340.html
> 
> I'm not 100% certain anything will break if we don't use page mask but
> arbitrary length as vhost did in iotlb msg.  However what Yan Zhao reported is
> definitely worse than that since we (vt-d) used to unmap outside the range of
> the range just for page mask alignment.

OK. I read again the get_naturally_aligned_size() code and indeed it
matches the need while taking into account the largest page size bigger
than the start @ alignment. This is a common pattern anyway. I am not
sure either this would break with vhost and vfio notifications but
better to use that function too in virtio-iommu and smmu (I sent a
similar patch for smmu).

Thank you for reminding me of that piece of code!

Eric
> 
> Thanks,
> 


