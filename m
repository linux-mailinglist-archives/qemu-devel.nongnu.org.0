Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 471B9135509
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 10:00:12 +0100 (CET)
Received: from localhost ([::1]:57202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipTfn-0007U3-2b
	for lists+qemu-devel@lfdr.de; Thu, 09 Jan 2020 04:00:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45365)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1ipTen-0006o3-Dl
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 03:59:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1ipTek-0000am-GK
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 03:59:07 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23505
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1ipTej-0000TP-Ul
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 03:59:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578560344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4QnuN8reEM91WflBdVipleY2ZFCB2LuFKUd0ENMYFyU=;
 b=ATDG9sxJEzhJ1POCLU5T97SHvVb5fa7T6s7lj6gu1TqlxbhR8EBemqqpuTz8/ZSFbJ0EFe
 2i6B69IDlK333NnerHOyYJ0cBgUyIBKMC2+W2ftxdeAlq9z2QvuwG+282Rcl3tu9p7tQ4Z
 ATuj8MNZHXo3H6A/QNFn6Z8x8/Rrbi0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-6OwTdAzTPOCJOXIV5WidcQ-1; Thu, 09 Jan 2020 03:59:01 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6554107ACC4;
 Thu,  9 Jan 2020 08:58:59 +0000 (UTC)
Received: from [10.36.117.108] (ovpn-117-108.ams2.redhat.com [10.36.117.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C2877C3B3;
 Thu,  9 Jan 2020 08:58:51 +0000 (UTC)
Subject: Re: [PATCH for-5.0 v11 08/20] virtio-iommu: Implement translate
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20191219133308.GA4246@xz-x1>
 <9d58b293-ada0-353e-bba2-ad1f538dfc62@redhat.com>
 <20191219144936.GB50561@xz-x1>
 <9ec9d0d5-062b-f96b-c72c-4d15865ff9a1@redhat.com>
 <20191220162642.GA2626852@myrica> <20191220165100.GA3780@xz-x1>
 <20200106170634.GF2062@myrica> <20200106175850.GC219677@xz-x1>
 <20200107101024.GB832497@myrica>
 <aa5fa9e6-6efd-e1a3-96c6-d02ba8eab4c8@redhat.com>
 <20200109084700.GA934975@myrica>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <0beb9d61-05b8-3152-e967-64413def6ab7@redhat.com>
Date: Thu, 9 Jan 2020 09:58:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200109084700.GA934975@myrica>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 6OwTdAzTPOCJOXIV5WidcQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, kevin.tian@intel.com,
 tnowicki@marvell.com, mst@redhat.com, jean-philippe.brucker@arm.com,
 quintela@redhat.com, qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 armbru@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 dgilbert@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jean,

On 1/9/20 9:47 AM, Jean-Philippe Brucker wrote:
> On Wed, Jan 08, 2020 at 05:55:52PM +0100, Auger Eric wrote:
>> Hi Jean-Philippe, Peter,
>>
>> On 1/7/20 11:10 AM, Jean-Philippe Brucker wrote:
>>> On Mon, Jan 06, 2020 at 12:58:50PM -0500, Peter Xu wrote:
>>>> On Mon, Jan 06, 2020 at 06:06:34PM +0100, Jean-Philippe Brucker wrote:
>>>>> On Fri, Dec 20, 2019 at 11:51:00AM -0500, Peter Xu wrote:
>>>>>> On Fri, Dec 20, 2019 at 05:26:42PM +0100, Jean-Philippe Brucker wrote:
>>>>>>> There is at the virtio transport level: the driver sets status to
>>>>>>> FEATURES_OK once it accepted the feature bits, and to DRIVER_OK once its
>>>>>>> fully operational. The virtio-iommu spec says:
>>>>>>>
>>>>>>>   If the driver does not accept the VIRTIO_IOMMU_F_BYPASS feature, the
>>>>>>>   device SHOULD NOT let endpoints access the guest-physical address space.
>>>>>>>
>>>>>>> So before features negotiation, there is no access. Afterwards it depends
>>>>>>> if the VIRTIO_IOMMU_F_BYPASS has been accepted by the driver.
>>>>>>
>>>>>> Before enabling virtio-iommu device, should we still let the devices
>>>>>> to access the whole system address space?  I believe that's at least
>>>>>> what Intel IOMMUs are doing.  From code-wise, its:
>>>>>>
>>>>>>     if (likely(s->dmar_enabled)) {
>>>>>>         success = vtd_do_iommu_translate(vtd_as, vtd_as->bus, vtd_as->devfn,
>>>>>>                                          addr, flag & IOMMU_WO, &iotlb);
>>>>>>     } else {
>>>>>>         /* DMAR disabled, passthrough, use 4k-page*/
>>>>>>         iotlb.iova = addr & VTD_PAGE_MASK_4K;
>>>>>>         iotlb.translated_addr = addr & VTD_PAGE_MASK_4K;
>>>>>>         iotlb.addr_mask = ~VTD_PAGE_MASK_4K;
>>>>>>         iotlb.perm = IOMMU_RW;
>>>>>>         success = true;
>>>>>>     }
>>>>>>
>>>>>> From hardware-wise, an IOMMU should be close to transparent if you
>>>>>> never enable it, imho.
>>>>>
>>>>> For hardware that's not necessarily the best choice. As cited in my
>>>>> previous reply it has been shown to introduce vulnerabilities since
>>>>> malicious devices can DMA during boot, before the OS takes control of the
>>>>> IOMMU. The Arm SMMU allows an implementation to adopt a deny policy by
>>>>> default.
>>>>
>>>> I see.  But then how to read a sector from the block to at least boot
>>>> an OS if we use a default-deny policy?  Does it still need a mapping
>>>> that is established somehow by someone before hand?
>>>
>>> Yes, it looks like EDK II uses IOMMU operations in order to access those
>>> devices on platforms where the IOMMU isn't default-bypass (AMD SEV support
>>> is provided by edk2, and a VT-d driver seems provided by edk2-platforms).
>>> However for OVMF we could just set the bypass feature bit in virtio-iommu
>>> device, which doesn't even requires setting up the virtqueue.
>>>
>>> I'm missing a piece of the puzzle for Arm platforms though, because it
>>> looks like Trusted Firmware-A sets up the default-deny policy on reset
>>> even when it wasn't hardwired, but doesn't provide a service to create
>>> SMMUv3 mappings for the bootloader.
>>>
>>> Thanks,
>>> Jean
>>>
>>
>> I think we have a concrete example for the above discussion. The AHCI.
>> When running the virtio-iommu on x86 I get messages like:
>>
>> virtio_iommu_translate sid=250 is not known!!
>> no buffer available in event queue to report event
>>
>> and a bunch of "AHCI: Failed to start FIS receive engine: bad FIS
>> receive buffer address" messages (For each port)
>>
>> This was reported in my cover letter (*). This happens very early in the
>> boot process, before the OS get the hand and before the virtio-iommu
>> driver creates any mapping. It does not prevent the guest from booting
>> though.
>>
>> Currently the virtio-iommu device checks the VIRTIO_IOMMU_F_BYPASS. If I
>> overwrite it to true in the device, then, the guest boots without those
>> messages.
> 
> Oh that's good, I was afraid it was an issue in Linux.
> 
>> I share Peter's concern about having a different default policy than x86.
> 
> Yes I'd say just align with whatever policy is already in place. Do you
> think we could add a command-line option to let people disable
> default-bypass, though?  That would be a convenient way to make the IOMMU
> protection airtight for those who need it.
Yes I could easily add a device option to disable the default bypass.

Shall we change the meaning of the F_BYPASS feature then? If exposed by
the device, the device does bypass by default, otherwise it doesn't.
This would be controlled by the device option.

The driver then could have means to overwrite this behavior once loaded?

Thanks

Eric
> 
> Thanks,
> Jean
> 


