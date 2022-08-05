Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A35358A9FA
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 13:13:43 +0200 (CEST)
Received: from localhost ([::1]:46078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJvGv-0001fm-Tz
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 07:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1oJv52-0007zm-Mg
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 07:01:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1oJv4y-0006Yh-QD
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 07:01:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659697276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AC5dnjIFUDQaTDkTcEHsw3Xn+CwpgCYenvQOJA0ks9U=;
 b=bNUmlPQGQcq66H6X30vNKJ3WMrw1xL3rwayg+cXL00vid3lXHO3FlcXdjAZOHWn2/s93dY
 uXin9b6/eoFo5dbdDVl8SrCoPGbdGKHTLtCcBURdPZXjg0hlMh+iOhsD6bsjjLaqcyLRrf
 CKYAmEt8vcoNDbcJdHrmguNquNOlf2k=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-eG51SS57MT6oNAtqmjgCgw-1; Fri, 05 Aug 2022 07:01:15 -0400
X-MC-Unique: eG51SS57MT6oNAtqmjgCgw-1
Received: by mail-ed1-f69.google.com with SMTP id
 w5-20020a05640234c500b0043dda025648so1400634edc.8
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 04:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=AC5dnjIFUDQaTDkTcEHsw3Xn+CwpgCYenvQOJA0ks9U=;
 b=p9ZVC54R4FH/RxD++VaFZ1BnOXxP91NwNu/w5JmiSb0BCZ5j1e7gQXGA+GFBSepHXh
 B0GZja1cJ+vyFAQcxrNlyoPLMkPHYVaHHFeS1z82b9wEhhMeacP+3Nz+u1b+PcrdfXoX
 ht78kS9f6DSVF+YqmqTBdXgEFNJqyi83kG6NdEnfEa3jBy0+hg2wfdZLNYRyQvQpprIj
 EikEnBpTmJAR0aJ2grLyqQup+cWDS/ZiLeZRP9mVe5MfyRtganETTMDq/ZWI4xYc8ZCE
 KQHEdp5kJ4RXxElM5QFkjKa13VdTTcbndPzNSvSGObofhFrLHXLoSmfUktKo9deOqRcK
 n5NA==
X-Gm-Message-State: ACgBeo3lxt6nCc478LQMJaDpcWiiFeYZISrwEamgSForpQqEvMcT8yzI
 AoXnnZXb+3Da5BaN1TOgZ9sFWYEr1kptkWMD7gJIX/0Cu1x72H47pPIgjv/jsHcTK4N+x3ZqjCh
 l9r3MgqrYjBUkHMg=
X-Received: by 2002:a05:6402:b85:b0:43c:f8e8:96ba with SMTP id
 cf5-20020a0564020b8500b0043cf8e896bamr6205208edb.183.1659697274286; 
 Fri, 05 Aug 2022 04:01:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5a3cb6ZSacRqLYfnj1fEg51ockQ5ERDUPHryt7M20TaL91SGM1Pb1xU87YmYpdO1KiQK1DMQ==
X-Received: by 2002:a05:6402:b85:b0:43c:f8e8:96ba with SMTP id
 cf5-20020a0564020b8500b0043cf8e896bamr6205178edb.183.1659697274035; 
 Fri, 05 Aug 2022 04:01:14 -0700 (PDT)
Received: from [10.43.2.39] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 s21-20020a1709066c9500b0071cbc7487e1sm1470615ejr.69.2022.08.05.04.01.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 04:01:12 -0700 (PDT)
Message-ID: <c41ee5f5-fd9f-984f-126b-21fa371a827b@redhat.com>
Date: Fri, 5 Aug 2022 13:01:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH RFC 0/7] hostmem: NUMA-aware memory preallocation using
 ThreadContext
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
References: <20220721120732.118133-1-david@redhat.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <20220721120732.118133-1-david@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/21/22 14:07, David Hildenbrand wrote:
> This is a follow-up on "util: NUMA aware memory preallocation" [1] by
> Michal.
> 
> Setting the CPU affinity of threads from inside QEMU usually isn't
> easily possible, because we don't want QEMU -- once started and running
> guest code -- to be able to mess up the system. QEMU disallows relevant
> syscalls using seccomp, such that any such invocation will fail.
> 
> Especially for memory preallocation in memory backends, the CPU affinity
> can significantly increase guest startup time, for example, when running
> large VMs backed by huge/gigantic pages, because of NUMA effects. For
> NUMA-aware preallocation, we have to set the CPU affinity, however:
> 
> (1) Once preallocation threads are created during preallocation, management
>     tools cannot intercept anymore to change the affinity. These threads
>     are created automatically on demand.
> (2) QEMU cannot easily set the CPU affinity itself.
> (3) The CPU affinity derived from the NUMA bindings of the memory backend
>     might not necessarily be exactly the CPUs we actually want to use
>     (e.g., CPU-less NUMA nodes, CPUs that are pinned/used for other VMs).
> 
> There is an easy "workaround". If we have a thread with the right CPU
> affinity, we can simply create new threads on demand via that prepared
> context. So, all we have to do is setup and create such a context ahead
> of time, to then configure preallocation to create new threads via that
> environment.
> 
> So, let's introduce a user-creatable "thread-context" object that
> essentially consists of a context thread used to create new threads.
> QEMU can either try setting the CPU affinity itself ("cpu-affinity",
> "node-affinity" property), or upper layers can extract the thread id
> ("thread-id" property) to configure it externally.
> 
> Make memory-backends consume a thread-context object
> (via the "prealloc-context" property) and use it when preallocating to
> create new threads with the desired CPU affinity. Further, to make it
> easier to use, allow creation of "thread-context" objects, including
> setting the CPU affinity directly from QEMU, *before* enabling the
> sandbox option.
> 
> 
> Quick test on a system with 2 NUMA nodes:
> 
> Without CPU affinity:
>     time qemu-system-x86_64 \
>         -object memory-backend-memfd,id=md1,hugetlb=on,hugetlbsize=2M,size=64G,prealloc-threads=12,prealloc=on,host-nodes=0,policy=bind \
>         -nographic -monitor stdio
> 
>     real    0m5.383s
>     real    0m3.499s
>     real    0m5.129s
>     real    0m4.232s
>     real    0m5.220s
>     real    0m4.288s
>     real    0m3.582s
>     real    0m4.305s
>     real    0m5.421s
>     real    0m4.502s
> 
>     -> It heavily depends on the scheduler CPU selection
> 
> With CPU affinity:
>     time qemu-system-x86_64 \
>         -object thread-context,id=tc1,node-affinity=0 \
>         -object memory-backend-memfd,id=md1,hugetlb=on,hugetlbsize=2M,size=64G,prealloc-threads=12,prealloc=on,host-nodes=0,policy=bind,prealloc-context=tc1 \
>         -sandbox enable=on,resourcecontrol=deny \
>         -nographic -monitor stdio
> 
>     real    0m1.959s
>     real    0m1.942s
>     real    0m1.943s
>     real    0m1.941s
>     real    0m1.948s
>     real    0m1.964s
>     real    0m1.949s
>     real    0m1.948s
>     real    0m1.941s
>     real    0m1.937s
> 
> On reasonably large VMs, the speedup can be quite significant.
> 

I've timed 'virsh start' with a guest that has 47GB worth of 1GB
hugepages and seen the startup time halved basically (from 10.5s to
5.6s). The host has 4 NUMA nodes and I'm pinning the guest onto two nodes.

I've written libvirt counterpart (which I'll post as soon as these are
merged). The way it works is the whenever .prealloc-threads= is to be
used AND qemu is capable of thread-context the thread-context object is
generated before every memory-backend-*, like this:

-object
'{"qom-type":"thread-context","id":"tc-ram-node0","node-affinity":[2]}' \
-object
'{"qom-type":"memory-backend-memfd","id":"ram-node0","hugetlb":true,"hugetlbsize":1073741824,"share":true,"prealloc":true,"prealloc-threads":16,"size":21474836480,"host-nodes":[2],"policy":"bind","prealloc-context":"tc-ram-node0"}'
\
-numa node,nodeid=0,cpus=0,cpus=2,memdev=ram-node0 \
-object
'{"qom-type":"thread-context","id":"tc-ram-node1","node-affinity":[3]}' \
-object
'{"qom-type":"memory-backend-memfd","id":"ram-node1","hugetlb":true,"hugetlbsize":1073741824,"share":true,"prealloc":true,"prealloc-threads":16,"size":28991029248,"host-nodes":[3],"policy":"bind","prealloc-context":"tc-ram-node1"}'
\


Now, it's not visible in this snippet, but my code does not reuse
thread-context objects. So if there's another memfd, it'll get its own TC:

-object
'{"qom-type":"thread-context","id":"tc-memdimm0","node-affinity":[1]}' \
-object
'{"qom-type":"memory-backend-memfd","id":"memdimm0","hugetlb":true,"hugetlbsize":1073741824,"share":true,"prealloc":true,"prealloc-threads":16,"size":1073741824,"host-nodes":[1],"policy":"bind","prealloc-context":"tc-memdimm0"}'
\

The reason is that logic generating memory-backends is very complex and
separating out parts of it so that thread-context objects can be
generated first and reused by those backends would inevitably lead to
regression. I guess my question is, whether it's a problem that libvirt
would leave one additional thread, sleeping in a semaphore, for each
memory-backend (iff prealloc-threads are used).

Although, if I read the code correctly, thread-context object can be
specified AFTER memory backends, because they are parsed and created
before backends anyway. Well, something to think over the weekend.


> While this concept is currently only used for short-lived preallocation
> threads, nothing major speaks against reusing the concept for other
> threads that are harder to identify/configure -- except that
> we need additional (idle) context threads that are otherwise left unused.
> 
> [1] https://lkml.kernel.org/r/ffdcd118d59b379ede2b64745144165a40f6a813.1652165704.git.mprivozn@redhat.com
> 
> Cc: Michal Privoznik <mprivozn@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Daniel P. Berrangé" <berrange@redhat.com>
> Cc: Eduardo Habkost <eduardo@habkost.net>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Stefan Weil <sw@weilnetz.de>
> 
> David Hildenbrand (7):
>   util: Cleanup and rename os_mem_prealloc()
>   util: Introduce qemu_thread_set_affinity() and
>     qemu_thread_get_affinity()
>   util: Introduce ThreadContext user-creatable object
>   util: Add write-only "node-affinity" property for ThreadContext
>   util: Make qemu_prealloc_mem() optionally consume a ThreadContext
>   hostmem: Allow for specifying a ThreadContext for preallocation
>   vl: Allow ThreadContext objects to be created before the sandbox
>     option
> 
>  backends/hostmem.c            |  13 +-
>  hw/virtio/virtio-mem.c        |   2 +-
>  include/qemu/osdep.h          |  19 +-
>  include/qemu/thread-context.h |  58 ++++++
>  include/qemu/thread.h         |   4 +
>  include/sysemu/hostmem.h      |   2 +
>  meson.build                   |  16 ++
>  qapi/qom.json                 |  25 +++
>  softmmu/cpus.c                |   2 +-
>  softmmu/vl.c                  |  30 ++-
>  util/meson.build              |   1 +
>  util/oslib-posix.c            |  39 ++--
>  util/oslib-win32.c            |   8 +-
>  util/qemu-thread-posix.c      |  70 +++++++
>  util/qemu-thread-win32.c      |  12 ++
>  util/thread-context.c         | 363 ++++++++++++++++++++++++++++++++++
>  16 files changed, 637 insertions(+), 27 deletions(-)
>  create mode 100644 include/qemu/thread-context.h
>  create mode 100644 util/thread-context.c
> 

Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

Michal


