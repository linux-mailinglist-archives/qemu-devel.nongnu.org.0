Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9F3572300
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 20:43:09 +0200 (CEST)
Received: from localhost ([::1]:57062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBKqh-00045e-Hq
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 14:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKJf-0005bD-2A
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:08:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKJd-0006uz-0X
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:08:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657649336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1m3691Q7klnD7+midVWUPM7tl2+wIghQYdmMWcblBkM=;
 b=NsJ8lS/9kZTJGLfHig3zVHZgqJSGQMeHUGF7zLx6JWKuiGdsDNsqvpAbN/6MQbiXU1tHmv
 SVuZOPO6GpbvHd8QOBpwf+jJ8SdD8c1zxFBkDhoBjznfTel+c8X29/yZo8wd3rWWHPtTPt
 2Z0FrtC4vCArDUcJRG1QeBGWV3Q65NQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-GbefrmVyO2-Tz5fHQuZomw-1; Tue, 12 Jul 2022 14:08:55 -0400
X-MC-Unique: GbefrmVyO2-Tz5fHQuZomw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BDC16802D2C;
 Tue, 12 Jul 2022 18:08:54 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B353414A7E9;
 Tue, 12 Jul 2022 18:08:54 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 33/35] qsd: Unlink absolute PID file path
Date: Tue, 12 Jul 2022 20:08:51 +0200
Message-Id: <20220712180853.1364155-1-hreitz@redhat.com>
In-Reply-To: <20220712180617.1362407-1-hreitz@redhat.com>
References: <20220712180617.1362407-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Message-Id: <20220609122701.17172-2-hreitz@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 storage-daemon/qemu-storage-daemon.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index 448c318e23..7718f6dcda 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -61,6 +61,7 @@
 #include "trace/control.h"
 
 static const char *pid_file;
+static char *pid_file_realpath;
 static volatile bool exit_requested = false;
 
 void qemu_system_killed(int signal, pid_t pid)
@@ -363,7 +364,7 @@ static void process_options(int argc, char *argv[], bool pre_init_pass)
 
 static void pid_file_cleanup(void)
 {
-    unlink(pid_file);
+    unlink(pid_file_realpath);
 }
 
 static void pid_file_init(void)
@@ -379,6 +380,14 @@ static void pid_file_init(void)
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


