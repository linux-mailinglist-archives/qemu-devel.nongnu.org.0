Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 543A5B730E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 08:12:53 +0200 (CEST)
Received: from localhost ([::1]:38020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iApgR-0006sO-TN
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 02:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44756)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1iApdp-0004vY-6J
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 02:10:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1iApdn-0003yl-RZ
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 02:10:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:7029)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1iApdn-0003y9-Jc
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 02:10:07 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C668D7F746;
 Thu, 19 Sep 2019 06:10:06 +0000 (UTC)
Received: from [10.72.12.81] (ovpn-12-81.pek2.redhat.com [10.72.12.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D98560C5E;
 Thu, 19 Sep 2019 06:09:59 +0000 (UTC)
To: Yan Zhao <yan.y.zhao@intel.com>
References: <AADFC41AFE54684AB9EE6CBC0274A5D19D577BEA@SHSMSX104.ccr.corp.intel.com>
 <60110ea3-9228-7e5d-ea32-05c72a95af0b@redhat.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D57A080@SHSMSX104.ccr.corp.intel.com>
 <8302a4ae-1914-3046-b3b5-b3234d7dda02@redhat.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D57B1D1@SHSMSX104.ccr.corp.intel.com>
 <6d73572e-1e89-b04a-bdd6-98ac73798083@redhat.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D57B90C@SHSMSX104.ccr.corp.intel.com>
 <204219fa-ee72-ca60-52a4-fb4bbc887773@redhat.com>
 <20190919052819.GA18391@joy-OptiPlex-7040>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <7b6d6343-33de-ebd7-9846-af54a45a82a2@redhat.com>
Date: Thu, 19 Sep 2019 14:09:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919052819.GA18391@joy-OptiPlex-7040>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Thu, 19 Sep 2019 06:10:06 +0000 (UTC)
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


On 2019/9/19 =E4=B8=8B=E5=8D=881:28, Yan Zhao wrote:
> On Thu, Sep 19, 2019 at 09:05:12AM +0800, Jason Wang wrote:
>> On 2019/9/18 =E4=B8=8B=E5=8D=884:37, Tian, Kevin wrote:
>>>> From: Jason Wang [mailto:jasowang@redhat.com]
>>>> Sent: Wednesday, September 18, 2019 2:10 PM
>>>>
>>>>>> Note that the HVA to GPA mapping is not an 1:1 mapping. One HVA
>>>> range
>>>>>> could be mapped to several GPA ranges.
>>>>> This is fine. Currently vfio_dma maintains IOVA->HVA mapping.
>>>>>
>>>>> btw under what condition HVA->GPA is not 1:1 mapping? I didn't real=
ize it.
>>>> I don't remember the details e.g memory region alias? And neither kv=
m
>>>> nor kvm API does forbid this if my memory is correct.
>>>>
>>> I checked https://qemu.weilnetz.de/doc/devel/memory.html, which
>>> provides an example of aliased layout. However, its aliasing is all
>>> 1:1, instead of N:1. From guest p.o.v every writable GPA implies an
>>> unique location. Why would we hit the situation where multiple
>>> write-able GPAs are mapped to the same HVA (i.e. same physical
>>> memory location)?
>>
>> I don't know, just want to say current API does not forbid this. So we
>> probably need to take care it.
>>
> yes, in KVM API level, it does not forbid two slots to have the same HV=
A(slot->userspace_addr).
> But
> (1) there's only one kvm instance for each vm for each qemu process.
> (2) all ramblock->host (corresponds to HVA and slot->userspace_addr) in=
 one qemu
> process is non-overlapping as it's obtained from mmmap().
> (3) qemu ensures two kvm slots will not point to the same section of on=
e ramblock.
>
> So, as long as kvm instance is not shared in two processes, and
> there's no bug in qemu, we can assure that HVA to GPA is 1:1.


Well, you leave this API for userspace, so you can't assume qemu is the=20
only user or any its behavior. If you had you should limit it in the API=20
level instead of open window for them.


>
> But even if there are two processes operating on the same kvm instance
> and manipulating on memory slots, adding an extra GPA along side curren=
t
> IOVA & HVA to ioctl VFIO_IOMMU_MAP_DMA can still let driver knows the
> right IOVA->GPA mapping, right?


It looks fragile. Consider HVA was mapped to both GPA1 and GPA2. Guest=20
maps IOVA to GPA2, so we have IOVA GPA2 HVA in the new ioctl and then=20
log through GPA2. If userspace is trying to sync through GPA1, it will=20
miss the dirty page. So for safety we need log both GPA1 and GPA2. (See=20
what has been done in log_write_hva() in vhost.c). The only way to do=20
that is to maintain an independent HVA to GPA mapping like what KVM or=20
vhost did.

Thanks


>
> Thanks
> Yan
>
>>> Is Qemu doing its own same-content memory
>>> merging in GPA level, similar to KSM?
>>
>> AFAIK, it doesn't.
>>
>> Thanks
>>
>>
>>> Thanks
>>> Kevin
>>
>>

