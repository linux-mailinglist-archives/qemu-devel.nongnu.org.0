Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E20532818
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 12:48:12 +0200 (CEST)
Received: from localhost ([::1]:42742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntS5E-00088K-1b
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 06:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ntRsT-0007d2-IR
 for qemu-devel@nongnu.org; Tue, 24 May 2022 06:35:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ntRsR-0007Mp-3b
 for qemu-devel@nongnu.org; Tue, 24 May 2022 06:35:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653388497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7qmCb7W7mz/c6R1MmBYiClS9PmRqAlgom/79dNIsJ/8=;
 b=b4uDonKOKZlrSHV9QZYo7zdfmv7ACzWwgHbdNK46PmcotwxpW9IY5J3t9Xm2zicyKEn1ug
 JnNkmwZRAUXLzlh6BRNccCuhwYH6G1FJNzwSqTEjjROHl6rVmDiIx14FjqsiCMWuXwf16M
 urOPjN7gC69toQRcLB7QkxZZaX9gUgo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-Lt1NjNmeOK-5Ij0bUelOmw-1; Tue, 24 May 2022 06:34:54 -0400
X-MC-Unique: Lt1NjNmeOK-5Ij0bUelOmw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6BAC0811E76;
 Tue, 24 May 2022 10:34:54 +0000 (UTC)
Received: from localhost (unknown [10.39.192.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20E0CC08087;
 Tue, 24 May 2022 10:34:53 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v4 00/15] Misc cleanups
Date: Tue, 24 May 2022 12:34:38 +0200
Message-Id: <20220524103453.162665-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124;
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

More preliminary cleanups before a series to make qemu-ga a meson subproject().

v4:
- remove some unnecessary ERRP_GUARD()
- open-code some g_clear_pointer()
- don't export qemu_open_cloexec, introduce qga_open_cloexec instead
- some formatting improvements
- add new r-b tags

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
  qga: add qga_open_cloexec() helper
  qga: use qga_open_cloexec() for safe_open_or_create()
  qga: throw an Error in ga_channel_open()
  qga: replace qemu_open_old() with qga_open_cloexec()
  qga: make build_fs_mount_list() return a bool
  test/qga: use G_TEST_DIR to locate os-release test file
  qga/wixl: prefer variables over environment
  qga/wixl: require Mingw_bin
  qga/wixl: simplify some pre-processing
  qga/wixl: replace QEMU_GA_MSI_MINGW_BIN_PATH with glib bindir
  test/qga: use g_auto wherever sensible

 configure                            |   9 +-
 include/qemu/cutils.h                |   7 ++
 include/qemu/osdep.h                 |   8 --
 meson.build                          |   5 +-
 qemu-io.c                            |   1 +
 qga/channel-posix.c                  |  55 +++++----
 qga/commands-posix.c                 | 165 +++++++++++++--------------
 qga/cutils.c                         |  37 ++++++
 qga/cutils.h                         |   8 ++
 qga/installer/qemu-ga.wxs            |  83 +++++---------
 qga/meson.build                      |  12 +-
 storage-daemon/qemu-storage-daemon.c |   1 +
 tests/qtest/fuzz/fuzz.c              |   1 +
 tests/qtest/libqmp.c                 |  34 +++++-
 tests/qtest/libqmp.h                 |   2 +
 tests/unit/test-qga.c                | 130 ++++++++-------------
 util/cutils.c                        | 108 ++++++++++++++++++
 util/oslib-posix.c                   |  81 -------------
 util/oslib-win32.c                   |  53 +--------
 19 files changed, 396 insertions(+), 404 deletions(-)
 create mode 100644 qga/cutils.c
 create mode 100644 qga/cutils.h

-- 
2.36.1


