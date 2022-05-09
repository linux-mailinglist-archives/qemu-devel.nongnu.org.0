Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEE65203AF
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 19:42:17 +0200 (CEST)
Received: from localhost ([::1]:43448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no7Oi-0001L2-Df
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 13:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1no7J8-00071h-2Q
 for qemu-devel@nongnu.org; Mon, 09 May 2022 13:36:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1no7J4-00011i-KS
 for qemu-devel@nongnu.org; Mon, 09 May 2022 13:36:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652117784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0lo6bl60m64AXdi6oIaFOUys1Sjj6ocC/pD4CRCqhNs=;
 b=B/yo0v/lteQRTKI10bDrUokD/xAJixEdzLietUZ3B6V8yQKhBBfDOylmI1W6fl6tq8+7FU
 kKfGu5Qk4gLsojmcyuQMcSyiO1Y2iCPc32hnkfiDLeAzbQufOqgySa/s3QcEExxGiK7b+q
 fmCyahuMSA6qi8AHK08ubcE9ms6z20I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-PQj-HV60MaWSV1jht7dgOA-1; Mon, 09 May 2022 13:36:21 -0400
X-MC-Unique: PQj-HV60MaWSV1jht7dgOA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A7DD29AB3FD;
 Mon,  9 May 2022 17:36:21 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.194.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC2E140CF8EC;
 Mon,  9 May 2022 17:36:19 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Ralph Schmieder <ralph.schmieder@gmail.com>,
 Stefano Brivio <sbrivio@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [RFC PATCH 0/6] qapi: net: add unix socket type support to netdev
 backend
Date: Mon,  9 May 2022 19:36:12 +0200
Message-Id: <20220509173618.467207-1-lvivier@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
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

"-netdev socket" only supports inet sockets.

It's not a complex task to add support for unix sockets, but
the socket netdev parameters are not defined to manage well unix
socket parameters.

As discussed in:

  "socket.c added support for unix domain socket datagram transport"
  https://lore.kernel.org/qemu-devel/1C0E1BC5-904F-46B0-8044-68E43E67BE60@gmail.com/

This series adds support of unix socket type using SocketAddress QAPI structure.

A new netdev backend "socket-ng" is added, that is barely a copy of "socket"
backend but it uses the SocketAddress QAPI to provide socket parameters.
And then it also implement unix sockets (TCP and UDP).

Some examples of CLI syntax:

  for TCP:

  -netdev socket-ng,id=socket0,mode=server,addr.type=inet,addr.host=localhost,addr.port=1234
  -netdev socket-ng,id=socket0,mode=client,addr.type=inet,addr.host=localhost,addr.port=1234

  -netdev socket-ng,id=socket0,mode=dgram,\
          local.type=inet,local.host=localhost,local.port=1234,\
          remote.type=inet,remote.host=localhost,remote.port=1235

  for UNIX:

  -netdev socket-ng,id=socket0,mode=server,addr.type=unix,addr.path=/tmp/qemu0
  -netdev socket-ng,id=socket0,mode=client,addr.type=unix,addr.path=/tmp/qemu0

  -netdev socket-ng,id=socket0,mode=dgram,\
          local.type=unix,local.path=/tmp/qemu0,\
          remote.type=unix,remote.path=/tmp/qemu1

  for FD:

  -netdev socket-ng,id=socket0,mode=server,addr.type=fd,addr.str=4
  -netdev socket-ng,id=socket0,mode=client,addr.type=fd,addr.str=5

  -netdev socket-ng,id=socket0,mode=dgram,local.type=fd,addr.str=4

CC: Ralph Schmieder <ralph.schmieder@gmail.com>
CC: Stefano Brivio <sbrivio@redhat.com>
CC: Daniel P. Berrangé <berrange@redhat.com>
CC: Markus Armbruster <armbru@redhat.com>

Laurent Vivier (6):
  net: introduce convert_host_port()
  qapi: net: add socket-ng netdev
  net: socket-ng: add unix socket for server and client mode.
  net: socket-ng: make dgram_dst generic
  net: socket-ng: move mcast specific code from
    net_socket_fd_init_dgram()
  net: socket-ng: add unix socket for dgram mode

 hmp-commands.hx        |    2 +-
 include/qemu/sockets.h |    2 +
 net/clients.h          |    3 +
 net/hub.c              |    1 +
 net/meson.build        |    1 +
 net/net.c              |  123 +++--
 net/socket-ng.c        | 1060 ++++++++++++++++++++++++++++++++++++++++
 qapi/net.json          |   41 +-
 8 files changed, 1200 insertions(+), 33 deletions(-)
 create mode 100644 net/socket-ng.c

-- 
2.35.3


