Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A4658EC65
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 14:56:31 +0200 (CEST)
Received: from localhost ([::1]:59078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLlGA-0007HK-L1
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 08:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oLl94-0001Nr-9k
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:49:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oLl90-0007OZ-1h
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:49:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660135744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eQc1n4Sxxt6zDwyMjZ2XVwazy5ICVbKV2rUZeWNsQ4k=;
 b=VPPurTztkwFl403wvH0gEPJgM6ysIqx9t+LYsVPW8njvo7vv5Q7tuEJnQYA/zu/aOHN4Ae
 GnQHE5ghQEiLhXzIlhBWeRyr7PdJ7ws4Ub1HlB2AS4uS6LGqYP3+h9lmIbqAi1lI3eP2bm
 4jET/uTMXrWvrL4Ic36su4ODvXD4yPM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-nJfpdOCGPLSpheeIjmeZ6Q-1; Wed, 10 Aug 2022 08:49:03 -0400
X-MC-Unique: nJfpdOCGPLSpheeIjmeZ6Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63A3C299E771;
 Wed, 10 Aug 2022 12:49:03 +0000 (UTC)
Received: from localhost (unknown [10.39.208.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4C5940CF8E8;
 Wed, 10 Aug 2022 12:49:01 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 00/16] Preliminary patches for subproject split
Date: Wed, 10 Aug 2022 16:48:41 +0400
Message-Id: <20220810124857.1360211-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Here is another subset of the large "subproject(qga)" series I intend to send
soon after (https://gitlab.com/marcandre.lureau/qemu/-/commits/qga).

Thanks

v3:
- use overriable qmp_dispatch_exec() stub, instead of extra callback
- qapi-gen "-i file.h" will always generate '#include "file.h"' now
- improve mtest2make.py subproject tests handling
- add r-b tags

v2:
 - drop error_init() callbacks, use static library symbol override instead
 - include a few patches from the rest of the series to introduce qemu-common
   subproject

Marc-André Lureau (16):
  error-report: misc comment fix
  error-report: introduce "detailed" variable
  error-report: simplify print_loc()
  error-report: introduce overridable error_is_detailed()
  stubs: remove needless error_vprintf_unless_qmp()
  qapi: move QEMU-specific dispatch code in monitor
  qapi: remove QEMU-specific monitor dependency from dispatch
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
 include/qapi/qmp/dispatch.h                   |   6 +-
 include/qemu/host-utils.h                     |   3 -
 include/qemu/int128.h                         |   3 +
 .../qemu-common/include}/glib-compat.h        |   4 +-
 .../qemu-common/include}/qemu/error-report.h  |   4 +
 .../qemu-common/include}/qemu/help-texts.h    |   0
 monitor/qmp.c                                 |  64 +++++++
 qapi/qmp-dispatch.c                           |  62 +-----
 softmmu/vl.c                                  |   5 +
 stubs/qmp-dispatch-exec.c                     |   8 +
 .../qemu-common/src/error-is-detailed.c       |   6 +
 .../qemu-common/src}/error-report.c           |  20 +-
 .../qemu-common/src/error-vprintf.c           |  10 +-
 .../qemu-common/tests/test-error-report.c     | 120 ++++++++++++
 util/host-utils.c                             | 180 ------------------
 util/int128.c                                 | 180 ++++++++++++++++++
 MAINTAINERS                                   |   4 +-
 scripts/mtest2make.py                         |   9 +-
 stubs/meson.build                             |   2 +-
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
 .../qemu-common/scripts}/qapi/gen.py          |  15 ++
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
 51 files changed, 579 insertions(+), 324 deletions(-)
 rename {include => subprojects/qemu-common/include}/glib-compat.h (97%)
 rename {include => subprojects/qemu-common/include}/qemu/error-report.h (97%)
 rename {include => subprojects/qemu-common/include}/qemu/help-texts.h (100%)
 create mode 100644 stubs/qmp-dispatch-exec.c
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
 rename {scripts => subprojects/qemu-common/scripts}/qapi/gen.py (96%)
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
2.37.1


