Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A1119C758
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Apr 2020 18:49:11 +0200 (CEST)
Received: from localhost ([::1]:44612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jK31i-0006cx-4J
	for lists+qemu-devel@lfdr.de; Thu, 02 Apr 2020 12:49:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39781)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jK2zt-0005yy-Rm
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 12:47:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jK2zs-0006ck-AO
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 12:47:17 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:47813
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jK2zr-0006bC-A6
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 12:47:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585846034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k5V0yigrc2CwpTkB3juzLB9oQMb4n2kUeWssfkY1zfQ=;
 b=aD6bZg6tu95B02LsTUZU+U2Y3qgOf2kKPBka8jgyhFY4JqPDm3PGujYu8mGUBkQw+wfUBN
 0n9mfYWYLJ6rEgImBOa4OaMvbsOftA62HCzGqgs5coLwdlEE1dJ1jEQXOwWF9JSwkX7heB
 x7DC24Hw3sD2YDLNHhQ2tofu8+hFSJ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-DW2gLHcqNMqKTxyLy4ykpg-1; Thu, 02 Apr 2020 12:47:05 -0400
X-MC-Unique: DW2gLHcqNMqKTxyLy4ykpg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 287B81005516;
 Thu,  2 Apr 2020 16:47:02 +0000 (UTC)
Received: from [10.36.112.58] (ovpn-112-58.ams2.redhat.com [10.36.112.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF85D9B924;
 Thu,  2 Apr 2020 16:46:50 +0000 (UTC)
Subject: Re: [RFC v6 00/24] vSMMUv3/pSMMUv3 2 stage VFIO integration
To: Zhangfei Gao <zhangfei.gao@linaro.org>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
References: <20200320165840.30057-1-eric.auger@redhat.com>
 <73b1c3e1-a418-f57c-d949-261250d6a79b@linaro.org>
 <c15f98fb-01d7-cb2f-5401-4b648997fcba@redhat.com>
 <fbae2237-11ed-9527-0c01-340d5092ddcc@linaro.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <86c0b1e4-8073-1644-f420-0b548c8f8895@redhat.com>
Date: Thu, 2 Apr 2020 18:46:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <fbae2237-11ed-9527-0c01-340d5092ddcc@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 shameerali.kolothum.thodi@huawei.com, peterx@redhat.com, bbhushan2@marvell.com,
 will@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Zhangfei,

On 3/31/20 10:24 AM, Zhangfei Gao wrote:
> Hi, Eric
>=20
> On 2020/3/31 =E4=B8=8B=E5=8D=884:12, Auger Eric wrote:
>> Hi Zhangfei,
>>
>> On 3/31/20 8:42 AM, Zhangfei Gao wrote:
>>> Hi, Eric
>>>
>>> On 2020/3/21 =E4=B8=8A=E5=8D=8812:58, Eric Auger wrote:
>>>> Up to now vSMMUv3 has not been integrated with VFIO. VFIO
>>>> integration requires to program the physical IOMMU consistently
>>>> with the guest mappings. However, as opposed to VTD, SMMUv3 has
>>>> no "Caching Mode" which allows easy trapping of guest mappings.
>>>> This means the vSMMUV3 cannot use the same VFIO integration as VTD.
>>>>
>>>> However SMMUv3 has 2 translation stages. This was devised with
>>>> virtualization use case in mind where stage 1 is "owned" by the
>>>> guest whereas the host uses stage 2 for VM isolation.
>>>>
>>>> This series sets up this nested translation stage. It only works
>>>> if there is one physical SMMUv3 used along with QEMU vSMMUv3 (in
>>>> other words, it does not work if there is a physical SMMUv2).
>>>>
>>>> - We force the host to use stage 2 instead of stage 1, when we
>>>> =C2=A0=C2=A0=C2=A0 detect a vSMMUV3 is behind a VFIO device. For a VFI=
O device
>>>> =C2=A0=C2=A0=C2=A0 without any virtual IOMMU, we still use stage 1 as =
many existing
>>>> =C2=A0=C2=A0=C2=A0 SMMUs expect this behavior.
>>>> - We use PCIPASIDOps to propage guest stage1 config changes on
>>>> =C2=A0=C2=A0=C2=A0 STE (Stream Table Entry) changes.
>>>> - We implement a specific UNMAP notifier that conveys guest
>>>> =C2=A0=C2=A0=C2=A0 IOTLB invalidations to the host
>>>> - We register MSI IOVA/GPA bindings to the host so that this latter
>>>> =C2=A0=C2=A0=C2=A0 can build a nested stage translation
>>>> - As the legacy MAP notifier is not called anymore, we must make
>>>> =C2=A0=C2=A0=C2=A0 sure stage 2 mappings are set. This is achieved thr=
ough another
>>>> =C2=A0=C2=A0=C2=A0 prereg memory listener.
>>>> - Physical SMMU stage 1 related faults are reported to the guest
>>>> =C2=A0=C2=A0=C2=A0 via en eventfd mechanism and exposed trhough a dedi=
cated VFIO-PCI
>>>> =C2=A0=C2=A0=C2=A0 region. Then they are reinjected into the guest.
>>>>
>>>> Best Regards
>>>>
>>>> Eric
>>>>
>>>> This series can be found at:
>>>> https://github.com/eauger/qemu/tree/v4.2.0-2stage-rfcv6
>>>>
>>>> Kernel Dependencies:
>>>> [1] [PATCH v10 00/11] SMMUv3 Nested Stage Setup (VFIO part)
>>>> [2] [PATCH v10 00/13] SMMUv3 Nested Stage Setup (IOMMU part)
>>>> branch at:
>>>> https://github.com/eauger/linux/tree/will-arm-smmu-updates-2stage-v10
>>> Really appreciated that you re-start this work.
>>>
>>> I tested your branch and some update.
>>>
>>> Guest: https://github.com/Linaro/linux-kernel-warpdrive/tree/sva-devel
>>> <https://github.com/Linaro/linux-kernel-warpdrive/tree/sva-devel>
>>> Host:
>>> https://github.com/eauger/linux/tree/will-arm-smmu-updates-2stage-v10
>>> <https://github.com/eauger/linux/tree/will-arm-smmu-updates-2stage-v10>
>>> qemu: https://github.com/eauger/qemu/tree/v4.2.0-2stage-rfcv6
>>> <https://github.com/eauger/qemu/tree/v4.2.0-2stage-rfcv6>
>>>
>>> The guest I am using is contains Jean's sva patches.
>>> Since currently they are many patch conflict, so use two different tree=
.
>>>
>>> Result
>>> No-sva mode works.
>>> This mode, guest directly get physical address via ioctl.
>> OK thanks for testing
>>> While vSVA can not work, there are still much work to do.
>>> I am trying to SVA mode, and it fails, so choose no-sva instead.
>>> iommu_dev_enable_feature(parent, IOMMU_DEV_FEAT_SVA)
>> Indeed I assume there are plenty of things missing to make vSVM work on
>> ARM (iommu, vfio, QEMU). I am currently reviewing Jacob and Yi's kernel
>> and QEMU series on Intel side. After that, I will come back to you to
>> help. Also vSMMUv3 does not support multiple contexts at the moment. I
>> will add this soon.
>>
>>
>> Still the problem I have is testing. Any suggestion welcome.
>>
>>
> To make sure
> Do you mean you need a environment for testing?
>=20
> How about Hisilicon kunpeng920, arm64 platform supporting SVA in host now=
.
> There is such a platform in linaro mlab that I think we can share.
> Currently I am testing with uacce,
> By testing a user driver (hisi zip accelerator) in guest, we can test
> vSVA and PASID easily.
Sorry for the delay. I am currently investigating if this could be
possible. Thank you for the suggestion!

Best Regards

Eric
>=20
> Thanks
>=20


