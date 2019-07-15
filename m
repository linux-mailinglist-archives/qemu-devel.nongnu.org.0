Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E5168675
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 11:40:39 +0200 (CEST)
Received: from localhost ([::1]:36338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hmxTK-0000A3-FA
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 05:40:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54482)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hmxSw-0007gV-9K
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 05:40:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hmxSu-000184-Tm
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 05:40:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50474)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hmxSu-00017Y-KF
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 05:40:12 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E3439308FC4D;
 Mon, 15 Jul 2019 09:40:11 +0000 (UTC)
Received: from work-vm (ovpn-117-181.ams2.redhat.com [10.36.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2CEA5D9D2;
 Mon, 15 Jul 2019 09:40:10 +0000 (UTC)
Date: Mon, 15 Jul 2019 10:40:07 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Ivan Ren <renyime@gmail.com>
Message-ID: <20190715094007.GD2689@work-vm>
References: <1563115879-2715-1-git-send-email-ivanren@tencent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1563115879-2715-1-git-send-email-ivanren@tencent.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Mon, 15 Jul 2019 09:40:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] migration: always initial RAMBlock.bmap to
 1 for new migration
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
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Ivan Ren (renyime@gmail.com) wrote:
> Reproduce the problem:
> migrate
> migrate_cancel
> migrate
> 
> Error happen for memory migration

Can we fix this by just reverting 03158519384 ?

Dave

> The reason as follows:
> 1. qemu start, ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION] all set to
>    1 by a series of cpu_physical_memory_set_dirty_range
> 2. migration start:ram_init_bitmaps
>    - memory_global_dirty_log_start: begin log diry
>    - memory_global_dirty_log_sync: sync dirty bitmap to
>      ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION]
>    - migration_bitmap_sync_range: sync ram_list.
>      dirty_memory[DIRTY_MEMORY_MIGRATION] to RAMBlock.bmap
>      and ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION] is set to zero
> 3. migration data...
> 4. migrate_cancel, will stop log dirty
> 5. migration start:ram_init_bitmaps
>    - memory_global_dirty_log_start: begin log diry
>    - memory_global_dirty_log_sync: sync dirty bitmap to
>      ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION]
>    - migration_bitmap_sync_range: sync ram_list.
>      dirty_memory[DIRTY_MEMORY_MIGRATION] to RAMBlock.bmap
>      and ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION] is set to zero
> 
>    Here RAMBlock.bmap only have new logged dirty pages, don't contain
>    the whole guest pages.
> 
> Signed-off-by: Ivan Ren <ivanren@tencent.com>
> ---
>  migration/ram.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 908517fc2b..bbebaee0c1 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -3173,11 +3173,11 @@ static int ram_state_init(RAMState **rsp)
>      QSIMPLEQ_INIT(&(*rsp)->src_page_requests);
>  
>      /*
> +     * Count the total number of pages used by ram blocks not including any
> +     * gaps due to alignment or unplugs.
>       * This must match with the initial values of dirty bitmap.
> -     * Currently we initialize the dirty bitmap to all zeros so
> -     * here the total dirty page count is zero.
>       */
> -    (*rsp)->migration_dirty_pages = 0;
> +    (*rsp)->migration_dirty_pages = ram_bytes_total() >> TARGET_PAGE_BITS;
>      ram_state_reset(*rsp);
>  
>      return 0;
> @@ -3196,12 +3196,13 @@ static void ram_list_init_bitmaps(void)
>               * The initial dirty bitmap for migration must be set with all
>               * ones to make sure we'll migrate every guest RAM page to
>               * destination.
> -             * Here we didn't set RAMBlock.bmap simply because it is already
> -             * set in ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION] in
> -             * ram_block_add, and that's where we'll sync the dirty bitmaps.
> -             * Here setting RAMBlock.bmap would be fine too but not necessary.
> +             * Here we set RAMBlock.bmap all to 1 because when rebegin a
> +             * new migration after a failed migration, ram_list.
> +             * dirty_memory[DIRTY_MEMORY_MIGRATION] don't include the whole
> +             * guest memory.
>               */
>              block->bmap = bitmap_new(pages);
> +            bitmap_set(block->bmap, 0, pages);
>              if (migrate_postcopy_ram()) {
>                  block->unsentmap = bitmap_new(pages);
>                  bitmap_set(block->unsentmap, 0, pages);
> -- 
> 2.17.2 (Apple Git-113)
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

