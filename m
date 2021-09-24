Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF133417A94
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 20:09:17 +0200 (CEST)
Received: from localhost ([::1]:45548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTpdM-00036E-Ov
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 14:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mTpAC-0007Ey-JL
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 13:39:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mTpA5-0006Sy-0s
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 13:39:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632505139;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=5H3NdjQ2zXSYO7OoJ/016aWiLzKGXgknZQGW3CwI1Gc=;
 b=T92Dc2nczU1aPuyvNpYB4dTxWRbplGv1u8jLICk8L8cOts/GQ8zR1QqN8Fin1VNrQOCfP9
 +T//6lRI5u/az0jGnN0bdKkTFdDnqADsgaxK4KxAV92bPm9H9POOttXIYDyCpxoIhBCI8U
 raiSvgLdGjhBqL/zVphUBQcpldlNJdk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-L1Nr67NTMJiMgdMNk8bNmw-1; Fri, 24 Sep 2021 13:38:55 -0400
X-MC-Unique: L1Nr67NTMJiMgdMNk8bNmw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1F9A835DE0
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 17:38:54 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E1FD60C04;
 Fri, 24 Sep 2021 17:38:53 +0000 (UTC)
Date: Fri, 24 Sep 2021 18:38:50 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v3 2/3] QIOChannelSocket: Implement io_async_write &
 io_async_flush
Message-ID: <YU4NKmq4KJkbmY97@redhat.com>
References: <20210922222423.644444-1-leobras@redhat.com>
 <20210922222423.644444-3-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210922222423.644444-3-leobras@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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

On Wed, Sep 22, 2021 at 07:24:22PM -0300, Leonardo Bras wrote:
> Implement the new optional callbacks io_async_write and io_async_flush on
> QIOChannelSocket, but enables it only when MSG_ZEROCOPY feature is
> available in the host kernel, and TCP sockets are used.
> 
> qio_channel_socket_writev() contents were moved to a helper function
> __qio_channel_socket_writev() which accepts an extra 'flag' argument.
> This helper function is used to implement qio_channel_socket_writev(), with
> flags = 0, keeping it's behavior unchanged, and
> qio_channel_socket_async_writev() with flags = MSG_ZEROCOPY.
> 
> qio_channel_socket_async_flush() was implemented by reading the socket's error
> queue, which will have information on MSG_ZEROCOPY send completion.
> There is no need to worry with re-sending packets in case any error happens, as
> MSG_ZEROCOPY only works with TCP and it will re-tranmsmit if any error ocurs.
> 
> Notes on using async_write():
> - As MSG_ZEROCOPY tells the kernel to use the same user buffer to avoid copying,
> some caution is necessary to avoid overwriting any buffer before it's sent.
> If something like this happen, a newer version of the buffer may be sent instead.
> - If this is a problem, it's recommended to use async_flush() before freeing or
> re-using the buffer.
> - When using MSG_ZERCOCOPY, the buffer memory will be locked, so it may require
> a larger amount than usually available to non-root user.
> - If the required amount of locked memory is not available, it falls-back to
> buffer copying behavior, and synchronous sending.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  include/io/channel-socket.h |   2 +
>  include/io/channel.h        |   1 +
>  io/channel-socket.c         | 176 ++++++++++++++++++++++++++++++++++--
>  3 files changed, 169 insertions(+), 10 deletions(-)
> 
> diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
> index e747e63514..4d1be0637a 100644
> --- a/include/io/channel-socket.h
> +++ b/include/io/channel-socket.h
> @@ -47,6 +47,8 @@ struct QIOChannelSocket {
>      socklen_t localAddrLen;
>      struct sockaddr_storage remoteAddr;
>      socklen_t remoteAddrLen;
> +    ssize_t async_queued;
> +    ssize_t async_sent;
>  };
>  
>  
> diff --git a/include/io/channel.h b/include/io/channel.h
> index 74f2e3ae8a..611bb2ea26 100644
> --- a/include/io/channel.h
> +++ b/include/io/channel.h
> @@ -31,6 +31,7 @@ OBJECT_DECLARE_TYPE(QIOChannel, QIOChannelClass,
>  
>  
>  #define QIO_CHANNEL_ERR_BLOCK -2
> +#define QIO_CHANNEL_ERR_NOBUFS -3
>  
>  typedef enum QIOChannelFeature QIOChannelFeature;
>  
> diff --git a/io/channel-socket.c b/io/channel-socket.c
> index 606ec97cf7..c67832d0bb 100644
> --- a/io/channel-socket.c
> +++ b/io/channel-socket.c
> @@ -26,9 +26,23 @@
>  #include "io/channel-watch.h"
>  #include "trace.h"
>  #include "qapi/clone-visitor.h"
> +#ifdef CONFIG_LINUX
> +#include <linux/errqueue.h>
> +#include <poll.h>
> +#endif
>  
>  #define SOCKET_MAX_FDS 16
>  
> +static ssize_t qio_channel_socket_async_writev(QIOChannel *ioc,
> +                                               const struct iovec *iov,
> +                                               size_t niov,
> +                                               int *fds,
> +                                               size_t nfds,
> +                                               Error **errp);
> +
> +static void qio_channel_socket_async_flush(QIOChannel *ioc,
> +                                           Error **errp);
> +
>  SocketAddress *
>  qio_channel_socket_get_local_address(QIOChannelSocket *ioc,
>                                       Error **errp)
> @@ -55,6 +69,8 @@ qio_channel_socket_new(void)
>  
>      sioc = QIO_CHANNEL_SOCKET(object_new(TYPE_QIO_CHANNEL_SOCKET));
>      sioc->fd = -1;
> +    sioc->async_queued = 0;
> +    sioc->async_sent = 0;
>  
>      ioc = QIO_CHANNEL(sioc);
>      qio_channel_set_feature(ioc, QIO_CHANNEL_FEATURE_SHUTDOWN);
> @@ -140,6 +156,7 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
>                                      Error **errp)
>  {
>      int fd;
> +    int ret, v = 1;
>  
>      trace_qio_channel_socket_connect_sync(ioc, addr);
>      fd = socket_connect(addr, errp);
> @@ -154,6 +171,19 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
>          return -1;
>      }
>  
> +#ifdef CONFIG_LINUX
> +    if (addr->type != SOCKET_ADDRESS_TYPE_INET) {
> +        return 0;
> +    }
> +
> +    ret = qemu_setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &v, sizeof(v));
> +    if (ret >= 0) {
> +        QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
> +        klass->io_async_writev = qio_channel_socket_async_writev;
> +        klass->io_async_flush = qio_channel_socket_async_flush;
> +    }
> +#endif

This is not write - the async APIs should not be tied 1:1 to ZEROCOPY
usage - we should have them take a flag to request ZEROCOPY behaviour.

> +
>      return 0;
>  }
>  
> @@ -520,12 +550,13 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
>      return ret;
>  }
>  
> -static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
> -                                         const struct iovec *iov,
> -                                         size_t niov,
> -                                         int *fds,
> -                                         size_t nfds,
> -                                         Error **errp)
> +static ssize_t __qio_channel_socket_writev(QIOChannel *ioc,
> +                                           const struct iovec *iov,
> +                                           size_t niov,
> +                                           int *fds,
> +                                           size_t nfds,
> +                                           int flags,
> +                                           Error **errp)
>  {
>      QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
>      ssize_t ret;
> @@ -558,20 +589,145 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>      }
>  
>   retry:
> -    ret = sendmsg(sioc->fd, &msg, 0);
> +    ret = sendmsg(sioc->fd, &msg, flags);
>      if (ret <= 0) {
> -        if (errno == EAGAIN) {
> +        switch (errno) {
> +        case EAGAIN:
>              return QIO_CHANNEL_ERR_BLOCK;
> -        }
> -        if (errno == EINTR) {
> +        case EINTR:
>              goto retry;
> +        case ENOBUFS:
> +            return QIO_CHANNEL_ERR_NOBUFS;
>          }
> +
>          error_setg_errno(errp, errno,
>                           "Unable to write to socket");
>          return -1;
>      }
>      return ret;
>  }
> +
> +static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
> +                                         const struct iovec *iov,
> +                                         size_t niov,
> +                                         int *fds,
> +                                         size_t nfds,
> +                                         Error **errp)
> +{
> +    return __qio_channel_socket_writev(ioc, iov, niov, fds, nfds, 0, errp);
> +}
> +
> +static ssize_t qio_channel_socket_async_writev(QIOChannel *ioc,
> +                                               const struct iovec *iov,
> +                                               size_t niov,
> +                                               int *fds,
> +                                               size_t nfds,
> +                                               Error **errp)
> +{
> +    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
> +    ssize_t ret;
> +
> +    sioc->async_queued++;
> +
> +    ret = __qio_channel_socket_writev(ioc, iov, niov, fds, nfds, MSG_ZEROCOPY,
> +                                       errp);
> +    if (ret == QIO_CHANNEL_ERR_NOBUFS) {
> +        /*
> +         * Not enough locked memory available to the process.
> +         * Fallback to default sync callback.
> +         */
> +
> +        if (errp && *errp) {
> +            warn_reportf_err(*errp,
> +                             "Process can't lock enough memory for using MSG_ZEROCOPY,"
> +                             "falling back to non-zerocopy");

This is not nice as it hides what is likely mis-configuration error.
If someone asked for zerocopy, we should honour that or report an
error back.

> +        }
> +
> +        QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
> +        klass->io_async_writev = NULL;
> +        klass->io_async_flush = NULL;

Clearing the flush callback is wrong. We might have pending async
writes that haven't been processed that, and the lack of buffers
may be a transient problem just caused by a backlog of writes.

> +
> +        /* Re-send current buffer */
> +        ret = qio_channel_socket_writev(ioc, iov, niov, fds, nfds, errp);
> +    }
> +
> +    return ret;
> +}
> +
> +
> +static void qio_channel_socket_async_flush(QIOChannel *ioc,
> +                                           Error **errp)
> +{
> +    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
> +    struct msghdr msg = {};
> +    struct pollfd pfd;
> +    struct sock_extended_err *serr;
> +    struct cmsghdr *cm;
> +    char control[CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS)];

Err  sizeof(int) * SOCKET_MAX_FDS   doesn't look right. This
buffer needs to hold 'struct sock_extended_err' instances,
not 'int', and SOCKET_MAX_FDS is an unrelated limit.

> +    int ret;
> +
> +    memset(control, 0, CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS));
> +    msg.msg_control = control;
> +    msg.msg_controllen = sizeof(control);
> +
> +    while (sioc->async_sent < sioc->async_queued) {
> +        ret = recvmsg(sioc->fd, &msg, MSG_ERRQUEUE);
> +        if (ret < 0) {
> +            if (errno == EAGAIN) {
> +                /* Nothing on errqueue, wait */
> +                pfd.fd = sioc->fd;
> +                pfd.events = 0;
> +                ret = poll(&pfd, 1, 250);
> +                if (ret == 0) {
> +                    /*
> +                     * Timeout : After 250ms without receiving any zerocopy
> +                     * notification, consider all data as sent.
> +                     */

This feels very dubious indeed. If some caller needs a guarantee that the
data was successfully sent, merely waiting 250ms is not going to be reliable
enough. 

A regular non-async + non-zerocopy right will wait as long as is needed
unless SO_SNDTIMEO has been set on the socket.

At the very least the timeout ought to be a parameter passed in, and the
return value should indicate whether it timed out, or report how many
pending writes still aren't processed, so the caller can decide whether
to call flush again.

> +                    break;
> +                } else if (ret < 0 ||
> +                           (pfd.revents & (POLLERR | POLLHUP | POLLNVAL))) {
> +                    error_setg_errno(errp, errno,
> +                                     "Poll error");
> +                    break;
> +                } else {
> +                    continue;
> +                }
> +            }
> +            if (errno == EINTR) {
> +                continue;
> +            }
> +
> +            error_setg_errno(errp, errno,
> +                             "Unable to read errqueue");
> +            break;
> +        }
> +
> +        cm = CMSG_FIRSTHDR(&msg);
> +        if (cm->cmsg_level != SOL_IP &&
> +            cm->cmsg_type != IP_RECVERR) {
> +            error_setg_errno(errp, EPROTOTYPE,
> +                             "Wrong cmsg in errqueue");
> +            break;
> +        }
> +
> +        serr = (void *) CMSG_DATA(cm);
> +        if (serr->ee_errno != SO_EE_ORIGIN_NONE) {
> +            error_setg_errno(errp, serr->ee_errno,
> +                             "Error on socket");
> +            break;
> +        }
> +        if (serr->ee_origin != SO_EE_ORIGIN_ZEROCOPY) {
> +            error_setg_errno(errp, serr->ee_origin,
> +                             "Error not from zerocopy");
> +            break;
> +        }
> +
> +        /* No errors, count sent ids*/
> +        sioc->async_sent += serr->ee_data - serr->ee_info + 1;
> +    }
> +}
> +
> +
>  #else /* WIN32 */
>  static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
>                                          const struct iovec *iov,

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


