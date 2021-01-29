Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B98F3087BF
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 11:20:21 +0100 (CET)
Received: from localhost ([::1]:36506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Qt2-0001UX-AF
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 05:20:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1l5Qqh-0006rt-DG; Fri, 29 Jan 2021 05:17:55 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1l5Qqe-0005IM-KS; Fri, 29 Jan 2021 05:17:55 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DRtY76DdzzjDvP;
 Fri, 29 Jan 2021 18:16:43 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Fri, 29 Jan 2021 18:17:38 +0800
Subject: Re: [PATCH] vfio/migrate: Move switch of dirty tracking into
 vfio_memory_listener
To: Paolo Bonzini <pbonzini@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
References: <20210111073439.20236-1-zhukeqian1@huawei.com>
 <e5f27643-441c-039c-a20c-a32c11b8d84c@redhat.com>
 <20210128200223.GJ2951@work-vm>
 <d6825e67-3533-ab81-abdb-16c2ab71cfe7@redhat.com>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <4665c997-ebf1-939d-6a94-fe0f445dbdda@huawei.com>
Date: Fri, 29 Jan 2021 18:17:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <d6825e67-3533-ab81-abdb-16c2ab71cfe7@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=zhukeqian1@huawei.com;
 helo=szxga06-in.huawei.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, jiangkunkun@huawei.com,
 Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org, Kirti Wankhede <kwankhede@nvidia.com>,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 wanghaibin.wang@huawei.com, Zenghui Yu <yuzenghui@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2021/1/29 15:49, Paolo Bonzini wrote:
> On 28/01/21 21:02, Dr. David Alan Gilbert wrote:
>> * Paolo Bonzini (pbonzini@redhat.com) wrote:
>>> On 11/01/21 08:34, Keqian Zhu wrote:
>>>> +static void vfio_listener_log_start(MemoryListener *listener,
>>>> +                                    MemoryRegionSection *section,
>>>> +                                    int old, int new)
>>>> +{
>>>> +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>>>> +
>>>> +    vfio_set_dirty_page_tracking(container, true);
>>>> +}
>>>
>>> This would enable dirty page tracking also just for having a framebuffer
>>> (DIRTY_MEMORY_VGA).  Technically it would be correct, but it would also be
>>> more heavyweight than expected.
>>
>> Wouldn't that only happen on emulated video devices?
> 
> Yes, but still it's not impossible to have both an emulated VGA and an assigned GPU or vGPU.
> 
>>> In order to only cover live migration, you can use the log_global_start and
>>> log_global_stop callbacks instead.
>>>
>>> If you want to use log_start and log_stop, you need to add respectively
>>>
>>>      if (old != 0) {
>>>          return;
>>>      }
>>>
>>> and
>>>
>>>      if (new != 0) {
>>>          return;
>>>      }
>>
>> Why 0, wouldn't you be checking for DIRTY_LOG_MIGRATION somewhere?
> 
> Actually thinking more about it log_start/log_stop are just wrong, because they would be called many times, for each MemoryRegionSection.

Agree. This will be called for each MemoryRegionSection and each time when dirty_log_mask changed.

KVM uses log_start/log_stop, because it can start dirty tracking for every memslot individually, but vfio just has global start/stop semantics.

Anyway, use global start/stop is correct choice.

Thanks,
Keqian

> 
> Paolo
> 
> .
> 

