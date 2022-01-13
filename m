Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C1948D621
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 11:55:36 +0100 (CET)
Received: from localhost ([::1]:59024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7xlX-0003WE-Mi
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 05:55:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n7xjO-0001Ag-St
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 05:53:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n7xjL-0003dM-Cq
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 05:53:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642071197;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=RKmYJOUJyk7PFupuap45GZYtuiMKPHx+BVwSbcSna2E=;
 b=feofYegrYFRLqJj3FIjcEjvpvoX3bWU7jZ1w3n8XWyZCxF1VqCyq/soDZjHGke7H5pAz/A
 BqZ6Q0FWZKXFnPYp9m69zt2DIlW1vZ5JmvSoT0F4/kcrb4yXb4b2yo4G67gHq4hahpmSkJ
 ge5KQfY36CElH3Vz7dMLg2ygamrTV0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-mlgGmWdLN3WL-KVp3hwxpg-1; Thu, 13 Jan 2022 05:53:16 -0500
X-MC-Unique: mlgGmWdLN3WL-KVp3hwxpg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8F9F1923B82
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 10:53:15 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDBB27B9F5;
 Thu, 13 Jan 2022 10:52:44 +0000 (UTC)
Date: Thu, 13 Jan 2022 10:52:41 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v7 1/5] QIOChannel: Add flags on io_writev and introduce
 io_flush callback
Message-ID: <YeAEeZ1eDKqzDSc5@redhat.com>
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-2-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106221341.8779-2-leobras@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 06, 2022 at 07:13:38PM -0300, Leonardo Bras wrote:
> Add flags to io_writev and introduce io_flush as optional callback to
> QIOChannelClass, allowing the implementation of zero copy writes by
> subclasses.
> 
> How to use them:
> - Write data using qio_channel_writev(...,QIO_CHANNEL_WRITE_FLAG_ZERO_COPY),
> - Wait write completion with qio_channel_flush().
> 
> Notes:
> As some zero copy implementations work asynchronously, it's
> recommended to keep the write buffer untouched until the return of
> qio_channel_flush(), to avoid the risk of sending an updated buffer
> instead of the buffer state during write.
> 
> As io_flush callback is optional, if a subclass does not implement it, then:
> - io_flush will return 0 without changing anything.
> 
> Also, some functions like qio_channel_writev_full_all() were adapted to
> receive a flag parameter. That allows shared code between zero copy and
> non-zero copy writev, and also an easier implementation on new flags.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  include/io/channel.h | 67 +++++++++++++++++++++++++++++++++++---------
>  io/channel-buffer.c  |  1 +
>  io/channel-command.c |  1 +
>  io/channel-file.c    |  1 +
>  io/channel-socket.c  |  2 ++
>  io/channel-tls.c     |  1 +
>  io/channel-websock.c |  1 +
>  io/channel.c         | 51 +++++++++++++++++++++++----------
>  migration/rdma.c     |  1 +
>  9 files changed, 98 insertions(+), 28 deletions(-)
> 
> diff --git a/include/io/channel.h b/include/io/channel.h
> index 88988979f8..343766ce5b 100644
> --- a/include/io/channel.h
> +++ b/include/io/channel.h
> @@ -32,12 +32,15 @@ OBJECT_DECLARE_TYPE(QIOChannel, QIOChannelClass,
>  
>  #define QIO_CHANNEL_ERR_BLOCK -2
>  
> +#define QIO_CHANNEL_WRITE_FLAG_ZERO_COPY 0x1
> +
>  typedef enum QIOChannelFeature QIOChannelFeature;
>  
>  enum QIOChannelFeature {
>      QIO_CHANNEL_FEATURE_FD_PASS,
>      QIO_CHANNEL_FEATURE_SHUTDOWN,
>      QIO_CHANNEL_FEATURE_LISTEN,
> +    QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY,
>  };
>  
>  
> @@ -104,6 +107,7 @@ struct QIOChannelClass {
>                           size_t niov,
>                           int *fds,
>                           size_t nfds,
> +                         int flags,
>                           Error **errp);
>      ssize_t (*io_readv)(QIOChannel *ioc,
>                          const struct iovec *iov,
> @@ -136,6 +140,8 @@ struct QIOChannelClass {
>                                    IOHandler *io_read,
>                                    IOHandler *io_write,
>                                    void *opaque);
> +    int (*io_flush)(QIOChannel *ioc,
> +                    Error **errp);
>  };
>  
>  /* General I/O handling functions */
> @@ -222,12 +228,13 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
>  
>  
>  /**
> - * qio_channel_writev_full:
> + * qio_channel_writev_full_flags:
>   * @ioc: the channel object
>   * @iov: the array of memory regions to write data from
>   * @niov: the length of the @iov array
>   * @fds: an array of file handles to send
>   * @nfds: number of file handles in @fds
> + * @flags: write flags (QIO_CHANNEL_WRITE_FLAG_*)
>   * @errp: pointer to a NULL-initialized error object
>   *
>   * Write data to the IO channel, reading it from the
> @@ -255,12 +262,16 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
>   * or QIO_CHANNEL_ERR_BLOCK if no data is can be sent
>   * and the channel is non-blocking
>   */
> -ssize_t qio_channel_writev_full(QIOChannel *ioc,
> -                                const struct iovec *iov,
> -                                size_t niov,
> -                                int *fds,
> -                                size_t nfds,
> -                                Error **errp);
> +ssize_t qio_channel_writev_full_flags(QIOChannel *ioc,
> +                                      const struct iovec *iov,
> +                                      size_t niov,
> +                                      int *fds,
> +                                      size_t nfds,
> +                                      int flags,
> +                                      Error **errp);
> +
> +#define qio_channel_writev_full(ioc, iov, niov, fds, nfds, errp) \
> +    qio_channel_writev_full_flags(ioc, iov, niov, fds, nfds, 0, errp)

Don't introduce yet another API variant here. Just add flags to
all the existing write APIs with "full" in their name. The word
"full" in their name was intended to indicate that they are
accepting all possible parameters, so it doesn't mean sense to
add APIs which take even more possible parameters.

> +int qio_channel_writev_full_all_flags(QIOChannel *ioc,
> +                                      const struct iovec *iov,
> +                                      size_t niov,
> +                                      int *fds, size_t nfds,
> +                                      int flags, Error **errp);
> +#define qio_channel_writev_full_all(ioc, iov, niov, fds, nfds, errp) \
> +    qio_channel_writev_full_all_flags(ioc, iov, niov, fds, nfds, 0, errp)

Same note.

> +/**
> + * qio_channel_flush:
> + * @ioc: the channel object
> + * @errp: pointer to a NULL-initialized error object
> + *
> + * Will block until every packet queued with
> + * qio_channel_writev_full_flags() + QIO_CHANNEL_WRITE_FLAG_ZERO_COPY
> + * is sent, or return in case of any error.
> + *
> + * If not implemented, acts as a no-op, and returns 0.
> + *
> + * Returns -1 if any error is found,
> + *          1 if every send failed to use zero copy.
> + *          0 otherwise.
> + */
> +
> +int qio_channel_flush(QIOChannel *ioc,
> +                      Error **errp);

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


