Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B456B7681
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 12:47:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbgdp-0001Qr-3b; Mon, 13 Mar 2023 07:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbgdl-0001LL-0m
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:46:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbgdi-0004M6-TR
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:46:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678708014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mYVaCfDmSVdAQhS4caD8YWYja+G2AIglwDi8TYDOGe8=;
 b=PjGXxdRS+C6rpdCouV1XNvmvBRZWB5KRH3EboqoH6aZwl27t0vtpFMnLTj0lyuGP3J0FmH
 wHNmPqh+4iNGrqjzJYy7x65nKHOjq/uyjHLZViBQY4szutQSuQMsURjvFdZNRyW3LHXG/A
 fuOs0/sMSVMll2CBZoIbYmjmySahn5E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-231-bEWGCRv5OgWjODrLU0oFwA-1; Mon, 13 Mar 2023 07:46:53 -0400
X-MC-Unique: bEWGCRv5OgWjODrLU0oFwA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20B8A1C04182;
 Mon, 13 Mar 2023 11:46:52 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6EA047507A;
 Mon, 13 Mar 2023 11:46:50 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Thomas Huth <thuth@redhat.com>, Fam Zheng <fam@euphon.net>,
 Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PULL v2 00/25] Win socket patches
Date: Mon, 13 Mar 2023 15:46:23 +0400
Message-Id: <20230313114648.426607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The following changes since commit 29c8a9e31a982874ce4e2c15f2bf82d5f8dc3517:

  Merge tag 'linux-user-for-8.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2023-03-12 10:57:00 +0000)

are available in the Git repository at:

  https://gitlab.com/marcandre.lureau/qemu.git tags/win-socket-pull-request

for you to fetch changes up to 4bf21c7f748bee42b6f4692f8c37a11d1033b2d1:

  monitor: restrict command getfd to POSIX hosts (2023-03-13 15:46:09 +0400)

----------------------------------------------------------------
QMP command to import win32 sockets

----------------------------------------------------------------

Marc-André Lureau (25):
  util: drop qemu_fork()
  tests: use closesocket()
  io: use closesocket()
  tests: add test-error-report
  error: add global &error_warn destination
  win32/socket: introduce qemu_socket_select() helper
  win32/socket: introduce qemu_socket_unselect() helper
  aio: make aio_set_fd_poll() static to aio-posix.c
  aio/win32: aio_set_fd_handler() only supports SOCKET
  main-loop: remove qemu_fd_register(), win32/slirp/socket specific
  slirp: unregister the win32 SOCKET
  slirp: open-code qemu_socket_(un)select()
  win32: avoid mixing SOCKET and file descriptor space
  os-posix: remove useless ioctlsocket() define
  win32: replace closesocket() with close() wrapper
  tests: fix path separator, use g_build_filename()
  char: do not double-close fd when failing to add client
  tests/docker: fix a win32 error due to portability
  osdep: implement qemu_socketpair() for win32
  qmp: 'add_client' actually expects sockets
  monitor: release the lock before calling close()
  qmp: add 'get-win32-socket'
  libqtest: make qtest_qmp_add_client work on win32
  qtest: enable vnc-display test on win32
  monitor: restrict command getfd to POSIX hosts

 qapi/misc.json                       |  36 ++-
 include/block/aio.h                  |   8 -
 include/qapi/error.h                 |   6 +
 include/qemu/main-loop.h             |   2 -
 include/qemu/osdep.h                 |  14 --
 include/qemu/sockets.h               |   2 -
 include/sysemu/os-posix.h            |   3 -
 include/sysemu/os-win32.h            |  15 +-
 tests/qtest/libqtest.h               |   5 +-
 backends/tpm/tpm_emulator.c          |   6 +-
 chardev/char.c                       |   2 -
 crypto/afalg.c                       |   6 +-
 hw/hyperv/syndbg.c                   |   4 +-
 io/channel-socket.c                  |   8 +-
 io/channel-watch.c                   |  10 +-
 monitor/fds.c                        |  77 ++++--
 monitor/hmp-cmds.c                   |   2 +
 monitor/qmp-cmds.c                   |   7 +
 net/dgram.c                          |  14 +-
 net/slirp.c                          |  16 +-
 net/socket.c                         |  22 +-
 tests/qtest/libqtest.c               |  26 +-
 tests/qtest/microbit-test.c          |   2 +-
 tests/qtest/netdev-socket.c          |  10 +-
 tests/qtest/vnc-display-test.c       |  12 +-
 tests/unit/socket-helpers.c          |   2 +-
 tests/unit/test-error-report.c       | 139 +++++++++++
 tests/unit/test-io-channel-command.c |   2 +-
 util/aio-posix.c                     |   6 +-
 util/aio-win32.c                     |  23 +-
 util/error.c                         |  10 +-
 util/main-loop.c                     |  11 -
 util/oslib-posix.c                   |  70 ------
 util/oslib-win32.c                   | 350 ++++++++++++++++++++++++---
 util/qemu-sockets.c                  |  22 +-
 hmp-commands.hx                      |   2 +
 tests/docker/docker.py               |   6 +-
 tests/unit/meson.build               |   1 +
 38 files changed, 701 insertions(+), 258 deletions(-)
 create mode 100644 tests/unit/test-error-report.c

-- 
2.39.2


