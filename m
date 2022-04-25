Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F01F350DBBA
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 10:53:55 +0200 (CEST)
Received: from localhost ([::1]:52988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niuTj-0007Xw-2q
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 04:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1niuOz-0004Fm-2d
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:49:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1niuOx-0006JQ-70
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:49:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650876538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+lt2Y7ttFZCI3alSKhDye7gi1kevyPNN+RGb1Tv/Aec=;
 b=Y8nq+MbW633mZJcHsd5I/q0LcqUsGtUl5W4GqKsnlKN97yNmrfpIAtX5aNG+3eap0bXp0F
 q88LxJqbAI4Aq0eC+VYjaZwk4/Jaosj0cOE0lI62rn4LVZE0d7hP4gA4ekzqVo7CwfIW3a
 irgzsYUXX4UX32qOhWOaVIcqJxz4kXI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-MNRrisejOZ6TrE_gdXsUbA-1; Mon, 25 Apr 2022 04:48:51 -0400
X-MC-Unique: MNRrisejOZ6TrE_gdXsUbA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B65DC101AA44;
 Mon, 25 Apr 2022 08:48:50 +0000 (UTC)
Received: from localhost (unknown [10.39.192.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 215B440CF910;
 Mon, 25 Apr 2022 08:48:50 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] Implements Backend Program conventions for vhost-user-scsi
Date: Mon, 25 Apr 2022 09:48:42 +0100
Message-Id: <20220425084844.1086768-2-stefanha@redhat.com>
In-Reply-To: <20220425084844.1086768-1-stefanha@redhat.com>
References: <20220425084844.1086768-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Sakshi Kaushik <sakshikaushik717@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sakshi Kaushik <sakshikaushik717@gmail.com>

Signed-off-by: Sakshi Kaushik <sakshikaushik717@gmail.com>
Message-id: 20220406162410.8536-1-sakshikaushik717@gmail.com

[Name the iSCSI URL long option --iscsi-uri instead of --iscsi_uri for
consistency, fix --fd which was rejected due to an outdated
--socket-path check, and add missing entries[] terminator.
--Stefan]

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 contrib/vhost-user-scsi/vhost-user-scsi.c | 77 +++++++++++++++--------
 1 file changed, 52 insertions(+), 25 deletions(-)

diff --git a/contrib/vhost-user-scsi/vhost-user-scsi.c b/contrib/vhost-user-scsi/vhost-user-scsi.c
index 4f6e3e2a24..b2c0f98253 100644
--- a/contrib/vhost-user-scsi/vhost-user-scsi.c
+++ b/contrib/vhost-user-scsi/vhost-user-scsi.c
@@ -351,34 +351,59 @@ fail:
 
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
+    { "iscsi-uri", 'i', 0, G_OPTION_ARG_FILENAME, &iscsi_uri,
+      "iSCSI URI to connect to", "FDNUM" },
+    { "socket-path", 's', 0, G_OPTION_ARG_FILENAME, &opt_socket_path,
+      "Use UNIX socket path", "PATH" },
+    { NULL, }
+};
+
 int main(int argc, char **argv)
 {
     VusDev *vdev_scsi = NULL;
-    char *unix_fn = NULL;
-    char *iscsi_uri = NULL;
-    int lsock = -1, csock = -1, opt, err = EXIT_SUCCESS;
+    int lsock = -1, csock = -1, err = EXIT_SUCCESS;
 
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
+    }
+
+    if (opt_print_caps) {
+        g_print("{\n");
+        g_print("  \"type\": \"scsi\"\n");
+        g_print("}\n");
+        goto out;
     }
-    if (!unix_fn || !iscsi_uri) {
+
+    if (!iscsi_uri) {
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
@@ -408,7 +433,7 @@ out:
     if (vdev_scsi) {
         g_main_loop_unref(vdev_scsi->loop);
         g_free(vdev_scsi);
-        unlink(unix_fn);
+        unlink(opt_socket_path);
     }
     if (csock >= 0) {
         close(csock);
@@ -416,7 +441,7 @@ out:
     if (lsock >= 0) {
         close(lsock);
     }
-    g_free(unix_fn);
+    g_free(opt_socket_path);
     g_free(iscsi_uri);
 
     return err;
@@ -426,10 +451,12 @@ err:
     goto out;
 
 help:
-    fprintf(stderr, "Usage: %s [ -u unix_sock_path -i iscsi_uri ] | [ -h ]\n",
+    fprintf(stderr, "Usage: %s [ -s socket-path -i iscsi-uri -f fd -p print-capabilities ] | [ -h ]\n",
             argv[0]);
-    fprintf(stderr, "          -u path to unix socket\n");
-    fprintf(stderr, "          -i iscsi uri for lun 0\n");
+    fprintf(stderr, "          -s, --socket-path=SOCKET_PATH path to unix socket\n");
+    fprintf(stderr, "          -i, --iscsi-uri=ISCSI_URI iscsi uri for lun 0\n");
+    fprintf(stderr, "          -f, --fd=FILE_DESCRIPTOR file-descriptor\n");
+    fprintf(stderr, "          -p, --print-capabilities=PRINT_CAPABILITIES denotes print-capabilities\n");
     fprintf(stderr, "          -h print help and quit\n");
 
     goto err;
-- 
2.35.1


