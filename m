Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE6351AABF
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 19:32:35 +0200 (CEST)
Received: from localhost ([::1]:38918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmIra-0006y9-Hu
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 13:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmIpg-0004bb-Va
 for qemu-devel@nongnu.org; Wed, 04 May 2022 13:30:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmIpf-0002zX-46
 for qemu-devel@nongnu.org; Wed, 04 May 2022 13:30:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651685433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=V2tkWasWMy2wuaumwxKZb//mK5bdZ6NM81Be7A1Fddk=;
 b=FcPD+3eS+H0sR0xBak7ptxI95kYFbCferWgbl8iu6fHNLg6cezcbkk/KsiAZ1kvoFMmVm5
 o9IwtVbqRoo24THB2GGNPoBalS1fI4Hx71/mfIjg4yPtVp1JlG5Rh19vLjYo1a7PbS6Xop
 bvzQUWB9+9B4/Lc3tRQ20uYpLkGLlw4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-DEewslJpND6lKm_oLi5IQw-1; Wed, 04 May 2022 13:30:29 -0400
X-MC-Unique: DEewslJpND6lKm_oLi5IQw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43463800186;
 Wed,  4 May 2022 17:30:29 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BE68C27D8F;
 Wed,  4 May 2022 17:30:27 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Laurent Vivier <lvivier@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Bandan Das <bsd@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 00/16] Misc cleanups
Date: Wed,  4 May 2022 21:30:09 +0400
Message-Id: <20220504173025.650167-1-marcandre.lureau@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Perhaps the last series of preliminary patches before I propose a longer series
to add qemu-common & qga meson subprojects. That's why they are mostly
QGA-related cleanups.

Thanks for the reviews!

Marc-André Lureau (16):
  include: move qemu_*_exec_dir() to cutils
  util/win32: simplify qemu_get_local_state_dir()
  tests: make libqmp buildable for win32
  compiler.h: add QEMU_{BEGIN,END}_IGNORE_INITIALIZER_OVERRIDES
  qobject/json-lexer: disable -Winitializer-overrides warnings
  include: adjust header guards after renaming
  qga: flatten safe_open_or_create()
  osdep: export qemu_open_cloexec()
  qga: use qemu_open_cloexec() for safe_open_or_create()
  qapi/error: add g_autoptr(Error) support
  qga: replace qemu_open_old() with qemu_open_cloexec()
  test/qga: use G_TEST_DIR to locate os-release test file
  qga/wixl: prefer variables over environment
  qga/wixl: require Mingw_bin
  qga/wixl: simplify some pre-processing
  qga/wixl: replace QEMU_GA_MSI_MINGW_BIN_PATH with glib bindir

 configure                            |   9 +-
 meson.build                          |   5 +-
 include/qapi/error.h                 |   2 +
 include/qemu/compiler.h              |  11 ++
 include/qemu/cutils.h                |   7 ++
 include/qemu/help-texts.h            |   4 +-
 include/qemu/osdep.h                 |   9 +-
 tests/qtest/libqmp.h                 |   2 +
 qemu-io.c                            |   1 +
 qga/channel-posix.c                  |  18 ++--
 qga/commands-posix.c                 | 146 +++++++++++++--------------
 qobject/json-lexer.c                 |   4 +
 storage-daemon/qemu-storage-daemon.c |   1 +
 tests/qtest/fuzz/fuzz.c              |   1 +
 tests/qtest/libqmp.c                 |  35 +++++--
 tests/unit/test-qga.c                |  11 +-
 util/cutils.c                        | 108 ++++++++++++++++++++
 util/osdep.c                         |  10 +-
 util/oslib-posix.c                   |  81 ---------------
 util/oslib-win32.c                   |  53 +---------
 qga/installer/qemu-ga.wxs            |  83 +++++----------
 qga/meson.build                      |  11 +-
 22 files changed, 313 insertions(+), 299 deletions(-)

-- 
2.36.0.44.g0f828332d5ac


