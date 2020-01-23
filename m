Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 512CB14721F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 20:52:24 +0100 (CET)
Received: from localhost ([::1]:60694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuiWd-0006pv-Bf
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 14:52:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37898)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <salvador@qindel.com>) id 1iuiT7-0000rQ-4Y
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 14:48:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <salvador@qindel.com>) id 1iuiI6-00074w-8h
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 14:37:23 -0500
Received: from smtp.qindel.com ([89.140.90.34]:47485 helo=thor.qindel.com)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <salvador@qindel.com>)
 id 1iuiI5-00070w-UH; Thu, 23 Jan 2020 14:37:22 -0500
Received: from localhost (localhost [127.0.0.1])
 by thor.qindel.com (Postfix) with ESMTP id B3A5060571;
 Thu, 23 Jan 2020 20:37:18 +0100 (CET)
Received: from thor.qindel.com ([127.0.0.1])
 by localhost (thor.qindel.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ImGDaDvOek7W; Thu, 23 Jan 2020 20:37:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by thor.qindel.com (Postfix) with ESMTP id 6C99A6057A;
 Thu, 23 Jan 2020 20:37:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at thor.qindel.com
Received: from thor.qindel.com ([127.0.0.1])
 by localhost (thor.qindel.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id IMLVbuOu9ius; Thu, 23 Jan 2020 20:37:18 +0100 (CET)
Received: from freeso.my.domain (unknown [82.213.225.96])
 by thor.qindel.com (Postfix) with ESMTPSA id ED26260571;
 Thu, 23 Jan 2020 20:37:17 +0100 (CET)
From: salvador@qindel.com
To: qemu-devel@nongnu.org
Subject: [PATCH] qemu_set_log_filename: filename argument may be NULL
Date: Thu, 23 Jan 2020 20:36:26 +0100
Message-Id: <20200123193626.19956-1-salvador@qindel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123113225.GB691377@stefanha-x1.localdomain>
References: <20200123113225.GB691377@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 89.140.90.34
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
Cc: qemu-trivial@nongnu.org, stefanha@gmail.com, sfandino@yahoo.com,
 Salvador Fandino <salvador@qindel.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Salvador Fandino <salvador@qindel.com>

NULL is a valid log filename used to indicate we want to use stderr
but qemu_set_log_filename (which is called by bsd-user/main.c) was not
handling it correctly.

That also made redundant a couple of NULL checks in calling code which
have been removed.

Signed-off-by: Salvador Fandino <salvador@qindel.com>
---
 trace/control.c |  4 +---
 util/log.c      | 28 ++++++++++++++++------------
 vl.c            |  5 +----
 3 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/trace/control.c b/trace/control.c
index 0fb8124160..6c775e68eb 100644
--- a/trace/control.c
+++ b/trace/control.c
@@ -229,9 +229,7 @@ void trace_init_file(const char *file)
     /* If both the simple and the log backends are enabled, "--trace fil=
e"
      * only applies to the simple backend; use "-D" for the log backend.
      */
-    if (file) {
-        qemu_set_log_filename(file, &error_fatal);
-    }
+    qemu_set_log_filename(file, &error_fatal);
 #else
     if (file) {
         fprintf(stderr, "error: --trace file=3D...: "
diff --git a/util/log.c b/util/log.c
index 867264da8d..47f2827397 100644
--- a/util/log.c
+++ b/util/log.c
@@ -148,25 +148,29 @@ void qemu_log_needs_buffers(void)
  * Allow the user to include %d in their logfile which will be
  * substituted with the current PID. This is useful for debugging many
  * nested linux-user tasks but will result in lots of logs.
+ *
+ * filename may be NULL. In that case, log output is sent to stderr
  */
 void qemu_set_log_filename(const char *filename, Error **errp)
 {
-    char *pidstr;
     g_free(logfilename);
     logfilename =3D NULL;
=20
-    pidstr =3D strstr(filename, "%");
-    if (pidstr) {
-        /* We only accept one %d, no other format strings */
-        if (pidstr[1] !=3D 'd' || strchr(pidstr + 2, '%')) {
-            error_setg(errp, "Bad logfile format: %s", filename);
-            return;
-        } else {
-            logfilename =3D g_strdup_printf(filename, getpid());
-        }
-    } else {
-        logfilename =3D g_strdup(filename);
+    if (filename) {
+            char *pidstr =3D strstr(filename, "%");
+            if (pidstr) {
+                /* We only accept one %d, no other format strings */
+                if (pidstr[1] !=3D 'd' || strchr(pidstr + 2, '%')) {
+                    error_setg(errp, "Bad logfile format: %s", filename)=
;
+                    return;
+                } else {
+                    logfilename =3D g_strdup_printf(filename, getpid());
+                }
+            } else {
+                logfilename =3D g_strdup(filename);
+            }
     }
+
     qemu_log_close();
     qemu_set_log(qemu_loglevel);
 }
diff --git a/vl.c b/vl.c
index 71d3e7eefb..affe896c6e 100644
--- a/vl.c
+++ b/vl.c
@@ -3886,10 +3886,7 @@ int main(int argc, char **argv, char **envp)
=20
     /* Open the logfile at this point and set the log mask if necessary.
      */
-    if (log_file) {
-        qemu_set_log_filename(log_file, &error_fatal);
-    }
-
+    qemu_set_log_filename(log_file, &error_fatal);
     if (log_mask) {
         int mask;
         mask =3D qemu_str_to_log_mask(log_mask);
--=20
2.24.1


