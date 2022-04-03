Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 811794F0844
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Apr 2022 09:24:06 +0200 (CEST)
Received: from localhost ([::1]:55538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nauaj-00087Y-6K
	for lists+qemu-devel@lfdr.de; Sun, 03 Apr 2022 03:24:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sk@geekhouse>) id 1nauZg-0007Qo-6o
 for qemu-devel@nongnu.org; Sun, 03 Apr 2022 03:23:00 -0400
Received: from [2603:8080:1600:e3d:dd47:248e:8d78:b8d7] (port=52112
 helo=geekhouse)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sk@geekhouse>) id 1nauZe-00071X-KJ
 for qemu-devel@nongnu.org; Sun, 03 Apr 2022 03:22:59 -0400
Received: from geekhouse (localhost [127.0.0.1])
 by geekhouse (8.15.2/8.15.2/Debian-10) with ESMTP id 2337MtBU009298;
 Sun, 3 Apr 2022 02:22:55 -0500
Received: (from sk@localhost)
 by geekhouse (8.15.2/8.15.2/Submit) id 2337MtqA009294;
 Sun, 3 Apr 2022 02:22:55 -0500
From: Sakshi Kaushik <sakshikaushik717@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] [PATCH RFC v2] Implements Backend Program conventions for
 vhost-user-scsi
Date: Sun,  3 Apr 2022 02:21:48 -0500
Message-Id: <20220403072148.9248-1-sakshikaushik717@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2603:8080:1600:e3d:dd47:248e:8d78:b8d7 (failed)
Received-SPF: none client-ip=2603:8080:1600:e3d:dd47:248e:8d78:b8d7;
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
 contrib/vhost-user-scsi/vhost-user-scsi.c | 35 +++++++++++++++++++----
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/contrib/vhost-user-scsi/vhost-user-scsi.c b/contrib/vhost-user-scsi/vhost-user-scsi.c
index 4f6e3e2a24..9bdc088ce8 100644
--- a/contrib/vhost-user-scsi/vhost-user-scsi.c
+++ b/contrib/vhost-user-scsi/vhost-user-scsi.c
@@ -353,6 +353,8 @@ fail:
 
 int main(int argc, char **argv)
 {
+    static int opt_fdnum = -1;
+    static gboolean opt_print_caps;
     VusDev *vdev_scsi = NULL;
     char *unix_fn = NULL;
     char *iscsi_uri = NULL;
@@ -362,12 +364,18 @@ int main(int argc, char **argv)
         switch (opt) {
         case 'h':
             goto help;
-        case 'u':
+        case 's':
             unix_fn = g_strdup(optarg);
             break;
         case 'i':
             iscsi_uri = g_strdup(optarg);
             break;
+        case 'f':
+            opt_fdnum = g_strdup(optarg);
+            break;
+        case 'p':
+            opt_print_caps = g_strdup(optarg);
+            break;
         default:
             goto help;
         }
@@ -376,9 +384,22 @@ int main(int argc, char **argv)
         goto help;
     }
 
-    lsock = unix_sock_new(unix_fn);
-    if (lsock < 0) {
-        goto err;
+    if (unix_fn) {
+        lsock = unix_sock_new(unix_fn);
+        if (lsock < 0) {
+            exit(EXIT_FAILURE);
+        }
+    } else if (opt_fdnum < 0) {
+        g_print("%s\n", g_option_context_get_help(context, true, NULL));
+        exit(EXIT_FAILURE);
+    } else {
+        lsock = opt_fdnum;
+    }
+
+    if (opt_print_caps) {
+        if (opt_print_caps["type"] != "scsi") {
+            goto err;
+        }
     }
 
     csock = accept(lsock, NULL, NULL);
@@ -426,10 +447,12 @@ err:
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


