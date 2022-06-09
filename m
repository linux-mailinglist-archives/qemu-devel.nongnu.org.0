Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E745544E17
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:53:43 +0200 (CEST)
Received: from localhost ([::1]:34656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzIbW-0007od-4e
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nzHFm-0003iK-Ck
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:27:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nzHFk-0007lX-OV
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:27:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654777628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hs9m3Fgl44ziRUsmEkJmm3v7HLSj+RDa0VKVWwxcVqA=;
 b=N9GTncq2o5//EUHA0m+WIY+auHEUCP86PHyjfAyG6/aG4gzOLpwtCCGV1gVT9EUiB9WZKu
 xyqXx+g4LIIeS4v5GpoxQr25czMQEFFwPO3qKBLhkBfA7xDfyy+hI0Ghf9QPirr83Zxk44
 BsbUYqtfAbsClED/pJMiPo0E/LRrFp4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-1c99ByVJNYm_avCG9jj4Mw-1; Thu, 09 Jun 2022 08:27:05 -0400
X-MC-Unique: 1c99ByVJNYm_avCG9jj4Mw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BED5B804190;
 Thu,  9 Jun 2022 12:27:04 +0000 (UTC)
Received: from localhost (unknown [10.39.193.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78C731121314;
 Thu,  9 Jun 2022 12:27:04 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 1/3] qsd: Unlink absolute PID file path
Date: Thu,  9 Jun 2022 14:26:59 +0200
Message-Id: <20220609122701.17172-2-hreitz@redhat.com>
In-Reply-To: <20220609122701.17172-1-hreitz@redhat.com>
References: <20220609122701.17172-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After writing the PID file, we register an atexit() handler to unlink it
when the process terminates.  However, if the process has changed its
working directory in the meantime (e.g. in os_setup_post() when
daemonizing), this will not work when the PID file path was relative.
Therefore, pass the absolute path (created with realpath()) to the
unlink() call in the atexit() handler.

(realpath() needs a path pointing to an existing file, so we cannot use
it before qemu_write_pidfile().)

Reproducer:
$ cd /tmp
$ qemu-storage-daemon --daemonize --pidfile qsd.pid
$ file qsd.pid
qsd.pid: ASCII text
$ kill $(cat qsd.pid)
$ file qsd.pid
qsd.pid: ASCII text

(qsd.pid should be gone after the process has terminated.)

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2092322
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 storage-daemon/qemu-storage-daemon.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index c104817cdd..7b8d6cf381 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -61,6 +61,7 @@
 #include "trace/control.h"
 
 static const char *pid_file;
+static char *pid_file_realpath;
 static volatile bool exit_requested = false;
 
 void qemu_system_killed(int signal, pid_t pid)
@@ -349,7 +350,7 @@ static void process_options(int argc, char *argv[], bool pre_init_pass)
 
 static void pid_file_cleanup(void)
 {
-    unlink(pid_file);
+    unlink(pid_file_realpath);
 }
 
 static void pid_file_init(void)
@@ -365,6 +366,14 @@ static void pid_file_init(void)
         exit(EXIT_FAILURE);
     }
 
+    pid_file_realpath = g_malloc(PATH_MAX);
+    if (!realpath(pid_file, pid_file_realpath)) {
+        error_report("cannot resolve PID file path: %s: %s",
+                     pid_file, strerror(errno));
+        unlink(pid_file);
+        exit(EXIT_FAILURE);
+    }
+
     atexit(pid_file_cleanup);
 }
 
-- 
2.35.3


