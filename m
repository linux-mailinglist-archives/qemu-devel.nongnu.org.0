Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA8F4BF3C4
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 09:36:40 +0100 (CET)
Received: from localhost ([::1]:47436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMQf1-0000F0-0J
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 03:36:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nMQcx-0007qt-Aw
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 03:34:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nMQcs-000576-38
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 03:34:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645518861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6W/Tgcex0Y7fVC7LK1gPqhw87/zTH3vooBLA477bTL4=;
 b=ZtRqFRngnR8ZfzzyzS78++sgCh4WfAD9a8ToAD1XCZqOYMiaFgJW3D35GmtOWGraisy82D
 SBV2/TlTTGacoRAoWQn3R0Gb9DF6k5LdpEKMeskj1aC5QjzvcnqIl0ImeZyw0WF11eCa8s
 FrWXWd4J90nViwLmTyulEWntr9pXLxo=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-y4ODC6iLPB2DdKfnlOlWrQ-1; Tue, 22 Feb 2022 03:34:19 -0500
X-MC-Unique: y4ODC6iLPB2DdKfnlOlWrQ-1
Received: by mail-pf1-f200.google.com with SMTP id
 z20-20020aa791d4000000b004bd024eaf19so6563463pfa.16
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 00:34:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6W/Tgcex0Y7fVC7LK1gPqhw87/zTH3vooBLA477bTL4=;
 b=0cr83KtLNdKnmQ3gsStC11syRUKylnpKibTGzfqmiIWlBDrWEYHPIU5tmdeFagmV9b
 c0VXAtG95P1WsgkyWTZof6h+z03/wXS7O3zIiaLoQC4MeZIq1ZNN8x4I4QxZp6zSiK9J
 jwE+soRTSg2qtUKs9FyoL45XmOS+av3H67r4LjqMLThqRLZt1xp95AXy54cxKyUVtc63
 ZuYytg4rJuOTS3NgoTvld0NsxKSHe5EsIjpEXbINPms3vkGpvYKbJkYa1jPUz2gV1ceu
 fwjxMizbEOy1MlY1RUp/pvWl9r8+hxmnxXsaIP+zXIyjU6QKO3KS1EcvtD54+x9LTSVA
 lDCQ==
X-Gm-Message-State: AOAM531uzatAsPoprJ4ajlLnIof3ZM7pHI/Bkme0m6ahy8bfW0yh/Q9e
 2FvajhYqpEpzg1YzcfwsAy9lDkI8tlgUh7KFZ3YvY0otB77H67x/D0MmHN1dAlzyPl8heOkHYjM
 bAxkYOcVvut1MTWI=
X-Received: by 2002:a05:6a00:1954:b0:4e1:7791:6a8e with SMTP id
 s20-20020a056a00195400b004e177916a8emr23967736pfk.77.1645518858433; 
 Tue, 22 Feb 2022 00:34:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzj7E0cHEtjZMmZ4FjnN9tIju0ySXmzGh45QAJg6EEjEpmwqsdrsBAxxoANvhFw4RBbqPqbEw==
X-Received: by 2002:a05:6a00:1954:b0:4e1:7791:6a8e with SMTP id
 s20-20020a056a00195400b004e177916a8emr23967707pfk.77.1645518857955; 
 Tue, 22 Feb 2022 00:34:17 -0800 (PST)
Received: from xz-m1.local ([64.64.123.101]) by smtp.gmail.com with ESMTPSA id
 q93-20020a17090a4fe600b001b9ba2a1dc3sm1736017pjh.25.2022.02.22.00.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 00:34:17 -0800 (PST)
Date: Tue, 22 Feb 2022 16:34:05 +0800
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 17/20] migration: Postcopy preemption preparation on
 channel creation
Message-ID: <YhSf/a9Fjc5rhKZ5@xz-m1.local>
References: <20220216062809.57179-1-peterx@redhat.com>
 <20220216062809.57179-18-peterx@redhat.com>
 <YhPcaB4ju2gWTJPW@work-vm>
MIME-Version: 1.0
In-Reply-To: <YhPcaB4ju2gWTJPW@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, URG_BIZ=0.573 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 21, 2022 at 06:39:36PM +0000, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > Create a new socket for postcopy to be prepared to send postcopy requested
> > pages via this specific channel, so as to not get blocked by precopy pages.
> > 
> > A new thread is also created on dest qemu to receive data from this new channel
> > based on the ram_load_postcopy() routine.
> > 
> > The ram_load_postcopy(POSTCOPY) branch and the thread has not started to
> > function, and that'll be done in follow up patches.
> > 
> > Cleanup the new sockets on both src/dst QEMUs, meanwhile look after the new
> > thread too to make sure it'll be recycled properly.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  migration/migration.c    | 62 ++++++++++++++++++++++++----
> >  migration/migration.h    |  8 ++++
> >  migration/postcopy-ram.c | 88 ++++++++++++++++++++++++++++++++++++++--
> >  migration/postcopy-ram.h | 10 +++++
> >  migration/ram.c          | 25 ++++++++----
> >  migration/ram.h          |  4 +-
> >  migration/socket.c       | 22 +++++++++-
> >  migration/socket.h       |  1 +
> >  migration/trace-events   |  3 ++
> >  9 files changed, 203 insertions(+), 20 deletions(-)
> > 
> > diff --git a/migration/migration.c b/migration/migration.c
> > index 4c22bad304..3d7f897b72 100644
> > --- a/migration/migration.c
> > +++ b/migration/migration.c
> > @@ -321,6 +321,12 @@ void migration_incoming_state_destroy(void)
> >          mis->page_requested = NULL;
> >      }
> >  
> > +    if (mis->postcopy_qemufile_dst) {
> > +        migration_ioc_unregister_yank_from_file(mis->postcopy_qemufile_dst);
> > +        qemu_fclose(mis->postcopy_qemufile_dst);
> > +        mis->postcopy_qemufile_dst = NULL;
> > +    }
> > +
> >      yank_unregister_instance(MIGRATION_YANK_INSTANCE);
> >  }
> >  
> > @@ -714,15 +720,21 @@ void migration_fd_process_incoming(QEMUFile *f, Error **errp)
> >      migration_incoming_process();
> >  }
> >  
> > +static bool migration_needs_multiple_sockets(void)
> > +{
> > +    return migrate_use_multifd() || migrate_postcopy_preempt();
> > +}
> > +
> >  void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
> >  {
> >      MigrationIncomingState *mis = migration_incoming_get_current();
> >      Error *local_err = NULL;
> >      bool start_migration;
> > +    QEMUFile *f;
> >  
> >      if (!mis->from_src_file) {
> >          /* The first connection (multifd may have multiple) */
> > -        QEMUFile *f = qemu_fopen_channel_input(ioc);
> > +        f = qemu_fopen_channel_input(ioc);
> >  
> >          if (!migration_incoming_setup(f, errp)) {
> >              return;
> > @@ -730,13 +742,18 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
> >  
> >          /*
> >           * Common migration only needs one channel, so we can start
> > -         * right now.  Multifd needs more than one channel, we wait.
> > +         * right now.  Some features need more than one channel, we wait.
> >           */
> > -        start_migration = !migrate_use_multifd();
> > +        start_migration = !migration_needs_multiple_sockets();
> >      } else {
> >          /* Multiple connections */
> > -        assert(migrate_use_multifd());
> > -        start_migration = multifd_recv_new_channel(ioc, &local_err);
> > +        assert(migration_needs_multiple_sockets());
> > +        if (migrate_use_multifd()) {
> > +            start_migration = multifd_recv_new_channel(ioc, &local_err);
> > +        } else if (migrate_postcopy_preempt()) {
> > +            f = qemu_fopen_channel_input(ioc);
> > +            start_migration = postcopy_preempt_new_channel(mis, f);
> > +        }
> >          if (local_err) {
> >              error_propagate(errp, local_err);
> >              return;
> > @@ -761,11 +778,20 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
> >  bool migration_has_all_channels(void)
> >  {
> >      MigrationIncomingState *mis = migration_incoming_get_current();
> > -    bool all_channels;
> >  
> > -    all_channels = multifd_recv_all_channels_created();
> > +    if (!mis->from_src_file) {
> > +        return false;
> > +    }
> > +
> > +    if (migrate_use_multifd()) {
> > +        return multifd_recv_all_channels_created();
> > +    }
> > +
> > +    if (migrate_postcopy_preempt()) {
> > +        return mis->postcopy_qemufile_dst != NULL;
> > +    }
> >  
> > -    return all_channels && mis->from_src_file != NULL;
> > +    return true;
> >  }
> >  
> >  /*
> > @@ -1858,6 +1884,12 @@ static void migrate_fd_cleanup(MigrationState *s)
> >          qemu_fclose(tmp);
> >      }
> >  
> > +    if (s->postcopy_qemufile_src) {
> > +        migration_ioc_unregister_yank_from_file(s->postcopy_qemufile_src);
> > +        qemu_fclose(s->postcopy_qemufile_src);
> > +        s->postcopy_qemufile_src = NULL;
> > +    }
> > +
> >      assert(!migration_is_active(s));
> >  
> >      if (s->state == MIGRATION_STATUS_CANCELLING) {
> > @@ -3233,6 +3265,11 @@ static void migration_completion(MigrationState *s)
> >          qemu_savevm_state_complete_postcopy(s->to_dst_file);
> >          qemu_mutex_unlock_iothread();
> >  
> > +        /* Shutdown the postcopy fast path thread */
> > +        if (migrate_postcopy_preempt()) {
> > +            postcopy_preempt_shutdown_file(s);
> > +        }
> > +
> >          trace_migration_completion_postcopy_end_after_complete();
> >      } else {
> >          goto fail;
> > @@ -4120,6 +4157,15 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
> >          }
> >      }
> >  
> > +    /* This needs to be done before resuming a postcopy */
> > +    if (postcopy_preempt_setup(s, &local_err)) {
> > +        error_report_err(local_err);
> > +        migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
> > +                          MIGRATION_STATUS_FAILED);
> > +        migrate_fd_cleanup(s);
> > +        return;
> > +    }
> > +
> >      if (resume) {
> >          /* Wakeup the main migration thread to do the recovery */
> >          migrate_set_state(&s->state, MIGRATION_STATUS_POSTCOPY_PAUSED,
> > diff --git a/migration/migration.h b/migration/migration.h
> > index af4bcb19c2..caa910d956 100644
> > --- a/migration/migration.h
> > +++ b/migration/migration.h
> > @@ -23,6 +23,7 @@
> >  #include "io/channel-buffer.h"
> >  #include "net/announce.h"
> >  #include "qom/object.h"
> > +#include "postcopy-ram.h"
> >  
> >  struct PostcopyBlocktimeContext;
> >  
> > @@ -112,6 +113,11 @@ struct MigrationIncomingState {
> >       * enabled.
> >       */
> >      unsigned int postcopy_channels;
> > +    /* QEMUFile for postcopy only; it'll be handled by a separate thread */
> > +    QEMUFile *postcopy_qemufile_dst;
> > +    /* Postcopy priority thread is used to receive postcopy requested pages */
> > +    QemuThread postcopy_prio_thread;
> > +    bool postcopy_prio_thread_created;
> >      /*
> >       * An array of temp host huge pages to be used, one for each postcopy
> >       * channel.
> > @@ -192,6 +198,8 @@ struct MigrationState {
> >      QEMUBH *cleanup_bh;
> >      /* Protected by qemu_file_lock */
> >      QEMUFile *to_dst_file;
> > +    /* Postcopy specific transfer channel */
> > +    QEMUFile *postcopy_qemufile_src;
> >      QIOChannelBuffer *bioc;
> >      /*
> >       * Protects to_dst_file/from_dst_file pointers.  We need to make sure we
> > diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> > index 738cc55fa6..30eddaacd1 100644
> > --- a/migration/postcopy-ram.c
> > +++ b/migration/postcopy-ram.c
> > @@ -32,6 +32,9 @@
> >  #include "trace.h"
> >  #include "hw/boards.h"
> >  #include "exec/ramblock.h"
> > +#include "socket.h"
> > +#include "qemu-file-channel.h"
> > +#include "yank_functions.h"
> >  
> >  /* Arbitrary limit on size of each discard command,
> >   * keeps them around ~200 bytes
> > @@ -566,6 +569,11 @@ int postcopy_ram_incoming_cleanup(MigrationIncomingState *mis)
> >  {
> >      trace_postcopy_ram_incoming_cleanup_entry();
> >  
> > +    if (mis->postcopy_prio_thread_created) {
> > +        qemu_thread_join(&mis->postcopy_prio_thread);
> > +        mis->postcopy_prio_thread_created = false;
> > +    }
> > +
> >      if (mis->have_fault_thread) {
> >          Error *local_err = NULL;
> >  
> > @@ -1101,8 +1109,13 @@ static int postcopy_temp_pages_setup(MigrationIncomingState *mis)
> >      int err, i, channels;
> >      void *temp_page;
> >  
> > -    /* TODO: will be boosted when enable postcopy preemption */
> > -    mis->postcopy_channels = 1;
> > +    if (migrate_postcopy_preempt()) {
> > +        /* If preemption enabled, need extra channel for urgent requests */
> > +        mis->postcopy_channels = RAM_CHANNEL_MAX;
> > +    } else {
> > +        /* Both precopy/postcopy on the same channel */
> > +        mis->postcopy_channels = 1;
> > +    }
> >  
> >      channels = mis->postcopy_channels;
> >      mis->postcopy_tmp_pages = g_malloc0_n(sizeof(PostcopyTmpPage), channels);
> > @@ -1169,7 +1182,7 @@ int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
> >          return -1;
> >      }
> >  
> > -    postcopy_thread_create(mis, &mis->fault_thread, "postcopy/fault",
> > +    postcopy_thread_create(mis, &mis->fault_thread, "qemu/fault-default",
> 
> That name is still too long; I'd lose the 'qemu/'

Sure.

> 
> >                             postcopy_ram_fault_thread, QEMU_THREAD_JOINABLE);
> >      mis->have_fault_thread = true;
> >  
> > @@ -1184,6 +1197,16 @@ int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
> >          return -1;
> >      }
> >  
> > +    if (migrate_postcopy_preempt()) {
> > +        /*
> > +         * This thread needs to be created after the temp pages because it'll fetch
> > +         * RAM_CHANNEL_POSTCOPY PostcopyTmpPage immediately.
> > +         */
> > +        postcopy_thread_create(mis, &mis->postcopy_prio_thread, "qemu/fault-fast",
> 
> and that one.

OK.

> 
> > +                               postcopy_preempt_thread, QEMU_THREAD_JOINABLE);
> > +        mis->postcopy_prio_thread_created = true;
> > +    }
> > +
> >      trace_postcopy_ram_enable_notify();
> >  
> >      return 0;
> > @@ -1513,3 +1536,62 @@ void postcopy_unregister_shared_ufd(struct PostCopyFD *pcfd)
> >          }
> >      }
> >  }
> > +
> > +bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
> > +{
> > +    mis->postcopy_qemufile_dst = file;
> > +
> > +    trace_postcopy_preempt_new_channel();
> > +
> > +    /* Start the migration immediately */
> > +    return true;
> > +}
> > +
> > +int postcopy_preempt_setup(MigrationState *s, Error **errp)
> > +{
> > +    QIOChannel *ioc;
> > +
> > +    if (!migrate_postcopy_preempt()) {
> > +        return 0;
> > +    }
> > +
> > +    if (!migrate_multi_channels_is_allowed()) {
> > +        error_setg(errp, "Postcopy preempt is not supported as current "
> > +                   "migration stream does not support multi-channels.");
> > +        return -1;
> > +    }
> > +
> > +    ioc = socket_send_channel_create_sync(errp);
> 
> How do we get away with doing this sync here, but have to use async for
> multifd?

Ah right..  I think both will work?  But async (as what multifd is doing)
is definitely more elegant because synced version can block the main thread
for unexpected times.

I'll add a new patch to support async channel creations (assuming that's
better than squashing the change).

-- 
Peter Xu


