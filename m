Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E502760432F
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 13:30:01 +0200 (CEST)
Received: from localhost ([::1]:34986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol7Gq-00071R-PI
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 07:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ol7Ck-0003AU-No
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 07:25:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ol7Ci-0004Cy-QW
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 07:25:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666178743;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G17gnPz1x4qXpekJokg0a9OzIWkdEYY06+dtxdEbf80=;
 b=InxfoSSueJ0KPB4Iq52DWDTVccyhs3Vosd4Q5hwhzCmv2NgfuFSB59+wLeGQ6IWaMG/0cM
 UeXh+gbmJHCX60z8Me3klYwZL1XMPZ1OvXvmMWGri4b2AEmBa2nHZZy2NT0kIeEnZLpn6/
 4HBipCjxVA3Fb5GxLtirY1JRckujQuA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-169-T4lQZh5rN3ikhjoqmDC3mA-1; Wed, 19 Oct 2022 07:25:42 -0400
X-MC-Unique: T4lQZh5rN3ikhjoqmDC3mA-1
Received: by mail-qt1-f200.google.com with SMTP id
 k12-20020ac8474c000000b0039cdd680ccaso8780376qtp.1
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 04:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G17gnPz1x4qXpekJokg0a9OzIWkdEYY06+dtxdEbf80=;
 b=uj/2l7ecuXnSlPVa67krACqbAEUCKDY0ckuNZ9tHMI2Jf/mrnBvLQs42DN8AAf30H8
 WHYdvdo8c7cY6857mXB4JwZ5ZvcfhXOREQFjeo8WI9MwUyo2hLiDRJ1cpo1mo7GJhpym
 NAHoNNuhC1hw4YJOUO628OSi1/eCbQX+NmOEUmpNmmfEoLpqmmMwGY1/iLuzTpCq4vRO
 PxIqToLA9vnnwd1q8JxNgKy9MSi5vL9w6sF4ENOSsMJ23EgDqF4Lq/g+hoyDxwFG03Rb
 EzQLZOR2tISKnV8tlejh/acx29uLRXWFJvIEXEZTxfk7FtaZdYWWl1sYGP1eZU3kYKq2
 ppOQ==
X-Gm-Message-State: ACrzQf1f9zFvTPcbtYL6HAlua5QVm8Q0SEHwxyEf5XFAnhaY8K2LDzC6
 kIGm7DkEdvKE/gcAPw3VLXZQEmf84eOfN/GsPOgB7jLmbu20tg9JGaMQAgyhxGROHGKFLNrh8Tf
 FFUcWbCNp5En+Rhw=
X-Received: by 2002:a05:620a:304:b0:6ee:77f1:ecf9 with SMTP id
 s4-20020a05620a030400b006ee77f1ecf9mr5027706qkm.94.1666178742064; 
 Wed, 19 Oct 2022 04:25:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5y/slfY0l61nxCjGAvNjiZA3YTR9eGf2a0Z2+2hoSahroAMRqDp6tyoec74Dh1zkbedwJYNQ==
X-Received: by 2002:a05:620a:304:b0:6ee:77f1:ecf9 with SMTP id
 s4-20020a05620a030400b006ee77f1ecf9mr5027696qkm.94.1666178741806; 
 Wed, 19 Oct 2022 04:25:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 bm34-20020a05620a19a200b006ce1bfbd603sm4523600qkb.124.2022.10.19.04.25.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 04:25:40 -0700 (PDT)
Message-ID: <6d7b1865-f3f5-19de-3b8d-5c7d138c478c@redhat.com>
Date: Wed, 19 Oct 2022 13:25:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] vhost: Warn if DEVIOTLB_UNMAP is not supported and ats is
 set
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: eric.auger.pro@gmail.com, mst@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, eperezma@redhat.com, jasowang@redhat.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20221018122852.1185395-1-eric.auger@redhat.com>
 <Y063RZ4SkYcRM+SP@x1n> <31b87958-3be6-49c2-f0d9-9bcb8ec3bc1c@redhat.com>
 <Y08g9iaH5lZnPkte@x1n>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Y08g9iaH5lZnPkte@x1n>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 10/18/22 23:56, Peter Xu wrote:
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
OK
>
>> If I understand correctly setting ats=on exposes the ATS capability (
>> 615c4ed205  virtio-pci: address space translation service (ATS) support)
>> which is then enabled by the guest driver.
> I think it won't, as long as vIOMMU doesn't have DT support declared?
That's my assumption too
>
>>> [1]
>>>
>>> [...]
>>>
>>>> @@ -760,8 +771,16 @@ static void vhost_iommu_region_add(MemoryListener *listener,
>>>>      iommu->iommu_offset = section->offset_within_address_space -
>>>>                            section->offset_within_region;
>>>>      iommu->hdev = dev;
>>>> -    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, NULL);
>>>> +    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, &err);
>>>>      if (ret) {
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
OK thanks


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

OK thanks

Eric
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


