Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916543FC7FB
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 15:16:04 +0200 (CEST)
Received: from localhost ([::1]:50304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL3cR-0002hD-KV
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 09:16:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mL3LB-0000g8-0y
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:58:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mL3L6-0004WU-Ij
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:58:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630414686;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=HdcIUWZi+JX1efUlI0/Gy2qznceIIIR3lE3bRW0hPFg=;
 b=dMUiIV9wGkyp0iEoeeUlE+Qz7C7uxXEI3uAUtLvVN05wBy19CQ9HYbUnnoEhSE2mlhs6Zc
 OMIqcs5O7dcTzpn4vd2W+n37FfTala6gqLMQBu80WOFHWzzhucfPYbEnAyswfwSTldBR0g
 FPYHTJtQTrrxkdYWRb0UXkyar78XHsY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-A9PsQKjyM3C8voSTi_wTSQ-1; Tue, 31 Aug 2021 08:57:52 -0400
X-MC-Unique: A9PsQKjyM3C8voSTi_wTSQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69DE087D543;
 Tue, 31 Aug 2021 12:57:51 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 374926ACE5;
 Tue, 31 Aug 2021 12:57:36 +0000 (UTC)
Date: Tue, 31 Aug 2021 13:57:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v1 2/3] io: Add zerocopy and errqueue
Message-ID: <YS4nPfEBCy9IC3rd@redhat.com>
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-3-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210831110238.299458-3-leobras@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 31, 2021 at 08:02:38AM -0300, Leonardo Bras wrote:
> MSG_ZEROCOPY is a feature that enables copy avoidance in TCP/UDP socket
> send calls. It does so by avoiding copying user data into kernel buffers.
> 
> To make it work, three steps are needed:
> 1 - A setsockopt() system call, enabling SO_ZEROCOPY
> 2 - Passing down the MSG_ZEROCOPY flag for each send*() syscall
> 3 - Process the socket's error queue, dealing with any error

AFAICT, this is missing the single most critical aspect of MSG_ZEROCOPY.

It is non-obvious, but setting the MSG_ZEROCOPY flag turns sendmsg()
from a synchronous call to an asynchronous call.

It is forbidden to overwrite/reuse/free the buffer passed to sendmsg
until an asynchronous completion notification has been received from
the socket error queue. These notifications are not required to
arrive in-order, even for a TCP stream, because the kernel hangs on
to the buffer if a re-transmit is needed.

https://www.kernel.org/doc/html/v5.4/networking/msg_zerocopy.html

  "Page pinning also changes system call semantics. It temporarily 
   shares the buffer between process and network stack. Unlike with
   copying, the process cannot immediately overwrite the buffer 
   after system call return without possibly modifying the data in 
   flight. Kernel integrity is not affected, but a buggy program
   can possibly corrupt its own data stream."

AFAICT, the design added in this patch does not provide any way
to honour these requirements around buffer lifetime.

I can't see how we can introduce MSG_ZEROCOPY in any seemless
way. The buffer lifetime requirements imply need for an API
design that is fundamentally different for asynchronous usage,
with a callback to notify when the write has finished/failed.

> Zerocopy has it's costs, so it will only get improved performance if
> the sending buffer is big (10KB, according to Linux docs).
> 
> The step 2 makes it possible to use the same socket to send data
> using both zerocopy and the default copying approach, so the application
> cat choose what is best for each packet.
> 
> To implement step 1, an optional set_zerocopy() interface was created
> in QIOChannel, allowing each using code to enable or disable it.
> 
> Step 2 will be enabled by the using code at each qio_channel_write*()
> that would benefit of zerocopy;
> 
> Step 3 is done with qio_channel_socket_errq_proc(), that runs after
> SOCKET_ERRQ_THRESH (16k) iovs sent, dealing with any error found.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  include/io/channel-socket.h |  2 +
>  include/io/channel.h        | 29 ++++++++++++++
>  io/channel-socket.c         | 76 +++++++++++++++++++++++++++++++++++++
>  io/channel-tls.c            | 11 ++++++
>  io/channel-websock.c        |  9 +++++
>  io/channel.c                | 11 ++++++
>  6 files changed, 138 insertions(+)
> 
> diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
> index e747e63514..09dffe059f 100644
> --- a/include/io/channel-socket.h
> +++ b/include/io/channel-socket.h
> @@ -47,6 +47,8 @@ struct QIOChannelSocket {
>      socklen_t localAddrLen;
>      struct sockaddr_storage remoteAddr;
>      socklen_t remoteAddrLen;
> +    size_t errq_pending;
> +    bool zerocopy_enabled;
>  };
>  
>  
> diff --git a/include/io/channel.h b/include/io/channel.h
> index dada9ebaaf..de10a78b10 100644
> --- a/include/io/channel.h
> +++ b/include/io/channel.h
> @@ -137,6 +137,8 @@ struct QIOChannelClass {
>                                    IOHandler *io_read,
>                                    IOHandler *io_write,
>                                    void *opaque);
> +    void (*io_set_zerocopy)(QIOChannel *ioc,
> +                            bool enabled);
>  };
>  
>  /* General I/O handling functions */
> @@ -570,6 +572,33 @@ int qio_channel_shutdown(QIOChannel *ioc,
>  void qio_channel_set_delay(QIOChannel *ioc,
>                             bool enabled);
>  
> +/**
> + * qio_channel_set_zerocopy:
> + * @ioc: the channel object
> + * @enabled: the new flag state
> + *
> + * Controls whether the underlying transport is
> + * permitted to use zerocopy to avoid copying the
> + * sending buffer in kernel. If @enabled is true, then the
> + * writes may avoid buffer copy in kernel. If @enabled
> + * is false, writes will cause the kernel to always
> + * copy the buffer contents before sending.
> + *
> + * In order to use make a write with zerocopy feature,
> + * it's also necessary to sent each packet with
> + * MSG_ZEROCOPY flag. With this, it's possible to
> + * to select only writes that would benefit from the
> + * use of zerocopy feature, i.e. the ones with larger
> + * buffers.
> + *
> + * This feature was added in Linux 4.14, so older
> + * versions will fail on enabling. This is not an
> + * issue, since it will fall-back to default copying
> + * approach.
> + */
> +void qio_channel_set_zerocopy(QIOChannel *ioc,
> +                              bool enabled);
> +
>  /**
>   * qio_channel_set_cork:
>   * @ioc: the channel object
> diff --git a/io/channel-socket.c b/io/channel-socket.c
> index e377e7303d..a69fec7315 100644
> --- a/io/channel-socket.c
> +++ b/io/channel-socket.c
> @@ -26,8 +26,10 @@
>  #include "io/channel-watch.h"
>  #include "trace.h"
>  #include "qapi/clone-visitor.h"
> +#include <linux/errqueue.h>

That's going to fail to biuld on non-Linux 

>  
>  #define SOCKET_MAX_FDS 16
> +#define SOCKET_ERRQ_THRESH 16384
>  
>  SocketAddress *
>  qio_channel_socket_get_local_address(QIOChannelSocket *ioc,
> @@ -55,6 +57,8 @@ qio_channel_socket_new(void)
>  
>      sioc = QIO_CHANNEL_SOCKET(object_new(TYPE_QIO_CHANNEL_SOCKET));
>      sioc->fd = -1;
> +    sioc->zerocopy_enabled = false;
> +    sioc->errq_pending = 0;
>  
>      ioc = QIO_CHANNEL(sioc);
>      qio_channel_set_feature(ioc, QIO_CHANNEL_FEATURE_SHUTDOWN);
> @@ -520,6 +524,54 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
>      return ret;
>  }
>  
> +static void qio_channel_socket_errq_proc(QIOChannelSocket *sioc,
> +                                         Error **errp)
> +{
> +    int fd = sioc->fd;
> +    int ret;
> +    struct msghdr msg = {};
> +    struct sock_extended_err *serr;
> +    struct cmsghdr *cm;
> +
> +    do {
> +        ret = recvmsg(fd, &msg, MSG_ERRQUEUE);
> +        if (ret <= 0) {
> +            if (ret == 0 || errno == EAGAIN) {
> +                /* Nothing on errqueue */
> +                 sioc->errq_pending = 0;
> +                 break;
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
> +        if (serr->ee_errno != 0) {
> +            error_setg_errno(errp, serr->ee_errno,
> +                             "Error on socket");
> +            break;
> +        }
> +        if (serr->ee_origin != SO_EE_ORIGIN_ZEROCOPY) {
> +            error_setg_errno(errp, serr->ee_origin,
> +                             "Error not from zerocopy");
> +            break;
> +        }
> +    } while (true);
> +}
> +
>  static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>                                           const struct iovec *iov,
>                                           size_t niov,
> @@ -571,6 +623,14 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>                           "Unable to write to socket");
>          return -1;
>      }
> +
> +    if ((flags & MSG_ZEROCOPY) && sioc->zerocopy_enabled) {
> +        sioc->errq_pending += niov;
> +        if (sioc->errq_pending > SOCKET_ERRQ_THRESH) {
> +            qio_channel_socket_errq_proc(sioc, errp);
> +        }
> +    }

This silently looses any errors set from upto the final
SOCKET_ERRQ_THRESH write() calls with MSG_ZEROCOPY set.

Also means if you have a series of writes without
MSG_ZEROCOPY, it'll delay checking any pending
errors.

I would suggest checkig in close(), but as mentioned
earlier, I think the design is flawed because the caller
fundamentally needs to know about completion for every
single write they make in order to know when the buffer
can be released / reused.

> +static void
> +qio_channel_socket_set_zerocopy(QIOChannel *ioc,
> +                                bool enabled)
> +{
> +    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
> +    int v = enabled ? 1 : 0;
> +    int ret;
> +
> +    ret = qemu_setsockopt(sioc->fd, SOL_SOCKET, SO_ZEROCOPY, &v, sizeof(v));
> +    if (ret >= 0) {
> +        sioc->zerocopy_enabled = true;
> +    }
> +}

Surely we need to tell the caller wether this succeeed, otherwise
the later sendmsg() is going to fail with EINVAL on older kernels
where MSG_ZEROCOPY is not supported.


> diff --git a/io/channel-tls.c b/io/channel-tls.c
> index 4ce890a538..bf44b0f7b0 100644
> --- a/io/channel-tls.c
> +++ b/io/channel-tls.c
> @@ -350,6 +350,16 @@ static void qio_channel_tls_set_delay(QIOChannel *ioc,
>      qio_channel_set_delay(tioc->master, enabled);
>  }
>  
> +
> +static void qio_channel_tls_set_zerocopy(QIOChannel *ioc,
> +                                         bool enabled)
> +{
> +    QIOChannelTLS *tioc = QIO_CHANNEL_TLS(ioc);
> +
> +    qio_channel_set_zerocopy(tioc->master, enabled);
> +}

This is going to be unsafe because gnutls will discard/reuse the
buffer for the ciphertext after every write(). I can't see a
way to safely enable MSG_ZEROCOPY when TLS is used.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


