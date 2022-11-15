Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE3762A07B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 18:37:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouzrU-0004VA-9f; Tue, 15 Nov 2022 12:36:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ouzrL-0004UP-0r
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 12:36:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ouzrH-0003Au-A7
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 12:36:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668533785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RyhhcClFaDhCjk3eMQIwjC7MmEs6HeUDcu+iOdObC0s=;
 b=bc7zU8iNxEf+n/HnuYmj6obVYjZGVEQZArGOo8RFsfGhy5kbGlogCEbNdvGXmS5bi1IkIl
 kmBZpigg9t6gzucGCUL+hCzfOvNADOolsCNbHNjSt6Tz+1ZcTC64el0mH4YC471x34uTTl
 WvkKumXj86zaPcFZT2UGz7pbzLIjugw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-421-CCPaMjihOCq_9kcQJCyDPw-1; Tue, 15 Nov 2022 12:36:24 -0500
X-MC-Unique: CCPaMjihOCq_9kcQJCyDPw-1
Received: by mail-qk1-f197.google.com with SMTP id
 bi42-20020a05620a31aa00b006faaa1664b9so14183423qkb.8
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 09:36:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RyhhcClFaDhCjk3eMQIwjC7MmEs6HeUDcu+iOdObC0s=;
 b=5nyc/MEtkuxYOkiEp2wUvzVNxlXdp0+GRGMTudTYTio0CjMTvjEJPHOgUFnJnq6wAR
 bxYHc7Jz7lo4AjVVjLpMvPESI/mgLzVtfgO9dC+UB8YcuxohlLMHIwwpq6+6BbNRd25S
 uId3HTPqkjW6LVlX3l5zHPOPOqk9RrMSCESpnSlJ5JvI2MGfNs/fH+yJFGKrtnZTtJAp
 yIQib13sHTVKIRi8d9uqCkdjUIXjlRaolVg3wkuRxCaWATvhSS6iJlwLj1T6v7eHB4tU
 sx5oczk92Wsybct32UOQ0IY28AhpjxtsCjGgw7KVgKVl1bnTlbyl1BR6Pb9cuKEN7wOg
 zDow==
X-Gm-Message-State: ANoB5pkaWeWyVz3f4+RDIMP5DVxHmK690jlrdJvRUKudBVvefsLjpU7q
 H4uGfCI3/T8sh6Y67XqIJs02yfGfl9RRC3WAubOUsafatLZ8WNVW38lkyCwgB2XzmqZxoX6UdD+
 AkCAVo3ELUNAkraw=
X-Received: by 2002:a05:622a:130b:b0:3a5:a41:728e with SMTP id
 v11-20020a05622a130b00b003a50a41728emr17331428qtk.46.1668533783361; 
 Tue, 15 Nov 2022 09:36:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf67/Ooh2vTj1txviI8S+J5SNHuDnC0sY4Q5DOUWxEHUdUa9nnuwsVpv5H2QGGXxCd5OqykRuw==
X-Received: by 2002:a05:622a:130b:b0:3a5:a41:728e with SMTP id
 v11-20020a05622a130b00b003a50a41728emr17331399qtk.46.1668533783001; 
 Tue, 15 Nov 2022 09:36:23 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 w15-20020a05620a424f00b006fa4cac54a4sm8507089qko.133.2022.11.15.09.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 09:36:22 -0800 (PST)
Date: Tue, 15 Nov 2022 12:36:21 -0500
From: Peter Xu <peterx@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com
Subject: Re: [PATCH v2] migration: check magic value for deciding the mapping
 of channels
Message-ID: <Y3POFd+LFuxW8w21@x1n>
References: <20221107165159.49534-1-manish.mishra@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221107165159.49534-1-manish.mishra@nutanix.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi, Manish,

On Mon, Nov 07, 2022 at 04:51:59PM +0000, manish.mishra wrote:
> Current logic assumes that channel connections on the destination side are
> always established in the same order as the source and the first one will
> always be the main channel followed by the multifid or post-copy
> preemption channel. This may not be always true, as even if a channel has a
> connection established on the source side it can be in the pending state on
> the destination side and a newer connection can be established first.
> Basically causing out of order mapping of channels on the destination side.
> Currently, all channels except post-copy preempt send a magic number, this
> patch uses that magic number to decide the type of channel. This logic is
> applicable only for precopy(multifd) live migration, as mentioned, the
> post-copy preempt channel does not send any magic number. Also, tls live
> migrations already does tls handshake before creating other channels, so
> this issue is not possible with tls, hence this logic is avoided for tls
> live migrations. This patch uses MSG_PEEK to check the magic number of
> channels so that current data/control stream management remains
> un-effected.
> 
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
> 
> v2:
>   TLS does not support MSG_PEEK, so V1 was broken for tls live
>   migrations. For tls live migration, while initializing main channel
>   tls handshake is done before we can create other channels, so this
>   issue is not possible for tls live migrations. In V2 added a check
>   to avoid checking magic number for tls live migration and fallback
>   to older method to decide mapping of channels on destination side.
> ---
>  include/io/channel.h     | 25 +++++++++++++++++++++++
>  io/channel-socket.c      | 27 ++++++++++++++++++++++++
>  io/channel.c             | 39 +++++++++++++++++++++++++++++++++++
>  migration/migration.c    | 44 +++++++++++++++++++++++++++++-----------
>  migration/multifd.c      | 12 ++++-------
>  migration/multifd.h      |  2 +-
>  migration/postcopy-ram.c |  5 +----
>  migration/postcopy-ram.h |  2 +-
>  8 files changed, 130 insertions(+), 26 deletions(-)
> 
> diff --git a/include/io/channel.h b/include/io/channel.h
> index c680ee7480..74177aeeea 100644
> --- a/include/io/channel.h
> +++ b/include/io/channel.h
> @@ -115,6 +115,10 @@ struct QIOChannelClass {
>                          int **fds,
>                          size_t *nfds,
>                          Error **errp);
> +    ssize_t (*io_read_peek)(QIOChannel *ioc,
> +                            void *buf,
> +                            size_t nbytes,
> +                            Error **errp);
>      int (*io_close)(QIOChannel *ioc,
>                      Error **errp);
>      GSource * (*io_create_watch)(QIOChannel *ioc,
> @@ -475,6 +479,27 @@ int qio_channel_write_all(QIOChannel *ioc,
>                            size_t buflen,
>                            Error **errp);
>  
> +/**
> + * qio_channel_read_peek_all:
> + * @ioc: the channel object
> + * @buf: the memory region to read in data
> + * @nbytes: the number of bytes to read
> + * @errp: pointer to a NULL-initialized error object
> + *
> + * Read given @nbytes data from peek of channel into
> + * memory region @buf.
> + *
> + * The function will be blocked until read size is
> + * equal to requested size.
> + *
> + * Returns: 1 if all bytes were read, 0 if end-of-file
> + *          occurs without data, or -1 on error
> + */
> +int qio_channel_read_peek_all(QIOChannel *ioc,
> +                              void* buf,
> +                              size_t nbytes,
> +                              Error **errp);
> +
>  /**
>   * qio_channel_set_blocking:
>   * @ioc: the channel object
> diff --git a/io/channel-socket.c b/io/channel-socket.c
> index b76dca9cc1..b99f5dfda6 100644
> --- a/io/channel-socket.c
> +++ b/io/channel-socket.c
> @@ -705,6 +705,32 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>  }
>  #endif /* WIN32 */
>  
> +static ssize_t qio_channel_socket_read_peek(QIOChannel *ioc,
> +                                            void *buf,
> +                                            size_t nbytes,
> +                                            Error **errp)
> +{
> +    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
> +    ssize_t bytes = 0;
> +
> +retry:
> +    bytes = recv(sioc->fd, buf, nbytes, MSG_PEEK);
> +
> +    if (bytes < 0) {
> +        if (errno == EINTR) {
> +            goto retry;
> +        }
> +        if (errno == EAGAIN) {
> +            return QIO_CHANNEL_ERR_BLOCK;
> +        }
> +
> +        error_setg_errno(errp, errno,
> +                         "Unable to read from peek of socket");
> +        return -1;
> +    }
> +
> +    return bytes;
> +}
>  
>  #ifdef QEMU_MSG_ZEROCOPY
>  static int qio_channel_socket_flush(QIOChannel *ioc,
> @@ -902,6 +928,7 @@ static void qio_channel_socket_class_init(ObjectClass *klass,
>  
>      ioc_klass->io_writev = qio_channel_socket_writev;
>      ioc_klass->io_readv = qio_channel_socket_readv;
> +    ioc_klass->io_read_peek = qio_channel_socket_read_peek;
>      ioc_klass->io_set_blocking = qio_channel_socket_set_blocking;
>      ioc_klass->io_close = qio_channel_socket_close;
>      ioc_klass->io_shutdown = qio_channel_socket_shutdown;
> diff --git a/io/channel.c b/io/channel.c
> index 0640941ac5..a2d9b96f3f 100644
> --- a/io/channel.c
> +++ b/io/channel.c
> @@ -346,6 +346,45 @@ int qio_channel_write_all(QIOChannel *ioc,
>      return qio_channel_writev_all(ioc, &iov, 1, errp);
>  }
>  
> +int qio_channel_read_peek_all(QIOChannel *ioc,
> +                              void* buf,
> +                              size_t nbytes,
> +                              Error **errp)
> +{
> +   QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
> +   ssize_t bytes = 0;
> +
> +   if (!klass->io_read_peek) {
> +       error_setg(errp, "Channel does not support read peek");
> +       return -1;
> +   }
> +
> +   while (bytes < nbytes) {
> +       bytes = klass->io_read_peek(ioc,
> +                                   buf,
> +                                   nbytes,
> +                                   errp);

IIUC here you need to accumulate bytes rather than directly reusing it, so
e.g. two reads on 2 bytes each will satisfy a 4 bytes read.

> +
> +       if (bytes == QIO_CHANNEL_ERR_BLOCK) {
> +            if (qemu_in_coroutine()) {
> +                qio_channel_yield(ioc, G_IO_OUT);

G_IO_IN?  Same question for two lines after.

> +            } else {
> +                qio_channel_wait(ioc, G_IO_OUT);
> +            }
> +            continue;
> +       }
> +       if (bytes == 0) {
> +           error_setg(errp,
> +                      "Unexpected end-of-file on channel");

IIUC for a generic API we should still allow the peek to get a close event
on the socket.  Then we can return 0 safely and let the caller decide,
rather than always assuming it's a fault.

> +           return 0;
> +       }
> +       if (bytes < 0) {
> +           return -1;
> +       }
> +   }
> +
> +   return 1;
> +}
>  
>  int qio_channel_set_blocking(QIOChannel *ioc,
>                                bool enabled,
> diff --git a/migration/migration.c b/migration/migration.c
> index 739bb683f3..406a9e2f72 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -733,31 +733,51 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
>  {
>      MigrationIncomingState *mis = migration_incoming_get_current();
>      Error *local_err = NULL;
> -    bool start_migration;
>      QEMUFile *f;
> +    bool default_channel = true;
> +    uint32_t channel_magic = 0;
> +    int ret = 0;
>  
> -    if (!mis->from_src_file) {
> -        /* The first connection (multifd may have multiple) */
> +    if (migrate_use_multifd() && !migration_in_postcopy() &&

It's weird to check postcopy status here.  Do you perhaps want to use
migrate_postcopy_ram() or migrate_postcopy_preempt()?

Note that I am tempted to disable multifd with postcopy in general before a
full support is implemented, I'm not the only one who thinks so..  But
that'll need to be discussed elsewhere, and yeah it's always safe now to
check with either above (not migration_in_postcopy, though).

> +        !migrate_use_tls()) {

I'd rather don't check TLS explicitly.  Can we perhaps try to detect the
peek capability and then fallback to old method if peek() is not supported
on the channel?  Below comment would still be nice to have though, and I
also agree TLS seems to be safe.

Thanks,

> +        /*
> +         * With multiple channels, it is possible that we receive channels
> +         * out of order on destination side, causing incorrect mapping of
> +         * source channels on destination side. Check channel MAGIC to
> +         * decide type of channel. Please note this is best effort, postcopy
> +         * preempt channel does not send any magic number so avoid it for
> +         * postcopy live migration. Also tls live migration already does
> +         * tls handshake while initializing main channel so with tls this
> +         * issue is not possible.
> +         */
> +        ret = qio_channel_read_peek_all(ioc, (void *)&channel_magic,
> +                                        sizeof(channel_magic), &local_err);
> +
> +        if (ret != 1) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }
> +
> +        default_channel = (channel_magic == cpu_to_be32(QEMU_VM_FILE_MAGIC));
> +    } else {
> +        default_channel = !mis->from_src_file;
> +    }
> +
> +    if (default_channel) {
>          f = qemu_file_new_input(ioc);
>  
>          if (!migration_incoming_setup(f, errp)) {
>              return;
>          }
> -
> -        /*
> -         * Common migration only needs one channel, so we can start
> -         * right now.  Some features need more than one channel, we wait.
> -         */
> -        start_migration = !migration_needs_multiple_sockets();
>      } else {
>          /* Multiple connections */
>          assert(migration_needs_multiple_sockets());
>          if (migrate_use_multifd()) {
> -            start_migration = multifd_recv_new_channel(ioc, &local_err);
> +            multifd_recv_new_channel(ioc, &local_err);
>          } else {
>              assert(migrate_postcopy_preempt());
>              f = qemu_file_new_input(ioc);
> -            start_migration = postcopy_preempt_new_channel(mis, f);
> +            postcopy_preempt_new_channel(mis, f);
>          }
>          if (local_err) {
>              error_propagate(errp, local_err);
> @@ -765,7 +785,7 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
>          }
>      }
>  
> -    if (start_migration) {
> +    if (migration_has_all_channels()) {
>          /* If it's a recovery, we're done */
>          if (postcopy_try_recover()) {
>              return;
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 586ddc9d65..be86a4d07f 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -1220,11 +1220,9 @@ bool multifd_recv_all_channels_created(void)
>  
>  /*
>   * Try to receive all multifd channels to get ready for the migration.
> - * - Return true and do not set @errp when correctly receiving all channels;
> - * - Return false and do not set @errp when correctly receiving the current one;
> - * - Return false and set @errp when failing to receive the current channel.
> + * Sets @errp when failing to receive the current channel.
>   */
> -bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
> +void multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
>  {
>      MultiFDRecvParams *p;
>      Error *local_err = NULL;
> @@ -1237,7 +1235,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
>                                  "failed to receive packet"
>                                  " via multifd channel %d: ",
>                                  qatomic_read(&multifd_recv_state->count));
> -        return false;
> +        return;
>      }
>      trace_multifd_recv_new_channel(id);
>  
> @@ -1247,7 +1245,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
>                     id);
>          multifd_recv_terminate_threads(local_err);
>          error_propagate(errp, local_err);
> -        return false;
> +        return;
>      }
>      p->c = ioc;
>      object_ref(OBJECT(ioc));
> @@ -1258,6 +1256,4 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
>      qemu_thread_create(&p->thread, p->name, multifd_recv_thread, p,
>                         QEMU_THREAD_JOINABLE);
>      qatomic_inc(&multifd_recv_state->count);
> -    return qatomic_read(&multifd_recv_state->count) ==
> -           migrate_multifd_channels();
>  }
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 519f498643..913e4ba274 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -18,7 +18,7 @@ void multifd_save_cleanup(void);
>  int multifd_load_setup(Error **errp);
>  int multifd_load_cleanup(Error **errp);
>  bool multifd_recv_all_channels_created(void);
> -bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
> +void multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
>  void multifd_recv_sync_main(void);
>  int multifd_send_sync_main(QEMUFile *f);
>  int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset);
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index b9a37ef255..f84f783ab4 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -1539,7 +1539,7 @@ void postcopy_unregister_shared_ufd(struct PostCopyFD *pcfd)
>      }
>  }
>  
> -bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
> +void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
>  {
>      /*
>       * The new loading channel has its own threads, so it needs to be
> @@ -1548,9 +1548,6 @@ bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
>      qemu_file_set_blocking(file, true);
>      mis->postcopy_qemufile_dst = file;
>      trace_postcopy_preempt_new_channel();
> -
> -    /* Start the migration immediately */
> -    return true;
>  }
>  
>  /*
> diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
> index 6147bf7d1d..25881c4127 100644
> --- a/migration/postcopy-ram.h
> +++ b/migration/postcopy-ram.h
> @@ -190,7 +190,7 @@ enum PostcopyChannels {
>      RAM_CHANNEL_MAX,
>  };
>  
> -bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
> +void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
>  int postcopy_preempt_setup(MigrationState *s, Error **errp);
>  int postcopy_preempt_wait_channel(MigrationState *s);
>  
> -- 
> 2.22.3
> 

-- 
Peter Xu


