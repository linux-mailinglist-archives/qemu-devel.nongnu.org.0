Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C3E51BA05
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 10:17:54 +0200 (CEST)
Received: from localhost ([::1]:56372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmWgK-0006hJ-PV
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 04:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmWUj-0000mv-W3
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:05:54 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:25703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmWUd-0005WH-SE
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:05:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651737947;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4g9IdpT5YDA9sI0e44IvsCn9N77sBF+liM2fkKENZrU=;
 b=Rr7vyCEgzvHfossE6QYJPyBYrQZqEwPE6bZjkMD+w2ayTTsEmGX72BjdUP1d40MEdGw6GC
 U8gfEcWXjXgiMvfSOCEDDomy0trPgStpulax4TEmM7+qpZc5/MBTy6rQEAlV56vKwAB/rp
 GdRB1uPI5yB4jtqhLBl7sKCs8IjyCR8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-BQTNHDzPMPuqpj4txRKInw-1; Thu, 05 May 2022 04:05:44 -0400
X-MC-Unique: BQTNHDzPMPuqpj4txRKInw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 893523C02B76;
 Thu,  5 May 2022 08:05:43 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A9C614A4FAD;
 Thu,  5 May 2022 08:05:41 +0000 (UTC)
Date: Thu, 5 May 2022 09:05:38 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH v11 2/7] QIOChannelSocket: Implement io_writev zero copy
 flag & io_flush for CONFIG_LINUX
Message-ID: <YnOFUnA439GftKyQ@redhat.com>
References: <20220504191835.791580-1-leobras@redhat.com>
 <20220504191835.791580-3-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220504191835.791580-3-leobras@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.74; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 04, 2022 at 04:18:31PM -0300, Leonardo Bras wrote:
> For CONFIG_LINUX, implement the new zero copy flag and the optional callback
> io_flush on QIOChannelSocket, but enables it only when MSG_ZEROCOPY
> feature is available in the host kernel, which is checked on
> qio_channel_socket_connect_sync()
> 
> qio_channel_socket_flush() was implemented by counting how many times
> sendmsg(...,MSG_ZEROCOPY) was successfully called, and then reading the
> socket's error queue, in order to find how many of them finished sending.
> Flush will loop until those counters are the same, or until some error occurs.
> 
> Notes on using writev() with QIO_CHANNEL_WRITE_FLAG_ZERO_COPY:
> 1: Buffer
> - As MSG_ZEROCOPY tells the kernel to use the same user buffer to avoid copying,
> some caution is necessary to avoid overwriting any buffer before it's sent.
> If something like this happen, a newer version of the buffer may be sent instead.
> - If this is a problem, it's recommended to call qio_channel_flush() before freeing
> or re-using the buffer.
> 
> 2: Locked memory
> - When using MSG_ZERCOCOPY, the buffer memory will be locked after queued, and
> unlocked after it's sent.
> - Depending on the size of each buffer, and how often it's sent, it may require
> a larger amount of locked memory than usually available to non-root user.
> - If the required amount of locked memory is not available, writev_zero_copy
> will return an error, which can abort an operation like migration,
> - Because of this, when an user code wants to add zero copy as a feature, it
> requires a mechanism to disable it, so it can still be accessible to less
> privileged users.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> ---
>  include/io/channel-socket.h |   2 +
>  io/channel-socket.c         | 120 ++++++++++++++++++++++++++++++++++--
>  2 files changed, 118 insertions(+), 4 deletions(-)
> 
> diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
> index e747e63514..513c428fe4 100644
> --- a/include/io/channel-socket.h
> +++ b/include/io/channel-socket.h
> @@ -47,6 +47,8 @@ struct QIOChannelSocket {
>      socklen_t localAddrLen;
>      struct sockaddr_storage remoteAddr;
>      socklen_t remoteAddrLen;
> +    ssize_t zero_copy_queued;
> +    ssize_t zero_copy_sent;
>  };
>  
>  
> diff --git a/io/channel-socket.c b/io/channel-socket.c
> index 696a04dc9c..ae756ce166 100644
> --- a/io/channel-socket.c
> +++ b/io/channel-socket.c
> @@ -25,9 +25,25 @@
>  #include "io/channel-watch.h"
>  #include "trace.h"
>  #include "qapi/clone-visitor.h"
> +#ifdef CONFIG_LINUX
> +#include <linux/errqueue.h>
> +#include <sys/socket.h>
> +#endif
>  
>  #define SOCKET_MAX_FDS 16
>  
> +/*
> + * Zero-copy defines bellow are included to avoid breaking builds on systems
> + * that don't support MSG_ZEROCOPY, while keeping the functions more readable
> + * (without a lot of ifdefs).
> + */
> +#ifndef MSG_ZEROCOPY
> +#define MSG_ZEROCOPY 0x4000000
> +#endif
> +#ifndef SO_ZEROCOPY
> +#define SO_ZEROCOPY 60
> +#endif

Please put these behind CONFIG_LINUX to make it clear to readers that
this is entirely Linux specific


> +
>  SocketAddress *
>  qio_channel_socket_get_local_address(QIOChannelSocket *ioc,
>                                       Error **errp)
> @@ -54,6 +70,8 @@ qio_channel_socket_new(void)
>  
>      sioc = QIO_CHANNEL_SOCKET(object_new(TYPE_QIO_CHANNEL_SOCKET));
>      sioc->fd = -1;
> +    sioc->zero_copy_queued = 0;
> +    sioc->zero_copy_sent = 0;
>  
>      ioc = QIO_CHANNEL(sioc);
>      qio_channel_set_feature(ioc, QIO_CHANNEL_FEATURE_SHUTDOWN);
> @@ -153,6 +171,16 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
>          return -1;
>      }
>  
> +#ifdef CONFIG_LINUX
> +    int ret, v = 1;
> +    ret = setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &v, sizeof(v));
> +    if (ret == 0) {
> +        /* Zero copy available on host */
> +        qio_channel_set_feature(QIO_CHANNEL(ioc),
> +                                QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY);
> +    }
> +#endif
> +
>      return 0;
>  }
>  
> @@ -533,6 +561,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>      char control[CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS)];
>      size_t fdsize = sizeof(int) * nfds;
>      struct cmsghdr *cmsg;
> +    int sflags = 0;
>  
>      memset(control, 0, CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS));
>  
> @@ -557,15 +586,27 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>          memcpy(CMSG_DATA(cmsg), fds, fdsize);
>      }
>  
> +    if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
> +        sflags = MSG_ZEROCOPY;
> +    }

Also should be behind CONFIG_LINUX

> +
>   retry:
> -    ret = sendmsg(sioc->fd, &msg, 0);
> +    ret = sendmsg(sioc->fd, &msg, sflags);
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
> +            if (sflags & MSG_ZEROCOPY) {
> +                error_setg_errno(errp, errno,
> +                                 "Process can't lock enough memory for using MSG_ZEROCOPY");
> +                return -1;
> +            }
> +            break;

And this ENOBUGS case behind CONFIG_LINUX

>          }
> +
>          error_setg_errno(errp, errno,
>                           "Unable to write to socket");
>          return -1;
> @@ -659,6 +700,74 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>  }
>  #endif /* WIN32 */
>  
> +
> +#ifdef CONFIG_LINUX
> +static int qio_channel_socket_flush(QIOChannel *ioc,
> +                                    Error **errp)
> +{
> +    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
> +    struct msghdr msg = {};
> +    struct sock_extended_err *serr;
> +    struct cmsghdr *cm;
> +    char control[CMSG_SPACE(sizeof(*serr))];
> +    int received;
> +    int ret = 1;
> +
> +    msg.msg_control = control;
> +    msg.msg_controllen = sizeof(control);
> +    memset(control, 0, sizeof(control));
> +
> +    while (sioc->zero_copy_sent < sioc->zero_copy_queued) {
> +        received = recvmsg(sioc->fd, &msg, MSG_ERRQUEUE);
> +        if (received < 0) {
> +            switch (errno) {
> +            case EAGAIN:
> +                /* Nothing on errqueue, wait until something is available */
> +                qio_channel_wait(ioc, G_IO_ERR);
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
> +                             "Error not from zero copy");
> +            return -1;
> +        }
> +
> +        /* No errors, count successfully finished sendmsg()*/
> +        sioc->zero_copy_sent += serr->ee_data - serr->ee_info + 1;
> +
> +        /* If any sendmsg() succeeded using zero copy, return 0 at the end */
> +        if (serr->ee_code != SO_EE_CODE_ZEROCOPY_COPIED) {
> +            ret = 0;
> +        }
> +    }
> +
> +    return ret;
> +}
> +
> +#endif /* CONFIG_LINUX */
> +
>  static int
>  qio_channel_socket_set_blocking(QIOChannel *ioc,
>                                  bool enabled,
> @@ -789,6 +898,9 @@ static void qio_channel_socket_class_init(ObjectClass *klass,
>      ioc_klass->io_set_delay = qio_channel_socket_set_delay;
>      ioc_klass->io_create_watch = qio_channel_socket_create_watch;
>      ioc_klass->io_set_aio_fd_handler = qio_channel_socket_set_aio_fd_handler;
> +#ifdef CONFIG_LINUX
> +    ioc_klass->io_flush = qio_channel_socket_flush;
> +#endif
>  }
>  
>  static const TypeInfo qio_channel_socket_info = {
> -- 
> 2.36.0
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


