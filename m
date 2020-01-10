Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BD413778A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 20:53:09 +0100 (CET)
Received: from localhost ([::1]:51140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iq0LE-0007RN-8U
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 14:53:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44604)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iq0Ao-0001nN-WA
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 14:42:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iq0Am-0004xY-Eb
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 14:42:22 -0500
Received: from relay.sw.ru ([185.231.240.75]:53980)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iq0Am-0004md-3o; Fri, 10 Jan 2020 14:42:20 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iq0AU-0008Ob-NH; Fri, 10 Jan 2020 22:42:02 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 03/11] scripts: add coccinelle script to use auto
 propagated errp
Date: Fri, 10 Jan 2020 22:41:50 +0300
Message-Id: <20200110194158.14190-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200110194158.14190-1-vsementsov@virtuozzo.com>
References: <20200110194158.14190-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Laszlo Ersek <lersek@redhat.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>,
 Max Reitz <mreitz@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

CC: Cornelia Huck <cohuck@redhat.com>
CC: Eric Blake <eblake@redhat.com>
CC: Kevin Wolf <kwolf@redhat.com>
CC: Max Reitz <mreitz@redhat.com>
CC: Greg Kurz <groug@kaod.org>
CC: Stefan Hajnoczi <stefanha@redhat.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Anthony Perard <anthony.perard@citrix.com>
CC: Paul Durrant <paul@xen.org>
CC: "Philippe Mathieu-Daudé" <philmd@redhat.com>
CC: Laszlo Ersek <lersek@redhat.com>
CC: Gerd Hoffmann <kraxel@redhat.com>
CC: Stefan Berger <stefanb@linux.ibm.com>
CC: Markus Armbruster <armbru@redhat.com>
CC: Michael Roth <mdroth@linux.vnet.ibm.com>
CC: qemu-block@nongnu.org
CC: xen-devel@lists.xenproject.org

 include/qapi/error.h                          |   3 +
 scripts/coccinelle/auto-propagated-errp.cocci | 139 ++++++++++++++++++
 2 files changed, 142 insertions(+)
 create mode 100644 scripts/coccinelle/auto-propagated-errp.cocci

diff --git a/include/qapi/error.h b/include/qapi/error.h
index 532b9afb9e..dcfb77e107 100644
--- a/include/qapi/error.h
+++ b/include/qapi/error.h
@@ -141,6 +141,9 @@
  *         ...
  *     }
  *
+ * For mass conversion use script
+ *   scripts/coccinelle/auto-propagated-errp.cocci
+ *
  *
  * Receive and accumulate multiple errors (first one wins):
  *     Error *err = NULL, *local_err = NULL;
diff --git a/scripts/coccinelle/auto-propagated-errp.cocci b/scripts/coccinelle/auto-propagated-errp.cocci
new file mode 100644
index 0000000000..6c72a5049f
--- /dev/null
+++ b/scripts/coccinelle/auto-propagated-errp.cocci
@@ -0,0 +1,139 @@
+// Use ERRP_AUTO_PROPAGATE (see include/qapi/error.h)
+//
+// Copyright (c) 2020 Virtuozzo International GmbH.
+//
+// This program is free software; you can redistribute it and/or modify
+// it under the terms of the GNU General Public License as published by
+// the Free Software Foundation; either version 2 of the License, or
+// (at your option) any later version.
+//
+// This program is distributed in the hope that it will be useful,
+// but WITHOUT ANY WARRANTY; without even the implied warranty of
+// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+// GNU General Public License for more details.
+//
+// You should have received a copy of the GNU General Public License
+// along with this program.  If not, see <http://www.gnu.org/licenses/>.
+//
+// Usage example:
+// spatch --sp-file scripts/coccinelle/auto-propagated-errp.cocci \
+//  --macro-file scripts/cocci-macro-file.h --in-place --no-show-diff \
+//  blockdev-nbd.c qemu-nbd.c {block/nbd*,nbd/*,include/block/nbd*}.[hc]
+
+@@
+// Add invocation to errp-functions where necessary
+// We should skip functions with "Error *const *errp"
+// parameter, but how to do it with coccinelle?
+// I don't know, so, I skip them by function name regex.
+// It's safe: if we not skip some functions with
+// "Error *const *errp", ERRP_AUTO_PROPAGATE invocation
+// will fail to compile, because of const violation.
+identifier fn !~ "error_append_.*_hint";
+identifier local_err, errp;
+@@
+
+ fn(..., Error **errp, ...)
+ {
++   ERRP_AUTO_PROPAGATE();
+    <+...
+        when != ERRP_AUTO_PROPAGATE();
+(
+    error_append_hint(errp, ...);
+|
+    error_prepend(errp, ...);
+|
+    Error *local_err = NULL;
+)
+    ...+>
+ }
+
+@rule1@
+// We do not inherit from previous rule, as we want to match
+// also functions, which already had ERRP_AUTO_PROPAGATE
+// invocation.
+identifier fn !~ "error_append_.*_hint";
+identifier local_err, errp;
+@@
+
+ fn(..., Error **errp, ...)
+ {
+     <...
+-    Error *local_err = NULL;
+     ...>
+ }
+
+@@
+// Handle pattern with goto, otherwise we'll finish up
+// with labels at function end which will not compile.
+identifier rule1.fn, rule1.local_err, rule1.errp;
+identifier OUT;
+@@
+
+ fn(...)
+ {
+     <...
+-    goto OUT;
++    return;
+     ...>
+- OUT:
+-    error_propagate(errp, local_err);
+ }
+
+@@
+identifier rule1.fn, rule1.local_err, rule1.errp;
+expression list args; // to reindent error_propagate_prepend
+@@
+
+ fn(...)
+ {
+     <...
+(
+-    error_free(local_err);
+-    local_err = NULL;
++    error_free_errp(errp);
+|
+-    error_free(local_err);
++    error_free_errp(errp);
+|
+-    error_report_err(local_err);
++    error_report_errp(errp);
+|
+-    warn_report_err(local_err);
++    warn_report_errp(errp);
+|
+-    error_propagate_prepend(errp, local_err, args);
++    error_prepend(errp, args);
+|
+-    error_propagate(errp, local_err);
+)
+     ...>
+ }
+
+@@
+identifier rule1.fn, rule1.local_err, rule1.errp;
+@@
+
+ fn(...)
+ {
+     <...
+(
+-    &local_err
++    errp
+|
+-    local_err
++    *errp
+)
+     ...>
+ }
+
+@@
+identifier rule1.fn, rule1.errp;
+@@
+
+ fn(...)
+ {
+     <...
+- *errp != NULL
++ *errp
+     ...>
+ }
-- 
2.21.0


