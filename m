Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1897342B24F
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 03:38:34 +0200 (CEST)
Received: from localhost ([::1]:46658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maTE1-0001HO-6J
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 21:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1maTDI-0000bv-41
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 21:37:48 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1maTDF-00082a-F8
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 21:37:47 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HTZrH6ZSCz8tcl;
 Wed, 13 Oct 2021 09:36:31 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 13 Oct 2021 09:37:38 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Wed, 13 Oct 2021 09:37:37 +0800
Subject: Re: [PATCH 1/2] hw/core/machine: Split out smp_parse as an inline API
To: Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20211010103954.20644-1-wangyanan55@huawei.com>
 <20211010103954.20644-2-wangyanan55@huawei.com>
 <8735p8xhc4.fsf@dusky.pond.sub.org>
 <b088fc9a-de73-31c9-5caa-de5f758e7a54@huawei.com>
 <87a6je48fe.fsf@dusky.pond.sub.org>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <a57ebef5-96db-5ff3-7401-e0fa44bb5fca@huawei.com>
Date: Wed, 13 Oct 2021 09:37:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87a6je48fe.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme702-chm.china.huawei.com (10.1.199.98) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 qemu-devel@nongnu.org, wanghaibin.wang@huawei.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/10/12 22:36, Markus Armbruster wrote:
> "wangyanan (Y)" <wangyanan55@huawei.com> writes:
>
>> Hi Markus,
>>
>> On 2021/10/11 13:26, Markus Armbruster wrote:
>>> Yanan Wang <wangyanan55@huawei.com> writes:
>>>
>>>> Functionally smp_parse() is only called once and in one place
>>>> i.e. machine_set_smp, the possible second place where it'll be
>>>> called should be some unit tests if any.
>>>>
>>>> Actually we are going to introduce an unit test for the parser.
>>>> For necessary isolation of the tested code, split smp_parse out
>>>> into a separate header as an inline API.
>>> Why inline?
>> The motivation of the splitting is to isolate the tested smp_parse
>> from the other unrelated code in machine.c, so that we can solve
>> the build dependency problem for the unit test.
>>
>> I once tried to split smp_parse out into a source file in [1] for the
>> test, but it looks more concise and convenient to make it as an
>> inline function in a header compared to [1]. Given that we only call
>> it in one place, it may not be harmful to keep it an inline.
>>
>> Anyway, I not sure the method in this patch is most appropriate
>> and compliant. If it's just wrong I can change back to [1]. :)
>>
>> [1]
>> https://lore.kernel.org/qemu-devel/20210910073025.16480-16-wangyanan55@huawei.com/#t
> I'd prefer to keep it in .c, but I'm not the maintainer.
>
Ok, I will move it into a separate .c file in v2, which seems to meet
the standards more.

Thanks,
Yanan


