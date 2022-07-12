Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E36045715EE
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 11:41:20 +0200 (CEST)
Received: from localhost ([::1]:60428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBCON-00024G-UE
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 05:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oBCJ3-000565-LD
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:35:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oBCJ1-0006N1-IS
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:35:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657618544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hhR8DCRo8jt59ldwinIsGcA//CRQQvJjnOE31kEUmC8=;
 b=CL0WFcowmuNUCrw4Ijr0F0CGc3VJxAuFfgB1MDRI0mxyJcBqbNRfmEDeE6xIOc8PsfrURF
 NzuxICxEmT/ZoCABciFT+hl/o/n/3xrS7ToMfr/FEh+2zZiAc4w0Vm5p2qJTl9ykpaxj86
 pp8mE8qJlJwRBNh88YNsN67loL6DkMc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-7qAxnUAJPKWkx0goNc8XxA-1; Tue, 12 Jul 2022 05:35:35 -0400
X-MC-Unique: 7qAxnUAJPKWkx0goNc8XxA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBCDD803520;
 Tue, 12 Jul 2022 09:35:34 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE5E21415117;
 Tue, 12 Jul 2022 09:35:32 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, Kyle Evans <kevans@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Warner Losh <imp@bsdimp.com>,
 Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <laurent@vivier.eu>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 00/15] Preliminary patches for subproject split
Date: Tue, 12 Jul 2022 13:35:13 +0400
Message-Id: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Here is another subset of the large "subproject(qga)"" series I intend to send
soon after (https://gitlab.com/marcandre.lureau/qemu/-/commits/qga).

Thanks

v2:
 - drop error_init() callbacks, use static library symbol override instead
 - include a few patches from the rest of the series to introduce qemu-common
   subproject

Marc-André Lureau (15):
  error-report: misc comment fix
  error-report: introduce "detailed" variable
  error-report: simplify print_loc()
  error-report: introduce overridable error_is_detailed()
  stubs: remove needless error_vprintf_unless_qmp()
  qapi: move QEMU-specific dispatch code in monitor
  scripts/qapi-gen: add -i option
  scripts/qapi: add required system includes to visitor
  util: move 256-by-128 division helpers to int128
  qemu-common: introduce a common subproject
  qemu-common: move scripts/qapi
  qemu-common: move glib-compat.h
  qemu-common: move error-report
  mtest2make.py: teach suite name that are just "PROJECT"
  qemu-common: add error-report test

 docs/conf.py                                  |   2 +-
 meson.build                                   |  28 +--
 include/qapi/qmp/dispatch.h                   |   7 +-
 include/qemu/host-utils.h                     |   3 -
 include/qemu/int128.h                         |   3 +
 .../qemu-common/include}/glib-compat.h        |   4 +-
 .../qemu-common/include}/qemu/error-report.h  |   4 +
 .../qemu-common/include}/qemu/help-texts.h    |   0
 monitor/qmp.c                                 |  68 ++++++-
 qapi/qmp-dispatch.c                           |  64 +------
 qga/main.c                                    |   2 +-
 softmmu/vl.c                                  |   5 +
 .../qemu-common/src/error-is-detailed.c       |   6 +
 .../qemu-common/src}/error-report.c           |  20 +-
 .../qemu-common/src/error-vprintf.c           |  10 +-
 .../qemu-common/tests/test-error-report.c     | 120 ++++++++++++
 tests/unit/test-qmp-cmds.c                    |   6 +-
 util/host-utils.c                             | 180 ------------------
 util/int128.c                                 | 180 ++++++++++++++++++
 MAINTAINERS                                   |   4 +-
 linux-user/meson.build                        |   4 +-
 scripts/mtest2make.py                         |   7 +-
 stubs/meson.build                             |   1 -
 subprojects/libvduse/meson.build              |   2 +
 subprojects/libvduse/subprojects/qemu-common  |   1 +
 subprojects/libvhost-user/meson.build         |   2 +
 .../libvhost-user/subprojects/qemu-common     |   1 +
 subprojects/qemu-common/meson.build           |  26 +++
 subprojects/qemu-common/scripts/meson.build   |   3 +
 .../qemu-common/scripts}/qapi-gen.py          |   0
 .../qemu-common/scripts}/qapi/.flake8         |   0
 .../qemu-common/scripts}/qapi/.isort.cfg      |   0
 .../qemu-common/scripts}/qapi/__init__.py     |   0
 .../qemu-common/scripts}/qapi/commands.py     |  15 +-
 .../qemu-common/scripts}/qapi/common.py       |   0
 .../qemu-common/scripts}/qapi/error.py        |   0
 .../qemu-common/scripts}/qapi/events.py       |  17 +-
 .../qemu-common/scripts}/qapi/expr.py         |   0
 .../qemu-common/scripts}/qapi/gen.py          |  17 ++
 .../qemu-common/scripts}/qapi/introspect.py   |  11 +-
 .../qemu-common/scripts}/qapi/main.py         |  17 +-
 .../qemu-common/scripts/qapi/meson.build      |  16 ++
 .../qemu-common/scripts}/qapi/mypy.ini        |   0
 .../qemu-common/scripts}/qapi/parser.py       |   0
 .../qemu-common/scripts}/qapi/pylintrc        |   0
 .../qemu-common/scripts}/qapi/schema.py       |   0
 .../qemu-common/scripts}/qapi/source.py       |   0
 .../qemu-common/scripts}/qapi/types.py        |  17 +-
 .../qemu-common/scripts}/qapi/visit.py        |  19 +-
 subprojects/qemu-common/src/meson.build       |   5 +
 subprojects/qemu-common/tests/meson.build     |  12 ++
 tests/qapi-schema/meson.build                 |   2 +-
 util/meson.build                              |   2 +-
 53 files changed, 585 insertions(+), 328 deletions(-)
 rename {include => subprojects/qemu-common/include}/glib-compat.h (97%)
 rename {include => subprojects/qemu-common/include}/qemu/error-report.h (97%)
 rename {include => subprojects/qemu-common/include}/qemu/help-texts.h (100%)
 create mode 100644 subprojects/qemu-common/src/error-is-detailed.c
 rename {util => subprojects/qemu-common/src}/error-report.c (96%)
 rename stubs/error-printf.c => subprojects/qemu-common/src/error-vprintf.c (64%)
 create mode 100644 subprojects/qemu-common/tests/test-error-report.c
 create mode 120000 subprojects/libvduse/subprojects/qemu-common
 create mode 120000 subprojects/libvhost-user/subprojects/qemu-common
 create mode 100644 subprojects/qemu-common/meson.build
 create mode 100644 subprojects/qemu-common/scripts/meson.build
 rename {scripts => subprojects/qemu-common/scripts}/qapi-gen.py (100%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/.flake8 (100%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/.isort.cfg (100%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/__init__.py (100%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/commands.py (96%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/common.py (100%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/error.py (100%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/events.py (95%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/expr.py (100%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/gen.py (95%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/introspect.py (97%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/main.py (85%)
 create mode 100644 subprojects/qemu-common/scripts/qapi/meson.build
 rename {scripts => subprojects/qemu-common/scripts}/qapi/mypy.ini (100%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/parser.py (100%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/pylintrc (100%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/schema.py (100%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/source.py (100%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/types.py (96%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/visit.py (96%)
 create mode 100644 subprojects/qemu-common/src/meson.build
 create mode 100644 subprojects/qemu-common/tests/meson.build

-- 
2.37.0.rc0


