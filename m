Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A58A15268FB
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 20:10:30 +0200 (CEST)
Received: from localhost ([::1]:35144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npZkD-0002m2-8W
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 14:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1npZiH-0000HG-Gp
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:08:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1npZiE-0006yt-K3
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:08:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652465304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fv4Z5HokILaYOUEvG414Y+PrXkSotXc6dBvW80YPQno=;
 b=hMpNYql2R/C53SKozjIhiRnRA4Q85kenladsSpcXejMz1QRQK1yj0kauuxunDOlM34FOrd
 Nmi940ykoXd3QQk/sNF2NqWvqL5fafd+xVSKhrYinthw479MoILILHlm6nfJBVmXf0LQfJ
 u6tTtmuXXFMMxsOzIkwPUpuTAhuTTUQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-cc8a4fKcPpSM6jRrz9wbvQ-1; Fri, 13 May 2022 14:08:23 -0400
X-MC-Unique: cc8a4fKcPpSM6jRrz9wbvQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2842D811E7A;
 Fri, 13 May 2022 18:08:23 +0000 (UTC)
Received: from localhost (unknown [10.39.192.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B54A4416362;
 Fri, 13 May 2022 18:08:22 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 00/15] Misc cleanups
Date: Fri, 13 May 2022 20:08:06 +0200
Message-Id: <20220513180821.905149-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Hi,

v3:
- changed error_report_err() back to g_critical()
- added "qga: make build_fs_mount_list() return a bool"
- replaced g_clear_pointer() usage by open-coded version
- dropped needless g_autoptr(GError) in tests
- rebased, (dropped "include: adjust header guards after renaming")
- some commit message rewording
- added r-b tags

v2:
- drop "compiler.h: add QEMU_{BEGIN,END}_IGNORE_INITIALIZER_OVERRIDES",
  "qobject/json-lexer: disable -Winitializer-overrides warnings" &
  "qapi/error: add g_autoptr(Error) support" and adjust related code.
- add "test/qga: use g_auto wherever sensible"
- add r-b tags

Marc-André Lureau (15):
  include: move qemu_*_exec_dir() to cutils
  util/win32: simplify qemu_get_local_state_dir()
  tests: make libqmp buildable for win32
  qga: flatten safe_open_or_create()
  osdep: export qemu_open_cloexec()
  qga: use qemu_open_cloexec() for safe_open_or_create()
  qga: throw an Error in ga_channel_open()
  qga: replace qemu_open_old() with qemu_open_cloexec()
  qga: make build_fs_mount_list() return a bool
  test/qga: use G_TEST_DIR to locate os-release test file
  qga/wixl: prefer variables over environment
  qga/wixl: require Mingw_bin
  qga/wixl: simplify some pre-processing
  qga/wixl: replace QEMU_GA_MSI_MINGW_BIN_PATH with glib bindir
  test/qga: use g_auto wherever sensible

 configure                            |   9 +-
 include/qemu/cutils.h                |   7 ++
 include/qemu/osdep.h                 |   9 +-
 meson.build                          |   5 +-
 qemu-io.c                            |   1 +
 qga/channel-posix.c                  |  55 +++++----
 qga/commands-posix.c                 | 164 +++++++++++++--------------
 qga/installer/qemu-ga.wxs            |  83 +++++---------
 qga/meson.build                      |  11 +-
 storage-daemon/qemu-storage-daemon.c |   1 +
 tests/qtest/fuzz/fuzz.c              |   1 +
 tests/qtest/libqmp.c                 |  34 +++++-
 tests/qtest/libqmp.h                 |   2 +
 tests/unit/test-qga.c                | 130 ++++++++-------------
 util/cutils.c                        | 108 ++++++++++++++++++
 util/osdep.c                         |  10 +-
 util/oslib-posix.c                   |  81 -------------
 util/oslib-win32.c                   |  53 +--------
 18 files changed, 358 insertions(+), 406 deletions(-)

-- 
2.36.1


