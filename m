Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 930A84F0CEC
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 01:17:31 +0200 (CEST)
Received: from localhost ([::1]:59958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nb9TO-0001m9-7p
	for lists+qemu-devel@lfdr.de; Sun, 03 Apr 2022 19:17:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sk@geekhouse>) id 1nb9SG-00011f-No
 for qemu-devel@nongnu.org; Sun, 03 Apr 2022 19:16:20 -0400
Received: from [2603:8080:1600:366f:c5f7:62be:6bae:1d59] (port=51676
 helo=geekhouse)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sk@geekhouse>) id 1nb9SE-0000zT-Se
 for qemu-devel@nongnu.org; Sun, 03 Apr 2022 19:16:20 -0400
Received: from geekhouse (localhost [127.0.0.1])
 by geekhouse (8.15.2/8.15.2/Debian-10) with ESMTP id 233N53Y8019810;
 Sun, 3 Apr 2022 18:05:03 -0500
Received: (from sk@localhost)
 by geekhouse (8.15.2/8.15.2/Submit) id 233N52PG019760;
 Sun, 3 Apr 2022 18:05:02 -0500
From: Sakshi Kaushik <sakshikaushik717@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] [PATCH RFC v3] Implements Backend Program conventions for
 vhost-user-scsi
Date: Sun,  3 Apr 2022 18:03:57 -0500
Message-Id: <20220403230357.19715-1-sakshikaushik717@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2603:8080:1600:366f:c5f7:62be:6bae:1d59 (failed)
Received-SPF: none client-ip=2603:8080:1600:366f:c5f7:62be:6bae:1d59;
 envelope-from=sk@geekhouse; helo=geekhouse
X-Spam_score_int: 36
X-Spam_score: 3.6
X-Spam_bar: +++
X-Spam_report: (3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 FSL_HELO_NON_FQDN_1=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 HELO_NO_DOMAIN=0.001, NML_ADSP_CUSTOM_MED=0.9, RDNS_NONE=0.793, SPF_NONE=0.001,
 SPOOFED_FREEMAIL=1.522, SPOOFED_FREEMAIL_NO_RDNS=0.001, SPOOF_GMAIL_MID=0.799,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: raphel.norwitz@nutanix.com, Sakshi Kaushik <sakshikaushik717@gmail.com>,
 stefanha@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Sakshi Kaushik <sakshikaushik717@gmail.com>
---
 contrib/vhost-user-scsi/vhost-user-scsi.c | 71 +++++++++++++++--------
 1 file changed, 48 insertions(+), 23 deletions(-)

diff --git a/contrib/vhost-user-scsi/vhost-user-scsi.c b/contrib/vhost-user-scsi/vhost-user-scsi.c
index 4f6e3e2a24..41f3314cdc 100644
--- a/contrib/vhost-user-scsi/vhost-user-scsi.c
+++ b/contrib/vhost-user-scsi/vhost-user-scsi.c
@@ -351,34 +351,57 @@ fail:
 
 /** vhost-user-scsi **/
 
+int opt_fdnum = -1;
+char *opt_socket_path;
+gboolean opt_print_caps;
+
+static GOptionEntry entries[] = {
+    { "print-capabilities", 'c', 0, G_OPTION_ARG_NONE, &opt_print_caps,
+      "Print capabilities", NULL },
+    { "fd", 'f', 0, G_OPTION_ARG_INT, &opt_fdnum,
+      "Use inherited fd socket", "FDNUM" },
+    { "iscsi_uri", 'i', 0, G_OPTION_ARG_INT, &iscsi_uri,
+      "Use inherited fd socket", "FDNUM" },
+    { "socket-path", 's', 0, G_OPTION_ARG_FILENAME, &opt_socket_path,
+      "Use UNIX socket path", "PATH" }
+};
+
 int main(int argc, char **argv)
 {
     VusDev *vdev_scsi = NULL;
-    char *unix_fn = NULL;
-    char *iscsi_uri = NULL;
     int lsock = -1, csock = -1, opt, err = EXIT_SUCCESS;
 
-    while ((opt = getopt(argc, argv, "u:i:")) != -1) {
-        switch (opt) {
-        case 'h':
-            goto help;
-        case 'u':
-            unix_fn = g_strdup(optarg);
-            break;
-        case 'i':
-            iscsi_uri = g_strdup(optarg);
-            break;
-        default:
-            goto help;
-        }
+    GError *error = NULL;
+    GOptionContext *context;
+
+    context = g_option_context_new(NULL);
+    g_option_context_add_main_entries(context, entries, NULL);
+    if (!g_option_context_parse(context, &argc, &argv, &error)) {
+        g_printerr("Option parsing failed: %s\n", error->message);
+        exit(EXIT_FAILURE);
     }
-    if (!unix_fn || !iscsi_uri) {
+
+    if (opt_print_caps) {
+        g_print("{\n");
+        g_print("  \"type\": \"scsi\",\n");
+        g_print("}\n");
+        goto out;
+    }
+
+    if (!opt_socket_path || !iscsi_uri) {
         goto help;
     }
 
-    lsock = unix_sock_new(unix_fn);
-    if (lsock < 0) {
-        goto err;
+    if (opt_socket_path) {
+        lsock = unix_sock_new(opt_socket_path);
+        if (lsock < 0) {
+            exit(EXIT_FAILURE);
+        }
+    } else if (opt_fdnum < 0) {
+        g_print("%s\n", g_option_context_get_help(context, true, NULL));
+        exit(EXIT_FAILURE);
+    } else {
+        lsock = opt_fdnum;
     }
 
     csock = accept(lsock, NULL, NULL);
@@ -408,7 +431,7 @@ out:
     if (vdev_scsi) {
         g_main_loop_unref(vdev_scsi->loop);
         g_free(vdev_scsi);
-        unlink(unix_fn);
+        unlink(opt_socket_path);
     }
     if (csock >= 0) {
         close(csock);
@@ -416,7 +439,7 @@ out:
     if (lsock >= 0) {
         close(lsock);
     }
-    g_free(unix_fn);
+    g_free(opt_socket_path);
     g_free(iscsi_uri);
 
     return err;
@@ -426,10 +449,12 @@ err:
     goto out;
 
 help:
-    fprintf(stderr, "Usage: %s [ -u unix_sock_path -i iscsi_uri ] | [ -h ]\n",
+    fprintf(stderr, "Usage: %s [ -s socket-path -i iscsi_uri -f fd -p print-capabilities ] | [ -h ]\n",
             argv[0]);
-    fprintf(stderr, "          -u path to unix socket\n");
+    fprintf(stderr, "          -s path to unix socket\n");
     fprintf(stderr, "          -i iscsi uri for lun 0\n");
+    fprintf(stderr, "          -f fd, file-descriptor\n");
+    fprintf(stderr, "          -p denotes print-capabilities\n");
     fprintf(stderr, "          -h print help and quit\n");
 
     goto err;
-- 
2.17.1


