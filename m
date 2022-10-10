Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0885F9D01
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 12:42:04 +0200 (CEST)
Received: from localhost ([::1]:37632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohqEV-0002jG-Fc
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 06:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ohqD6-0001GO-Tx
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 06:40:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ohqD3-0007R8-DT
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 06:40:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665398432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZsLzo1H3pVCS7MzbIe0v/PWsQ1KBfsF6Zct3VzgO7bI=;
 b=MyHTpIKvUoVvA7QHgUXLnbPE3n0qXkA5vPmSxTDK0WmwNITiw972L7giunMX/M50DOl14w
 A+rrf1Bwk88MxUHiCjVL2HOjppWmbK3DHLfWkE3ajChCNyWx54lgphx8pOmaGBlfjXx7li
 H59QdpG46Ge7tQ43+9OLqnFDZCHtLZ0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-611-Cu6LkeLOMsCT1VCFeBy7KA-1; Mon, 10 Oct 2022 06:40:29 -0400
X-MC-Unique: Cu6LkeLOMsCT1VCFeBy7KA-1
Received: by mail-wm1-f70.google.com with SMTP id
 v23-20020a1cf717000000b003bff630f31aso2987058wmh.5
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 03:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZsLzo1H3pVCS7MzbIe0v/PWsQ1KBfsF6Zct3VzgO7bI=;
 b=3+5naM8RNyYNOyo6jXjm/RWNvBIxVhU85hmaPT7e+tBG2YXk9Oc1IO3wHoSOigc9LM
 yB6w4v3EaC5h9/Lz+VsJMj+wFXyWgV+D66GT5+SceWtjkaLBQKbDshS0VYBF8ruS0H+s
 88BZIxdRMYjn0/6weSsDNK9R6WO8qbLuEmDFyrJM1iu8rHUB8o0RoEy4zpKtVRI/zIJS
 R2XCKGcMgkdM9h5H3gNy/YczOwNLgIXUqh3TVdZVQM4j3hW3135O6YlO6knc4fWDFEne
 bOju1NVlAL4gYwl/IotBw1tvh49mcxtDp/92XGvA9pkVKxX8mzOp1OnnvoJ4NfkMxy+E
 yO6g==
X-Gm-Message-State: ACrzQf0KpVbtjWnqMdaP/bpesLinWdhRK9eYUd6tF41EptO4D7FMuG9g
 12WFBb0y6bcZq98ITV4VnrM2R5SfTeqPYpvu8otyKgTYgG89mbfiMevccVv29rKdbQrdKToscfM
 UBnq7+7lOwDh7S64=
X-Received: by 2002:a05:600c:19cd:b0:3b9:af1f:1b3b with SMTP id
 u13-20020a05600c19cd00b003b9af1f1b3bmr19030346wmq.37.1665398428059; 
 Mon, 10 Oct 2022 03:40:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7NVCln6UXREAL9iMaDGZqfzOVOFuZSU/3fuwMtMoB+XYgh99D39uQ9D0jqZpntj2o0zPlnvg==
X-Received: by 2002:a05:600c:19cd:b0:3b9:af1f:1b3b with SMTP id
 u13-20020a05600c19cd00b003b9af1f1b3bmr19030324wmq.37.1665398427799; 
 Mon, 10 Oct 2022 03:40:27 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c3b0400b003c6bd12ac27sm1360524wms.37.2022.10.10.03.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 03:40:27 -0700 (PDT)
Date: Mon, 10 Oct 2022 11:40:25 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Michal Privoznik <mprivozn@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH v2 0/7] hostmem: NUMA-aware memory preallocation using
 ThreadContext
Message-ID: <Y0P2mQcHpXlXbEY1@work-vm>
References: <20221010091117.88603-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221010091117.88603-1-david@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* David Hildenbrand (david@redhat.com) wrote:
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
> setting the CPU affinity directly from QEMU, before enabling the
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
> While this concept is currently only used for short-lived preallocation
> threads, nothing major speaks against reusing the concept for other
> threads that are harder to identify/configure -- except that
> we need additional (idle) context threads that are otherwise left unused.
> 
> This series does not yet tackle concurrent preallocation of memory
> backends. Memory backend objects are created and memory is preallocated one
> memory backend at a time -- and there is currently no way to do
> preallocation asynchronously.

Since you seem to have a full set of r-b's - do you intend to merge this
as-is or do the cuncurrenct preallocation first?

Dave

> [1] https://lkml.kernel.org/r/ffdcd118d59b379ede2b64745144165a40f6a813.1652165704.git.mprivozn@redhat.com
> 
> v1 -> v2:
> * Fixed some minor style nits
> * "util: Introduce ThreadContext user-creatable object"
>  -> Impove documentation and patch description. [Markus]
> * "util: Add write-only "node-affinity" property for ThreadContext"
>  -> Impove documentation and patch description. [Markus]
> 
> RFC -> v1:
> * "vl: Allow ThreadContext objects to be created before the sandbox option"
>  -> Move parsing of the "name" property before object_create_pre_sandbox
> * Added RB's
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
>  include/qemu/thread-context.h |  57 ++++++
>  include/qemu/thread.h         |   4 +
>  include/sysemu/hostmem.h      |   2 +
>  meson.build                   |  16 ++
>  qapi/qom.json                 |  28 +++
>  softmmu/cpus.c                |   2 +-
>  softmmu/vl.c                  |  36 +++-
>  util/meson.build              |   1 +
>  util/oslib-posix.c            |  39 ++--
>  util/oslib-win32.c            |   8 +-
>  util/qemu-thread-posix.c      |  70 +++++++
>  util/qemu-thread-win32.c      |  12 ++
>  util/thread-context.c         | 362 ++++++++++++++++++++++++++++++++++
>  16 files changed, 641 insertions(+), 30 deletions(-)
>  create mode 100644 include/qemu/thread-context.h
>  create mode 100644 util/thread-context.c
> 
> -- 
> 2.37.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


