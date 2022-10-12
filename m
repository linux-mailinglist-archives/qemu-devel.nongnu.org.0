Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5E75FBED4
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 03:20:03 +0200 (CEST)
Received: from localhost ([::1]:57716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiQPi-00030f-TE
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 21:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oiQOM-0001ec-Uo
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 21:18:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oiQOI-0007d5-MA
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 21:18:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665537511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6zTQk0tsRwFarsGs+nDKH/9m/V/uB2+WjzAPPJi3yCE=;
 b=T7Snn26bNzeM9Rx7mdMNfFSlENpShfgXKAvSL5HLNyxbcbc+BpSegw2fOYTNK18KIfKXdU
 g2IRqoMGJqpIHf8FqLEvu0QQMD8ADerLA+8Iuw4CCatDJ5MNrdwGu25XD6vQz1qZJsKJ0+
 fH4VspaBIa9KAwq6JCISrMjR0KzPJv0=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-378-jq-tp7lSPAy7OVzR5ARoDg-1; Tue, 11 Oct 2022 21:18:30 -0400
X-MC-Unique: jq-tp7lSPAy7OVzR5ARoDg-1
Received: by mail-oo1-f72.google.com with SMTP id
 x10-20020a4a394a000000b0048082279db7so1762463oog.7
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 18:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6zTQk0tsRwFarsGs+nDKH/9m/V/uB2+WjzAPPJi3yCE=;
 b=nCj7fyshaKkw+W/V0JJXikXzHQx3oppm38LP0zgt26pnlg8ZYc8gVOeLnbnMsb8Hx/
 4L8iOtG3KlASGjTI/fxM3AM0Jxo7HT4hl1llXpFh0c7uf/AT21St4ESCcpmOc29Z9gS+
 /ULZIHXnN1IROqVgB5F/Y9Tvi4j6g1kUvUbDM9z7KB9egDymH3Ffqr1lkp98I6Hz0U62
 RHOtYqKRhf9lXHwQqyiM61Elcr/QPnYJwm6+rUOY9HKKM83benlxE2TkpUnjqN9buOpu
 +Woi6mum2weUGyl+s5+0z1evETAAS3aevR0nf+1KsWqUVLdGt+dCE7VR3XC7rrBqp2kg
 Ty8A==
X-Gm-Message-State: ACrzQf0QxdrUNionqlES9vjMr1FRmk4uE8mZg+8GKvQbO9xvzzqpVPlF
 ALuMVRUTzuoIjoYKbZIdo4+xOPMelDE1KvuphGWkrwGqK+RmBrbp3OzIc8domonjzimxRLarXt6
 7A5kzalPfKlg0H+EAo8EKFuhVqrprXNQ=
X-Received: by 2002:a05:6808:1483:b0:354:a36e:5b with SMTP id
 e3-20020a056808148300b00354a36e005bmr915168oiw.35.1665537509592; 
 Tue, 11 Oct 2022 18:18:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM60zjKrqYwzQV/FrOR7pvk6qbqwoLH09I7q9K3mgqN73fThScdPWL6XQ7z21uKSUg44npndXKcK4REqq6e7oyc=
X-Received: by 2002:a05:6808:1483:b0:354:a36e:5b with SMTP id
 e3-20020a056808148300b00354a36e005bmr915154oiw.35.1665537509316; Tue, 11 Oct
 2022 18:18:29 -0700 (PDT)
MIME-Version: 1.0
References: <20221005162051.1120041-1-lvivier@redhat.com>
 <20221006071948-mutt-send-email-mst@kernel.org>
 <CACGkMEutaeUPgeS1ZqhzuwoVJy3YpuQ_oZx6YkSCBvkdxAe+VA@mail.gmail.com>
 <8b598d01-3231-6bfa-fe3f-d2608ef3d7bc@redhat.com>
In-Reply-To: <8b598d01-3231-6bfa-fe3f-d2608ef3d7bc@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 12 Oct 2022 09:18:18 +0800
Message-ID: <CACGkMEuwq27hPera5C_EoOBamwxf17nee254cGfTDgU0mnaNFA@mail.gmail.com>
Subject: Re: [PATCH v10 00/17] qapi: net: add unix socket type support to
 netdev backend
To: Laurent Vivier <lvivier@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, 
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Markus Armbruster <armbru@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Greg Kurz <groug@kaod.org>, Ralph Schmieder <ralph.schmieder@gmail.com>,
 Stefano Brivio <sbrivio@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 12, 2022 at 4:05 AM Laurent Vivier <lvivier@redhat.com> wrote:
>
> On 10/9/22 07:52, Jason Wang wrote:
> > On Thu, Oct 6, 2022 at 7:21 PM Michael S. Tsirkin <mst@redhat.com> wrot=
e:
> >>
> >> On Wed, Oct 05, 2022 at 06:20:34PM +0200, Laurent Vivier wrote:
> >>> "-netdev socket" only supports inet sockets.
> >>>
> >>> It's not a complex task to add support for unix sockets, but
> >>> the socket netdev parameters are not defined to manage well unix
> >>> socket parameters.
> >>
> >> Looks good.
> >>
> >> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> >>
> >> Belongs in Jason's tree.
> >
> > I've queued this series.
>
> I've found some minor problems. Could you queue incoming v11 instead?

Yes. Done.

Thanks

>
> Thanks,
> Laurent
>
> >
> > Thanks
> >
> >
> >>
> >>> As discussed in:
> >>>
> >>>    "socket.c added support for unix domain socket datagram transport"
> >>>    https://lore.kernel.org/qemu-devel/1C0E1BC5-904F-46B0-8044-68E43E6=
7BE60@gmail.com/
> >>>
> >>> This series adds support of unix socket type using SocketAddress QAPI=
 structure.
> >>>
> >>> Two new netdev backends, "stream" and "dgram" are added, that are bar=
ely a copy of "socket"
> >>> backend but they use the SocketAddress QAPI to provide socket paramet=
ers.
> >>> And then they also implement unix sockets (TCP and UDP).
> >>>
> >>> Some examples of CLI syntax:
> >>>
> >>>    for TCP:
> >>>
> >>>    -netdev stream,id=3Dsocket0,addr.type=3Dinet,addr.host=3Dlocalhost=
,addr.port=3D1234
> >>>    -netdev stream,id=3Dsocket0,server=3Doff,addr.type=3Dinet,addr.hos=
t=3Dlocalhost,addr.port=3D1234
> >>>
> >>>    -netdev dgram,id=3Dsocket0,\
> >>>            local.type=3Dinet,local.host=3Dlocalhost,local.port=3D1234=
,\
> >>>            remote.type=3Dinet,remote.host=3Dlocalhost,remote.port=3D1=
235
> >>>
> >>>    for UNIX:
> >>>
> >>>    -netdev stream,id=3Dsocket0,addr.type=3Dunix,addr.path=3D/tmp/qemu=
0
> >>>    -netdev stream,id=3Dsocket0,server=3Doff,addr.type=3Dunix,addr.pat=
h=3D/tmp/qemu0
> >>>
> >>>    -netdev dgram,id=3Dsocket0,\
> >>>            local.type=3Dunix,local.path=3D/tmp/qemu0,\
> >>>            remote.type=3Dunix,remote.path=3D/tmp/qemu1
> >>>
> >>>    for FD:
> >>>
> >>>    -netdev stream,id=3Dsocket0,addr.type=3Dfd,addr.str=3D4
> >>>    -netdev stream,id=3Dsocket0,server=3Doff,addr.type=3Dfd,addr.str=
=3D5
> >>>
> >>>    -netdev dgram,id=3Dsocket0,local.type=3Dfd,addr.str=3D4
> >>>
> >>> v10:
> >>>    - add Red Hat copyright
> >>>    - initialize dgram_dst to NULL in SOCKET_ADDRESS_TYPE_FD
> >>>    - remove redundente _stream / _dgram in functions name
> >>>    - move net_dgram_init() into net_init_dgram()
> >>>    - address Thomas' comments on qtest
> >>>    - add a function qemu_set_info_str() to set info string
> >>>    - tested stream netdev with fd type using qrap/passt and
> >>>      "-netdev stream,addr.type=3Dfd,server=3Doff,addr.str=3D5,id=3Dne=
tdev0"
> >>>
> >>> v9:
> >>>    - add events to report stream connection/disconnection
> >>>    - remove from net/dgram.c send_fn, listen_fd, net_dgram_accept()
> >>>      net_dgram_connect() and net_dgram_send() that are only
> >>>      needed by net/stream.c
> >>>    - remove from net/stream.c send_fn
> >>>    - add Red Hat copyright
> >>>    - add original net/socket.c Stefano's patch (EINVAL)
> >>>
> >>> v8:
> >>>    - test ipv4 and ipv6 parameters (stream inet)
> >>>    - test abstract parameter (stream unix)
> >>>    - add SocketAddressInet supported parameters in qemu-options.hx
> >>>      (only stream, supported by the move to QIO)
> >>>    - with qio_channel_writev() replace (ret =3D=3D -1 && errno =3D=3D=
 EAGAIN)
> >>>      by (ret =3D=3D QIO_CHANNEL_ERR_BLOCK)
> >>>
> >>> v7:
> >>>    - add qtests
> >>>    - update parameters table in net.json
> >>>    - update socket_uri() and socket_parse()
> >>>
> >>> v6:
> >>>    - s/netdev option/-netdev option/ PATCH 4
> >>>    - s/ / /
> >>>    - update @NetdevStreamOptions and @NetdevDgramOptions comments
> >>>    - update PATCH 4 description message
> >>>    - add missing return in error case for unix stream socket
> >>>    - split socket_uri() patch: move and rename, then change content
> >>>
> >>> v5:
> >>>    - remove RFC prefix
> >>>    - put the change of net_client_parse() into its own patch (exit() =
in the
> >>>      function)
> >>>    - update comments regarding netdev_is_modern() and netdev_parse_mo=
dern()
> >>>    - update error case in net_stream_server_init()
> >>>    - update qemu-options.hx with unix type
> >>>    - fix HMP "info network" with unix protocol/server side.
> >>>
> >>> v4:
> >>>    - net_client_parse() fails with exit() rather than with return.
> >>>    - keep "{ 'name': 'vmnet-host', 'if': 'CONFIG_VMNET' }" on its
> >>>      own line in qapi/net.json
> >>>    - add a comment in qapi/net.json about parameters usage
> >>>    - move netdev_is_modern() check to qemu_init()
> >>>    - in netdev_is_modern(), check for JSON and use qemu_opts_do_parse=
()
> >>>      to parse parameters and detect type value.
> >>>    - add a blank line after copyright comment
> >>>
> >>> v3:
> >>>    - remove support of "-net" for dgram and stream. They are only
> >>>      supported with "-netdev" option.
> >>>    - use &error_fatal directly in net_client_inits()
> >>>    - update qemu-options.hx
> >>>    - move to QIO for stream socket
> >>>
> >>> v2:
> >>>    - use "stream" and "dgram" rather than "socket-ng,mode=3Dstream"
> >>>      and ""socket-ng,mode=3Ddgram"
> >>>    - extract code to bypass qemu_opts_parse_noisily() to
> >>>      a new patch
> >>>    - do not ignore EINVAL (Stefano)
> >>>    - fix "-net" option
> >>>
> >>> CC: Ralph Schmieder <ralph.schmieder@gmail.com>
> >>> CC: Stefano Brivio <sbrivio@redhat.com>
> >>> CC: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> >>> CC: Markus Armbruster <armbru@redhat.com>
> >>>
> >>> Laurent Vivier (15):
> >>>    net: introduce convert_host_port()
> >>>    net: remove the @errp argument of net_client_inits()
> >>>    net: simplify net_client_parse() error management
> >>>    qapi: net: introduce a way to bypass qemu_opts_parse_noisily()
> >>>    net: introduce qemu_set_info_str() function
> >>>    qapi: net: add stream and dgram netdevs
> >>>    net: stream: add unix socket
> >>>    net: dgram: make dgram_dst generic
> >>>    net: dgram: move mcast specific code from net_socket_fd_init_dgram=
()
> >>>    net: dgram: add unix socket
> >>>    qemu-sockets: move and rename SocketAddress_to_str()
> >>>    qemu-sockets: update socket_uri() and socket_parse()  to be consis=
tent
> >>>    net: stream: move to QIO to enable additional parameters
> >>>    tests/qtest: netdev: test stream and dgram backends
> >>>    net: stream: add QAPI events to report connection state
> >>>
> >>> Stefano Brivio (2):
> >>>    net: socket: Don't ignore EINVAL on netdev socket connection
> >>>    net: stream: Don't ignore EINVAL on netdev socket connection
> >>>
> >>>   hmp-commands.hx             |   2 +-
> >>>   include/net/net.h           |   7 +-
> >>>   include/qemu/sockets.h      |   4 +-
> >>>   monitor/hmp-cmds.c          |  23 +-
> >>>   net/clients.h               |   6 +
> >>>   net/dgram.c                 | 622 +++++++++++++++++++++++++++++++++=
+++
> >>>   net/hub.c                   |   2 +
> >>>   net/l2tpv3.c                |   3 +-
> >>>   net/meson.build             |   2 +
> >>>   net/net.c                   | 186 ++++++++---
> >>>   net/slirp.c                 |   5 +-
> >>>   net/socket.c                |  36 +--
> >>>   net/stream.c                | 382 ++++++++++++++++++++++
> >>>   net/tap-win32.c             |   3 +-
> >>>   net/tap.c                   |  13 +-
> >>>   net/vde.c                   |   3 +-
> >>>   net/vhost-user.c            |   3 +-
> >>>   net/vhost-vdpa.c            |   2 +-
> >>>   qapi/net.json               | 108 ++++++-
> >>>   qemu-options.hx             |  14 +
> >>>   softmmu/vl.c                |  16 +-
> >>>   tests/qtest/meson.build     |   1 +
> >>>   tests/qtest/netdev-socket.c | 417 ++++++++++++++++++++++++
> >>>   util/qemu-sockets.c         |  25 ++
> >>>   24 files changed, 1757 insertions(+), 128 deletions(-)
> >>>   create mode 100644 net/dgram.c
> >>>   create mode 100644 net/stream.c
> >>>   create mode 100644 tests/qtest/netdev-socket.c
> >>>
> >>> --
> >>> 2.37.3
> >>>
> >>
> >
>


