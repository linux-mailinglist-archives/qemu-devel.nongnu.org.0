Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7985369E0BF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 13:49:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUS49-0004rX-Fp; Tue, 21 Feb 2023 07:48:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS44-0004pj-RE
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:48:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS42-0007nP-Md
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:48:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676983690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TJAvStjeyfXY7Fqu+f5Kq0t0UxLLT01gyELlytjqWtc=;
 b=fSn4rBMaERCbF1aghewmKLIFp8sqDy0MADxN68AHr1wgeEK19fwSHHnIjSuAs6fVzo4mud
 2O6Gu0TZyBp+Azr4ZJLnsvs6OEIPFhrrL0X6DzWNDEV5nsEtaHM1FQUZcJtVoXFCO9FU8e
 DfOkrJ4buwi/IvuJy77/zJ9WxN6IUXI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-zI2oH7CjPL2ggYhvDzIxUA-1; Tue, 21 Feb 2023 07:48:07 -0500
X-MC-Unique: zI2oH7CjPL2ggYhvDzIxUA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A4D385CBF4;
 Tue, 21 Feb 2023 12:48:06 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C80A5440D9;
 Tue, 21 Feb 2023 12:48:04 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, armbru@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 00/16] win32: do not mix SOCKET and fd space
Date: Tue, 21 Feb 2023 16:47:45 +0400
Message-Id: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124;
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

Hi,

A win32 SOCKET handle is often cast to an int file descriptor, as this is what
other OS use for sockets. When necessary, QEMU eventually queries whether it's a
socket with the help of fd_is_socket(). However, there is no guarantee of
conflict between the fd and SOCKET space. Such conflict would have surprising
consequences. We can fix this by using FDs only.

After fixing a few missed closesocket(), this patch series makes the win32
socket API wrappers take FDs. It finally get rid of closesocket() usage by using
a close() wrapper instead. (note that fdopen/fclose would not be enough either
to close the underlying socket appropriately)

v3:
- fix closesocket() to prevent CloseHandle() from close()
- fix direct closesocket() usage (#undef closesocket before)
- add a test for &error_warn
- add r-b tags

v2:
- add clean up patch "util: drop qemu_fork()"
- add a "&error_warn", to help with basic error reporting
- fix errno handling after _get_osfhandle()
- introduce qemu_socket_(un)select() helpers
- add patch "aio_set_fd_handler() only supports SOCKET"
- add meson slirp.wrap RFC
- various misc cleanups
- add r-b tags

Marc-André Lureau (16):
  util: drop qemu_fork()
  tests: use closesocket()
  io: use closesocket()
  tests: add test-error-report
  error: add global &error_warn destination
  win32/socket: introduce qemu_socket_select() helper
  win32/socket: introduce qemu_socket_unselect() helper
  aio: make aio_set_fd_poll() static to aio-posix.c
  aio/win32: aio_set_fd_handler() only supports SOCKET
  RFC: build-sys: add slirp.wrap
  main-loop: remove qemu_fd_register(), win32/slirp/socket specific
  slirp: unregister the win32 SOCKET
  slirp: open-code qemu_socket_(un)select()
  win32: avoid mixing SOCKET and file descriptor space
  os-posix: remove useless ioctlsocket() define
  win32: replace closesocket() with close() wrapper

 include/block/aio.h            |   8 --
 include/qapi/error.h           |   6 +
 include/qemu/main-loop.h       |   2 -
 include/qemu/osdep.h           |  14 --
 include/sysemu/os-posix.h      |   3 -
 include/sysemu/os-win32.h      |  15 ++-
 backends/tpm/tpm_emulator.c    |   6 +-
 crypto/afalg.c                 |   6 +-
 hw/hyperv/syndbg.c             |   4 +-
 io/channel-socket.c            |   8 +-
 io/channel-watch.c             |  10 +-
 net/dgram.c                    |  14 +-
 net/slirp.c                    |  16 ++-
 net/socket.c                   |  22 +--
 tests/qtest/libqtest.c         |   8 +-
 tests/qtest/microbit-test.c    |   2 +-
 tests/qtest/netdev-socket.c    |  10 +-
 tests/unit/socket-helpers.c    |   2 +-
 tests/unit/test-error-report.c | 139 +++++++++++++++++++
 util/aio-posix.c               |   6 +-
 util/aio-win32.c               |  23 ++--
 util/error.c                   |  10 +-
 util/main-loop.c               |  11 --
 util/oslib-posix.c             |  70 ----------
 util/oslib-win32.c             | 240 ++++++++++++++++++++++++++++-----
 util/qemu-sockets.c            |  22 +--
 .gitignore                     |   2 +
 subprojects/slirp.wrap         |   6 +
 tests/unit/meson.build         |   1 +
 29 files changed, 461 insertions(+), 225 deletions(-)
 create mode 100644 tests/unit/test-error-report.c
 create mode 100644 subprojects/slirp.wrap

-- 
2.39.2


