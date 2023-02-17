Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 408EB69A649
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 08:54:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSvZi-0000xx-HZ; Fri, 17 Feb 2023 02:54:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pSvZf-0000xQ-Sy
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 02:54:31 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pSvZc-0007pE-8W
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 02:54:31 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4PJ3qk6f5lzDsXV;
 Fri, 17 Feb 2023 15:49:38 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Fri, 17 Feb 2023 15:54:24 +0800
Message-ID: <3906f328-e2e5-ec34-9a72-15a5189d78df@huawei.com>
Date: Fri, 17 Feb 2023 15:54:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC 12/52] hw/acpi: Replace MachineState.smp access with
 topology helpers
To: Zhao Liu <zhao1.liu@linux.intel.com>
CC: <qemu-devel@nongnu.org>, Zhenyu Wang <zhenyu.z.wang@intel.com>, Dapeng Mi
 <dapeng1.mi@intel.com>, Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo
 <robert.hu@linux.intel.com>, Sean Christopherson <seanjc@google.com>, Like Xu
 <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, Igor Mammedov
 <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, "Michael S .
 Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>, Markus
 Armbruster <armbru@redhat.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-13-zhao1.liu@linux.intel.com>
 <38f00a43-dc24-0a5b-e197-536c414354e7@huawei.com>
 <Y+7xEVrlsoPpLnvg@liuzhao-OptiPlex-7080>
In-Reply-To: <Y+7xEVrlsoPpLnvg@liuzhao-OptiPlex-7080>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.351,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

在 2023/2/17 11:14, Zhao Liu 写道:
> On Thu, Feb 16, 2023 at 05:31:11PM +0800, wangyanan (Y) wrote:
>> Date: Thu, 16 Feb 2023 17:31:11 +0800
>> From: "wangyanan (Y)" <wangyanan55@huawei.com>
>> Subject: Re: [RFC 12/52] hw/acpi: Replace MachineState.smp access with
>>   topology helpers
>>
>> Hi Zhao,
>>
>> 在 2023/2/13 17:49, Zhao Liu 写道:
>>> From: Zhao Liu <zhao1.liu@intel.com>
>>>
>>> At present, in QEMU only arm needs PPTT table to build cpu topology.
>>>
>>> Before QEMU's arm supports hybrid architectures, it's enough to limit
>>> the cpu topology of PPTT to smp type through the explicit smp interface
>>> (machine_topo_get_smp_threads()).
>>>
>>> Cc: Michael S. Tsirkin <mst@redhat.com>
>>> Cc: Igor Mammedov <imammedo@redhat.com>
>>> Cc: Ani Sinha <ani@anisinha.ca>
>>> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
>>> ---
>>>    hw/acpi/aml-build.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>>> index ea331a20d131..693bd8833d10 100644
>>> --- a/hw/acpi/aml-build.c
>>> +++ b/hw/acpi/aml-build.c
>>> @@ -2044,7 +2044,7 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>>>                cluster_offset = socket_offset;
>>>            }
>>> -        if (ms->smp.threads == 1) {
>>> +        if (machine_topo_get_smp_threads(ms) == 1) {
>>>                build_processor_hierarchy_node(table_data,
>>>                    (1 << 1) | /* ACPI Processor ID valid */
>>>                    (1 << 3),  /* Node is a Leaf */
>> ACPI PPTT table is designed to also support the hybrid CPU topology
>> case where nodes on the same CPU topology level can have different
>> number of child nodes.
>>
>> So to be general, the diff should be:
>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>> index ea331a20d1..dfded95bbc 100644
>> --- a/hw/acpi/aml-build.c
>> +++ b/hw/acpi/aml-build.c
>> @@ -2044,7 +2044,7 @@ void build_pptt(GArray *table_data, BIOSLinker
>> *linker, MachineState *ms,
>>               cluster_offset = socket_offset;
>>           }
>>
>> -        if (ms->smp.threads == 1) {
>> +        if (machine_topo_get_threads_by_idx(n) == 1) {
>>               build_processor_hierarchy_node(table_data,
>>                   (1 << 1) | /* ACPI Processor ID valid */
>>                   (1 << 3),  /* Node is a Leaf */
> Nice! I'll replace that.
>
>> Actually I'm recently working on ARM hmp virtualization which relys on
>> PPTT for topology representation, so we will also need PPTT to be general
>> for hybrid case anyway.
> Good to know that you are considering hybrid support for arm.
> BTW, I explained the difference between arm and x86's hybrid in previous
> email [1] [2], mainly about whether the cpm model is the same.
>
> I tentatively think that this difference can be solved by arch-specific
> coretype(). Do you have any comments on this? Thanks!
Will look at that. Thanks.
>
> [1]: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg03884.html
> [2]: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg03789.html
>
>> Thanks,
>> Yanan


