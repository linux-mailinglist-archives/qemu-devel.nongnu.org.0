Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 761D8508617
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 12:38:20 +0200 (CEST)
Received: from localhost ([::1]:33710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh7j1-0003K6-CQ
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 06:38:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nh7cK-0007uJ-5x
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 06:31:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nh7cI-0006hQ-4J
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 06:31:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650450681;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m9/e4yW3P7dkwFHuhc2WRFEr45ZEO0xWoQx4HPDcJUY=;
 b=ZoGAojUXeIYb/OLUV3DI5TUMKtI5It4nHifrdy1e4N7vlYjTr/tZMR4/ggvL+QdPDzjoAb
 kCkp6kPdvbbExFMBPfbhUyQxc3lrP3zHjPwK7vkrkjLvHGjUcdzGHE8utRUSDnAO+ugEhB
 3xsbIu1rgsr+zWh4akmu2BdyTr6ZFTk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-c-25if9mO5ONtjFzw0kdtw-1; Wed, 20 Apr 2022 06:31:16 -0400
X-MC-Unique: c-25if9mO5ONtjFzw0kdtw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1F09805F4E;
 Wed, 20 Apr 2022 10:31:15 +0000 (UTC)
Received: from [10.72.13.230] (ovpn-13-230.pek2.redhat.com [10.72.13.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D2E9AC27E89;
 Wed, 20 Apr 2022 10:31:05 +0000 (UTC)
Subject: Re: [PATCH v6 2/4] hw/arm/virt: Consider SMP configuration in CPU
 topology
To: Igor Mammedov <imammedo@redhat.com>
References: <20220418020920.144263-1-gshan@redhat.com>
 <20220418020920.144263-3-gshan@redhat.com>
 <20220420103248.6e3575cd@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <efb5dce0-af81-b8d7-fe7d-6a8268ab96f9@redhat.com>
Date: Wed, 20 Apr 2022 18:31:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220420103248.6e3575cd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: eduardo@habkost.net, peter.maydell@linaro.org, drjones@redhat.com,
 shan.gavin@gmail.com, mst@redhat.com, thuth@redhat.com, armbru@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 wangyanan55@huawei.com, qemu-arm@nongnu.org, Jonathan.Cameron@Huawei.com,
 ani@anisinha.ca, pbonzini@redhat.com, lvivier@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor,

On 4/20/22 4:32 PM, Igor Mammedov wrote:
> On Mon, 18 Apr 2022 10:09:18 +0800
> Gavin Shan <gshan@redhat.com> wrote:
> 
>> Currently, the SMP configuration isn't considered when the CPU
>> topology is populated. In this case, it's impossible to provide
>> the default CPU-to-NUMA mapping or association based on the socket
>> ID of the given CPU.
>>
>> This takes account of SMP configuration when the CPU topology
>> is populated. The die ID for the given CPU isn't assigned since
>> it's not supported on arm/virt machine. Besides, the used SMP
>> configuration in qtest/numa-test/aarch64_numa_cpu() is corrcted
>> to avoid testing failure
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/arm/virt.c           | 15 ++++++++++++++-
>>   tests/qtest/numa-test.c |  3 ++-
>>   2 files changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index d2e5ecd234..5443ecae92 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -2505,6 +2505,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>>       int n;
>>       unsigned int max_cpus = ms->smp.max_cpus;
>>       VirtMachineState *vms = VIRT_MACHINE(ms);
>> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
>>   
>>       if (ms->possible_cpus) {
>>           assert(ms->possible_cpus->len == max_cpus);
>> @@ -2518,8 +2519,20 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>>           ms->possible_cpus->cpus[n].type = ms->cpu_type;
>>           ms->possible_cpus->cpus[n].arch_id =
>>               virt_cpu_mp_affinity(vms, n);
>> +
>> +        assert(!mc->smp_props.dies_supported);
>> +        ms->possible_cpus->cpus[n].props.has_socket_id = true;
>> +        ms->possible_cpus->cpus[n].props.socket_id =
>> +            (n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads));
>> +        ms->possible_cpus->cpus[n].props.has_cluster_id = true;
>> +        ms->possible_cpus->cpus[n].props.cluster_id =
>> +            (n / (ms->smp.cores * ms->smp.threads)) % ms->smp.clusters;
>> +        ms->possible_cpus->cpus[n].props.has_core_id = true;
>> +        ms->possible_cpus->cpus[n].props.core_id =
>> +            (n / ms->smp.threads) % ms->smp.cores;
>>           ms->possible_cpus->cpus[n].props.has_thread_id = true;
>> -        ms->possible_cpus->cpus[n].props.thread_id = n;
>> +        ms->possible_cpus->cpus[n].props.thread_id =
>> +            n % ms->smp.threads;
>>       }
>>       return ms->possible_cpus;
>>   }
>> diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
>> index 90bf68a5b3..aeda8c774c 100644
>> --- a/tests/qtest/numa-test.c
>> +++ b/tests/qtest/numa-test.c
>> @@ -223,7 +223,8 @@ static void aarch64_numa_cpu(const void *data)
>>       QTestState *qts;
>>       g_autofree char *cli = NULL;
>>   
>> -    cli = make_cli(data, "-machine smp.cpus=2 "
>> +    cli = make_cli(data, "-machine "
>> +        "smp.cpus=2,smp.sockets=1,smp.clusters=1,smp.cores=1,smp.threads=2 "
> 
> Is cluster-less config possible?
> (looks like it used to work before and it doesn't after this series)
> 

Nope, it's impossible. This specific test case uses arm/virt machine
where cluster is always supported.mc->smp_props.clusters_supported
has been set to true in hw/arm/virt.c::virt_machine_class_init().

Exactly, the changes to virt_possible_cpu_arch_ids() included in this patch breaks
the test. It's why the fix to qtest/numa-test has been squashed to this patch, to
make it 'bit bisect' friendly as Yanan suggested.


>>           "-numa node,nodeid=0,memdev=ram -numa node,nodeid=1 "
>>           "-numa cpu,node-id=1,thread-id=0 "
>>           "-numa cpu,node-id=0,thread-id=1");

Thanks,
Gavin


