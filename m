Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FCE57E6F2
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 21:02:36 +0200 (CEST)
Received: from localhost ([::1]:44796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oExv1-0002O9-5x
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 15:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oExpt-0002Vz-Pj
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 14:57:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oExpp-0008AZ-EZ
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 14:57:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658516231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=org5R1fbVZ9sjwUCLdC6TOoP2ve+SP+bMIKzqDW8NC4=;
 b=fDuaogsPT4hIXmxlRzbKbZ8rGaWftVA53/GFbASl+tnqY/aKq5xIh7KaoFt7C/5lNmwFbD
 7YA0KQf7ozKPExb8oN7jCiMWtJgvQtGwUCOZ+VacFLqwnmLwrH1ebebNt/b4gwOoXUynkz
 ptZlJM5TuVNi62k11LjGFJLbAb2u73s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-zcsi9-czOz-eCt5cNU-luQ-1; Fri, 22 Jul 2022 14:57:04 -0400
X-MC-Unique: zcsi9-czOz-eCt5cNU-luQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75504101A58E;
 Fri, 22 Jul 2022 18:57:04 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.194.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 761582026D64;
 Fri, 22 Jul 2022 18:57:02 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Ralph Schmieder <ralph.schmieder@gmail.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v6 00/14] qapi: net: add unix socket type support to netdev
 backend
Date: Fri, 22 Jul 2022 20:56:47 +0200
Message-Id: <20220722185701.300449-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"-netdev socket" only supports inet sockets.

It's not a complex task to add support for unix sockets, but
the socket netdev parameters are not defined to manage well unix
socket parameters.

As discussed in:

  "socket.c added support for unix domain socket datagram transport"
  https://lore.kernel.org/qemu-devel/1C0E1BC5-904F-46B0-8044-68E43E67BE60@gmail.com/

This series adds support of unix socket type using SocketAddress QAPI structure.

Two new netdev backends, "stream" and "dgram" are added, that are barely a copy of "socket"
backend but they use the SocketAddress QAPI to provide socket parameters.
And then they also implement unix sockets (TCP and UDP).

Some examples of CLI syntax:

  for TCP:

  -netdev stream,id=socket0,addr.type=inet,addr.host=localhost,addr.port=1234
  -netdev stream,id=socket0,server=off,addr.type=inet,addr.host=localhost,addr.port=1234

  -netdev dgram,id=socket0,\
          local.type=inet,local.host=localhost,local.port=1234,\
          remote.type=inet,remote.host=localhost,remote.port=1235

  for UNIX:

  -netdev stream,id=socket0,addr.type=unix,addr.path=/tmp/qemu0
  -netdev stream,id=socket0,server=off,addr.type=unix,addr.path=/tmp/qemu0

  -netdev dgram,id=socket0,\
          local.type=unix,local.path=/tmp/qemu0,\
          remote.type=unix,remote.path=/tmp/qemu1

  for FD:

  -netdev stream,id=socket0,addr.type=fd,addr.str=4
  -netdev stream,id=socket0,server=off,addr.type=fd,addr.str=5

  -netdev dgram,id=socket0,local.type=fd,addr.str=4

v7:
  - add qtests
  - update parameters table in net.json
  - update socket_uri() and socket_parse()

v6:
  - s/netdev option/-netdev option/ PATCH 4
  - s/ / /
  - update @NetdevStreamOptions and @NetdevDgramOptions comments
  - update PATCH 4 description message
  - add missing return in error case for unix stream socket
  - split socket_uri() patch: move and rename, then change content

v5:
  - remove RFC prefix
  - put the change of net_client_parse() into its own patch (exit() in the
    function)
  - update comments regarding netdev_is_modern() and netdev_parse_modern()
  - update error case in net_stream_server_init()
  - update qemu-options.hx with unix type
  - fix HMP "info network" with unix protocol/server side.

v4:
  - net_client_parse() fails with exit() rather than with return.
  - keep "{ 'name': 'vmnet-host', 'if': 'CONFIG_VMNET' }" on its
    own line in qapi/net.json
  - add a comment in qapi/net.json about parameters usage
  - move netdev_is_modern() check to qemu_init()
  - in netdev_is_modern(), check for JSON and use qemu_opts_do_parse()
    to parse parameters and detect type value.
  - add a blank line after copyright comment

v3:
  - remove support of "-net" for dgram and stream. They are only
    supported with "-netdev" option.
  - use &error_fatal directly in net_client_inits()
  - update qemu-options.hx
  - move to QIO for stream socket

v2:
  - use "stream" and "dgram" rather than "socket-ng,mode=stream"
    and ""socket-ng,mode=dgram"
  - extract code to bypass qemu_opts_parse_noisily() to
    a new patch
  - do not ignore EINVAL (Stefano)
  - fix "-net" option

CC: Ralph Schmieder <ralph.schmieder@gmail.com>
CC: Stefano Brivio <sbrivio@redhat.com>
CC: Daniel P. Berrangé <berrange@redhat.com>
CC: Markus Armbruster <armbru@redhat.com>

Laurent Vivier (13):
  net: introduce convert_host_port()
  net: remove the @errp argument of net_client_inits()
  net: simplify net_client_parse() error management
  qapi: net: introduce a way to bypass qemu_opts_parse_noisily()
  qapi: net: add stream and dgram netdevs
  net: stream: add unix socket
  net: dgram: make dgram_dst generic
  net: dgram: move mcast specific code from net_socket_fd_init_dgram()
  net: dgram: add unix socket
  qemu-sockets: move and rename SocketAddress_to_str()
  qemu-sockets: update socket_uri() and socket_parse()  to be consistent
  net: stream: move to QIO
  tests/qtest: netdev: test stream and dgram backends

Stefano Brivio (1):
  net: stream: Don't ignore EINVAL on netdev socket connection

 hmp-commands.hx             |   2 +-
 include/net/net.h           |   6 +-
 include/qemu/sockets.h      |   4 +-
 monitor/hmp-cmds.c          |  23 +-
 net/clients.h               |   6 +
 net/dgram.c                 | 707 ++++++++++++++++++++++++++++++++++++
 net/hub.c                   |   2 +
 net/meson.build             |   2 +
 net/net.c                   | 169 ++++++---
 net/stream.c                | 376 +++++++++++++++++++
 qapi/net.json               |  63 +++-
 qemu-options.hx             |  14 +
 softmmu/vl.c                |  16 +-
 tests/qtest/meson.build     |   1 +
 tests/qtest/netdev-socket.c | 322 ++++++++++++++++
 util/qemu-sockets.c         |  25 ++
 16 files changed, 1656 insertions(+), 82 deletions(-)
 create mode 100644 net/dgram.c
 create mode 100644 net/stream.c
 create mode 100644 tests/qtest/netdev-socket.c

-- 
2.37.1


