Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6615731ED27
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 18:20:03 +0100 (CET)
Received: from localhost ([::1]:54056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCmyA-0005Bx-0V
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 12:20:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lCmwn-0004cs-67
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 12:18:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lCmwk-0005tb-AP
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 12:18:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613668711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/urTllQP7ZzBq8vC8BIrabxflxf2X9DUfFCov0Q3AkE=;
 b=di5TvwzoPodiz0ysrVQ1qJqJy/mABLpm9Lt59Vw3W9untvm14AShqlMZ4fORgvTv/2vm9C
 nqSCy1057T1wOv3RlIibKUcpgAF3Zz4gbxBAFP2rbTHQZgShq3iUV+SjjQrmL25cdtPmWh
 wnquO1RXitO9H5HRfDCx0GTsDYiHhZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-k5MlK_LSOrqiEs9TzSvdUA-1; Thu, 18 Feb 2021 12:18:30 -0500
X-MC-Unique: k5MlK_LSOrqiEs9TzSvdUA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA7D7107ACF4;
 Thu, 18 Feb 2021 17:18:28 +0000 (UTC)
Received: from [10.36.114.34] (ovpn-114-34.ams2.redhat.com [10.36.114.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EB0C60877;
 Thu, 18 Feb 2021 17:18:23 +0000 (UTC)
Subject: Re: [PATCH] virtio-iommu: Handle non power of 2 range invalidations
To: Peter Xu <peterx@redhat.com>
References: <20210218141650.424967-1-eric.auger@redhat.com>
 <20210218164203.GA108961@xz-x1>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <b2781e6b-d3db-8d89-4ae2-f81f12251793@redhat.com>
Date: Thu, 18 Feb 2021 18:18:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210218164203.GA108961@xz-x1>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
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
Cc: peter.maydell@linaro.org, jean-philippe@linaro.org, jasowang@redhat.com,
 qemu-devel@nongnu.org, vivek.gautam@arm.com, qemu-arm@nongnu.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 2/18/21 5:42 PM, Peter Xu wrote:
> Eric,
> 
> On Thu, Feb 18, 2021 at 03:16:50PM +0100, Eric Auger wrote:
>> @@ -164,12 +166,27 @@ static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr virt_start,
>>  
>>      event.type = IOMMU_NOTIFIER_UNMAP;
>>      event.entry.target_as = &address_space_memory;
>> -    event.entry.addr_mask = virt_end - virt_start;
>> -    event.entry.iova = virt_start;
>>      event.entry.perm = IOMMU_NONE;
>>      event.entry.translated_addr = 0;
>> +    event.entry.addr_mask = mask;
>> +    event.entry.iova = virt_start;
>>  
>> -    memory_region_notify_iommu(mr, 0, event);
>> +    if (mask == UINT64_MAX) {
>> +        memory_region_notify_iommu(mr, 0, event);
>> +    }
>> +
>> +    size = mask + 1;
>> +
>> +    while (size) {
>> +        uint8_t highest_bit = 64 - clz64(size) - 1;
> 
> I'm not sure fetching highest bit would work right. E.g., with start=0x11000
> and size=0x11000 (then we need to unmap 0x11000-0x22000), current code will
> first try to invalidate range (0x11000, 0x10000), that seems still invalid
> since 0x11000 is not aligned to 0x10000 page mask.

Hum I thought aligning the size was sufficient. Where is it checked exactly?
> 
> I think the same trick in vtd_address_space_unmap() would work.  If you agree,
> maybe we can generalize that get_naturally_aligned_size() out, but maybe with a
> better name as a helper?

Yep I need to read the code again ;-)

Thank you!

Eric
> 
> Thanks,
> 


