Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480C13D1FDE
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 10:33:34 +0200 (CEST)
Received: from localhost ([::1]:49402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6U97-0004cp-CP
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 04:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6U8K-0003hO-Rj
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 04:32:44 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6U8H-0002jh-QE
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 04:32:44 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4GVlvD6HtCz7wb0;
 Thu, 22 Jul 2021 16:27:52 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 22 Jul 2021 16:32:29 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 22 Jul 2021 16:32:29 +0800
Subject: Re: [PATCH for-6.2 v2 00/11] machine: smp parsing fixes and
 improvement
To: Pierre Morel <pmorel@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <875yx69r7h.fsf@redhat.com> <a8dbec45-6d87-70ee-1b58-0592145e8160@huawei.com>
 <c9fc3a9b-e34e-a6a8-86cc-5e12b84b46b3@linux.ibm.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <7ee8c676-3aef-2d07-e8c7-421bbfb1955c@huawei.com>
Date: Thu, 22 Jul 2021 16:32:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <c9fc3a9b-e34e-a6a8-86cc-5e12b84b46b3@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme702-chm.china.huawei.com (10.1.199.98) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.117,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/7/22 15:51, Pierre Morel wrote:
>
>
> On 7/21/21 2:38 PM, wangyanan (Y) wrote:
>> On 2021/7/20 0:57, Cornelia Huck wrote:
>>> On Mon, Jul 19 2021, Yanan Wang <wangyanan55@huawei.com> wrote:
>>>
>>>> Hi,
>>>>
>>>> This is v2 of the series [1] that I have posted to introduce some 
>>>> smp parsing
>>>> fixes and improvement, much more work has been processed compared 
>>>> to RFC v1.
>>>>
>>>> [1] 
>>>> https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg00259.html
>>>>
>>>> The purpose of this series is to improve/fix the parsing logic. 
>>>> Explicitly
>>>> specifying a CPU topology parameter as zero is not allowed any 
>>>> more, and
>>>> maxcpus is now uniformly used to calculate the omitted parameters. 
>>>> It's also
>>>> suggested that we should start to prefer cores over sockets over 
>>>> threads on
>>>> the newer machine types, which will make the computed virtual 
>>>> topology more
>>>> reflective of the real hardware.
>>>>
>>>> In order to reduce code duplication and ease the code maintenance, 
>>>> smp_parse
>>>> in now converted into a parser generic enough for all arches, so 
>>>> that the PC
>>>> specific one can be removed. It's also convenient to introduce more 
>>>> topology
>>>> members (e.g. cluster) to the generic parser in the future.
>>> Cc:ing Pierre, as he also had been looking at the smp parsing code (for
>>> s390x) recently.
>>>
>>> Also, please keep me on cc: for patches that touch s390x.
>> Sure, I will. Sorry about the missing. :)
>>
>> Thanks,
>> Yanan
>> .
> And me too please.
> Thanks
> Pierre
>
Of course.

Thanks,
Yanan


