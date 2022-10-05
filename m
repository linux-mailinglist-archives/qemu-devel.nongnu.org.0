Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D264C5F586C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 18:39:01 +0200 (CEST)
Received: from localhost ([::1]:42322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og7QC-0006H6-Vn
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 12:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1og78y-0007Eq-Rg
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 12:21:12 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:59831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1og78u-0002nN-6d
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 12:21:11 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N3bb3-1pOHUi26vD-010ZWj; Wed, 05 Oct 2022 18:20:55 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jason Wang <jasowang@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Ralph Schmieder <ralph.schmieder@gmail.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v10 00/17] qapi: net: add unix socket type support to netdev
 backend
Date: Wed,  5 Oct 2022 18:20:34 +0200
Message-Id: <20221005162051.1120041-1-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:O580/RkVRr+Gvxyl22mKEmiikwC+eeD9F+WAOhAGUjPGXHeccAi
 PnaFZc1TgGEsphAb2vYEczzf9RD4STthyheuiKNh+PFRLqhAQ0eb+e/xHhXWPLY3f8ROdE4
 EnhvWwmXRH0eliEPxNYSR0Vh2fe/kFghV0ujkf7EvKezrfEG7kLp2epGGePFZZBTreGtyTP
 HxkfpKlCZ57ztOwXQctdQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JGsC6Z8yVog=:WA9soh8t9JnMFdyJVnmVXd
 sCkkY/LOeguVipqXEIu9vgO0DdEwGLPFXT+L/hAUsdbsiGhUvLp1ax4+kcR4hbLwYUjzHEMsJ
 D8HWO/2G1fci4Jbw6WPfJjmFPi07bnMU1pplPSMhsRi0fp/QchRHZdSCgIKgEQRRvxkYITwNa
 1XFpgnEU+UXxbvBQtofds4M6GsEz7oidwpa9XZmACuA2G64KN25V2j5smR6s/oq1k0+CwC+2v
 k5Au//xNDFvwozLaOChqvev9aHMWfgNY2p6EwbPEwnpQmE//7YqK7zt6peJ3pPQseZ/t8uMW1
 m8TQXOFgKy1dRZnZUTTTJIKN//iP+/VI5WLwvbhugnyi+pFFu0/r2pEozh0IhDf8k8hisvzAO
 Y9wLaH5uwR1fCdTbZpcXjHsDYvp2KGgi39VHM1uxRtWZjY0nmLeC2EBfLEcs11NXw4Pi4fgbm
 LeERCTkszQBQHgADY7EhCriqfM7A4rrkQyTiFKxdRWPm9x1y7gqo/Pnf7tnju71zErw5Vq7gK
 Hivl93zbP0++MT17jFfk7IMFWDMPoMOkuBJisMXnsSzCaSAVVJhu9AT8niY7p0O7EG5FV1hNd
 lpLoNUjWqJvU+WSHOWuYb2hBB7jhLa7emCfre/vjrMupP0DMNCHdfZ19+xJPXJryE708Nbeoq
 Obq3drrSa3PvZGheRJxyQ/XCsRt8UwR6PFXyF9wbsdlDRysATETMzMHOfHYZ/NvyBz8eW/QE8
 cXG8ghzyWA0fyYJQfnqpNcV2UoGnBCneE/fJ6P707QB4yKSkUeuS0G+u3MHPT3+jAnq+otaz6
 kt93YP9
Received-SPF: permerror client-ip=217.72.192.75;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_FAIL=0.001, SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
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

"-netdev socket" only supports inet sockets.=0D
=0D
It's not a complex task to add support for unix sockets, but=0D
the socket netdev parameters are not defined to manage well unix=0D
socket parameters.=0D
=0D
As discussed in:=0D
=0D
  "socket.c added support for unix domain socket datagram transport"=0D
  https://lore.kernel.org/qemu-devel/1C0E1BC5-904F-46B0-8044-68E43E67BE60@g=
mail.com/=0D
=0D
This series adds support of unix socket type using SocketAddress QAPI struc=
ture.=0D
=0D
Two new netdev backends, "stream" and "dgram" are added, that are barely a =
copy of "socket"=0D
backend but they use the SocketAddress QAPI to provide socket parameters.=0D
And then they also implement unix sockets (TCP and UDP).=0D
=0D
Some examples of CLI syntax:=0D
=0D
  for TCP:=0D
=0D
  -netdev stream,id=3Dsocket0,addr.type=3Dinet,addr.host=3Dlocalhost,addr.p=
ort=3D1234=0D
  -netdev stream,id=3Dsocket0,server=3Doff,addr.type=3Dinet,addr.host=3Dloc=
alhost,addr.port=3D1234=0D
=0D
  -netdev dgram,id=3Dsocket0,\=0D
          local.type=3Dinet,local.host=3Dlocalhost,local.port=3D1234,\=0D
          remote.type=3Dinet,remote.host=3Dlocalhost,remote.port=3D1235=0D
=0D
  for UNIX:=0D
=0D
  -netdev stream,id=3Dsocket0,addr.type=3Dunix,addr.path=3D/tmp/qemu0=0D
  -netdev stream,id=3Dsocket0,server=3Doff,addr.type=3Dunix,addr.path=3D/tm=
p/qemu0=0D
=0D
  -netdev dgram,id=3Dsocket0,\=0D
          local.type=3Dunix,local.path=3D/tmp/qemu0,\=0D
          remote.type=3Dunix,remote.path=3D/tmp/qemu1=0D
=0D
  for FD:=0D
=0D
  -netdev stream,id=3Dsocket0,addr.type=3Dfd,addr.str=3D4=0D
  -netdev stream,id=3Dsocket0,server=3Doff,addr.type=3Dfd,addr.str=3D5=0D
=0D
  -netdev dgram,id=3Dsocket0,local.type=3Dfd,addr.str=3D4=0D
=0D
v10:=0D
  - add Red Hat copyright=0D
  - initialize dgram_dst to NULL in SOCKET_ADDRESS_TYPE_FD=0D
  - remove redundente _stream / _dgram in functions name=0D
  - move net_dgram_init() into net_init_dgram()=0D
  - address Thomas' comments on qtest=0D
  - add a function qemu_set_info_str() to set info string=0D
  - tested stream netdev with fd type using qrap/passt and=0D
    "-netdev stream,addr.type=3Dfd,server=3Doff,addr.str=3D5,id=3Dnetdev0"=
=0D
=0D
v9:=0D
  - add events to report stream connection/disconnection=0D
  - remove from net/dgram.c send_fn, listen_fd, net_dgram_accept()=0D
    net_dgram_connect() and net_dgram_send() that are only=0D
    needed by net/stream.c=0D
  - remove from net/stream.c send_fn=0D
  - add Red Hat copyright=0D
  - add original net/socket.c Stefano's patch (EINVAL)=0D
=0D
v8:=0D
  - test ipv4 and ipv6 parameters (stream inet)=0D
  - test abstract parameter (stream unix)=0D
  - add SocketAddressInet supported parameters in qemu-options.hx=0D
    (only stream, supported by the move to QIO)=0D
  - with qio_channel_writev() replace (ret =3D=3D -1 && errno =3D=3D EAGAIN=
)=0D
    by (ret =3D=3D QIO_CHANNEL_ERR_BLOCK)=0D
=0D
v7:=0D
  - add qtests=0D
  - update parameters table in net.json=0D
  - update socket_uri() and socket_parse()=0D
=0D
v6:=0D
  - s/netdev option/-netdev option/ PATCH 4=0D
  - s/=C2=A0/ /=0D
  - update @NetdevStreamOptions and @NetdevDgramOptions comments=0D
  - update PATCH 4 description message=0D
  - add missing return in error case for unix stream socket=0D
  - split socket_uri() patch: move and rename, then change content=0D
=0D
v5:=0D
  - remove RFC prefix=0D
  - put the change of net_client_parse() into its own patch (exit() in the=
=0D
    function)=0D
  - update comments regarding netdev_is_modern() and netdev_parse_modern()=
=0D
  - update error case in net_stream_server_init()=0D
  - update qemu-options.hx with unix type=0D
  - fix HMP "info network" with unix protocol/server side.=0D
=0D
v4:=0D
  - net_client_parse() fails with exit() rather than with return.=0D
  - keep "{ 'name': 'vmnet-host', 'if': 'CONFIG_VMNET' }" on its=0D
    own line in qapi/net.json=0D
  - add a comment in qapi/net.json about parameters usage=0D
  - move netdev_is_modern() check to qemu_init()=0D
  - in netdev_is_modern(), check for JSON and use qemu_opts_do_parse()=0D
    to parse parameters and detect type value.=0D
  - add a blank line after copyright comment=0D
=0D
v3:=0D
  - remove support of "-net" for dgram and stream. They are only=0D
    supported with "-netdev" option.=0D
  - use &error_fatal directly in net_client_inits()=0D
  - update qemu-options.hx=0D
  - move to QIO for stream socket=0D
=0D
v2:=0D
  - use "stream" and "dgram" rather than "socket-ng,mode=3Dstream"=0D
    and ""socket-ng,mode=3Ddgram"=0D
  - extract code to bypass qemu_opts_parse_noisily() to=0D
    a new patch=0D
  - do not ignore EINVAL (Stefano)=0D
  - fix "-net" option=0D
=0D
CC: Ralph Schmieder <ralph.schmieder@gmail.com>=0D
CC: Stefano Brivio <sbrivio@redhat.com>=0D
CC: Daniel P. Berrang=C3=A9 <berrange@redhat.com>=0D
CC: Markus Armbruster <armbru@redhat.com>=0D
=0D
Laurent Vivier (15):=0D
  net: introduce convert_host_port()=0D
  net: remove the @errp argument of net_client_inits()=0D
  net: simplify net_client_parse() error management=0D
  qapi: net: introduce a way to bypass qemu_opts_parse_noisily()=0D
  net: introduce qemu_set_info_str() function=0D
  qapi: net: add stream and dgram netdevs=0D
  net: stream: add unix socket=0D
  net: dgram: make dgram_dst generic=0D
  net: dgram: move mcast specific code from net_socket_fd_init_dgram()=0D
  net: dgram: add unix socket=0D
  qemu-sockets: move and rename SocketAddress_to_str()=0D
  qemu-sockets: update socket_uri() and socket_parse()  to be consistent=0D
  net: stream: move to QIO to enable additional parameters=0D
  tests/qtest: netdev: test stream and dgram backends=0D
  net: stream: add QAPI events to report connection state=0D
=0D
Stefano Brivio (2):=0D
  net: socket: Don't ignore EINVAL on netdev socket connection=0D
  net: stream: Don't ignore EINVAL on netdev socket connection=0D
=0D
 hmp-commands.hx             |   2 +-=0D
 include/net/net.h           |   7 +-=0D
 include/qemu/sockets.h      |   4 +-=0D
 monitor/hmp-cmds.c          |  23 +-=0D
 net/clients.h               |   6 +=0D
 net/dgram.c                 | 622 ++++++++++++++++++++++++++++++++++++=0D
 net/hub.c                   |   2 +=0D
 net/l2tpv3.c                |   3 +-=0D
 net/meson.build             |   2 +=0D
 net/net.c                   | 186 ++++++++---=0D
 net/slirp.c                 |   5 +-=0D
 net/socket.c                |  36 +--=0D
 net/stream.c                | 382 ++++++++++++++++++++++=0D
 net/tap-win32.c             |   3 +-=0D
 net/tap.c                   |  13 +-=0D
 net/vde.c                   |   3 +-=0D
 net/vhost-user.c            |   3 +-=0D
 net/vhost-vdpa.c            |   2 +-=0D
 qapi/net.json               | 108 ++++++-=0D
 qemu-options.hx             |  14 +=0D
 softmmu/vl.c                |  16 +-=0D
 tests/qtest/meson.build     |   1 +=0D
 tests/qtest/netdev-socket.c | 417 ++++++++++++++++++++++++=0D
 util/qemu-sockets.c         |  25 ++=0D
 24 files changed, 1757 insertions(+), 128 deletions(-)=0D
 create mode 100644 net/dgram.c=0D
 create mode 100644 net/stream.c=0D
 create mode 100644 tests/qtest/netdev-socket.c=0D
=0D
-- =0D
2.37.3=0D
=0D

