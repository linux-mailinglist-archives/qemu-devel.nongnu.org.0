Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 318FF37A401
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:49:02 +0200 (CEST)
Received: from localhost ([::1]:39240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgP0f-0008Lu-7b
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:49:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgOuM-0005Pa-OU
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:42:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgOuK-0000FA-1c
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:42:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620726147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3l1OEul44k1PLCBnOYQ8WWDsGPp7IsjooSxX8agRwVk=;
 b=AZoz4zuFCwd287Yonyku7K8xc5NTUOaH+oknDmYJg4dxFP2UzJaf4kYIkVod9SSRqrrWos
 ViOIXVnQzVfO3n1gaqGKsfzppdSoCgi7IW1EJZsFtzw7lDPPYB95fscIa0ANIAfYxy2SrA
 eTpwAn2jh6rUcl/xxO6YaqJ4mbtkWbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-9H9609kLMOGM22I--WZtyA-1; Tue, 11 May 2021 05:42:25 -0400
X-MC-Unique: 9H9609kLMOGM22I--WZtyA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9707D1937FC0;
 Tue, 11 May 2021 09:42:24 +0000 (UTC)
Received: from work-vm (ovpn-113-51.ams2.redhat.com [10.36.113.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E85005D6A8;
 Tue, 11 May 2021 09:42:09 +0000 (UTC)
Date: Tue, 11 May 2021 10:42:07 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v5 00/10] numa/exec/migration: Fix resizing RAM blocks
 while migrating
Message-ID: <YJpRb5lrMYD5fLYq@work-vm>
References: <20210429112708.12291-1-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210429112708.12291-1-david@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* David Hildenbrand (david@redhat.com) wrote:
> v4 has been floating around for a while. Let's see if we can find someone
> to merge this; or at least give some more feedback ... all patches have
> at least one RB.
> 
> 
> I realized that resizing RAM blocks while the guest is being migrated
> (precopy: resize while still running on the source, postcopy: resize
>  while already running on the target) is buggy. In case of precopy, we
> can simply cancel migration. Postcopy handling is more involved. Resizing
> can currently happen during a guest reboot, triggered by ACPI rebuilds.
> 
> Along with the fixes, some cleanups.

Queued

> 
> --------------------------------------------------------------------------
> 
> Example to highlight one part of the problem:
> 
> 1. Start a paused VM (where a ramblock resize will trigger when booting):
>   sudo build/qemu-system-x86_64 \
>        --enable-kvm \
>        -S \
>        -machine q35,nvdimm=on \
>        -smp 1 \
>        -cpu host \
>        -m size=20G,slots=8,maxmem=22G \
>        -object memory-backend-file,id=mem0,mem-path=/tmp/nvdimm,size=256M \
>        -device nvdimm,label-size=131072,memdev=mem0,id=nvdimm0,slot=1 \
>        -nodefaults \
>        -chardev stdio,nosignal,id=serial \
>        -device isa-serial,chardev=serial \
>        -chardev socket,id=monitor,path=/var/tmp/monitor,server,nowait \
>        -mon chardev=monitor,mode=readline \
>        -device vmgenid \
>        -device intel-iommu \
>        -nographic
> 
> 2. Starting precopy and then starting the VM to trigger resizing during
>    precopy:
>   QEMU 5.2.95 monitor - type 'help' for more information
>   (qemu) migrate -d "exec:gzip -c > STATEFILE.gz"
>   QEMU 5.2.95 monitor - type 'help' for more information
>   (qemu) cont
> 
> 3a. Before this series, migration never completes:
>   QEMU 5.2.95 monitor - type 'help' for more information
>   (qemu) info migrate
>   globals:
>   store-global-state: on
>   only-migratable: off
>   send-configuration: on
>   send-section-footer: on
>   decompress-error-check: on
>   clear-bitmap-shift: 18
>   Migration status: active
>   total time: 43826 ms
>   expected downtime: 300 ms
>   setup: 5 ms
>   transferred ram: 65981 kbytes
>   throughput: 8.27 mbps
>   remaining ram: 18446744073709551612 kbytes
>   total ram: 21234188 kbytes
>   duplicate: 5308454 pages
>   skipped: 0 pages
>   normal: 93 pages
>   normal bytes: 372 kbytes
>   dirty sync count: 1
>   page size: 4 kbytes
>   multifd bytes: 0 kbytes
>   pages-per-second: 0
> 
> 4. With this change, migration is properly aborted:
>   (qemu) info migrate
>   globals:
>   store-global-state: on
>   only-migratable: off
>   send-configuration: on
>   send-section-footer: on
>   decompress-error-check: on
>   clear-bitmap-shift: 18
>   Migration status: cancelled
>   total time: 0 ms
> 
> --------------------------------------------------------------------------
> 
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> 
> v4 -> v5:
> - Rephrased some patch descriptions
> - Dropped some patches to reduce the footprint
> -- "stubs/ram-block: Remove stubs that are no longer needed"
> -- "migration/ram: Tolerate partially changed mappings in postcopy code"
> - Removed as already upstream now
> -- "migration/ram: Consolidate variable reset after placement in
>     ram_load_postcopy()"
> 
> v3 -> v4:
> - Rebased and retested
> - Added RBs
> 
> v2 -> v3:
> - Rebased on current master
> - Added RBs
> - "migration/ram: Tolerate partially changed mappings in postcopy code"
> -- Extended the comment for the uffdio unregister part.
> 
> v1 -> v2:
> - "util: vfio-helpers: Factor out and fix processing of existing ram
>    blocks"
> -- Stringify error
> - "migraton/ram: Handle RAM block resizes during precopy"
> -- Simplified check if we're migrating on the source
> - "exec: Relax range check in ram_block_discard_range()"
> -- Added to make discard during resizes actually work
> - "migration/ram: Discard new RAM when growing RAM blocks after
>    ram_postcopy_incoming_init()"
> -- Better checks if in the right postcopy mode.
> -- Better patch subject/description/comments
> - "migration/ram: Handle RAM block resizes during postcopy"
> -- Better comments
> -- Adapt to changed postcopy checks
> - "migrate/ram: Get rid of "place_source" in ram_load_postcopy()"
> -- Dropped, as broken
> - "migration/ram: Tolerate partially changed mappings in postcopy code"
> -- Better comment / description. Clarify that no implicit wakeup will
>    happen
> -- Warn on EINVAL (older kernels)
> -- Wake up any waiter explicitly
> 
> David Hildenbrand (10):
>   util: vfio-helpers: Factor out and fix processing of existing ram
>     blocks
>   numa: Teach ram block notifiers about resizeable ram blocks
>   numa: Make all callbacks of ram block notifiers optional
>   migration/ram: Handle RAM block resizes during precopy
>   exec: Relax range check in ram_block_discard_range()
>   migration/ram: Discard RAM when growing RAM blocks after
>     ram_postcopy_incoming_init()
>   migration/ram: Simplify host page handling in ram_load_postcopy()
>   migration/ram: Handle RAM block resizes during postcopy
>   migration/multifd: Print used_length of memory block
>   migration/ram: Use offset_in_ramblock() in range checks
> 
>  hw/core/numa.c             |  41 +++++++++--
>  hw/i386/xen/xen-mapcache.c |   7 +-
>  include/exec/cpu-common.h  |   1 +
>  include/exec/memory.h      |  10 +--
>  include/exec/ramblock.h    |  10 +++
>  include/exec/ramlist.h     |  13 ++--
>  migration/migration.c      |   9 ++-
>  migration/migration.h      |   1 +
>  migration/multifd.c        |   2 +-
>  migration/postcopy-ram.c   |  15 ++++-
>  migration/ram.c            | 135 +++++++++++++++++++++++++++++--------
>  softmmu/physmem.c          |  26 +++++--
>  target/i386/hax/hax-mem.c  |   5 +-
>  target/i386/sev.c          |  18 ++---
>  util/vfio-helpers.c        |  41 ++++-------
>  15 files changed, 241 insertions(+), 93 deletions(-)
> 
> -- 
> 2.30.2
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


