Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CDF4F0930
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Apr 2022 14:00:07 +0200 (CEST)
Received: from localhost ([::1]:43386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naytq-0004bM-Em
	for lists+qemu-devel@lfdr.de; Sun, 03 Apr 2022 08:00:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nayrX-0002MN-1m
 for qemu-devel@nongnu.org; Sun, 03 Apr 2022 07:57:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nayrV-00028s-E4
 for qemu-devel@nongnu.org; Sun, 03 Apr 2022 07:57:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648987060;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8M1/eIfsoAvPiuqO2a2owYG9l3gcphhU64e3Mhth51k=;
 b=Y3kk12MiGJ+sn4x/L+iHXV2slZTTPHtGL7H2syYAhUAPFP+JoSXA/QJMnY1EIDxBO80ibH
 sy5hj0xdzshIYv5Bibt2Bo+QxlldlcEJ511VT0fsO8x3wRadJTv3XWm+OW1vLSuJz2C2mG
 JptZV5/84ssdsGGGATIY3dZqORKee6o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-EXkAK_6KOOmweNLXWQ0gDQ-1; Sun, 03 Apr 2022 07:57:37 -0400
X-MC-Unique: EXkAK_6KOOmweNLXWQ0gDQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0710811E76;
 Sun,  3 Apr 2022 11:57:31 +0000 (UTC)
Received: from [10.72.12.82] (ovpn-12-82.pek2.redhat.com [10.72.12.82])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F2FA100404C;
 Sun,  3 Apr 2022 11:57:15 +0000 (UTC)
Subject: Re: [PATCH v3 2/4] hw/arm/virt: Fix CPU's default NUMA node ID
To: "wangyanan (Y)" <wangyanan55@huawei.com>, qemu-arm@nongnu.org
References: <20220323072438.71815-1-gshan@redhat.com>
 <20220323072438.71815-3-gshan@redhat.com>
 <a69a124c-6d13-4513-7116-0b35b7e4b11d@huawei.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <97560930-98ec-1b93-1d1a-7b96a15ff4e5@redhat.com>
Date: Sun, 3 Apr 2022 19:57:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <a69a124c-6d13-4513-7116-0b35b7e4b11d@huawei.com>
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, shan.gavin@gmail.com,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Yanan,

On 4/2/22 10:02 AM, wangyanan (Y) wrote:
> On 2022/3/23 15:24, Gavin Shan wrote:
>> When CPU-to-NUMA association isn't explicitly provided by users,
>> the default on is given by mc->get_default_cpu_node_id(). However,
> s/on/one

Will be corrected in v5.

>> the CPU topology isn't fully considered in the default association
>> and this causes CPU topology broken warnings on booting Linux guest.
>>
>> For example, the following warning messages are observed when the
>> Linux guest is booted with the following command lines.
>>
>>    /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
>>    -accel kvm -machine virt,gic-version=host               \
>>    -cpu host                                               \
>>    -smp 6,sockets=2,cores=3,threads=1                      \
>>    -m 1024M,slots=16,maxmem=64G                            \
>>    -object memory-backend-ram,id=mem0,size=128M            \
>>    -object memory-backend-ram,id=mem1,size=128M            \
>>    -object memory-backend-ram,id=mem2,size=128M            \
>>    -object memory-backend-ram,id=mem3,size=128M            \
>>    -object memory-backend-ram,id=mem4,size=128M            \
>>    -object memory-backend-ram,id=mem4,size=384M            \
>>    -numa node,nodeid=0,memdev=mem0                         \
>>    -numa node,nodeid=1,memdev=mem1                         \
>>    -numa node,nodeid=2,memdev=mem2                         \
>>    -numa node,nodeid=3,memdev=mem3                         \
>>    -numa node,nodeid=4,memdev=mem4                         \
>>    -numa node,nodeid=5,memdev=mem5
>>           :
>>    alternatives: patching kernel code
>>    BUG: arch topology borken
>>    the CLS domain not a subset of the MC domain
>>    <the above error log repeats>
>>    BUG: arch topology borken
>>    the DIE domain not a subset of the NODE domain
>>
>> With current implementation of mc->get_default_cpu_node_id(),
>> CPU#0 to CPU#5 are associated with NODE#0 to NODE#5 separately.
>> That's incorrect because CPU#0/1/2 should be associated with same
>> NUMA node because they're seated in same socket.
>>
>> This fixes the issue by considering the socket ID when the default
>> CPU-to-NUMA association is provided in virt_possible_cpu_arch_ids().
>> With this applied, no more CPU topology broken warnings are seen
>> from the Linux guest. The 6 CPUs are associated with NODE#0/1, but
>> there are no CPUs associated with NODE#2/3/4/5.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/arm/virt.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
> 

Thanks, will be included into v5 as I missed your comments in v4.
Please go ahead to review v5 directly.

Thanks,
Gavin

>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 064eac42f7..3286915229 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -2497,7 +2497,9 @@ virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
>>   static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
>>   {
>> -    return idx % ms->numa_state->num_nodes;
>> +    int64_t socket_id = ms->possible_cpus->cpus[idx].props.socket_id;
>> +
>> +    return socket_id % ms->numa_state->num_nodes;
>>   }
>>   static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
> 


