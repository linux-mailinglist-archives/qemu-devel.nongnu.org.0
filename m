Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 707BB510965
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 22:00:20 +0200 (CEST)
Received: from localhost ([::1]:35360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njRMB-0002dM-Fn
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 16:00:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1njRIC-0004d4-LW
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 15:56:12 -0400
Received: from smtp116.iad3a.emailsrvr.com ([173.203.187.116]:40955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1njRIA-0004cC-Sq
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 15:56:12 -0400
X-Auth-ID: adeason@sinenomine.net
Received: by smtp31.relay.iad3a.emailsrvr.com (Authenticated sender:
 adeason-AT-sinenomine.net) with ESMTPSA id 28007248BE; 
 Tue, 26 Apr 2022 15:55:46 -0400 (EDT)
From: Andrew Deason <adeason@sinenomine.net>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/5] qga/commands-posix: 'guest-shutdown' for Solaris
Date: Tue, 26 Apr 2022 14:55:26 -0500
Message-Id: <20220426195526.7699-6-adeason@sinenomine.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220426195526.7699-1-adeason@sinenomine.net>
References: <20220426195526.7699-1-adeason@sinenomine.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Classification-ID: cc5ef99f-0605-4056-825c-a202bb8c6ff8-6-1
Received-SPF: pass client-ip=173.203.187.116;
 envelope-from=adeason@sinenomine.net; helo=smtp116.iad3a.emailsrvr.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Andrew Deason <adeason@sinenomine.net>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Solaris, instead of the -P, -H, and -r flags, we need to provide
the target init state to the 'shutdown' command: state 5 is poweroff,
0 is halt, and 6 is reboot. We also need to pass -g0 to avoid the
default 60-second delay, and -y to avoid a confirmation prompt.

Implement this logic under an #ifdef CONFIG_SOLARIS, so the
'guest-shutdown' command works properly on Solaris.

Signed-off-by: Andrew Deason <adeason@sinenomine.net>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
Changes since v1:
- new in v2

 qga/commands-posix.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index cc565e0dfd..386c1ccbc6 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -78,43 +78,58 @@ static void ga_wait_child(pid_t pid, int *status, Error **errp)
     g_assert(rpid == pid);
 }
 
 void qmp_guest_shutdown(bool has_mode, const char *mode, Error **errp)
 {
     const char *shutdown_flag;
     Error *local_err = NULL;
     pid_t pid;
     int status;
 
+#ifdef CONFIG_SOLARIS
+    const char *powerdown_flag = "-i5";
+    const char *halt_flag = "-i0";
+    const char *reboot_flag = "-i6";
+#else
+    const char *powerdown_flag = "-P";
+    const char *halt_flag = "-H";
+    const char *reboot_flag = "-r";
+#endif
+
     slog("guest-shutdown called, mode: %s", mode);
     if (!has_mode || strcmp(mode, "powerdown") == 0) {
-        shutdown_flag = "-P";
+        shutdown_flag = powerdown_flag;
     } else if (strcmp(mode, "halt") == 0) {
-        shutdown_flag = "-H";
+        shutdown_flag = halt_flag;
     } else if (strcmp(mode, "reboot") == 0) {
-        shutdown_flag = "-r";
+        shutdown_flag = reboot_flag;
     } else {
         error_setg(errp,
                    "mode is invalid (valid values are: halt|powerdown|reboot");
         return;
     }
 
     pid = fork();
     if (pid == 0) {
         /* child, start the shutdown */
         setsid();
         reopen_fd_to_null(0);
         reopen_fd_to_null(1);
         reopen_fd_to_null(2);
 
+#ifdef CONFIG_SOLARIS
+        execl("/sbin/shutdown", "shutdown", shutdown_flag, "-g0", "-y",
+              "hypervisor initiated shutdown", (char *)NULL);
+#else
         execl("/sbin/shutdown", "shutdown", "-h", shutdown_flag, "+0",
                "hypervisor initiated shutdown", (char *)NULL);
+#endif
         _exit(EXIT_FAILURE);
     } else if (pid < 0) {
         error_setg_errno(errp, errno, "failed to create child process");
         return;
     }
 
     ga_wait_child(pid, &status, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
-- 
2.11.0


