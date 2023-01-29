Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F9A6800C4
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 19:25:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMCLt-0004fn-Bo; Sun, 29 Jan 2023 13:24:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pMCLr-0004fb-Rf
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 13:24:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pMCLq-0005nh-3B
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 13:24:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675016664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uGK5IiAm6NW1EDaRmy6nbHG+tPZx8Buyabo+MAp9WPo=;
 b=UqzYqH73W1DT9xC1nWwl/5Wj9bMCd4wLvUX/NY/3a2F1gltvbnCR2oVRbH6wt/GPJic8No
 2pctjRNmmq6GD17jDnppp3jU1pseEicMHQmIMInR7TJLYOSCdi3K8Eb062Tr/Z6EL30xvk
 2RGZFDN5DeMODLjo9bcKvreG2gztNDU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-69fbFWRAN0-Avof0iSCwxw-1; Sun, 29 Jan 2023 13:24:19 -0500
X-MC-Unique: 69fbFWRAN0-Avof0iSCwxw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFC1F1C0515E;
 Sun, 29 Jan 2023 18:24:18 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5BEF5422FE;
 Sun, 29 Jan 2023 18:24:17 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 0/9] Various win32 fixes & teach 'getfd' QMP command to
 import sockets
Date: Sun, 29 Jan 2023 22:24:05 +0400
Message-Id: <20230129182414.583349-1-marcandre.lureau@redhat.com>
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

The following series first fixes a few tests on win32. The second part focuses
on 'add_client' support, by limiting its scope to sockets and adding win32
support. Finally, it enables vnc-display test on win32, to exercise the new code
paths and demonstrate the usage.

A follow up series will add dbus display support on win32, with tests using this
socket import method.

v2:
- replce the propose new command in v1, with 'wsa-info' argument in 'getfd'
- fix qapi/qmp for commands/events with optional arguments
- rebase, and tags

Marc-André Lureau (9):
  tests: fix path separator, use g_build_filename()
  tests: fix test-io-channel-command on win32
  tests/docker: fix a win32 error due to portability
  osdep: implement qemu_socketpair() for win32
  qmp: 'add_client' actually expects sockets
  qapi: implement conditional command arguments
  qmp: teach 'getfd' to import sockets on win32
  libqtest: make qtest_qmp_add_client work on win32
  qtest: enable vnc-display test on win32

 qapi/misc.json                          |  16 +++-
 include/qemu/sockets.h                  |   2 -
 tests/qtest/libqtest.h                  |   2 -
 monitor/hmp-cmds.c                      |   6 +-
 monitor/misc.c                          |  75 ++++++++++++----
 monitor/qmp-cmds.c                      |  13 ++-
 tests/qtest/libqtest.c                  |  16 +++-
 tests/qtest/vnc-display-test.c          |   5 --
 tests/unit/test-io-channel-command.c    |   8 +-
 util/oslib-win32.c                      | 110 ++++++++++++++++++++++++
 scripts/qapi/commands.py                |   4 +
 scripts/qapi/gen.py                     |  19 ++--
 scripts/qapi/visit.py                   |   2 +
 tests/docker/docker.py                  |   6 +-
 tests/qapi-schema/qapi-schema-test.json |   3 +-
 15 files changed, 245 insertions(+), 42 deletions(-)

-- 
2.39.1


