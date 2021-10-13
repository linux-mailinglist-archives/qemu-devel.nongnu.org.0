Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 278AF42C7BF
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 19:37:17 +0200 (CEST)
Received: from localhost ([::1]:41276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maiBn-0006IJ-PB
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 13:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1maiA2-00047M-3s
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 13:35:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mai9t-0001lI-14
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 13:35:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634146513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ChU5xXnYfai3E6k5Ge7B1U8KPG8c5iCz5k6LSmWyzAs=;
 b=Yhq3Q6VwhFjWi69/npuCHYd6BB1U68srQd3QJb25+01y3ucMGmI8mgpEJcoHGIF+SVmtvL
 ZwbEWZ+00POuaDSdEepwuoWg20ngS3bdHmARpN6erwo6dbSnujpQaQ9HEbaE7y5rvKA/CB
 pnYuaSHT9Td9Z4ijjDX5qqgEfZRxBCo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-tDGISkRQMV-4k5_TzQPgKw-1; Wed, 13 Oct 2021 13:35:10 -0400
X-MC-Unique: tDGISkRQMV-4k5_TzQPgKw-1
Received: by mail-wr1-f69.google.com with SMTP id
 d13-20020adfa34d000000b00160aa1cc5f1so2546720wrb.14
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 10:35:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ChU5xXnYfai3E6k5Ge7B1U8KPG8c5iCz5k6LSmWyzAs=;
 b=Oi36UeDyIqFGUzVbNErAAWV7Bl44OMTj3HX7HQOk/1t7E9CFRYDRea2qMUbSrjdxlU
 AMOsva/f1TVeytiB8hDRfNVoakuGg/4GTuDPATRTKmJgtR4GyWulBL91bpmBMkN740VW
 brY0POFGCA15E5XQ4BnjlYJ7/hD6vxB+huf2L5icKsR4v+wkfp3pouHR0/i6iJR2HXou
 yDYiSLw1Jayh5DtjV3BPJwoRMFIzJ9TINDOi9IVc0r4OY7jhExtifwloyWJE5rS4HrMF
 ZkGR1TnTiW2+5LIW2VisZi8v18E+Pt3opXtNGqxGnPf0Y8zRAiGEmCsrAQeo+Y4glwDs
 /eYg==
X-Gm-Message-State: AOAM532GGmfriDdzVmCJr1SH5rOxWZhrl5MuB48+DsZFWyNt2E5hB3hp
 7YN+f5VinUi+zh34vOlKDmnU+b2OlIG7vDL4PeZcLbPodM5hJ8HMbglp0tvwhC3wDvYw1yMynHA
 BI7x6azyAnRhnzXc=
X-Received: by 2002:a05:600c:35d0:: with SMTP id
 r16mr11651193wmq.97.1634146509608; 
 Wed, 13 Oct 2021 10:35:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx30n3PlyIt91TRo/pJPAPbSt1yjkvQRQPrICDuvLCGook0F3S1EwhVWB6egAMTEx7xsP8gMw==
X-Received: by 2002:a05:600c:35d0:: with SMTP id
 r16mr11651163wmq.97.1634146509343; 
 Wed, 13 Oct 2021 10:35:09 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id x24sm6491108wmk.31.2021.10.13.10.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 10:35:08 -0700 (PDT)
Date: Wed, 13 Oct 2021 18:35:06 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 0/9] migration/ram: Optimize for virtio-mem via
 RamDiscardManager
Message-ID: <YWcYytiOeLGNh7gv@work-vm>
References: <20211011175346.15499-1-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211011175346.15499-1-david@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* David Hildenbrand (david@redhat.com) wrote:
> This series is fully reviewed by Peter and I hope we can get either more
> review feedback or get it merged via the migration tree soonish. Thanks.

Yep, I think that's a full set now; we should take this via migration.

Dave

> ---
> 
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
> change, as virtio-mem will reject any guest requests that would change
> the state of blocks with "busy". We don't want to migrate such logically
> unplugged memory, because it can result in an unintended memory consumption
> both, on the source (when reading memory from some memory backends) and on
> the destination (when writing memory). Further, migration time can be
> heavily reduced when skipping logically unplugged blocks and we avoid
> populating unnecessary page tables in Linux.
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
> a) In precopy code, fixing up the initial dirty bitmaps (in the RAMBlock
>    and e.g., KVM) to exclude discarded ranges.
> b) In postcopy code, placing a zeropage when requested to handle a page
>    falling into a discarded range -- because the source will never send it.
>    Further, fix up the dirty bitmap when overwriting it in recovery mode.
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
> 
> v5 -> v6:
> - Rebased and added ACKs
> 
> v4 -> v5:
> - "migration/postcopy: Handle RAMBlocks with a RamDiscardManager on the
>    destination"
> -- Use ROUND_DOWN and fix compile warning on 32 bit
> -- Use int128_make64() instead of wrongly int128_get64()
> - "migration: Simplify alignment and alignment checks"
> -- Use ROUND_DOWN where possible instead of QEMU_ALIGN_DOWN and fix
>    compilation warning on 32 bit
> - "migration/ram: Factor out populating pages readable in
>    ram_block_populate_pages()"
> -- Rename functions, add a comment.
> - "migration/ram: Handle RAMBlocks with a RamDiscardManager on background
>    snapshots"
> -- Adjust to changed function names
> 
> v3 -> v4:
> - Added ACKs
> - "migration/postcopy: Handle RAMBlocks with a RamDiscardManager on the
>    destination"
> -- Use QEMU_ALIGN_DOWN() to align to ram pagesize
> - "migration: Simplify alignment and alignment checks"
> -- Added
> - "migration/ram: Factor out populating pages readable in
>    ram_block_populate_pages()"
> -- Added
> - "migration/ram: Handle RAMBlocks with a RamDiscardManager on background
>    snapshots"
> -- Simplified due to factored out code
> 
> v2 -> v3:
> - "migration/ram: Don't passs RAMState to
>    migration_clear_memory_region_dirty_bitmap_*()"
> -- Added to make the next patch easier to implement
> - "migration/ram: Handle RAMBlocks with a RamDiscardManager on the migration
>    source"
> -- Fixup the dirty bitmaps only initially and during postcopy recovery,
>    not after every bitmap sync. Also properly clear the dirty bitmaps e.g.,
>    in KVM. [Peter]
> - "migration/postcopy: Handle RAMBlocks with a RamDiscardManager on the
>    destination"
> -- Take care of proper host-page alignment [Peter]
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
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> David Hildenbrand (9):
>   memory: Introduce replay_discarded callback for RamDiscardManager
>   virtio-mem: Implement replay_discarded RamDiscardManager callback
>   migration/ram: Don't passs RAMState to
>     migration_clear_memory_region_dirty_bitmap_*()
>   migration/ram: Handle RAMBlocks with a RamDiscardManager on the
>     migration source
>   virtio-mem: Drop precopy notifier
>   migration/postcopy: Handle RAMBlocks with a RamDiscardManager on the
>     destination
>   migration: Simplify alignment and alignment checks
>   migration/ram: Factor out populating pages readable in
>     ram_block_populate_pages()
>   migration/ram: Handle RAMBlocks with a RamDiscardManager on background
>     snapshots
> 
>  hw/virtio/virtio-mem.c         |  92 ++++++++++-------
>  include/exec/memory.h          |  21 ++++
>  include/hw/virtio/virtio-mem.h |   3 -
>  migration/migration.c          |   6 +-
>  migration/postcopy-ram.c       |  40 ++++++--
>  migration/ram.c                | 180 +++++++++++++++++++++++++++++----
>  migration/ram.h                |   1 +
>  softmmu/memory.c               |  11 ++
>  8 files changed, 284 insertions(+), 70 deletions(-)
> 
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


