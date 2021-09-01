Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 403FB3FE44C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 22:55:55 +0200 (CEST)
Received: from localhost ([::1]:46506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLXGz-0006sR-Q5
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 16:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mLXFa-00064H-6Y
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 16:54:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mLXFW-0001Ic-RV
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 16:54:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630529661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WLjIEPMkW2kU5XxdaX4QR6sJIA5hiCGm8zjk5DCCYPE=;
 b=fGNA4561XfuYN6Y4tAeg/hEhqCezOGg5P4txVaUMKsnpFdFkr4iPvcSHhHyy3i9kfIGJ9s
 56fXE9Rcx6itw7MyGHO3oCnwZ8BE7q6DSFQXNoWvEM4q6CaNdqwJH44yhEeCcwC5xpJ9Ry
 85qeiA8Ych4vgXBDns3DFMqgLf2S8Ps=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-t9AZ6TqHOn2hIhVn9EGUNw-1; Wed, 01 Sep 2021 16:54:17 -0400
X-MC-Unique: t9AZ6TqHOn2hIhVn9EGUNw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 506BE801B3C;
 Wed,  1 Sep 2021 20:54:15 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.phx2.redhat.com [10.3.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 67F7610074E0;
 Wed,  1 Sep 2021 20:54:07 +0000 (UTC)
Date: Wed, 1 Sep 2021 15:54:05 -0500
From: Eric Blake <eblake@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v1 1/3] io: Enable write flags for QIOChannel
Message-ID: <20210901205405.f3dc4vpqinfy7gkx@redhat.com>
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-2-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210831110238.299458-2-leobras@redhat.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 31, 2021 at 08:02:37AM -0300, Leonardo Bras wrote:
> Some syscalls used for writting, such as sendmsg(), accept flags that
> can modify their behavior, even allowing the usage of features such as
> MSG_ZEROCOPY.
> 
> Change qio_channel_write*() interface to allow passing down flags,
> allowing a more flexible use of IOChannel.
> 
> At first, it's use is enabled for QIOChannelSocket, but can be easily
> extended to any other QIOChannel implementation.

As a followup to this patch, I wonder if we can also get performance
improvements by implementing MSG_MORE, and using that in preference to
corking/uncorking to better indicate that back-to-back short messages
may behave better when grouped together over the wire.  At least the
NBD code could make use of it (going off of my experience with the
libnbd project demonstrating a performance boost when we added
MSG_MORE support there).

> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  chardev/char-io.c                   |  2 +-
>  hw/remote/mpqemu-link.c             |  2 +-
>  include/io/channel.h                | 56 ++++++++++++++++++++---------
>  io/channel-buffer.c                 |  1 +
>  io/channel-command.c                |  1 +
>  io/channel-file.c                   |  1 +
>  io/channel-socket.c                 |  4 ++-
>  io/channel-tls.c                    |  1 +
>  io/channel-websock.c                |  1 +
>  io/channel.c                        | 53 ++++++++++++++-------------
>  migration/rdma.c                    |  1 +
>  scsi/pr-manager-helper.c            |  2 +-
>  tests/unit/test-io-channel-socket.c |  1 +
>  13 files changed, 81 insertions(+), 45 deletions(-)
> 
> diff --git a/chardev/char-io.c b/chardev/char-io.c
> index 8ced184160..4ea7b1ee2a 100644
> --- a/chardev/char-io.c
> +++ b/chardev/char-io.c
> @@ -122,7 +122,7 @@ int io_channel_send_full(QIOChannel *ioc,
>  
>          ret = qio_channel_writev_full(
>              ioc, &iov, 1,
> -            fds, nfds, NULL);
> +            fds, 0, nfds, NULL);

0 before nfds here...

>          if (ret == QIO_CHANNEL_ERR_BLOCK) {
>              if (offset) {
>                  return offset;
> diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
> index 7e841820e5..0d13321ef0 100644
> --- a/hw/remote/mpqemu-link.c
> +++ b/hw/remote/mpqemu-link.c
> @@ -69,7 +69,7 @@ bool mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)
>      }
>  
>      if (!qio_channel_writev_full_all(ioc, send, G_N_ELEMENTS(send),
> -                                    fds, nfds, errp)) {
> +                                     fds, nfds, 0, errp)) {

Thanks for fixing the broken indentation.

...but after nfds here, so one is wrong; up to this point in a linear
review, I can't tell which was intended...

> +++ b/include/io/channel.h
> @@ -104,6 +104,7 @@ struct QIOChannelClass {
>                           size_t niov,
>                           int *fds,
>                           size_t nfds,
> +                         int flags,
>                           Error **errp);

...and finally I see that in general, you wanted to add the argument
after.  Looks like the change to char-io.c is buggy.

(You can use scripts/git.orderfile as a way to force your patch to
list the .h file first, to make it easier for linear review).

>      ssize_t (*io_readv)(QIOChannel *ioc,
>                          const struct iovec *iov,
> @@ -260,6 +261,7 @@ ssize_t qio_channel_writev_full(QIOChannel *ioc,
>                                  size_t niov,
>                                  int *fds,
>                                  size_t nfds,
> +                                int flags,
>                                  Error **errp);
>  
>  /**
> @@ -325,6 +327,7 @@ int qio_channel_readv_all(QIOChannel *ioc,
>   * @ioc: the channel object
>   * @iov: the array of memory regions to write data from
>   * @niov: the length of the @iov array
> + * @flags: optional sending flags
>   * @errp: pointer to a NULL-initialized error object
>   *
>   * Write data to the IO channel, reading it from the
> @@ -339,10 +342,14 @@ int qio_channel_readv_all(QIOChannel *ioc,
>   *
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

You changed the function name here, but not in the comment beforehand.

> +
> +#define qio_channel_writev_all(ioc, iov, niov, errp) \
> +    qio_channel_writev_all_flags(ioc, iov, niov, 0, errp)

In most cases, you were merely adding a new function to minimize churn
to existing callers while making the old name a macro,...

> @@ -853,6 +876,7 @@ int qio_channel_writev_full_all(QIOChannel *ioc,
>                                  const struct iovec *iov,
>                                  size_t niov,
>                                  int *fds, size_t nfds,
> +                                int flags,
>                                  Error **errp);

...but this one you changed in-place.  Any reason?  It might be nice
to mention how you chose which functions to wrap (to minimize churn to
existing clients) vs. modify signatures.

>  
>  #endif /* QIO_CHANNEL_H */
> diff --git a/io/channel-buffer.c b/io/channel-buffer.c
> index baa4e2b089..bf52011be2 100644
> --- a/io/channel-buffer.c
> +++ b/io/channel-buffer.c
> @@ -81,6 +81,7 @@ static ssize_t qio_channel_buffer_writev(QIOChannel *ioc,
>                                           size_t niov,
>                                           int *fds,
>                                           size_t nfds,
> +                                         int flags,
>                                           Error **errp)
>  {
>      QIOChannelBuffer *bioc = QIO_CHANNEL_BUFFER(ioc);

Would it be wise to check that flags only contains values we can honor
in this (and all other) implementations of qio backends?  Do we need
some way for a backend to advertise to the core qio code which flags
it is willing to accept?

> +++ b/io/channel-socket.c
> @@ -525,6 +525,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>                                           size_t niov,
>                                           int *fds,
>                                           size_t nfds,
> +                                         int flags,
>                                           Error **errp)
>  {
>      QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
> @@ -558,7 +559,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>      }
>  
>   retry:
> -    ret = sendmsg(sioc->fd, &msg, 0);
> +    ret = sendmsg(sioc->fd, &msg, flags);

Because of this line, we are forcing our use of flags to be exactly
the same set of MSG_* flags understood by sendmsg(), which feels a bit
fragile.  Wouldn't it be safer to define our own set of QIO_MSG_
flags, and map those into whatever flag values the underlying backends
can support?  After all, one thing I learned on libnbd is that
MSG_MORE is not universally portable, but the goal of qio is to
abstract away things so that the rest of the code doesn't have to do
#ifdef tests everywhere, but instead let the qio code deal with it
(whether to ignore an unsupported flag because it is only an
optimization hint, or to return an error because we depend on the
behavior change the flag would cause if supported, or...).  And that
goes back to my question of whether backends should have a way to
inform the qio core which flags they can support.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


