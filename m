Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14833347F9F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 18:38:29 +0100 (CET)
Received: from localhost ([::1]:47566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP7Sd-0005IB-It
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 13:38:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lP7QO-0004LM-Tl
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 13:36:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lP7QL-0006wf-Ov
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 13:36:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616607362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vnmCNxfQiagVdZmG6YtC/iqlub307BFrSbx52FDP28o=;
 b=BLwX+mNv4nPgY7DPYjrmyC63ZxS0vn+JQQ6nsdsRtYWPBm+v9Vl0gEYmYcLBeS+vI2l5A8
 y6OtZk6kWD5bmYWImBlkXcEKqKH2AoQhAJUYGh4t1zWw1Az8vNHL6hxZDcUjOytA2Lqz6O
 arWiAhtun6WhfUpm80/ufYPV0V+oU2g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-Ss19OPv3Mjec1O91Z7JpGg-1; Wed, 24 Mar 2021 13:35:58 -0400
X-MC-Unique: Ss19OPv3Mjec1O91Z7JpGg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDCA91922964;
 Wed, 24 Mar 2021 17:35:57 +0000 (UTC)
Received: from work-vm (ovpn-115-64.ams2.redhat.com [10.36.115.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B522694CD;
 Wed, 24 Mar 2021 17:35:46 +0000 (UTC)
Date: Wed, 24 Mar 2021 17:35:44 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1 1/3] migration: Fix missing qemu_fflush() on buffer
 file in bg_migration_thread
Message-ID: <YFt4cN4tmQ/u11mf@work-vm>
References: <20210319145249.425189-1-andrey.gruzdev@virtuozzo.com>
 <20210319145249.425189-2-andrey.gruzdev@virtuozzo.com>
 <20210322201716.GG16645@xz-x1>
 <2fb49f83-e31c-8c93-50b7-833026b06518@virtuozzo.com>
 <20210323145457.GC6486@xz-x1>
 <9311f31b-298f-d235-45bd-0ed9d66f9468@virtuozzo.com>
 <20210323183537.GH6486@xz-x1>
MIME-Version: 1.0
In-Reply-To: <20210323183537.GH6486@xz-x1>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> On Tue, Mar 23, 2021 at 08:21:43PM +0300, Andrey Gruzdev wrote:
> > > For the long term I think we'd better have a helper:
> > > 
> > >          qemu_put_qio_channel_buffer(QEMUFile *file, QIOChannelBuffer *bioc)
> > > 
> > > So as to hide this flush operation, which is tricky. We'll have two users so
> > > far:
> > > 
> > >          bg_migration_completion
> > >          colo_do_checkpoint_transaction
> > > 
> > > IMHO it'll be nicer if you'd do it in this patch altogether!
> > > 
> > > Thanks,
> > > 
> > Sorry, can't get the idea, what's wrong with the fix.
> 
> I'm fine with the fix, but I've got one patch attached just to show what I
> meant, so without any testing for sure..
> 
> Looks more complicated than I thought, but again I think we should hide that
> buffer flush into another helper to avoid overlooking it.

I was wondering if I was missing the same fflush in postcopy, but I
don't *think* so, although it's a bit round about; before sending the
data I call:

  qemu_savevm_send_postcopy_run(fb)

and that calls qemu_savevm_command_send that ends in a fflish;  which is
non-obvious.

While I'd leave that in there, it might be good to use that same thing.

Dave

> Thanks,
> 
> -- 
> Peter Xu

> From f3004948e2498fb9ac4646a6a5225c58ea3f1623 Mon Sep 17 00:00:00 2001
> From: Peter Xu <peterx@redhat.com>
> Date: Tue, 23 Mar 2021 14:30:24 -0400
> Subject: [PATCH] migration: Introduce qemu_put_qio_channel_buffer()
> 
> Meanwhile use it in background snapshot code, so as to dump one QEMUFile buffer
> (which is created by QIOChannelBuffer) into another QEMUFile.
> 
> Similar thing should be able to be applied to colo_do_checkpoint_transaction()
> too.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/migration.c         | 16 +++++++++-------
>  migration/migration.h         |  1 -
>  migration/qemu-file-channel.c | 14 ++++++++++++++
>  migration/qemu-file-channel.h |  2 ++
>  migration/qemu-file.c         |  4 ++++
>  migration/qemu-file.h         |  1 +
>  6 files changed, 30 insertions(+), 8 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index a5ddf43559e..9d73c236b16 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3243,8 +3243,9 @@ fail:
>   *   RAM has been saved. The caller 'breaks' the loop when this returns.
>   *
>   * @s: Current migration state
> + * @vmstates: The QEMUFile* buffer that contains all the device vmstates
>   */
> -static void bg_migration_completion(MigrationState *s)
> +static void bg_migration_completion(MigrationState *s, QEMUFile *vmstates)
>  {
>      int current_active_state = s->state;
>  
> @@ -3262,7 +3263,7 @@ static void bg_migration_completion(MigrationState *s)
>           * right after the ram content. The device state has been stored into
>           * the temporary buffer before RAM saving started.
>           */
> -        qemu_put_buffer(s->to_dst_file, s->bioc->data, s->bioc->usage);
> +        qemu_put_qio_channel_buffer(s->to_dst_file, vmstates);
>          qemu_fflush(s->to_dst_file);
>      } else if (s->state == MIGRATION_STATUS_CANCELLING) {
>          goto fail;
> @@ -3656,7 +3657,6 @@ static MigIterateState bg_migration_iteration_run(MigrationState *s)
>  
>      res = qemu_savevm_state_iterate(s->to_dst_file, false);
>      if (res > 0) {
> -        bg_migration_completion(s);
>          return MIG_ITERATE_BREAK;
>      }
>  
> @@ -3843,6 +3843,7 @@ static void *bg_migration_thread(void *opaque)
>      MigThrError thr_error;
>      QEMUFile *fb;
>      bool early_fail = true;
> +    QIOChannelBuffer *bioc;
>  
>      rcu_register_thread();
>      object_ref(OBJECT(s));
> @@ -3859,10 +3860,10 @@ static void *bg_migration_thread(void *opaque)
>       * with vCPUs running and, finally, write stashed non-RAM part of
>       * the vmstate from the buffer to the migration stream.
>       */
> -    s->bioc = qio_channel_buffer_new(128 * 1024);
> -    qio_channel_set_name(QIO_CHANNEL(s->bioc), "vmstate-buffer");
> -    fb = qemu_fopen_channel_output(QIO_CHANNEL(s->bioc));
> -    object_unref(OBJECT(s->bioc));
> +    bioc = qio_channel_buffer_new(128 * 1024);
> +    qio_channel_set_name(QIO_CHANNEL(bioc), "vmstate-buffer");
> +    fb = qemu_fopen_channel_output(QIO_CHANNEL(bioc));
> +    object_unref(OBJECT(bioc));
>  
>      update_iteration_initial_status(s);
>  
> @@ -3935,6 +3936,7 @@ static void *bg_migration_thread(void *opaque)
>          if (iter_state == MIG_ITERATE_SKIP) {
>              continue;
>          } else if (iter_state == MIG_ITERATE_BREAK) {
> +            bg_migration_completion(s, fb);
>              break;
>          }
>  
> diff --git a/migration/migration.h b/migration/migration.h
> index db6708326b1..bdcd74ce084 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -151,7 +151,6 @@ struct MigrationState {
>      QEMUBH *vm_start_bh;
>      QEMUBH *cleanup_bh;
>      QEMUFile *to_dst_file;
> -    QIOChannelBuffer *bioc;
>      /*
>       * Protects to_dst_file pointer.  We need to make sure we won't
>       * yield or hang during the critical section, since this lock will
> diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
> index afc3a7f642a..c1bf71510f8 100644
> --- a/migration/qemu-file-channel.c
> +++ b/migration/qemu-file-channel.c
> @@ -26,6 +26,7 @@
>  #include "qemu-file-channel.h"
>  #include "qemu-file.h"
>  #include "io/channel-socket.h"
> +#include "io/channel-buffer.h"
>  #include "qemu/iov.h"
>  #include "qemu/yank.h"
>  
> @@ -196,3 +197,16 @@ QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc)
>      object_ref(OBJECT(ioc));
>      return qemu_fopen_ops(ioc, &channel_output_ops);
>  }
> +
> +/*
> + * Splice all the data in `buffer' into `dst'.  Note that `buffer' must points
> + * to a QEMUFile that was created with qemu_fopen_channel_output().
> + */
> +void qemu_put_qio_channel_buffer(QEMUFile *dst, QEMUFile *buffer)
> +{
> +    QIOChannelBuffer *bioc = QIO_CHANNEL_BUFFER(qemu_file_get_opaque(buffer));
> +
> +    /* Make sure data cached in QEMUFile flushed to QIOChannel buffers */
> +    qemu_fflush(buffer);
> +    qemu_put_buffer(dst, bioc->data, bioc->usage);
> +}
> diff --git a/migration/qemu-file-channel.h b/migration/qemu-file-channel.h
> index 0028a09eb61..5f165527616 100644
> --- a/migration/qemu-file-channel.h
> +++ b/migration/qemu-file-channel.h
> @@ -29,4 +29,6 @@
>  
>  QEMUFile *qemu_fopen_channel_input(QIOChannel *ioc);
>  QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc);
> +void qemu_put_qio_channel_buffer(QEMUFile *dst, QEMUFile *buffer);
> +
>  #endif
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index d6e03dbc0e0..317f98fc8f5 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -112,6 +112,10 @@ QEMUFile *qemu_fopen_ops(void *opaque, const QEMUFileOps *ops)
>      return f;
>  }
>  
> +void *qemu_file_get_opaque(QEMUFile *f)
> +{
> +    return f->opaque;
> +}
>  
>  void qemu_file_set_hooks(QEMUFile *f, const QEMUFileHooks *hooks)
>  {
> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index a9b6d6ccb7d..30c8ec855ac 100644
> --- a/migration/qemu-file.h
> +++ b/migration/qemu-file.h
> @@ -161,6 +161,7 @@ int qemu_file_shutdown(QEMUFile *f);
>  QEMUFile *qemu_file_get_return_path(QEMUFile *f);
>  void qemu_fflush(QEMUFile *f);
>  void qemu_file_set_blocking(QEMUFile *f, bool block);
> +void *qemu_file_get_opaque(QEMUFile *f);
>  
>  void ram_control_before_iterate(QEMUFile *f, uint64_t flags);
>  void ram_control_after_iterate(QEMUFile *f, uint64_t flags);
> -- 
> 2.26.2
> 

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


