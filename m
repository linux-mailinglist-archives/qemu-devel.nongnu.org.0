Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE0967FCC4
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 05:45:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLzYU-0000lN-Qz; Sat, 28 Jan 2023 23:44:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pLzYS-0000lF-Pi
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 23:44:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pLzYQ-0007bA-Po
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 23:44:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674967473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KR6vCccYp1NWagxRnWawjd9b2J9LZe27pxXMv/P9PIg=;
 b=DnkTD6ZGKueIH2+IXysgBxPi+GWf856zE9XEuxna1ZapT8bKGA/rRXF2EsChquzdPuNaG6
 Vgtbs/TbK4KZNkV26X1gEDQB+AUOCOxV1zWRZSdeAmMusp466FRwyECtISaU591y1LORQP
 vy2UJ72NZ48SbfGPMqu3Nd5SjfYc+zg=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-308-1rRjPGh8M3KhH8XxBZI58Q-1; Sat, 28 Jan 2023 23:44:31 -0500
X-MC-Unique: 1rRjPGh8M3KhH8XxBZI58Q-1
Received: by mail-ot1-f69.google.com with SMTP id
 61-20020a9d0343000000b0068bba9986e7so1616420otv.5
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 20:44:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KR6vCccYp1NWagxRnWawjd9b2J9LZe27pxXMv/P9PIg=;
 b=pyQWvG6t2hVPT3Ppq3j9ysHWxlbMYXJ8wYZWW4pjssW29bUbfKmDl5zXvmv/5XUvbT
 Df/Lrul1XbPRtV0TbxGB6ts7VTRXRbY/ZiXw0EskxnP8oHAySWH50PPLYup24Wd+cLlI
 AhCP+ihZ/yAO6InfBxfKNBnbuGu4GdnFpzliqyGaP7cjnGse3YxTc2z5mGxwVJqLbHRD
 orAp5aiYHiRI9iKd6D+dL3FgKDAW0DJJKlcnn10uQDLBVIgVYdrpmqrMfnI41Fa4N0NU
 meS3Q1FMntntUwwysoWIORN3ZeR7PSlDNormD4J4lw5w/a+j1n3rPDGDIZYR+e1rZIHv
 tyxg==
X-Gm-Message-State: AFqh2koWCPRBKdjmCLyAC3VFC0VlQZDTBLOnnLKoju7o3/E6bXFg6e/q
 N5Jd/qk/1tdIG0pGCsD9OzFmAnMDH0n5I0MuU66kPPw24Nyzt5kzjAp2p/MBUyZCje9U2RFobj4
 MA19RCm2FPmulV+Lz6X0v1lrWmKOZ76o=
X-Received: by 2002:a05:6808:b2f:b0:363:a978:6d41 with SMTP id
 t15-20020a0568080b2f00b00363a9786d41mr2559963oij.280.1674967470207; 
 Sat, 28 Jan 2023 20:44:30 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuwy1J/njG0KwxMPpuGRFqC8w2NCCJ0s/dMdakBAlQTaZ8hM76TnO8l6gTEq+BsPr6uT8wGSfHu7RjBSvRV8v8=
X-Received: by 2002:a05:6808:b2f:b0:363:a978:6d41 with SMTP id
 t15-20020a0568080b2f00b00363a9786d41mr2559956oij.280.1674967469830; Sat, 28
 Jan 2023 20:44:29 -0800 (PST)
MIME-Version: 1.0
References: <20230119101645.2001683-1-lvivier@redhat.com>
In-Reply-To: <20230119101645.2001683-1-lvivier@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Sun, 29 Jan 2023 12:44:18 +0800
Message-ID: <CACGkMEt_WQzxthKW8McpVu4DTGmu98fi0OLa7M8zPcA05K1syw@mail.gmail.com>
Subject: Re: [PATCH v4] net: stream: add a new option to automatically
 reconnect
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Jan 19, 2023 at 6:16 PM Laurent Vivier <lvivier@redhat.com> wrote:
>
> In stream mode, if the server shuts down there is currently
> no way to reconnect the client to a new server without removing
> the NIC device and the netdev backend (or to reboot).
>
> This patch introduces a reconnect option that specifies a delay
> to try to reconnect with the same parameters.
>
> Add a new test in qtest to test the reconnect option and the
> connect/disconnect events.
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Applied.

Thanks

> ---
> Based-on: <20230118120405.1876329-1-lvivier@redhat.com>
>
> v4:
> - rebase
>
> v3:
> - add "since 8.0" in net.json
>
> v2:
> - rebase
>
>  net/stream.c                |  53 ++++++++++++++++++-
>  qapi/net.json               |   7 ++-
>  qemu-options.hx             |   6 +--
>  tests/qtest/netdev-socket.c | 101 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 162 insertions(+), 5 deletions(-)
>
> diff --git a/net/stream.c b/net/stream.c
> index 37ff727e0c42..9204b4c96e40 100644
> --- a/net/stream.c
> +++ b/net/stream.c
> @@ -39,6 +39,8 @@
>  #include "io/channel-socket.h"
>  #include "io/net-listener.h"
>  #include "qapi/qapi-events-net.h"
> +#include "qapi/qapi-visit-sockets.h"
> +#include "qapi/clone-visitor.h"
>
>  typedef struct NetStreamState {
>      NetClientState nc;
> @@ -49,11 +51,15 @@ typedef struct NetStreamState {
>      guint ioc_write_tag;
>      SocketReadState rs;
>      unsigned int send_index;      /* number of bytes sent*/
> +    uint32_t reconnect;
> +    guint timer_tag;
> +    SocketAddress *addr;
>  } NetStreamState;
>
>  static void net_stream_listen(QIONetListener *listener,
>                                QIOChannelSocket *cioc,
>                                void *opaque);
> +static void net_stream_arm_reconnect(NetStreamState *s);
>
>  static gboolean net_stream_writable(QIOChannel *ioc,
>                                      GIOCondition condition,
> @@ -170,6 +176,7 @@ static gboolean net_stream_send(QIOChannel *ioc,
>          qemu_set_info_str(&s->nc, "%s", "");
>
>          qapi_event_send_netdev_stream_disconnected(s->nc.name);
> +        net_stream_arm_reconnect(s);
>
>          return G_SOURCE_REMOVE;
>      }
> @@ -187,6 +194,14 @@ static gboolean net_stream_send(QIOChannel *ioc,
>  static void net_stream_cleanup(NetClientState *nc)
>  {
>      NetStreamState *s = DO_UPCAST(NetStreamState, nc, nc);
> +    if (s->timer_tag) {
> +        g_source_remove(s->timer_tag);
> +        s->timer_tag = 0;
> +    }
> +    if (s->addr) {
> +        qapi_free_SocketAddress(s->addr);
> +        s->addr = NULL;
> +    }
>      if (s->ioc) {
>          if (QIO_CHANNEL_SOCKET(s->ioc)->fd != -1) {
>              if (s->ioc_read_tag) {
> @@ -346,12 +361,37 @@ static void net_stream_client_connected(QIOTask *task, gpointer opaque)
>  error:
>      object_unref(OBJECT(s->ioc));
>      s->ioc = NULL;
> +    net_stream_arm_reconnect(s);
> +}
> +
> +static gboolean net_stream_reconnect(gpointer data)
> +{
> +    NetStreamState *s = data;
> +    QIOChannelSocket *sioc;
> +
> +    s->timer_tag = 0;
> +
> +    sioc = qio_channel_socket_new();
> +    s->ioc = QIO_CHANNEL(sioc);
> +    qio_channel_socket_connect_async(sioc, s->addr,
> +                                     net_stream_client_connected, s,
> +                                     NULL, NULL);
> +    return G_SOURCE_REMOVE;
> +}
> +
> +static void net_stream_arm_reconnect(NetStreamState *s)
> +{
> +    if (s->reconnect && s->timer_tag == 0) {
> +        s->timer_tag = g_timeout_add_seconds(s->reconnect,
> +                                             net_stream_reconnect, s);
> +    }
>  }
>
>  static int net_stream_client_init(NetClientState *peer,
>                                    const char *model,
>                                    const char *name,
>                                    SocketAddress *addr,
> +                                  uint32_t reconnect,
>                                    Error **errp)
>  {
>      NetStreamState *s;
> @@ -364,6 +404,10 @@ static int net_stream_client_init(NetClientState *peer,
>      s->ioc = QIO_CHANNEL(sioc);
>      s->nc.link_down = true;
>
> +    s->reconnect = reconnect;
> +    if (reconnect) {
> +        s->addr = QAPI_CLONE(SocketAddress, addr);
> +    }
>      qio_channel_socket_connect_async(sioc, addr,
>                                       net_stream_client_connected, s,
>                                       NULL, NULL);
> @@ -380,7 +424,14 @@ int net_init_stream(const Netdev *netdev, const char *name,
>      sock = &netdev->u.stream;
>
>      if (!sock->has_server || !sock->server) {
> -        return net_stream_client_init(peer, "stream", name, sock->addr, errp);
> +        return net_stream_client_init(peer, "stream", name, sock->addr,
> +                                      sock->has_reconnect ? sock->reconnect : 0,
> +                                      errp);
> +    }
> +    if (sock->has_reconnect) {
> +        error_setg(errp, "'reconnect' option is incompatible with "
> +                         "socket in server mode");
> +        return -1;
>      }
>      return net_stream_server_init(peer, "stream", name, sock->addr, errp);
>  }
> diff --git a/qapi/net.json b/qapi/net.json
> index 522ac582edeb..d6eb30008be0 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -585,6 +585,10 @@
>  # @addr: socket address to listen on (server=true)
>  #        or connect to (server=false)
>  # @server: create server socket (default: false)
> +# @reconnect: For a client socket, if a socket is disconnected,
> +#             then attempt a reconnect after the given number of seconds.
> +#             Setting this to zero disables this function. (default: 0)
> +#             (since 8.0)
>  #
>  # Only SocketAddress types 'unix', 'inet' and 'fd' are supported.
>  #
> @@ -593,7 +597,8 @@
>  { 'struct': 'NetdevStreamOptions',
>    'data': {
>      'addr':   'SocketAddress',
> -    '*server': 'bool' } }
> +    '*server': 'bool',
> +    '*reconnect': 'uint32' } }
>
>  ##
>  # @NetdevDgramOptions:
> diff --git a/qemu-options.hx b/qemu-options.hx
> index d59d19704bc5..5617140225ea 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2769,9 +2769,9 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>      "-netdev socket,id=str[,fd=h][,udp=host:port][,localaddr=host:port]\n"
>      "                configure a network backend to connect to another network\n"
>      "                using an UDP tunnel\n"
> -    "-netdev stream,id=str[,server=on|off],addr.type=inet,addr.host=host,addr.port=port[,to=maxport][,numeric=on|off][,keep-alive=on|off][,mptcp=on|off][,addr.ipv4=on|off][,addr.ipv6=on|off]\n"
> -    "-netdev stream,id=str[,server=on|off],addr.type=unix,addr.path=path[,abstract=on|off][,tight=on|off]\n"
> -    "-netdev stream,id=str[,server=on|off],addr.type=fd,addr.str=file-descriptor\n"
> +    "-netdev stream,id=str[,server=on|off],addr.type=inet,addr.host=host,addr.port=port[,to=maxport][,numeric=on|off][,keep-alive=on|off][,mptcp=on|off][,addr.ipv4=on|off][,addr.ipv6=on|off][,reconnect=seconds]\n"
> +    "-netdev stream,id=str[,server=on|off],addr.type=unix,addr.path=path[,abstract=on|off][,tight=on|off][,reconnect=seconds]\n"
> +    "-netdev stream,id=str[,server=on|off],addr.type=fd,addr.str=file-descriptor[,reconnect=seconds]\n"
>      "                configure a network backend to connect to another network\n"
>      "                using a socket connection in stream mode.\n"
>      "-netdev dgram,id=str,remote.type=inet,remote.host=maddr,remote.port=port[,local.type=inet,local.host=addr]\n"
> diff --git a/tests/qtest/netdev-socket.c b/tests/qtest/netdev-socket.c
> index 6ba256e1730d..acc32c378bce 100644
> --- a/tests/qtest/netdev-socket.c
> +++ b/tests/qtest/netdev-socket.c
> @@ -11,6 +11,10 @@
>  #include <glib/gstdio.h>
>  #include "../unit/socket-helpers.h"
>  #include "libqtest.h"
> +#include "qapi/qmp/qstring.h"
> +#include "qemu/sockets.h"
> +#include "qapi/qobject-input-visitor.h"
> +#include "qapi/qapi-visit-sockets.h"
>
>  #define CONNECTION_TIMEOUT    5
>
> @@ -142,6 +146,101 @@ static void test_stream_inet_ipv4(void)
>      qtest_quit(qts0);
>  }
>
> +static void wait_stream_connected(QTestState *qts, const char *id,
> +                                  SocketAddress **addr)
> +{
> +    QDict *resp, *data;
> +    QString *qstr;
> +    QObject *obj;
> +    Visitor *v = NULL;
> +
> +    resp = qtest_qmp_eventwait_ref(qts, "NETDEV_STREAM_CONNECTED");
> +    g_assert_nonnull(resp);
> +    data = qdict_get_qdict(resp, "data");
> +    g_assert_nonnull(data);
> +
> +    qstr = qobject_to(QString, qdict_get(data, "netdev-id"));
> +    g_assert_nonnull(data);
> +
> +    g_assert(!strcmp(qstring_get_str(qstr), id));
> +
> +    obj = qdict_get(data, "addr");
> +
> +    v = qobject_input_visitor_new(obj);
> +    visit_type_SocketAddress(v, NULL, addr, NULL);
> +    visit_free(v);
> +    qobject_unref(resp);
> +}
> +
> +static void wait_stream_disconnected(QTestState *qts, const char *id)
> +{
> +    QDict *resp, *data;
> +    QString *qstr;
> +
> +    resp = qtest_qmp_eventwait_ref(qts, "NETDEV_STREAM_DISCONNECTED");
> +    g_assert_nonnull(resp);
> +    data = qdict_get_qdict(resp, "data");
> +    g_assert_nonnull(data);
> +
> +    qstr = qobject_to(QString, qdict_get(data, "netdev-id"));
> +    g_assert_nonnull(data);
> +
> +    g_assert(!strcmp(qstring_get_str(qstr), id));
> +    qobject_unref(resp);
> +}
> +
> +static void test_stream_inet_reconnect(void)
> +{
> +    QTestState *qts0, *qts1;
> +    int port;
> +    SocketAddress *addr;
> +
> +    port = inet_get_free_port(false);
> +    qts0 = qtest_initf("-nodefaults -M none "
> +                       "-netdev stream,id=st0,server=true,addr.type=inet,"
> +                       "addr.ipv4=on,addr.ipv6=off,"
> +                       "addr.host=127.0.0.1,addr.port=%d", port);
> +
> +    EXPECT_STATE(qts0, "st0: index=0,type=stream,\r\n", 0);
> +
> +    qts1 = qtest_initf("-nodefaults -M none "
> +                       "-netdev stream,server=false,id=st0,addr.type=inet,"
> +                       "addr.ipv4=on,addr.ipv6=off,reconnect=1,"
> +                       "addr.host=127.0.0.1,addr.port=%d", port);
> +
> +    wait_stream_connected(qts0, "st0", &addr);
> +    g_assert_cmpint(addr->type, ==, SOCKET_ADDRESS_TYPE_INET);
> +    g_assert_cmpstr(addr->u.inet.host, ==, "127.0.0.1");
> +    qapi_free_SocketAddress(addr);
> +
> +    /* kill server */
> +    qtest_quit(qts0);
> +
> +    /* check client has been disconnected */
> +    wait_stream_disconnected(qts1, "st0");
> +
> +    /* restart server */
> +    qts0 = qtest_initf("-nodefaults -M none "
> +                       "-netdev stream,id=st0,server=true,addr.type=inet,"
> +                       "addr.ipv4=on,addr.ipv6=off,"
> +                       "addr.host=127.0.0.1,addr.port=%d", port);
> +
> +    /* wait connection events*/
> +    wait_stream_connected(qts0, "st0", &addr);
> +    g_assert_cmpint(addr->type, ==, SOCKET_ADDRESS_TYPE_INET);
> +    g_assert_cmpstr(addr->u.inet.host, ==, "127.0.0.1");
> +    qapi_free_SocketAddress(addr);
> +
> +    wait_stream_connected(qts1, "st0", &addr);
> +    g_assert_cmpint(addr->type, ==, SOCKET_ADDRESS_TYPE_INET);
> +    g_assert_cmpstr(addr->u.inet.host, ==, "127.0.0.1");
> +    g_assert_cmpint(atoi(addr->u.inet.port), ==, port);
> +    qapi_free_SocketAddress(addr);
> +
> +    qtest_quit(qts1);
> +    qtest_quit(qts0);
> +}
> +
>  static void test_stream_inet_ipv6(void)
>  {
>      QTestState *qts0, *qts1;
> @@ -418,6 +517,8 @@ int main(int argc, char **argv)
>  #ifndef _WIN32
>          qtest_add_func("/netdev/dgram/mcast", test_dgram_mcast);
>  #endif
> +        qtest_add_func("/netdev/stream/inet/reconnect",
> +                       test_stream_inet_reconnect);
>      }
>      if (has_ipv6) {
>          qtest_add_func("/netdev/stream/inet/ipv6", test_stream_inet_ipv6);
> --
> 2.39.0
>


