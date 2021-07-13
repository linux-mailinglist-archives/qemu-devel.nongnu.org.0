Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA743C6ADD
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 08:59:20 +0200 (CEST)
Received: from localhost ([::1]:50042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3CNz-00067f-6j
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 02:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m3CLV-0004r4-Um
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 02:56:45 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m3CLT-0007xr-4z
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 02:56:45 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4GPB9b40Fdz1CJP9;
 Tue, 13 Jul 2021 14:50:59 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Jul 2021 14:56:34 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 13 Jul 2021 14:56:34 +0800
Subject: Re: [RFC PATCH 2/6] machine: Perform zero-check for the computed
 value of sockets
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>, Andrew Jones
 <drjones@redhat.com>
References: <20210702100739.13672-1-wangyanan55@huawei.com>
 <20210702100739.13672-3-wangyanan55@huawei.com>
 <20210712150048.mstqbseixgdxakkf@gator> <YOxf+sxzUSJdbY+j@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <5f6d5f07-84bb-b553-2e46-c863f25faee5@huawei.com>
Date: Tue, 13 Jul 2021 14:56:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <YOxf+sxzUSJdbY+j@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme707-chm.china.huawei.com (10.1.199.103) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.479,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 yuzenghui@huawei.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/7/12 23:30, Daniel P. Berrangé wrote:
> On Mon, Jul 12, 2021 at 05:00:48PM +0200, Andrew Jones wrote:
>> On Fri, Jul 02, 2021 at 06:07:35PM +0800, Yanan Wang wrote:
>>> We currently perform zero-check (default the value to 1 if zeroed)
>>> for the computed values of cores/threads, to make sure they are at
>>> least 1. For consistency, we probably should also default sockets
>>> to 1 if the computed value is zero. Note that this won't affect
>>> any existing working cmdlines but will improve the error reporting
>>> of the invalid ones such as "-smp 8,maxcpus=9,cores=10,threads=1".
>> How does this help error checking? If the user input values that compute a
>> fractional (rounded down to zero with integer division) value, then we'll
>> catch that with the sockets*cores*threads == maxcpus test now, but we may
>> not catch that after this patch.
> Since we're having alot of debates about what should be valid scenarios
> vs invalid scenarios, I think this points towards introducing a tests
> for the smp_parse function, that enumerates both the correct and
> incorrect scenarios based on the current implementation.
I think so! Actually I'm already working on a simple QEMU unit test
(test-smp-parse.c) for smp parsing and plan to post it in v2. But it
will directly test the finally improved generic parser.

Thanks,
Yanan
.
> This series should then update the test cases for scenarios that we
> think are currently wrongly handled.
>
>> Thanks,
>> drew
>>
>>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>>> ---
>>>   hw/core/machine.c | 1 +
>>>   hw/i386/pc.c      | 1 +
>>>   2 files changed, 2 insertions(+)
>>>
>>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>>> index f17bbe3275..1e194677cd 100644
>>> --- a/hw/core/machine.c
>>> +++ b/hw/core/machine.c
>>> @@ -761,6 +761,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>>>           } else {
>>>               maxcpus = maxcpus > 0 ? maxcpus : cpus;
>>>               sockets = maxcpus / (cores * threads);
>>> +            sockets = sockets > 0 ? sockets : 1;
>>>           }
>>>       } else if (cores == 0) {
>>>           threads = threads > 0 ? threads : 1;
>>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>>> index a9b22fdc01..a44511c937 100644
>>> --- a/hw/i386/pc.c
>>> +++ b/hw/i386/pc.c
>>> @@ -729,6 +729,7 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
>>>           } else {
>>>               maxcpus = maxcpus > 0 ? maxcpus : cpus;
>>>               sockets = maxcpus / (dies * cores * threads);
>>> +            sockets = sockets > 0 ? sockets : 1;
>>>           }
>>>       } else if (cores == 0) {
>>>           threads = threads > 0 ? threads : 1;
>>> -- 
>>> 2.19.1
>>>
> Regards,
> Daniel


