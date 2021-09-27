Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A62DF419459
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 14:34:56 +0200 (CEST)
Received: from localhost ([::1]:35288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUpqR-00013m-Ot
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 08:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1mUpm7-0007qd-QJ
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 08:30:28 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1mUpm4-0003o0-HJ
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 08:30:27 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HJ21340X5zRWx4;
 Mon, 27 Sep 2021 20:25:59 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Mon, 27 Sep 2021 20:30:15 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Mon, 27 Sep 2021 20:30:14 +0800
Subject: Re: [question] VFIO Device Migration: The vCPU may be paused during
 vfio device DMA in iommu nested stage mode && vSVA
To: "Tian, Kevin" <kevin.tian@intel.com>, Tarun Gupta <targupta@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Eric Auger <eric.auger@redhat.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
References: <7494b6a8-8dae-cbe9-fcff-29e10a4f0015@huawei.com>
 <BN9PR11MB5433E189EEC102256A3348A18CA49@BN9PR11MB5433.namprd11.prod.outlook.com>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <41425c1b-1db4-f753-ca67-152366fe3865@huawei.com>
Date: Mon, 27 Sep 2021 20:30:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <BN9PR11MB5433E189EEC102256A3348A18CA49@BN9PR11MB5433.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme708-chm.china.huawei.com (10.1.199.104) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=jiangkunkun@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.136,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "tangnianyao@huawei.com" <tangnianyao@huawei.com>,
 Zenghui Yu <yuzenghui@huawei.com>,
 "wanghaibin.wang@huawei.com" <wanghaibin.wang@huawei.com>,
 "liulongfang@huawei.com" <liulongfang@huawei.com>,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Kevin:

On 2021/9/24 14:47, Tian, Kevin wrote:
>> From: Kunkun Jiang <jiangkunkun@huawei.com>
>> Sent: Friday, September 24, 2021 2:19 PM
>>
>> Hi all,
>>
>> I encountered a problem in vfio device migration test. The
>> vCPU may be paused during vfio-pci DMA in iommu nested
>> stage mode && vSVA. This may lead to migration fail and
>> other problems related to device hardware and driver
>> implementation.
>>
>> It may be a bit early to discuss this issue, after all, the iommu
>> nested stage mode and vSVA are not yet mature. But judging
>> from the current implementation, we will definitely encounter
>> this problem in the future.
> Yes, this is a known limitation to support migration with vSVA.
>
>> This is the current process of vSVA processing translation fault
>> in iommu nested stage mode (take SMMU as an example):
>>
>> guest os            4.handle translation fault 5.send CMD_RESUME to vSMMU
>>
>>
>> qemu                3.inject fault into guest os 6.deliver response to
>> host os
>> (vfio/vsmmu)
>>
>>
>> host os              2.notify the qemu 7.send CMD_RESUME to SMMU
>> (vfio/smmu)
>>
>>
>> SMMU              1.address translation fault              8.retry or
>> terminate
>>
>> The order is 1--->8.
>>
>> Currently, qemu may pause vCPU at any step. It is possible to
>> pause vCPU at step 1-5, that is, in a DMA. This may lead to
>> migration fail and other problems related to device hardware
>> and driver implementation. For example, the device status
>> cannot be changed from RUNNING && SAVING to SAVING,
>> because the device DMA is not over.
>>
>> As far as i can see, vCPU should not be paused during a device
>> IO process, such as DMA. However, currently live migration
>> does not pay attention to the state of vfio device when pausing
>> the vCPU. And if the vCPU is not paused, the vfio device is
>> always running. This looks like a *deadlock*.
> Basically this requires:
>
> 1) stopping vCPU after stopping device (could selectively enable
> this sequence for vSVA);
How to tell if vSVA is open?
In fact, as long as it is in iommu nested stage mode, there will
be such a problem, whether it is vSVA or no-vSVA. In no-vSVA mode,
a fault can also be generated by modifying the guest device driver.
>
> 2) when stopping device, the driver should block new requests
> from vCPU (queued to a pending list) and then drain all in-fly
> requests including faults;
>      * to block this further requires switching from fast-path to
> slow trap-emulation path for the cmd portal before stopping
> the device;
>
> 3) save the pending requests in the vm image and replay them
> after the vm is resumed;
>      * finally disable blocking by switching back to the fast-path for
> the cmd portal;
Is there any related patch sent out and discussed? I might have
overlooked that.

We may be able to discuss and finalize a specification for this
problem.

Thanks,
Kunkun Jiang
>> Do you have any ideas to solve this problem?
>> Looking forward to your replay.
>>
> We verified above flow can work in our internal POC.
>
> Thanks
> Kevin



