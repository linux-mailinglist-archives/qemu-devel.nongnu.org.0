Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA432603963
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 07:53:36 +0200 (CEST)
Received: from localhost ([::1]:50908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol21H-0005hP-Bh
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 01:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ol1q9-0000sd-87
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 01:42:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ol1q5-0001pa-Vb
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 01:42:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666158111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TCRh+w+Fc38cughHLHf+2ds3GmrIuwgvaBBhRmcPBa8=;
 b=DNcmpqwA0SJmalzp0B9pWyDWHBdk7tjNYMtJp6XBT0NOuz1e/F9RgHIBl7+dbUXFfIuK/S
 BeUSUGUGH717IdQOENRgOUd3z7ramJbiCdRRxCBzq+nsacuWXsMDbJz1eOGW7byg2Yz2MV
 mXNKkuAAORXQFzPU19gr/+e8LB2HuOo=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-636-Gy8eyl7gNWq8CpzvWAZQ0g-1; Wed, 19 Oct 2022 01:41:49 -0400
X-MC-Unique: Gy8eyl7gNWq8CpzvWAZQ0g-1
Received: by mail-pl1-f197.google.com with SMTP id
 a17-20020a170902ecd100b0018463d1748dso11152660plh.12
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 22:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TCRh+w+Fc38cughHLHf+2ds3GmrIuwgvaBBhRmcPBa8=;
 b=K9MqdEMfTm0GDdggSCDzf9RUoCKR6h/j21eeMCB8PMLXAWLAzutLyA04eAsI5Z8U3t
 kbfiJ8tXT+jYsHKKHWFrAlaRqS+sQn6WJpUXN25dWEsdska0KnbxyZJbufO3a3BKrQts
 nO3BHwJcqwwQLaFulllxuZrlXBfnyGzkArNHyrhIxRuwd2J1PJp6VZDk7gNZNQ1GQBSH
 f9SwpsuobPawgrswuiVrpdfMZd8gRPBQVmIRqxqJ9vWkcUYxx2P5ugtMwQ/YeGB90xvY
 N5a0iutIOIsB9ZPdZX2b9MoqHWzigazI5UB3q87BqBOC0QHa6mLxzFUD+phoVBrwD7PF
 pLjw==
X-Gm-Message-State: ACrzQf0vEAjXQ3CTZMeJIamPDptycYYIkQuqmP9CxKzoM0p4poGl52VY
 IBwNtQXaNx6UYg1DOBVONoTIS2FblAOOD60GgCeJMmXmiaISYJENdyz3FO+RTdppAjHnF5ftdkw
 +BvLLQybIrmcgftc=
X-Received: by 2002:a17:90b:2705:b0:20a:b4fa:f624 with SMTP id
 px5-20020a17090b270500b0020ab4faf624mr7683932pjb.124.1666158108254; 
 Tue, 18 Oct 2022 22:41:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5tqCvkBkhoJe1upkelLTSVZPlas7PJ2l8JI85eaA/IwC6WVjczPbmX1O/ne4qV87FqrR0fwA==
X-Received: by 2002:a17:90b:2705:b0:20a:b4fa:f624 with SMTP id
 px5-20020a17090b270500b0020ab4faf624mr7683901pjb.124.1666158107833; 
 Tue, 18 Oct 2022 22:41:47 -0700 (PDT)
Received: from [10.72.12.164] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 s3-20020aa78bc3000000b0056323de479bsm10322930pfd.120.2022.10.18.22.41.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 22:41:47 -0700 (PDT)
Message-ID: <938a6a20-35d8-2589-a128-029e1372befd@redhat.com>
Date: Wed, 19 Oct 2022 13:41:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH] vhost: Warn if DEVIOTLB_UNMAP is not supported and ats is
 set
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, mst@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, eperezma@redhat.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20221018122852.1185395-1-eric.auger@redhat.com>
 <Y063RZ4SkYcRM+SP@x1n> <31b87958-3be6-49c2-f0d9-9bcb8ec3bc1c@redhat.com>
 <Y08g9iaH5lZnPkte@x1n>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <Y08g9iaH5lZnPkte@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/10/19 05:56, Peter Xu 写道:
> On Tue, Oct 18, 2022 at 05:08:19PM +0200, Eric Auger wrote:
>> Hi Peter,
>>
>> On 10/18/22 16:25, Peter Xu wrote:
>>> Hi, Eric,
>>>
>>> On Tue, Oct 18, 2022 at 02:28:52PM +0200, Eric Auger wrote:
>>>> Since b68ba1ca5767 ("memory: Add IOMMU_NOTIFIER_DEVIOTLB_UNMAP
>>>> IOMMUTLBNotificationType"), vhost attempts to register DEVIOTLB_UNMAP
>>>> notifier. This latter is supported by the intel-iommu which supports
>>>> device-iotlb if the corresponding option is set. Then 958ec334bca3
>>>> ("vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support") allowed
>>>> silent fallback to the legacy UNMAP notifier if the viommu does not
>>>> support device iotlb.
>>>>
>>>> Initially vhost/viommu integration was introduced with intel iommu
>>>> assuming ats=on was set on virtio-pci device and device-iotlb was set
>>>> on the intel iommu. vhost acts as an ATS capable device since it
>>>> implements an IOTLB on kernel side. However translated transactions
>>>> that hit the device IOTLB do not transit through the vIOMMU. So this
>>>> requires a limited ATS support on viommu side.
>>>>
>>>> However, in theory, if ats=on is set on a pci device, the
>>>> viommu should support ATS for that device to work.
>>> Pure question: what will happen if one ATS supported PCI device got plugged
>>> into a system whose physical IOMMU does not support ATS?  Will ATS just be
>>> ignored and the device keep working simply without ATS?
>> Yes that's my understanding: in that case the ATS capable device would
>> work with ats disabled (baremetal case). In the iommu driver you can
>> have a look at the pci_enable_ats() call which is guarded by
>> info->ats_supported for instance on intel iommu.
>>
>> Following that reasoning vhost modality should not be enabled without
>> ATS support on vIOMMU side. But it is.
>>
>> In that sense I may rename the ats_enabled helpers with ats_capable?
> Sounds good to me.
>
>> If I understand correctly setting ats=on exposes the ATS capability (
>> 615c4ed205  virtio-pci: address space translation service (ATS) support)
>> which is then enabled by the guest driver.
> I think it won't, as long as vIOMMU doesn't have DT support declared?


Yes, it's exposed but not enabled.


>
>>> [1]
>>>
>>> [...]
>>>
>>>> @@ -760,8 +771,16 @@ static void vhost_iommu_region_add(MemoryListener *listener,
>>>>       iommu->iommu_offset = section->offset_within_address_space -
>>>>                             section->offset_within_region;
>>>>       iommu->hdev = dev;
>>>> -    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, NULL);
>>>> +    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, &err);
>>>>       if (ret) {
>>>> +        if (vhost_dev_ats_enabled(dev)) {
>>>> +            error_reportf_err(err,
>>>> +                              "vhost cannot register DEVIOTLB_UNMAP "
>>>> +                              "although ATS is enabled, "
>>>> +                              "fall back to legacy UNMAP notifier: ");
>>> We want to use the warning message to either remind the user to (1) add the
>>> dev-iotlb=on parameter for vIOMMU, or (2) drop the ats=on on device.  Am I
>>> right?
>> My focus is to warn the end user there is no support for device-iotlb
>> support in virtio-iommu or vsmmuv3 but vhost does not really require
>> it.Indeed current users of virtio-iommu/vsmmuv3 seem confused now wrt
>> vhost integration and the lack of device-iotlb option on those viommus.
>>
>> On intel I understand we would like to enforce that ats and dev-iotlb
>> are both set or unset. But this is not really addressed in that series.
>> Indeed vtd_iommu_notify_flag_changed does not reject any registration of
>> IOMMU_NOTIFIER_DEVIOTLB_UNMAP notifier in case it does not support
>> device-iotlb. I think it should.
> Yes I agree, thanks for finding it.  Just posted a patch:
>
> https://lore.kernel.org/r/20221018215407.363986-1-peterx@redhat.com
>
>> The trouble is vhost_iommu_region_add
>> is not meant to nicely fail.
>>> As we've discussed - I remember Jason used to test with/without dev-iotlb
>>> on vhost on Intel and dev-iotlb is faster on vt-d guest driver than without
>> It would be nice to have a clarification about this. Indeed
>>
>> [PATCH v3 0/5] memory: Skip assertion in memory_region_unregister_iommu_notifier
>> https://lore.kernel.org/all/20201116165506.31315-1-eperezma@redhat.com/
>> mostly focussed on removing an assertion although one patch mentionned perf improvements. What does make the perf better (less device iotlb flushes than general iotlb flushes?)
> I'll leave that to Jason.  Thanks.


If you mean f7701e2c7983b680790af47117577b285b6a1aed ("intel_iommu: Skip 
page walking on device iotlb invalidations"), it should help in the case 
of domian or global invalidation. But it really depends on whether or 
not guest is using those.

Regrading to the perf number, it might be tricky since:

1) the invalidation was batched or delayed which should be rare or at 
least very less frequent

2) meaning with TCP might be impact by a lot of other factors (you can 
see UDP_STREAM doesn't give ovbious improvement).

Thanks


>
>>> it.  So that can make sense to me for (1).  I don't know whether it helps
>>> for (2) because fundamentally it's the same question as [1] above, and
>>> whether that's a legal configuration.
>>>
>>> Thanks,
>>>
>> Adding jean in the loop too
>>
>> Thanks
>>
>> Eric
>>


