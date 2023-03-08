Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310F46B0358
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 10:47:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZqNW-0000dl-8x; Wed, 08 Mar 2023 04:46:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pZqNU-0000dC-MF
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 04:46:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pZqNS-000772-FI
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 04:46:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678268789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r18au9L99yRoojGtVgY3mK+vvp+/vekwdDSq143nqeg=;
 b=KMv5j9pxoEZpJGt/WQTkfz4lwcvU2KWnL13n8ACG1I8OKeHxsJ1GcPs06OdrKx3iFoeQkW
 kWvtNCreujr2vqozl6xPxXC5H7/WHJKWMYgNB44q9tMjWhQl6NVYPaFCCRyViZgjQ703Vo
 i2Lh49Vtm3R7ENn9dBPUEI7L4pH/mOA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-PVmVX05MPDqU6kxl-5K2Bg-1; Wed, 08 Mar 2023 04:46:26 -0500
X-MC-Unique: PVmVX05MPDqU6kxl-5K2Bg-1
Received: by mail-wm1-f70.google.com with SMTP id
 t1-20020a7bc3c1000000b003dfe223de49so729389wmj.5
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 01:46:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678268785;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r18au9L99yRoojGtVgY3mK+vvp+/vekwdDSq143nqeg=;
 b=JPOXuIQCXSW2kQR4Dim2FKJUPxAmblySAIL3RvWR9JPvPvl+68wvspzTsuOjv/NNI8
 1XJQMaF/3b+v2JXGx7dTH6HrXr7vCQqgmhZFPdgDOaP4/b6FtTGhiVWTTH7VM3un/y8H
 Ji2L5XcF5I93YxLvElgT9bLw3MCeQjFZE8vwEZ0V/Re1wrf5aCF4VbCzukDqjDomBfju
 oo2OnZTJngcIbQqGar2RSo6pMM6h1u7bZ5Wg0iojf9jLJEm/C6vffdUjQkuQbC0mK/Hn
 SRuWPhGEoLlzoU1YF9ZOzTf8yBZT+IpgSM1q7YdmZKGoZCteuw0ky08On8uRAS+S3F1Q
 QPMA==
X-Gm-Message-State: AO0yUKUBEhCCJ5D9angyYF73MjZu7AM3esYHt/rF5Tphp+CNo8OIWZa2
 ZhQpkk0LlWcy4zYsD9PsMfRZ0xPlh+v9TKWfDoeWZ5+pxOR7WW+DwsgoSdpgUTk5Wz89zWbo0hr
 f9H8P2y7v1LgoV+c=
X-Received: by 2002:a05:600c:4591:b0:3da:2a78:d7a4 with SMTP id
 r17-20020a05600c459100b003da2a78d7a4mr15035691wmo.21.1678268785307; 
 Wed, 08 Mar 2023 01:46:25 -0800 (PST)
X-Google-Smtp-Source: AK7set/CJe7pgoK5uHGyQg/ie4LeyQ+rQUUtPCeSzw0QenOgfZLRZZN3gddTYPp0jtN8Tpd+hjdIzQ==
X-Received: by 2002:a05:600c:4591:b0:3da:2a78:d7a4 with SMTP id
 r17-20020a05600c459100b003da2a78d7a4mr15035670wmo.21.1678268784991; 
 Wed, 08 Mar 2023 01:46:24 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c359000b003e209b45f6bsm21192960wmq.29.2023.03.08.01.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 01:46:24 -0800 (PST)
Date: Wed, 8 Mar 2023 09:46:22 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Hailiang Zhang <zhanghailiang@xfusion.com>,
 Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 04/43] migration: create options.c
Message-ID: <ZAhZbln8FjR6e6Rj@work-vm>
References: <20230302163410.11399-1-quintela@redhat.com>
 <20230302163410.11399-5-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302163410.11399-5-quintela@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Juan Quintela (quintela@redhat.com) wrote:
> We move there all capabilities helpers from migration.c.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/migration.h          |  12 ----
>  migration/options.h            |  34 +++++++++
>  hw/virtio/virtio-balloon.c     |   1 +
>  migration/block-dirty-bitmap.c |   1 +
>  migration/block.c              |   1 +
>  migration/colo.c               |   1 +
>  migration/migration.c          | 109 +---------------------------
>  migration/options.c            | 126 +++++++++++++++++++++++++++++++++
>  migration/postcopy-ram.c       |   1 +
>  migration/ram.c                |   1 +
>  migration/savevm.c             |   1 +
>  migration/socket.c             |   1 +
>  migration/meson.build          |   1 +
>  13 files changed, 170 insertions(+), 120 deletions(-)
>  create mode 100644 migration/options.h
>  create mode 100644 migration/options.c
> 
> diff --git a/migration/migration.h b/migration/migration.h
> index b07efaf259..68851e485d 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -410,16 +410,7 @@ MigrationState *migrate_get_current(void);
>  
>  bool migrate_postcopy(void);
>  
> -bool migrate_release_ram(void);
> -bool migrate_postcopy_ram(void);
> -bool migrate_zero_blocks(void);
> -bool migrate_dirty_bitmaps(void);
> -bool migrate_ignore_shared(void);
> -bool migrate_validate_uuid(void);
> -
> -bool migrate_auto_converge(void);
>  bool migrate_use_multifd(void);
> -bool migrate_pause_before_switchover(void);
>  int migrate_multifd_channels(void);
>  MultiFDCompression migrate_multifd_compression(void);
>  int migrate_multifd_zlib_level(void);
> @@ -448,9 +439,6 @@ int migrate_compress_threads(void);
>  int migrate_compress_wait_thread(void);
>  int migrate_decompress_threads(void);
>  bool migrate_use_events(void);
> -bool migrate_postcopy_blocktime(void);
> -bool migrate_background_snapshot(void);
> -bool migrate_postcopy_preempt(void);
>  
>  /* Sending on the return path - generic and then for each message type */
>  void migrate_send_rp_shut(MigrationIncomingState *mis,
> diff --git a/migration/options.h b/migration/options.h
> new file mode 100644
> index 0000000000..bae032375a
> --- /dev/null
> +++ b/migration/options.h
> @@ -0,0 +1,34 @@
> +/*
> + * QEMU migration options
> + *
> + * Copyright IBM, Corp. 2008
> + *
> + * Authors:
> + *  Anthony Liguori   <aliguori@us.ibm.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + * Contributions after 2012-01-13 are licensed under the terms of the
> + * GNU GPL, version 2 or (at your option) any later version.

I don't think any of these functions were written by Anthony, and I
think they're all after 2012 aren't they?  If so we can update to a more
modern header.

Other than that,


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Dave
> + */
> +
> +#ifndef QEMU_MIGRATION_OPTIONS_H
> +#define QEMU_MIGRATION_OPTIONS_H
> +
> +/* capabilities */
> +
> +bool migrate_auto_converge(void);
> +bool migrate_background_snapshot(void);
> +bool migrate_dirty_bitmaps(void);
> +bool migrate_ignore_shared(void);
> +bool migrate_late_block_activate(void);
> +bool migrate_pause_before_switchover(void);
> +bool migrate_postcopy_blocktime(void);
> +bool migrate_postcopy_preempt(void);
> +bool migrate_postcopy_ram(void);
> +bool migrate_release_ram(void);
> +bool migrate_validate_uuid(void);
> +bool migrate_zero_blocks(void);
> +
> +#endif
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index 746f07c4d2..43092aa634 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -32,6 +32,7 @@
>  #include "qemu/error-report.h"
>  #include "migration/misc.h"
>  #include "migration/migration.h"
> +#include "migration/options.h"
>  
>  #include "hw/virtio/virtio-bus.h"
>  #include "hw/virtio/virtio-access.h"
> diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
> index fe73aa94b1..a6ffae0002 100644
> --- a/migration/block-dirty-bitmap.c
> +++ b/migration/block-dirty-bitmap.c
> @@ -79,6 +79,7 @@
>  #include "qapi/qapi-visit-migration.h"
>  #include "qapi/clone-visitor.h"
>  #include "trace.h"
> +#include "options.h"
>  
>  #define CHUNK_SIZE     (1 << 10)
>  
> diff --git a/migration/block.c b/migration/block.c
> index 426a25bb19..c4fe9fea56 100644
> --- a/migration/block.c
> +++ b/migration/block.c
> @@ -28,6 +28,7 @@
>  #include "migration/vmstate.h"
>  #include "sysemu/block-backend.h"
>  #include "trace.h"
> +#include "options.h"
>  
>  #define BLK_MIG_BLOCK_SIZE           (1ULL << 20)
>  #define BDRV_SECTORS_PER_DIRTY_CHUNK (BLK_MIG_BLOCK_SIZE >> BDRV_SECTOR_BITS)
> diff --git a/migration/colo.c b/migration/colo.c
> index 0716e64689..93b78c9270 100644
> --- a/migration/colo.c
> +++ b/migration/colo.c
> @@ -36,6 +36,7 @@
>  #include "sysemu/cpus.h"
>  #include "sysemu/runstate.h"
>  #include "net/filter.h"
> +#include "options.h"
>  
>  static bool vmstate_loading;
>  static Notifier packets_compare_notifier;
> diff --git a/migration/migration.c b/migration/migration.c
> index e3062530f0..790848ef1c 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -63,6 +63,7 @@
>  #include "sysemu/cpus.h"
>  #include "yank_functions.h"
>  #include "sysemu/qtest.h"
> +#include "options.h"
>  
>  #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
>  
> @@ -357,15 +358,6 @@ static void migrate_generate_event(int new_state)
>      }
>  }
>  
> -static bool migrate_late_block_activate(void)
> -{
> -    MigrationState *s;
> -
> -    s = migrate_get_current();
> -
> -    return s->capabilities[MIGRATION_CAPABILITY_LATE_BLOCK_ACTIVATE];
> -}
> -
>  /*
>   * Send a message on the return channel back to the source
>   * of the migration.
> @@ -2523,56 +2515,11 @@ void qmp_migrate_continue(MigrationStatus state, Error **errp)
>      qemu_sem_post(&s->pause_sem);
>  }
>  
> -bool migrate_release_ram(void)
> -{
> -    MigrationState *s;
> -
> -    s = migrate_get_current();
> -
> -    return s->capabilities[MIGRATION_CAPABILITY_RELEASE_RAM];
> -}
> -
> -bool migrate_postcopy_ram(void)
> -{
> -    MigrationState *s;
> -
> -    s = migrate_get_current();
> -
> -    return s->capabilities[MIGRATION_CAPABILITY_POSTCOPY_RAM];
> -}
> -
>  bool migrate_postcopy(void)
>  {
>      return migrate_postcopy_ram() || migrate_dirty_bitmaps();
>  }
>  
> -bool migrate_auto_converge(void)
> -{
> -    MigrationState *s;
> -
> -    s = migrate_get_current();
> -
> -    return s->capabilities[MIGRATION_CAPABILITY_AUTO_CONVERGE];
> -}
> -
> -bool migrate_zero_blocks(void)
> -{
> -    MigrationState *s;
> -
> -    s = migrate_get_current();
> -
> -    return s->capabilities[MIGRATION_CAPABILITY_ZERO_BLOCKS];
> -}
> -
> -bool migrate_postcopy_blocktime(void)
> -{
> -    MigrationState *s;
> -
> -    s = migrate_get_current();
> -
> -    return s->capabilities[MIGRATION_CAPABILITY_POSTCOPY_BLOCKTIME];
> -}
> -
>  bool migrate_use_compression(void)
>  {
>      MigrationState *s;
> @@ -2618,33 +2565,6 @@ int migrate_decompress_threads(void)
>      return s->parameters.decompress_threads;
>  }
>  
> -bool migrate_dirty_bitmaps(void)
> -{
> -    MigrationState *s;
> -
> -    s = migrate_get_current();
> -
> -    return s->capabilities[MIGRATION_CAPABILITY_DIRTY_BITMAPS];
> -}
> -
> -bool migrate_ignore_shared(void)
> -{
> -    MigrationState *s;
> -
> -    s = migrate_get_current();
> -
> -    return s->capabilities[MIGRATION_CAPABILITY_X_IGNORE_SHARED];
> -}
> -
> -bool migrate_validate_uuid(void)
> -{
> -    MigrationState *s;
> -
> -    s = migrate_get_current();
> -
> -    return s->capabilities[MIGRATION_CAPABILITY_VALIDATE_UUID];
> -}
> -
>  bool migrate_use_events(void)
>  {
>      MigrationState *s;
> @@ -2663,15 +2583,6 @@ bool migrate_use_multifd(void)
>      return s->capabilities[MIGRATION_CAPABILITY_MULTIFD];
>  }
>  
> -bool migrate_pause_before_switchover(void)
> -{
> -    MigrationState *s;
> -
> -    s = migrate_get_current();
> -
> -    return s->capabilities[MIGRATION_CAPABILITY_PAUSE_BEFORE_SWITCHOVER];
> -}
> -
>  int migrate_multifd_channels(void)
>  {
>      MigrationState *s;
> @@ -2783,24 +2694,6 @@ bool migrate_use_block_incremental(void)
>      return s->parameters.block_incremental;
>  }
>  
> -bool migrate_background_snapshot(void)
> -{
> -    MigrationState *s;
> -
> -    s = migrate_get_current();
> -
> -    return s->capabilities[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT];
> -}
> -
> -bool migrate_postcopy_preempt(void)
> -{
> -    MigrationState *s;
> -
> -    s = migrate_get_current();
> -
> -    return s->capabilities[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT];
> -}
> -
>  /* migration thread support */
>  /*
>   * Something bad happened to the RP stream, mark an error
> diff --git a/migration/options.c b/migration/options.c
> new file mode 100644
> index 0000000000..47337a9a29
> --- /dev/null
> +++ b/migration/options.c
> @@ -0,0 +1,126 @@
> +/*
> + * QEMU migration capabilities
> + *
> + * Copyright IBM, Corp. 2008
> + *
> + * Authors:
> + *  Anthony Liguori   <aliguori@us.ibm.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + * Contributions after 2012-01-13 are licensed under the terms of the
> + * GNU GPL, version 2 or (at your option) any later version.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "migration.h"
> +#include "options.h"
> +
> +bool migrate_auto_converge(void)
> +{
> +    MigrationState *s;
> +
> +    s = migrate_get_current();
> +
> +    return s->capabilities[MIGRATION_CAPABILITY_AUTO_CONVERGE];
> +}
> +
> +bool migrate_background_snapshot(void)
> +{
> +    MigrationState *s;
> +
> +    s = migrate_get_current();
> +
> +    return s->capabilities[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT];
> +}
> +
> +bool migrate_dirty_bitmaps(void)
> +{
> +    MigrationState *s;
> +
> +    s = migrate_get_current();
> +
> +    return s->capabilities[MIGRATION_CAPABILITY_DIRTY_BITMAPS];
> +}
> +
> +bool migrate_ignore_shared(void)
> +{
> +    MigrationState *s;
> +
> +    s = migrate_get_current();
> +
> +    return s->capabilities[MIGRATION_CAPABILITY_X_IGNORE_SHARED];
> +}
> +
> +bool migrate_late_block_activate(void)
> +{
> +    MigrationState *s;
> +
> +    s = migrate_get_current();
> +
> +    return s->capabilities[MIGRATION_CAPABILITY_LATE_BLOCK_ACTIVATE];
> +}
> +
> +bool migrate_pause_before_switchover(void)
> +{
> +    MigrationState *s;
> +
> +    s = migrate_get_current();
> +
> +    return s->capabilities[MIGRATION_CAPABILITY_PAUSE_BEFORE_SWITCHOVER];
> +}
> +
> +bool migrate_postcopy_blocktime(void)
> +{
> +    MigrationState *s;
> +
> +    s = migrate_get_current();
> +
> +    return s->capabilities[MIGRATION_CAPABILITY_POSTCOPY_BLOCKTIME];
> +}
> +
> +bool migrate_postcopy_preempt(void)
> +{
> +    MigrationState *s;
> +
> +    s = migrate_get_current();
> +
> +    return s->capabilities[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT];
> +}
> +
> +bool migrate_postcopy_ram(void)
> +{
> +    MigrationState *s;
> +
> +    s = migrate_get_current();
> +
> +    return s->capabilities[MIGRATION_CAPABILITY_POSTCOPY_RAM];
> +}
> +
> +bool migrate_release_ram(void)
> +{
> +    MigrationState *s;
> +
> +    s = migrate_get_current();
> +
> +    return s->capabilities[MIGRATION_CAPABILITY_RELEASE_RAM];
> +}
> +
> +bool migrate_validate_uuid(void)
> +{
> +    MigrationState *s;
> +
> +    s = migrate_get_current();
> +
> +    return s->capabilities[MIGRATION_CAPABILITY_VALIDATE_UUID];
> +}
> +
> +bool migrate_zero_blocks(void)
> +{
> +    MigrationState *s;
> +
> +    s = migrate_get_current();
> +
> +    return s->capabilities[MIGRATION_CAPABILITY_ZERO_BLOCKS];
> +}
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index f54f44d899..ce41670466 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -36,6 +36,7 @@
>  #include "yank_functions.h"
>  #include "tls.h"
>  #include "qemu/userfaultfd.h"
> +#include "options.h"
>  
>  /* Arbitrary limit on size of each discard command,
>   * keeps them around ~200 bytes
> diff --git a/migration/ram.c b/migration/ram.c
> index af749b369b..1c786eb8f4 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -57,6 +57,7 @@
>  #include "qemu/iov.h"
>  #include "multifd.h"
>  #include "sysemu/runstate.h"
> +#include "options.h"
>  
>  #include "hw/boards.h" /* for machine_dump_guest_core() */
>  
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 589ef926ab..ebcf571e37 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -67,6 +67,7 @@
>  #include "qemu/yank.h"
>  #include "yank_functions.h"
>  #include "sysemu/qtest.h"
> +#include "options.h"
>  
>  const unsigned int postcopy_ram_discard_version;
>  
> diff --git a/migration/socket.c b/migration/socket.c
> index e6fdf3c5e1..ebf9ac41af 100644
> --- a/migration/socket.c
> +++ b/migration/socket.c
> @@ -27,6 +27,7 @@
>  #include "io/net-listener.h"
>  #include "trace.h"
>  #include "postcopy-ram.h"
> +#include "options.h"
>  
>  struct SocketOutgoingArgs {
>      SocketAddress *saddr;
> diff --git a/migration/meson.build b/migration/meson.build
> index 0d1bb9f96e..480ff6854a 100644
> --- a/migration/meson.build
> +++ b/migration/meson.build
> @@ -22,6 +22,7 @@ softmmu_ss.add(files(
>    'migration.c',
>    'multifd.c',
>    'multifd-zlib.c',
> +  'options.c',
>    'postcopy-ram.c',
>    'savevm.c',
>    'socket.c',
> -- 
> 2.39.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


