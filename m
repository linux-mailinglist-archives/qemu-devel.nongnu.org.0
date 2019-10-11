Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 973E5D454C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 18:22:21 +0200 (CEST)
Received: from localhost ([::1]:53678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIxgK-0006fb-M8
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 12:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36113)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iIxQl-0005wq-AG
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 12:06:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iIxQk-0004Fx-4m
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 12:06:15 -0400
Received: from relay.sw.ru ([185.231.240.75]:47844)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iIxQj-00045D-Si
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 12:06:14 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iIxQX-0003XG-4n; Fri, 11 Oct 2019 19:06:01 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 013/126] qga: rename Error ** parameter to more common errp
Date: Fri, 11 Oct 2019 19:03:59 +0300
Message-Id: <20191011160552.22907-14-vsementsov@virtuozzo.com>
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
 qga/commands-posix.c |  2 +-
 qga/commands-win32.c |  2 +-
 qga/commands.c       | 12 ++++++------
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index dfc05f5b8a..6dcd2d5db6 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2780,7 +2780,7 @@ static double ga_get_login_time(struct utmpx *user_info)
     return seconds + useconds;
 }
 
-GuestUserList *qmp_guest_get_users(Error **err)
+GuestUserList *qmp_guest_get_users(Error **errp)
 {
     GHashTable *cache = NULL;
     GuestUserList *head = NULL, *cur_item = NULL;
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 6b67f16faf..9789465b4a 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -1946,7 +1946,7 @@ typedef struct _GA_WTSINFOA {
 
 } GA_WTSINFOA;
 
-GuestUserList *qmp_guest_get_users(Error **err)
+GuestUserList *qmp_guest_get_users(Error **errp)
 {
 #define QGA_NANOSECONDS 10000000
 
diff --git a/qga/commands.c b/qga/commands.c
index 0c7d1385c2..43c323cead 100644
--- a/qga/commands.c
+++ b/qga/commands.c
@@ -143,7 +143,7 @@ static GuestExecInfo *guest_exec_info_find(int64_t pid_numeric)
     return NULL;
 }
 
-GuestExecStatus *qmp_guest_exec_status(int64_t pid, Error **err)
+GuestExecStatus *qmp_guest_exec_status(int64_t pid, Error **errp)
 {
     GuestExecInfo *gei;
     GuestExecStatus *ges;
@@ -152,7 +152,7 @@ GuestExecStatus *qmp_guest_exec_status(int64_t pid, Error **err)
 
     gei = guest_exec_info_find(pid);
     if (gei == NULL) {
-        error_setg(err, QERR_INVALID_PARAMETER, "pid");
+        error_setg(errp, QERR_INVALID_PARAMETER, "pid");
         return NULL;
     }
 
@@ -385,7 +385,7 @@ GuestExec *qmp_guest_exec(const char *path,
                        bool has_env, strList *env,
                        bool has_input_data, const char *input_data,
                        bool has_capture_output, bool capture_output,
-                       Error **err)
+                       Error **errp)
 {
     GPid pid;
     GuestExec *ge = NULL;
@@ -405,7 +405,7 @@ GuestExec *qmp_guest_exec(const char *path,
     arglist.next = has_arg ? arg : NULL;
 
     if (has_input_data) {
-        input = qbase64_decode(input_data, -1, &ninput, err);
+        input = qbase64_decode(input_data, -1, &ninput, errp);
         if (!input) {
             return NULL;
         }
@@ -424,7 +424,7 @@ GuestExec *qmp_guest_exec(const char *path,
             guest_exec_task_setup, NULL, &pid, has_input_data ? &in_fd : NULL,
             has_output ? &out_fd : NULL, has_output ? &err_fd : NULL, &gerr);
     if (!ret) {
-        error_setg(err, QERR_QGA_COMMAND_FAILED, gerr->message);
+        error_setg(errp, QERR_QGA_COMMAND_FAILED, gerr->message);
         g_error_free(gerr);
         goto done;
     }
@@ -499,7 +499,7 @@ int ga_parse_whence(GuestFileWhence *whence, Error **errp)
     return -1;
 }
 
-GuestHostName *qmp_guest_get_host_name(Error **err)
+GuestHostName *qmp_guest_get_host_name(Error **errp)
 {
     GuestHostName *result = NULL;
     gchar const *hostname = g_get_host_name();
-- 
2.21.0


