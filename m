Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 351AD66D6FA
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 08:32:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHgRI-0000I3-Cj; Tue, 17 Jan 2023 02:31:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pHgRA-0000Gj-CJ
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 02:31:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pHgR7-0003Nl-TG
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 02:31:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673940673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=97RK27ckw8/r+KYWQgIrxRst7KulfFflGfzx+fO9zRs=;
 b=buRWQwtNCY6FIDRSEA18PTrRvOl3DTOaUOa9P89kJ/HIMvdkcaQESfhb1TWO56lq1R69jx
 XATHIp6V2MhtlBEAe84N2vEpju10D0qdxE3RGbkNh8rxCrhHp0MJVauMzqvTexbvPpVlmg
 ixPQfpjvUAQncP2mOOaM8cy/UTxbaVY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-457-BtLHPlf3OnOGHQNN7bhAVA-1; Tue, 17 Jan 2023 02:31:04 -0500
X-MC-Unique: BtLHPlf3OnOGHQNN7bhAVA-1
Received: by mail-qv1-f69.google.com with SMTP id
 lv8-20020a056214578800b0053477624294so5755972qvb.22
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 23:31:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=97RK27ckw8/r+KYWQgIrxRst7KulfFflGfzx+fO9zRs=;
 b=phihLndduaio9aICcbgudGtwNFB4+kQ5GcwejuDqaAPak9uRzK/EGeobfPJbDMa1l4
 ujuz8TUctavFyCSw+ATBRL1+gTWJ96VE8/WkLZIBewY7IaA8O+81Dv8Qum++cMQLzrkN
 0FXJPO1GFTTGrWZM0woXgkokiWjn5oickEHb4tDyO54PZ1MG3SMg7BBJe3gY5X4kFsf0
 jtTptlqCVLZ6IGCdiRZ7NjNQP6JCvD/fniCdPgSL+WgMZPHoa7kBCKVbutQD+y2Vlieu
 x7GZzqRzJXTx7LCSKMBaJAzcx/D7jq3UapKvHUgZ5GtXsJjl7ipVwm3DuJhhR5/sgA7y
 RI8w==
X-Gm-Message-State: AFqh2krfHbLVVFE3MfJjgeR6M1dl/Lubr54/8Gswjyr8TDvvVHiM6JRx
 yy+DzGSn8aMIXUTc2u15tJmiUsT7wAXKdpy83xjzxxPSAgWZaJ4rq/PCd2FGbmV5jcdHUNT3Qao
 RRITiz7KPFdTmhfE=
X-Received: by 2002:ac8:776f:0:b0:3a7:e426:2892 with SMTP id
 h15-20020ac8776f000000b003a7e4262892mr33783127qtu.28.1673940664018; 
 Mon, 16 Jan 2023 23:31:04 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtzZ7EW5Lb8eu56Fos1h5kpdcYpwG9mTkEqgzzm8sbzMR6n0vImc79K4Th2JSuaaB/pXAbRpg==
X-Received: by 2002:ac8:776f:0:b0:3a7:e426:2892 with SMTP id
 h15-20020ac8776f000000b003a7e4262892mr33783104qtu.28.1673940663770; 
 Mon, 16 Jan 2023 23:31:03 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-26.web.vodafone.de.
 [109.43.177.26]) by smtp.gmail.com with ESMTPSA id
 p16-20020a05620a057000b006fa12a74c53sm19391429qkp.61.2023.01.16.23.30.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 23:31:03 -0800 (PST)
Message-ID: <cd9e0c88-c2a8-1eca-d146-3fd6639af3e7@redhat.com>
Date: Tue, 17 Jan 2023 08:30:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v14 08/11] qapi/s390/cpu topology: change-topology monitor
 command
Content-Language: en-US
To: Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-9-pmorel@linux.ibm.com>
 <72baa5b42abe557cdf123889b33b845b405cc86c.camel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <72baa5b42abe557cdf123889b33b845b405cc86c.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16/01/2023 22.09, Nina Schoetterl-Glausch wrote:
> On Thu, 2023-01-05 at 15:53 +0100, Pierre Morel wrote:
>> The modification of the CPU attributes are done through a monitor
>> commands.
>>
>> It allows to move the core inside the topology tree to optimise
>> the cache usage in the case the host's hypervizor previously
>> moved the CPU.
>>
>> The same command allows to modifiy the CPU attributes modifiers
>> like polarization entitlement and the dedicated attribute to notify
>> the guest if the host admin modified scheduling or dedication of a vCPU.
>>
>> With this knowledge the guest has the possibility to optimize the
>> usage of the vCPUs.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
...
>> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
>> index b69955a1cd..0faffe657e 100644
>> --- a/hw/s390x/cpu-topology.c
>> +++ b/hw/s390x/cpu-topology.c
>> @@ -18,6 +18,10 @@
>>   #include "target/s390x/cpu.h"
>>   #include "hw/s390x/s390-virtio-ccw.h"
>>   #include "hw/s390x/cpu-topology.h"
>> +#include "qapi/qapi-commands-machine-target.h"
>> +#include "qapi/qmp/qdict.h"
>> +#include "monitor/hmp.h"
>> +#include "monitor/monitor.h"
>>   
>>   /*
>>    * s390_topology is used to keep the topology information.
>> @@ -203,6 +207,21 @@ static void s390_topology_set_entry(S390TopologyEntry *entry,
>>       s390_topology.sockets[s390_socket_nb(id)]++;
>>   }
>>   
>> +/**
>> + * s390_topology_clear_entry:
>> + * @entry: Topology entry to setup
>> + * @id: topology id to use for the setup
>> + *
>> + * Clear the core bit inside the topology mask and
>> + * decrements the number of cores for the socket.
>> + */
>> +static void s390_topology_clear_entry(S390TopologyEntry *entry,
>> +                                      s390_topology_id id)
>> +{
>> +    clear_bit(63 - id.core, &entry->mask);
> 
> This doesn't take the origin into account.
> 
>> +    s390_topology.sockets[s390_socket_nb(id)]--;
> 
> I suppose this function cannot run concurrently, so the same CPU doesn't get removed twice.

QEMU has the so-called BQL - the Big Qemu Lock. Instructions handlers are 
normally called with the lock taken, see qemu_mutex_lock_iothread() in 
target/s390x/kvm/kvm.c.

(if you feel unsure, you can add a "assert(qemu_mutex_iothread_locked())" 
statement, but I think it is not necessary here)

  Thomas


