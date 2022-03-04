Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D49944CD3EC
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 13:02:18 +0100 (CET)
Received: from localhost ([::1]:53464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ6dV-0000ZC-TI
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 07:02:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQ6Yz-0006RF-RX
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:57:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQ6Yy-0006Q7-3u
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:57:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646395055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1nYHzC/UfWPANjgBseo3XpxZKrIiVBEM621wJS1z1is=;
 b=OwywhA44aeDRuP9bkF5icRbKzwxAweIKyWCA1KdCdrM9eFgX3zbi8q+GN0acwoiSwsX/e5
 X9zwzbIZmFHpPA2i81eAh9EKkKhy73Pn8T5lKSjEHsuCUqkSZe18MpMuNr8BKd3pjlYaT8
 pvusByCUx6f8o6fkORAsoSfcg2QjDUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-N2UhB4Q4Nze1M-C789TasQ-1; Fri, 04 Mar 2022 06:57:34 -0500
X-MC-Unique: N2UhB4Q4Nze1M-C789TasQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77AFE8070ED;
 Fri,  4 Mar 2022 11:57:33 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 331712B450;
 Fri,  4 Mar 2022 11:57:31 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] os-posix: refactor code handling the -runas argument
Date: Fri,  4 Mar 2022 11:56:55 +0000
Message-Id: <20220304115657.3177925-3-berrange@redhat.com>
In-Reply-To: <20220304115657.3177925-1-berrange@redhat.com>
References: <20220304115657.3177925-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 libvir-list@redhat.com, Stefan Weil <sw@weilnetz.de>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change the change_process_uid() function so that it takes its input as
parameters instead of relying on static global variables.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 os-posix.c | 83 +++++++++++++++++++++++++-----------------------------
 1 file changed, 39 insertions(+), 44 deletions(-)

diff --git a/os-posix.c b/os-posix.c
index 7cd662098e..5a127feee2 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -42,13 +42,9 @@
 #include <sys/prctl.h>
 #endif
 
-/*
- * Must set all three of these at once.
- * Legal combinations are              unset   by name   by uid
- */
-static struct passwd *user_pwd;    /*   NULL   non-NULL   NULL   */
-static uid_t user_uid = (uid_t)-1; /*   -1      -1        >=0    */
-static gid_t user_gid = (gid_t)-1; /*   -1      -1        >=0    */
+static char *user_name;
+static uid_t user_uid = (uid_t)-1;
+static gid_t user_gid = (gid_t)-1;
 
 static const char *chroot_dir;
 static int daemonize;
@@ -100,7 +96,8 @@ void os_set_proc_name(const char *s)
 }
 
 
-static bool os_parse_runas_uid_gid(const char *optarg)
+static bool os_parse_runas_uid_gid(const char *optarg,
+                                   uid_t *runas_uid, gid_t *runas_gid)
 {
     unsigned long lv;
     const char *ep;
@@ -120,9 +117,8 @@ static bool os_parse_runas_uid_gid(const char *optarg)
         return false;
     }
 
-    user_pwd = NULL;
-    user_uid = got_uid;
-    user_gid = got_gid;
+    *runas_uid = got_uid;
+    *runas_gid = got_gid;
     return true;
 }
 
@@ -132,13 +128,18 @@ static bool os_parse_runas_uid_gid(const char *optarg)
  */
 int os_parse_cmd_args(int index, const char *optarg)
 {
+    struct passwd *user_pwd;
+
     switch (index) {
     case QEMU_OPTION_runas:
         user_pwd = getpwnam(optarg);
         if (user_pwd) {
-            user_uid = -1;
-            user_gid = -1;
-        } else if (!os_parse_runas_uid_gid(optarg)) {
+            user_uid = user_pwd->pw_uid;
+            user_gid = user_pwd->pw_gid;
+            user_name = g_strdup(user_pwd->pw_name);
+        } else if (!os_parse_runas_uid_gid(optarg,
+                                           &user_uid,
+                                           &user_gid)) {
             error_report("User \"%s\" doesn't exist"
                          " (and is not <uid>:<gid>)",
                          optarg);
@@ -158,41 +159,33 @@ int os_parse_cmd_args(int index, const char *optarg)
     return 0;
 }
 
-static void change_process_uid(void)
+static void change_process_uid(uid_t uid, gid_t gid, const char *name)
 {
-    assert((user_uid == (uid_t)-1) || user_pwd == NULL);
-    assert((user_uid == (uid_t)-1) ==
-           (user_gid == (gid_t)-1));
-
-    if (user_pwd || user_uid != (uid_t)-1) {
-        gid_t intended_gid = user_pwd ? user_pwd->pw_gid : user_gid;
-        uid_t intended_uid = user_pwd ? user_pwd->pw_uid : user_uid;
-        if (setgid(intended_gid) < 0) {
-            error_report("Failed to setgid(%d)", intended_gid);
-            exit(1);
-        }
-        if (user_pwd) {
-            if (initgroups(user_pwd->pw_name, user_pwd->pw_gid) < 0) {
-                error_report("Failed to initgroups(\"%s\", %d)",
-                        user_pwd->pw_name, user_pwd->pw_gid);
-                exit(1);
-            }
-        } else {
-            if (setgroups(1, &user_gid) < 0) {
-                error_report("Failed to setgroups(1, [%d])",
-                        user_gid);
-                exit(1);
-            }
-        }
-        if (setuid(intended_uid) < 0) {
-            error_report("Failed to setuid(%d)", intended_uid);
+    if (setgid(gid) < 0) {
+        error_report("Failed to setgid(%d)", gid);
+        exit(1);
+    }
+    if (name) {
+        if (initgroups(name, gid) < 0) {
+            error_report("Failed to initgroups(\"%s\", %d)",
+                         name, gid);
             exit(1);
         }
-        if (setuid(0) != -1) {
-            error_report("Dropping privileges failed");
+    } else {
+        if (setgroups(1, &gid) < 0) {
+            error_report("Failed to setgroups(1, [%d])",
+                         gid);
             exit(1);
         }
     }
+    if (setuid(uid) < 0) {
+        error_report("Failed to setuid(%d)", uid);
+        exit(1);
+    }
+    if (setuid(0) != -1) {
+        error_report("Dropping privileges failed");
+        exit(1);
+    }
 }
 
 static void change_root(void)
@@ -275,7 +268,9 @@ void os_setup_post(void)
     }
 
     change_root();
-    change_process_uid();
+    if (user_uid != -1 && user_gid != -1) {
+        change_process_uid(user_uid, user_gid, user_name);
+    }
 
     if (daemonize) {
         uint8_t status = 0;
-- 
2.34.1


