Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4E744E4F1
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 11:55:53 +0100 (CET)
Received: from localhost ([::1]:46542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlUDo-0007z2-G3
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 05:55:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mlUCj-0006lW-CH
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 05:54:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mlUCg-0004cc-2s
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 05:54:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636714481;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=3aowqIO2GRnILaq9DnlcNnswCnH3I2GVZkkREsNZJ/Q=;
 b=WqA95Qv7YoP+1GpxK6de5J0atx8V/SptiB5Q4DZjzloOJnhHRkEc4kqdKx8cSZt96pb36E
 0c8PNqLEHKih8fC4ZRUHy8m5IQFg/aqNiTKwz/dYJUK/vtn7hTpjDLA6VgtnXs2t0O27o9
 Ayytge3FtHHmGIpYNatMJ9UrcbgNdss=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-whsnL01FM9KAQHqq1dLhGw-1; Fri, 12 Nov 2021 05:54:39 -0500
X-MC-Unique: whsnL01FM9KAQHqq1dLhGw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4895615720
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 10:54:38 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24B18607CB;
 Fri, 12 Nov 2021 10:54:20 +0000 (UTC)
Date: Fri, 12 Nov 2021 10:54:18 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v5 3/6] QIOChannelSocket: Implement io_writev_zerocopy &
 io_flush_zerocopy for CONFIG_LINUX
Message-ID: <YY5H2ixqGpfbo5jI@redhat.com>
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-4-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211112051040.923746-4-leobras@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 12, 2021 at 02:10:38AM -0300, Leonardo Bras wrote:
> For CONFIG_LINUX, implement the new optional callbacks io_write_zerocopy and
> io_flush_zerocopy on QIOChannelSocket, but enables it only when MSG_ZEROCOPY
> feature is available in the host kernel, which is checked on
> qio_channel_socket_connect_sync()
> 
> qio_channel_socket_flush_zerocopy() was implemented by counting how many times
> sendmsg(...,MSG_ZEROCOPY) was successfully called, and then reading the
> socket's error queue, in order to find how many of them finished sending.
> Flush will loop until those counters are the same, or until some error occurs.
> 
> A new function qio_channel_socket_poll() was also created in order to avoid
> busy-looping recvmsg() in qio_channel_socket_flush_zerocopy() while waiting for
> updates in socket's error queue.
> 
> Notes on using writev_zerocopy():
> 1: Buffer
> - As MSG_ZEROCOPY tells the kernel to use the same user buffer to avoid copying,
> some caution is necessary to avoid overwriting any buffer before it's sent.
> If something like this happen, a newer version of the buffer may be sent instead.
> - If this is a problem, it's recommended to call flush_zerocopy() before freeing
> or re-using the buffer.
> 
> 2: Locked memory
> - When using MSG_ZERCOCOPY, the buffer memory will be locked after queued, and
> unlocked after it's sent.
> - Depending on the size of each buffer, and how often it's sent, it may require
> a larger amount of locked memory than usually available to non-root user.
> - If the required amount of locked memory is not available, writev_zerocopy
> will return an error, which can abort an operation like migration,
> - Because of this, when an user code wants to add zerocopy as a feature, it
> requires a mechanism to disable it, so it can still be accessible to less
> privileged users.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  include/io/channel-socket.h |   2 +
>  include/io/channel.h        |   1 +
>  io/channel-socket.c         | 150 +++++++++++++++++++++++++++++++++++-
>  3 files changed, 150 insertions(+), 3 deletions(-)
> 
> diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
> index e747e63514..81d04baa4c 100644
> --- a/include/io/channel-socket.h
> +++ b/include/io/channel-socket.h
> @@ -47,6 +47,8 @@ struct QIOChannelSocket {
>      socklen_t localAddrLen;
>      struct sockaddr_storage remoteAddr;
>      socklen_t remoteAddrLen;
> +    ssize_t zerocopy_queued;
> +    ssize_t zerocopy_sent;
>  };
>  
>  
> diff --git a/include/io/channel.h b/include/io/channel.h
> index a19c09bb84..051fff4197 100644
> --- a/include/io/channel.h
> +++ b/include/io/channel.h
> @@ -31,6 +31,7 @@ OBJECT_DECLARE_TYPE(QIOChannel, QIOChannelClass,
>  
>  
>  #define QIO_CHANNEL_ERR_BLOCK -2
> +#define QIO_CHANNEL_ERR_NOBUFS -3
>  
>  #define QIO_CHANNEL_WRITE_FLAG_ZEROCOPY 0x1
>  
> diff --git a/io/channel-socket.c b/io/channel-socket.c
> index b57a27bf91..c724b849ad 100644
> --- a/io/channel-socket.c
> +++ b/io/channel-socket.c
> @@ -26,6 +26,10 @@
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
> @@ -55,6 +59,8 @@ qio_channel_socket_new(void)
>  
>      sioc = QIO_CHANNEL_SOCKET(object_new(TYPE_QIO_CHANNEL_SOCKET));
>      sioc->fd = -1;
> +    sioc->zerocopy_queued = 0;
> +    sioc->zerocopy_sent = 0;
>  
>      ioc = QIO_CHANNEL(sioc);
>      qio_channel_set_feature(ioc, QIO_CHANNEL_FEATURE_SHUTDOWN);
> @@ -140,6 +146,7 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
>                                      Error **errp)
>  {
>      int fd;
> +    int ret, v = 1;
>  
>      trace_qio_channel_socket_connect_sync(ioc, addr);
>      fd = socket_connect(addr, errp);
> @@ -154,6 +161,15 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
>          return -1;
>      }
>  
> +#ifdef CONFIG_LINUX
> +    ret = qemu_setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &v, sizeof(v));
> +    if (ret == 0) {
> +        /* Zerocopy available on host */
> +        qio_channel_set_feature(QIO_CHANNEL(ioc),
> +                                QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY);
> +    }
> +#endif
> +
>      return 0;
>  }
>  
> @@ -561,12 +577,15 @@ static ssize_t qio_channel_socket_writev_flags(QIOChannel *ioc,
>   retry:
>      ret = sendmsg(sioc->fd, &msg, flags);
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

Why does ENOBUFS need handling separately instead of letting
the error_setg_errno below handle it ?

The caller immediately invokes error_setg_errno() again,
just with different error message.

No code in this series ever looks at QIO_CHANNEL_ERR_NOBUFS
either, so we don't even need that special error return code
added AFAICT ?

>          }
> +
>          error_setg_errno(errp, errno,
>                           "Unable to write to socket");
>          return -1;
> @@ -670,6 +689,127 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>  }
>  #endif /* WIN32 */
>  
> +
> +#ifdef CONFIG_LINUX
> +
> +static int qio_channel_socket_poll(QIOChannelSocket *sioc, bool zerocopy,
> +                                   Error **errp)

There's only one caller and it always passes zerocopy=true,
so this parmeter looks pointless.

> +{
> +    struct pollfd pfd;
> +    int ret;
> +
> +    pfd.fd = sioc->fd;
> +    pfd.events = 0;
> +
> + retry:
> +    ret = poll(&pfd, 1, -1);
> +    if (ret < 0) {
> +        switch (errno) {
> +        case EAGAIN:
> +        case EINTR:
> +            goto retry;
> +        default:
> +            error_setg_errno(errp, errno,
> +                             "Poll error");
> +            return ret;

       return -1;

> +        }
> +    }
> +
> +    if (pfd.revents & (POLLHUP | POLLNVAL)) {
> +        error_setg(errp, "Poll error: Invalid or disconnected fd");
> +        return -1;
> +    }
> +
> +    if (!zerocopy && (pfd.revents & POLLERR)) {
> +        error_setg(errp, "Poll error: Errors present in errqueue");
> +        return -1;
> +    }

> +
> +    return ret;

  return 0;

> +}
> +
> +static ssize_t qio_channel_socket_writev_zerocopy(QIOChannel *ioc,
> +                                                  const struct iovec *iov,
> +                                                  size_t niov,
> +                                                  Error **errp)
> +{
> +    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
> +    ssize_t ret;
> +
> +    ret = qio_channel_socket_writev_flags(ioc, iov, niov, NULL, 0,
> +                                          MSG_ZEROCOPY, errp);
> +    if (ret == QIO_CHANNEL_ERR_NOBUFS) {
> +        error_setg_errno(errp, errno,
> +                         "Process can't lock enough memory for using MSG_ZEROCOPY");

This should not be touching errno - the method should be setting the
errp directly, not leaving it to the caller.

> +        return -1;
> +    }
> +
> +    sioc->zerocopy_queued++;

 if (ret > 0)
    sio->zerocopy_queued++

since the kernel doesn't increase the counter if the data sent
was zero length. A caller shouldn't be passing us a zero length
iov data element, but it is wise to be cautious

> +    return ret;
> +}
> +
> +static int qio_channel_socket_flush_zerocopy(QIOChannel *ioc,
> +                                             Error **errp)
> +{
> +    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
> +    struct msghdr msg = {};
> +    struct sock_extended_err *serr;
> +    struct cmsghdr *cm;
> +    char control[CMSG_SPACE(sizeof(*serr))];
> +    int ret;

Add

   int rv = 0;

> +
> +    msg.msg_control = control;
> +    msg.msg_controllen = sizeof(control);
> +    memset(control, 0, sizeof(control));
> +
> +    while (sioc->zerocopy_sent < sioc->zerocopy_queued) {
> +        ret = recvmsg(sioc->fd, &msg, MSG_ERRQUEUE);
> +        if (ret < 0) {
> +            switch (errno) {
> +            case EAGAIN:
> +                /* Nothing on errqueue, wait until something is available */
> +                ret = qio_channel_socket_poll(sioc, true, errp);
> +                if (ret < 0) {
> +                    return -1;
> +                }
> +                continue;
> +            case EINTR:
> +                continue;
> +            default:
> +                error_setg_errno(errp, errno,
> +                                 "Unable to read errqueue");
> +                return -1;
> +            }
> +        }
> +
> +        cm = CMSG_FIRSTHDR(&msg);
> +        if (cm->cmsg_level != SOL_IP &&
> +            cm->cmsg_type != IP_RECVERR) {
> +            error_setg_errno(errp, EPROTOTYPE,
> +                             "Wrong cmsg in errqueue");
> +            return -1;
> +        }
> +
> +        serr = (void *) CMSG_DATA(cm);
> +        if (serr->ee_errno != SO_EE_ORIGIN_NONE) {
> +            error_setg_errno(errp, serr->ee_errno,
> +                             "Error on socket");
> +            return -1;
> +        }
> +        if (serr->ee_origin != SO_EE_ORIGIN_ZEROCOPY) {
> +            error_setg_errno(errp, serr->ee_origin,
> +                             "Error not from zerocopy");
> +            return -1;
> +        }
> +
> +        /* No errors, count successfully finished sendmsg()*/
> +        sioc->zerocopy_sent += serr->ee_data - serr->ee_info + 1;

Here add


     if (ee_code ==  SO_EE_CODE_ZEROCOPY_COPIED)
        rv = 1;

> +    }
> +    return 0;

return rv;

> +}



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


