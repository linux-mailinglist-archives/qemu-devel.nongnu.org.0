Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC70D25BAF0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 08:19:02 +0200 (CEST)
Received: from localhost ([::1]:51236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDiaM-0004ky-0q
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 02:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kDiXx-0003k2-NY
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 02:16:33 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:39567
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kDiXv-0002Fg-OR
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 02:16:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599113790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/RkVUGME+a8bwNIAg4s1nVy2+KasOvTt4EM3BBj8kac=;
 b=azGBJINiSPtCNFBsDk+1S+Rr5Qvk1xXpwht1hUicHyrQHo9JbAwPj+1NhAoSTc6I3015au
 1ohjgQiauBAVOy9hg3CmYK/cdh+TEeguIYSpPAh7vkjNFq3UHua+SGoTcWYfUg8KJE81CU
 NHAGRq9yunhmTfQfUITLC1IvbPPf/PQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-KO2RqwogN_isUDLxO-u0fQ-1; Thu, 03 Sep 2020 02:16:14 -0400
X-MC-Unique: KO2RqwogN_isUDLxO-u0fQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EF1818A2256;
 Thu,  3 Sep 2020 06:16:13 +0000 (UTC)
Received: from [10.72.13.109] (ovpn-13-109.pek2.redhat.com [10.72.13.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BB34806AC;
 Thu,  3 Sep 2020 06:16:03 +0000 (UTC)
Subject: Re: [RFC 0/3] try to solve the DMA to MMIO issue
To: Li Qiang <liq3ea@gmail.com>
References: <20200902162206.101872-1-liq3ea@163.com>
 <b840aab8-542d-af43-43e5-0a07f442b5d5@redhat.com>
 <20200903040611.fjam4nwqopec723y@mozz.bu.edu>
 <801411e4-e847-6d79-fc54-7cdd692b9c43@redhat.com>
 <CAKXe6SLB280LqvMzfMbRvMNff6Yt21unVpCs7TygF_bSPCTe8w@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b6c01013-7b26-5da2-ba8b-401ff3e58256@redhat.com>
Date: Thu, 3 Sep 2020 14:16:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXe6SLB280LqvMzfMbRvMNff6Yt21unVpCs7TygF_bSPCTe8w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.61; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 01:28:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.324, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Li Qiang <liq3ea@163.com>,
 Qemu Developers <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@bu.edu>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/9/3 下午12:50, Li Qiang wrote:
> Jason Wang <jasowang@redhat.com> 于2020年9月3日周四 下午12:24写道：
>>
>> On 2020/9/3 下午12:06, Alexander Bulekov wrote:
>>> On 200903 1154, Jason Wang wrote:
>>>> On 2020/9/3 上午12:22, Li Qiang wrote:
>>>>> The qemu device fuzzer has found several DMA to MMIO issue.
>>>>> These issues is caused by the guest driver programs the DMA
>>>>> address, then in the device MMIO handler it trigger the DMA
>>>>> and as the DMA address is MMIO it will trigger another dispatch
>>>>> and reenter the MMIO handler again. However most of the device
>>>>> is not reentrant.
>>>>>
>>>>> DMA to MMIO will cause issues depend by the device emulator,
>>>>> mostly it will crash the qemu. Following is three classic
>>>>> DMA to MMIO issue.
>>>>>
>>>>> e1000e: https://bugs.launchpad.net/qemu/+bug/1886362
>>>>> xhci: https://bugs.launchpad.net/qemu/+bug/1891354
>>>>> virtio-gpu: https://bugs.launchpad.net/qemu/+bug/1888606
>>>>>
>>>>> The DMA to MMIO issue I think can be classified as following:
>>>>> 1. DMA to the device itself
>>>>> 2. device A DMA to device B and to device C
>>>>> 3. device A DMA to device B and to device A
>>>>>
>>>>> The first case of course should not be allowed.
>>>>> The second case I think it ok as the device IO handler has no
>>>>> assumption about the IO data came from no matter it come from
>>>>> device or other device. This is for P2P DMA.
>>>>> The third case I think it also should not be allowed.
>>>>>
>>>>> So our issue has been reduced by one case: not allowed the
>>>>> device's IO handler reenter.
>>>>>
>>>>> Paolo suggested that we can refactor the device emulation with
>>>>> BH. However it is a lot of work.
>>>>> I have thought several propose to address this, also discuss
>>>>> this with Jason Wang in private email.
>>>>>
>>>>> I have can solve this issue in core framework or in specific device.
>>>>> After try several methods I choose address it in per-device for
>>>>> following reason:
>>>>> 1. If we address it in core framwork we have to recored and check the
>>>>> device or MR info in MR dispatch write function. Unfortunally we have
>>>>> no these info in core framework.
>>>>> 2. The performance will also be decrease largely
>>>>> 3. Only the device itself know its IO
>>>> I think we still need to seek a way to address this issue completely.
>>>>
>>>> How about adding a flag in MemoryRegionOps and detect the reentrancy through
>>>> that flag?
>>> What happens for devices with multiple MemoryRegions? Make all the
>>> MemoryRegionOps share the same flag?
>>
>> I think there could be two approaches:
>>
>> 1) record the device in MR as Qiang mentioned
> I have tried this as we discussed. But has following consideration:
> 1. The performance, we need to check/record/clean the MR in an array/hashtable.
>
> 2. The multiple MR and alias MR process in the memory layer. It is
> complicated and performance effective.
> So If we let the MR issue to the device itself, it is just as this
> patch does-let the device address the reentrancy issue.f
>
> Another solution. We connects a MR with the corresponding device. Now
> the device often tight MR with an 'opaque' field.
> Just uses it in the calling of MR callback. Then we add a flag in the
> device and needs to modify the MR register interface.
>
> So in the memory layer we can check/record/clean the MR->device->flag.
> But this is can't address the DMA (in BH) to MMIO issue as the BH runs
> in main thread.


This is probably good enough to start. To my point of view, there're two 
different issues:

1) re-entrant MMIO handler
2) MMIO hanlder sync with BH

For 1), we'd better solve it at core, For 2) it can only be solved in 
the device.

Thanks


>
> Thanks,
> Li Qiang
>
>
>
>> 2) Only forbid the reentrancy in MMIO handler and depends on the device
>> to solve the multiple Memory Region issue, if the regions want to access
>> the same data, it needs to be synchronized internally
>>
>> But the point is still to try to solve it in the layer of memory
>> regions. Otherwise we may still hit similar issues.
>>
>>
>>> What about the virtio-gpu bug, where the problem happens in a bh->mmio
>>> access rather than an mmio->mmio access?
>>
>> Yes, it needs more thought, but as a first step, we can try to fix the
>> MMIO handler issue and do bh fix on top.
>
>
>> Thanks
>>
>>
>>> -Alex
>>>
>>>> Thanks
>>>>
>>>>
>>>>> The (most of the) device emulation is protected by BQL one time only
>>>>> a device emulation code can be run. We can add a flag to indicate the
>>>>> IO is running. The first two patches does this. For simplicity at the
>>>>> RFC stage I just set it while enter the IO callback and clear it exit
>>>>> the IO callback. It should be check/set/clean according the per-device's
>>>>> IO emulation.
>>>>> The second issue which itself suffers a race condition so I uses a
>>>>> atomic.
>>>>>
>>>>>
>>>>>
>>>>>
>>>>> Li Qiang (3):
>>>>>      e1000e: make the IO handler reentrant
>>>>>      xhci: make the IO handler reentrant
>>>>>      virtio-gpu: make the IO handler reentrant
>>>>>
>>>>>     hw/display/virtio-gpu.c        | 10 ++++++
>>>>>     hw/net/e1000e.c                | 35 +++++++++++++++++++-
>>>>>     hw/usb/hcd-xhci.c              | 60 ++++++++++++++++++++++++++++++++++
>>>>>     hw/usb/hcd-xhci.h              |  1 +
>>>>>     include/hw/virtio/virtio-gpu.h |  1 +
>>>>>     5 files changed, 106 insertions(+), 1 deletion(-)
>>>>>


