Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 384BE211A7C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 05:03:23 +0200 (CEST)
Received: from localhost ([::1]:58416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqpVS-0001Ce-Ax
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 23:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jqpUZ-0000jd-Ru
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 23:02:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:32524
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jqpUX-00074y-Vp
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 23:02:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593658944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JaGAntuRJG/BQYw+DXI94GE65g0vkbj1B2sex0mrXgk=;
 b=CvNYw9ySAvvl5Fj/+evt8VC92ogWRxb1/XRfVTzLu35tS3mSYFJWwCSdiXpyRLaPd4Xgt/
 E5a0+Fxn6hXJ3BJeYzGZgkGSpAsR3/4rj25yjjtqdsTrLLUW/LcTYAo7O8Kt28wv0Ncdtm
 MjiJYIfFxjlFx6vRAd6AWeUmRZ7c7r4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-sRG-5WiuOk24WfOKeYbjIg-1; Wed, 01 Jul 2020 23:02:15 -0400
X-MC-Unique: sRG-5WiuOk24WfOKeYbjIg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD4EA185B39A;
 Thu,  2 Jul 2020 03:02:14 +0000 (UTC)
Received: from [10.72.13.248] (ovpn-13-248.pek2.redhat.com [10.72.13.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C35115C220;
 Thu,  2 Jul 2020 03:01:55 +0000 (UTC)
Subject: Re: [RFC v2 1/1] memory: Delete assertion in
 memory_region_unregister_iommu_notifier
From: Jason Wang <jasowang@redhat.com>
To: Peter Xu <peterx@redhat.com>
References: <20200626064122.9252-1-eperezma@redhat.com>
 <20200626064122.9252-2-eperezma@redhat.com> <20200626212917.GD175520@xz-x1>
 <8cf25190-53e6-8cbb-372b-e3d4ec714dc5@redhat.com>
 <20200628144746.GA239443@xz-x1>
 <54d2cdfd-97b8-9e1d-a607-d7a5e96be3a1@redhat.com>
 <20200629133403.GA266532@xz-x1>
 <2589d0e9-cc5b-a4df-8790-189b49f1a40e@redhat.com>
 <20200630153911.GD3138@xz-x1>
 <69f6d6e7-a0b1-abae-894e-4e81b7e0cc90@redhat.com>
Message-ID: <ff9e7af0-18c4-57e8-fc94-904fdce1123a@redhat.com>
Date: Thu, 2 Jul 2020 11:01:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <69f6d6e7-a0b1-abae-894e-4e81b7e0cc90@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=jasowang@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/01 23:00:26
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/7/1 下午4:09, Jason Wang wrote:
>
> On 2020/6/30 下午11:39, Peter Xu wrote:
>> On Tue, Jun 30, 2020 at 10:41:10AM +0800, Jason Wang wrote:
>>>>       /* According to ATS spec table 2.4:
>>>>        * S = 0, bits 15:12 = xxxx     range size: 4K
>>>>        * S = 1, bits 15:12 = xxx0     range size: 8K
>>>>        * S = 1, bits 15:12 = xx01     range size: 16K
>>>>        * S = 1, bits 15:12 = x011     range size: 32K
>>>>        * S = 1, bits 15:12 = 0111     range size: 64K
>>>>        * ...
>>>>        */
>>>
>>> Right, but the comment is probably misleading here, since it's for 
>>> the PCI-E
>>> transaction between IOMMU and device not for the device IOTLB 
>>> invalidation
>>> descriptor.
>>>
>>> For device IOTLB invalidation descriptor, spec allows a [0, ~0ULL]
>>> invalidation:
>>>
>>> "
>>>
>>> 6.5.2.5 Device-TLB Invalidate Descriptor
>>>
>>> ...
>>>
>>> Size (S): The size field indicates the number of consecutive pages 
>>> targeted
>>> by this invalidation
>>> request. If S field is zero, a single page at page address specified by
>>> Address [63:12] is requested
>>> to be invalidated. If S field is Set, the least significant bit in the
>>> Address field with value 0b
>>> indicates the invalidation address range. For example, if S field is 
>>> Set and
>>> Address[12] is Clear, it
>>> indicates an 8KB invalidation address range with base address in 
>>> Address
>>> [63:13]. If S field and
>>> Address[12] is Set and bit 13 is Clear, it indicates a 16KB 
>>> invalidation
>>> address range with base
>>> address in Address [63:14], etc.
>>>
>>> "
>>>
>>> So if we receive an address whose [63] is 0 and the rest is all 1, 
>>> it's then
>>> a [0, ~0ULL] invalidation.
>> Yes.  I think invalidating the whole range is always fine.  It's 
>> still not
>> arbitrary, right?  E.g., we can't even invalidate (0x1000, 0x3000) with
>> device-iotlb because of the address mask, not to say sub-pages.
>
>
> Yes.
>
>
>>
>>>
>>>>>>> How about just convert to use a range [start, end] for any 
>>>>>>> notifier and move
>>>>>>> the checks (e.g the assert) into the actual notifier implemented 
>>>>>>> (vhost or
>>>>>>> vfio)?
>>>>>> IOMMUTLBEntry itself is the abstraction layer of TLB entry.  
>>>>>> Hardware TLB entry
>>>>>> is definitely not arbitrary range either (because AFAICT the 
>>>>>> hardware should
>>>>>> only cache PFN rather than address, so at least PAGE_SIZE aligned).
>>>>>> Introducing this flag will already make this trickier just to 
>>>>>> avoid introducing
>>>>>> another similar struct to IOMMUTLBEntry, but I really don't want 
>>>>>> to make it a
>>>>>> default option...  Not to mention I probably have no reason to 
>>>>>> urge the rest
>>>>>> iommu notifier users (tcg, vfio) to change their existing good 
>>>>>> code to suite
>>>>>> any of the backend who can cooperate with arbitrary address 
>>>>>> ranges...
>>>>> Ok, so it looks like we need a dedicated notifiers to device IOTLB.
>>>> Or we can also make a new flag for device iotlb just like current 
>>>> UNMAP? Then
>>>> we replace the vhost type from UNMAP to DEVICE_IOTLB.  But IMHO 
>>>> using the
>>>> ARBITRARY_LENGTH flag would work in a similar way. DEVICE_IOTLB 
>>>> flag could
>>>> also allow virtio/vhost to only receive one invalidation (now IIUC 
>>>> it'll
>>>> receive both iotlb and device-iotlb for unmapping a page when 
>>>> ats=on), but then
>>>> ats=on will be a must and it could break some old (misconfiged) 
>>>> qemu because
>>>> afaict previously virtio/vhost could even work with vIOMMU 
>>>> (accidentally) even
>>>> without ats=on.
>>>
>>> That's a bug and I don't think we need to workaround 
>>> mis-configurated qemu
>>> :)
>> IMHO it depends on the strictness we want on the qemu cmdline API. :)
>>
>> We should at least check libvirt to make sure it's using ats=on 
>> always, then I
>> agree maybe we can avoid considering the rest...
>>
>> Thanks,
>
>
> Cc libvirt list, but I think we should fix libvirt if they don't 
> provide "ats=on".
>
> Thanks


Libvirt looks fine, according to the domain  XML documentation[1]:

  QEMU's virtio devices have some attributes related to the virtio 
transport under the driver element: The iommu attribute enables the use 
of emulated IOMMU by the device. The attribute ats controls the Address 
Translation Service support for PCIe devices. This is needed to make use 
of IOTLB support (see IOMMU device). Possible values are on or off. 
Since 3.5.0

So I think we agree that a new notifier is needed?

Thanks

[1] https://libvirt.org/formatdomain.html


>
>
>


