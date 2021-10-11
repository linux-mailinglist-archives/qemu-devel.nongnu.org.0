Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1432342977C
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 21:18:46 +0200 (CEST)
Received: from localhost ([::1]:40708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma0ou-0005oT-4a
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 15:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ma0nj-00052C-Ub
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 15:17:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ma0ng-0005JG-7A
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 15:17:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633979846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kwkXnr37FRvElGN1jiUnXY3M3/yINf8Y0Q8jVJ9foWo=;
 b=PZE3+XCBg2Q7WeMg2Pw6mkssd3RJxNUNfUvINcj+dDYRekeDJ2eD0vopUdTZJqiI2tFvw1
 Ut27jEAN3HQOvWkufVIXGS22gRvYByt5WBxcKpKLLc/KDYui9zaQ4ZjixujvGDMq1yXHPH
 0DuTbAJjNcYghOw5t9MAjtSRL9DGwHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-3EPTtPx5Pp6aAYo3iREcxg-1; Mon, 11 Oct 2021 15:17:22 -0400
X-MC-Unique: 3EPTtPx5Pp6aAYo3iREcxg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85699835DE0
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 19:17:20 +0000 (UTC)
Received: from redhat.com (ovpn-113-152.phx2.redhat.com [10.3.113.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F7A32657D;
 Mon, 11 Oct 2021 19:17:11 +0000 (UTC)
Date: Mon, 11 Oct 2021 14:17:08 -0500
From: Eric Blake <eblake@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v4 1/3] QIOChannel: Add io_writev_zerocopy &
 io_flush_zerocopy callbacks
Message-ID: <20211011191708.or43v24srlm6srog@redhat.com>
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-2-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211009075612.230283-2-leobras@redhat.com>
User-Agent: NeoMutt/20210205-852-339c0c
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Oct 09, 2021 at 04:56:11AM -0300, Leonardo Bras wrote:
> Adds io_async_writev and io_async_flush as optional callback to QIOChannelClass,

Are these names accurate?

> allowing the implementation of asynchronous writes by subclasses.
> 
> How to use them:
> - Write data using qio_channel_writev_zerocopu(),

s/copu/copy/

> - Wait write completion with qio_channel_flush_zerocopy().
> 
> Notes:
> As some zerocopy implementations work asynchronously, it's
> recommended to keep the write buffer untouched until the return of
> qio_channel_flush_zerocopy(), by the risk of sending an updated buffer

s/by/to avoid/

> instead of the one at the write.
> 
> As the new callbacks are optional, if a subclass does not implement them, then:
> - io_async_writev will return -1,
> - io_async_flush will return 0 without changing anything.

Are these names accurate?

> 
> Also, some functions like qio_channel_writev_full_all() were adapted to
> receive a flag parameter. That allows shared code between zerocopy and
> non-zerocopy writev.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  include/io/channel.h | 103 +++++++++++++++++++++++++++++++++++--------
>  io/channel.c         |  74 +++++++++++++++++++++++--------
>  2 files changed, 141 insertions(+), 36 deletions(-)
> 
> diff --git a/include/io/channel.h b/include/io/channel.h
> index 88988979f8..e7d4e1521f 100644
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
> +                              Error **errp);

Indentation is off by one.

>  };
>  
>  /* General I/O handling functions */
> @@ -222,12 +231,13 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
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
> @@ -242,6 +252,10 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
>   * guaranteed. If the channel is non-blocking and no
>   * data can be sent, it will return QIO_CHANNEL_ERR_BLOCK
>   *
> + * If flag QIO_CHANNEL_WRITE_FLAG_ZEROCOPY is passed,
> + * function will return once each buffer was queued for
> + * sending.

This would be a good place to document the requirement to keep the
buffer unchanged until the zerocopy sequence completes.

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
> @@ -846,13 +868,58 @@ int qio_channel_readv_full_all(QIOChannel *ioc,
>   * to be written, yielding from the current coroutine
>   * if required.
>   *
> + * If QIO_CHANNEL_WRITE_FLAG_ZEROCOPY is passed in flags,
> + * instead of waiting for all requested data to be written,
> + * this function will wait until it's all queued for writing.

Another good place to document restrictions on buffer stability.

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
> +
> +/**
> + * qio_channel_writev_zerocopy:
> + * @ioc: the channel object
> + * @iov: the array of memory regions to write data from
> + * @niov: the length of the @iov array
> + * @errp: pointer to a NULL-initialized error object
> + *
> + * Behaves like qio_channel_writev_full_all_flags, but will write
> + * data asynchronously while avoiding unnecessary data copy.
> + * This function may return before any data is actually written,
> + * but should queue every buffer for writting.

writing

Another place to document buffer stability considerations.

> + *
> + * If at some point it's necessary wait for all data to be

s/wait/to wait/

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
> + * Will lock until every packet queued with

s/lock/block/

> + * qio_channel_writev_zerocopy() is sent, or return
> + * in case of any error.
> + *
> + * Returns -1 if any error is found, 0 otherwise.
> + * If not implemented, returns 0 without changing anything.
> + */
> +
> +int qio_channel_flush_zerocopy(QIOChannel *ioc,
> +                               Error **errp);
>  
>  #endif /* QIO_CHANNEL_H */
> diff --git a/io/channel.c b/io/channel.c
> index e8b019dc36..811c93ae23 100644
> --- a/io/channel.c
> +++ b/io/channel.c

> +int qio_channel_flush_zerocopy(QIOChannel *ioc,
> +                               Error **errp)
> +{
> +    QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
> +
> +    if (!klass->io_flush_zerocopy ||
> +        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY)) {
> +        return 0;

Matches your documentation, but an ideal app should not be trying to
flush if the write failed in the first place.  So wouldn't it be
better to return -1 or even abort() on a coding error?

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
> 2.33.0
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


