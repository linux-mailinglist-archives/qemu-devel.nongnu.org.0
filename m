Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E83853320DE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 09:38:46 +0100 (CET)
Received: from localhost ([::1]:39684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJXt7-0005e3-W5
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 03:38:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lJXsD-0005Ee-RK
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 03:37:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lJXs9-0007N7-1a
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 03:37:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615279062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tLhh6Dp03nyJ+Bzj1ov/nQwTahFJ76ls+vmQls49DSU=;
 b=PIWc7xD4iXbFemq+DnGzz1cavBVtM99DDwPylyTjWz1pYQOu0k4zAFPwPoVgjWOTWSui2z
 wWNDAYeGxda6ORu8wKCMPC5gJqbV/lTzSTTl54AeTl7GU2wjQ2pLjPjSJMvX9LFOzv9VmL
 pLPYAQtITafjlTrnU/fJvj//RT4nLAA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-B9ZR0FCjMSmwoxL5MTRU0g-1; Tue, 09 Mar 2021 03:37:39 -0500
X-MC-Unique: B9ZR0FCjMSmwoxL5MTRU0g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10B40193F564;
 Tue,  9 Mar 2021 08:37:38 +0000 (UTC)
Received: from [10.36.112.254] (ovpn-112-254.ams2.redhat.com [10.36.112.254])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BBA7679F0;
 Tue,  9 Mar 2021 08:37:30 +0000 (UTC)
Subject: Re: [PATCH v2 4/7] hw/arm/smmu-common: Fix smmu_iotlb_inv_iova when
 asid is not set
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210225091435.644762-1-eric.auger@redhat.com>
 <20210225091435.644762-5-eric.auger@redhat.com>
 <CAFEAcA_ZTJUD1SfbAX07uk+WceO_NvqE_i+NrHF13bAOmfF3nw@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <4626b8d9-8b0f-c81c-56a2-331957dfd81a@redhat.com>
Date: Tue, 9 Mar 2021 09:37:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_ZTJUD1SfbAX07uk+WceO_NvqE_i+NrHF13bAOmfF3nw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, vivek.gautam@arm.com,
 qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,
On 3/8/21 5:37 PM, Peter Maydell wrote:
> On Thu, 25 Feb 2021 at 09:15, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> If the asid is not set, do not attempt to locate the key directly
>> as all inserted keys have a valid asid.
>>
>> Use g_hash_table_foreach_remove instead.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/smmu-common.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
>> index 405d5c5325..e9ca3aebb2 100644
>> --- a/hw/arm/smmu-common.c
>> +++ b/hw/arm/smmu-common.c
>> @@ -151,7 +151,7 @@ inline void
>>  smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
>>                      uint8_t tg, uint64_t num_pages, uint8_t ttl)
>>  {
>> -    if (ttl && (num_pages == 1)) {
>> +    if (ttl && (num_pages == 1) && (asid >= 0)) {
>>          SMMUIOTLBKey key = smmu_get_iotlb_key(asid, iova, tg, ttl);
>>
>>          g_hash_table_remove(s->iotlb, &key);
> 
> Do we also need to avoid the remove-by-key codepath if
> the tg is not set ?
when TG is not set, TTL is res0 so I think it is safe.

Thanks

Eric
> 
> thanks
> -- PMM
> 


