Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29FF25A7A9
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 10:20:48 +0200 (CEST)
Received: from localhost ([::1]:57032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDO0d-00011F-Ql
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 04:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kDNwQ-0001kx-8f
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 04:16:26 -0400
Received: from mail.ispras.ru ([83.149.199.84]:38598)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kDNwO-000327-5c
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 04:16:25 -0400
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 41E3340A928D;
 Wed,  2 Sep 2020 08:16:22 +0000 (UTC)
Subject: [PATCH v3 06/15] qapi: introduce replay.json for
 record/replay-related stuff
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Wed, 02 Sep 2020 11:16:22 +0300
Message-ID: <159903458194.28509.16680959321062004675.stgit@pasha-ThinkPad-X280>
In-Reply-To: <159903454714.28509.7439453309116734374.stgit@pasha-ThinkPad-X280>
References: <159903454714.28509.7439453309116734374.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 04:15:48
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, wrampazz@redhat.com, pavel.dovgalyuk@ispras.ru,
 ehabkost@redhat.com, alex.bennee@linaro.org, mtosatti@redhat.com,
 armbru@redhat.com, mreitz@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, philmd@redhat.com, zhiwei_liu@c-sky.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>

This patch adds replay.json file. It will be
used for adding record/replay-related data structures and commands.

Signed-off-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS             |    1 +
 include/sysemu/replay.h |    1 +
 qapi/meson.build        |    1 +
 qapi/misc.json          |   18 ------------------
 qapi/qapi-schema.json   |    1 +
 qapi/replay.json        |   26 ++++++++++++++++++++++++++
 6 files changed, 30 insertions(+), 18 deletions(-)
 create mode 100644 qapi/replay.json

diff --git a/MAINTAINERS b/MAINTAINERS
index 5a22c8be42..e49af700c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2644,6 +2644,7 @@ F: include/sysemu/replay.h
 F: docs/replay.txt
 F: stubs/replay.c
 F: tests/acceptance/replay_kernel.py
+F: qapi/replay.json
 
 IOVA Tree
 M: Peter Xu <peterx@redhat.com>
diff --git a/include/sysemu/replay.h b/include/sysemu/replay.h
index c9c896ae8d..e00ed2f4a5 100644
--- a/include/sysemu/replay.h
+++ b/include/sysemu/replay.h
@@ -14,6 +14,7 @@
 
 #include "qapi/qapi-types-misc.h"
 #include "qapi/qapi-types-run-state.h"
+#include "qapi/qapi-types-replay.h"
 #include "qapi/qapi-types-ui.h"
 #include "block/aio.h"
 
diff --git a/qapi/meson.build b/qapi/meson.build
index 2b2872a41d..f4fd514379 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -36,6 +36,7 @@ qapi_all_modules = [
   'qdev',
   'qom',
   'rdma',
+  'replay',
   'rocker',
   'run-state',
   'sockets',
diff --git a/qapi/misc.json b/qapi/misc.json
index 9d32820dc1..87fcb90135 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -1556,24 +1556,6 @@
 { 'event': 'ACPI_DEVICE_OST',
      'data': { 'info': 'ACPIOSTInfo' } }
 
-##
-# @ReplayMode:
-#
-# Mode of the replay subsystem.
-#
-# @none: normal execution mode. Replay or record are not enabled.
-#
-# @record: record mode. All non-deterministic data is written into the
-#          replay log.
-#
-# @play: replay mode. Non-deterministic data required for system execution
-#        is read from the log.
-#
-# Since: 2.5
-##
-{ 'enum': 'ReplayMode',
-  'data': [ 'none', 'record', 'play' ] }
-
 ##
 # @xen-load-devices-state:
 #
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index f03ff91ceb..2604fcf6ec 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -82,6 +82,7 @@
 { 'include': 'qdev.json' }
 { 'include': 'machine.json' }
 { 'include': 'machine-target.json' }
+{ 'include': 'replay.json' }
 { 'include': 'misc.json' }
 { 'include': 'misc-target.json' }
 { 'include': 'audio.json' }
diff --git a/qapi/replay.json b/qapi/replay.json
new file mode 100644
index 0000000000..9e13551d20
--- /dev/null
+++ b/qapi/replay.json
@@ -0,0 +1,26 @@
+# -*- Mode: Python -*-
+#
+
+##
+# = Record/replay
+##
+
+{ 'include': 'common.json' }
+
+##
+# @ReplayMode:
+#
+# Mode of the replay subsystem.
+#
+# @none: normal execution mode. Replay or record are not enabled.
+#
+# @record: record mode. All non-deterministic data is written into the
+#          replay log.
+#
+# @play: replay mode. Non-deterministic data required for system execution
+#        is read from the log.
+#
+# Since: 2.5
+##
+{ 'enum': 'ReplayMode',
+  'data': [ 'none', 'record', 'play' ] }


