Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD213D0C9C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:58:09 +0200 (CEST)
Received: from localhost ([::1]:50626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69vU-00013Z-RV
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m69dg-0002hf-IS
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:39:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m69de-0006pX-HG
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:39:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626863981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YWOcDsJ3+6B3v8iwn5iuVSrrFyfv3QrivkjG6UpUVpM=;
 b=MrDabpzIxn1ClzU7FlLyKZdMRRIqk74XZO0i/AY/hb7jJPc+UJi4bFJ21k5JKvOWVOMcG2
 aoqOLaNxV8ytqfYOGc0LwtYLBrVWMCchqSyvxiTSXQ+ebMKMrROMjcbOj6tLfdKRGfXM+d
 RWk4eNI74Qe5Zv76s/n2k1LhYq1/myc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-hxbsc8PxMxaNtHD_wu8Z-A-1; Wed, 21 Jul 2021 06:39:40 -0400
X-MC-Unique: hxbsc8PxMxaNtHD_wu8Z-A-1
Received: by mail-wm1-f69.google.com with SMTP id
 n11-20020a05600c294bb029022095f349f3so432403wmd.0
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 03:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YWOcDsJ3+6B3v8iwn5iuVSrrFyfv3QrivkjG6UpUVpM=;
 b=fZHuuDKcTKx5I6bhb6DSKSOqObQraO6nICO+YThyJnRHdxDKeknNmfTRpVxpcd00Zl
 +LbKx87l2m1ZTA4Vckak25p8Qk7kyCvpWtJEe1RNh/eK66K1Q48e0UsdjbO5tkI8uEM/
 u6DDzod95UWvZpt3dtxxVkeWzk0vsgVCoQ6dmZ8CJoK5qXzyYU7LnWAhrZlRxXTsTer0
 vgx82orSs7Yl/XCFLJgKX8dt233IX7ka3l7tNsCXViuiL5Y1Xj5St7C9upn4LsJnylrD
 i9AcywAN2Zvt32BrMJMFIm69ntT63upNydvfRDaRb83ouc1IoJt3tMnW3TugScVfnH4V
 j6/g==
X-Gm-Message-State: AOAM530ONmzsXpXv6HFMMf0VrdqV6aFd0KuFZqjn/9BAGw3mH/pof0DL
 IhjeM5kfiXyYLAhDbqyLcfmjGb3IjGzjMHXjiKXkek1UmWuvvsKJlcnvitr3EuFY2P4EbSgThk+
 wuPfS+kUZbE2UX6A=
X-Received: by 2002:a05:600c:4ca7:: with SMTP id
 g39mr20070099wmp.72.1626863979496; 
 Wed, 21 Jul 2021 03:39:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5E2nFUKV5vy3P/0iPIEoutEjGVAjpnc/hbbjV9Jy2HqvvVBALtIJT4t6oBAlWZhFrJWvB9A==
X-Received: by 2002:a05:600c:4ca7:: with SMTP id
 g39mr20070079wmp.72.1626863979250; 
 Wed, 21 Jul 2021 03:39:39 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id y3sm26810520wrh.16.2021.07.21.03.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 03:39:38 -0700 (PDT)
Date: Wed, 21 Jul 2021 11:39:37 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 5/5] migration: Move the yank unregister of channel_close
 out
Message-ID: <YPf5aVKZ4BcBlF60@work-vm>
References: <20210721012134.792845-1-peterx@redhat.com>
 <20210721012134.792845-6-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210721012134.792845-6-peterx@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> It's efficient, but hackish to call yank unregister calls in channel_close(),
> especially it'll be hard to debug when qemu crashed with some yank function
> leaked.
> 
> Remove that hack, but instead explicitly unregister yank functions at the
> places where needed, they are:
> 
>   (on src)
>   - migrate_fd_cleanup
>   - postcopy_pause
> 
>   (on dst)
>   - migration_incoming_state_destroy
>   - postcopy_pause_incoming
> 
> Some small helpers are introduced to achieve this task.  One of them is called
> migration_file_get_ioc(), which tries to fetch the ioc out of the qemu file.
> It's a bit tricky because qemufile is also used for savevm/loadvm.  We need to
> check for NULL to bypass those.  Please see comment above that helper for more
> information.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Yes

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


although....

> ---
>  migration/migration.c         |  5 +++++
>  migration/qemu-file-channel.c |  3 ---
>  migration/qemu-file.c         | 12 ++++++++++++
>  migration/qemu-file.h         |  2 ++
>  migration/savevm.c            |  7 +++++++
>  migration/yank_functions.c    | 14 ++++++++++++++
>  migration/yank_functions.h    |  1 +
>  7 files changed, 41 insertions(+), 3 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 4f48cde796..65b8c2eb52 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -59,6 +59,7 @@
>  #include "multifd.h"
>  #include "qemu/yank.h"
>  #include "sysemu/cpus.h"
> +#include "yank_functions.h"
>  
>  #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
>  
> @@ -273,6 +274,7 @@ void migration_incoming_state_destroy(void)
>      }
>  
>      if (mis->from_src_file) {
> +        migration_ioc_unregister_yank_from_file(mis->from_src_file);
>          qemu_fclose(mis->from_src_file);
>          mis->from_src_file = NULL;
>      }
> @@ -1811,6 +1813,7 @@ static void migrate_fd_cleanup(MigrationState *s)
>           * Close the file handle without the lock to make sure the
>           * critical section won't block for long.
>           */
> +        migration_ioc_unregister_yank_from_file(tmp);
>          qemu_fclose(tmp);
>      }
>  
> @@ -3337,6 +3340,8 @@ static MigThrError postcopy_pause(MigrationState *s)
>  
>          /* Current channel is possibly broken. Release it. */
>          assert(s->to_dst_file);
> +        /* Unregister yank for current channel */
> +        migration_ioc_unregister_yank_from_file(s->to_dst_file);
>          qemu_mutex_lock(&s->qemu_file_lock);
>          file = s->to_dst_file;
>          s->to_dst_file = NULL;
> diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
> index 2f8b1fcd46..bb5a5752df 100644
> --- a/migration/qemu-file-channel.c
> +++ b/migration/qemu-file-channel.c
> @@ -107,9 +107,6 @@ static int channel_close(void *opaque, Error **errp)
>      int ret;
>      QIOChannel *ioc = QIO_CHANNEL(opaque);
>      ret = qio_channel_close(ioc, errp);
> -    if (OBJECT(ioc)->ref == 1) {
> -        migration_ioc_unregister_yank(ioc);
> -    }
>      object_unref(OBJECT(ioc));
>      return ret;
>  }
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index ada58c94dd..b32ff35e73 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -854,3 +854,15 @@ void qemu_file_set_blocking(QEMUFile *f, bool block)
>          f->ops->set_blocking(f->opaque, block, NULL);
>      }
>  }
> +
> +/*
> + * Return the ioc object if it's a migration channel.  Note: it can return NULL
> + * for callers passing in a non-migration qemufile.  E.g. see qemu_fopen_bdrv()
> + * and its usage in e.g. load_snapshot().  So we need to check against NULL
> + * before using it.  If without the check, migration_incoming_state_destroy()
> + * could fail for load_snapshot().
> + */
> +QIOChannel *migration_file_get_ioc(QEMUFile *file)
> +{
> +    return file->has_ioc ? QIO_CHANNEL(file->opaque) : NULL;
> +}

Do you think this should go in the previous patch where you created
has_ioc?  Also the name is weird, qemu_file is probably right for
everything in here.

Dave

> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index 80d0e79fd1..59f3f78e8b 100644
> --- a/migration/qemu-file.h
> +++ b/migration/qemu-file.h
> @@ -27,6 +27,7 @@
>  
>  #include <zlib.h>
>  #include "exec/cpu-common.h"
> +#include "io/channel.h"
>  
>  /* Read a chunk of data from a file at the given position.  The pos argument
>   * can be ignored if the file is only be used for streaming.  The number of
> @@ -179,5 +180,6 @@ void ram_control_load_hook(QEMUFile *f, uint64_t flags, void *data);
>  size_t ram_control_save_page(QEMUFile *f, ram_addr_t block_offset,
>                               ram_addr_t offset, size_t size,
>                               uint64_t *bytes_sent);
> +QIOChannel *migration_file_get_ioc(QEMUFile *file);
>  
>  #endif
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 96b5e5d639..7b7b64bd13 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -65,6 +65,7 @@
>  #include "qemu/bitmap.h"
>  #include "net/announce.h"
>  #include "qemu/yank.h"
> +#include "yank_functions.h"
>  
>  const unsigned int postcopy_ram_discard_version;
>  
> @@ -2568,6 +2569,12 @@ static bool postcopy_pause_incoming(MigrationIncomingState *mis)
>      /* Clear the triggered bit to allow one recovery */
>      mis->postcopy_recover_triggered = false;
>  
> +    /*
> +     * Unregister yank with either from/to src would work, since ioc behind it
> +     * is the same
> +     */
> +    migration_ioc_unregister_yank_from_file(mis->from_src_file);
> +
>      assert(mis->from_src_file);
>      qemu_file_shutdown(mis->from_src_file);
>      qemu_fclose(mis->from_src_file);
> diff --git a/migration/yank_functions.c b/migration/yank_functions.c
> index 23697173ae..1f35ba3512 100644
> --- a/migration/yank_functions.c
> +++ b/migration/yank_functions.c
> @@ -14,6 +14,7 @@
>  #include "qemu/yank.h"
>  #include "io/channel-socket.h"
>  #include "io/channel-tls.h"
> +#include "qemu-file.h"
>  
>  void migration_yank_iochannel(void *opaque)
>  {
> @@ -46,3 +47,16 @@ void migration_ioc_unregister_yank(QIOChannel *ioc)
>                                   QIO_CHANNEL(ioc));
>      }
>  }
> +
> +void migration_ioc_unregister_yank_from_file(QEMUFile *file)
> +{
> +    QIOChannel *ioc = migration_file_get_ioc(file);
> +
> +    if (ioc) {
> +        /*
> +         * For migration qemufiles, we'll always reach here.  Though we'll skip
> +         * calls from e.g. savevm/loadvm as they don't use yank.
> +         */
> +        migration_ioc_unregister_yank(ioc);
> +    }
> +}
> diff --git a/migration/yank_functions.h b/migration/yank_functions.h
> index 74c7f18c91..a7577955ed 100644
> --- a/migration/yank_functions.h
> +++ b/migration/yank_functions.h
> @@ -17,3 +17,4 @@
>  void migration_yank_iochannel(void *opaque);
>  void migration_ioc_register_yank(QIOChannel *ioc);
>  void migration_ioc_unregister_yank(QIOChannel *ioc);
> +void migration_ioc_unregister_yank_from_file(QEMUFile *file);
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


