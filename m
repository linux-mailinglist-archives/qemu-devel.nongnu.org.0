Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79113143CF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:31:43 +0100 (CET)
Received: from localhost ([::1]:51862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9G0M-0001Md-Oo
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:31:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1l9D4l-0002VT-IL
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:24:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1l9D4j-0005Hl-PV
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:24:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612815840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Cf21BGBBt+q5kxEhbwFomUHiOyb9jaMRZTQNWGYc40=;
 b=Cgzj+QOlrpXRTcHFxs/CuPDbpJzCjKov7VORKUiCTDygJNcYBt4jh9b+e/RzENf89+uOn8
 tHhjscWNfQIOERLNN3C57tAkrUPf0JZV3N7sJMoiRe8cxWcnyqhwEqIgqWL6HivXb11oGN
 C9+BNaQhMmDpoDHrXNBuKvrwtC7EYc8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-_bcfSqhPNSSXbmBdh-p5QA-1; Mon, 08 Feb 2021 15:23:59 -0500
X-MC-Unique: _bcfSqhPNSSXbmBdh-p5QA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11339107ACF4;
 Mon,  8 Feb 2021 20:23:58 +0000 (UTC)
Received: from [10.36.112.10] (ovpn-112-10.ams2.redhat.com [10.36.112.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BDEE1346F;
 Mon,  8 Feb 2021 20:23:50 +0000 (UTC)
Subject: Re: [PATCH] vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support
To: Peter Xu <peterx@redhat.com>, "Tian, Kevin" <kevin.tian@intel.com>
References: <20210204191228.187550-1-peterx@redhat.com>
 <2382a93d-41c1-24fd-144f-87ee18171bc9@redhat.com>
 <213acf9a-d1c0-3a1d-4846-877d90fadc03@redhat.com>
 <20210205153107.GX6468@xz-x1>
 <MWHPR11MB1886DACA066190C94FD2C27F8CB09@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210207144715.GG3195@xz-x1>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <40575583-6f3f-7985-dfcf-a557d671cfc9@redhat.com>
Date: Mon, 8 Feb 2021 21:23:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210207144715.GG3195@xz-x1>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 Eugenio Perez Martin <eperezma@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2/7/21 3:47 PM, Peter Xu wrote:
> Hi, Kevin,
> 
> On Sun, Feb 07, 2021 at 09:04:55AM +0000, Tian, Kevin wrote:
>>> From: Peter Xu
>>> Sent: Friday, February 5, 2021 11:31 PM
>>>
>>>>>
>>>>>
>>>>>> or virtio-iommu
>>>>>> since dev-iotlb (or PCIe ATS)
>>>>>
>>>>>
>>>>> We may need to add this in the future.
>>>> added Jean-Philippe in CC
>>>
>>> So that's the part I'm unsure about..  Since everybody is cced so maybe good
>>> time to ask. :)
>>>
>>> The thing is I'm still not clear on whether dev-iotlb is useful for a full
>>> emulation environment and how that should differ from a normal iotlb, since
>>> after all normal iotlb will be attached with device information too.
>>
>> dev-iotlb is useful in two manners.First, it's a functional prerequisite for
>> supporting I/O page faults.
If I understand correctly, the stall model of the ARM SMMU allows IOPF I
guess without dev-iotlb (ATS). However indeed PRI requires ATS.
> 
> Is this also a hard requirement for virtio-iommu, which is not a real hardware
> after all?
> 
>> Second, it has performance benefit as you don't
>> need to contend the lock of global iotlb.
> 
> Hmm.. are you talking about e.g. vt-d driver or virtio-iommu?
> 
> Assuming it's about vt-d, qi_flush_dev_iotlb() will still call qi_submit_sync()
> and taking the same global QI lock, as I see it, or I could be wrong somewhere.
> I don't see where dev-iotlb has a standalone channel for delivery.
> 
> For virtio-iommu, we haven't defined dev-iotlb, right?
no there is no such feature at the moment. If my understanding is
correct this would only make sense when protecting a HW device. In that
case the underlying physical IOMMU would be programmed for ATS.

When protecting a virtio device (inc. vhost) what would be the adventage
over the current standard unmap notifier?

Thanks

Eric
  Sorry I missed things
> when I completely didn't follow virtio-iommu recently - let's say if
> virtio-iommu in the future can support per-dev dev-iotlb queue so it doesn't
> need a global lock, what if we make it still per-device but still delivering
> iotlb message?  Again, it's still a bit unclear to me why a full emulation
> iommu would need that definition of "iotlb" and "dev-iotlb".
> 
>>
>>>
>>> For real hardwares, they make sense because they ask for two things: iotlb is
>>> for IOMMU, but dev-iotlb is for the device cache.  For emulation
>>> environment
>>> (virtio-iommu is the case) do we really need that complexity?
>>>
>>> Note that even if there're assigned devices under virtio-iommu in the future,
>>> we can still isolate that and iiuc we can easily convert an iotlb (from
>>> virtio-iommu) into a hardware IOMMU dev-iotlb no matter what type of
>>> IOMMU is
>>> underneath the vIOMMU.
>>>
>>
>> Didn't get this point. Hardware dev-iotlb is updated by hardware (between
>> the device and the IOMMU). How could software convert a virtual iotlb
>> entry into hardware dev-iotlb?
> 
> I mean if virtio-iommu must be run in a guest, then we can trap that message
> first, right?  If there're assigned device in the guest, we must convert that
> invalidation to whatever message required for the host, that seems to not
> require the virtio-iommu to have dev-iotlb knowledge, still?
> 
> Thanks,
> 


