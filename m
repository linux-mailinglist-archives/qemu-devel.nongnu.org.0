Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3724720F8DB
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 17:52:07 +0200 (CEST)
Received: from localhost ([::1]:39416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqIYI-0001gQ-6G
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 11:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jqISi-0004lb-M0
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 11:46:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58689
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jqISh-0004rh-4T
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 11:46:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593531977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I4Wv+B+Vc/OOvM4yu8yHm9Wb4ZuTvcUdjZB3f+CHXrg=;
 b=ZclswD6LLlYkGg4VntefRndy+6wavKWo8ecufISamZe0zuavfdQzBeDwki0iZR9piMFMZJ
 rJCyIgqtA/0NTtZHBVH7LOjyB8FQTNnPoA6ZOant4PTCzQ39o8GMPcCRTyUQMwzAzeks6Y
 670gDBI1974By2SA7A2MaFUpVjBF1y8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-_JBPCrd8OZKGlhuYEpkAlQ-1; Tue, 30 Jun 2020 11:46:13 -0400
X-MC-Unique: _JBPCrd8OZKGlhuYEpkAlQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1B21107ACF2;
 Tue, 30 Jun 2020 15:46:11 +0000 (UTC)
Received: from [10.36.115.77] (ovpn-115-77.ams2.redhat.com [10.36.115.77])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D69A971675;
 Tue, 30 Jun 2020 15:46:02 +0000 (UTC)
Subject: Re: [PATCH RESEND 6/9] hw/arm/smmu-common: Manage IOTLB block entries
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200611161500.23580-1-eric.auger@redhat.com>
 <20200611161500.23580-7-eric.auger@redhat.com>
 <CAFEAcA9FZV=jSk_9aJ_tHy=KLy+YrTFNoiqvCv7BMs0dWrHWFA@mail.gmail.com>
 <db6d92ba-2716-40df-54d3-84fb51ab3ad3@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <804af7f5-2b5d-efb2-2520-3368ea184246@redhat.com>
Date: Tue, 30 Jun 2020 17:46:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <db6d92ba-2716-40df-54d3-84fb51ab3ad3@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 03:55:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Will Deacon <will@kernel.org>,
 zhangfei.gao@foxmail.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 6/26/20 3:53 PM, Auger Eric wrote:
> Hi Peter,
> 
> On 6/25/20 5:30 PM, Peter Maydell wrote:
>> On Thu, 11 Jun 2020 at 17:16, Eric Auger <eric.auger@redhat.com> wrote:
>>>
>>> At the moment each entry in the IOTLB corresponds to a page sized
>>> mapping (4K, 16K or 64K), even if the page belongs to a mapped
>>> block. In case of block mapping this unefficiently consume IOTLB
>>> entries.
>>>
>>> Change the value of the entry so that it reflects the actual
>>> mapping it belongs to (block or page start address and size).
>>>
>>> Also the level/tg of the entry is encoded in the key. In subsequent
>>> patches we will enable range invalidation. This latter is able
>>> to provide the level/tg of the entry.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>>
>>> -uint64_t smmu_get_iotlb_key(uint16_t asid, uint64_t iova)
>>> +uint64_t smmu_get_iotlb_key(uint16_t asid, uint64_t iova,
>>> +                            uint8_t tg, uint8_t level)
>>>  {
>>> -    return iova >> 12 | (uint64_t)(asid) << SMMU_IOTLB_ASID_SHIFT;
>>> +    return iova >> 12 | (uint64_t)(asid) << SMMU_IOTLB_ASID_SHIFT |
>>> +           (uint64_t)(level) << SMMU_IOTLB_LEVEL_SHIFT |
>>> +           (uint64_t)(tg) << SMMU_IOTLB_TG_SHIFT;
>>>  }
>>
>>>  SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
>>> -                                 hwaddr iova)
>>> +                                SMMUTransTableInfo *tt, hwaddr iova)
>>>  {
>>> -    uint64_t key = smmu_get_iotlb_key(cfg->asid, iova);
>>> -    SMMUTLBEntry *entry = g_hash_table_lookup(bs->iotlb, &key);
>>> +    uint8_t tg = (tt->granule_sz - 10) / 2;
>>> +    int level = tt->starting_level;
>>> +    SMMUTLBEntry *entry = NULL;
>>> +
>>> +    while (level <= 3) {
>>> +        uint64_t subpage_size = 1ULL << level_shift(level, tt->granule_sz);
>>> +        uint64_t mask = subpage_size - 1;
>>> +        uint64_t key;
>>> +
>>> +        key = smmu_get_iotlb_key(cfg->asid, iova & ~mask, tg, level);
>>> +        entry = g_hash_table_lookup(bs->iotlb, &key);
>>> +        if (entry) {
>>> +            break;
>>> +        }
>>> +        level++;
>>
>> Rather than looping around doing multiple hash table lookups like
>> this, why not just avoid including the tg and level in the
>> key equality test?
>>
>> If I understand the range-based-invalidation feature correctly,
>> the only time we care about the TG/LVL is if we're processing
>> an invalidate-range command that specifies them. But in that
>> case there should never be multiple entries in the bs->iotlb
>> with the same iova, so we can just check whether the entry
>> matches the requested TG/LVL once we've pulled it out of the
>> hash table. (Or we could architecturally validly just blow
>> it away regardless of requested TG/LVL -- they are only hints,
>> not required-to-match.)
> 
> This change could have been done independently on the RIL feature. As we
> now put block entries in the IOTLB , when we look for an iova
> translation, the IOVA can be mapped using different block sizes or using
> page entries. So we start looking at blocks of the bigger size (entry
> level) downto the page, for instance 4TB/512MB/64KB. We cannot know
> which block and size the address belongs to. I do not know if we can
> make any hypothesis on whether the driver is forbidden to invalidate an
> address that is not the starting address of an initial mapping.
> 
> Not a justification but an info, this is implemented the same way on x86
> (except they don't have variable TG), see vtd_lookup_iotlb in
> hw/i386/intel_iommu.c

Does that make more sense overall? I will respin shortly.

Thanks

Eric
> 
> Thanks
> 
> Eric
>>
>> thanks
>> -- PMM
>>
> 
> 


