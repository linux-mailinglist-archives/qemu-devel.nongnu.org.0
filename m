Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B76965BEA8
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 12:09:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCf9s-00056Q-UC; Tue, 03 Jan 2023 06:08:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pCf9m-00052C-75
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 06:08:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pCf9k-0005D8-3B
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 06:08:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672744102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4+W2Fo4Mgzstt2OvHjqVxG3r1WRDjC6Xt3qDMJt+idg=;
 b=cjahk8viPpuADq9PCE8REzfV+A9iRp0IVKTyyTgVX5eUUQMjWQ0fXlmnqfVmEQIOD+eZPE
 D55O5AB/6EedjB0FHSIQ5Gsz2rNENQeHxYcNt0ux4wwou94KCghLuzSVupU8Jfjd+S+BvH
 fw6PXElsJSXeCcVFdV1G9bP5O6ISwYI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-eaYdC-0qNOS-UccZRA21hQ-1; Tue, 03 Jan 2023 06:08:18 -0500
X-MC-Unique: eaYdC-0qNOS-UccZRA21hQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5511F185A794;
 Tue,  3 Jan 2023 11:08:18 +0000 (UTC)
Received: from localhost (unknown [10.39.208.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3482F2026D4B;
 Tue,  3 Jan 2023 11:08:16 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 00/10] Various win32 fixes & new 'get-win32-socket' QMP command
Date: Tue,  3 Jan 2023 15:08:04 +0400
Message-Id: <20230103110814.3726795-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
paths and demonstrate its usage.

'get-win32-socket' can be used to write more robusts code & tests using sockets
on Windows, and will be used by a follow up series testing dbus display support.

Marc-André Lureau (10):
  ccid-card-emulated: fix cast warning/error
  tests: fix path separator, use g_build_filename()
  tests: fix test-io-channel-command on win32
  tests/docker: fix a win32 error due to portability
  tests/readconfig: spice doesn't support unix socket on windows yet
  osdep: implement qemu_socketpair() for win32
  qmp: 'add_client' actually expects sockets
  qmp: add 'get-win32-socket'
  libqtest: make qtest_qmp_add_client work on win32
  qtest: enable vnc-display test on win32

 qapi/misc.json                       |  32 ++++++++
 include/qemu/sockets.h               |   2 -
 tests/qtest/libqtest.h               |   5 +-
 hw/usb/ccid-card-emulated.c          |   2 +-
 monitor/misc.c                       |  74 ++++++++++++++----
 monitor/qmp-cmds.c                   |  19 +++--
 tests/qtest/libqtest.c               |  16 +++-
 tests/qtest/readconfig-test.c        |   6 +-
 tests/qtest/vnc-display-test.c       |   5 --
 tests/unit/test-io-channel-command.c |   8 +-
 util/oslib-win32.c                   | 110 +++++++++++++++++++++++++++
 tests/docker/docker.py               |   6 +-
 12 files changed, 245 insertions(+), 40 deletions(-)

-- 
2.39.0


