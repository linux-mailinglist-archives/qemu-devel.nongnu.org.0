Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A49315A43D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 10:08:08 +0100 (CET)
Received: from localhost ([::1]:33798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1o07-0001nc-89
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 04:08:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43233)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1j1nzO-0001MV-8U
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 04:07:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1j1nzM-00056h-Rg
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 04:07:22 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:42306
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1j1nzM-00052M-NW
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 04:07:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581498439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xd4zjQZSa1NqEGRzZDTzigGv8FiBSvE9RlLefOdlOZ4=;
 b=YTTXxHppla5bRvc6PHCtE0fd/2dvOw1ZEWl4Sbe69xo7gKmLyXU75dMHaABnnynm4ODhMM
 VwhYX4y4lIkjAoKr+Msk5IL9bSwgKvmiddaRUD2TlC3wYSuJfn+kfs6i8cavsVvQAxXKrF
 Bsks3OOKLcrmnStDjQ+e6WkkZ3ToHYs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-nGovIV4SNhyApnXVWNc58g-1; Wed, 12 Feb 2020 04:07:18 -0500
X-MC-Unique: nGovIV4SNhyApnXVWNc58g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A325813E4;
 Wed, 12 Feb 2020 09:07:16 +0000 (UTC)
Received: from [10.72.13.111] (ovpn-13-111.pek2.redhat.com [10.72.13.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5144690086;
 Wed, 12 Feb 2020 09:06:58 +0000 (UTC)
Subject: Re: [virtio-dev] Re: [PATCH v2 4/5] virtio-mmio: add MSI interrupt
 feature support
To: "Liu, Jing2" <jing2.liu@linux.intel.com>,
 Zha Bin <zhabin@linux.alibaba.com>, linux-kernel@vger.kernel.org
References: <cover.1581305609.git.zhabin@linux.alibaba.com>
 <4c3d13be5a391b1fc50416838de57d903cbf8038.1581305609.git.zhabin@linux.alibaba.com>
 <0c71ff9d-1a7f-cfd2-e682-71b181bdeae4@redhat.com>
 <c42c8b49-5357-f341-2942-ba84afc25437@linux.intel.com>
 <ad96269f-753d-54b8-a4ae-59d1595dd3b2@redhat.com>
 <5522f205-207b-b012-6631-3cc77dde3bfe@linux.intel.com>
 <45e22435-08d3-08fe-8843-d8db02fcb8e3@redhat.com>
 <4c19292f-9d25-a859-3dde-6dd5a03fdf0b@linux.intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <44209f3c-613c-3766-ca83-321b77b0f0dd@redhat.com>
Date: Wed, 12 Feb 2020 17:06:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4c19292f-9d25-a859-3dde-6dd5a03fdf0b@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: virtio-dev@lists.oasis-open.org, slp@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, chao.p.peng@linux.intel.com, gerry@linux.alibaba.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/2/12 =E4=B8=8A=E5=8D=8811:54, Liu, Jing2 wrote:
>
>
> On 2/11/2020 3:40 PM, Jason Wang wrote:
>>
>> On 2020/2/11 =E4=B8=8B=E5=8D=882:02, Liu, Jing2 wrote:
>>>
>>>
>>> On 2/11/2020 12:02 PM, Jason Wang wrote:
>>>>
>>>> On 2020/2/11 =E4=B8=8A=E5=8D=8811:35, Liu, Jing2 wrote:
>>>>>
>>>>> On 2/11/2020 11:17 AM, Jason Wang wrote:
>>>>>>
>>>>>> On 2020/2/10 =E4=B8=8B=E5=8D=885:05, Zha Bin wrote:
>>>>>>> From: Liu Jiang<gerry@linux.alibaba.com>
>>>>>>>
>>>>>>> Userspace VMMs (e.g. Qemu microvm, Firecracker) take advantage=20
>>>>>>> of using
>>>>>>> virtio over mmio devices as a lightweight machine model for moder=
n
>>>>>>> cloud. The standard virtio over MMIO transport layer only=20
>>>>>>> supports one
>>>>>>> legacy interrupt, which is much heavier than virtio over PCI=20
>>>>>>> transport
>>>>>>> layer using MSI. Legacy interrupt has long work path and causes=20
>>>>>>> specific
>>>>>>> VMExits in following cases, which would considerably slow down th=
e
>>>>>>> performance:
>>>>>>>
>>>>>>> 1) read interrupt status register
>>>>>>> 2) update interrupt status register
>>>>>>> 3) write IOAPIC EOI register
>>>>>>>
>>>>>>> We proposed to add MSI support for virtio over MMIO via new featu=
re
>>>>>>> bit VIRTIO_F_MMIO_MSI[1] which increases the interrupt performanc=
e.
>>>>>>>
>>>>>>> With the VIRTIO_F_MMIO_MSI feature bit supported, the=20
>>>>>>> virtio-mmio MSI
>>>>>>> uses msi_sharing[1] to indicate the event and vector mapping.
>>>>>>> Bit 1 is 0: device uses non-sharing and fixed vector per event=20
>>>>>>> mapping.
>>>>>>> Bit 1 is 1: device uses sharing mode and dynamic mapping.
>>>>>>
>>>>>>
>>>>>> I believe dynamic mapping should cover the case of fixed vector?
>>>>>>
>>>>> Actually this bit *aims* for msi sharing or msi non-sharing.
>>>>>
>>>>> It means, when msi sharing bit is 1, device doesn't want vector=20
>>>>> per queue
>>>>>
>>>>> (it wants msi vector sharing as name) and doesn't want a high=20
>>>>> interrupt rate.
>>>>>
>>>>> So driver turns to !per_vq_vectors and has to do dynamical mapping.
>>>>>
>>>>> So they are opposite not superset.
>>>>>
>>>>> Thanks!
>>>>>
>>>>> Jing
>>>>
>>>>
>>>> I think you need add more comments on the command.
>>>>
>>>> E.g if I want to map vector 0 to queue 1, how do I need to do?
>>>>
>>>> write(1, queue_sel);
>>>> write(0, vector_sel);
>>>
>>> That's true. Besides, two commands are used for msi sharing mode,
>>>
>>> VIRTIO_MMIO_MSI_CMD_MAP_CONFIG and VIRTIO_MMIO_MSI_CMD_MAP_QUEUE.
>>>
>>> "To set up the event and vector mapping for MSI sharing mode, driver=20
>>> SHOULD write a valid MsiVecSel followed by=20
>>> VIRTIO_MMIO_MSI_CMD_MAP_CONFIG/VIRTIO_MMIO_MSI_CMD_MAP_QUEUE command=20
>>> to map the configuration change/selected queue events respectively.=C2=
=A0=20
>>> " (See spec patch 5/5)
>>>
>>> So if driver detects the msi sharing mode, when it does setup vq,=20
>>> writes the queue_sel (this already exists in setup vq), vector sel=20
>>> and then MAP_QUEUE command to do the queue event mapping.
>>>
>>
>> So actually the per vq msix could be done through this.=20
>
> Right, per vq msix can also be mapped by the 2 commands if we want.
>
> The current design benefits for those devices requesting per vq msi=20
> that driver
>
> doesn't have to map during setup each queue,
>
> since we define the relationship by default.
>

Well since you've defined the dynamic mapping, having some "default"=20
mapping won't help to reduce the complexity but increase it.


>
>> I don't get why you need to introduce MSI_SHARING_MASK which is the=20
>> charge of driver instead of device.=20
>
> MSI_SHARING_MASK is just for identifying the msi_sharing bit in=20
> readl(MsiState) (0x0c4). The device tells whether it wants msi_sharing.
>
> MsiState register: R
>
> le32 {
> =C2=A0=C2=A0=C2=A0 msi_enabled : 1;
> =C2=A0=C2=A0=C2=A0 msi_sharing: 1;
> =C2=A0=C2=A0=C2=A0 reserved : 30;
> };
>

The question is why device want such information.


>
>> The interrupt rate should have no direct relationship with whether it=20
>> has been shared or not.
>
>>
>> Btw, you introduce mask/unmask without pending, how to deal with the=20
>> lost interrupt during the masking then?
>>
>>
>>> For msi non-sharing mode, no special action is needed because we=20
>>> make the rule of per_vq_vector and fixed relationship.
>>>
>>> Correct me if this is not that clear for spec/code comments.
>>>
>>
>> The ABI is not as straightforward as PCI did. Why not just reuse the=20
>> PCI layout?
>>
>> E.g having
>>
>> queue_sel
>> queue_msix_vector
>> msix_config
>>
>> for configuring map between msi vector and queues/config
>
> Thanks for the advice. :)
>
> Actually when looking into pci, the queue_msix_vector/msix_config is=20
> the msi vector index, which is the same as the mmio register MsiVecSel=20
> (0x0d0).
>
> So we don't introduce two extra registers for mapping even in sharing=20
> mode.
>
> What do you think?
>

I'm not sure I get the point, but I still prefer the separate vector_sel=20
from queue_msix_vector.

Btw, Michael propose per vq registers which could also work.

Thanks


>
>>
>> Then
>>
>> vector_sel
>> address
>> data
>> pending
>> mask
>> unmask
>>
>> for configuring msi table?
>
> PCI-like msix table is not introduced to device and instead simply use=20
> commands to tell the mask/configure/enable.
>
> Thanks!
>
> Jing
>
>>
>> Thanks
>>
>>
>>> Thanks!
>>>
>>> Jing
>>>
>>>
>>>>
>>>> ?
>>>>
>>>> Thanks
>>>>
>>>>
>>>>>
>>>>>
>>>>>> Thanks
>>>>>>
>>>>>>
>>>>>>
>>>>>> ------------------------------------------------------------------=
---=20
>>>>>>
>>>>>> To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.or=
g
>>>>>> For additional commands, e-mail:=20
>>>>>> virtio-dev-help@lists.oasis-open.org
>>>>>>
>>>>>
>>>>
>>


