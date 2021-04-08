Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D92B357D56
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 09:28:50 +0200 (CEST)
Received: from localhost ([::1]:54160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUP5s-0005sn-BS
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 03:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lUP4z-0005Li-DU
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 03:27:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lUP4v-0003it-J0
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 03:27:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617866867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qNj70kud8fNI4ZH8HL0d7dCtnVhpt46oZF7wMQg9hWo=;
 b=EYgdNPsYVaPdSTGWzbKTZ0KxZMf2m7d0M/aHEQFbfXQv4kijKYH29OMRcsv5LVGLzX7dyt
 e8pdhmdL7STLMZ/aT63KdPXGTKFGqgoWm3r/9mUO+ME8P55Yed2dKVUwO9obALz/8nt+Z6
 y/JFMpVlmyuPg94GGQeFFzfQqI/41io=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-LkKIH64dPeyi2jX5P54Ruw-1; Thu, 08 Apr 2021 03:27:42 -0400
X-MC-Unique: LkKIH64dPeyi2jX5P54Ruw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE126107ACC7;
 Thu,  8 Apr 2021 07:27:40 +0000 (UTC)
Received: from [10.36.113.184] (ovpn-113-184.ams2.redhat.com [10.36.113.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D8191724D;
 Thu,  8 Apr 2021 07:27:38 +0000 (UTC)
Subject: Re: A question about the translation granule size supported by the
 vSMMU
To: Kunkun Jiang <jiangkunkun@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>, linuc.decode@gmail.com
References: <fa696532-5f04-aeeb-1ba3-6427675c6655@huawei.com>
 <4886d8d0-cca6-d4b2-4139-29ad52020f79@redhat.com>
 <d4b8b381-0883-4301-8967-d924ccc61ea0@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <0a3ae73c-af3a-9d80-2f30-55424a07d104@redhat.com>
Date: Thu, 8 Apr 2021 09:27:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <d4b8b381-0883-4301-8967-d924ccc61ea0@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Zenghui Yu <yuzenghui@huawei.com>,
 "wanghaibin.wang@huawei.com" <wanghaibin.wang@huawei.com>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>, Keqian Zhu <zhukeqian1@huawei.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Kunkun,

On 4/7/21 11:26 AM, Kunkun Jiang wrote:
> Hi Eric,
> 
> On 2021/4/7 3:50, Auger Eric wrote:
>> Hi Kunkun,
>>
>> On 3/27/21 3:24 AM, Kunkun Jiang wrote:
>>> Hi all,
>>>
>>> Recently, I did some tests on SMMU nested mode. Here is
>>> a question about the translation granule size supported by
>>> vSMMU.
>>>
>>> There is such a code in SMMUv3_init_regs():
>>>
>>>>     /* 4K and 64K granule support */
>>>>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
>>>>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
>>>>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44
>>>> bits */
>>> Why is the 16K granule not supported? I modified the code
>>> to support it and did not encounter any problems in the
>>> test. Although 4K and 64K minimal granules are "strongly
>>> recommended", I think vSMMU should still support 16K.😉
>>> Are there other reasons why 16K is not supported here?
>> no there aren't any. The main reasons were 16KB support is optional and
>> supporting it increases the test matrix. Also it seems quite a few
>> machines I have access to do support 16KB granule. On the others I get
>>
>> "EFI stub: ERROR: This 16 KB granular kernel is not supported by your
>> CPU".
>>
>> Nevertheless I am not opposed to support it as it seems to work without
>> trouble. Just need to have an extra look at implied validity checks but
>> there shouldn't be much.
>>
>> Thanks
>>
>> Eric
> Yes, you are right. In my opinion, it is necessary to check whether pSMMU
> supports 16K to avoid the situation I mentioned below.
> In SMMU nested mode, if vSMMU supports 16K and set pasid table to
> pSMMU, it may get errors when pSMMU does translation table walk if
> pSMMU doesn't support 16K (not tested). Do you think we need to add
> an interface to get some pSMMU info?>
> Maybe my consideration was superfluous.😁
No it is not. At qemu level we have
memory_region_iommu_set_page_size_mask() that is called from the VFIO
device. It allows to pass such info to the IOMMU device (qemu
b91774984249).

iommu_set_page_size_mask() cb needs to be implemented at SMMU QEMU
device level. Also [PATCH 0/2] Domain nesting info for arm-smmu may
allow to return other constraints from the pSMMU.

Thanks

Eric
> 
> Thanks,
> Kunkun Jiang
>>> When in SMMU nested mode, it may get errors if pSMMU
>>> doesn't support 16K but vSMMU supports 16K. But we
>>> can get some settings of pSMMU to avoid this situation.
>>> I found some discussions between Eric and Linu about
>>> this [1], but this idea does not seem to be implemented.
>>>
>>> [1] https://lists.gnu.org/archive/html/qemu-arm/2017-09/msg00149.html
>>>
>>> Best regards,
>>> Kunkun Jiang
>>>
>>
>> .
> 
> 


