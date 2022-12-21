Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A26446535CA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:03:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83Pz-0000TI-E6; Wed, 21 Dec 2022 13:02:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83Pn-0000Mx-2P
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83Pj-0004GO-JN
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671645718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pGruhFN1Ah0Tyzf3f5eAFP8AJR0vYuG7YCmcdclAJus=;
 b=UzeS+LlvU45vRT7rKR0FEZKIa3Dr3FfJ74TjqS8aIpC+v6WzY2vQDz1o0qhQh/VF7zMErG
 EOavXiYY4H+IFXO1bxLvMkuaUTzY+zvCiutl6V/whXY+Js061uUjLx+ygq5/Rc9TZTSipB
 ZxDLq7AUN22E9hs5nPfdan89S8Pr4eQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-280-B0eLaVIIOs-tdb2q2v-jcw-1; Wed, 21 Dec 2022 13:01:57 -0500
X-MC-Unique: B0eLaVIIOs-tdb2q2v-jcw-1
Received: by mail-ed1-f72.google.com with SMTP id
 y10-20020a056402358a00b0046fc5125069so11910485edc.23
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:01:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pGruhFN1Ah0Tyzf3f5eAFP8AJR0vYuG7YCmcdclAJus=;
 b=W7sHkUynVZ93Cubw/5XL8lB3V5n2DhaXNiiQsRECu7LKgALVJ3N9Pjx7LV3iVhsne3
 NliaAPzWKi7mN+Q/tq5kuxm4XpYUYHg9PZsm3rKiGV7/BzB4xwsIKPhLxp5vGzZu9HTs
 JHrd6xQ9oMH+5/omQTtQrUeLVaboM1KR8F9CdtooAwosgELLrnxrSDUayXvzaOjvz0rw
 qEdb1FZDB8hXSXqs7vSJup/TISyV9rIKYqQmsHAWs+g3WvjRXt2qeBqJX8X8g+eOs/Aa
 9pQE/5qdkDgnyVkmCkB9jAgVbTSidQ5Htht/g6u9UGuEaav3c3diiV3bWuCE8tdmwyXf
 VCnA==
X-Gm-Message-State: AFqh2kqaEfgRgz9Vc9hdnAzOomEhaOYW6LYTE0gik7fhum6+V0Ga2RIb
 kCQY3MK5QVnP80gmrDvLHOvQOe6Yvpyiv7VzIeONsWDP+hiynz5PjX5ccaAcelVF5zxhgHhY6JN
 nx/hVItZKMXJyvBWjzt7PpW+BED19Y0zIKVpjMwRycPN+fzynWGVdgHzvr9BKGysinss=
X-Received: by 2002:a17:907:8b17:b0:78d:f454:3856 with SMTP id
 sz23-20020a1709078b1700b0078df4543856mr2246835ejc.19.1671645715649; 
 Wed, 21 Dec 2022 10:01:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsYIOWUiZwJZPNDA/I4SWW1arFzAsMyFyHQVw7YhijLHylbMn4D2CHigCmbOrj4TgeO+umHzg==
X-Received: by 2002:a17:907:8b17:b0:78d:f454:3856 with SMTP id
 sz23-20020a1709078b1700b0078df4543856mr2246797ejc.19.1671645715268; 
 Wed, 21 Dec 2022 10:01:55 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 v25-20020a170906b01900b007add1c4dadbsm7323491ejy.153.2022.12.21.10.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:01:54 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: [PULL 04/24] util/log: Always send errors to logfile when daemonized
Date: Wed, 21 Dec 2022 19:01:21 +0100
Message-Id: <20221221180141.839616-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221180141.839616-1-pbonzini@redhat.com>
References: <20221221180141.839616-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Greg Kurz <groug@kaod.org>

When QEMU is started with `-daemonize`, all stdio descriptors get
redirected to `/dev/null`. This basically means that anything
printed with error_report() and friends is lost.

Current logging code allows to redirect to a file with `-D` but
this requires to enable some logging item with `-d` as well to
be functional.

Relax the check on the log flags when QEMU is daemonized, so that
other users of stderr can benefit from the redirection, without the
need to enable unwanted debug logs. Previous behaviour is retained
for the non-daemonized case. The logic is unrolled as an `if` for
better readability. The qemu_log_level and log_per_thread globals
reflect the state we want to transition to at this point : use
them instead of the intermediary locals for correctness.

qemu_set_log_internal() is adapted to open a per-thread log file
when '-d tid' is passed. This is done by hijacking qemu_try_lock()
which seems simpler that refactoring the code.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20221108140032.1460307-3-groug@kaod.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/log.c | 72 ++++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 53 insertions(+), 19 deletions(-)

diff --git a/util/log.c b/util/log.c
index fb843453dd49..7837ff991769 100644
--- a/util/log.c
+++ b/util/log.c
@@ -79,13 +79,15 @@ static int log_thread_id(void)
 
 static void qemu_log_thread_cleanup(Notifier *n, void *unused)
 {
-    fclose(thread_file);
-    thread_file = NULL;
+    if (thread_file != stderr) {
+        fclose(thread_file);
+        thread_file = NULL;
+    }
 }
 
 /* Lock/unlock output. */
 
-FILE *qemu_log_trylock(void)
+static FILE *qemu_log_trylock_with_err(Error **errp)
 {
     FILE *logfile;
 
@@ -96,6 +98,9 @@ FILE *qemu_log_trylock(void)
                 = g_strdup_printf(global_filename, log_thread_id());
             logfile = fopen(filename, "w");
             if (!logfile) {
+                error_setg_errno(errp, errno,
+                                 "Error opening logfile %s for thread %d",
+                                 filename, log_thread_id());
                 return NULL;
             }
             thread_file = logfile;
@@ -122,6 +127,11 @@ FILE *qemu_log_trylock(void)
     return logfile;
 }
 
+FILE *qemu_log_trylock(void)
+{
+    return qemu_log_trylock_with_err(NULL);
+}
+
 void qemu_log_unlock(FILE *logfile)
 {
     if (logfile) {
@@ -265,16 +275,21 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
 #endif
     qemu_loglevel = log_flags;
 
-    /*
-     * In all cases we only log if qemu_loglevel is set.
-     * Also:
-     *   If per-thread, open the file for each thread in qemu_log_lock.
-     *   If not daemonized we will always log either to stderr
-     *     or to a file (if there is a filename).
-     *   If we are daemonized, we will only log if there is a filename.
-     */
     daemonized = is_daemonized();
-    need_to_open_file = log_flags && !per_thread && (!daemonized || filename);
+    need_to_open_file = false;
+    if (!daemonized) {
+        /*
+         * If not daemonized we only log if qemu_loglevel is set, either to
+         * stderr or to a file (if there is a filename).
+         * If per-thread, open the file for each thread in qemu_log_trylock().
+         */
+        need_to_open_file = qemu_loglevel && !log_per_thread;
+    } else {
+        /*
+         * If we are daemonized, we will only log if there is a filename.
+         */
+        need_to_open_file = filename != NULL;
+    }
 
     if (logfile) {
         fflush(logfile);
@@ -287,19 +302,34 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
         }
     }
 
+    if (log_per_thread && daemonized) {
+        logfile = thread_file;
+    }
+
     if (!logfile && need_to_open_file) {
         if (filename) {
-            logfile = fopen(filename, "w");
-            if (!logfile) {
-                error_setg_errno(errp, errno, "Error opening logfile %s",
-                                 filename);
-                return false;
+            if (log_per_thread) {
+                logfile = qemu_log_trylock_with_err(errp);
+                if (!logfile) {
+                    return false;
+                }
+                qemu_log_unlock(logfile);
+            } else {
+                logfile = fopen(filename, "w");
+                if (!logfile) {
+                    error_setg_errno(errp, errno, "Error opening logfile %s",
+                                     filename);
+                    return false;
+                }
             }
             /* In case we are a daemon redirect stderr to logfile */
             if (daemonized) {
                 dup2(fileno(logfile), STDERR_FILENO);
                 fclose(logfile);
-                /* This will skip closing logfile in rcu_close_file. */
+                /*
+                 * This will skip closing logfile in rcu_close_file()
+                 * or qemu_log_thread_cleanup().
+                 */
                 logfile = stderr;
             }
         } else {
@@ -308,7 +338,11 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
             logfile = stderr;
         }
 
-        qatomic_rcu_set(&global_file, logfile);
+        if (log_per_thread && daemonized) {
+            thread_file = logfile;
+        } else {
+            qatomic_rcu_set(&global_file, logfile);
+        }
     }
     return true;
 }
-- 
2.38.1


