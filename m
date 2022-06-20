Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC4C55208D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 17:23:40 +0200 (CEST)
Received: from localhost ([::1]:50132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3JFb-0004It-Dv
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 11:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o3JDk-0001JZ-0f
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:21:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o3JDf-0001aQ-AI
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:21:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655738498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VBq4uPnPfc56WEMY8RMbS88Kg4tdQdLqm7acn3hK5L8=;
 b=Sh3n9h9dCUFiHGowazCJU5SHg6yPF7IF7r/v8dj7bFwv6gHdn5D8W6/O8tlRcyj4DklvY0
 meBs9L+IbE8AMBeGErd560HWdPHOlRIYa9oeVkRpIFfrRAiY1+5ukahtF5cUKTJcJgRisM
 KMggrN8kFE3c7NgkmJWP03AeYT/lgEg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-hWoy-DMXOKy91cmTRVW8-g-1; Mon, 20 Jun 2022 11:21:37 -0400
X-MC-Unique: hWoy-DMXOKy91cmTRVW8-g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12C4D802D1C
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 15:21:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8374440466B2;
 Mon, 20 Jun 2022 15:21:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4831221E688E; Mon, 20 Jun 2022 17:21:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Jason Wang
 <jasowang@redhat.com>,  Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [RFC PATCH v3 04/11] qapi: net: add stream and dgram netdevs
References: <20220620101828.518865-1-lvivier@redhat.com>
 <20220620101828.518865-5-lvivier@redhat.com>
Date: Mon, 20 Jun 2022 17:21:35 +0200
In-Reply-To: <20220620101828.518865-5-lvivier@redhat.com> (Laurent Vivier's
 message of "Mon, 20 Jun 2022 12:18:21 +0200")
Message-ID: <874k0fz7gg.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent Vivier <lvivier@redhat.com> writes:

> Copied from socket netdev file and modified to use SocketAddress
> to be able to introduce new features like unix socket.
>
> "udp" and "mcast" are squashed into dgram netdev, multicast is detected
> according to the IP address type.
> "listen" and "connect" modes are managed by stream netdev. An optional
> parameter "server" defines the mode (server by default)
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
> ---
>  hmp-commands.hx |   2 +-
>  net/clients.h   |   6 +
>  net/dgram.c     | 630 ++++++++++++++++++++++++++++++++++++++++++++++++
>  net/hub.c       |   2 +
>  net/meson.build |   2 +
>  net/net.c       |  19 +-
>  net/stream.c    | 425 ++++++++++++++++++++++++++++++++
>  qapi/net.json   |  40 ++-
>  qemu-options.hx |  12 +
>  9 files changed, 1133 insertions(+), 5 deletions(-)
>  create mode 100644 net/dgram.c
>  create mode 100644 net/stream.c
>
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 564f1de364df..2938d13725cc 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1269,7 +1269,7 @@ ERST
>      {
>          .name       =3D "netdev_add",
>          .args_type  =3D "netdev:O",
> -        .params     =3D "[user|tap|socket|vde|bridge|hubport|netmap|vhos=
t-user"
> +        .params     =3D "[user|tap|socket|stream|dgram|vde|bridge|hubpor=
t|netmap|vhost-user"
>  #ifdef CONFIG_VMNET
>                        "|vmnet-host|vmnet-shared|vmnet-bridged"
>  #endif
> diff --git a/net/clients.h b/net/clients.h
> index c9157789f2ce..ed8bdfff1e7c 100644
> --- a/net/clients.h
> +++ b/net/clients.h
> @@ -40,6 +40,12 @@ int net_init_hubport(const Netdev *netdev, const char =
*name,
>  int net_init_socket(const Netdev *netdev, const char *name,
>                      NetClientState *peer, Error **errp);
>=20=20
> +int net_init_stream(const Netdev *netdev, const char *name,
> +                    NetClientState *peer, Error **errp);
> +
> +int net_init_dgram(const Netdev *netdev, const char *name,
> +                   NetClientState *peer, Error **errp);
> +
>  int net_init_tap(const Netdev *netdev, const char *name,
>                   NetClientState *peer, Error **errp);
>=20=20
> diff --git a/net/dgram.c b/net/dgram.c
> new file mode 100644
> index 000000000000..aa4240501ed0
> --- /dev/null
> +++ b/net/dgram.c
> @@ -0,0 +1,630 @@
> +/*
> + * QEMU System Emulator
> + *
> + * Copyright (c) 2003-2008 Fabrice Bellard
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
> + * of this software and associated documentation files (the "Software"),=
 to deal
> + * in the Software without restriction, including without limitation the=
 rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be includ=
ed in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
> + * THE SOFTWARE.
> + */

Blank line here, please.

> +#include "qemu/osdep.h"
> +
> +#include "net/net.h"
> +#include "clients.h"
> +#include "monitor/monitor.h"
> +#include "qapi/error.h"
> +#include "qemu/error-report.h"
> +#include "qemu/option.h"
> +#include "qemu/sockets.h"
> +#include "qemu/iov.h"
> +#include "qemu/main-loop.h"
> +#include "qemu/cutils.h"
> +
> +typedef struct NetDgramState {
> +    NetClientState nc;
> +    int listen_fd;
> +    int fd;
> +    SocketReadState rs;
> +  /* contains inet host and port destination iff connectionless (SOCK_DG=
RAM) */
> +    struct sockaddr_in dgram_dst;
> +    IOHandler *send_fn;           /* differs between SOCK_STREAM/SOCK_DG=
RAM */
> +    bool read_poll;               /* waiting to receive data? */
> +    bool write_poll;              /* waiting to transmit data? */
> +} NetDgramState;
> +
> +static void net_dgram_accept(void *opaque);
> +static void net_dgram_writable(void *opaque);
> +
> +static void net_dgram_update_fd_handler(NetDgramState *s)
> +{
> +    qemu_set_fd_handler(s->fd,
> +                        s->read_poll ? s->send_fn : NULL,
> +                        s->write_poll ? net_dgram_writable : NULL,
> +                        s);
> +}
> +
> +static void net_dgram_read_poll(NetDgramState *s, bool enable)
> +{
> +    s->read_poll =3D enable;
> +    net_dgram_update_fd_handler(s);
> +}
> +
> +static void net_dgram_write_poll(NetDgramState *s, bool enable)
> +{
> +    s->write_poll =3D enable;
> +    net_dgram_update_fd_handler(s);
> +}
> +
> +static void net_dgram_writable(void *opaque)
> +{
> +    NetDgramState *s =3D opaque;
> +
> +    net_dgram_write_poll(s, false);
> +
> +    qemu_flush_queued_packets(&s->nc);
> +}
> +
> +static ssize_t net_dgram_receive_dgram(NetClientState *nc,
> +                                       const uint8_t *buf, size_t size)
> +{
> +    NetDgramState *s =3D DO_UPCAST(NetDgramState, nc, nc);
> +    ssize_t ret;
> +
> +    do {
> +        if (s->dgram_dst.sin_family !=3D AF_UNIX) {
> +            ret =3D sendto(s->fd, buf, size, 0,
> +                         (struct sockaddr *)&s->dgram_dst,
> +                         sizeof(s->dgram_dst));
> +        } else {
> +            ret =3D send(s->fd, buf, size, 0);
> +        }
> +    } while (ret =3D=3D -1 && errno =3D=3D EINTR);
> +
> +    if (ret =3D=3D -1 && errno =3D=3D EAGAIN) {
> +        net_dgram_write_poll(s, true);
> +        return 0;
> +    }
> +    return ret;
> +}
> +
> +static void net_dgram_send_completed(NetClientState *nc, ssize_t len)
> +{
> +    NetDgramState *s =3D DO_UPCAST(NetDgramState, nc, nc);
> +
> +    if (!s->read_poll) {
> +        net_dgram_read_poll(s, true);
> +    }
> +}
> +
> +static void net_dgram_rs_finalize(SocketReadState *rs)
> +{
> +    NetDgramState *s =3D container_of(rs, NetDgramState, rs);
> +
> +    if (qemu_send_packet_async(&s->nc, rs->buf,
> +                               rs->packet_len,
> +                               net_dgram_send_completed) =3D=3D 0) {
> +        net_dgram_read_poll(s, false);
> +    }
> +}
> +
> +static void net_dgram_send(void *opaque)
> +{
> +    NetDgramState *s =3D opaque;
> +    int size;
> +    int ret;
> +    uint8_t buf1[NET_BUFSIZE];
> +    const uint8_t *buf;
> +
> +    size =3D recv(s->fd, buf1, sizeof(buf1), 0);
> +    if (size < 0) {
> +        if (errno !=3D EWOULDBLOCK) {
> +            goto eoc;
> +        }
> +    } else if (size =3D=3D 0) {
> +        /* end of connection */
> +    eoc:
> +        net_dgram_read_poll(s, false);
> +        net_dgram_write_poll(s, false);
> +        if (s->listen_fd !=3D -1) {
> +            qemu_set_fd_handler(s->listen_fd, net_dgram_accept, NULL, s);
> +        }
> +        closesocket(s->fd);
> +
> +        s->fd =3D -1;
> +        net_socket_rs_init(&s->rs, net_dgram_rs_finalize, false);
> +        s->nc.link_down =3D true;
> +        memset(s->nc.info_str, 0, sizeof(s->nc.info_str));
> +
> +        return;
> +    }
> +    buf =3D buf1;
> +
> +    ret =3D net_fill_rstate(&s->rs, buf, size);
> +
> +    if (ret =3D=3D -1) {
> +        goto eoc;
> +    }
> +}
> +
> +static void net_dgram_send_dgram(void *opaque)
> +{
> +    NetDgramState *s =3D opaque;
> +    int size;
> +
> +    size =3D recv(s->fd, s->rs.buf, sizeof(s->rs.buf), 0);
> +    if (size < 0) {
> +        return;
> +    }
> +    if (size =3D=3D 0) {
> +        /* end of connection */
> +        net_dgram_read_poll(s, false);
> +        net_dgram_write_poll(s, false);
> +        return;
> +    }
> +    if (qemu_send_packet_async(&s->nc, s->rs.buf, size,
> +                               net_dgram_send_completed) =3D=3D 0) {
> +        net_dgram_read_poll(s, false);
> +    }
> +}
> +
> +static int net_dgram_mcast_create(struct sockaddr_in *mcastaddr,
> +                                  struct in_addr *localaddr,
> +                                  Error **errp)
> +{
> +    struct ip_mreq imr;
> +    int fd;
> +    int val, ret;
> +#ifdef __OpenBSD__
> +    unsigned char loop;
> +#else
> +    int loop;
> +#endif
> +
> +    if (!IN_MULTICAST(ntohl(mcastaddr->sin_addr.s_addr))) {
> +        error_setg(errp, "specified mcastaddr %s (0x%08x) "
> +                   "does not contain a multicast address",
> +                   inet_ntoa(mcastaddr->sin_addr),
> +                   (int)ntohl(mcastaddr->sin_addr.s_addr));
> +        return -1;
> +    }
> +
> +    fd =3D qemu_socket(PF_INET, SOCK_DGRAM, 0);
> +    if (fd < 0) {
> +        error_setg_errno(errp, errno, "can't create datagram socket");
> +        return -1;
> +    }
> +
> +    /*
> +     * Allow multiple sockets to bind the same multicast ip and port by =
setting
> +     * SO_REUSEADDR. This is the only situation where SO_REUSEADDR shoul=
d be set
> +     * on windows. Use socket_set_fast_reuse otherwise as it sets SO_REU=
SEADDR
> +     * only on posix systems.
> +     */
> +    val =3D 1;
> +    ret =3D setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, &val, sizeof(val));
> +    if (ret < 0) {
> +        error_setg_errno(errp, errno, "can't set socket option SO_REUSEA=
DDR");
> +        goto fail;
> +    }
> +
> +    ret =3D bind(fd, (struct sockaddr *)mcastaddr, sizeof(*mcastaddr));
> +    if (ret < 0) {
> +        error_setg_errno(errp, errno, "can't bind ip=3D%s to socket",
> +                         inet_ntoa(mcastaddr->sin_addr));
> +        goto fail;
> +    }
> +
> +    /* Add host to multicast group */
> +    imr.imr_multiaddr =3D mcastaddr->sin_addr;
> +    if (localaddr) {
> +        imr.imr_interface =3D *localaddr;
> +    } else {
> +        imr.imr_interface.s_addr =3D htonl(INADDR_ANY);
> +    }
> +
> +    ret =3D setsockopt(fd, IPPROTO_IP, IP_ADD_MEMBERSHIP,
> +                     &imr, sizeof(struct ip_mreq));
> +    if (ret < 0) {
> +        error_setg_errno(errp, errno,
> +                         "can't add socket to multicast group %s",
> +                         inet_ntoa(imr.imr_multiaddr));
> +        goto fail;
> +    }
> +
> +    /* Force mcast msgs to loopback (eg. several QEMUs in same host */
> +    loop =3D 1;
> +    ret =3D setsockopt(fd, IPPROTO_IP, IP_MULTICAST_LOOP,
> +                     &loop, sizeof(loop));
> +    if (ret < 0) {
> +        error_setg_errno(errp, errno,
> +                         "can't force multicast message to loopback");
> +        goto fail;
> +    }
> +
> +    /* If a bind address is given, only send packets from that address */
> +    if (localaddr !=3D NULL) {
> +        ret =3D setsockopt(fd, IPPROTO_IP, IP_MULTICAST_IF,
> +                         localaddr, sizeof(*localaddr));
> +        if (ret < 0) {
> +            error_setg_errno(errp, errno,
> +                             "can't set the default network send interfa=
ce");
> +            goto fail;
> +        }
> +    }
> +
> +    qemu_socket_set_nonblock(fd);
> +    return fd;
> +fail:
> +    if (fd >=3D 0) {
> +        closesocket(fd);
> +    }
> +    return -1;
> +}
> +
> +static void net_dgram_cleanup(NetClientState *nc)
> +{
> +    NetDgramState *s =3D DO_UPCAST(NetDgramState, nc, nc);
> +    if (s->fd !=3D -1) {
> +        net_dgram_read_poll(s, false);
> +        net_dgram_write_poll(s, false);
> +        close(s->fd);
> +        s->fd =3D -1;
> +    }
> +    if (s->listen_fd !=3D -1) {
> +        qemu_set_fd_handler(s->listen_fd, NULL, NULL, NULL);
> +        closesocket(s->listen_fd);
> +        s->listen_fd =3D -1;
> +    }
> +}
> +
> +static NetClientInfo net_dgram_socket_info =3D {
> +    .type =3D NET_CLIENT_DRIVER_DGRAM,
> +    .size =3D sizeof(NetDgramState),
> +    .receive =3D net_dgram_receive_dgram,
> +    .cleanup =3D net_dgram_cleanup,
> +};
> +
> +static NetDgramState *net_dgram_fd_init_dgram(NetClientState *peer,
> +                                              const char *model,
> +                                              const char *name,
> +                                              int fd, int is_fd,
> +                                              SocketAddress *mcast,
> +                                              Error **errp)
> +{
> +    struct sockaddr_in saddr;
> +    int newfd;
> +    NetClientState *nc;
> +    NetDgramState *s;
> +    SocketAddress *sa;
> +    SocketAddressType sa_type;
> +
> +    sa =3D socket_local_address(fd, errp);
> +    if (!sa) {
> +        return NULL;
> +    }
> +    sa_type =3D sa->type;
> +    qapi_free_SocketAddress(sa);
> +
> +    /*
> +     * fd passed: multicast: "learn" dgram_dst address from bound addres=
s and
> +     * save it. Because this may be "shared" socket from a "master" proc=
ess,
> +     * datagrams would be recv() by ONLY ONE process: we must "clone" th=
is
> +     * dgram socket --jjo
> +     */
> +
> +    if (is_fd && mcast !=3D NULL) {
> +            if (convert_host_port(&saddr, mcast->u.inet.host,
> +                                  mcast->u.inet.port, errp) < 0) {
> +                goto err;
> +            }
> +            /* must be bound */
> +            if (saddr.sin_addr.s_addr =3D=3D 0) {
> +                error_setg(errp, "can't setup multicast destination addr=
ess");
> +                goto err;
> +            }
> +            /* clone dgram socket */
> +            newfd =3D net_dgram_mcast_create(&saddr, NULL, errp);
> +            if (newfd < 0) {
> +                goto err;
> +            }
> +            /* clone newfd to fd, close newfd */
> +            dup2(newfd, fd);
> +            close(newfd);
> +
> +    }
> +
> +    nc =3D qemu_new_net_client(&net_dgram_socket_info, peer, model, name=
);
> +
> +    s =3D DO_UPCAST(NetDgramState, nc, nc);
> +
> +    s->fd =3D fd;
> +    s->listen_fd =3D -1;
> +    s->send_fn =3D net_dgram_send_dgram;
> +    net_socket_rs_init(&s->rs, net_dgram_rs_finalize, false);
> +    net_dgram_read_poll(s, true);
> +
> +    /* mcast: save bound address as dst */
> +    if (is_fd && mcast !=3D NULL) {
> +        s->dgram_dst =3D saddr;
> +        snprintf(nc->info_str, sizeof(nc->info_str),
> +                 "fd=3D%d (cloned mcast=3D%s:%d)",
> +                 fd, inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
> +    } else {
> +        if (sa_type =3D=3D SOCKET_ADDRESS_TYPE_UNIX) {
> +            s->dgram_dst.sin_family =3D AF_UNIX;
> +        }
> +
> +        snprintf(nc->info_str, sizeof(nc->info_str), "fd=3D%d %s", fd,
> +                 SocketAddressType_str(sa_type));
> +    }
> +
> +    return s;
> +
> +err:
> +    closesocket(fd);
> +    return NULL;
> +}
> +
> +static void net_dgram_connect(void *opaque)
> +{
> +    NetDgramState *s =3D opaque;
> +    s->send_fn =3D net_dgram_send;
> +    net_dgram_read_poll(s, true);
> +}
> +
> +static void net_dgram_accept(void *opaque)
> +{
> +    NetDgramState *s =3D opaque;
> +    struct sockaddr_in saddr;
> +    socklen_t len;
> +    int fd;
> +
> +    for (;;) {
> +        len =3D sizeof(saddr);
> +        fd =3D qemu_accept(s->listen_fd, (struct sockaddr *)&saddr, &len=
);
> +        if (fd < 0 && errno !=3D EINTR) {
> +            return;
> +        } else if (fd >=3D 0) {
> +            qemu_set_fd_handler(s->listen_fd, NULL, NULL, NULL);
> +            break;
> +        }
> +    }
> +
> +    s->fd =3D fd;
> +    s->nc.link_down =3D false;
> +    net_dgram_connect(s);
> +    snprintf(s->nc.info_str, sizeof(s->nc.info_str), "connection from %s=
:%d",
> +             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
> +}
> +
> +static int net_dgram_mcast_init(NetClientState *peer,
> +                                const char *model,
> +                                const char *name,
> +                                SocketAddress *remote,
> +                                SocketAddress *local,
> +                                Error **errp)
> +{
> +    NetDgramState *s;
> +    int fd, ret;
> +    struct sockaddr_in saddr;
> +
> +    if (remote->type !=3D SOCKET_ADDRESS_TYPE_INET) {
> +        error_setg(errp, "multicast only support inet type");
> +        return -1;
> +    }
> +
> +    if (convert_host_port(&saddr, remote->u.inet.host, remote->u.inet.po=
rt,
> +                          errp) < 0) {
> +        return -1;
> +    }
> +
> +    if (!local) {
> +        fd =3D net_dgram_mcast_create(&saddr, NULL, errp);
> +        if (fd < 0) {
> +            return -1;
> +        }
> +    } else {
> +        switch (local->type) {
> +        case SOCKET_ADDRESS_TYPE_INET: {
> +            struct in_addr localaddr;
> +
> +            if (inet_aton(local->u.inet.host, &localaddr) =3D=3D 0) {
> +                error_setg(errp, "localaddr '%s' is not a valid IPv4 add=
ress",
> +                           local->u.inet.host);
> +                return -1;
> +            }
> +
> +            fd =3D net_dgram_mcast_create(&saddr, &localaddr, errp);
> +            if (fd < 0) {
> +                return -1;
> +            }
> +            break;
> +        }
> +        case SOCKET_ADDRESS_TYPE_FD:
> +            fd =3D monitor_fd_param(monitor_cur(), local->u.fd.str, errp=
);
> +            if (fd =3D=3D -1) {
> +                return -1;
> +            }
> +            ret =3D qemu_socket_try_set_nonblock(fd);
> +            if (ret < 0) {
> +                error_setg_errno(errp, -ret, "%s: Can't use file descrip=
tor %d",
> +                                 name, fd);
> +                return -1;
> +            }
> +            break;
> +        default:
> +            error_setg(errp, "only support inet or fd type for local");
> +            return -1;
> +        }
> +    }
> +
> +    s =3D net_dgram_fd_init_dgram(peer, model, name, fd,
> +                                 local->type =3D=3D SOCKET_ADDRESS_TYPE_=
FD,
> +                                 remote, errp);
> +    if (!s) {
> +        return -1;
> +    }
> +
> +    s->dgram_dst =3D saddr;
> +
> +    snprintf(s->nc.info_str, sizeof(s->nc.info_str), "mcast=3D%s:%d",
> +             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
> +    return 0;
> +
> +}
> +
> +static int net_dgram_udp_init(NetClientState *peer,
> +                              const char *model,
> +                              const char *name,
> +                              SocketAddress *remote,
> +                              SocketAddress *local,
> +                              Error **errp)
> +{
> +    NetDgramState *s;
> +    int fd, ret;
> +    struct sockaddr_in raddr_in;
> +    gchar *info_str;
> +
> +    if (remote) {
> +        if (local->type =3D=3D SOCKET_ADDRESS_TYPE_FD) {
> +            error_setg(errp, "don't set remote with local.fd");
> +            return -1;
> +        }
> +        if (remote->type !=3D local->type) {
> +            error_setg(errp, "remote and local types must be the same");
> +            return -1;
> +        }
> +    } else {
> +        if (local->type !=3D SOCKET_ADDRESS_TYPE_FD) {
> +            error_setg(errp, "type=3Dinet requires remote parameter");
> +            return -1;
> +        }
> +    }
> +
> +    switch (local->type) {
> +    case SOCKET_ADDRESS_TYPE_INET: {
> +        struct sockaddr_in laddr_in;
> +
> +        if (convert_host_port(&laddr_in, local->u.inet.host, local->u.in=
et.port,
> +                              errp) < 0) {
> +            return -1;
> +        }
> +
> +        if (convert_host_port(&raddr_in, remote->u.inet.host,
> +                              remote->u.inet.port, errp) < 0) {
> +            return -1;
> +        }
> +
> +        fd =3D qemu_socket(PF_INET, SOCK_DGRAM, 0);
> +        if (fd < 0) {
> +            error_setg_errno(errp, errno, "can't create datagram socket"=
);
> +            return -1;
> +        }
> +
> +        ret =3D socket_set_fast_reuse(fd);
> +        if (ret < 0) {
> +            error_setg_errno(errp, errno,
> +                             "can't set socket option SO_REUSEADDR");
> +            closesocket(fd);
> +            return -1;
> +        }
> +        ret =3D bind(fd, (struct sockaddr *)&laddr_in, sizeof(laddr_in));
> +        if (ret < 0) {
> +            error_setg_errno(errp, errno, "can't bind ip=3D%s to socket",
> +                             inet_ntoa(laddr_in.sin_addr));
> +            closesocket(fd);
> +            return -1;
> +        }
> +        qemu_socket_set_nonblock(fd);
> +
> +        info_str =3D g_strdup_printf("udp=3D%s:%d/%s:%d",
> +                 inet_ntoa(laddr_in.sin_addr), ntohs(laddr_in.sin_port),
> +                 inet_ntoa(raddr_in.sin_addr), ntohs(raddr_in.sin_port));
> +
> +        break;
> +    }
> +    case SOCKET_ADDRESS_TYPE_FD:
> +        fd =3D monitor_fd_param(monitor_cur(), local->u.fd.str, errp);
> +        if (fd =3D=3D -1) {
> +            return -1;
> +        }
> +        ret =3D qemu_socket_try_set_nonblock(fd);
> +        if (ret < 0) {
> +            error_setg_errno(errp, -ret, "%s: Can't use file descriptor =
%d",
> +                             name, fd);
> +            return -1;
> +        }
> +        break;
> +    default:
> +        error_setg(errp, "only support inet or fd type for local");
> +        return -1;
> +    }
> +
> +    s =3D net_dgram_fd_init_dgram(peer, model, name, fd, 0, NULL, errp);
> +    if (!s) {
> +        return -1;
> +    }
> +
> +    if (remote) {
> +        s->dgram_dst =3D raddr_in;
> +
> +        pstrcpy(s->nc.info_str, sizeof(s->nc.info_str), info_str);
> +        g_free(info_str);
> +    }
> +    return 0;
> +}
> +
> +static int net_dgram_init(NetClientState *peer,
> +                          const char *model,
> +                          const char *name,
> +                          SocketAddress *remote,
> +                          SocketAddress *local,
> +                          Error **errp)
> +{
> +    /* detect multicast address */
> +    if (remote && remote->type =3D=3D SOCKET_ADDRESS_TYPE_INET) {
> +        struct sockaddr_in mcastaddr;
> +
> +        if (convert_host_port(&mcastaddr, remote->u.inet.host,
> +                              remote->u.inet.port, errp) < 0) {
> +            return -1;
> +        }
> +
> +        if (IN_MULTICAST(ntohl(mcastaddr.sin_addr.s_addr))) {
> +            return net_dgram_mcast_init(peer, model, name, remote, local,
> +                                           errp);
> +        }
> +    }
> +    /* unicast address */
> +    if (!local) {
> +        error_setg(errp, "dgram requires local=3D parameter");
> +        return -1;
> +    }
> +    return net_dgram_udp_init(peer, model, name, remote, local, errp);
> +}
> +
> +int net_init_dgram(const Netdev *netdev, const char *name,
> +                   NetClientState *peer, Error **errp)
> +{
> +    const NetdevDgramOptions *sock;
> +
> +    assert(netdev->type =3D=3D NET_CLIENT_DRIVER_DGRAM);
> +    sock =3D &netdev->u.dgram;
> +
> +    return net_dgram_init(peer, "dgram", name, sock->remote, sock->local,
> +                          errp);
> +}
> diff --git a/net/hub.c b/net/hub.c
> index 1375738bf121..67ca53485638 100644
> --- a/net/hub.c
> +++ b/net/hub.c
> @@ -313,6 +313,8 @@ void net_hub_check_clients(void)
>              case NET_CLIENT_DRIVER_USER:
>              case NET_CLIENT_DRIVER_TAP:
>              case NET_CLIENT_DRIVER_SOCKET:
> +            case NET_CLIENT_DRIVER_STREAM:
> +            case NET_CLIENT_DRIVER_DGRAM:
>              case NET_CLIENT_DRIVER_VDE:
>              case NET_CLIENT_DRIVER_VHOST_USER:
>                  has_host_dev =3D 1;
> diff --git a/net/meson.build b/net/meson.build
> index 754e2d1d405c..896d86d43914 100644
> --- a/net/meson.build
> +++ b/net/meson.build
> @@ -13,6 +13,8 @@ softmmu_ss.add(files(
>    'net.c',
>    'queue.c',
>    'socket.c',
> +  'stream.c',
> +  'dgram.c',
>    'util.c',
>  ))
>=20=20
> diff --git a/net/net.c b/net/net.c
> index c337d3d753fe..440957b272ee 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -48,6 +48,7 @@
>  #include "qemu/qemu-print.h"
>  #include "qemu/main-loop.h"
>  #include "qemu/option.h"
> +#include "qemu/keyval.h"
>  #include "qapi/error.h"
>  #include "qapi/opts-visitor.h"
>  #include "sysemu/runstate.h"
> @@ -1014,6 +1015,8 @@ static int (* const net_client_init_fun[NET_CLIENT_=
DRIVER__MAX])(
>  #endif
>          [NET_CLIENT_DRIVER_TAP]       =3D net_init_tap,
>          [NET_CLIENT_DRIVER_SOCKET]    =3D net_init_socket,
> +        [NET_CLIENT_DRIVER_STREAM]    =3D net_init_stream,
> +        [NET_CLIENT_DRIVER_DGRAM]     =3D net_init_dgram,
>  #ifdef CONFIG_VDE
>          [NET_CLIENT_DRIVER_VDE]       =3D net_init_vde,
>  #endif
> @@ -1101,6 +1104,8 @@ void show_netdevs(void)
>      int idx;
>      const char *available_netdevs[] =3D {
>          "socket",
> +        "stream",
> +        "dgram",
>          "hubport",
>          "tap",
>  #ifdef CONFIG_SLIRP
> @@ -1612,7 +1617,19 @@ void net_init_clients(void)
>   */
>  static bool netdev_is_modern(const char *optarg)
>  {
> -    return false;
> +    QDict *args;
> +    const char *type;
> +    bool is_modern;
> +
> +    args =3D keyval_parse(optarg, "type", NULL, NULL);
> +    if (!args) {
> +        return false;
> +    }
> +    type =3D qdict_get_try_str(args, "type");
> +    is_modern =3D !g_strcmp0(type, "stream") || !g_strcmp0(type, "dgram"=
);
> +    qobject_unref(args);
> +
> +    return is_modern;
>  }

You could use g_autoptr here:

       g_autoptr(QDict) args =3D NULL;
       const char *type;
       bool is_modern;

       args =3D keyval_parse(optarg, "type", NULL, NULL);
       if (!args) {
           return false;
       }
       type =3D qdict_get_try_str(args, "type");
       return !g_strcmp0(type, "stream") || !g_strcmp0(type, "dgram");

Matter of taste; you decide.

Now recall how this function is used: it decides whether to parse the
modern way (with qobject_input_visitor_new_str()) or the traditional way
(with qemu_opts_parse_noisily()).

qemu_opts_parse_noisily() parses into a QemuOpts, for later use with the
opts visitor.

qobject_input_visitor_new_str() supports both dotted keys and JSON.  The
former is parsed with keyval_parse(), the latter with
qobject_from_json().  It returns the resulting parse tree wrapped in a
suitable QAPI input visitor.

Issue 1: since we get there only when keyval_parse() succeeds, JSON is
unreachable.  Reproducer:

    $ qemu-system-x86_64 -netdev '{"id":"foo"}'
    upstream-qemu: -netdev {"id":"foo"}: Parameter 'id' is missing

This is parsed with qemu_opts_parse_noisily(), resulting in a QemuOpts
with a single option 'type' with value '{"id":"foo"}'.  The error
message comes from the opts visitor.

To fix this, make netdev_is_modern() return true when optarg[0] =3D=3D '{'.
This matches how qobject_input_visitor_new_str() recognizes JSON.

Issue 2: when keyval_parse() detects an error, we throw it away and fall
back to QemuOpts.  This is commonly what we want.  But not always.  For
instance:

    $ qemu-system-x86_64 -netdev 'type=3Dstream,id=3Dfoo,addr.type=3Dinet,a=
ddr.host=3Dlocalhost,addr.port=3D1234,addr.ipv4-off'

Note the typo "ipv4-off" instead of ipv4=3Doff.  The error reporting is cra=
p:

    qemu-system-x86_64: -netdev type=3Dstream,id=3Dfoo,addr.type=3Dinet,add=
r.host=3Dlocalhost,addr.port=3D1234,addr.ipv4-off: warning: short-form bool=
ean option 'addr.ipv4-off' deprecated
    Please use addr.ipv4-off=3Don instead
    qemu-system-x86_64: -netdev type=3Dstream,id=3Dfoo,addr.type=3Dinet,add=
r.host=3Dlocalhost,addr.port=3D1234,addr.ipv4-off: Parameter 'type' is miss=
ing

We get this because netdev_is_modern() guesses wrongly: keyval_parse()
fails with the perfectly reasonable error message "Expected '=3D' after
parameter 'addr.ipv4-off'", but netdev_is_modern() ignores the error,
and fails.  We fall back to QemuOpts, and confusion ensues.

I'm not sure we can do much better with reasonable effort.  If we decide
to accept this behavior, it should be documented at least in the source
code.

>=20=20
>  /*
> diff --git a/net/stream.c b/net/stream.c
> new file mode 100644
> index 000000000000..fdc97ee43a56
> --- /dev/null
> +++ b/net/stream.c
> @@ -0,0 +1,425 @@
> +/*
> + * QEMU System Emulator
> + *
> + * Copyright (c) 2003-2008 Fabrice Bellard
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
> + * of this software and associated documentation files (the "Software"),=
 to deal
> + * in the Software without restriction, including without limitation the=
 rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be includ=
ed in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
> + * THE SOFTWARE.
> + */

Blank line here, please.

> +#include "qemu/osdep.h"
> +
> +#include "net/net.h"
> +#include "clients.h"
> +#include "monitor/monitor.h"
> +#include "qapi/error.h"
> +#include "qemu/error-report.h"
> +#include "qemu/option.h"
> +#include "qemu/sockets.h"
> +#include "qemu/iov.h"
> +#include "qemu/main-loop.h"
> +#include "qemu/cutils.h"
> +
> +typedef struct NetStreamState {
> +    NetClientState nc;
> +    int listen_fd;
> +    int fd;
> +    SocketReadState rs;
> +    unsigned int send_index;      /* number of bytes sent*/
> +    IOHandler *send_fn;
> +    bool read_poll;               /* waiting to receive data? */
> +    bool write_poll;              /* waiting to transmit data? */
> +} NetStreamState;
> +
> +static void net_stream_accept(void *opaque);
> +static void net_stream_writable(void *opaque);
> +
> +static void net_stream_update_fd_handler(NetStreamState *s)
> +{
> +    qemu_set_fd_handler(s->fd,
> +                        s->read_poll ? s->send_fn : NULL,
> +                        s->write_poll ? net_stream_writable : NULL,
> +                        s);
> +}
> +
> +static void net_stream_read_poll(NetStreamState *s, bool enable)
> +{
> +    s->read_poll =3D enable;
> +    net_stream_update_fd_handler(s);
> +}
> +
> +static void net_stream_write_poll(NetStreamState *s, bool enable)
> +{
> +    s->write_poll =3D enable;
> +    net_stream_update_fd_handler(s);
> +}
> +
> +static void net_stream_writable(void *opaque)
> +{
> +    NetStreamState *s =3D opaque;
> +
> +    net_stream_write_poll(s, false);
> +
> +    qemu_flush_queued_packets(&s->nc);
> +}
> +
> +static ssize_t net_stream_receive(NetClientState *nc, const uint8_t *buf,
> +                                  size_t size)
> +{
> +    NetStreamState *s =3D DO_UPCAST(NetStreamState, nc, nc);
> +    uint32_t len =3D htonl(size);
> +    struct iovec iov[] =3D {
> +        {
> +            .iov_base =3D &len,
> +            .iov_len  =3D sizeof(len),
> +        }, {
> +            .iov_base =3D (void *)buf,
> +            .iov_len  =3D size,
> +        },
> +    };
> +    size_t remaining;
> +    ssize_t ret;
> +
> +    remaining =3D iov_size(iov, 2) - s->send_index;
> +    ret =3D iov_send(s->fd, iov, 2, s->send_index, remaining);
> +
> +    if (ret =3D=3D -1 && errno =3D=3D EAGAIN) {
> +        ret =3D 0; /* handled further down */
> +    }
> +    if (ret =3D=3D -1) {
> +        s->send_index =3D 0;
> +        return -errno;
> +    }
> +    if (ret < (ssize_t)remaining) {
> +        s->send_index +=3D ret;
> +        net_stream_write_poll(s, true);
> +        return 0;
> +    }
> +    s->send_index =3D 0;
> +    return size;
> +}
> +
> +static void net_stream_send_completed(NetClientState *nc, ssize_t len)
> +{
> +    NetStreamState *s =3D DO_UPCAST(NetStreamState, nc, nc);
> +
> +    if (!s->read_poll) {
> +        net_stream_read_poll(s, true);
> +    }
> +}
> +
> +static void net_stream_rs_finalize(SocketReadState *rs)
> +{
> +    NetStreamState *s =3D container_of(rs, NetStreamState, rs);
> +
> +    if (qemu_send_packet_async(&s->nc, rs->buf,
> +                               rs->packet_len,
> +                               net_stream_send_completed) =3D=3D 0) {
> +        net_stream_read_poll(s, false);
> +    }
> +}
> +
> +static void net_stream_send(void *opaque)
> +{
> +    NetStreamState *s =3D opaque;
> +    int size;
> +    int ret;
> +    uint8_t buf1[NET_BUFSIZE];
> +    const uint8_t *buf;
> +
> +    size =3D recv(s->fd, buf1, sizeof(buf1), 0);
> +    if (size < 0) {
> +        if (errno !=3D EWOULDBLOCK) {
> +            goto eoc;
> +        }
> +    } else if (size =3D=3D 0) {
> +        /* end of connection */
> +    eoc:
> +        net_stream_read_poll(s, false);
> +        net_stream_write_poll(s, false);
> +        if (s->listen_fd !=3D -1) {
> +            qemu_set_fd_handler(s->listen_fd, net_stream_accept, NULL, s=
);
> +        }
> +        closesocket(s->fd);
> +
> +        s->fd =3D -1;
> +        net_socket_rs_init(&s->rs, net_stream_rs_finalize, false);
> +        s->nc.link_down =3D true;
> +        memset(s->nc.info_str, 0, sizeof(s->nc.info_str));
> +
> +        return;
> +    }
> +    buf =3D buf1;
> +
> +    ret =3D net_fill_rstate(&s->rs, buf, size);
> +
> +    if (ret =3D=3D -1) {
> +        goto eoc;
> +    }
> +}
> +
> +static void net_stream_cleanup(NetClientState *nc)
> +{
> +    NetStreamState *s =3D DO_UPCAST(NetStreamState, nc, nc);
> +    if (s->fd !=3D -1) {
> +        net_stream_read_poll(s, false);
> +        net_stream_write_poll(s, false);
> +        close(s->fd);
> +        s->fd =3D -1;
> +    }
> +    if (s->listen_fd !=3D -1) {
> +        qemu_set_fd_handler(s->listen_fd, NULL, NULL, NULL);
> +        closesocket(s->listen_fd);
> +        s->listen_fd =3D -1;
> +    }
> +}
> +
> +static void net_stream_connect(void *opaque)
> +{
> +    NetStreamState *s =3D opaque;
> +    s->send_fn =3D net_stream_send;
> +    net_stream_read_poll(s, true);
> +}
> +
> +static NetClientInfo net_stream_info =3D {
> +    .type =3D NET_CLIENT_DRIVER_STREAM,
> +    .size =3D sizeof(NetStreamState),
> +    .receive =3D net_stream_receive,
> +    .cleanup =3D net_stream_cleanup,
> +};
> +
> +static NetStreamState *net_stream_fd_init_stream(NetClientState *peer,
> +                                                 const char *model,
> +                                                 const char *name,
> +                                                 int fd, int is_connecte=
d)
> +{
> +    NetClientState *nc;
> +    NetStreamState *s;
> +
> +    nc =3D qemu_new_net_client(&net_stream_info, peer, model, name);
> +
> +    snprintf(nc->info_str, sizeof(nc->info_str), "fd=3D%d", fd);
> +
> +    s =3D DO_UPCAST(NetStreamState, nc, nc);
> +
> +    s->fd =3D fd;
> +    s->listen_fd =3D -1;
> +    net_socket_rs_init(&s->rs, net_stream_rs_finalize, false);
> +
> +    /* Disable Nagle algorithm on TCP sockets to reduce latency */
> +    socket_set_nodelay(fd);
> +
> +    if (is_connected) {
> +        net_stream_connect(s);
> +    } else {
> +        qemu_set_fd_handler(s->fd, NULL, net_stream_connect, s);
> +    }
> +    return s;
> +}
> +
> +static void net_stream_accept(void *opaque)
> +{
> +    NetStreamState *s =3D opaque;
> +    struct sockaddr_in saddr;
> +    socklen_t len;
> +    int fd;
> +
> +    for (;;) {
> +        len =3D sizeof(saddr);
> +        fd =3D qemu_accept(s->listen_fd, (struct sockaddr *)&saddr, &len=
);
> +        if (fd < 0 && errno !=3D EINTR) {
> +            return;
> +        } else if (fd >=3D 0) {
> +            qemu_set_fd_handler(s->listen_fd, NULL, NULL, NULL);
> +            break;
> +        }
> +    }
> +
> +    s->fd =3D fd;
> +    s->nc.link_down =3D false;
> +    net_stream_connect(s);
> +    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
> +             "connection from %s:%d",
> +             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
> +}
> +
> +static int net_stream_server_init(NetClientState *peer,
> +                                  const char *model,
> +                                  const char *name,
> +                                  SocketAddress *addr,
> +                                  Error **errp)
> +{
> +    NetClientState *nc;
> +    NetStreamState *s;
> +    int fd, ret;
> +
> +    switch (addr->type) {
> +    case SOCKET_ADDRESS_TYPE_INET: {
> +        struct sockaddr_in saddr_in;
> +
> +        if (convert_host_port(&saddr_in, addr->u.inet.host, addr->u.inet=
.port,
> +                              errp) < 0) {
> +            return -1;
> +        }
> +
> +        fd =3D qemu_socket(PF_INET, SOCK_STREAM, 0);
> +        if (fd < 0) {
> +            error_setg_errno(errp, errno, "can't create stream socket");
> +            return -1;
> +        }
> +        qemu_socket_set_nonblock(fd);
> +
> +        socket_set_fast_reuse(fd);
> +
> +        ret =3D bind(fd, (struct sockaddr *)&saddr_in, sizeof(saddr_in));
> +        if (ret < 0) {
> +            error_setg_errno(errp, errno, "can't bind ip=3D%s to socket",
> +                             inet_ntoa(saddr_in.sin_addr));
> +            closesocket(fd);
> +            return -1;
> +        }
> +        break;
> +    }
> +    case SOCKET_ADDRESS_TYPE_UNIX: {
> +        error_setg(errp, "only support inet type");
> +        return -1;
> +    }
> +    case SOCKET_ADDRESS_TYPE_FD:
> +        fd =3D monitor_fd_param(monitor_cur(), addr->u.fd.str, errp);
> +        if (fd =3D=3D -1) {
> +            return -1;
> +        }
> +        ret =3D qemu_socket_try_set_nonblock(fd);
> +        if (ret < 0) {
> +            error_setg_errno(errp, -ret, "%s: Can't use file descriptor =
%d",
> +                             name, fd);
> +            return -1;
> +        }
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    ret =3D listen(fd, 0);
> +    if (ret < 0) {
> +        error_setg_errno(errp, errno, "can't listen on socket");
> +        closesocket(fd);
> +        return -1;
> +    }
> +
> +    nc =3D qemu_new_net_client(&net_stream_info, peer, model, name);
> +    s =3D DO_UPCAST(NetStreamState, nc, nc);
> +    s->fd =3D -1;
> +    s->listen_fd =3D fd;
> +    s->nc.link_down =3D true;
> +    net_socket_rs_init(&s->rs, net_stream_rs_finalize, false);
> +
> +    qemu_set_fd_handler(s->listen_fd, net_stream_accept, NULL, s);
> +    return 0;
> +}
> +
> +static int net_stream_client_init(NetClientState *peer,
> +                                  const char *model,
> +                                  const char *name,
> +                                  SocketAddress *addr,
> +                                  Error **errp)
> +{
> +    NetStreamState *s;
> +    int fd, connected, ret;
> +    gchar *info_str;
> +
> +    switch (addr->type) {
> +    case SOCKET_ADDRESS_TYPE_INET: {
> +        struct sockaddr_in saddr_in;
> +
> +        if (convert_host_port(&saddr_in, addr->u.inet.host, addr->u.inet=
.port,
> +                              errp) < 0) {
> +            return -1;
> +        }
> +
> +        fd =3D qemu_socket(PF_INET, SOCK_STREAM, 0);
> +        if (fd < 0) {
> +            error_setg_errno(errp, errno, "can't create stream socket");
> +            return -1;
> +        }
> +        qemu_socket_set_nonblock(fd);
> +
> +        connected =3D 0;
> +        for (;;) {
> +            ret =3D connect(fd, (struct sockaddr *)&saddr_in, sizeof(sad=
dr_in));
> +            if (ret < 0) {
> +                if (errno =3D=3D EINTR || errno =3D=3D EWOULDBLOCK) {
> +                    /* continue */
> +                } else if (errno =3D=3D EINPROGRESS ||
> +                           errno =3D=3D EALREADY ||
> +                           errno =3D=3D EINVAL) {
> +                    break;
> +                } else {
> +                    error_setg_errno(errp, errno, "can't connect socket"=
);
> +                    closesocket(fd);
> +                    return -1;
> +                }
> +            } else {
> +                connected =3D 1;
> +                break;
> +            }
> +        }
> +        info_str =3D g_strdup_printf("connect to %s:%d",
> +                                   inet_ntoa(saddr_in.sin_addr),
> +                                   ntohs(saddr_in.sin_port));
> +        break;
> +    }
> +    case SOCKET_ADDRESS_TYPE_FD:
> +        fd =3D monitor_fd_param(monitor_cur(), addr->u.fd.str, errp);
> +        if (fd =3D=3D -1) {
> +            return -1;
> +        }
> +        ret =3D qemu_socket_try_set_nonblock(fd);
> +        if (ret < 0) {
> +            error_setg_errno(errp, -ret, "%s: Can't use file descriptor =
%d",
> +                             name, fd);
> +            return -1;
> +        }
> +        connected =3D 1;
> +        info_str =3D g_strdup_printf("connect to fd %d", fd);
> +        break;
> +    default:
> +        error_setg(errp, "only support inet or fd type");
> +        return -1;
> +    }
> +
> +    s =3D net_stream_fd_init_stream(peer, model, name, fd, connected);
> +
> +    pstrcpy(s->nc.info_str, sizeof(s->nc.info_str), info_str);
> +    g_free(info_str);
> +
> +    return 0;
> +}
> +
> +int net_init_stream(const Netdev *netdev, const char *name,
> +                    NetClientState *peer, Error **errp)
> +{
> +    const NetdevStreamOptions *sock;
> +
> +    assert(netdev->type =3D=3D NET_CLIENT_DRIVER_STREAM);
> +    sock =3D &netdev->u.stream;
> +
> +    if (!sock->has_server || sock->server) {
> +        return net_stream_server_init(peer, "stream", name, sock->addr, =
errp);
> +    }
> +    return net_stream_client_init(peer, "stream", name, sock->addr, errp=
);
> +}
> diff --git a/qapi/net.json b/qapi/net.json
> index d6f7cfd4d656..5f72995b1d24 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -7,6 +7,7 @@
>  ##
>=20=20
>  { 'include': 'common.json' }
> +{ 'include': 'sockets.json' }
>=20=20
>  ##
>  # @set_link:
> @@ -566,6 +567,37 @@
>      '*isolated':  'bool' },
>    'if': 'CONFIG_VMNET' }
>=20=20
> +##
> +# @NetdevStreamOptions:
> +#
> +# Configuration info for stream socket netdev
> +#
> +# @addr: socket address to listen on (server=3Dtrue)
> +#        or connect to (server=3Dfalse)
> +# @server: create server socket (default: true)
> +#
> +# Since: 7.1
> +##
> +{ 'struct': 'NetdevStreamOptions',
> +  'data': {
> +    'addr':   'SocketAddress',
> +    '*server': 'bool' } }
> +
> +##
> +# @NetdevDgramOptions:
> +#
> +# Configuration info for datagram socket netdev.
> +#
> +# @remote: remote address
> +# @local: local address
> +#
> +# Since: 7.1
> +##
> +{ 'struct': 'NetdevDgramOptions',
> +  'data': {
> +    '*local':  'SocketAddress',
> +    '*remote': 'SocketAddress' }=C2=A0}

In review of v2, I inquired about behavior when members are absent.
You wrote:

    The code checks there is at least one of these options and reports an e=
rror if not.

    if remote address is present and it's a multicast address, local addres=
s is optional.

    otherwise local address is required and remote address is optional.

Please work that into the doc comment.

> +
>  ##
>  # @NetClientDriver:
>  #
> @@ -579,9 +611,9 @@
>  #        @vmnet-bridged since 7.1
>  ##
>  { 'enum': 'NetClientDriver',
> -  'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
> -            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa',
> -            { 'name': 'vmnet-host', 'if': 'CONFIG_VMNET' },
> +  'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'stream',
> +            'dgram', 'vde', 'bridge', 'hubport', 'netmap', 'vhost-user',
> +            'vhost-vdpa', { 'name': 'vmnet-host', 'if': 'CONFIG_VMNET' },
>              { 'name': 'vmnet-shared', 'if': 'CONFIG_VMNET' },
>              { 'name': 'vmnet-bridged', 'if': 'CONFIG_VMNET' }] }

Opportunity to put vmnet-host on its own line for readability.

>=20=20
> @@ -610,6 +642,8 @@
>      'tap':      'NetdevTapOptions',
>      'l2tpv3':   'NetdevL2TPv3Options',
>      'socket':   'NetdevSocketOptions',
> +    'stream':   'NetdevStreamOptions',
> +    'dgram':    'NetdevDgramOptions',
>      'vde':      'NetdevVdeOptions',
>      'bridge':   'NetdevBridgeOptions',
>      'hubport':  'NetdevHubPortOptions',
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 60cf188da429..c87dcdc65ece 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2727,6 +2727,18 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>      "-netdev socket,id=3Dstr[,fd=3Dh][,udp=3Dhost:port][,localaddr=3Dhos=
t:port]\n"
>      "                configure a network backend to connect to another n=
etwork\n"
>      "                using an UDP tunnel\n"
> +    "-netdev stream,id=3Dstr[,server=3Don|off],addr.type=3Dinet,addr.hos=
t=3Dhost,addr.port=3Dport\n"
> +    "-netdev stream,id=3Dstr[,server=3Don|off],addr.type=3Dfd,addr.str=
=3Dh\n"
> +    "                configure a network backend to connect to another n=
etwork\n"
> +    "                using a socket connection in stream mode.\n"
> +    "-netdev dgram,id=3Dstr,remote.type=3Dinet,remote.host=3Dmaddr,remot=
e.port=3Dport[,local.type=3Dinet,local.host=3Daddr]\n"
> +    "-netdev dgram,id=3Dstr,remote.type=3Dinet,remote.host=3Dmaddr,remot=
e.port=3Dport[,local.type=3Dfd,local.str=3Dh]\n"
> +    "                configure a network backend to connect to a multica=
st maddr and port\n"
> +    "                use 'local.host=3Daddr' to specify the host address=
 to send packets from\n"
> +    "-netdev dgram,id=3Dstr,local.type=3Dinet,local.host=3Dhost,local.po=
rt=3Dport[,remote.type=3Dinet,remote.host=3Dhost,remote.port=3Dport]\n"
> +    "-netdev dgram,id=3Dstr,local.type=3Dfd,local.str=3Dh\n"
> +    "                configure a network backend to connect to another n=
etwork\n"
> +    "                using an UDP tunnel\n"
>  #ifdef CONFIG_VDE
>      "-netdev vde,id=3Dstr[,sock=3Dsocketpath][,port=3Dn][,group=3Dgroupn=
ame][,mode=3Doctalmode]\n"
>      "                configure a network backend to connect to port 'n' =
of a vde switch\n"


