Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1A45FC1A3
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 10:11:05 +0200 (CEST)
Received: from localhost ([::1]:40392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiWpU-0005kk-6u
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 04:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oiWhS-00028t-4m
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 04:02:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oiWhN-0008In-Fc
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 04:02:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665561760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8FsW61+1zDx9lYm8Zp+17Vzn2pZ1GEgG/OeSfAJ9iYg=;
 b=F5Bgo5Qfow47vjwP2eR3aUiUoFEzn8qNFBdujx5eXJ1yiwQfASJoHPhv5K4dWh+SrjO6Uu
 YGCVvW48OEPdctC9lOZpBsqebgbSrY4PLprIK9drje9mwI7dC19ehnB9lIK+W/usZW9Vep
 MFuoaOR+4mRoGcFJVf2nDzgKhE6ih0E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-xf39u4JYMSKVY1i-rwy0HA-1; Wed, 12 Oct 2022 04:02:39 -0400
X-MC-Unique: xf39u4JYMSKVY1i-rwy0HA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 985732999B4C;
 Wed, 12 Oct 2022 08:02:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C505145D850;
 Wed, 12 Oct 2022 08:02:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A025321E691D; Wed, 12 Oct 2022 10:02:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,  qemu-devel@nongnu.org,  Michal
 Privoznik <mprivozn@redhat.com>,  Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Eduardo
 Habkost <eduardo@habkost.net>,  "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>,  Eric Blake <eblake@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH v2 3/7] util: Introduce ThreadContext user-creatable object
References: <20221010091117.88603-1-david@redhat.com>
 <20221010091117.88603-4-david@redhat.com>
 <87czayj4ig.fsf@pond.sub.org>
 <e689f938-f95d-f34c-117d-da58315576fa@redhat.com>
Date: Wed, 12 Oct 2022 10:02:36 +0200
In-Reply-To: <e689f938-f95d-f34c-117d-da58315576fa@redhat.com> (David
 Hildenbrand's message of "Tue, 11 Oct 2022 09:53:49 +0200")
Message-ID: <874jw9fp0j.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

David Hildenbrand <david@redhat.com> writes:

>>> But note that due to dynamic library loading this example will not work
>>> before we actually make use of thread_context_create_thread() in QEMU
>>> code, because the type will otherwise not get registered.
>> 
>> What do you mean exactly by "not work"?  It's not "CLI option or HMP
>> command fails":
>
> For me, if I compile patch #1-#3 only, I get:
>
> $ ./build/qemu-system-x86_64 -S -display none -nodefaults -monitor stdio -object thread-context,id=tc1,cpu-affinity=0-1,cpu-affinity=6-7
> qemu-system-x86_64: invalid object type: thread-context
>
>
> Reason is that, without a call to thread_context_create_thread(), we won't trigger type_init(thread_context_register_types) and consequently, 
> the type won't be registered.
>
> Is it really different in your environment? Maybe it depends on the QEMU config?

I just tested again, and get the same result as you.  I figure my
previous test was with the complete series.

PATCH 5 appears to make it work.  Suggest to say something like "The
commit after next will make this work".

>>      $ upstream-qemu -S -display none -nodefaults -monitor stdio -object thread-context,id=tc1,cpu-affinity=0-1,cpu-affinity=6-7
>>      QEMU 7.1.50 monitor - type 'help' for more information
>>      (qemu) qom-get tc1 cpu-affinity
>>      [
>>          0,
>>          1,
>>          6,
>>          7
>>      ]
>>      (qemu) info cpus
>>      * CPU #0: thread_id=1670613
>> 
>> Even though the affinities refer to nonexistent CPUs :)
>
> CPU affinities are CPU numbers on your system (host), not QEMU vCPU numbers. I could talk about physical CPU numbers in the doc here, 
> although I am not sure if that really helps. What about "host CPU numbers" and in patch #4 "host node numbers"?

I think this would reduce the confusion opportunities for noobs like me.

> Seems to match what we document for @MemoryBackendProperties: "@host-nodes: the list of NUMA host nodes to bind the memory to"

Even better.

> But unrelated to that, pthread_setaffinity_np() won't bail out on CPUs that are currently not available in the host -- because one might 
> online/hotplug them later. It only bails out if none of the CPUs is currently available in the host:
>
> https://man7.org/linux/man-pages/man3/pthread_setaffinity_np.3.html
>
>
>        EINVAL (pthread_setaffinity_np()) The affinity bit mask mask
>               contains no processors that are currently physically on
>               the system and permitted to the thread according to any
>               restrictions that may be imposed by the "cpuset" mechanism
>               described in cpuset(7).
>
> It will bail out on CPUs that cannot be available in the host though, because it's impossible due to the kernel config:
>
>
>        EINVAL (pthread_setaffinity_np()) cpuset specified a CPU that was
>               outside the set supported by the kernel.  (The kernel
>               configuration option CONFIG_NR_CPUS defines the range of
>               the set supported by the kernel data type used to
>               represent CPU sets.)
>
>
>>> A ThreadContext can be reused, simply by reconfiguring the CPU affinity.
>> 
>> So, when a thread is created, its affinity comes from its thread context
>> (if any).  When I later change the context's affinity, it does *not*
>> affect existing threads, only future ones.  Correct?
>
> Yes, that's the current state.

Thanks!

>>> Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>

[...]

>>> diff --git a/qapi/qom.json b/qapi/qom.json
>>> index 80dd419b39..67d47f4051 100644
>>> --- a/qapi/qom.json
>>> +++ b/qapi/qom.json
>>> @@ -830,6 +830,21 @@
>>>               'reduced-phys-bits': 'uint32',
>>>               '*kernel-hashes': 'bool' } }
>>>   +##
>>> +# @ThreadContextProperties:
>>> +#
>>> +# Properties for thread context objects.
>>> +#
>>> +# @cpu-affinity: the list of CPU numbers used as CPU affinity for all threads
>>> +#                created in the thread context (default: QEMU main thread
>>> +#                affinity)
>>
>> Another ignorant question: is the QEMU main thread affinity fixed or
>> configurable?  If configurable, how?
>
> AFAIK, it's only configurable externally, for example, via "virsh emulatorpin". There is no QEMU interface to adjust that (because it 
> wouldn't work).
>
> Libvirt will essentially trigger "taskset" on the emulator thread to change its CPU affinity.

I see.

QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>


