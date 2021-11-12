Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7366144E46E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 11:15:21 +0100 (CET)
Received: from localhost ([::1]:40488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlTaa-0007Ha-0N
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 05:15:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mlTZD-00067j-CI
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 05:13:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mlTZ7-0007t3-7N
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 05:13:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636712028;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=6vG8HXPhQ8/YvC6C+H3UN7s40FYuWaOUfdy/sUy+9vk=;
 b=JtR8KVOWe/qc1gD5D5DWhOg1vRg++xlCfpUPBFa4+sjC+PJkcn9bILspdSQWyT9e0DRe8X
 BVVjY8422X/ANvklrQJu1gfobfFFttc4GoURttjr4ieC4age7Rp6FN3AM7Cs3EAjwDrSHM
 IYcZoo666ORsRIIGAzyfuMGkA4BArSU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-Cyf65mIuMauMcsg0XHUVGw-1; Fri, 12 Nov 2021 05:13:47 -0500
X-MC-Unique: Cyf65mIuMauMcsg0XHUVGw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 868EB18414AA
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 10:13:45 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E242E60C33;
 Fri, 12 Nov 2021 10:13:04 +0000 (UTC)
Date: Fri, 12 Nov 2021 10:13:01 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v5 1/6] QIOChannel: Add io_writev_zerocopy &
 io_flush_zerocopy callbacks
Message-ID: <YY4+LWnRTV7iaErs@redhat.com>
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-2-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211112051040.923746-2-leobras@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 12, 2021 at 02:10:36AM -0300, Leonardo Bras wrote:
> Adds io_writev_zerocopy and io_flush_zerocopy as optional callback to QIOChannelClass,
> allowing the implementation of zerocopy writes by subclasses.
> 
> How to use them:
> - Write data using qio_channel_writev_zerocopy(),
> - Wait write completion with qio_channel_flush_zerocopy().
> 
> Notes:
> As some zerocopy implementations work asynchronously, it's
> recommended to keep the write buffer untouched until the return of
> qio_channel_flush_zerocopy(), to avoid the risk of sending an updated
> buffer instead of the one at the write.
> 
> As the new callbacks are optional, if a subclass does not implement them, then:
> - io_writev_zerocopy will return -1,
> - io_flush_zerocopy will return 0 without changing anything.
> 
> Also, some functions like qio_channel_writev_full_all() were adapted to
> receive a flag parameter. That allows shared code between zerocopy and
> non-zerocopy writev.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  include/io/channel.h | 93 ++++++++++++++++++++++++++++++++++++++------
>  io/channel.c         | 65 +++++++++++++++++++++++++------
>  2 files changed, 135 insertions(+), 23 deletions(-)
> 
> diff --git a/include/io/channel.h b/include/io/channel.h
> index 88988979f8..a19c09bb84 100644
> --- a/include/io/channel.h
> +++ b/include/io/channel.h
> @@ -32,12 +32,15 @@ OBJECT_DECLARE_TYPE(QIOChannel, QIOChannelClass,
>  
>  #define QIO_CHANNEL_ERR_BLOCK -2
>  
> +#define QIO_CHANNEL_WRITE_FLAG_ZEROCOPY 0x1
> +
>  typedef enum QIOChannelFeature QIOChannelFeature;
>  
>  enum QIOChannelFeature {
>      QIO_CHANNEL_FEATURE_FD_PASS,
>      QIO_CHANNEL_FEATURE_SHUTDOWN,
>      QIO_CHANNEL_FEATURE_LISTEN,
> +    QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY,
>  };
>  
>  
> @@ -136,6 +139,12 @@ struct QIOChannelClass {
>                                    IOHandler *io_read,
>                                    IOHandler *io_write,
>                                    void *opaque);
> +    ssize_t (*io_writev_zerocopy)(QIOChannel *ioc,
> +                                  const struct iovec *iov,
> +                                  size_t niov,
> +                                  Error **errp);
> +    int (*io_flush_zerocopy)(QIOChannel *ioc,
> +                             Error **errp);
>  };
>  
>  /* General I/O handling functions */
> @@ -321,10 +330,11 @@ int qio_channel_readv_all(QIOChannel *ioc,
>  
>  
>  /**
> - * qio_channel_writev_all:
> + * qio_channel_writev_all_flags:
>   * @ioc: the channel object
>   * @iov: the array of memory regions to write data from
>   * @niov: the length of the @iov array
> + * @flags: write flags (QIO_CHANNEL_WRITE_FLAG_*)
>   * @errp: pointer to a NULL-initialized error object
>   *
>   * Write data to the IO channel, reading it from the
> @@ -337,12 +347,23 @@ int qio_channel_readv_all(QIOChannel *ioc,
>   * to be written, yielding from the current coroutine
>   * if required.
>   *
> + * If QIO_CHANNEL_WRITE_FLAG_ZEROCOPY is passed in flags,
> + * instead of waiting for all requested data to be written,
> + * this function will wait until it's all queued for writing.
> + * In this case, if the buffer gets changed between queueing and
> + * sending, the updated buffer will be sent. If this is not a
> + * desired behavior, it's suggested to call qio_channel_flush_zerocopy()
> + * before reusing the buffer.
> + *
>   * Returns: 0 if all bytes were written, or -1 on error
>   */
> -int qio_channel_writev_all(QIOChannel *ioc,
> -                           const struct iovec *iov,
> -                           size_t niov,
> -                           Error **erp);
> +int qio_channel_writev_all_flags(QIOChannel *ioc,
> +                                 const struct iovec *iov,
> +                                 size_t niov,
> +                                 int flags,
> +                                 Error **errp);
> +#define qio_channel_writev_all(ioc, iov, niov, errp) \
> +    qio_channel_writev_all_flags(ioc, iov, niov, 0, errp)

We already have separate methods for zerocopy, instead of adding
flags, so we shouldn't add flags to this either.

Add a qio_channel_writev_zerocopy_all method instead.

Internally, we can still make both qio_channel_writev_zerocopy_all
and qio_channel_writev_all use the same helper method, just don't
expose flags in the public API. Even internally we don't really
need flags, just a bool

>  
>  /**
>   * qio_channel_readv:
> @@ -831,12 +852,13 @@ int qio_channel_readv_full_all(QIOChannel *ioc,
>                                 Error **errp);
>  
>  /**
> - * qio_channel_writev_full_all:
> + * qio_channel_writev_full_all_flags:
>   * @ioc: the channel object
>   * @iov: the array of memory regions to write data from
>   * @niov: the length of the @iov array
>   * @fds: an array of file handles to send
>   * @nfds: number of file handles in @fds
> + * @flags: write flags (QIO_CHANNEL_WRITE_FLAG_*)
>   * @errp: pointer to a NULL-initialized error object
>   *
>   *
> @@ -846,13 +868,62 @@ int qio_channel_readv_full_all(QIOChannel *ioc,
>   * to be written, yielding from the current coroutine
>   * if required.
>   *
> + * If QIO_CHANNEL_WRITE_FLAG_ZEROCOPY is passed in flags,
> + * instead of waiting for all requested data to be written,
> + * this function will wait until it's all queued for writing.
> + * In this case, if the buffer gets changed between queueing and
> + * sending, the updated buffer will be sent. If this is not a
> + * desired behavior, it's suggested to call qio_channel_flush_zerocopy()
> + * before reusing the buffer.
> + *
>   * Returns: 0 if all bytes were written, or -1 on error
>   */
>  
> -int qio_channel_writev_full_all(QIOChannel *ioc,
> -                                const struct iovec *iov,
> -                                size_t niov,
> -                                int *fds, size_t nfds,
> -                                Error **errp);
> +int qio_channel_writev_full_all_flags(QIOChannel *ioc,
> +                                      const struct iovec *iov,
> +                                      size_t niov,
> +                                      int *fds, size_t nfds,
> +                                      int flags, Error **errp);
> +#define qio_channel_writev_full_all(ioc, iov, niov, fds, nfds, errp) \
> +    qio_channel_writev_full_all_flags(ioc, iov, niov, fds, nfds, 0, errp)

There's no need for this at all. Since fd passing is not supported
with zerocopy, there's no reason to ever use this method.

> +/**
> + * qio_channel_writev_zerocopy:
> + * @ioc: the channel object
> + * @iov: the array of memory regions to write data from
> + * @niov: the length of the @iov array
> + * @errp: pointer to a NULL-initialized error object
> + *
> + * Behaves like qio_channel_writev_full_all_flags, but may write

qio_channel_writev

> + * data asynchronously while avoiding unnecessary data copy.
> + * This function may return before any data is actually written,
> + * but should queue every buffer for writing.

Callers mustn't rely on "should" docs - they must rely on the
return value indicating how many bytes were accepted.

> + *
> + * If at some point it's necessary to wait for all data to be
> + * written, use qio_channel_flush_zerocopy().
> + *
> + * If zerocopy is not available, returns -1 and set errp.
> + */
> +
> +ssize_t qio_channel_writev_zerocopy(QIOChannel *ioc,
> +                                    const struct iovec *iov,
> +                                    size_t niov,
> +                                    Error **errp);
> +
> +/**
> + * qio_channel_flush_zerocopy:
> + * @ioc: the channel object
> + * @errp: pointer to a NULL-initialized error object
> + *
> + * Will block until every packet queued with
> + * qio_channel_writev_zerocopy() is sent, or return
> + * in case of any error.
> + *
> + * Returns -1 if any error is found, 0 otherwise.
> + * If not implemented, acts as a no-op, and returns 0.
> + */
> +
> +int qio_channel_flush_zerocopy(QIOChannel *ioc,
> +                               Error **errp);
>  
>  #endif /* QIO_CHANNEL_H */
> diff --git a/io/channel.c b/io/channel.c
> index e8b019dc36..009da9b772 100644
> --- a/io/channel.c
> +++ b/io/channel.c
> @@ -212,19 +212,21 @@ int qio_channel_readv_full_all(QIOChannel *ioc,
>      return ret;
>  }
>  
> -int qio_channel_writev_all(QIOChannel *ioc,
> -                           const struct iovec *iov,
> -                           size_t niov,
> -                           Error **errp)
> +int qio_channel_writev_all_flags(QIOChannel *ioc,
> +                                 const struct iovec *iov,
> +                                 size_t niov,
> +                                 int flags,
> +                                 Error **errp)
>  {
> -    return qio_channel_writev_full_all(ioc, iov, niov, NULL, 0, errp);
> +    return qio_channel_writev_full_all_flags(ioc, iov, niov, NULL, 0, flags,
> +                                             errp);
>  }
>  
> -int qio_channel_writev_full_all(QIOChannel *ioc,
> -                                const struct iovec *iov,
> -                                size_t niov,
> -                                int *fds, size_t nfds,
> -                                Error **errp)
> +int qio_channel_writev_full_all_flags(QIOChannel *ioc,
> +                                      const struct iovec *iov,
> +                                      size_t niov,
> +                                      int *fds, size_t nfds,
> +                                      int flags, Error **errp)
>  {
>      int ret = -1;
>      struct iovec *local_iov = g_new(struct iovec, niov);
> @@ -237,8 +239,15 @@ int qio_channel_writev_full_all(QIOChannel *ioc,
>  
>      while (nlocal_iov > 0) {
>          ssize_t len;
> -        len = qio_channel_writev_full(ioc, local_iov, nlocal_iov, fds, nfds,
> -                                      errp);
> +
> +        if (flags & QIO_CHANNEL_WRITE_FLAG_ZEROCOPY) {
> +            assert(fds == NULL && nfds == 0);
> +            len = qio_channel_writev_zerocopy(ioc, local_iov, nlocal_iov, errp);
> +        } else {
> +            len = qio_channel_writev_full(ioc, local_iov, nlocal_iov, fds, nfds,
> +                                          errp);
> +        }
> +
>          if (len == QIO_CHANNEL_ERR_BLOCK) {
>              if (qemu_in_coroutine()) {
>                  qio_channel_yield(ioc, G_IO_OUT);
> @@ -474,6 +483,38 @@ off_t qio_channel_io_seek(QIOChannel *ioc,
>  }
>  
>  
> +ssize_t qio_channel_writev_zerocopy(QIOChannel *ioc,
> +                                    const struct iovec *iov,
> +                                    size_t niov,
> +                                    Error **errp)
> +{
> +    QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
> +
> +    if (!klass->io_writev_zerocopy ||
> +        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY)) {
> +        error_setg_errno(errp, EINVAL,
> +                         "Channel does not support zerocopy writev");
> +        return -1;
> +    }
> +
> +    return klass->io_writev_zerocopy(ioc, iov, niov, errp);
> +}
> +
> +
> +int qio_channel_flush_zerocopy(QIOChannel *ioc,
> +                               Error **errp)
> +{
> +    QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
> +
> +    if (!klass->io_flush_zerocopy ||
> +        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY)) {
> +        return 0;
> +    }
> +
> +    return klass->io_flush_zerocopy(ioc, errp);
> +}
> +
> +
>  static void qio_channel_restart_read(void *opaque)
>  {
>      QIOChannel *ioc = opaque;
> -- 
> 2.33.1
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


