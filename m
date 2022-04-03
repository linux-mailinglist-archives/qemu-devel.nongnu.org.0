Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 932C84F08D0
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Apr 2022 12:52:10 +0200 (CEST)
Received: from localhost ([::1]:34498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naxq4-0000B9-Ai
	for lists+qemu-devel@lfdr.de; Sun, 03 Apr 2022 06:52:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1naxmV-0006zc-Pj
 for qemu-devel@nongnu.org; Sun, 03 Apr 2022 06:48:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1naxmT-0008Gi-28
 for qemu-devel@nongnu.org; Sun, 03 Apr 2022 06:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648982904;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UYw3wN8HR62CbXyVWDGuunk04pRh30+eHbdN4l9yMe0=;
 b=B08eKhjLrZgZccku7S26da86QlcpK0uWfjE9EU7vujWXpRan1FbaLu4ufgtvQE0Eh8e206
 PvnoSru7ADYl7KxclULPPsGtqJWwLnsAaygeesuFCeb2W77zE7vrgrYRQoPuQv60iEN93V
 MWdnODW4j9p4wWQNQ9kWrcBx9q3ZWOA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-q7-4qP_VMECFXFkOlYqrGQ-1; Sun, 03 Apr 2022 06:48:21 -0400
X-MC-Unique: q7-4qP_VMECFXFkOlYqrGQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49E0B3801EC0;
 Sun,  3 Apr 2022 10:48:21 +0000 (UTC)
Received: from [10.72.12.82] (ovpn-12-82.pek2.redhat.com [10.72.12.82])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D0B8555901;
 Sun,  3 Apr 2022 10:48:16 +0000 (UTC)
Subject: Re: [PATCH v3 1/4] hw/arm/virt: Consider SMP configuration in CPU
 topology
To: Igor Mammedov <imammedo@redhat.com>
References: <20220323072438.71815-1-gshan@redhat.com>
 <20220323072438.71815-2-gshan@redhat.com>
 <20220330151832.3da04abf@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <3e4ee12d-0dc9-15e9-3e22-3f39e57582dd@redhat.com>
Date: Sun, 3 Apr 2022 18:48:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220330151832.3da04abf@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor,

On 3/30/22 9:18 PM, Igor Mammedov wrote:
> On Wed, 23 Mar 2022 15:24:35 +0800
> Gavin Shan <gshan@redhat.com> wrote:
> 
>> Currently, the SMP configuration isn't considered when the CPU
>> topology is populated. In this case, it's impossible to provide
>> the default CPU-to-NUMA mapping or association based on the socket
>> ID of the given CPU.
>>
>> This takes account of SMP configuration when the CPU topology
>> is populated. The die ID for the given CPU isn't assigned since
>> it's not supported on arm/virt machine yet. Besides, the cluster
>> ID for the given CPU is assigned because it has been supported
>> on arm/virt machine.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/arm/virt.c     | 11 +++++++++++
>>   qapi/machine.json |  6 ++++--
>>   2 files changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index d2e5ecd234..064eac42f7 100644
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
>> @@ -2518,6 +2519,16 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>>           ms->possible_cpus->cpus[n].type = ms->cpu_type;
>>           ms->possible_cpus->cpus[n].arch_id =
>>               virt_cpu_mp_affinity(vms, n);
>> +
>> +        assert(!mc->smp_props.dies_supported);
>> +        ms->possible_cpus->cpus[n].props.has_socket_id = true;
>> +        ms->possible_cpus->cpus[n].props.socket_id =
>> +            n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads);
>> +        ms->possible_cpus->cpus[n].props.has_cluster_id = true;
>> +        ms->possible_cpus->cpus[n].props.cluster_id =
>> +            n / (ms->smp.cores * ms->smp.threads);
>> +        ms->possible_cpus->cpus[n].props.has_core_id = true;
>> +        ms->possible_cpus->cpus[n].props.core_id = n / ms->smp.threads;
>>           ms->possible_cpus->cpus[n].props.has_thread_id = true;
>>           ms->possible_cpus->cpus[n].props.thread_id = n;
> 
> shouldn't be above values calculated similar to the way they are
> calculated in x86_topo_ids_from_idx()? /note '% foo' part/
> 

I think it's fine not to have '% foo' here. However, I think it'd
better to have the similar '% foo' as x86 does. I will add this part
in v4.

>>       }
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index 42fc68403d..99c945f258 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -868,10 +868,11 @@
>>   # @node-id: NUMA node ID the CPU belongs to
>>   # @socket-id: socket number within node/board the CPU belongs to
>>   # @die-id: die number within socket the CPU belongs to (since 4.1)
>> -# @core-id: core number within die the CPU belongs to
>> +# @cluster-id: cluster number within die the CPU belongs to
>> +# @core-id: core number within cluster the CPU belongs to
>>   # @thread-id: thread number within core the CPU belongs to
>>   #
>> -# Note: currently there are 5 properties that could be present
>> +# Note: currently there are 6 properties that could be present
>>   #       but management should be prepared to pass through other
>>   #       properties with device_add command to allow for future
>>   #       interface extension. This also requires the filed names to be kept in
>> @@ -883,6 +884,7 @@
>>     'data': { '*node-id': 'int',
>>               '*socket-id': 'int',
>>               '*die-id': 'int',
>> +            '*cluster-id': 'int',
>>               '*core-id': 'int',
>>               '*thread-id': 'int'
>>     }

Thanks,
Gavin


