Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A86621480
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 15:02:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osPAC-0006gv-TB; Tue, 08 Nov 2022 09:01:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1osP9z-0006aW-Vt
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 09:01:06 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1osP9s-0005vR-AD
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 09:01:03 -0500
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-iuuI-F7fNY2sVvr4Cow39g-1; Tue, 08 Nov 2022 09:00:43 -0500
X-MC-Unique: iuuI-F7fNY2sVvr4Cow39g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33108101A528;
 Tue,  8 Nov 2022 14:00:43 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.192.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3286C15BB5;
 Tue,  8 Nov 2022 14:00:41 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>
Subject: [PATCH v3 1/2] util/log: do not close and reopen log files when flags
 are turned off
Date: Tue,  8 Nov 2022 15:00:31 +0100
Message-Id: <20221108140032.1460307-2-groug@kaod.org>
In-Reply-To: <20221108140032.1460307-1-groug@kaod.org>
References: <20221108140032.1460307-1-groug@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

From: Paolo Bonzini <pbonzini@redhat.com>

log_append makes sure that if you turn off the logging (which clears
log_flags and makes need_to_open_file false) the old log is not
overwritten.  The usecase is that if you remove or move the file
QEMU will not keep writing to the old file.  However, this is
not always the desited behavior, in particular having log_append==1
after changing the file name makes little sense.

When qemu_set_log_internal is called from the logfile monitor
command, filename must be non-NULL and therefore changed_name must
be true.  Therefore, the only case where the file is closed and
need_to_open_file == false is indeed when log_flags becomes
zero.  In this case, just flush the file and do not bother
closing it, thus faking the same append behavior as previously.

The behavioral change is that changing the logfile twice, for
example log1 -> log2 -> log1, will cause log1 to be overwritten.
This can simply be documented, since it is not a particularly
surprising behavior.

Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <20221025092119.236224-1-pbonzini@redhat.com>
[groug: nullify global_file before actually closing the file]
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 util/log.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/util/log.c b/util/log.c
index c2198badf240..fb843453dd49 100644
--- a/util/log.c
+++ b/util/log.c
@@ -45,7 +45,6 @@ static __thread FILE *thread_file;
 static __thread Notifier qemu_log_thread_cleanup_notifier;
 
 int qemu_loglevel;
-static bool log_append;
 static bool log_per_thread;
 static GArray *debug_regions;
 
@@ -277,19 +276,20 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
     daemonized = is_daemonized();
     need_to_open_file = log_flags && !per_thread && (!daemonized || filename);
 
-    if (logfile && (!need_to_open_file || changed_name)) {
-        qatomic_rcu_set(&global_file, NULL);
-        if (logfile != stderr) {
+    if (logfile) {
+        fflush(logfile);
+        if (changed_name && logfile != stderr) {
             RCUCloseFILE *r = g_new0(RCUCloseFILE, 1);
             r->fd = logfile;
+            qatomic_rcu_set(&global_file, NULL);
             call_rcu(r, rcu_close_file, rcu);
+            logfile = NULL;
         }
-        logfile = NULL;
     }
 
     if (!logfile && need_to_open_file) {
         if (filename) {
-            logfile = fopen(filename, log_append ? "a" : "w");
+            logfile = fopen(filename, "w");
             if (!logfile) {
                 error_setg_errno(errp, errno, "Error opening logfile %s",
                                  filename);
@@ -308,8 +308,6 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
             logfile = stderr;
         }
 
-        log_append = 1;
-
         qatomic_rcu_set(&global_file, logfile);
     }
     return true;
-- 
2.38.1


