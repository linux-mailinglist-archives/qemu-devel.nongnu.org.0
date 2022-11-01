Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD52615063
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:16:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opsbx-0005nD-8B; Tue, 01 Nov 2022 10:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1opsbl-0005n1-7P
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:51:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1opsbh-000167-Qj
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:51:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667314272;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=uhD8YOUFjzZgF0lGF9T3GeD5xc/Q0yRByxtlcei+N7s=;
 b=RxmfAAYteFrS+zwkJ3pQbQXEO1YdN2mro1rC7dPSH0JhMlGuR+uMx+QpwBF5OGy8vGTsSJ
 mO//ZnrZQiYVxd8WBwGA8qdwPStGL/c4knFCapRkJZZ6CdzklJPoX8MX0NRu+W9HekVWVr
 MLY+0OPVmDReui2WXrWcxjkJM4OxLO0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-GhVJZDJgOrGmRBv7Sw7C6A-1; Tue, 01 Nov 2022 10:51:09 -0400
X-MC-Unique: GhVJZDJgOrGmRBv7Sw7C6A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4537A1C08984;
 Tue,  1 Nov 2022 14:51:09 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3964B492B18;
 Tue,  1 Nov 2022 14:51:05 +0000 (UTC)
Date: Tue, 1 Nov 2022 14:51:02 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel@nongnu.org, peterx@redhat.com
Subject: Re: [PATCH] migration: check magic value for deciding the mapping of
 channels
Message-ID: <Y2EyVkdLMln7CX15@redhat.com>
References: <20221101143029.14246-1-manish.mishra@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221101143029.14246-1-manish.mishra@nutanix.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 01, 2022 at 02:30:29PM +0000, manish.mishra wrote:
> Current logic assumes that channel connections on the destination side are
> always established in the same order as the source and the first one will
> always be the default channel followed by the multifid or post-copy
> preemption channel. This may not be always true, as even if a channel has a
> connection established on the source side it can be in the pending state on
> the destination side and a newer connection can be established first.
> Basically causing out of order mapping of channels on the destination side.
> Currently, all channels except post-copy preempt send a magic number, this
> patch uses that magic number to decide the type of channel. This logic is
> applicable only for precopy(multifd) live migration, as mentioned, the
> post-copy preempt channel does not send any magic number. Also, this patch
> uses MSG_PEEK to check the magic number of channels so that current
> data/control stream management remains un-effected.
> 
> Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
> ---
>  include/io/channel.h     | 25 +++++++++++++++++++++++++
>  io/channel-socket.c      | 27 +++++++++++++++++++++++++++
>  io/channel.c             | 39 +++++++++++++++++++++++++++++++++++++++
>  migration/migration.c    | 33 +++++++++++++++++++++------------
>  migration/multifd.c      | 12 ++++--------
>  migration/multifd.h      |  2 +-
>  migration/postcopy-ram.c |  5 +----
>  migration/postcopy-ram.h |  2 +-
>  8 files changed, 119 insertions(+), 26 deletions(-)
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

There's no io_read_peek for  QIOChannelTLS, so we'll hit this
error...


> diff --git a/migration/migration.c b/migration/migration.c
> index 739bb683f3..f4b6f278a9 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -733,31 +733,40 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
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
> +    if (migrate_use_multifd() && !migration_in_postcopy()) {
> +        ret = qio_channel_read_peek_all(ioc, (void *)&channel_magic,
> +                                        sizeof(channel_magic), &local_err);
> +
> +        if (ret != 1) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }

....and thus this will fail for TLS channels AFAICT.


> +
> +        default_channel = (channel_magic == cpu_to_be32(QEMU_VM_FILE_MAGIC));
> +    } else {
> +        default_channel = !mis->from_src_file;
> +    }

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


