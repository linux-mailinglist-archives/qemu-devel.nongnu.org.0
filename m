Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D446075D9
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 13:13:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olpyJ-0006RL-3m
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 07:13:51 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olpj7-0001vE-Sh
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1olpiz-0001sX-FE
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 06:58:01 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1olpiw-0006ae-SU
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 06:58:01 -0400
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-bGpXZVrOOWGV6wging3Jkg-1; Fri, 21 Oct 2022 06:57:36 -0400
X-MC-Unique: bGpXZVrOOWGV6wging3Jkg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FCEC185A792;
 Fri, 21 Oct 2022 10:57:36 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.192.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AC1549BB60;
 Fri, 21 Oct 2022 10:57:35 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Greg Kurz <groug@kaod.org>, richard.henderson@linaro.org
Subject: [PATCH] util/log: Close per-thread log file on thread termination
Date: Fri, 21 Oct 2022 12:57:34 +0200
Message-Id: <20221021105734.555797-1-groug@kaod.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When `-D ${logfile} -d tid` is passed, qemu_log_trylock() creates
a dedicated log file for the current thread and opens it. The
corresponding file descriptor is cached in a __thread variable.
Nothing is done to close the corresponding file descriptor when the
thread terminates though and the file descriptor is leaked.

The issue was found during code inspection and reproduced manually.

Fix that with an atexit notifier.

Fixes: 4e51069d6793 ("util/log: Support per-thread log files")
Cc: richard.henderson@linaro.org
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 util/log.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/util/log.c b/util/log.c
index d6eb0378c3a3..39866bdaf2fa 100644
--- a/util/log.c
+++ b/util/log.c
@@ -42,6 +42,7 @@ static QemuMutex global_mutex;
 static char *global_filename;
 static FILE *global_file;
 static __thread FILE *thread_file;
+static __thread Notifier qemu_log_thread_cleanup_notifier;
 
 int qemu_loglevel;
 static bool log_append;
@@ -77,6 +78,12 @@ static int log_thread_id(void)
 #endif
 }
 
+static void qemu_log_thread_cleanup(Notifier *n, void *unused)
+{
+    fclose(thread_file);
+    thread_file = NULL;
+}
+
 /* Lock/unlock output. */
 
 FILE *qemu_log_trylock(void)
@@ -93,6 +100,8 @@ FILE *qemu_log_trylock(void)
                 return NULL;
             }
             thread_file = logfile;
+            qemu_log_thread_cleanup_notifier.notify = qemu_log_thread_cleanup;
+            qemu_thread_atexit_add(&qemu_log_thread_cleanup_notifier);
         } else {
             rcu_read_lock();
             /*
-- 
2.37.3


