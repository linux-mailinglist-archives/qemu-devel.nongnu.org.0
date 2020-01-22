Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D25146052
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 02:30:06 +0100 (CET)
Received: from localhost ([::1]:49738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuRJt-00029A-4n
	for lists+qemu-devel@lfdr.de; Wed, 22 Jan 2020 20:30:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59607)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <salva@freeso>) id 1iuNKM-0001dA-Hx
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 16:14:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <salva@freeso>) id 1iuNKL-0004Nu-2d
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 16:14:18 -0500
Received: from static.96.225.213.82.ibercom.com ([82.213.225.96]:52942
 helo=freeso)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <salva@freeso>)
 id 1iuNKK-0004Jq-RS; Wed, 22 Jan 2020 16:14:17 -0500
Received: from freeso (localhost [127.0.0.1])
 by freeso (8.15.2/8.15.2) with ESMTPS id 00MKLQVO017038
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 22 Jan 2020 21:21:26 +0100 (CET) (envelope-from salva@freeso)
Received: (from salva@localhost)
 by freeso (8.15.2/8.15.2/Submit) id 00MKLQWU017037;
 Wed, 22 Jan 2020 21:21:26 +0100 (CET) (envelope-from salva)
From: salvador@qindel.com
To: qemu-devel@nongnu.org
Subject: [PATCH] qemu_set_log_filename: filename argument may be NULL
Date: Wed, 22 Jan 2020 21:21:25 +0100
Message-Id: <20200122202125.16993-1-salvador@qindel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 82.213.225.96
X-Mailman-Approved-At: Wed, 22 Jan 2020 20:28:29 -0500
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
Cc: qemu-trivial@nongnu.org, sfandino@yahoo.com,
 Salvador Fandino <salvador@qindel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Salvador Fandino <salvador@qindel.com>

NULL is a valid log filename used to indicate we want to use stderr
but qemu_set_log_filename (which is called by bsd-user/main.c) was not
handling it correctly.

Signed-off-by: Salvador Fandino <salvador@qindel.com>
---
 util/log.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/util/log.c b/util/log.c
index 867264da8d..3cd2ebfdf4 100644
--- a/util/log.c
+++ b/util/log.c
@@ -151,22 +151,25 @@ void qemu_log_needs_buffers(void)
  */
 void qemu_set_log_filename(const char *filename, Error **errp)
 {
-    char *pidstr;
     g_free(logfilename);
     logfilename = NULL;
 
-    pidstr = strstr(filename, "%");
-    if (pidstr) {
-        /* We only accept one %d, no other format strings */
-        if (pidstr[1] != 'd' || strchr(pidstr + 2, '%')) {
-            error_setg(errp, "Bad logfile format: %s", filename);
-            return;
-        } else {
-            logfilename = g_strdup_printf(filename, getpid());
-        }
-    } else {
-        logfilename = g_strdup(filename);
+    if (filename) {
+            char *pidstr = strstr(filename, "%");
+            if (pidstr) {
+                /* We only accept one %d, no other format strings */
+                if (pidstr[1] != 'd' || strchr(pidstr + 2, '%')) {
+                    error_setg(errp, "Bad logfile format: %s", filename);
+                    return;
+                } else {
+                    logfilename = g_strdup_printf(filename, getpid());
+                }
+            } else {
+                logfilename = g_strdup(filename);
+            }
     }
+    /* else, let logfilename be NULL indicating we want to use stderr */
+
     qemu_log_close();
     qemu_set_log(qemu_loglevel);
 }
-- 
2.24.1


