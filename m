Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E10553A4320
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 15:36:59 +0200 (CEST)
Received: from localhost ([::1]:56106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrhLG-0007g9-MJ
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 09:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lrhJH-0006rX-W9
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 09:34:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lrhJF-0001Iq-3G
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 09:34:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623418492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=he/lxKKUoP1SLA3CeHHdo8NW0ypIuuO/HVp4DpX/QmM=;
 b=KrDEfKPfUdr1sCjEoL1rez26ELtycgvFV5vqn+zr2QfpWQJVK+F3mqKF9gVINtAzyja6CP
 bP0HnpaazC6UdhXhqppzBc/J0FMPzaoeTvid/fLzsLQNlFaua4p2N+N/v/dRigzUeQeePs
 UTrhBtvHLBW3IVwWWmSqy7dztvfaJwQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326--Gh9xak4NI2NBMtXxXot_Q-1; Fri, 11 Jun 2021 09:34:50 -0400
X-MC-Unique: -Gh9xak4NI2NBMtXxXot_Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 r4-20020a7bc0840000b02901b7cb5713ecso2311593wmh.1
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 06:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=he/lxKKUoP1SLA3CeHHdo8NW0ypIuuO/HVp4DpX/QmM=;
 b=ace03nXndRoU9ha4cY1/Ke3IIMqpHSnmKUQmqxfKYSc1WJVQUf/5gp1/MUOqQrbu7U
 TyEE1+7ucUSk3IUj+nXM53cXHXXM9atyCgc+l+KKhJ9Ptjjy9oFvNTvN/9OX0xbfOkyf
 nj3ht0jyLxHuy+0ePx+WtngKvy4wUrSVXcWZUt5CAhY99aT9TnkB1h2C+rOjspPNpe+c
 iCOEZtwEZCWRnkmiP+iorJO441rMTW72mNggFjQAG+MBPoP4qiIeMWOeWvIk0Ps8WWyZ
 2SduYjDnUIvTQNWnTTDh/3rNN2JqXcuLa4F2ydKdyvJqOeW4jNdp7Q4vDBQym62GAaPM
 pK6A==
X-Gm-Message-State: AOAM5313c/D9349Nv1+zscx5ot0WbtRyqSSH385NgB1hB9t9POZi7Ckd
 ImH+XlwclM56B064vJYDJX2TAlbGR/maYFSMJG6giGn5SNeYKpTDUHrPm7knHOnEp6Y7v1EyxxA
 MqfU9BKwrdGMGiOc=
X-Received: by 2002:a7b:c935:: with SMTP id h21mr20141173wml.183.1623418489585; 
 Fri, 11 Jun 2021 06:34:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIUlpMoeoifK4dnZ9xVBWXOYQmRUTmcH8TAC/ib2zG2uZdGTJyYR6r0UtAc1yZESxdqvjZHw==
X-Received: by 2002:a7b:c935:: with SMTP id h21mr20141140wml.183.1623418489221; 
 Fri, 11 Jun 2021 06:34:49 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e27sm7737805wra.50.2021.06.11.06.34.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 06:34:48 -0700 (PDT)
Subject: Re: [PATCH v8 00/15] RAM_NORESERVE, MAP_NORESERVE and hostmem
 "reserve" property
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210510114328.21835-1-david@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a6efbfaf-c33c-0fb2-bb34-2ca4240cb05c@redhat.com>
Date: Fri, 11 Jun 2021 15:34:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210510114328.21835-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/05/21 13:43, David Hildenbrand wrote:
> Based-on: 20210406080126.24010-1-david@redhat.com

Queued both the dependent series and this one, thanks.  Sorry for the delay.

Paolo

> Some cleanups previously sent in other context (resizeable allocations),
> followed by RAM_NORESERVE, implementing it under Linux using MAP_NORESERVE,
> and letting users configure it for memory backens using the "reserve"
> property (default: true).
> 
> MAP_NORESERVE under Linux has in the context of QEMU an effect on
> 1) Private/shared anonymous memory
> -> memory-backend-ram,id=mem0,size=10G
> 2) Private fd-based mappings
> -> memory-backend-file,id=mem0,size=10G,mem-path=/dev/shm/0
> -> memory-backend-memfd,id=mem0,size=10G
> 3) Private/shared hugetlb mappings
> -> memory-backend-memfd,id=mem0,size=10G,hugetlb=on,hugetlbsize=2M
> 
> With MAP_NORESERVE/"reserve=off", we won't be reserving swap space (1/2) or
> huge pages (3) for the whole memory region.
> 
> The target use case is virtio-mem, which dynamically exposes memory
> inside a large, sparse memory area to the VM. MAP_NORESERVE tells the OS
> "this mapping might be very sparse". This essentially allows
> avoiding having to set "/proc/sys/vm/overcommit_memory == 1") when using
> virtio-mem and also supporting hugetlbfs in the future.
> 
> Later, upper layers are expected to specify "reserve=off" only for
> memory backends assigned to virtio-mem devices, not all VM memory. To make
> mistakes by users less severe, we're, for example, working on preallocation
> of memory in virtio-mem itself, to be upstreamed later.
> 
> 
> v7 -> v8:
> - "hostmem: Wire up RAM_NORESERVE via "reserve" property"
> -- Make the "reserve" property depend on CONFIG_LINUX
> -- Add missing (since 6.1) to qom json
> - "qmp: Include "reserve" property of memory backends"
> -- Make the "reserve" value optional, depending on availability of the
>     "reserve" property
> - "hmp: Print "reserve" property of memory backends with "info memdev""
> -- Print only with "has_reserve"
> 
> v6 -> v7:
> - Collected ACKs and RBs
> - "hostmem: Wire up RAM_NORESERVE via "reserve" property"
> -- Extended qapi/qom.json documentation
> - "qmp: Include "reserve" property of memory backends"
> -- Extended property description
> 
> v5 -> v6:
> - "softmmu/memory: Pass ram_flags to memory_region_init ..."
> -- Split up into two patches
> ---> "softmmu/memory: Pass ram_flags to memory_region.."
> ---> "softmmu/memory: Pass ram_flags to qemu_ram_alloc() ..."
> -- Also set RAM_PREALLOC from qemu_ram_alloc_from_ptr()
> - Collected acks/rbs
> 
> v4 -> v5:
> - Sent out shared anonymous RAM fixes separately
> - Rebased
> - "hostmem: Wire up RAM_NORESERVE via "reserve" property"
> -- Adjusted/simplified description of new "reserve" property
> -- Properly add it to qapi/qom.json
> - "qmp: Clarify memory backend properties returned via query-memdev"
> -- Added
> - "qmp: Include "share" property of memory backends"
> -- Added
> - "hmp: Print "share" property of memory backends with "info memdev""
> - Added
> - "qmp: Include "reserve" property of memory backends"
> -- Adjust description of new "reserve" property
> 
> v3 -> v4:
> - Minor comment/description updates
> - "softmmu/physmem: Fix ram_block_discard_range() to handle shared ..."
> -- Extended description
> - "util/mmap-alloc: Pass flags instead of separate bools to ..."
> -- Move flags to include/qemu/osdep.h and rename to "QEMU_MAP_*"
> - "memory: Introduce RAM_NORESERVE and wire it up in qemu_ram_mmap()"
> -- Adjust to new flags. Handle errors in mmap_activate() for now.
> - "util/mmap-alloc: Support RAM_NORESERVE via MAP_NORESERVE under Linux"
> -- Restrict support to Linux only for now
> - "qmp: Include "reserve" property of memory backends"
> -- Added
> - "hmp: Print "reserve" property of memory backends with ..."
> -- Added
> 
> v2 -> v3:
> - Renamed "softmmu/physmem: Drop "shared" parameter from ram_block_add()"
>    to "softmmu/physmem: Mark shared anonymous memory RAM_SHARED" and
>    adjusted the description
> - Added "softmmu/physmem: Fix ram_block_discard_range() to handle shared
>    anonymous memory"
> - Added "softmmu/physmem: Fix qemu_ram_remap() to handle shared anonymous
>    memory"
> - Added "util/mmap-alloc: Pass flags instead of separate bools to
>    qemu_ram_mmap()"
> - "util/mmap-alloc: Support RAM_NORESERVE via MAP_NORESERVE"
> -- Further tweak code comments
> -- Handle shared anonymous memory
> 
> v1 -> v2:
> - Rebased to upstream and phs_mem_alloc simplifications
> -- Upsteam added the "map_offset" parameter to many RAM allocation
>     interfaces.
> - "softmmu/physmem: Drop "shared" parameter from ram_block_add()"
> -- Use local variable "shared"
> - "memory: introduce RAM_NORESERVE and wire it up in qemu_ram_mmap()"
> -- Simplify due to phs_mem_alloc changes
> - "util/mmap-alloc: Support RAM_NORESERVE via MAP_NORESERVE"
> -- Add a whole bunch of comments.
> -- Exclude shared anonymous memory that QEMU doesn't use
> -- Special-case readonly mappings
> 
> Cc: Peter Xu <peterx@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: "Philippe Mathieu-Daudé" <philmd@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: Liam Merwick <liam.merwick@oracle.com>
> Cc: Marcel Apfelbaum <mapfelba@redhat.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Michal Privoznik <mprivozn@redhat.com>
> Cc: Marek Kedzierski <mkedzier@redhat.com>
> 
> David Hildenbrand (15):
>    util/mmap-alloc: Factor out calculation of the pagesize for the guard
>      page
>    util/mmap-alloc: Factor out reserving of a memory region to
>      mmap_reserve()
>    util/mmap-alloc: Factor out activating of memory to mmap_activate()
>    softmmu/memory: Pass ram_flags to qemu_ram_alloc_from_fd()
>    softmmu/memory: Pass ram_flags to
>      memory_region_init_ram_shared_nomigrate()
>    softmmu/memory: Pass ram_flags to qemu_ram_alloc() and
>      qemu_ram_alloc_internal()
>    util/mmap-alloc: Pass flags instead of separate bools to
>      qemu_ram_mmap()
>    memory: Introduce RAM_NORESERVE and wire it up in qemu_ram_mmap()
>    util/mmap-alloc: Support RAM_NORESERVE via MAP_NORESERVE under Linux
>    hostmem: Wire up RAM_NORESERVE via "reserve" property
>    qmp: Clarify memory backend properties returned via query-memdev
>    qmp: Include "share" property of memory backends
>    hmp: Print "share" property of memory backends with "info memdev"
>    qmp: Include "reserve" property of memory backends
>    hmp: Print "reserve" property of memory backends with "info memdev"
> 
>   backends/hostmem-file.c                       |  11 +-
>   backends/hostmem-memfd.c                      |   8 +-
>   backends/hostmem-ram.c                        |   7 +-
>   backends/hostmem.c                            |  36 +++
>   hw/core/machine-hmp-cmds.c                    |   6 +
>   hw/core/machine-qmp-cmds.c                    |   8 +
>   hw/m68k/next-cube.c                           |   4 +-
>   hw/misc/ivshmem.c                             |   5 +-
>   include/exec/cpu-common.h                     |   1 +
>   include/exec/memory.h                         |  42 ++--
>   include/exec/ram_addr.h                       |   9 +-
>   include/qemu/mmap-alloc.h                     |  16 +-
>   include/qemu/osdep.h                          |  30 ++-
>   include/sysemu/hostmem.h                      |   2 +-
>   migration/ram.c                               |   3 +-
>   qapi/machine.json                             |  16 +-
>   qapi/qom.json                                 |  10 +
>   .../memory-region-housekeeping.cocci          |   8 +-
>   softmmu/memory.c                              |  27 ++-
>   softmmu/physmem.c                             |  51 +++--
>   util/mmap-alloc.c                             | 212 +++++++++++++-----
>   util/oslib-posix.c                            |   7 +-
>   util/oslib-win32.c                            |  13 +-
>   23 files changed, 374 insertions(+), 158 deletions(-)
> 


