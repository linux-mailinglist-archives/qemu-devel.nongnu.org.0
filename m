Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 147404E2A5
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 11:07:42 +0200 (CEST)
Received: from localhost ([::1]:55728 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heFWH-0006JD-A4
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 05:07:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58774)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1heEzc-0004Ue-8P
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 04:33:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1heEni-0000X5-Bo
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 04:21:41 -0400
Received: from mail.ispras.ru ([83.149.199.45]:41438)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1heEnh-0000WN-64
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 04:21:38 -0400
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 2FC0E5400A7;
 Fri, 21 Jun 2019 11:21:35 +0300 (MSK)
From: Pavel Dovgalyuk <pavel.dovgaluk@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2019 11:21:35 +0300
Message-ID: <156110529498.25431.8092482831115514702.stgit@pasha-Precision-3630-Tower>
In-Reply-To: <156110523748.25431.9310430853468653085.stgit@pasha-Precision-3630-Tower>
References: <156110523748.25431.9310430853468653085.stgit@pasha-Precision-3630-Tower>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 83.149.199.45
Subject: [Qemu-devel] [PATCH for-4.1 10/24] qapi: introduce replay.json for
 record/replay-related stuff
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, pavel.dovgaluk@ispras.ru,
 pbonzini@redhat.com, quintela@redhat.com, ciro.santilli@gmail.com,
 jasowang@redhat.com, crosthwaite.peter@gmail.com, armbru@redhat.com,
 mreitz@redhat.com, alex.bennee@linaro.org, maria.klimushenkova@ispras.ru,
 mst@redhat.com, kraxel@redhat.com, boost.lists@gmail.com,
 thomas.dullien@googlemail.com, dovgaluk@ispras.ru, artem.k.pisarenko@gmail.com,
 dgilbert@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>

This patch adds replay.json file. It will be
used for adding record/replay-related data structures and commands.

Signed-off-by: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Reviewed-by: Markus Armbruster <armbru@redhat.com>

--

v10:
 - minor changes
v13:
 - rebased to the new QAPI files
---
 MAINTAINERS             |    1 +
 include/sysemu/replay.h |    2 +-
 qapi/Makefile.objs      |    2 +-
 qapi/misc.json          |   18 ------------------
 qapi/qapi-schema.json   |    1 +
 qapi/replay.json        |   26 ++++++++++++++++++++++++++
 6 files changed, 30 insertions(+), 20 deletions(-)
 create mode 100644 qapi/replay.json

diff --git a/MAINTAINERS b/MAINTAINERS
index d32c5c2313..1a3b518ee8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2234,6 +2234,7 @@ F: net/filter-replay.c
 F: include/sysemu/replay.h
 F: docs/replay.txt
 F: stubs/replay.c
+F: qapi/replay.json
 
 IOVA Tree
 M: Peter Xu <peterx@redhat.com>
diff --git a/include/sysemu/replay.h b/include/sysemu/replay.h
index b3f593f2f0..3fe14b5f57 100644
--- a/include/sysemu/replay.h
+++ b/include/sysemu/replay.h
@@ -13,7 +13,7 @@
  */
 
 #include "sysemu.h"
-#include "qapi/qapi-types-misc.h"
+#include "qapi/qapi-types-replay.h"
 #include "qapi/qapi-types-ui.h"
 
 /* replay clock kinds */
diff --git a/qapi/Makefile.objs b/qapi/Makefile.objs
index 729e5185c5..ee77aac9b9 100644
--- a/qapi/Makefile.objs
+++ b/qapi/Makefile.objs
@@ -6,7 +6,7 @@ util-obj-y += qmp-event.o
 util-obj-y += qapi-util.o
 
 QAPI_COMMON_MODULES = audio authz block-core block char common crypto
-QAPI_COMMON_MODULES += introspect job migration misc net rdma rocker
+QAPI_COMMON_MODULES += introspect job migration misc net rdma replay rocker
 QAPI_COMMON_MODULES += run-state sockets tpm trace transaction ui
 QAPI_TARGET_MODULES = target
 QAPI_MODULES = $(QAPI_COMMON_MODULES) $(QAPI_TARGET_MODULES)
diff --git a/qapi/misc.json b/qapi/misc.json
index dc4cf9da20..9230c45832 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -2872,24 +2872,6 @@
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
index 4bd1223637..3bd5bc1320 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -97,6 +97,7 @@
 { 'include': 'transaction.json' }
 { 'include': 'trace.json' }
 { 'include': 'introspect.json' }
+{ 'include': 'replay.json' }
 { 'include': 'misc.json' }
 { 'include': 'target.json' }
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


