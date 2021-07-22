Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E49A3D22C3
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 13:31:49 +0200 (CEST)
Received: from localhost ([::1]:45788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6WvU-0005Yo-SN
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 07:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m6Wts-0004kd-LS
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 07:30:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m6Wtp-0006oo-BC
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 07:29:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626953395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cZ4L8yqYC2ePb8dpKjZFsmfBJsRZceAve/WUOheC0Ao=;
 b=byzNuEoAoB4SbBYWhGtf76qot3CK5Ei8Ul8NkDU9OR8pRLHQOjJzMGzun7rDOueXB3Rte0
 VxlvZERg9QMZcrc4clmWP3fYGjpUDoGHzdHE7x7AIwVI+PkQdA/skV53p4rLDken8Bnjo1
 LQnENGcBAaoFPbBbk9tnYXiYdzuTx1o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-BC36Dwm0O5WvQjVVluNwtA-1; Thu, 22 Jul 2021 07:29:54 -0400
X-MC-Unique: BC36Dwm0O5WvQjVVluNwtA-1
Received: by mail-wr1-f70.google.com with SMTP id
 k3-20020a5d52430000b0290138092aea94so2343036wrc.20
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 04:29:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cZ4L8yqYC2ePb8dpKjZFsmfBJsRZceAve/WUOheC0Ao=;
 b=VxFeDzTJ69y5Uljq3C526hZqBsIh9Z12Nuk0QnZ+3+IsWlLPZ8BYzWdiA2SrRwnsh+
 NJuzX4aok9T4lXKDSofh5kYiar8sVVdbbSWyMDDK2+o7TbETvg6T7rIEL3ZHEORTCSlm
 YqF+wfqeqgk+vd9pw5g3YmE7rOKlWk1rR7yH5MY0ME3f4t08FjToX9wvjsuPpn/G10qM
 KcT/rVP3SoB98qTnRCn245m5vyr0raq+QOk10HnRGmACC8xFCICUR5YpByGEJAjzx2T7
 tFeadpsNPn6zY96g/NB9jvc6M6i42xLETGrKr+H9Ir5yHZvtMTOEdYBuoqiP78RKUR5K
 31EQ==
X-Gm-Message-State: AOAM531wlGRY5T2E5RW3vFBn7kBgJVY2hYpSJ/r2nSHonmpEEUfMsqgC
 bjeR+v4yOdCdi7KHZGN80pFAJjctgLtmo+0VzHFkVGmiD/FVzq9J2WbcVMTywxTCD5rZ1pysJQz
 eRP3P0AwdHZ+xCTs=
X-Received: by 2002:a1c:7e53:: with SMTP id z80mr5778518wmc.153.1626953393483; 
 Thu, 22 Jul 2021 04:29:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8LUwxdlUokSYMhpkV+85EYwhyWrhJlDYjd2y0F68p3mBUTC9nd97FRCxH3D8eYpthOVrXiw==
X-Received: by 2002:a1c:7e53:: with SMTP id z80mr5778487wmc.153.1626953393208; 
 Thu, 22 Jul 2021 04:29:53 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id n5sm28645822wri.31.2021.07.22.04.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 04:29:49 -0700 (PDT)
Date: Thu, 22 Jul 2021 12:29:46 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 0/6] migration/ram: Optimize for virtio-mem via
 RamDiscardManager
Message-ID: <YPlWqs8N+NiFH/yj@work-vm>
References: <20210721092759.21368-1-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210721092759.21368-1-david@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* David Hildenbrand (david@redhat.com) wrote:
> virtio-mem exposes a dynamic amount of memory within RAMBlocks by
> coordinating with the VM. Memory within a RAMBlock can either get
> plugged and consequently used by the VM, or unplugged and consequently no
> longer used by the VM. Logical unplug is realized by discarding the
> physical memory backing for virtual memory ranges, similar to memory
> ballooning.
> 
> However, important difference to virtio-balloon are:
> 
> a) A virtio-mem device only operates on its assigned memory region /
>    RAMBlock ("device memory")
> b) Initially, all device memory is logically unplugged
> c) Virtual machines will never accidentally reuse memory that is currently
>    logically unplugged. The spec defines most accesses to unplugged memory
>    as "undefined behavior" -- except reading unplugged memory, which is
>    currently expected to work, but that will change in the future.
> d) The (un)plug granularity is in the range of megabytes -- "memory blocks"
> e) The state (plugged/unplugged) of a memory block is always known and
>    properly tracked.
> 
> Whenever memory blocks within the RAMBlock get (un)plugged, changes are
> communicated via the RamDiscardManager to other QEMU subsystems, most
> prominently vfio which updates the DMA mapping accordingly. "Unplugging"
> corresponds to "discarding" and "plugging" corresponds to "populating".
> 
> While migrating (precopy/postcopy) that state of such memory blocks cannot
> change.

So no plugging/unplugging can happen during the migration?

> We never ever want to migrate such logically unplugged memory,
> because it can result in an unintended memory consumption both, on the
> source (when reading memory from some memory backends) and on the
> destination (when writing memory). Further, migration time can be heavily
> reduced when skipping logically unplugged blocks and we avoid populating
> unnecessary page tables in Linux.
> 
> Right now, virtio-mem reuses the free page hinting infrastructure during
> precopy to exclude all logically unplugged ("discarded") parts from the
> migration stream. However, there are some scenarios that are not handled
> properly and need fixing. Further, there are some ugly corner cases in
> postcopy code and background snapshotting code that similarly have to
> handle such special RAMBlocks.
> 
> Let's reuse the RamDiscardManager infrastructure to essentially handle
> precopy, postcopy and background snapshots cleanly, which means:
> 
> a) In precopy code, always clearing all dirty bits from the bitmap that
>    correspond to discarded range, whenever we update the dirty bitmap. This
>    results in logically unplugged memory to never get migrated.

Have you seen cases where discarded areas are being marked as dirty?
That suggests something somewhere is writing to them and shouldn't be.

Dave

> b) In postcopy code, placing a zeropage when requested to handle a page
>    falling into a discarded range -- because the source will never send it.
> c) In background snapshot code, never populating discarded ranges, not even
>    with the shared zeropage, to avoid unintended memory consumption,
>    especially in the future with hugetlb and shmem.
> 
> Detail: When realizing a virtio-mem devices, it will register the RAM
>         for migration via vmstate_register_ram(). Further, it will
>         set itself as the RamDiscardManager for the corresponding memory
>         region of the RAMBlock via memory_region_set_ram_discard_manager().
>         Last but not least, memory device code will actually map the
>         memory region into guest physical address space. So migration
>         code can always properly identify such RAMBlocks.
> 
> Tested with precopy/postcopy on shmem, where even reading unpopulated
> memory ranges will populate actual memory and not the shared zeropage.
> Tested with background snapshots on anonymous memory, because other
> backends are not supported yet with upstream Linux.
> 
> Idealy, this should all go via the migration tree.
> 
> v1 -> v2:
> - "migration/ram: Handle RAMBlocks with a RamDiscardManager on the
>    migration source"
> -- Added a note how it interacts with the clear_bmap and what we might want
>    to further optimize in the future when synchronizing bitmaps.
> 
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
> Cc: Marek Kedzierski <mkedzier@redhat.com>
> Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
> Cc: teawater <teawaterz@linux.alibaba.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
> 
> David Hildenbrand (6):
>   memory: Introduce replay_discarded callback for RamDiscardManager
>   virtio-mem: Implement replay_discarded RamDiscardManager callback
>   migration/ram: Handle RAMBlocks with a RamDiscardManager on the
>     migration source
>   virtio-mem: Drop precopy notifier
>   migration/postcopy: Handle RAMBlocks with a RamDiscardManager on the
>     destination
>   migration/ram: Handle RAMBlocks with a RamDiscardManager on background
>     snapshots
> 
>  hw/virtio/virtio-mem.c         |  92 +++++++++++++--------
>  include/exec/memory.h          |  21 +++++
>  include/hw/virtio/virtio-mem.h |   3 -
>  migration/postcopy-ram.c       |  25 +++++-
>  migration/ram.c                | 147 ++++++++++++++++++++++++++++++---
>  migration/ram.h                |   1 +
>  softmmu/memory.c               |  11 +++
>  7 files changed, 246 insertions(+), 54 deletions(-)
> 
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


