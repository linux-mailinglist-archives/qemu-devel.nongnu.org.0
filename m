Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A75114662
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Dec 2019 18:58:23 +0100 (CET)
Received: from localhost ([::1]:58882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icvOQ-0001xC-DD
	for lists+qemu-devel@lfdr.de; Thu, 05 Dec 2019 12:58:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46078)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1icvDR-0007rc-SS
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 12:47:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1icvDQ-0004Dg-Eb
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 12:47:01 -0500
Received: from relay.sw.ru ([185.231.240.75]:48358)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1icvDQ-0003VZ-5G
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 12:47:00 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1icvD6-00013M-5Q; Thu, 05 Dec 2019 20:46:40 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 03/21] error: make Error **errp const where it is
 appropriate
Date: Thu,  5 Dec 2019 20:46:17 +0300
Message-Id: <20191205174635.18758-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191205174635.18758-1-vsementsov@virtuozzo.com>
References: <20191205174635.18758-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
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
Cc: vsementsov@virtuozzo.com, armbru@redhat.com,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mostly, Error ** is for returning error from the function, so the
callee sets it. However these three functions get already filled errp
parameter. They dont change the pointer itself, only change the
internal state of referenced Error object. So we can make it
Error *const * errp, to stress the behavior. It will also help
coccinelle script (in future) to distinguish such cases from common
errp usage.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qapi/error.h | 6 +++---
 util/error.c         | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/qapi/error.h b/include/qapi/error.h
index 3f95141a01..ad5b6e896d 100644
--- a/include/qapi/error.h
+++ b/include/qapi/error.h
@@ -233,13 +233,13 @@ void error_propagate_prepend(Error **dst_errp, Error *local_err,
  * Prepend some text to @errp's human-readable error message.
  * The text is made by formatting @fmt, @ap like vprintf().
  */
-void error_vprepend(Error **errp, const char *fmt, va_list ap);
+void error_vprepend(Error *const *errp, const char *fmt, va_list ap);
 
 /*
  * Prepend some text to @errp's human-readable error message.
  * The text is made by formatting @fmt, ... like printf().
  */
-void error_prepend(Error **errp, const char *fmt, ...)
+void error_prepend(Error *const *errp, const char *fmt, ...)
     GCC_FMT_ATTR(2, 3);
 
 /*
@@ -256,7 +256,7 @@ void error_prepend(Error **errp, const char *fmt, ...)
  * May be called multiple times.  The resulting hint should end with a
  * newline.
  */
-void error_append_hint(Error **errp, const char *fmt, ...)
+void error_append_hint(Error *const *errp, const char *fmt, ...)
     GCC_FMT_ATTR(2, 3);
 
 /*
diff --git a/util/error.c b/util/error.c
index d4532ce318..b6c89d1412 100644
--- a/util/error.c
+++ b/util/error.c
@@ -121,7 +121,7 @@ void error_setg_file_open_internal(Error **errp,
                               "Could not open '%s'", filename);
 }
 
-void error_vprepend(Error **errp, const char *fmt, va_list ap)
+void error_vprepend(Error *const *errp, const char *fmt, va_list ap)
 {
     GString *newmsg;
 
@@ -136,7 +136,7 @@ void error_vprepend(Error **errp, const char *fmt, va_list ap)
     (*errp)->msg = g_string_free(newmsg, 0);
 }
 
-void error_prepend(Error **errp, const char *fmt, ...)
+void error_prepend(Error *const *errp, const char *fmt, ...)
 {
     va_list ap;
 
@@ -145,7 +145,7 @@ void error_prepend(Error **errp, const char *fmt, ...)
     va_end(ap);
 }
 
-void error_append_hint(Error **errp, const char *fmt, ...)
+void error_append_hint(Error *const *errp, const char *fmt, ...)
 {
     va_list ap;
     int saved_errno = errno;
-- 
2.21.0


