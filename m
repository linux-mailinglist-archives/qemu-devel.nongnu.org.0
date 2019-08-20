Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D7695C93
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 12:50:44 +0200 (CEST)
Received: from localhost ([::1]:35946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i01is-0007Nm-WD
	for lists+qemu-devel@lfdr.de; Tue, 20 Aug 2019 06:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48662)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1i01h5-0005jS-Jz
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 06:48:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1i01h4-0004WL-As
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 06:48:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47012)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>)
 id 1i01h1-0004Tj-Vt; Tue, 20 Aug 2019 06:48:48 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 497C7898106;
 Tue, 20 Aug 2019 10:48:47 +0000 (UTC)
Received: from secure.mitica (unknown [10.36.118.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DF475D9CD;
 Tue, 20 Aug 2019 10:48:37 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 20 Aug 2019 12:48:31 +0200
Message-Id: <20190820104836.3093-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Tue, 20 Aug 2019 10:48:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 0/5] Fix multifd with big number of channels
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

In this version:
- updated to latest upstream
- moved trace to suggested position (danp)

Please review.

Later, Juan.


Juan Quintela (5):
  socket: Add backlog parameter to socket_listen
  socket: Add num connections to qio_channel_socket_sync()
  socket: Add num connections to qio_channel_socket_async()
  socket: Add num connections to qio_net_listener_open_sync()
  multifd: Use number of channels as listen backlog

 blockdev-nbd.c                 |  2 +-
 chardev/char-socket.c          |  2 +-
 include/io/channel-socket.h    |  4 ++++
 include/io/net-listener.h      |  2 ++
 include/qemu/sockets.h         |  2 +-
 io/channel-socket.c            | 35 +++++++++++++++++++++++++---------
 io/net-listener.c              |  3 ++-
 io/trace-events                |  4 ++--
 migration/socket.c             |  7 ++++++-
 qemu-nbd.c                     |  2 +-
 qga/channel-posix.c            |  2 +-
 scsi/qemu-pr-helper.c          |  3 ++-
 tests/test-char.c              |  4 ++--
 tests/test-io-channel-socket.c |  4 ++--
 tests/test-util-sockets.c      | 12 ++++++------
 tests/tpm-emu.c                |  2 +-
 ui/vnc.c                       |  4 ++--
 util/qemu-sockets.c            | 33 +++++++++++++++++++++-----------
 util/trace-events              |  3 +++
 19 files changed, 87 insertions(+), 43 deletions(-)

--=20
2.21.0


