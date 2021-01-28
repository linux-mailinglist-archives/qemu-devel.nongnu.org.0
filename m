Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 800C3308097
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 22:33:46 +0100 (CET)
Received: from localhost ([::1]:37990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5EvB-0004Wi-Av
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 16:33:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1l5Et0-0003kV-Di
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 16:31:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1l5Esw-0002jQ-Db
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 16:31:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611869483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bXce2jqyzXt5VCPVL5P4ZOOaG8p3M/O5OY6ApDO1CRE=;
 b=g0vZuwpdczGo2HPh9dzdj0SpLawv6HTFFNs9pSfqP0+EhO80emSuRHKZho8v7OYmc4u+qO
 LaXc10el+cUa1qTC/wXXLxjVj71D5naRLjQBg2YDNbV8gJv7224NmAiouKMShrzofmv6VQ
 pp9wBLE9WPc2NKXuNL+7HdsbksOQrxY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-sIznfFDjPfq_DBZgPFytpg-1; Thu, 28 Jan 2021 16:30:15 -0500
X-MC-Unique: sIznfFDjPfq_DBZgPFytpg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2BC48030A0;
 Thu, 28 Jan 2021 21:30:13 +0000 (UTC)
Received: from [10.36.114.62] (ovpn-114-62.ams2.redhat.com [10.36.114.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5093F1F469;
 Thu, 28 Jan 2021 21:30:12 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/smmuv3: Fix addr_mask for range-based invalidation
From: Auger Eric <eric.auger@redhat.com>
To: Zenghui Yu <yuzenghui@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20201225095015.609-1-yuzenghui@huawei.com>
 <4e114709-e5c2-1860-c760-c05aa3ed5388@redhat.com>
Message-ID: <45f3334d-f0b4-9a40-1bd1-78bd04735eaf@redhat.com>
Date: Thu, 28 Jan 2021 22:30:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <4e114709-e5c2-1860-c760-c05aa3ed5388@redhat.com>
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
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Zenghui,

On 1/28/21 9:25 AM, Auger Eric wrote:
> Hi Zenghui,
> 
> On 12/25/20 10:50 AM, Zenghui Yu wrote:
>> When performing range-based IOTLB invalidation, we should decode the TG
>> field into the corresponding translation granule size so that we can pass
>> the correct invalidation range to backend. Set @granule to (tg * 2 + 10) to
>> properly emulate the architecture.
>>
>> Fixes: d52915616c05 ("hw/arm/smmuv3: Get prepared for range invalidation")
>> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> 
> Good catch! I tested with older guest kernels though. I wonder how I did
> not face the bug?
Please ignore this wrong comment as this corresponds to recent kernels
instead. Still puzzled anyway ;-)

Eric
> 
> 
>> ---
>>  hw/arm/smmuv3.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>> index bbca0e9f20..65231c7d52 100644
>> --- a/hw/arm/smmuv3.c
>> +++ b/hw/arm/smmuv3.c
>> @@ -801,7 +801,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>>  {
>>      SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
>>      IOMMUTLBEvent event;
>> -    uint8_t granule = tg;
>> +    uint8_t granule;
>>  
>>      if (!tg) {
>>          SMMUEventInfo event = {.inval_ste_allowed = true};
>> @@ -821,6 +821,8 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>>              return;
>>          }
>>          granule = tt->granule_sz;
>> +    } else {
>> +        guanule = tg * 2 + 10;
> maybe just init granule to this value above while fixing the typo.
> 
> Thanks
> 
> Eric
>>      }
>>  
>>      event.type = IOMMU_NOTIFIER_UNMAP;
>>


