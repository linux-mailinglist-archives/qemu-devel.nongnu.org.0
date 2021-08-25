Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA8D3F72B4
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:10:15 +0200 (CEST)
Received: from localhost ([::1]:50046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIprK-0008T1-Cs
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:10:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mIpqQ-0007Ni-D4
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:09:18 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mIpqO-0003bO-7N
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:09:18 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GvhS13TqzzbdLP;
 Wed, 25 Aug 2021 18:05:21 +0800 (CST)
Received: from dggpeml500016.china.huawei.com (7.185.36.70) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 25 Aug 2021 18:09:10 +0800
Received: from [10.174.148.223] (10.174.148.223) by
 dggpeml500016.china.huawei.com (7.185.36.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 25 Aug 2021 18:09:09 +0800
Subject: Re: [PATCH 0/5] optimize the downtime for vfio migration
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <alex.williamson@redhat.com>, <mst@redhat.com>, <marcel.apfelbaum@gmail.com>, 
 <pbonzini@redhat.com>
References: <20210825075620.2607-1-longpeng2@huawei.com>
 <b5dc6ce0-6134-f711-ce85-b69e287a220d@redhat.com>
From: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
Message-ID: <8a467a08-23d0-e14c-fde2-8cb96d64d0bb@huawei.com>
Date: Wed, 25 Aug 2021 18:09:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b5dc6ce0-6134-f711-ce85-b69e287a220d@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500016.china.huawei.com (7.185.36.70)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=longpeng2@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.305,
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
Cc: Juan Quintela <quintela@redhat.com>, arei.gonglei@huawei.com,
 huangzhichao@huawei.com, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/8/25 18:05, Philippe Mathieu-Daudé 写道:
> Cc'ing David/Juan for migration big picture (just in case).
> 
> On 8/25/21 9:56 AM, Longpeng(Mike) wrote:
>> In vfio migration resume phase, the cost would increase if the
>> vfio device has more unmasked vectors. We try to optimize it in
>> this series.
>>
>> Patch 1 & 2 are simple code cleanups.
>> Patch 3 defers to set irqs to vfio core.
>> Patch 4 & 5 defer to commit the route to KVM core. 
>>
>> The test VM has 128 vcpus and 8 VF (with 65 vectors enabled),
>> we mesure the cost of the vfio_msix_enable for each one, and
>> we can see the total cost can be significantly reduced.
>>
>>         Origin         Apply Patch 3     Apply Patch 3/4/5   
>> 1st     8              4                 2
>> 2nd     15             11                2
>> 3rd     22             18                2
>> 4th     24             25                3
>> 5th     36             33                2
>> 6th     44             40                3
>> 7th     51             47                3
>> 8th     58             54                4
>> Total   258ms          232ms             21ms
>>
>>
>> Longpeng (Mike) (5):
>>   vfio: use helper to simplfy the failure path in vfio_msi_enable
>>   msix: simplfy the conditional in msix_set/unset_vector_notifiers
>>   vfio: defer to enable msix in migration resume phase
>>   kvm: irqchip: support defer to commit the route
>>   vfio: defer to commit kvm route in migraiton resume phase
> 
> Overall makes sense and LGTM but migration/KVM are not my area :/
>
Thanks all the same :)

> .
> 

