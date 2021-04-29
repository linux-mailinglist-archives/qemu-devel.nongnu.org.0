Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D5336E339
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 04:23:10 +0200 (CEST)
Received: from localhost ([::1]:39654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbwKa-0001Ji-Jp
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 22:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lbwJJ-0000lF-2o; Wed, 28 Apr 2021 22:21:49 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lbwJF-0001Rb-Bt; Wed, 28 Apr 2021 22:21:48 -0400
Received: from dggeml763-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FVzgp6bshz5vvn;
 Thu, 29 Apr 2021 10:18:30 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggeml763-chm.china.huawei.com (10.1.199.173) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 29 Apr 2021 10:21:38 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 29 Apr 2021 10:21:38 +0800
Subject: Re: [RFC PATCH v2 6/6] hw/arm/virt: Replace smp_parse with one that
 prefers cores
To: Andrew Jones <drjones@redhat.com>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-7-wangyanan55@huawei.com>
 <20210427145856.5qaetgzdl6ovnoni@gator.home>
 <f3d5172b-13a5-a8d3-8cdb-03788e43fc52@huawei.com>
 <20210428101310.cwkjm53kftffw3th@gator>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <2815924f-4b19-0dda-2d0f-5a18be168ce9@huawei.com>
Date: Thu, 29 Apr 2021 10:21:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210428101310.cwkjm53kftffw3th@gator>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme701-chm.china.huawei.com (10.1.199.97) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm@nongnu.org, Alistair
 Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 yangyicong@huawei.com, yuzenghui@huawei.com, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com, Jiajie Li <lijiajie11@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Drew,

On 2021/4/28 18:13, Andrew Jones wrote:
> On Wed, Apr 28, 2021 at 05:36:43PM +0800, wangyanan (Y) wrote:
>> On 2021/4/27 22:58, Andrew Jones wrote:
>>> On Tue, Apr 13, 2021 at 04:07:45PM +0800, Yanan Wang wrote:
>>>> From: Andrew Jones <drjones@redhat.com>
>>>>
>>>> The virt machine type has never used the CPU topology parameters, other
>>>> than number of online CPUs and max CPUs. When choosing how to allocate
>>>> those CPUs the default has been to assume cores. In preparation for
>>>> using the other CPU topology parameters let's use an smp_parse that
>>>> prefers cores over sockets. We can also enforce the topology matches
>>>> max_cpus check because we have no legacy to preserve.
>>>>
>>>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>>>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>>>> ---
>>>>    hw/arm/virt.c | 76 +++++++++++++++++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 76 insertions(+)
>>> Thanks, this patch matches [1]. Of course, I've always considered this
>>> patch to be something of an RFC, though. Is there any harm in defaulting
>>> to sockets over cores? If not, I wonder if we shouldn't just leave the
>>> default as it is to avoid a mach-virt specific smp parser. The "no
>>> topology" compat variable will keep existing machine types from switching
>>> from cores to sockets, so we don't need to worry about that.
>>>
>>> [1] https://github.com/rhdrjones/qemu/commit/c0670b1bccb4d08c7cf7c6957cc8878a2af131dd
>> For CPU topology population, ARM64 kernel will firstly try to parse ACPI
>> PPTT table
>> and then DT in function init_cpu_topology(), if failed it will rely on the
>> MPIDR value
>> in function store_cpu_topology(). But MPIDR can not be trusted and is
>> ignored for
>> any topology deduction. And instead, topology of one single socket with
>> multiple
>> cores is made, which can not represent the real underlying system topology.
>> I think this is the reason why VMs will in default prefer cores over sockets
>> if no
>> topology description is provided.
>>
>> With the feature introduced by this series, guest kernel can successfully
>> get cpu
>> information from one of the two (ACPI or DT) for topology population.
>>
>> According to above analysis, IMO, whether the parsing logic is "sockets over
>> cores" or
>> "cores over sockets", it just provide different topology information and
>> consequently
>> different scheduling performance. Apart from this, I think there will not
>> any harm or
>> problems caused.
>>
>> So maybe it's fine that we just use the arch-neutral parsing logic?
>> How do you think ?
> Can you do an experiment where you create a guest with N vcpus, where N is
> the number of cores in a single socket. Then, pin each of those vcpus to a
> core in a single physical socket. Then, boot the VM with a topology of one
> socket and N cores and run some benchmarks. Then, boot the VM again with N
> sockets, one core each, and run the same benchmarks.
>
> I'm guessing we'll see the same benchmark numbers (within noise allowance)
> for both the runs. If we don't see the same numbers, then that'd be
> interesting.
Yes, I can do the experiment, and will post the results later.

Thanks,
Yanan
> Thanks,
> drew
>
> .

