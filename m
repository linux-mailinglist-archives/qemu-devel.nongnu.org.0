Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0903E0C2D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 03:47:22 +0200 (CEST)
Received: from localhost ([::1]:51616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBSTg-0004or-MR
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 21:47:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mBSSk-00042R-RK
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 21:46:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mBSSi-0006ho-EX
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 21:46:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628127979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tcjlAf5GwPdWaRurXgQ+WoG4ZO9kD8H8MXOH7suQDi4=;
 b=CBs61yloq1inXmgPQ8XUGTljNdclNRvFWkg18Wzvbt/7olWeI7Z0AZgTa8X+GRU8SHwrb6
 xqAEdzmzymb6wNh6Sf1AKnQfUW++0Yadr8r5xlO5eo68Hr5Vzu4bOCl2yJD7VmCfdWMXrf
 8/16fFwVaA7C98F485g11Xv/RehjrXM=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-eLRiLPziPBWru2y0DoFKAQ-1; Wed, 04 Aug 2021 21:46:16 -0400
X-MC-Unique: eLRiLPziPBWru2y0DoFKAQ-1
Received: by mail-pl1-f197.google.com with SMTP id
 f9-20020a1709028609b0290128bcba6be7so925461plo.18
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 18:46:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=tcjlAf5GwPdWaRurXgQ+WoG4ZO9kD8H8MXOH7suQDi4=;
 b=n/IFAIhM5UByfnE6GOrfZJLlJvH/Zbja4L3Si5UWHNPh+T6jHYYSp7cd+vKJfdZZAS
 qHlNXb8+saNjtaf+2H4UL3OjJvCvXtZuuTYrZsBgYnHs/tBgg9UxNmZACnf4RHkJkQLp
 XzaDBUxkAIgoN5EV/RBrXXHehnnEiajsJfBS/5pnWU7XEm9fUR6i7lcUST2q18tRAGpo
 7PawHSFoPvR3gytEbPSJave5ipS0taQ5A0pqcZIvigye5Xcg/nmM39LdniXvYr+zFWnI
 /+KOOihZlVv2w5MDWRxR4qM9gyTuvwW7XMtsNpaAG37X3LeyxVW96j1iENCGladru+5U
 VbGA==
X-Gm-Message-State: AOAM532VljV75G4hYmMX1E1baJBHgo7tU8tyotki5ReD074IatdFpy/b
 zOqux6ICE4ww5f/VFbihupEoOZu5Skryz1ITajtu06JS/3rZMVc9KeCIPFPFSm8PeQ7Hu1h3aEf
 8lcjC5f/WKd/7+/w=
X-Received: by 2002:aa7:80d3:0:b029:347:820c:fbf with SMTP id
 a19-20020aa780d30000b0290347820c0fbfmr2295771pfn.73.1628127975112; 
 Wed, 04 Aug 2021 18:46:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUKYC/C8FVBb7piA+GW6hVrrsm3cJNzKWvOhOJw4qPWPfk29+es4el022qdjOrfUNleBGpsg==
X-Received: by 2002:aa7:80d3:0:b029:347:820c:fbf with SMTP id
 a19-20020aa780d30000b0290347820c0fbfmr2295752pfn.73.1628127974839; 
 Wed, 04 Aug 2021 18:46:14 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id y62sm4310985pfy.183.2021.08.04.18.46.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 18:46:14 -0700 (PDT)
Subject: Re: [PATCH 0/3] Disable vhost device IOTLB is IOMMU is not enabled
To: Peter Xu <peterx@redhat.com>
References: <20210804034803.1644-1-jasowang@redhat.com>
 <YQq7h0OWlmQ+mX8z@t490s>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b401ebf7-9352-41a4-6cce-eada140d4d31@redhat.com>
Date: Thu, 5 Aug 2021 09:46:10 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQq7h0OWlmQ+mX8z@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: mst@redhat.com, Wei.Huang2@amd.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, Sriyash.Caculo@amd.com, pbonzini@redhat.com,
 chao.gao@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/8/5 上午12:08, Peter Xu 写道:
> On Wed, Aug 04, 2021 at 11:48:00AM +0800, Jason Wang wrote:
>> Hi:
>>
>> We currently try to enable device IOTLB when iommu_platform is
>> set. This may lead unnecessary trasnsactions between qemu and vhost
>> when vIOMMU is not used (which is the typical case for the encrypted
>> VM).
>>
>> So patch tries to use transport specific method to detect the enalbing
>> of vIOMMU and enable the device IOTLB only if vIOMMU is enalbed.
> Just to mention that there's also the ordering requirement for e.g. vfio-pci
> and the iommu device so far because vfio_realize() depends on vIOMMU being
> realized too, so specifying "-device vfio-pci" before "-device intel-iommu"
> will stop working, I think (see the similar pci_device_iommu_address_space()
> call in vfio_realize()).


Right, I actually try to google and end up with one patch that you 
posted to make sure vtd is initialized first.


>
> Do you think vhost can do the same to assume vIOMMU must be specified before
> vhost?


See below and I think it's not user friendly. I think maybe there should 
a general way to handle the order/dependency of device initialization in 
Qemu. But until that is implemented, I tend to use the "workaround" like 
this.


> Then vhost can call pci_device_iommu_address_space() freely.  It'll be
> more gentle for vhost even when it's used wrong: instead of not working at all
> (vfio-pci), vhost runs slower.


It's not about the slower, if pci_device_iommu_address_space() is used 
we will end up a wrong dma_as which breaks virtio DMA.


>
> Currently libvirt should be able to guarantee that ordering so libvirt users
> shouldn't need to bother.  I think libvirt should also guarantee the vIOMMU
> device to be created before all the rest devices, including virtio/vhost.  But
> need to check.  If that's the case libvirt will naturally work for vhost too.
>
> For the long term we may need to think about making device creation to be not
> ordered by user cmdline input but still has a priority specified in the code
> itself.


I fully agree.


>   Migration has something like that (MigrationPriority).  I think we
> just need something similar for general device realizations.  Since vhost
> raised the same need, I think that priority should bump up too.


Yes.


> The other concern is right now vhost has vhost_dev.dma_as but now we're not
> using it for vhost_dev_has_iommu().


If I understand correctly, both of us means using 
pci_device_iommu_address_space() in get_dma_as. If this is true, it's 
not he vhost_dev.dma_as but virtio_dev.dma_as.

So it breaks virtio actually (see above).



>    It's just a bit confusing as when to use
> which.


Yes, but I don't think a better approach.

Thanks


>
> What do you think?
>
> Thanks,
>


