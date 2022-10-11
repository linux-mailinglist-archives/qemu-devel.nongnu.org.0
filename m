Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE9E5FAE8E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 10:38:29 +0200 (CEST)
Received: from localhost ([::1]:38058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiAmS-0002e8-3g
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 04:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oiA5Z-0007mP-CR
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 03:54:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oiA5M-0007CO-I7
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 03:54:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665474834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FNRWK8zPojeJyXBy6sl38li5TPqYZIwbfUXOOfluKnk=;
 b=cXlj7Q1/cycB1NZgO6xifs65m7PDxTYCqXl4NWU8E/vKYqirbBYsGGuyjNMyNV++PKn9qm
 PeZI20trhZNm3Vq2KmqTFprKuSSaOgbNO8/lGm3tE0qoCDYJFLjRA3CUom1BhgSQWNUB+J
 7El5geQiOAUHZSK6+1w3e7j+iSJRMSk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-518-EXJXUtMBNUGdKPmzuz_oGQ-1; Tue, 11 Oct 2022 03:53:53 -0400
X-MC-Unique: EXJXUtMBNUGdKPmzuz_oGQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 f9-20020adfc989000000b0022b3bbc7a7eso3543055wrh.13
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 00:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FNRWK8zPojeJyXBy6sl38li5TPqYZIwbfUXOOfluKnk=;
 b=6vcAKYdVTCTokviQXY76nXWHKXCmTc/vTp6sEXTJ73iQKP2daEwlEdinxG2n7zyvv3
 /N6wvrVIa3KMyo+UZQ7UXQZrFIQMp0nH+nEnRieFK1ctkyXAGgDf3LDnHoDfmYA9F6OW
 6M63xsoYrnEzQx89T8pN/YmJN88ItlbUfyWcH8OYKm+aR1I58Kchf4SiS6kZHkObVfQn
 JLVQ2EEzNa8oj+UhGAMbdmRIu9d3+NqGgbrqUUKxSbifsbDge4qgB0SISzy+wID45vWg
 j/h0pMtEvqnsB84uVPj5PR3MmMtrOuDkuvCA7vwqY23Z+esCKh6+MEItDmWqh9NdQbaT
 yKow==
X-Gm-Message-State: ACrzQf1nV5rgkd3f4eBbzCt8sATyvcgFpkfoW9WNseQjbtlTIc5VEUA8
 QFYd2JQcSmXbTqWLwCAt3/YBqdcfTIDp4CnudeAhN2uLhThlMu8kFCTFD1c9k5frKpzSFe1s3T9
 ByS9DZfvq6awODzk=
X-Received: by 2002:a05:600c:4209:b0:3b4:fb11:3b8b with SMTP id
 x9-20020a05600c420900b003b4fb113b8bmr22050876wmh.144.1665474831686; 
 Tue, 11 Oct 2022 00:53:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5jaAmi56n2EfscvfJHARwrmP4/oLjUJgEEsisIgFXPJOf7nQYH145xscKZAgGqvEVsGLpeqA==
X-Received: by 2002:a05:600c:4209:b0:3b4:fb11:3b8b with SMTP id
 x9-20020a05600c420900b003b4fb113b8bmr22050857wmh.144.1665474831369; 
 Tue, 11 Oct 2022 00:53:51 -0700 (PDT)
Received: from ?IPV6:2003:cb:c709:6900:f110:6527:aa46:a922?
 (p200300cbc7096900f1106527aa46a922.dip0.t-ipconnect.de.
 [2003:cb:c709:6900:f110:6527:aa46:a922])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a05600c34c500b003c409244bb0sm10265137wmq.6.2022.10.11.00.53.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 00:53:50 -0700 (PDT)
Message-ID: <e689f938-f95d-f34c-117d-da58315576fa@redhat.com>
Date: Tue, 11 Oct 2022 09:53:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Michal Privoznik <mprivozn@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
References: <20221010091117.88603-1-david@redhat.com>
 <20221010091117.88603-4-david@redhat.com> <87czayj4ig.fsf@pond.sub.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 3/7] util: Introduce ThreadContext user-creatable object
In-Reply-To: <87czayj4ig.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.007, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> But note that due to dynamic library loading this example will not work
>> before we actually make use of thread_context_create_thread() in QEMU
>> code, because the type will otherwise not get registered.
> 
> What do you mean exactly by "not work"?  It's not "CLI option or HMP
> command fails":
> 

For me, if I compile patch #1-#3 only, I get:

$ ./build/qemu-system-x86_64 -S -display none -nodefaults -monitor stdio 
-object thread-context,id=tc1,cpu-affinity=0-1,cpu-affinity=6-7
qemu-system-x86_64: invalid object type: thread-context


Reason is that, without a call to thread_context_create_thread(), we 
won't trigger type_init(thread_context_register_types) and consequently, 
the type won't be registered.

Is it really different in your environment? Maybe it depends on the QEMU 
config?

>      $ upstream-qemu -S -display none -nodefaults -monitor stdio -object thread-context,id=tc1,cpu-affinity=0-1,cpu-affinity=6-7
>      QEMU 7.1.50 monitor - type 'help' for more information
>      (qemu) qom-get tc1 cpu-affinity
>      [
>          0,
>          1,
>          6,
>          7
>      ]
>      (qemu) info cpus
>      * CPU #0: thread_id=1670613
> 
> Even though the affinities refer to nonexistent CPUs :)

CPU affinities are CPU numbers on your system (host), not QEMU vCPU 
numbers. I could talk about physical CPU numbers in the doc here, 
although I am not sure if that really helps. What about "host CPU 
numbers" and in patch #4 "host node numbers"?

Seems to match what we document for @MemoryBackendProperties: 
"@host-nodes: the list of NUMA host nodes to bind the memory to"



But unrelated to that, pthread_setaffinity_np() won't bail out on CPUs 
that are currently not available in the host -- because one might 
online/hotplug them later. It only bails out if none of the CPUs is 
currently available in the host:

https://man7.org/linux/man-pages/man3/pthread_setaffinity_np.3.html


        EINVAL (pthread_setaffinity_np()) The affinity bit mask mask
               contains no processors that are currently physically on
               the system and permitted to the thread according to any
               restrictions that may be imposed by the "cpuset" mechanism
               described in cpuset(7).

It will bail out on CPUs that cannot be available in the host though, 
because it's impossible due to the kernel config:


        EINVAL (pthread_setaffinity_np()) cpuset specified a CPU that was
               outside the set supported by the kernel.  (The kernel
               configuration option CONFIG_NR_CPUS defines the range of
               the set supported by the kernel data type used to
               represent CPU sets.)


> 
>> A ThreadContext can be reused, simply by reconfiguring the CPU affinity.
> 
> So, when a thread is created, its affinity comes from its thread context
> (if any).  When I later change the context's affinity, it does *not*
> affect existing threads, only future ones.  Correct?

Yes, that's the current state.

> 
>> Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   include/qemu/thread-context.h |  57 +++++++
>>   qapi/qom.json                 |  17 +++
>>   util/meson.build              |   1 +
>>   util/oslib-posix.c            |   1 +
>>   util/thread-context.c         | 278 ++++++++++++++++++++++++++++++++++
>>   5 files changed, 354 insertions(+)
>>   create mode 100644 include/qemu/thread-context.h
>>   create mode 100644 util/thread-context.c
>>
>> diff --git a/include/qemu/thread-context.h b/include/qemu/thread-context.h
>> new file mode 100644
>> index 0000000000..2ebd6b7fe1
>> --- /dev/null
>> +++ b/include/qemu/thread-context.h
>> @@ -0,0 +1,57 @@
>> +/*
>> + * QEMU Thread Context
>> + *
>> + * Copyright Red Hat Inc., 2022
>> + *
>> + * Authors:
>> + *  David Hildenbrand <david@redhat.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#ifndef SYSEMU_THREAD_CONTEXT_H
>> +#define SYSEMU_THREAD_CONTEXT_H
>> +
>> +#include "qapi/qapi-types-machine.h"
>> +#include "qemu/thread.h"
>> +#include "qom/object.h"
>> +
>> +#define TYPE_THREAD_CONTEXT "thread-context"
>> +OBJECT_DECLARE_TYPE(ThreadContext, ThreadContextClass,
>> +                    THREAD_CONTEXT)
>> +
>> +struct ThreadContextClass {
>> +    ObjectClass parent_class;
>> +};
>> +
>> +struct ThreadContext {
>> +    /* private */
>> +    Object parent;
>> +
>> +    /* private */
>> +    unsigned int thread_id;
>> +    QemuThread thread;
>> +
>> +    /* Semaphore to wait for context thread action. */
>> +    QemuSemaphore sem;
>> +    /* Semaphore to wait for action in context thread. */
>> +    QemuSemaphore sem_thread;
>> +    /* Mutex to synchronize requests. */
>> +    QemuMutex mutex;
>> +
>> +    /* Commands for the thread to execute. */
>> +    int thread_cmd;
>> +    void *thread_cmd_data;
>> +
>> +    /* CPU affinity bitmap used for initialization. */
>> +    unsigned long *init_cpu_bitmap;
>> +    int init_cpu_nbits;
>> +};
>> +
>> +void thread_context_create_thread(ThreadContext *tc, QemuThread *thread,
>> +                                  const char *name,
>> +                                  void *(*start_routine)(void *), void *arg,
>> +                                  int mode);
>> +
>> +#endif /* SYSEMU_THREAD_CONTEXT_H */
>> diff --git a/qapi/qom.json b/qapi/qom.json
>> index 80dd419b39..67d47f4051 100644
>> --- a/qapi/qom.json
>> +++ b/qapi/qom.json
>> @@ -830,6 +830,21 @@
>>               'reduced-phys-bits': 'uint32',
>>               '*kernel-hashes': 'bool' } }
>>   
>> +##
>> +# @ThreadContextProperties:
>> +#
>> +# Properties for thread context objects.
>> +#
>> +# @cpu-affinity: the list of CPU numbers used as CPU affinity for all threads
>> +#                created in the thread context (default: QEMU main thread
>> +#                affinity)
> 
> Another ignorant question: is the QEMU main thread affinity fixed or
> configurable?  If configurable, how?

AFAIK, it's only configurable externally, for example, via "virsh 
emulatorpin". There is no QEMU interface to adjust that (because it 
wouldn't work).

Libvirt will essentially trigger "taskset" on the emulator thread to 
change its CPU affinity.

-- 
Thanks,

David / dhildenb


