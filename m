Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D10A41CA58
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 16:28:14 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49005 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQYPd-0008F5-Mk
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 10:28:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37970)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hQYOe-0007yU-Tj
	for qemu-devel@nongnu.org; Tue, 14 May 2019 10:27:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hQYOd-0001L0-WD
	for qemu-devel@nongnu.org; Tue, 14 May 2019 10:27:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45466)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hQYOd-0001JS-Qf
	for qemu-devel@nongnu.org; Tue, 14 May 2019 10:27:11 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 29C313079B63;
	Tue, 14 May 2019 14:27:06 +0000 (UTC)
Received: from work-vm (ovpn-117-232.ams2.redhat.com [10.36.117.232])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FFA761995;
	Tue, 14 May 2019 14:27:04 +0000 (UTC)
Date: Tue, 14 May 2019 15:27:02 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190514142702.GH2753@work-vm>
References: <20190430034412.12935-1-richardw.yang@linux.intel.com>
	<20190430034412.12935-2-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190430034412.12935-2-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Tue, 14 May 2019 14:27:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/3] migration/ram.c: start of
 migration_bitmap_sync_range is always 0
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Wei Yang (richardw.yang@linux.intel.com) wrote:
> We can eliminate to pass 0.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

I'm going to queue just 1/3for the current pull.

Dave

> ---
>  migration/ram.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 35bd6213e9..9948b2d021 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1643,10 +1643,10 @@ static inline bool migration_bitmap_clear_dirty(RAMState *rs,
>  }
>  
>  static void migration_bitmap_sync_range(RAMState *rs, RAMBlock *rb,
> -                                        ram_addr_t start, ram_addr_t length)
> +                                        ram_addr_t length)
>  {
>      rs->migration_dirty_pages +=
> -        cpu_physical_memory_sync_dirty_bitmap(rb, start, length,
> +        cpu_physical_memory_sync_dirty_bitmap(rb, 0, length,
>                                                &rs->num_dirty_pages_period);
>  }
>  
> @@ -1735,7 +1735,7 @@ static void migration_bitmap_sync(RAMState *rs)
>      qemu_mutex_lock(&rs->bitmap_mutex);
>      rcu_read_lock();
>      RAMBLOCK_FOREACH_NOT_IGNORED(block) {
> -        migration_bitmap_sync_range(rs, block, 0, block->used_length);
> +        migration_bitmap_sync_range(rs, block, block->used_length);
>      }
>      ram_counters.remaining = ram_bytes_remaining();
>      rcu_read_unlock();
> @@ -4156,7 +4156,7 @@ static void colo_flush_ram_cache(void)
>      memory_global_dirty_log_sync();
>      rcu_read_lock();
>      RAMBLOCK_FOREACH_NOT_IGNORED(block) {
> -        migration_bitmap_sync_range(ram_state, block, 0, block->used_length);
> +        migration_bitmap_sync_range(ram_state, block, block->used_length);
>      }
>      rcu_read_unlock();
>  
> -- 
> 2.19.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

