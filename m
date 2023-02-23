Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABADE6A0632
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:28:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV8pR-0003xE-Tw; Thu, 23 Feb 2023 05:27:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pV8p2-0003hH-4Z
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:27:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pV8ou-0003xW-5t
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:27:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677148041;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YJRwTGv2UP/uEuY9Pvhkxxlf3gJzYAz7jifALb2+4O4=;
 b=ZoChZ1lMeIPDHcNf+JM6mIqZrTa9mNsw4eM7MGV+/U0SFtrFAUJ/edADcalriGezX2vyyz
 eDIIaN3lcvYwUDJ5ipqrO32CKPPfVW/Qi57SetJS7RAs/zUO0cguvPD0eNSPsBC09sXlYj
 tkj2y8pxkaKd7fEnxBhZAz+hEVxYB90=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-uS8___QyPRSYKMf4Hcps4w-1; Thu, 23 Feb 2023 05:27:16 -0500
X-MC-Unique: uS8___QyPRSYKMf4Hcps4w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65E5485A588;
 Thu, 23 Feb 2023 10:27:15 +0000 (UTC)
Received: from [10.64.54.168] (vpn2-54-168.bne.redhat.com [10.64.54.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CEA2404BEC0;
 Thu, 23 Feb 2023 10:27:07 +0000 (UTC)
Subject: Re: [PATCH v2 2/4] numa: Validate socket and NUMA node boundary if
 required
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, thuth@redhat.com,
 lvivier@redhat.com, pbonzini@redhat.com, imammedo@redhat.com,
 yihyu@redhat.com, shan.gavin@gmail.com
References: <20230223081401.248835-1-gshan@redhat.com>
 <20230223081401.248835-3-gshan@redhat.com>
 <1fd1606c-3dde-b780-14f7-d8a9ae4dedf5@linaro.org>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <da57ead6-6a15-414b-4992-337a5d6dd932@redhat.com>
Date: Thu, 23 Feb 2023 21:27:05 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <1fd1606c-3dde-b780-14f7-d8a9ae4dedf5@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.102, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/23/23 8:05 PM, Philippe Mathieu-Daudé wrote:
> On 23/2/23 09:13, Gavin Shan wrote:
>> For some architectures like ARM64, multiple CPUs in one socket can't be
>> associated with different NUMA nodes. Otherwise, the guest kernel is confused
>> about the CPU topology. For example, the following warning message is observed
>> from linux guest with the below command lines.
>>
>>    -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
>>    -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
>>    -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
>>    -numa node,nodeid=2,cpus=4-5,memdev=ram2                \
>>
>>    ------------[ cut here ]------------
>>    WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2271 build_sched_domains+0x284/0x910
>>    Modules linked in:
>>    CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-268.el9.aarch64 #1
>>    pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>    pc : build_sched_domains+0x284/0x910
>>    lr : build_sched_domains+0x184/0x910
>>    sp : ffff80000804bd50
>>    x29: ffff80000804bd50 x28: 0000000000000002 x27: 0000000000000000
>>    x26: ffff800009cf9a80 x25: 0000000000000000 x24: ffff800009cbf840
>>    x23: ffff000080325000 x22: ffff0000005df800 x21: ffff80000a4ce508
>>    x20: 0000000000000000 x19: ffff000080324440 x18: 0000000000000014
>>    x17: 00000000388925c0 x16: 000000005386a066 x15: 000000009c10cc2e
>>    x14: 00000000000001c0 x13: 0000000000000001 x12: ffff00007fffb1a0
>>    x11: ffff00007fffb180 x10: ffff80000a4ce508 x9 : 0000000000000041
>>    x8 : ffff80000a4ce500 x7 : ffff80000a4cf920 x6 : 0000000000000001
>>    x5 : 0000000000000001 x4 : 0000000000000007 x3 : 0000000000000002
>>    x2 : 0000000000001000 x1 : ffff80000a4cf928 x0 : 0000000000000001
>>    Call trace:
>>     build_sched_domains+0x284/0x910
>>     sched_init_domains+0xac/0xe0
>>     sched_init_smp+0x48/0xc8
>>     kernel_init_freeable+0x140/0x1ac
>>     kernel_init+0x28/0x140
>>     ret_from_fork+0x10/0x20
>>
>> Improve the sitation to reject the configuration where multiple CPUs
> 
> Typo "situation".
> 

Yes, I will fix it up in next revision.

>> in one socket have been associated with different NUMA nodes. The
>> newly introduced helper set_numa_socket_boundary() is expected to
>> called by specific machines (boards) where the boundary is required.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/core/machine.c     | 34 ++++++++++++++++++++++++++++++++++
>>   hw/core/numa.c        |  7 +++++++
>>   include/sysemu/numa.h |  4 ++++
>>   3 files changed, 45 insertions(+)
> 
> 
>> diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
>> index 4173ef2afa..160008fff4 100644
>> --- a/include/sysemu/numa.h
>> +++ b/include/sysemu/numa.h
>> @@ -86,6 +86,9 @@ struct NumaState {
>>       /* Detect if HMAT support is enabled. */
>>       bool hmat_enabled;
>> +    /* CPUs in one socket can't break socket boundary */
>> +    bool have_socket_boundary;
> 
> This field belong to MachineClass, please add it as
> numa_have_socket_boundary just after to numa_mem_supported.
> 
> Next patches become:
> 
> ---
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index f778cb6d09..a48f1b2329 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -864,6 +864,7 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
>       mc->possible_cpu_arch_ids = sbsa_ref_possible_cpu_arch_ids;
>       mc->cpu_index_to_instance_props = sbsa_ref_cpu_index_to_props;
>       mc->get_default_cpu_node_id = sbsa_ref_get_default_cpu_node_id;
> +    mc->numa_have_socket_boundary = true;
>   }
> ---
> 
> Otherwise LGTM :)
> 

Thanks, Philippe. It makes sense to have the field in MachineClass and the
changes will be included in next revision.

Thanks,
Gavin


