Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 921D9B766E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 11:37:05 +0200 (CEST)
Received: from localhost ([::1]:41378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAss4-0001Yt-LN
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 05:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44848)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1iAsqb-0000Yx-5a
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 05:35:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1iAsqZ-0007DD-E6
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 05:35:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49024)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1iAsqZ-0007Cg-68
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 05:35:31 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4683B10CBC4B;
 Thu, 19 Sep 2019 09:35:30 +0000 (UTC)
Received: from [10.72.12.81] (ovpn-12-81.pek2.redhat.com [10.72.12.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C18BA5C1B5;
 Thu, 19 Sep 2019 09:35:18 +0000 (UTC)
To: Yan Zhao <yan.y.zhao@intel.com>
References: <8302a4ae-1914-3046-b3b5-b3234d7dda02@redhat.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D57B1D1@SHSMSX104.ccr.corp.intel.com>
 <6d73572e-1e89-b04a-bdd6-98ac73798083@redhat.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D57B90C@SHSMSX104.ccr.corp.intel.com>
 <204219fa-ee72-ca60-52a4-fb4bbc887773@redhat.com>
 <20190919052819.GA18391@joy-OptiPlex-7040>
 <7b6d6343-33de-ebd7-9846-af54a45a82a2@redhat.com>
 <20190919061756.GB18391@joy-OptiPlex-7040>
 <e0efbdc0-aad9-0d17-ec68-36460865501f@redhat.com>
 <20190919062954.GC18391@joy-OptiPlex-7040>
 <20190919063249.GD18391@joy-OptiPlex-7040>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <98e04514-f807-ba7d-6bd4-8872fcc96c76@redhat.com>
Date: Thu, 19 Sep 2019 17:35:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919063249.GD18391@joy-OptiPlex-7040>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Thu, 19 Sep 2019 09:35:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] vhost, iova, and dirty page tracking
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 'Alex Williamson' <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2019/9/19 =E4=B8=8B=E5=8D=882:32, Yan Zhao wrote:
> On Thu, Sep 19, 2019 at 02:29:54PM +0800, Yan Zhao wrote:
>> On Thu, Sep 19, 2019 at 02:32:03PM +0800, Jason Wang wrote:
>>> On 2019/9/19 =E4=B8=8B=E5=8D=882:17, Yan Zhao wrote:
>>>> On Thu, Sep 19, 2019 at 02:09:53PM +0800, Jason Wang wrote:
>>>>> On 2019/9/19 =E4=B8=8B=E5=8D=881:28, Yan Zhao wrote:
>>>>>> On Thu, Sep 19, 2019 at 09:05:12AM +0800, Jason Wang wrote:
>>>>>>> On 2019/9/18 =E4=B8=8B=E5=8D=884:37, Tian, Kevin wrote:
>>>>>>>>> From: Jason Wang [mailto:jasowang@redhat.com]
>>>>>>>>> Sent: Wednesday, September 18, 2019 2:10 PM
>>>>>>>>>
>>>>>>>>>>> Note that the HVA to GPA mapping is not an 1:1 mapping. One H=
VA
>>>>>>>>> range
>>>>>>>>>>> could be mapped to several GPA ranges.
>>>>>>>>>> This is fine. Currently vfio_dma maintains IOVA->HVA mapping.
>>>>>>>>>>
>>>>>>>>>> btw under what condition HVA->GPA is not 1:1 mapping? I didn't=
 realize it.
>>>>>>>>> I don't remember the details e.g memory region alias? And neith=
er kvm
>>>>>>>>> nor kvm API does forbid this if my memory is correct.
>>>>>>>>>
>>>>>>>> I checked https://qemu.weilnetz.de/doc/devel/memory.html, which
>>>>>>>> provides an example of aliased layout. However, its aliasing is =
all
>>>>>>>> 1:1, instead of N:1. From guest p.o.v every writable GPA implies=
 an
>>>>>>>> unique location. Why would we hit the situation where multiple
>>>>>>>> write-able GPAs are mapped to the same HVA (i.e. same physical
>>>>>>>> memory location)?
>>>>>>> I don't know, just want to say current API does not forbid this. =
So we
>>>>>>> probably need to take care it.
>>>>>>>
>>>>>> yes, in KVM API level, it does not forbid two slots to have the sa=
me HVA(slot->userspace_addr).
>>>>>> But
>>>>>> (1) there's only one kvm instance for each vm for each qemu proces=
s.
>>>>>> (2) all ramblock->host (corresponds to HVA and slot->userspace_add=
r) in one qemu
>>>>>> process is non-overlapping as it's obtained from mmmap().
>>>>>> (3) qemu ensures two kvm slots will not point to the same section =
of one ramblock.
>>>>>>
>>>>>> So, as long as kvm instance is not shared in two processes, and
>>>>>> there's no bug in qemu, we can assure that HVA to GPA is 1:1.
>>>>> Well, you leave this API for userspace, so you can't assume qemu is=
 the
>>>>> only user or any its behavior. If you had you should limit it in th=
e API
>>>>> level instead of open window for them.
>>>>>
>>>>>
>>>>>> But even if there are two processes operating on the same kvm inst=
ance
>>>>>> and manipulating on memory slots, adding an extra GPA along side c=
urrent
>>>>>> IOVA & HVA to ioctl VFIO_IOMMU_MAP_DMA can still let driver knows =
the
>>>>>> right IOVA->GPA mapping, right?
>>>>> It looks fragile. Consider HVA was mapped to both GPA1 and GPA2. Gu=
est
>>>>> maps IOVA to GPA2, so we have IOVA GPA2 HVA in the new ioctl and th=
en
>>>>> log through GPA2. If userspace is trying to sync through GPA1, it w=
ill
>>>>> miss the dirty page. So for safety we need log both GPA1 and GPA2. =
(See
>>>>> what has been done in log_write_hva() in vhost.c). The only way to =
do
>>>>> that is to maintain an independent HVA to GPA mapping like what KVM=
 or
>>>>> vhost did.
>>>>>
>>>> why GPA1 and GPA2 should be both dirty?
>>>> even they have the same HVA due to overlaping virtual address space =
in
>>>> two processes, they still correspond to two physical pages.
>>>> don't get what's your meaning :)
>>>
>>> The point is not leave any corner case that is hard to debug or fix i=
n
>>> the future.
>>>
>>> Let's just start by a single process, the API allows userspace to map=
s
>>> HVA to both GPA1 and GPA2. Since it knows GPA1 and GPA2 are equivalen=
t,
>>> it's ok to sync just through GPA1. That means if you only log GPA2, i=
t
>>> won't work.
>>>
>> In that case, cannot log dirty according to HPA.
> sorry, it should be "cannot log dirty according to HVA".


I think we are discussing the choice between GPA and IOVA, not HVA?

Thanks


>
>> because kvm cannot tell whether it's an valid case (the two GPAs are e=
quivalent)
>> or an invalid case (the two GPAs are not equivalent, but with the same
>> HVA value).
>>
>> Right?
>>
>> Thanks
>> Yan
>>
>>
>>> Thanks
>>>
>>>
>>>> Thanks
>>>> Yan
>>>>
>>>>
>>>>> Thanks
>>>>>
>>>>>
>>>>>> Thanks
>>>>>> Yan
>>>>>>
>>>>>>>> Is Qemu doing its own same-content memory
>>>>>>>> merging in GPA level, similar to KSM?
>>>>>>> AFAIK, it doesn't.
>>>>>>>
>>>>>>> Thanks
>>>>>>>
>>>>>>>
>>>>>>>> Thanks
>>>>>>>> Kevin

