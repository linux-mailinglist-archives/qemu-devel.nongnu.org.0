Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9434A14E67A
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 01:17:28 +0100 (CET)
Received: from localhost ([::1]:41436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixJzz-00066L-GW
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 19:17:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33949)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1ixJyL-0004Qg-MF
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 19:15:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1ixJyK-0004sb-8D
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 19:15:45 -0500
Received: from mga02.intel.com ([134.134.136.20]:38472)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1ixJyJ-0004pt-VL
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 19:15:44 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jan 2020 16:15:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,383,1574150400"; d="scan'208";a="247562355"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga002.jf.intel.com with ESMTP; 30 Jan 2020 16:15:36 -0800
Date: Fri, 31 Jan 2020 08:15:51 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [PATCH] migration/postcopy: not necessary to discard all RAM at
 the beginning
Message-ID: <20200131001551.GA21974@richard>
References: <20191007091008.9435-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007091008.9435-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.20
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
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, David and Juan

Does it look good to you?

On Mon, Oct 07, 2019 at 05:10:08PM +0800, Wei Yang wrote:
>ram_discard_range() unmap page for specific range. To be specific, this
>clears related page table entries so that userfault would be triggered.
>But this step is not necessary at the very beginning.
>
>ram_postcopy_incoming_init() is called when destination gets ADVISE
>command. ADVISE command is sent when migration thread just starts, which
>implies destination is not running yet. This means no page fault
>happened and memory region's page tables entries are empty.
>
>This patch removes the discard at the beginning.
>
>Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>---
> migration/postcopy-ram.c | 46 ----------------------------------------
> migration/postcopy-ram.h |  7 ------
> migration/ram.c          | 16 --------------
> migration/ram.h          |  1 -
> migration/savevm.c       |  4 ----
> 5 files changed, 74 deletions(-)
>
>diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
>index 5da6de8c8b..459be8e780 100644
>--- a/migration/postcopy-ram.c
>+++ b/migration/postcopy-ram.c
>@@ -443,32 +443,6 @@ out:
>     return ret;
> }
> 
>-/*
>- * Setup an area of RAM so that it *can* be used for postcopy later; this
>- * must be done right at the start prior to pre-copy.
>- * opaque should be the MIS.
>- */
>-static int init_range(RAMBlock *rb, void *opaque)
>-{
>-    const char *block_name = qemu_ram_get_idstr(rb);
>-    void *host_addr = qemu_ram_get_host_addr(rb);
>-    ram_addr_t offset = qemu_ram_get_offset(rb);
>-    ram_addr_t length = qemu_ram_get_used_length(rb);
>-    trace_postcopy_init_range(block_name, host_addr, offset, length);
>-
>-    /*
>-     * We need the whole of RAM to be truly empty for postcopy, so things
>-     * like ROMs and any data tables built during init must be zero'd
>-     * - we're going to get the copy from the source anyway.
>-     * (Precopy will just overwrite this data, so doesn't need the discard)
>-     */
>-    if (ram_discard_range(block_name, 0, length)) {
>-        return -1;
>-    }
>-
>-    return 0;
>-}
>-
> /*
>  * At the end of migration, undo the effects of init_range
>  * opaque should be the MIS.
>@@ -506,20 +480,6 @@ static int cleanup_range(RAMBlock *rb, void *opaque)
>     return 0;
> }
> 
>-/*
>- * Initialise postcopy-ram, setting the RAM to a state where we can go into
>- * postcopy later; must be called prior to any precopy.
>- * called from arch_init's similarly named ram_postcopy_incoming_init
>- */
>-int postcopy_ram_incoming_init(MigrationIncomingState *mis)
>-{
>-    if (foreach_not_ignored_block(init_range, NULL)) {
>-        return -1;
>-    }
>-
>-    return 0;
>-}
>-
> /*
>  * Manage a single vote to the QEMU balloon inhibitor for all postcopy usage,
>  * last caller wins.
>@@ -1282,12 +1242,6 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
>     return false;
> }
> 
>-int postcopy_ram_incoming_init(MigrationIncomingState *mis)
>-{
>-    error_report("postcopy_ram_incoming_init: No OS support");
>-    return -1;
>-}
>-
> int postcopy_ram_incoming_cleanup(MigrationIncomingState *mis)
> {
>     assert(0);
>diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
>index c0ccf64a96..1c79c6e51f 100644
>--- a/migration/postcopy-ram.h
>+++ b/migration/postcopy-ram.h
>@@ -22,13 +22,6 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis);
>  */
> int postcopy_ram_incoming_setup(MigrationIncomingState *mis);
> 
>-/*
>- * Initialise postcopy-ram, setting the RAM to a state where we can go into
>- * postcopy later; must be called prior to any precopy.
>- * called from ram.c's similarly named ram_postcopy_incoming_init
>- */
>-int postcopy_ram_incoming_init(MigrationIncomingState *mis);
>-
> /*
>  * At the end of a migration where postcopy_ram_incoming_init was called.
>  */
>diff --git a/migration/ram.c b/migration/ram.c
>index dfc50d57d5..9a853703d8 100644
>--- a/migration/ram.c
>+++ b/migration/ram.c
>@@ -4015,22 +4015,6 @@ static int ram_load_cleanup(void *opaque)
>     return 0;
> }
> 
>-/**
>- * ram_postcopy_incoming_init: allocate postcopy data structures
>- *
>- * Returns 0 for success and negative if there was one error
>- *
>- * @mis: current migration incoming state
>- *
>- * Allocate data structures etc needed by incoming migration with
>- * postcopy-ram. postcopy-ram's similarly names
>- * postcopy_ram_incoming_init does the work.
>- */
>-int ram_postcopy_incoming_init(MigrationIncomingState *mis)
>-{
>-    return postcopy_ram_incoming_init(mis);
>-}
>-
> /**
>  * ram_load_postcopy: load a page in postcopy case
>  *
>diff --git a/migration/ram.h b/migration/ram.h
>index 44fe4753ad..66cbff1d52 100644
>--- a/migration/ram.h
>+++ b/migration/ram.h
>@@ -58,7 +58,6 @@ void ram_postcopy_migrated_memory_release(MigrationState *ms);
> int ram_postcopy_send_discard_bitmap(MigrationState *ms);
> /* For incoming postcopy discard */
> int ram_discard_range(const char *block_name, uint64_t start, size_t length);
>-int ram_postcopy_incoming_init(MigrationIncomingState *mis);
> bool postcopy_is_running(void);
> 
> void ram_handle_compressed(void *host, uint8_t ch, uint64_t size);
>diff --git a/migration/savevm.c b/migration/savevm.c
>index 9dc191e0a0..d2a427a3bf 100644
>--- a/migration/savevm.c
>+++ b/migration/savevm.c
>@@ -1674,10 +1674,6 @@ static int loadvm_postcopy_handle_advise(MigrationIncomingState *mis,
>         return -1;
>     }
> 
>-    if (ram_postcopy_incoming_init(mis)) {
>-        return -1;
>-    }
>-
>     return 0;
> }
> 
>-- 
>2.17.1

-- 
Wei Yang
Help you, Help me

