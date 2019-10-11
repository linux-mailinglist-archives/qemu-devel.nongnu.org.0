Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 447B6D45EA
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 18:57:11 +0200 (CEST)
Received: from localhost ([::1]:54228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIyE1-0006ot-T8
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 12:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36169)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iIxQn-000602-6z
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 12:06:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iIxQm-0004IR-7d
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 12:06:17 -0400
Received: from relay.sw.ru ([185.231.240.75]:47890)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iIxQl-00046m-W2
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 12:06:16 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iIxQa-0003XG-L7; Fri, 11 Oct 2019 19:06:04 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 021/126] qapi/error: add (Error **errp) cleaning APIs
Date: Fri, 11 Oct 2019 19:04:07 +0300
Message-Id: <20191011160552.22907-22-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191011160552.22907-1-vsementsov@virtuozzo.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qapi/error.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/include/qapi/error.h b/include/qapi/error.h
index 12532bdf69..d6898d833b 100644
--- a/include/qapi/error.h
+++ b/include/qapi/error.h
@@ -309,6 +309,29 @@ void warn_reportf_err(Error *err, const char *fmt, ...)
 void error_reportf_err(Error *err, const char *fmt, ...)
     GCC_FMT_ATTR(2, 3);
 
+/*
+ * Functions to clean Error **errp: call corresponding Error *err cleaning
+ * function an set pointer to NULL
+ */
+static inline void error_free_errp(Error **errp_in)
+{
+    error_free(*errp_in);
+    *errp_in = NULL;
+}
+
+static inline void error_report_errp(Error **errp_in)
+{
+    error_report_err(*errp_in);
+    *errp_in = NULL;
+}
+
+static inline void warn_report_errp(Error **errp_in)
+{
+    warn_report_err(*errp_in);
+    *errp_in = NULL;
+}
+
+
 /*
  * Just like error_setg(), except you get to specify the error class.
  * Note: use of error classes other than ERROR_CLASS_GENERIC_ERROR is
-- 
2.21.0


