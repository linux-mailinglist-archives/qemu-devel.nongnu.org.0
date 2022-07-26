Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0771D581167
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 12:46:38 +0200 (CEST)
Received: from localhost ([::1]:60612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGI5E-0001le-Mi
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 06:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oGI2x-0008J8-5m
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 06:44:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oGI2t-0003sW-J8
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 06:44:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658832249;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=xZ/r0pS+JT59/tJgbsTRpgtyOEZ2FbuSxhugEvG8V78=;
 b=Tep6MWIxMeifchHKUTaTWOENq5ewnXUihDTuBt7wNzhdXoalNcMB4akyslAAYomJYT442V
 wjgfQQBuhYeXTiCEP0GMrw6J0ntNTn1wTguAH5SQi7aocRIOrhhWuaCOwwD2xvcWbKwaRQ
 TThCe3/Fl/U9pM6oZRs0wfFrmzkP2iY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-DgtjORn6Nn6xIGmly2Nayg-1; Tue, 26 Jul 2022 06:44:06 -0400
X-MC-Unique: DgtjORn6Nn6xIGmly2Nayg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1791A2919EB1;
 Tue, 26 Jul 2022 10:44:06 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 998C8492C3B;
 Tue, 26 Jul 2022 10:44:04 +0000 (UTC)
Date: Tue, 26 Jul 2022 11:44:02 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, eblake@redhat.com,
 prerna.saxena@nutanix.com, Manish Mishra <manish.mishra@nutanix.com>
Subject: Re: [PATCH v2 5/7] multifd: establishing connection between any
 non-default src and dest pair
Message-ID: <Yt/Fcj7ylaOzFpQx@redhat.com>
References: <20220721195620.123837-1-het.gala@nutanix.com>
 <20220721195620.123837-6-het.gala@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220721195620.123837-6-het.gala@nutanix.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

In $SUBJECT      s/multifd:/io:/ as this is not migration related.

On Thu, Jul 21, 2022 at 07:56:18PM +0000, Het Gala wrote:
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
>  include/io/channel-socket.h    | 44 ++++++++++++++++
>  include/qemu/sockets.h         |  6 ++-
>  io/channel-socket.c            | 93 ++++++++++++++++++++++++++--------
>  migration/socket.c             |  4 +-
>  tests/unit/test-util-sockets.c | 16 +++---
>  util/qemu-sockets.c            | 90 +++++++++++++++++++++++---------
>  6 files changed, 196 insertions(+), 57 deletions(-)
> 
> diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
> index 513c428fe4..8168866b06 100644
> --- a/include/io/channel-socket.h
> +++ b/include/io/channel-socket.h
> @@ -211,6 +211,50 @@ void qio_channel_socket_dgram_async(QIOChannelSocket *ioc,
>                                      GMainContext *context);
>  
>  
> +/**
> + * qio_channel_socket_connect_all_sync:

This needs to be called qio_channel_socket_connect_full_sync to
match the naming conventions in use in IO code.


> + * @ioc: the socket channel object
> + * @dst_addr: the destination address to connect to
> + * @src_addr: the source address to be connected

'the optional source address to bind to'


> + * @errp: pointer to a NULL-initialized error object
> + *
> + * Attempt to connect to the address @dst_addr with @src_addr.

  * Attempt to connect to the address @dst_addr. If @src_addr
  * is non-NULL, it will be bound to in order to control outbound
  * interface routing.


> + * This method will run in the foreground so the caller will not
> + * regain execution control until the connection is established or
> + * an error occurs.
> + */
> +int qio_channel_socket_connect_all_sync(QIOChannelSocket *ioc,
> +                                    SocketAddress *dst_addr,
> +                                    SocketAddress *src_addr,
> +                                    Error **errp);

Vertical mis-alignment of parameters 

> +
> +/**
> + * qio_channel_socket_connect_all_async:

Needs to be qio_channel_socket_connect_full_async


> + * @ioc: the socket channel object
> + * @dst_addr: the destination address to connect to

@src_addr needs to be placed here...

> + * @callback: the function to invoke on completion
> + * @opaque: user data to pass to @callback
> + * @destroy: the function to free @opaque
> + * @context: the context to run the async task. If %NULL, the default
> + *           context will be used.
> + * @src_addr: the source address to be connected

...not here

and same note about the docs comment

> + *
> + * Attempt to connect to the address @dst_addr with the @src_addr.

Same note about the docs comment

> + * This method will run in the background so the caller will regain
> + * execution control immediately. The function @callback
> + * will be invoked on completion or failure. The @dst_addr
> + * parameter will be copied, so may be freed as soon
> + * as this function returns without waiting for completion.
> + */
> +void qio_channel_socket_connect_all_async(QIOChannelSocket *ioc,
> +                                          SocketAddress *dst_addr,
> +                                          QIOTaskFunc callback,
> +                                          gpointer opaque,
> +                                          GDestroyNotify destroy,
> +                                          GMainContext *context,
> +                                          SocketAddress *src_addr);
> +
> +
>  /**
>   * qio_channel_socket_get_local_address:
>   * @ioc: the socket channel object





> diff --git a/migration/socket.c b/migration/socket.c
> index dab872a0fe..69fda774ba 100644
> --- a/migration/socket.c
> +++ b/migration/socket.c
> @@ -57,8 +57,8 @@ int outgoing_param_total_multifds(void)
>  void socket_send_channel_create(QIOTaskFunc f, void *data)
>  {
>      QIOChannelSocket *sioc = qio_channel_socket_new();
> -    qio_channel_socket_connect_async(sioc, outgoing_args.saddr,
> -                                     f, data, NULL, NULL);
> +    qio_channel_socket_connect_all_async(sioc, outgoing_args.saddr,
> +                                     f, data, NULL, NULL, NULL);
>  }

Don't change this call at all until the next patch which actually
needs to pass a non-NULL parameter for src.

>  QIOChannel *socket_send_channel_create_sync(Error **errp)
> diff --git a/tests/unit/test-util-sockets.c b/tests/unit/test-util-sockets.c
> index 63909ccb2b..aa26630045 100644
> --- a/tests/unit/test-util-sockets.c
> +++ b/tests/unit/test-util-sockets.c
> @@ -89,7 +89,7 @@ static void test_socket_fd_pass_name_good(void)
>      addr.type = SOCKET_ADDRESS_TYPE_FD;
>      addr.u.fd.str = g_strdup(mon_fdname);
>  
> -    fd = socket_connect(&addr, &error_abort);
> +    fd = socket_connect(&addr, NULL, &error_abort);
>      g_assert_cmpint(fd, !=, -1);
>      g_assert_cmpint(fd, !=, mon_fd);
>      close(fd);
> @@ -121,7 +121,7 @@ static void test_socket_fd_pass_name_bad(void)
>      addr.type = SOCKET_ADDRESS_TYPE_FD;
>      addr.u.fd.str = g_strdup(mon_fdname);
>  
> -    fd = socket_connect(&addr, &err);
> +    fd = socket_connect(&addr, NULL, &err);
>      g_assert_cmpint(fd, ==, -1);
>      error_free_or_abort(&err);
>  
> @@ -148,7 +148,7 @@ static void test_socket_fd_pass_name_nomon(void)
>      addr.type = SOCKET_ADDRESS_TYPE_FD;
>      addr.u.fd.str = g_strdup("myfd");
>  
> -    fd = socket_connect(&addr, &err);
> +    fd = socket_connect(&addr, NULL, &err);
>      g_assert_cmpint(fd, ==, -1);
>      error_free_or_abort(&err);
>  
> @@ -172,7 +172,7 @@ static void test_socket_fd_pass_num_good(void)
>      addr.type = SOCKET_ADDRESS_TYPE_FD;
>      addr.u.fd.str = g_strdup_printf("%d", sfd);
>  
> -    fd = socket_connect(&addr, &error_abort);
> +    fd = socket_connect(&addr, NULL, &error_abort);
>      g_assert_cmpint(fd, ==, sfd);
>  
>      fd = socket_listen(&addr, 1, &error_abort);
> @@ -194,7 +194,7 @@ static void test_socket_fd_pass_num_bad(void)
>      addr.type = SOCKET_ADDRESS_TYPE_FD;
>      addr.u.fd.str = g_strdup_printf("%d", sfd);
>  
> -    fd = socket_connect(&addr, &err);
> +    fd = socket_connect(&addr, NULL, &err);
>      g_assert_cmpint(fd, ==, -1);
>      error_free_or_abort(&err);
>  
> @@ -217,7 +217,7 @@ static void test_socket_fd_pass_num_nocli(void)
>      addr.type = SOCKET_ADDRESS_TYPE_FD;
>      addr.u.fd.str = g_strdup_printf("%d", STDOUT_FILENO);
>  
> -    fd = socket_connect(&addr, &err);
> +    fd = socket_connect(&addr, NULL, &err);
>      g_assert_cmpint(fd, ==, -1);
>      error_free_or_abort(&err);
>  
> @@ -246,10 +246,10 @@ static gpointer unix_client_thread_func(gpointer user_data)
>  
>      for (i = 0; i < ABSTRACT_SOCKET_VARIANTS; i++) {
>          if (row->expect_connect[i]) {
> -            fd = socket_connect(row->client[i], &error_abort);
> +            fd = socket_connect(row->client[i], NULL, &error_abort);
>              g_assert_cmpint(fd, >=, 0);
>          } else {
> -            fd = socket_connect(row->client[i], &err);
> +            fd = socket_connect(row->client[i], NULL, &err);
>              g_assert_cmpint(fd, ==, -1);
>              error_free_or_abort(&err);
>          }

I'd expect something added to the test suite to exercise the new
codepath. Obviously we'd be limted to dealing with 127.0.0.1,
but it can at least run the code paths.

> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 13b5b197f9..491e2f2bc9 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -358,8 +358,10 @@ listen_ok:
>      ((rc) == -EINPROGRESS)
>  #endif
>  
> -static int inet_connect_addr(const InetSocketAddress *saddr,
> -                             struct addrinfo *addr, Error **errp)
> +static int inet_connect_addr(const InetSocketAddress *dst_addr,
> +                             const InetSocketAddress *src_addr,
> +                             struct addrinfo *addr, struct addrinfo *saddr,
> +                             Error **errp)
>  {
>      int sock, rc;
>  
> @@ -371,8 +373,28 @@ static int inet_connect_addr(const InetSocketAddress *saddr,
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

My feedback from the previous posting has been ignored. This code is
broken for IPv6. Never call the IPv4-only APIs, getaddrinfo is the
 only way to get a 'struct sockaddr *' in a protocol portable manner.

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

Arbitrary whitespace change should be removed

>          rc = 0;
>          if (connect(sock, addr->ai_addr, addr->ai_addrlen) < 0) {
>              rc = -errno;
> @@ -380,8 +402,14 @@ static int inet_connect_addr(const InetSocketAddress *saddr,

> @@ -446,41 +474,55 @@ static struct addrinfo *inet_parse_connect_saddr(InetSocketAddress *saddr,
>   *
>   * Returns: -1 on error, file descriptor on success.
>   */
> -int inet_connect_saddr(InetSocketAddress *saddr, Error **errp)
> +int inet_connect_saddr(InetSocketAddress *dst_addr,
> +                       InetSocketAddress *src_addr, Error **errp)
>  {
>      Error *local_err = NULL;
> -    struct addrinfo *res, *e;
> +    struct addrinfo *res_d, *res_s, *e, *x;
>      int sock = -1;
>  
> -    res = inet_parse_connect_saddr(saddr, errp);
> -    if (!res) {
> +    res_d = inet_parse_connect_saddr(dst_addr, errp);
> +    if (!res_d) {
>          return -1;
>      }
>  
> -    for (e = res; e != NULL; e = e->ai_next) {
> +    if (src_addr) {
> +        res_s = inet_parse_connect_saddr(src_addr, errp);
> +        if (!res_s) {
> +            return -1;
> +        }
> +    }
> +
> +    for (e = res_d; e != NULL; e = e->ai_next) {
>          error_free(local_err);
>          local_err = NULL;
>  
>  #ifdef HAVE_IPPROTO_MPTCP
> -        if (saddr->has_mptcp && saddr->mptcp) {
> +        if (dst_addr->has_mptcp && dst_addr->mptcp) {
>              e->ai_protocol = IPPROTO_MPTCP;
>          }
>  #endif
> +        for (x = res_s; x != NULL; x = x->ai_next) {
> +            if (!src_addr || e->ai_family == x->ai_family) {

>  
> -        sock = inet_connect_addr(saddr, e, &local_err);
> -        if (sock >= 0) {
> -            break;
> +                sock = inet_connect_addr(dst_addr, src_addr,
> +                                         e, x, &local_err);
> +                if (sock >= 0) {
> +                    break;
> +                }
> +            }
>          }
>      }

If the ai_family for the src is different from ai_family for
the dst, this loop will never call inet_connect_addr at all,
and leave local_err unset, and so the error_propagate call
below will have no error message to propagate.

>  
> -    freeaddrinfo(res);
> +    freeaddrinfo(res_d);
> +    freeaddrinfo(res_s);
>  
>      if (sock < 0) {
>          error_propagate(errp, local_err);
>          return sock;
>      }
>  
> -    if (saddr->keep_alive) {
> +    if (dst_addr->keep_alive) {
>          int val = 1;
>          int ret = setsockopt(sock, SOL_SOCKET, SO_KEEPALIVE,
>                               &val, sizeof(val));
> @@ -506,7 +548,7 @@ static int inet_dgram_saddr(InetSocketAddress *sraddr,
>      Error *err = NULL;
>  
>      /* lookup peer addr */
> -    memset(&ai,0, sizeof(ai));
> +    memset(&ai,0,sizeof(ai));

Unrelated whitespace change.

>      ai.ai_flags = AI_CANONNAME | AI_V4MAPPED | AI_ADDRCONFIG;
>      ai.ai_family = inet_ai_family_from_address(sraddr, &err);
>      ai.ai_socktype = SOCK_DGRAM;
> @@ -727,7 +769,7 @@ int inet_connect(const char *str, Error **errp)
>      InetSocketAddress *addr = g_new(InetSocketAddress, 1);
>  
>      if (!inet_parse(addr, str, errp)) {
> -        sock = inet_connect_saddr(addr, errp);
> +        sock = inet_connect_saddr(addr, NULL, errp);
>      }
>      qapi_free_InetSocketAddress(addr);
>      return sock;

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


