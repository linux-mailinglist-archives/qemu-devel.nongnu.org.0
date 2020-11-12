Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C68732AFBF3
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 02:31:14 +0100 (CET)
Received: from localhost ([::1]:45280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd1SD-00044v-CZ
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 20:31:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kd1QH-0003Xc-QJ
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 20:29:15 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kd1QB-00088B-Ha
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 20:29:12 -0500
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4CWkWy72Y0z546R;
 Thu, 12 Nov 2020 09:28:46 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEMM405-HUB.china.huawei.com (10.3.20.213) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Thu, 12 Nov 2020 09:28:56 +0800
Received: from [10.174.185.187] (10.174.185.187) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Thu, 12 Nov 2020 09:28:56 +0800
Subject: Re: [PATCH] ACPI: Avoid infinite recursion when dump-vmstate
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>
References: <20201019093156.2993284-1-liangpeng10@huawei.com>
 <20201023180933.2fe23875@redhat.com> <20201023185441.GP3038@work-vm>
 <be52cdde-33de-d519-6509-5f0900ce4c36@huawei.com>
 <20201111140112.GE3232@work-vm> <20201111181306.20ebdd77@redhat.com>
 <20201111172635.GJ3232@work-vm>
From: Peng Liang <liangpeng10@huawei.com>
Message-ID: <2d5308f7-780b-1cbc-86bb-073b3339af31@huawei.com>
Date: Thu, 12 Nov 2020 09:28:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20201111172635.GJ3232@work-vm>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.187]
X-ClientProxiedBy: dggeme711-chm.china.huawei.com (10.1.199.107) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=liangpeng10@huawei.com; helo=szxga02-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 20:28:57
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: mst@redhat.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/2020 1:26 AM, Dr. David Alan Gilbert wrote:
> * Igor Mammedov (imammedo@redhat.com) wrote:
>> On Wed, 11 Nov 2020 14:01:12 +0000
>> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
>>
>>> Is someone taking a fix for this in 5.2 - it's breaking vmstate
>>> comparison.
>> can you merge it via migration tree?
> 
> I could; Peng: Could you give a sign-off for this version ?
> 
> Dave

OK, I'll send it as soon as possible.

Thanks,
Peng

> 
>> [...]
>>
>> for fixed up version below
>> Acked-by: Igor Mammedov <imammedo@redhat.com>
>>
>>>>
>>>> Do you mean that we need another VMStateDescription to describe
>>>> AcpiGhesState instead of using VMSTATE_UINT64 directly?  Maybe like this:
>>>>
>>>> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
>>>> index 6df400e1ee16..5454be67d5f0 100644
>>>> --- a/hw/acpi/generic_event_device.c
>>>> +++ b/hw/acpi/generic_event_device.c
>>>> @@ -322,6 +322,16 @@ static const VMStateDescription vmstate_ged_state = {
>>>>      }
>>>>  };
>>>>
>>>> +static const VMStateDescription vmstate_ghes = {
>>>> +    .name = "acpi-ghes",
>>>> +    .version_id = 1,
>>>> +    .minimum_version_id = 1,
>>>> +    .fields     = (VMStateField[]) {
>>>> +        VMSTATE_UINT64(ghes_addr_le, AcpiGhesState),
>>>> +        VMSTATE_END_OF_LIST()
>>>> +    },
>>>> +};
>>>> +
>>>>  static bool ghes_needed(void *opaque)
>>>>  {
>>>>      AcpiGedState *s = opaque;
>>>> @@ -335,7 +345,7 @@ static const VMStateDescription vmstate_ghes_state = {
>>>>      .needed = ghes_needed,
>>>>      .fields      = (VMStateField[]) {
>>>>          VMSTATE_STRUCT(ghes_state, AcpiGedState, 1,
>>>> -                       vmstate_ghes_state, AcpiGhesState),
>>>> +                       vmstate_ghes, AcpiGhesState),
>>>>          VMSTATE_END_OF_LIST()
>>>>      }
>>>>  };
>>>>
>>>> -- 
>>>> Thanks,
>>>> Peng
>>>>   
>>


