Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61328500461
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 04:39:28 +0200 (CEST)
Received: from localhost ([::1]:59476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nepOJ-0007Rk-7J
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 22:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nepN4-0006Yz-Tv
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 22:38:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nepN2-0002MJ-2w
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 22:38:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649903887;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VbQcc4+u/pp887J902bVrIBPHX3i0YNZD2HsSCyoDXY=;
 b=It+8AxHj7clctAsyXiM6F9MDB5xRxvG3+CX4941GjU7hK1bmzwnhF5JS2Mo49uXRtJOeAG
 VfiQG4iIKsN0kk8hTLXlVpP+laJvXr5T4sBmvc4JvXf8eWWb3CfYAmH/heLlHHu6cgXZrH
 Y87Fy9XcZdOqXww48ixU99CV7zDrSjc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-pQiifE7MMz-6VJKcasj9iQ-1; Wed, 13 Apr 2022 22:38:04 -0400
X-MC-Unique: pQiifE7MMz-6VJKcasj9iQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82BE580159B;
 Thu, 14 Apr 2022 02:38:03 +0000 (UTC)
Received: from [10.72.13.171] (ovpn-13-171.pek2.redhat.com [10.72.13.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4328111D3C8;
 Thu, 14 Apr 2022 02:37:58 +0000 (UTC)
Subject: Re: [PATCH v5 2/4] hw/arm/virt: Consider SMP configuration in CPU
 topology
To: "wangyanan (Y)" <wangyanan55@huawei.com>, qemu-arm@nongnu.org
References: <20220403145953.10522-1-gshan@redhat.com>
 <20220403145953.10522-3-gshan@redhat.com>
 <6f713fec-71e6-3300-a504-817f45a82a51@huawei.com>
 <27df8771-ebe0-b5fe-39c4-83696e21e3a3@redhat.com>
 <ea5ab7db-1831-83a5-1719-239930b37571@huawei.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <c49d80af-f68b-1b5c-a808-848172d88f89@redhat.com>
Date: Thu, 14 Apr 2022 10:37:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <ea5ab7db-1831-83a5-1719-239930b37571@huawei.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, shan.gavin@gmail.com,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Yanan,

On 4/14/22 10:27 AM, wangyanan (Y) wrote:
> On 2022/4/14 8:08, Gavin Shan wrote:
>> On 4/13/22 8:39 PM, wangyanan (Y) wrote:
>>> On 2022/4/3 22:59, Gavin Shan wrote:
>>>> Currently, the SMP configuration isn't considered when the CPU
>>>> topology is populated. In this case, it's impossible to provide
>>>> the default CPU-to-NUMA mapping or association based on the socket
>>>> ID of the given CPU.
>>>>
>>>> This takes account of SMP configuration when the CPU topology
>>>> is populated. The die ID for the given CPU isn't assigned since
>>>> it's not supported on arm/virt machine yet.
>>>>
>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>> ---
>>>>   hw/arm/virt.c | 16 +++++++++++++++-
>>>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>> index d2e5ecd234..3174526730 100644
>>>> --- a/hw/arm/virt.c
>>>> +++ b/hw/arm/virt.c
>>>> @@ -2505,6 +2505,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>>>>       int n;
>>>>       unsigned int max_cpus = ms->smp.max_cpus;
>>>>       VirtMachineState *vms = VIRT_MACHINE(ms);
>>>> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
>>>>       if (ms->possible_cpus) {
>>>>           assert(ms->possible_cpus->len == max_cpus);
>>>> @@ -2518,8 +2519,21 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>>>>           ms->possible_cpus->cpus[n].type = ms->cpu_type;
>>>>           ms->possible_cpus->cpus[n].arch_id =
>>>>               virt_cpu_mp_affinity(vms, n);
>>>> +
>>>> +        assert(!mc->smp_props.dies_supported);
>>>> +        ms->possible_cpus->cpus[n].props.has_socket_id = true;
>>>> +        ms->possible_cpus->cpus[n].props.socket_id =
>>>> +            (n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads)) %
>>>> +            ms->smp.sockets;
>>> No need for "% ms->smp.sockets".
>>
>> Yeah, lets remove it in v6.
>>
>>>> + ms->possible_cpus->cpus[n].props.has_cluster_id = true;
>>>> +        ms->possible_cpus->cpus[n].props.cluster_id =
>>>> +            (n / (ms->smp.cores * ms->smp.threads)) % ms->smp.clusters;
>>>> +        ms->possible_cpus->cpus[n].props.has_core_id = true;
>>>> +        ms->possible_cpus->cpus[n].props.core_id =
>>>> +            (n / ms->smp.threads) % ms->smp.cores;
>>>>           ms->possible_cpus->cpus[n].props.has_thread_id = true;
>>>> -        ms->possible_cpus->cpus[n].props.thread_id = n;
>>>> +        ms->possible_cpus->cpus[n].props.thread_id =
>>>> +            n % ms->smp.threads;
>>>>       }
>>>>       return ms->possible_cpus;
>>>>   }
>>> Otherwise, looks good to me:
>>> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
>>>
>>
>> Thanks for your time to review :)
>>
>>
> Oh, after further testing this patch breaks numa-test for aarch64,
> which should be checked and fixed. I guess it's because we have
> more IDs supported for ARM. We have to fully running the QEMU
> tests before sending some patches to ensure that they are not
> breaking anything. :)
> 

Thanks for catching the failure and reporting back. I'm not
too much familar with QEMU's test workframe. Could you please
share the detailed commands to reproduce the failure? I will
fix in v6, which will be done in a separate patch :)

Thanks,
Gavin



