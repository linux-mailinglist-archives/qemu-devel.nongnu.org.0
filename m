Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6C56ABF7A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 13:29:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ9wh-0007PE-Qr; Mon, 06 Mar 2023 07:28:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ9we-0007P2-1s
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 07:28:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ9wc-0003DB-Bt
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 07:27:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678105676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mm+vCTmiK9r2rW15TI751CMv86+Z2kBL2cHdIrGaE5A=;
 b=UuZuTW7gRIUZqXvAqPi3t1NAI9nsl4d/nvj4Btscbw727HgIg1zQZLDxFpQ7WoZO9cFIP3
 7y3yBH2a9suUeeuDtV4yHVbLuZ3U80jRK+NtdWgvPFsId7GicUla5UwGHneOgICCVyv6EY
 zJCrOwUCpFfv74fHpEtaSY/oWklP5Y0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-H_lhlBDDO5W5oV69cbP9GQ-1; Mon, 06 Mar 2023 07:27:55 -0500
X-MC-Unique: H_lhlBDDO5W5oV69cbP9GQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29B93183B3C3;
 Mon,  6 Mar 2023 12:27:55 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03481175AD;
 Mon,  6 Mar 2023 12:27:53 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH v4 00/11] QMP command to import win32 sockets
Date: Mon,  6 Mar 2023 16:27:40 +0400
Message-Id: <20230306122751.2355515-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

Hi,

The series focuses on 'add_client' win32 support, by limiting its scope to
sockets and adding a new command to import sockets. This enables vnc-display
test on win32, exercising the new code paths.

(a follow up series will add dbus display support on win32, with tests using
this socket import method)

v4:
- back to new get-win32-socket command, as in v1
- drop qapi conditional fixes
- add "QMP/HMP: only actually implement getfd on CONFIG_POSIX"
- add "qapi/gen: run C code through clang-format, if possible"
- rebased on pending fd/socket mix series

v3:
- drop "tests: fix test-io-channel-command on win32", not good enough
- include "char: do not double-close fd when failing to add client"
- add "monitor: release the lock before calling close()"
- rebase after recent QMP code move

v2:
- replace the propose new command in v1, with 'wsa-info' argument in 'getfd'
- fix qapi/qmp for commands/events with optional arguments
- rebase, and tags

Based-on: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
("[PATCH v3 00/16] win32: do not mix SOCKET and fd space")

Marc-André Lureau (11):
  tests: fix path separator, use g_build_filename()
  char: do not double-close fd when failing to add client
  tests/docker: fix a win32 error due to portability
  osdep: implement qemu_socketpair() for win32
  qmp: 'add_client' actually expects sockets
  monitor: release the lock before calling close()
  qapi/gen: run C code through clang-format, if possible
  qmp: add 'get-win32-socket'
  libqtest: make qtest_qmp_add_client work on win32
  qtest: enable vnc-display test on win32
  QMP/HMP: only actually implement getfd on CONFIG_POSIX

 qapi/misc.json                       |  35 ++++++++-
 include/qemu/sockets.h               |   2 -
 tests/qtest/libqtest.h               |   5 +-
 chardev/char.c                       |   2 -
 monitor/fds.c                        |  77 +++++++++++++++----
 monitor/hmp-cmds.c                   |   2 +
 monitor/qmp-cmds.c                   |   7 ++
 tests/qtest/libqtest.c               |  18 ++++-
 tests/qtest/vnc-display-test.c       |  12 +--
 tests/unit/test-io-channel-command.c |   2 +-
 util/oslib-win32.c                   | 110 +++++++++++++++++++++++++++
 hmp-commands.hx                      |   2 +
 scripts/qapi/gen.py                  |  15 +++-
 scripts/qapi/introspect.py           |   2 +
 tests/docker/docker.py               |   6 +-
 15 files changed, 263 insertions(+), 34 deletions(-)

-- 
2.39.2


