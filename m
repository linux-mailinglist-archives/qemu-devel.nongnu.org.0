Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC77B137769
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 20:44:32 +0100 (CET)
Received: from localhost ([::1]:51016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iq0Ct-0003gD-F7
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 14:44:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44564)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iq0Ao-0001mG-9Q
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 14:42:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iq0Am-0004y0-H0
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 14:42:22 -0500
Received: from relay.sw.ru ([185.231.240.75]:53970)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iq0Am-0004mZ-80; Fri, 10 Jan 2020 14:42:20 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iq0AT-0008Ob-Ta; Fri, 10 Jan 2020 22:42:02 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 01/11] qapi/error: add (Error **errp) cleaning APIs
Date: Fri, 10 Jan 2020 22:41:48 +0300
Message-Id: <20200110194158.14190-2-vsementsov@virtuozzo.com>
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

 include/qapi/error.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/qapi/error.h b/include/qapi/error.h
index ad5b6e896d..fa8d51fd6d 100644
--- a/include/qapi/error.h
+++ b/include/qapi/error.h
@@ -309,6 +309,32 @@ void warn_reportf_err(Error *err, const char *fmt, ...)
 void error_reportf_err(Error *err, const char *fmt, ...)
     GCC_FMT_ATTR(2, 3);
 
+/*
+ * Functions to clean Error **errp: call corresponding Error *err cleaning
+ * function an set pointer to NULL
+ */
+static inline void error_free_errp(Error **errp)
+{
+    assert(errp && *errp);
+    error_free(*errp);
+    *errp = NULL;
+}
+
+static inline void error_report_errp(Error **errp)
+{
+    assert(errp && *errp);
+    error_report_err(*errp);
+    *errp = NULL;
+}
+
+static inline void warn_report_errp(Error **errp)
+{
+    assert(errp && *errp);
+    warn_report_err(*errp);
+    *errp = NULL;
+}
+
+
 /*
  * Just like error_setg(), except you get to specify the error class.
  * Note: use of error classes other than ERROR_CLASS_GENERIC_ERROR is
-- 
2.21.0


