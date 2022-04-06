Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 698854F64D6
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 18:27:08 +0200 (CEST)
Received: from localhost ([::1]:34920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc8Ut-000173-26
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 12:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sk@geekhouse>) id 1nc8T7-0008MF-SM
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 12:25:17 -0400
Received: from 2603-8080-1600-366f-8436-e75e-5f0f-0f6e.res6.spectrum.com
 ([2603:8080:1600:366f:8436:e75e:5f0f:f6e]:50682 helo=geekhouse)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sk@geekhouse>) id 1nc8T6-0000Qp-70
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 12:25:17 -0400
Received: from geekhouse (localhost [127.0.0.1])
 by geekhouse (8.15.2/8.15.2/Debian-10) with ESMTP id 236GPDpO008591;
 Wed, 6 Apr 2022 11:25:13 -0500
Received: (from sk@localhost)
 by geekhouse (8.15.2/8.15.2/Submit) id 236GPCdJ008583;
 Wed, 6 Apr 2022 11:25:12 -0500
From: Sakshi Kaushik <sakshikaushik717@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] [PATCH RFC v4] Implements Backend Program conventions for
 vhost-user-scsi
Date: Wed,  6 Apr 2022 11:24:10 -0500
Message-Id: <20220406162410.8536-1-sakshikaushik717@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: none client-ip=2603:8080:1600:366f:8436:e75e:5f0f:f6e;
 envelope-from=sk@geekhouse; helo=geekhouse
X-Spam_score_int: 40
X-Spam_score: 4.0
X-Spam_bar: ++++
X-Spam_report: (4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 FSL_HELO_NON_FQDN_1=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 HELO_NO_DOMAIN=0.001, KHOP_HELO_FCRDNS=0.187, NML_ADSP_CUSTOM_MED=0.9,
 PDS_RDNS_DYNAMIC_FP=0.001, RDNS_DYNAMIC=0.982, SPF_NONE=0.001,
 SPOOFED_FREEMAIL=1.522, SPOOF_GMAIL_MID=0.799,
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
 contrib/vhost-user-scsi/vhost-user-scsi.c | 78 +++++++++++++++--------
 1 file changed, 52 insertions(+), 26 deletions(-)

diff --git a/contrib/vhost-user-scsi/vhost-user-scsi.c b/contrib/vhost-user-scsi/vhost-user-scsi.c
index 4f6e3e2a24..0c38c2988c 100644
--- a/contrib/vhost-user-scsi/vhost-user-scsi.c
+++ b/contrib/vhost-user-scsi/vhost-user-scsi.c
@@ -351,34 +351,58 @@ fail:
 
 /** vhost-user-scsi **/
 
+static int opt_fdnum = -1;
+static char *opt_socket_path;
+static gboolean opt_print_caps;
+static char *iscsi_uri;
+
+static GOptionEntry entries[] = {
+    { "print-capabilities", 'c', 0, G_OPTION_ARG_NONE, &opt_print_caps,
+      "Print capabilities", NULL },
+    { "fd", 'f', 0, G_OPTION_ARG_INT, &opt_fdnum,
+      "Use inherited fd socket", "FDNUM" },
+    { "iscsi_uri", 'i', 0, G_OPTION_ARG_FILENAME, &iscsi_uri,
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
-    int lsock = -1, csock = -1, opt, err = EXIT_SUCCESS;
-
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
+    int lsock = -1, csock = -1, err = EXIT_SUCCESS;
+
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
+        g_print("  \"type\": \"scsi\"\n");
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
@@ -408,7 +432,7 @@ out:
     if (vdev_scsi) {
         g_main_loop_unref(vdev_scsi->loop);
         g_free(vdev_scsi);
-        unlink(unix_fn);
+        unlink(opt_socket_path);
     }
     if (csock >= 0) {
         close(csock);
@@ -416,7 +440,7 @@ out:
     if (lsock >= 0) {
         close(lsock);
     }
-    g_free(unix_fn);
+    g_free(opt_socket_path);
     g_free(iscsi_uri);
 
     return err;
@@ -426,10 +450,12 @@ err:
     goto out;
 
 help:
-    fprintf(stderr, "Usage: %s [ -u unix_sock_path -i iscsi_uri ] | [ -h ]\n",
+    fprintf(stderr, "Usage: %s [ -s socket-path -i iscsi_uri -f fd -p print-capabilities ] | [ -h ]\n",
             argv[0]);
-    fprintf(stderr, "          -u path to unix socket\n");
-    fprintf(stderr, "          -i iscsi uri for lun 0\n");
+    fprintf(stderr, "          -s, --socket-path=SOCKET_PATH path to unix socket\n");
+    fprintf(stderr, "          -i, --iscsi_uri=ISCSI_URI iscsi uri for lun 0\n");
+    fprintf(stderr, "          -f --fd=FILE_DESCRIPTOR file-descriptor\n");
+    fprintf(stderr, "          -p --print-capabilities=PRINT_CAPABILITIES denotes print-capabilities\n");
     fprintf(stderr, "          -h print help and quit\n");
 
     goto err;
-- 
2.17.1


