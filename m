Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 581BB3154D9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 18:18:41 +0100 (CET)
Received: from localhost ([::1]:51590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Wet-00083a-Tu
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 12:18:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1l9Wbo-0006Ed-LV
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 12:15:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1l9Wbm-0000rw-EK
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 12:15:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612890924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yDINSqIp06Pa2Pej+CRkQzLBe2rvC74g4AVYWv3dcwI=;
 b=Qkh9RxFGcEFepI4b16h9lOo0sHio7nOzITDxQoFWNolIeYJGDfINwKhndVh0ZduGbdfGH2
 7K+7Xplx6fFK1U6W7D2i2IhoXyiH5MWG1OCcR8njKesqPH57y/7GvAf5VuLXZuW6p6XrTF
 YHIPluYD5QCaEhKApYNKIG/c7E/Ik9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-DPFTTSCdN46NAzqYqrGjfA-1; Tue, 09 Feb 2021 12:15:22 -0500
X-MC-Unique: DPFTTSCdN46NAzqYqrGjfA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A3861087D69;
 Tue,  9 Feb 2021 17:15:21 +0000 (UTC)
Received: from [10.36.112.10] (ovpn-112-10.ams2.redhat.com [10.36.112.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 881C160C4D;
 Tue,  9 Feb 2021 17:15:13 +0000 (UTC)
Subject: Re: [PATCH] vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support
To: Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20210204191228.187550-1-peterx@redhat.com>
 <2382a93d-41c1-24fd-144f-87ee18171bc9@redhat.com>
 <213acf9a-d1c0-3a1d-4846-877d90fadc03@redhat.com>
 <20210205153107.GX6468@xz-x1>
 <a28ba439-758e-4b5b-86d9-5008b220b106@redhat.com>
 <20210208183721.GB68242@xz-x1>
 <a5e3c11e-fa31-3013-1e7e-3b2d6193bd7b@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <6ddf3db5-552a-4984-5f52-836178e5f486@redhat.com>
Date: Tue, 9 Feb 2021 18:15:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <a5e3c11e-fa31-3013-1e7e-3b2d6193bd7b@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Jean-Philippe Brucker <Jean-Philippe.Brucker@arm.com>,
 Eugenio Perez Martin <eperezma@redhat.com>, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2/9/21 4:12 AM, Jason Wang wrote:
> 
> On 2021/2/9 上午2:37, Peter Xu wrote:
>> On Mon, Feb 08, 2021 at 11:21:23AM +0800, Jason Wang wrote:
>>
>> [...]
>>
>>>> I'm not sure I remember it right, but we seem to have similar
>>>> discussion
>>>> previously on "what if the user didn't specify ats=on" - I think at
>>>> that time
>>>> the conclusion was that we ignore the failure since that's not a valid
>>>> configuration for qemu.
>>>
>>> Yes, but I think I was wrong at that time.
>> I can't say you're wrong - I actually still agree with you that at least
>> there's a priority of things we'd do, and this one is not extremely
>> important
>> if that's not a major use case (say, if you will 100% always suggest
>> an user to
>> use ats=on for a viommu enabled vhost).
> 
> 
> Right, but it depends on e.g how libvirt use that. As far as I know,
> they do enable ATS. But it would still an issue if libvirt want to
> support vIOMMUs other than intel.
> 
> 
>>
>>>> The other issue I'm worried is (I think I mentioned it somewhere,
>>>> but just to
>>>> double confirm): I'd like to make sure SMMU and virtio-iommu are the
>>>> only IOMMU
>>>> platform that will use vhost.
>>>
>>> For upstream, it won't be easy :)
>> Sorry I definitely didn't make myself clear... :)
>>
>> To be explicit, does ppc use vhost kernel too?
> 
> 
> I think the answer is yes.
> 
> 
>>   Since I know at least ppc has
>> its own translation unit and its iommu notifier in qemu, so I'm unsure
>> whether
>> the same patch would break ppc too, because vhost could also ignore
>> all UNMAP
>> sent by the ppc vIOMMU.
> 
> 
> If this is true, we probably need to fix that.
> 
> 
>>
>>>
>>>>     Otherwise IIUC we need to fix those vIOMMUs too.
>>>
>>> Right, last time I check AMD IOMMU emulation, it simply trigger
>>> device IOTLB
>>> invalidation during IOTLB invalidation which looks wrong.
>> I did quickly grep IOMMU_NOTIFIER_UNMAP in amd_iommu.c and saw
>> nothing. It
>> seems amd iommu is not ready for any kind of IOMMU notifiers yet.
>>
>> Thanks,
> 
> 
> Right.
> 
> Thanks
> 
> 
>>
> 
> 
I just noted that the vhost fix now breaks virtio-iommu/vfio integration
because VFIO registers IOMMU_NOTIFIER_ALL which includes the DEV-IOTLB
that is now rejected by virtio-iommu virtio_iommu_notify_flag_changed().
Is it safe to replace IOMMU_NOTIFIER_ALL by IOMMU_NOTIFIER_IOTLB_EVENTS
in vfio_listener_region_add (hw/vfio/common.c) or shall we also do the
2-step registration? After your confirmation, I can send the patch.

Thanks

Eric


