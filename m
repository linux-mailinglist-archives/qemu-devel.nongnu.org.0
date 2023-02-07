Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C748568DABC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:27:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPOut-0007IG-JU; Tue, 07 Feb 2023 09:25:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pPOuo-0007H0-QK
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:25:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pPOum-0006Cg-6y
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:25:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675779943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=l/5kaJG3LvbMqgf7a01kzX3v+tHg0stuqRHZWdXxJDU=;
 b=JlhYTCAgspFZo5GI2CEl86q+d1LbGfQoSO0mIWv6LYnhIpVhBxVrw7wTnY9+6/220UDAO+
 xYPQs21vCzptQtadlC5VCCWX6LRhuULY2i4vAhZ8V6SVsWQKiyHZT2yAAYmk7UwiKw2mcB
 ulvoNRLJ56Mtp4O+hm95vz7/fWLYQ9o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-Sp8pGcoQOI6A5IEwhNBg3w-1; Tue, 07 Feb 2023 09:25:40 -0500
X-MC-Unique: Sp8pGcoQOI6A5IEwhNBg3w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9706B801CF7;
 Tue,  7 Feb 2023 14:25:39 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 753181121319;
 Tue,  7 Feb 2023 14:25:38 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v3 00/10] Teach 'getfd' QMP command to import win32 sockets
Date: Tue,  7 Feb 2023 18:25:25 +0400
Message-Id: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

The series focuses on 'getfd'/'add_client' win32 support, by limiting its scope
to sockets and adding a new argument to import sockets there. This enables
vnc-display test on win32, exercising the new code paths.

A follow up series will add dbus display support on win32, with tests using this
socket import method.

v3:
- drop "tests: fix test-io-channel-command on win32", not good enough
- include "char: do not double-close fd when failing to add client"
- add "monitor: release the lock before calling close()"
- rebase after recent QMP code move

v2:
- replace the propose new command in v1, with 'wsa-info' argument in 'getfd'
- fix qapi/qmp for commands/events with optional arguments
- rebase, and tags

Marc-André Lureau (10):
  tests: fix path separator, use g_build_filename()
  char: do not double-close fd when failing to add client
  tests/docker: fix a win32 error due to portability
  osdep: implement qemu_socketpair() for win32
  qmp: 'add_client' actually expects sockets
  monitor: release the lock before calling close()
  qapi: implement conditional command arguments
  qmp: teach 'getfd' to import sockets on win32
  libqtest: make qtest_qmp_add_client work on win32
  qtest: enable vnc-display test on win32

 qapi/misc.json                          |  16 +++-
 include/qemu/sockets.h                  |   2 -
 tests/qtest/libqtest.h                  |   2 -
 chardev/char.c                          |   2 -
 monitor/fds.c                           |  77 +++++++++++++----
 monitor/hmp-cmds.c                      |   6 +-
 monitor/qmp-cmds.c                      |  11 ++-
 tests/qtest/libqtest.c                  |  16 +++-
 tests/qtest/vnc-display-test.c          |   7 +-
 tests/unit/test-io-channel-command.c    |   2 +-
 util/oslib-win32.c                      | 110 ++++++++++++++++++++++++
 scripts/qapi/commands.py                |   4 +
 scripts/qapi/gen.py                     |  19 ++--
 scripts/qapi/visit.py                   |   2 +
 tests/docker/docker.py                  |   6 +-
 tests/qapi-schema/qapi-schema-test.json |   3 +-
 16 files changed, 242 insertions(+), 43 deletions(-)

-- 
2.39.1


