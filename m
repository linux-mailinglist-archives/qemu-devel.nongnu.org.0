Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B9055BAF3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 18:06:18 +0200 (CEST)
Received: from localhost ([::1]:32770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5rFh-0001G3-PI
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 12:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o5qy0-0001ZT-7O
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 11:48:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o5qxx-0005gv-CQ
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 11:47:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656344875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZhwmbcvAms6yittYo9NX9W0p+TqlrrZjyyV/Vai8yc0=;
 b=AQMvTMw1VG1RWIhr5iMPswd5d/OH7CU2I+udxC9jKTjDBZEF3DJ8cHYxAx7QlGifGDmWg9
 ET/eb+iYUTV6y1MuV3ees8hMw57vdxWfxqDjD5JvvT1CJkFWg/A2b55dkTVrxdAucsx+iF
 gnWtsONKBYtK/FN5d71wekI4ge1+d9I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-c6x8XrUQNwGPelMhNtDDcw-1; Mon, 27 Jun 2022 11:47:54 -0400
X-MC-Unique: c6x8XrUQNwGPelMhNtDDcw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B8F13C0F361;
 Mon, 27 Jun 2022 15:47:54 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.194.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 412662166B26;
 Mon, 27 Jun 2022 15:47:51 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Ralph Schmieder <ralph.schmieder@gmail.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v5 00/12] qapi: net: add unix socket type support to netdev
 backend
Date: Mon, 27 Jun 2022 17:47:37 +0200
Message-Id: <20220627154749.871943-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

v5:
  - remove RFC prefix
  - put the change of net_client_parse() into its own patch (exit() in the
    function)
  - update comments regarding netdev_is_modern() and netdev_parse_modern()
  - update error case in net_stream_server_init()
  - update qemu-options.hx with unix type

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

Laurent Vivier (11):
  net: introduce convert_host_port()
  net: remove the @errp argument of net_client_inits()
  net: simplify net_client_parse() error management
  qapi: net: introduce a way to bypass qemu_opts_parse_noisily()
  qapi: net: add stream and dgram netdevs
  net: stream: add unix socket
  net: dgram: make dgram_dst generic
  net: dgram: move mcast specific code from net_socket_fd_init_dgram()
  net: dgram: add unix socket
  qemu-sockets: introduce socket_uri()
  net: stream: move to QIO

Stefano Brivio (1):
  net: stream: Don't ignore EINVAL on netdev socket connection

 hmp-commands.hx        |   2 +-
 include/net/net.h      |   6 +-
 include/qemu/sockets.h |   4 +-
 monitor/hmp-cmds.c     |  23 +-
 net/clients.h          |   6 +
 net/dgram.c            | 707 +++++++++++++++++++++++++++++++++++++++++
 net/hub.c              |   2 +
 net/meson.build        |   2 +
 net/net.c              | 169 +++++++---
 net/stream.c           | 372 ++++++++++++++++++++++
 qapi/net.json          |  44 ++-
 qemu-options.hx        |  14 +
 softmmu/vl.c           |  16 +-
 util/qemu-sockets.c    |  20 ++
 14 files changed, 1305 insertions(+), 82 deletions(-)
 create mode 100644 net/dgram.c
 create mode 100644 net/stream.c

-- 
2.36.1


