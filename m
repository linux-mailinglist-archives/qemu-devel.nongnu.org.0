Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C674378A1A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 13:55:36 +0200 (CEST)
Received: from localhost ([::1]:46002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg4Vb-0004cl-6O
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 07:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lg4Kt-00015d-0F
 for qemu-devel@nongnu.org; Mon, 10 May 2021 07:44:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lg4Kq-0003rS-Lr
 for qemu-devel@nongnu.org; Mon, 10 May 2021 07:44:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620647067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZjHnk0blXC0Eam0s3/3BI32O6iETaktG2uEWO2fyOdg=;
 b=GZ9rOJZbNc4dX5scXuhHsAYRjHyQa3mWDdwabdNo039tLSZCg42f+73t3ZFGZat56lv0m8
 QxIuutiHMXUE04YnjMMslGBtj51zIUPGqX5aVp+iNY+RnCt+Jr2TIpe4ECHpsARwtuMprR
 +AV+d7LqIqGVqvYnsq6WEjCEzmDJk2o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-FyHTScgYPBaY0NzQBwITjQ-1; Mon, 10 May 2021 07:44:25 -0400
X-MC-Unique: FyHTScgYPBaY0NzQBwITjQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADB8E8018A1;
 Mon, 10 May 2021 11:44:24 +0000 (UTC)
Received: from [10.36.113.168] (ovpn-113-168.ams2.redhat.com [10.36.113.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2BF32B1A8;
 Mon, 10 May 2021 11:44:14 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/smmuv3: Another range invalidation fix
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210421172910.11832-1-eric.auger@redhat.com>
 <CAFEAcA_R4UY1vr3ZKEf_egF7e5GmFDWuDV_SGenUkLOygh0hGQ@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ef68e074-93bd-607a-147f-1e5a561428f1@redhat.com>
Date: Mon, 10 May 2021 13:44:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_R4UY1vr3ZKEf_egF7e5GmFDWuDV_SGenUkLOygh0hGQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Kunkun Jiang <jiangkunkun@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 5/10/21 1:31 PM, Peter Maydell wrote:
> On Wed, 21 Apr 2021 at 18:29, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> 6d9cd115b9 ("hw/arm/smmuv3: Enforce invalidation on a power of two range")
>> failed to completely fix misalignment issues with range
>> invalidation. For instance invalidations patterns like "invalidate 32
>> 4kB pages starting from 0xff395000 are not correctly handled" due
>> to the fact the previous fix only made sure the number of invalidated
>> pages were a power of 2 but did not properly handle the start
>> address was not aligned with the range. This can be noticed when
>> boothing a fedora 33 with protected virtio-blk-pci.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Fixes: 6d9cd115b9 ("hw/arm/smmuv3: Enforce invalidation on a power of two range")
>>
>> ---
>>
>> This bug was found with SMMU RIL avocado-qemu acceptance tests
>> ---
>>  hw/arm/smmuv3.c | 49 +++++++++++++++++++++++++------------------------
>>  1 file changed, 25 insertions(+), 24 deletions(-)
>>
>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>> index 8705612535..16f285a566 100644
>> --- a/hw/arm/smmuv3.c
>> +++ b/hw/arm/smmuv3.c
>> @@ -856,43 +856,44 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
>>
>>  static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
>>  {
>> -    uint8_t scale = 0, num = 0, ttl = 0;
>> -    dma_addr_t addr = CMD_ADDR(cmd);
>> +    dma_addr_t end, addr = CMD_ADDR(cmd);
>>      uint8_t type = CMD_TYPE(cmd);
>>      uint16_t vmid = CMD_VMID(cmd);
>> +    uint8_t scale = CMD_SCALE(cmd);
>> +    uint8_t num = CMD_NUM(cmd);
>> +    uint8_t ttl = CMD_TTL(cmd);
>>      bool leaf = CMD_LEAF(cmd);
>>      uint8_t tg = CMD_TG(cmd);
>> -    uint64_t first_page = 0, last_page;
>> -    uint64_t num_pages = 1;
>> +    uint64_t num_pages;
>> +    uint8_t granule;
>>      int asid = -1;
>>
>> -    if (tg) {
>> -        scale = CMD_SCALE(cmd);
>> -        num = CMD_NUM(cmd);
>> -        ttl = CMD_TTL(cmd);
>> -        num_pages = (num + 1) * BIT_ULL(scale);
>> -    }
>> -
>>      if (type == SMMU_CMD_TLBI_NH_VA) {
>>          asid = CMD_ASID(cmd);
>>      }
>>
>> +    if (!tg) {
>> +        trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
>> +        smmuv3_inv_notifiers_iova(s, asid, addr, tg, 1);
>> +        smmu_iotlb_inv_iova(s, asid, addr, tg, 1, ttl);
>> +    }
> 
> Is this intended to fall through ?
hum no it isn't. I will fix that.

Thanks

Eric
> 
>> +
>> +    /* RIL in use */
>> +
>> +    num_pages = (num + 1) * BIT_ULL(scale);
>> +    granule = tg * 2 + 10;
>> +
>>      /* Split invalidations into ^2 range invalidations */
>> -    last_page = num_pages - 1;
>> -    while (num_pages) {
>> -        uint8_t granule = tg * 2 + 10;
>> -        uint64_t mask, count;
>> +    end = addr + (num_pages << granule) - 1;
>>
>> -        mask = dma_aligned_pow2_mask(first_page, last_page, 64 - granule);
>> -        count = mask + 1;
>> +    while (addr != end + 1) {
>> +        uint64_t mask = dma_aligned_pow2_mask(addr, end, 64);
>>
>> -        trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, count, ttl, leaf);
>> -        smmuv3_inv_notifiers_iova(s, asid, addr, tg, count);
>> -        smmu_iotlb_inv_iova(s, asid, addr, tg, count, ttl);
>> -
>> -        num_pages -= count;
>> -        first_page += count;
>> -        addr += count * BIT_ULL(granule);
>> +        num_pages = (mask + 1) >> granule;
>> +        trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
>> +        smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
>> +        smmu_iotlb_inv_iova(s, asid, addr, tg, num_pages, ttl);
>> +        addr += mask + 1;
>>      }
>>  }
> 
> thanks
> -- PMM
> 


