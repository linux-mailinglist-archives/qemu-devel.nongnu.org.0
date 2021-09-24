Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFFD4179DF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 19:32:27 +0200 (CEST)
Received: from localhost ([::1]:45120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTp3i-0003Dr-GR
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 13:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mTooV-0001Rz-UQ
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 13:16:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mTooP-00042L-VF
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 13:16:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632503796;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=obHuvU0AvKjKglydsjzXA6Xd5nWp/SnZZBpvDBLsXQc=;
 b=Zw5eld2Uo336pzus8QGHubj2b/kS7+gnbT9ZlUs5+dCR1vLvi2OhXB5f//Lpm0ZgLeACOh
 4XEGzn+8SSbU4r+7NJ9q+n9x9ZIVGglBsFPSIZWFBjNyG4IMDuYYlOMNXbeK0i8DonDpwm
 ev202Bp1YtvlMHEQD2BSSuq5UNCxLLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-NfTKncGGNtCNeFRT_AAexQ-1; Fri, 24 Sep 2021 13:16:25 -0400
X-MC-Unique: NfTKncGGNtCNeFRT_AAexQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BE091922036
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 17:16:24 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C26A6A905;
 Fri, 24 Sep 2021 17:16:07 +0000 (UTC)
Date: Fri, 24 Sep 2021 18:16:04 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v3 1/3] QIOChannel: Add io_async_writev & io_async_flush
 callbacks
Message-ID: <YU4H1HwsiAO3KM6r@redhat.com>
References: <20210922222423.644444-1-leobras@redhat.com>
 <20210922222423.644444-2-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210922222423.644444-2-leobras@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 22, 2021 at 07:24:21PM -0300, Leonardo Bras wrote:
> Adds io_async_writev and io_async_flush as optional callback to QIOChannelClass,
> allowing the implementation of asynchronous writes by subclasses.
> 
> How to use them:
> - Write data using qio_channel_async_writev(),
> - Wait write completion with qio_channel_async_flush().
> 
> Notes:
> Some asynchronous implementations may benefit from zerocopy mechanisms, so it's
> recommended to keep the write buffer untouched until the return of
> qio_channel_async_flush().
> 
> As the new callbacks are optional, if a subclass does not implement them
> there will be a fallback to the mandatory synchronous implementation:
> - io_async_writev will fallback to io_writev,
> - io_async_flush will return without changing anything.
> This makes simpler for the user to make use of the asynchronous implementation.
> 
> Also, some functions like qio_channel_writev_full_all() were adapted to
> offer an async version, and make better use of the new callbacks.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  include/io/channel.h | 93 +++++++++++++++++++++++++++++++++++++-------
>  io/channel.c         | 66 ++++++++++++++++++++++++-------
>  2 files changed, 129 insertions(+), 30 deletions(-)
> 
> diff --git a/include/io/channel.h b/include/io/channel.h
> index 88988979f8..74f2e3ae8a 100644
> --- a/include/io/channel.h
> +++ b/include/io/channel.h
> @@ -136,6 +136,14 @@ struct QIOChannelClass {
>                                    IOHandler *io_read,
>                                    IOHandler *io_write,
>                                    void *opaque);
> +    ssize_t (*io_async_writev)(QIOChannel *ioc,
> +                               const struct iovec *iov,
> +                               size_t niov,
> +                               int *fds,
> +                               size_t nfds,
> +                               Error **errp);
> +   void (*io_async_flush)(QIOChannel *ioc,
> +                          Error **errp);
>  };
>  
>  /* General I/O handling functions */
> @@ -255,12 +263,17 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
>   * or QIO_CHANNEL_ERR_BLOCK if no data is can be sent
>   * and the channel is non-blocking
>   */
> -ssize_t qio_channel_writev_full(QIOChannel *ioc,
> -                                const struct iovec *iov,
> -                                size_t niov,
> -                                int *fds,
> -                                size_t nfds,
> -                                Error **errp);
> +ssize_t __qio_channel_writev_full(QIOChannel *ioc,

Using "__" is undesirable as that namespace is reserved.

> +                                  const struct iovec *iov,
> +                                  size_t niov,
> +                                  int *fds,
> +                                  size_t nfds,
> +                                  bool async,
> +                                  Error **errp);
> +#define qio_channel_writev_full(ioc, iov, niov, fds, nfds, errp) \
> +    __qio_channel_writev_full(ioc, iov, niov, fds, nfds, false, errp)
> +#define qio_channel_async_writev_full(ioc, iov, niov, fds, nfds, errp) \
> +    __qio_channel_writev_full(ioc, iov, niov, fds, nfds, true, errp)

The API docs only cover the first function, not the second.


>  /**
>   * qio_channel_readv_all_eof:
> @@ -339,10 +352,15 @@ int qio_channel_readv_all(QIOChannel *ioc,
>   *
>   * Returns: 0 if all bytes were written, or -1 on error
>   */
> -int qio_channel_writev_all(QIOChannel *ioc,
> -                           const struct iovec *iov,
> -                           size_t niov,
> -                           Error **erp);
> +int __qio_channel_writev_all(QIOChannel *ioc,
> +                             const struct iovec *iov,
> +                             size_t niov,
> +                             bool async,
> +                             Error **erp);
> +#define qio_channel_writev_all(ioc, iov, niov, erp) \
> +    __qio_channel_writev_all(ioc, iov, niov, false, erp)
> +#define qio_channel_async_writev_all(ioc, iov, niov, erp) \
> +    __qio_channel_writev_all(ioc, iov, niov, true, erp)


>  
>  /**
>   * qio_channel_readv:
> @@ -849,10 +867,55 @@ int qio_channel_readv_full_all(QIOChannel *ioc,
>   * Returns: 0 if all bytes were written, or -1 on error
>   */
>  
> -int qio_channel_writev_full_all(QIOChannel *ioc,
> -                                const struct iovec *iov,
> -                                size_t niov,
> -                                int *fds, size_t nfds,
> -                                Error **errp);
> +int __qio_channel_writev_full_all(QIOChannel *ioc,
> +                                  const struct iovec *iov,
> +                                  size_t niov,
> +                                  int *fds, size_t nfds,
> +                                  bool async, Error **errp);
> +#define qio_channel_writev_full_all(ioc, iov, niov, fds, nfds, errp) \
> +    __qio_channel_writev_full_all(ioc, iov, niov, fds, nfds, false, errp)
> +#define qio_channel_async_writev_full_all(ioc, iov, niov, fds, nfds, errp) \
> +    __qio_channel_writev_full_all(ioc, iov, niov, fds, nfds, true, errp)
> +
> +/**
> + * qio_channel_async_writev:
> + * @ioc: the channel object
> + * @iov: the array of memory regions to write data from
> + * @niov: the length of the @iov array
> + * @fds: an array of file handles to send
> + * @nfds: number of file handles in @fds
> + * @errp: pointer to a NULL-initialized error object
> + *
> + * Behaves like qio_channel_writev_full, but will send
> + * data asynchronously, this meaning this function
> + * may return before the data is actually sent.
> + *
> + * If at some point it's necessary wait for all data to be
> + * sent, use qio_channel_async_flush().
> + *
> + * If not implemented, falls back to the default writev
> + */

I'm not convinced by the fallback here. If you're
layering I/O channels this is not going to result in
desirable behaviour.

eg if QIOChannelTLS doesn't implement async, then when
you call async_writev, it'lll invoke sync writev on
the QIOChannelTLS, which will in turn invoke the sync
writev on QIOChannelSocket, despite the latter having
async writev support.  I think this is very misleading
behaviour

> +ssize_t qio_channel_async_writev(QIOChannel *ioc,
> +                                 const struct iovec *iov,
> +                                 size_t niov,
> +                                 int *fds,
> +                                 size_t nfds,
> +                                 Error **errp);

This is missing any flags. We need something like

   QIO_CHANNEL_WRITE_FLAG_ZEROCOPY

passed in an 'unsigned int flags' parameter. This in
turn makes me question whether we should have the
common helpers at all, as the api is going to be
different for sync vs async.

The QIOChannelFeature enum probably ought to be
extended with QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY with
support for probing whether that's supported or not.

> +
> +/**
> + * qio_channel_async_flush:
> + * @ioc: the channel object
> + * @errp: pointer to a NULL-initialized error object
> + *
> + * Will lock until every packet queued with qio_channel_async_writev()

s/lock/block/ I presume.

> + * is sent.
> + *
> + * If not implemented, returns without changing anything.
> + */
> +
> +void qio_channel_async_flush(QIOChannel *ioc,
> +                             Error **errp);
> +
>  
>  #endif /* QIO_CHANNEL_H */
> diff --git a/io/channel.c b/io/channel.c
> index e8b019dc36..c4819b922f 100644
> --- a/io/channel.c
> +++ b/io/channel.c
> @@ -67,12 +67,13 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
>  }
>  
>  
> -ssize_t qio_channel_writev_full(QIOChannel *ioc,
> -                                const struct iovec *iov,
> -                                size_t niov,
> -                                int *fds,
> -                                size_t nfds,
> -                                Error **errp)
> +ssize_t __qio_channel_writev_full(QIOChannel *ioc,
> +                                  const struct iovec *iov,
> +                                  size_t niov,
> +                                  int *fds,
> +                                  size_t nfds,
> +                                  bool async,
> +                                  Error **errp)
>  {
>      QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
>  
> @@ -83,6 +84,10 @@ ssize_t qio_channel_writev_full(QIOChannel *ioc,
>          return -1;
>      }
>  
> +    if (async && klass->io_async_writev) {
> +        return klass->io_async_writev(ioc, iov, niov, fds, nfds, errp);
> +    }
> +
>      return klass->io_writev(ioc, iov, niov, fds, nfds, errp);
>  }
>  
> @@ -212,19 +217,20 @@ int qio_channel_readv_full_all(QIOChannel *ioc,
>      return ret;
>  }
>  
> -int qio_channel_writev_all(QIOChannel *ioc,
> -                           const struct iovec *iov,
> -                           size_t niov,
> -                           Error **errp)
> +int __qio_channel_writev_all(QIOChannel *ioc,
> +                             const struct iovec *iov,
> +                             size_t niov,
> +                             bool async,
> +                             Error **errp)
>  {
> -    return qio_channel_writev_full_all(ioc, iov, niov, NULL, 0, errp);
> +    return __qio_channel_writev_full_all(ioc, iov, niov, NULL, 0, async, errp);
>  }
>  
> -int qio_channel_writev_full_all(QIOChannel *ioc,
> +int __qio_channel_writev_full_all(QIOChannel *ioc,
>                                  const struct iovec *iov,
>                                  size_t niov,
>                                  int *fds, size_t nfds,
> -                                Error **errp)
> +                                bool async, Error **errp)
>  {
>      int ret = -1;
>      struct iovec *local_iov = g_new(struct iovec, niov);
> @@ -237,8 +243,8 @@ int qio_channel_writev_full_all(QIOChannel *ioc,
>  
>      while (nlocal_iov > 0) {
>          ssize_t len;
> -        len = qio_channel_writev_full(ioc, local_iov, nlocal_iov, fds, nfds,
> -                                      errp);
> +        len = __qio_channel_writev_full(ioc, local_iov, nlocal_iov, fds, nfds,
> +                                        async, errp);
>          if (len == QIO_CHANNEL_ERR_BLOCK) {
>              if (qemu_in_coroutine()) {
>                  qio_channel_yield(ioc, G_IO_OUT);
> @@ -474,6 +480,36 @@ off_t qio_channel_io_seek(QIOChannel *ioc,
>  }
>  
>  
> +ssize_t qio_channel_async_writev(QIOChannel *ioc,
> +                                 const struct iovec *iov,
> +                                 size_t niov,
> +                                 int *fds,
> +                                 size_t nfds,
> +                                 Error **errp)
> +{
> +     QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
> +
> +    if (!klass->io_async_writev) {
> +        return klass->io_writev(ioc, iov, niov, fds, nfds, errp);
> +    }
> +
> +     return klass->io_async_writev(ioc, iov, niov, fds, nfds, errp);
> +}
> +
> +
> +void qio_channel_async_flush(QIOChannel *ioc,
> +                             Error **errp)
> +{
> +     QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
> +
> +    if (!klass->io_async_flush) {
> +        return;
> +    }
> +
> +     klass->io_async_flush(ioc, errp);
> +}
> +
> +
>  static void qio_channel_restart_read(void *opaque)
>  {
>      QIOChannel *ioc = opaque;
> -- 
> 2.33.0
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


