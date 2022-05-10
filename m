Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D58522646
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 23:27:30 +0200 (CEST)
Received: from localhost ([::1]:56398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noXOD-0007dk-4V
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 17:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1noXLm-0004LB-AH
 for qemu-devel@nongnu.org; Tue, 10 May 2022 17:24:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1noXLj-0003NH-6P
 for qemu-devel@nongnu.org; Tue, 10 May 2022 17:24:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652217894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uQNpc8TfZB4X1h337eUAas+BvOHXq+f1oAezTa27ndk=;
 b=GBmGfostfnGGQTsUsHEkKf+/IVfAmEe0UD2rPXpdMHLRQ871zeHCXqR+TAHcZYbB1YiZwS
 hTywDtelnFSsG8pGRF150AV0RI85R7C/Gh3xQ9fVQu/V++7OOli+4yQm8hG72NpdufzxDL
 TtU64BloTf+9LbCL0G3/EV3hxjDJveY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-jStMT3kAMZyToc1NUbkSLw-1; Tue, 10 May 2022 17:24:51 -0400
X-MC-Unique: jStMT3kAMZyToc1NUbkSLw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8833101AA44;
 Tue, 10 May 2022 21:24:50 +0000 (UTC)
Received: from maya.cloud.tilaa.com (unknown [10.40.208.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B8D9D2024CB7;
 Tue, 10 May 2022 21:24:48 +0000 (UTC)
Date: Tue, 10 May 2022 23:24:43 +0200
From: Stefano Brivio <sbrivio@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Ralph Schmieder <ralph.schmieder@gmail.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, Markus
 Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH 2/6] qapi: net: add socket-ng netdev
Message-ID: <20220510232443.641b13b8@elisabeth>
In-Reply-To: <20220509173618.467207-3-lvivier@redhat.com>
References: <20220509173618.467207-1-lvivier@redhat.com>
 <20220509173618.467207-3-lvivier@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sbrivio@redhat.com;
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

On Mon,  9 May 2022 19:36:14 +0200
Laurent Vivier <lvivier@redhat.com> wrote:

> Copied from socket netdev file and modified to use SocketAddress
> to be able to introduce new features like unix socket.
>=20
> "udp" and "mcast" are squashed into dgram, multicast is detected
> according to the IP address type.
> "listen" and "connect" modes are changed to "server" and "client".
>=20
> As qemu_opts_parse_noisily() flattens the QAPI structures ("type" field
> of Netdev structure collides with "type" field of SocketAddress),
> we detect socket-ng backend and use directly visit_type_Netdev() to
> parse the backend parameters.
>=20
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>=20
> net: socket-ng: replace mode=3Dunicast/multicast by mode=3Ddgram
>=20
> The multicast mode is detected according to the remote
> address type.
>=20
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  hmp-commands.hx |   2 +-
>  net/clients.h   |   3 +
>  net/hub.c       |   1 +
>  net/meson.build |   1 +
>  net/net.c       |  61 ++++
>  net/socket-ng.c | 890 ++++++++++++++++++++++++++++++++++++++++++++++++
>  qapi/net.json   |  41 ++-
>  7 files changed, 996 insertions(+), 3 deletions(-)
>  create mode 100644 net/socket-ng.c
>=20
> [...]
>
> +static int net_socketng_connect_init(NetClientState *peer,
> +                                   const char *model,
> +                                   const char *name,
> +                                   SocketAddress *addr,
> +                                   Error **errp)
> +{
> +    NetSocketNGState *s;
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

I guess we should report failure and close the socket on EINVAL, there
are no chances the connection will eventually succeed. I actually
proposed this change (after some debugging frustration) in my quick and
dirty series to get AF_UNIX sockets working:

	https://lore.kernel.org/all/a6d475147682de1fe3b14eb325f4247e013e8440.16191=
90878.git.sbrivio@redhat.com/

> +                    break;
> +                } else {
> +                    error_setg_errno(errp, errno, "can't connect socket"=
);
> +                    closesocket(fd);
> +                    return -1;
> +                }
>
> [...]
>
> diff --git a/qapi/net.json b/qapi/net.json
> index b92f3f5fb444..2b31101e6641 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -7,6 +7,7 @@
>  ##
> =20
>  { 'include': 'common.json' }
> +{ 'include': 'sockets.json' }
> =20
>  ##
>  # @set_link:
> @@ -452,6 +453,40 @@
>      '*vhostdev':     'str',
>      '*queues':       'int' } }
> =20
> +##
> +# @NetdevSocketNGMode:
> +#
> +# @dgram: UDP mode
> +#
> +# @server: TCP server mode
> +#
> +# @client: TCP client mode
> +#
> +# Legacy NetdevSocketOptions only accepts one of:
> +# "fd", "udp", "mcast" and "udp".
> +# we map:
> +#   "udp", "mcast" -> "dgram"
> +#   "listen"       -> "server"
> +#   "connect"      -> "client"
> +#
> +# Since: 7.1
> +#
> +##
> +{ 'enum': 'NetdevSocketNGMode',
> +  'data':  [ 'dgram', 'server', 'client' ] }
> +
> +##
> +# @NetdevSocketNGOptions:
> +#
> +# Since: 7.1
> +##
> +{ 'struct': 'NetdevSocketNGOptions',
> +  'data': {
> +    'mode':    'NetdevSocketNGMode',
> +    '*addr':   'SocketAddress',
> +    '*remote': 'SocketAddress',
> +    '*local':  'SocketAddress' }=C2=A0}
> +
>  ##
>  # @NetClientDriver:
>  #
> @@ -463,7 +498,8 @@
>  ##
>  { 'enum': 'NetClientDriver',
>    'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
> -            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa' ] }
> +            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa',
> +            'socket-ng' ] }

I don't know if this is an issue, but I couldn't figure out the reason
for this difference either:

- with the old socket option, I can pass something like:

    -net socket,fd=3D5 -net nic,model=3Dvirtio

  and frames are sent to/received from socket number 5 (which I
  pre-opened)

- with the new option, and something like:

    -netdev socket-ng,id=3Dsocket0,mode=3Dclient,addr.type=3Dunix,addr.path=
=3D/tmp/test.socket -net nic,model=3Dvirtio,id=3Dhostnet0

  I get a connection on the socket, but the virtio-net device is not
  connected to it (no frames received/sent).

  However, if instead of "-net nic" I pass this:

    -device virtio-net-pci,netdev=3Dsocket0

  everything works.

--=20
Stefano


