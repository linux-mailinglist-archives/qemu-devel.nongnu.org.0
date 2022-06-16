Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B99BE54E8BE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 19:43:02 +0200 (CEST)
Received: from localhost ([::1]:34200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1tWH-00066F-Ef
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 13:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1tTG-0005BJ-3Q
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 13:39:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1tTC-00056p-0a
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 13:39:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655401188;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=sMeGJtBloPWEXWXhRk80N/S00iCFizSSwXAu3WtH5d4=;
 b=V3X7yg+uC8cDprHldbInUJNRq7K/UXS2vNV2OZ/KugOkYtjYKCTIGFdsJW0HU5iI+C88sA
 a4lL8zHGbD2QsHbfwnSUkjYojdTqYywfR8TVRylY1kzKn61FvGo8QtTUhnY/WIRD8qPHbH
 2HCghN7xdMUqxFGqqxBLjd70fu9yGG0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-mwLN9zthOnyqfwVcF6SEXQ-1; Thu, 16 Jun 2022 13:39:45 -0400
X-MC-Unique: mwLN9zthOnyqfwVcF6SEXQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5A633C0D199;
 Thu, 16 Jun 2022 17:39:44 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C500A2166B26;
 Thu, 16 Jun 2022 17:39:41 +0000 (UTC)
Date: Thu, 16 Jun 2022 18:39:39 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, eblake@redhat.com,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: Re: [PATCH 3/4] Establishing connection between any non-default
 source and destination pair
Message-ID: <Yqtq2yRTe4xVNkx+@redhat.com>
References: <20220609073305.142515-1-het.gala@nutanix.com>
 <20220609073305.142515-4-het.gala@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220609073305.142515-4-het.gala@nutanix.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Jun 09, 2022 at 07:33:04AM +0000, Het Gala wrote:
> i) Binding of the socket to source ip address and port on the non-default
>    interface has been implemented for multi-FD connection, which was not
>    necessary earlier because the binding was on the default interface itself.
> 
> ii) Created an end to end connection between all multi-FD source and
>     destination pairs.
> 
> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
> Signed-off-by: Het Gala <het.gala@nutanix.com>
> ---
>  chardev/char-socket.c               |  4 +-
>  include/io/channel-socket.h         | 26 ++++++-----
>  include/qemu/sockets.h              |  6 ++-
>  io/channel-socket.c                 | 50 ++++++++++++++------
>  migration/socket.c                  | 15 +++---
>  nbd/client-connection.c             |  2 +-
>  qemu-nbd.c                          |  4 +-
>  scsi/pr-manager-helper.c            |  1 +
>  tests/unit/test-char.c              |  8 ++--
>  tests/unit/test-io-channel-socket.c |  4 +-
>  tests/unit/test-util-sockets.c      | 16 +++----
>  ui/input-barrier.c                  |  2 +-
>  ui/vnc.c                            |  3 +-
>  util/qemu-sockets.c                 | 71 ++++++++++++++++++++---------
>  14 files changed, 135 insertions(+), 77 deletions(-)
> 
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index dc4e218eeb..f3725238c5 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -932,7 +932,7 @@ static int tcp_chr_connect_client_sync(Chardev *chr, Error **errp)
>      QIOChannelSocket *sioc = qio_channel_socket_new();
>      tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);
>      tcp_chr_set_client_ioc_name(chr, sioc);
> -    if (qio_channel_socket_connect_sync(sioc, s->addr, errp) < 0) {
> +    if (qio_channel_socket_connect_sync(sioc, s->addr, NULL, errp) < 0) {
>          tcp_chr_change_state(s, TCP_CHARDEV_STATE_DISCONNECTED);
>          object_unref(OBJECT(sioc));
>          return -1;
> @@ -1120,7 +1120,7 @@ static void tcp_chr_connect_client_task(QIOTask *task,
>      SocketAddress *addr = opaque;
>      Error *err = NULL;
>  
> -    qio_channel_socket_connect_sync(ioc, addr, &err);
> +    qio_channel_socket_connect_sync(ioc, addr, NULL, &err);
>  
>      qio_task_set_error(task, err);
>  }
> diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
> index 513c428fe4..59d5b1b349 100644
> --- a/include/io/channel-socket.h
> +++ b/include/io/channel-socket.h
> @@ -83,41 +83,45 @@ qio_channel_socket_new_fd(int fd,
>  /**
>   * qio_channel_socket_connect_sync:
>   * @ioc: the socket channel object
> - * @addr: the address to connect to
> + * @dst_addr: the destination address to connect to
> + * @src_addr: the source address to be connected
>   * @errp: pointer to a NULL-initialized error object
>   *
> - * Attempt to connect to the address @addr. This method
> - * will run in the foreground so the caller will not regain
> - * execution control until the connection is established or
> + * Attempt to connect to the address @dst_addr with @src_addr.
> + * This method will run in the foreground so the caller will not
> + * regain execution control until the connection is established or
>   * an error occurs.
>   */
>  int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
> -                                    SocketAddress *addr,
> +                                    SocketAddress *dst_addr,
> +                                    SocketAddress *src_addr,
>                                      Error **errp);
>  
>  /**
>   * qio_channel_socket_connect_async:
>   * @ioc: the socket channel object
> - * @addr: the address to connect to
> + * @dst_addr: the destination address to connect to
>   * @callback: the function to invoke on completion
>   * @opaque: user data to pass to @callback
>   * @destroy: the function to free @opaque
>   * @context: the context to run the async task. If %NULL, the default
>   *           context will be used.
> + * @src_addr: the source address to be connected
>   *
> - * Attempt to connect to the address @addr. This method
> - * will run in the background so the caller will regain
> + * Attempt to connect to the address @dst_addr with the @src_addr.
> + * This method will run in the background so the caller will regain
>   * execution control immediately. The function @callback
> - * will be invoked on completion or failure. The @addr
> + * will be invoked on completion or failure. The @dst_addr
>   * parameter will be copied, so may be freed as soon
>   * as this function returns without waiting for completion.
>   */
>  void qio_channel_socket_connect_async(QIOChannelSocket *ioc,
> -                                      SocketAddress *addr,
> +                                      SocketAddress *dst_addr,
>                                        QIOTaskFunc callback,
>                                        gpointer opaque,
>                                        GDestroyNotify destroy,
> -                                      GMainContext *context);
> +                                      GMainContext *context,
> +                                      SocketAddress *src_addr);

Lets avoid modifying these two methods, and thus avoid
updating countless callers.

In common with typical pattern in QIO code, lets add
a second variant

  qio_channel_socket_connect_full
  qio_channel_socket_connect_full_async

which has the extra parameters, then make the existing
simpler methods call the new ones.

ie qio_channel_socket_connect should call
qio_channel_socket_connect_full, pasing NULL for the
src_addr.



> diff --git a/io/channel-socket.c b/io/channel-socket.c
> index dc9c165de1..f8746ad646 100644
> --- a/io/channel-socket.c
> +++ b/io/channel-socket.c
> @@ -36,6 +36,12 @@
>  
>  #define SOCKET_MAX_FDS 16
>  
> +struct SrcDestAddress {
> +    SocketAddress *dst_addr;
> +    SocketAddress *src_addr;
> +};

Nitpick, just call this   'struct ConnectData'.

>  SocketAddress *
>  qio_channel_socket_get_local_address(QIOChannelSocket *ioc,
>                                       Error **errp)
> @@ -145,13 +151,14 @@ qio_channel_socket_new_fd(int fd,
>  
>  
>  int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
> -                                    SocketAddress *addr,
> +                                    SocketAddress *dst_addr,
> +                                    SocketAddress *src_addr,
>                                      Error **errp)
>  {
>      int fd;
>  
> -    trace_qio_channel_socket_connect_sync(ioc, addr);
> -    fd = socket_connect(addr, errp);
> +    trace_qio_channel_socket_connect_sync(ioc, dst_addr);
> +    fd = socket_connect(dst_addr, src_addr, errp);
>      if (fd < 0) {
>          trace_qio_channel_socket_connect_fail(ioc);
>          return -1;
> @@ -177,39 +184,56 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
>  }
>  
>  
> +static void qio_channel_socket_worker_free(gpointer opaque)
> +{
> +    struct SrcDestAddress *data = opaque;
> +    if (!data) {
> +        return;
> +    }
> +    qapi_free_SocketAddress(data->dst_addr);
> +    qapi_free_SocketAddress(data->src_addr);
> +    g_free(data);
> +}
> +
> +
>  static void qio_channel_socket_connect_worker(QIOTask *task,
>                                                gpointer opaque)
>  {
>      QIOChannelSocket *ioc = QIO_CHANNEL_SOCKET(qio_task_get_source(task));
> -    SocketAddress *addr = opaque;
> +    struct SrcDestAddress *data = opaque;
>      Error *err = NULL;
>  
> -    qio_channel_socket_connect_sync(ioc, addr, &err);
> +    qio_channel_socket_connect_sync(ioc, data->dst_addr, data->src_addr, &err);
>  
>      qio_task_set_error(task, err);
>  }
>  
>  
>  void qio_channel_socket_connect_async(QIOChannelSocket *ioc,
> -                                      SocketAddress *addr,
> +                                      SocketAddress *dst_addr,
>                                        QIOTaskFunc callback,
>                                        gpointer opaque,
>                                        GDestroyNotify destroy,
> -                                      GMainContext *context)
> +                                      GMainContext *context,
> +                                      SocketAddress *src_addr)
>  {
>      QIOTask *task = qio_task_new(
>          OBJECT(ioc), callback, opaque, destroy);
> -    SocketAddress *addrCopy;
> -
> -    addrCopy = QAPI_CLONE(SocketAddress, addr);
> +    struct SrcDestAddress *data = g_new0(struct SrcDestAddress, 1);
>  
> +    data->dst_addr = QAPI_CLONE(SocketAddress, dst_addr);
> +    if (src_addr) {
> +        data->src_addr = QAPI_CLONE(SocketAddress, src_addr);
> +    } else {
> +        data->src_addr = NULL;
> +    }
>      /* socket_connect() does a non-blocking connect(), but it
>       * still blocks in DNS lookups, so we must use a thread */
> -    trace_qio_channel_socket_connect_async(ioc, addr);
> +    trace_qio_channel_socket_connect_async(ioc, dst_addr);
>      qio_task_run_in_thread(task,
>                             qio_channel_socket_connect_worker,
> -                           addrCopy,
> -                           (GDestroyNotify)qapi_free_SocketAddress,
> +                           data,
> +                           qio_channel_socket_worker_free,
>                             context);
>  }
>  
> diff --git a/migration/socket.c b/migration/socket.c
> index 21e0983df2..d0cb7cc6a6 100644
> --- a/migration/socket.c
> +++ b/migration/socket.c
> @@ -47,7 +47,7 @@ void socket_send_channel_create(QIOTaskFunc f, void *data)
>  {
>      QIOChannelSocket *sioc = qio_channel_socket_new();
>      qio_channel_socket_connect_async(sioc, outgoing_args.saddr,
> -                                     f, data, NULL, NULL);
> +                                     f, data, NULL, NULL, NULL);
>  }
>  
>  int socket_send_channel_destroy(QIOChannel *send)
> @@ -110,7 +110,7 @@ out:
>  
>  static void
>  socket_start_outgoing_migration_internal(MigrationState *s,
> -                                         SocketAddress *saddr,
> +                                         SocketAddress *dst_addr,
>                                           Error **errp)
>  {
>      QIOChannelSocket *sioc = qio_channel_socket_new();
> @@ -118,20 +118,17 @@ socket_start_outgoing_migration_internal(MigrationState *s,
>  
>      data->s = s;
>  
> -    /* in case previous migration leaked it */
> -    qapi_free_SocketAddress(outgoing_args.saddr);
> -    outgoing_args.saddr = saddr;
> -
> -    if (saddr->type == SOCKET_ADDRESS_TYPE_INET) {
> -        data->hostname = g_strdup(saddr->u.inet.host);
> +    if (dst_addr->type == SOCKET_ADDRESS_TYPE_INET) {
> +        data->hostname = g_strdup(dst_addr->u.inet.host);
>      }
>  
>      qio_channel_set_name(QIO_CHANNEL(sioc), "migration-socket-outgoing");
>      qio_channel_socket_connect_async(sioc,
> -                                     saddr,
> +                                     dst_addr,
>                                       socket_outgoing_migration,
>                                       data,
>                                       socket_connect_data_free,
> +                                     NULL,
>                                       NULL);
>  }
>  

> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 13b5b197f9..bbe0dc0ee0 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -226,7 +226,7 @@ static int inet_listen_saddr(InetSocketAddress *saddr,
>          return -1;
>      }
>  
> -    memset(&ai,0, sizeof(ai));
> +    memset(&ai,0,sizeof(ai));

Add whitespace before the '0', rather than removing it after.

>      ai.ai_flags = AI_PASSIVE;
>      if (saddr->has_numeric && saddr->numeric) {
>          ai.ai_flags |= AI_NUMERICHOST | AI_NUMERICSERV;
> @@ -282,8 +282,8 @@ static int inet_listen_saddr(InetSocketAddress *saddr,
>              e->ai_protocol = IPPROTO_MPTCP;
>          }
>  #endif
> -        getnameinfo((struct sockaddr*)e->ai_addr,e->ai_addrlen,
> -                        uaddr,INET6_ADDRSTRLEN,uport,32,
> +        getnameinfo((struct sockaddr *)e->ai_addr, e->ai_addrlen,
> +                        uaddr, INET6_ADDRSTRLEN, uport, 32,
>                          NI_NUMERICHOST | NI_NUMERICSERV);

Both thsi & the above whitespace changes should be a separate
patch from any functional changes


> @@ -371,8 +372,28 @@ static int inet_connect_addr(const InetSocketAddress *saddr,
>      }
>      socket_set_fast_reuse(sock);
>  
> +    /* to bind the socket if src_addr is available */
> +
> +    if (src_addr) {
> +        struct sockaddr_in servaddr;
> +
> +        /* bind to a specific interface in the internet domain */
> +        /* to make sure the sin_zero filed is cleared */
> +        memset(&servaddr, 0, sizeof(servaddr));
> +
> +        servaddr.sin_family = AF_INET;
> +        servaddr.sin_addr.s_addr = inet_addr(src_addr->host);

We can't assume src_addr is a raw IPv4 address.

THis needs to go through getaddrinfo in the caller like the
dst address has done.

For sanity, we should also validate that there isn't a mismatch
of IPv4 vs IPv6 for thte src & dst addrs.

> +        servaddr.sin_port = 0;



> +
> +        if (bind(sock, (struct sockaddr *)&servaddr, sizeof(servaddr)) < 0) {
> +            error_setg_errno(errp, errno, "Failed to bind socket");
> +            return -1;
> +        }
> +    }
> +
>      /* connect to peer */
>      do {
> +
>          rc = 0;
>          if (connect(sock, addr->ai_addr, addr->ai_addrlen) < 0) {
>              rc = -errno;
> @@ -380,8 +401,14 @@ static int inet_connect_addr(const InetSocketAddress *saddr,
>      } while (rc == -EINTR);
>  
>      if (rc < 0) {
> -        error_setg_errno(errp, errno, "Failed to connect to '%s:%s'",
> -                         saddr->host, saddr->port);
> +        if (src_addr) {
> +            error_setg_errno(errp, errno, "Failed to connect '%s:%s' to "
> +                             "'%s:%s'", dst_addr->host, dst_addr->port,
> +                             src_addr->host, src_addr->port);
> +        } else {
> +            error_setg_errno(errp, errno, "Failed to connect '%s:%s'",
> +                             dst_addr->host, dst_addr->port);
> +        }
>          closesocket(sock);
>          return -1;
>      }

> @@ -506,7 +534,7 @@ static int inet_dgram_saddr(InetSocketAddress *sraddr,
>      Error *err = NULL;
>  
>      /* lookup peer addr */
> -    memset(&ai,0, sizeof(ai));
> +    memset(&ai, 0, sizeof(ai));
>      ai.ai_flags = AI_CANONNAME | AI_V4MAPPED | AI_ADDRCONFIG;
>      ai.ai_family = inet_ai_family_from_address(sraddr, &err);
>      ai.ai_socktype = SOCK_DGRAM;
> @@ -533,7 +561,7 @@ static int inet_dgram_saddr(InetSocketAddress *sraddr,
>      }
>  
>      /* lookup local addr */
> -    memset(&ai,0, sizeof(ai));
> +    memset(&ai, 0, sizeof(ai));
>      ai.ai_flags = AI_PASSIVE;
>      ai.ai_family = peer->ai_family;
>      ai.ai_socktype = SOCK_DGRAM;


> @@ -574,7 +602,7 @@ static int inet_dgram_saddr(InetSocketAddress *sraddr,
>      }
>  
>      /* connect to peer */
> -    if (connect(sock,peer->ai_addr,peer->ai_addrlen) < 0) {
> +    if (connect(sock, peer->ai_addr, peer->ai_addrlen) < 0) {
>          error_setg_errno(errp, errno, "Failed to connect to '%s:%s'",
>                           addr, port);
>          goto err;

More whitespace changes for a separate patch




With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


