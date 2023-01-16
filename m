Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B9466B913
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 09:30:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHKs5-0004Op-Pb; Mon, 16 Jan 2023 03:29:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pHKri-0004OF-Gy
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 03:29:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pHKrf-0001Jg-CF
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 03:29:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673857749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j+MqMeBXOY8VKxkI3VrQq7HI2sANh0kzExIlMIFa9l4=;
 b=QFjdGpFttwb6LI75NwevjjkQp4NLD78GJA7doSny8k1iG2AZDVu4le6ATAihwXkRelZhgH
 UgMbopOs7G4ygFI6ptWiibjiS3E/etEmtOrW7Jus0PfwTNPPkoOhLyBwpL6SLZcLyLrrCU
 h7r/weaGqThFpbHzPPSY4laLfNs6NQ0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-eBmdMR2SMB2WteCqGNMbsA-1; Mon, 16 Jan 2023 03:29:08 -0500
X-MC-Unique: eBmdMR2SMB2WteCqGNMbsA-1
Received: by mail-wr1-f70.google.com with SMTP id
 d7-20020adf9b87000000b002bde8f7112bso929298wrc.17
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 00:29:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j+MqMeBXOY8VKxkI3VrQq7HI2sANh0kzExIlMIFa9l4=;
 b=IoeByz3Odu7lJVx/BkWDckNE7E+95h9tWviHVLMwMwR2EbBrNf5t1A+gubCrtGUCyn
 FbZK+ItkSzGujs2B7tDdiKbfsqteuUa4IlnHNpRLwCfNCWdrJ+iDlcx2FfXz0glhCxyX
 j8Tc/woMqjp/e+gODpsaQyszaiNRSMy6TM+uTXhrz5aV1IdKOPo6LjcV8QxUCwnTBAhT
 eBh3KVxakcTIC7Os+9hd8z8Jo2TMgSpT8WDnjBhJ7gcXJ/LcVwew2J0dMsaGjdI7J8xM
 e051zv+KW2x3d7tAFItf2QRfxjVEfIYoIh3ra3+78B3Ze67lRV0ekmkGkZr57sI00ZkV
 JWsA==
X-Gm-Message-State: AFqh2krIlxS+W9PfUr13ewzqbkqARAZtWw4NXaNlOd8FSgFhOtVn3DAK
 +CKUhvhlZYby9DAWEoxxNe5RsdmvEcJZdi1fk6fDAUoS+7+R/PWA0L9sKwPlUc+vMZUKGc+uMD3
 iGKZ3TQuSZF8VvpxZwqyBJXXeO9XWC1F2vTIkMgw3zNAL9WhM4DgCs7Qd7LBoXbtdmg==
X-Received: by 2002:a05:600c:4d23:b0:3da:270b:ba6b with SMTP id
 u35-20020a05600c4d2300b003da270bba6bmr9003925wmp.41.1673857746876; 
 Mon, 16 Jan 2023 00:29:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtngdCsOTadUL9msuxKe01+aNroZWJ6egDjhngtSO/qS3mNvKHeywpmyrGegytV2pOgGeqJTA==
X-Received: by 2002:a05:600c:4d23:b0:3da:270b:ba6b with SMTP id
 u35-20020a05600c4d2300b003da270bba6bmr9003901wmp.41.1673857746521; 
 Mon, 16 Jan 2023 00:29:06 -0800 (PST)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 fc14-20020a05600c524e00b003a3442f1229sm42715894wmb.29.2023.01.16.00.29.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 00:29:06 -0800 (PST)
Message-ID: <c8d8fd8a-4c03-5483-ad66-eb83f3935a7a@redhat.com>
Date: Mon, 16 Jan 2023 09:29:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3] net: stream: add a new option to automatically
 reconnect
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>
References: <20230105131322.469173-1-lvivier@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20230105131322.469173-1-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

ping

On 1/5/23 14:13, Laurent Vivier wrote:
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
> ---
> Based-on: <20230105093751.416666-1-lvivier@redhat.com>
>      
> v3:
> - add "since 8.0" in net.json
>      
> v2:
> - rebase
> 
>   net/stream.c                |  53 ++++++++++++++++++-
>   qapi/net.json               |   7 ++-
>   qemu-options.hx             |   6 +--
>   tests/qtest/netdev-socket.c | 100 ++++++++++++++++++++++++++++++++++++
>   4 files changed, 161 insertions(+), 5 deletions(-)
> 
> diff --git a/net/stream.c b/net/stream.c
> index 37ff727e0c42..9204b4c96e40 100644
> --- a/net/stream.c
> +++ b/net/stream.c
> @@ -39,6 +39,8 @@
>   #include "io/channel-socket.h"
>   #include "io/net-listener.h"
>   #include "qapi/qapi-events-net.h"
> +#include "qapi/qapi-visit-sockets.h"
> +#include "qapi/clone-visitor.h"
>   
>   typedef struct NetStreamState {
>       NetClientState nc;
> @@ -49,11 +51,15 @@ typedef struct NetStreamState {
>       guint ioc_write_tag;
>       SocketReadState rs;
>       unsigned int send_index;      /* number of bytes sent*/
> +    uint32_t reconnect;
> +    guint timer_tag;
> +    SocketAddress *addr;
>   } NetStreamState;
>   
>   static void net_stream_listen(QIONetListener *listener,
>                                 QIOChannelSocket *cioc,
>                                 void *opaque);
> +static void net_stream_arm_reconnect(NetStreamState *s);
>   
>   static gboolean net_stream_writable(QIOChannel *ioc,
>                                       GIOCondition condition,
> @@ -170,6 +176,7 @@ static gboolean net_stream_send(QIOChannel *ioc,
>           qemu_set_info_str(&s->nc, "%s", "");
>   
>           qapi_event_send_netdev_stream_disconnected(s->nc.name);
> +        net_stream_arm_reconnect(s);
>   
>           return G_SOURCE_REMOVE;
>       }
> @@ -187,6 +194,14 @@ static gboolean net_stream_send(QIOChannel *ioc,
>   static void net_stream_cleanup(NetClientState *nc)
>   {
>       NetStreamState *s = DO_UPCAST(NetStreamState, nc, nc);
> +    if (s->timer_tag) {
> +        g_source_remove(s->timer_tag);
> +        s->timer_tag = 0;
> +    }
> +    if (s->addr) {
> +        qapi_free_SocketAddress(s->addr);
> +        s->addr = NULL;
> +    }
>       if (s->ioc) {
>           if (QIO_CHANNEL_SOCKET(s->ioc)->fd != -1) {
>               if (s->ioc_read_tag) {
> @@ -346,12 +361,37 @@ static void net_stream_client_connected(QIOTask *task, gpointer opaque)
>   error:
>       object_unref(OBJECT(s->ioc));
>       s->ioc = NULL;
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
>   }
>   
>   static int net_stream_client_init(NetClientState *peer,
>                                     const char *model,
>                                     const char *name,
>                                     SocketAddress *addr,
> +                                  uint32_t reconnect,
>                                     Error **errp)
>   {
>       NetStreamState *s;
> @@ -364,6 +404,10 @@ static int net_stream_client_init(NetClientState *peer,
>       s->ioc = QIO_CHANNEL(sioc);
>       s->nc.link_down = true;
>   
> +    s->reconnect = reconnect;
> +    if (reconnect) {
> +        s->addr = QAPI_CLONE(SocketAddress, addr);
> +    }
>       qio_channel_socket_connect_async(sioc, addr,
>                                        net_stream_client_connected, s,
>                                        NULL, NULL);
> @@ -380,7 +424,14 @@ int net_init_stream(const Netdev *netdev, const char *name,
>       sock = &netdev->u.stream;
>   
>       if (!sock->has_server || !sock->server) {
> -        return net_stream_client_init(peer, "stream", name, sock->addr, errp);
> +        return net_stream_client_init(peer, "stream", name, sock->addr,
> +                                      sock->has_reconnect ? sock->reconnect : 0,
> +                                      errp);
> +    }
> +    if (sock->has_reconnect) {
> +        error_setg(errp, "'reconnect' option is incompatible with "
> +                         "socket in server mode");
> +        return -1;
>       }
>       return net_stream_server_init(peer, "stream", name, sock->addr, errp);
>   }
> diff --git a/qapi/net.json b/qapi/net.json
> index 522ac582edeb..d6eb30008be0 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -585,6 +585,10 @@
>   # @addr: socket address to listen on (server=true)
>   #        or connect to (server=false)
>   # @server: create server socket (default: false)
> +# @reconnect: For a client socket, if a socket is disconnected,
> +#             then attempt a reconnect after the given number of seconds.
> +#             Setting this to zero disables this function. (default: 0)
> +#             (since 8.0)
>   #
>   # Only SocketAddress types 'unix', 'inet' and 'fd' are supported.
>   #
> @@ -593,7 +597,8 @@
>   { 'struct': 'NetdevStreamOptions',
>     'data': {
>       'addr':   'SocketAddress',
> -    '*server': 'bool' } }
> +    '*server': 'bool',
> +    '*reconnect': 'uint32' } }
>   
>   ##
>   # @NetdevDgramOptions:
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 7f99d15b231f..e8d3a384e165 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2766,9 +2766,9 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>       "-netdev socket,id=str[,fd=h][,udp=host:port][,localaddr=host:port]\n"
>       "                configure a network backend to connect to another network\n"
>       "                using an UDP tunnel\n"
> -    "-netdev stream,id=str[,server=on|off],addr.type=inet,addr.host=host,addr.port=port[,to=maxport][,numeric=on|off][,keep-alive=on|off][,mptcp=on|off][,addr.ipv4=on|off][,addr.ipv6=on|off]\n"
> -    "-netdev stream,id=str[,server=on|off],addr.type=unix,addr.path=path[,abstract=on|off][,tight=on|off]\n"
> -    "-netdev stream,id=str[,server=on|off],addr.type=fd,addr.str=file-descriptor\n"
> +    "-netdev stream,id=str[,server=on|off],addr.type=inet,addr.host=host,addr.port=port[,to=maxport][,numeric=on|off][,keep-alive=on|off][,mptcp=on|off][,addr.ipv4=on|off][,addr.ipv6=on|off][,reconnect=seconds]\n"
> +    "-netdev stream,id=str[,server=on|off],addr.type=unix,addr.path=path[,abstract=on|off][,tight=on|off][,reconnect=seconds]\n"
> +    "-netdev stream,id=str[,server=on|off],addr.type=fd,addr.str=file-descriptor[,reconnect=seconds]\n"
>       "                configure a network backend to connect to another network\n"
>       "                using a socket connection in stream mode.\n"
>       "-netdev dgram,id=str,remote.type=inet,remote.host=maddr,remote.port=port[,local.type=inet,local.host=addr]\n"
> diff --git a/tests/qtest/netdev-socket.c b/tests/qtest/netdev-socket.c
> index a9db9fa06e79..b6db396599ae 100644
> --- a/tests/qtest/netdev-socket.c
> +++ b/tests/qtest/netdev-socket.c
> @@ -10,6 +10,10 @@
>   #include <glib/gstdio.h>
>   #include "../unit/socket-helpers.h"
>   #include "libqtest.h"
> +#include "qapi/qmp/qstring.h"
> +#include "qemu/sockets.h"
> +#include "qapi/qobject-input-visitor.h"
> +#include "qapi/qapi-visit-sockets.h"
>   
>   #define CONNECTION_TIMEOUT    5
>   
> @@ -141,6 +145,101 @@ static void test_stream_inet_ipv4(void)
>       qtest_quit(qts0);
>   }
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
>   static void test_stream_inet_ipv6(void)
>   {
>       QTestState *qts0, *qts1;
> @@ -415,6 +514,7 @@ int main(int argc, char **argv)
>           qtest_add_func("/netdev/stream/inet/ipv4", test_stream_inet_ipv4);
>           qtest_add_func("/netdev/dgram/inet", test_dgram_inet);
>           qtest_add_func("/netdev/dgram/mcast", test_dgram_mcast);
> +        qtest_add_func("/netdev/stream/inet/reconnect", test_stream_inet_reconnect);
>       }
>       if (has_ipv6) {
>           qtest_add_func("/netdev/stream/inet/ipv6", test_stream_inet_ipv6);


