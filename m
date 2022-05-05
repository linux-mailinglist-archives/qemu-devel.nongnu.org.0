Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBCF51BA52
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 10:27:35 +0200 (CEST)
Received: from localhost ([::1]:44772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmWph-0001np-NY
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 04:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmWdu-0006He-5f
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:15:22 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:51214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmWds-0007gF-D0
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:15:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651738519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iln40a7snj3+Z9SocGXNDCFmd9m9acRe3ByMhFfNmYY=;
 b=PJuON5CZPmy/r+s6xHjG9xUw7QBV11wCopBSo2FH6zDMNV/m7VmlUeUrdRr3a5zGworFvu
 nt0CD7wXs1wnNQl4qcaDi+ldPEaz/Un6gKWm0wxo5lvmaJYWnoDNVgzNFwJ3McwbRSVoKg
 iEHqJbNeSVgpksABIQgw2eaF/EsO5rg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-Rc6ZsaWHMN-lsmr-2HnmDg-1; Thu, 05 May 2022 04:15:16 -0400
X-MC-Unique: Rc6ZsaWHMN-lsmr-2HnmDg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E43D91014A7C;
 Thu,  5 May 2022 08:15:15 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7A73111E3EB;
 Thu,  5 May 2022 08:14:34 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Kevin Wolf <kwolf@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 00/15] Misc cleanups
Date: Thu,  5 May 2022 12:14:16 +0400
Message-Id: <20220505081431.934739-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.74;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
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
  include: adjust header guards after renaming
  qga: flatten safe_open_or_create()
  osdep: export qemu_open_cloexec()
  qga: use qemu_open_cloexec() for safe_open_or_create()
  qga: throw an Error in ga_channel_open()
  qga: replace qemu_open_old() with qemu_open_cloexec()
  test/qga: use G_TEST_DIR to locate os-release test file
  qga/wixl: prefer variables over environment
  qga/wixl: require Mingw_bin
  qga/wixl: simplify some pre-processing
  qga/wixl: replace QEMU_GA_MSI_MINGW_BIN_PATH with glib bindir
  test/qga: use g_auto wherever sensible

 configure                            |   9 +-
 meson.build                          |   5 +-
 include/qemu/cutils.h                |   7 ++
 include/qemu/help-texts.h            |   4 +-
 include/qemu/osdep.h                 |   9 +-
 tests/qtest/libqmp.h                 |   2 +
 qemu-io.c                            |   1 +
 qga/channel-posix.c                  |  54 +++++-----
 qga/commands-posix.c                 | 145 +++++++++++++--------------
 storage-daemon/qemu-storage-daemon.c |   1 +
 tests/qtest/fuzz/fuzz.c              |   1 +
 tests/qtest/libqmp.c                 |  35 +++++--
 tests/unit/test-qga.c                | 134 +++++++++----------------
 util/cutils.c                        | 108 ++++++++++++++++++++
 util/osdep.c                         |  10 +-
 util/oslib-posix.c                   |  81 ---------------
 util/oslib-win32.c                   |  53 +---------
 qga/installer/qemu-ga.wxs            |  83 ++++++---------
 qga/meson.build                      |  11 +-
 19 files changed, 352 insertions(+), 401 deletions(-)

-- 
2.36.0.44.g0f828332d5ac


