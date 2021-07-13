Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D22F83C6AB8
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 08:47:20 +0200 (CEST)
Received: from localhost ([::1]:43156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3CCN-0008JY-Cb
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 02:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m3CBP-0007e4-Rj
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 02:46:19 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m3CBM-0007pX-Vk
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 02:46:19 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GPB0D401hzbbnv;
 Tue, 13 Jul 2021 14:42:52 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Jul 2021 14:46:08 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 13 Jul 2021 14:46:08 +0800
Subject: Re: [RFC PATCH 3/6] pc/machine: Perform zero-check for the value of
 -smp dies
To: Andrew Jones <drjones@redhat.com>
References: <20210702100739.13672-1-wangyanan55@huawei.com>
 <20210702100739.13672-4-wangyanan55@huawei.com>
 <20210712150401.is7nxfwewf7taexa@gator>
 <20210712150540.hjgcvmpc2ciplcrj@gator>
 <20210712152741.5q64hicmt5pla472@gator>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <0cd33991-6bed-9732-e69f-24a655ba82a6@huawei.com>
Date: Tue, 13 Jul 2021 14:46:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210712152741.5q64hicmt5pla472@gator>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme716-chm.china.huawei.com (10.1.199.112) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com, Paolo
 Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/7/12 23:27, Andrew Jones wrote:
> On Mon, Jul 12, 2021 at 05:05:43PM +0200, Andrew Jones wrote:
>> On Mon, Jul 12, 2021 at 05:04:04PM +0200, Andrew Jones wrote:
>>> On Fri, Jul 02, 2021 at 06:07:36PM +0800, Yanan Wang wrote:
>>>> It's possible that dies parameter is explicitly specified as "dies=0"
>>>> in the cmdline, if so we will wrongly calculate the other ommited
>>>> parameters such as "sockets = maxcpus / (dies * cores * threads);"
>>>> with a zeroed dies value.
>>>>
>>>> So perform zero-check (default the value to 1 if zeroed) for -smp dies
>>>> before using it to calculate other parameters.
>>> OK, dies=0 may make some sense for a user that doesn't want to describe
>>> dies.
>>>
>>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>> But... this is the pc smp parse function, not the general one, so maybe my
>> comment from patch 1 should apply here as well, which is, that dies=0
>> should be an error rather than silently changed to dies=1.
> Also, after reading Daniel's comment on a later patch, I think anything=0
> should just be an error, even for the general parser.
>
Ok, after reading comments in patch #1, I also agree with this solution.
We can reject the "anything = 0" configuration in advance in function
machine_smp_parse(). I will do it in v2.

BTW, I have converted smp_parse() into a generic helper allowing future
extension for new arch-specific parameters, as you have suggested.
So that we don't need to maintain duplicated parsing code any more.

Thanks,
Yanan
.
>
>>>> Fixes: 1b45842203540 (vl.c: Add -smp, dies=* command line support and update doc)
>>>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>>>> ---
>>>>   hw/i386/pc.c | 4 +++-
>>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>>>> index a44511c937..93d1f12a49 100644
>>>> --- a/hw/i386/pc.c
>>>> +++ b/hw/i386/pc.c
>>>> @@ -714,12 +714,14 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
>>>>   {
>>>>       unsigned cpus    = config->has_cpus ? config->cpus : 0;
>>>>       unsigned sockets = config->has_sockets ? config->sockets : 0;
>>>> -    unsigned dies    = config->has_dies ? config->dies : 1;
>>>> +    unsigned dies    = config->has_dies ? config->dies : 0;
>>>>       unsigned cores   = config->has_cores ? config->cores : 0;
>>>>       unsigned threads = config->has_threads ? config->threads : 0;
>>>>       unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
>>>>   
>>>>       /* compute missing values, prefer sockets over cores over threads */
>>>> +    dies = dies > 0 ? dies : 1;
>>>> +
>>>>       if (cpus == 0 || sockets == 0) {
>>>>           cores = cores > 0 ? cores : 1;
>>>>           threads = threads > 0 ? threads : 1;
>>>> -- 
>>>> 2.19.1
>>>>
> .


