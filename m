Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 805FC544E53
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:03:22 +0200 (CEST)
Received: from localhost ([::1]:48762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzIkr-0001BB-HW
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nzHGw-0006TM-T3
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:28:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nzHGv-0007tc-FM
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:28:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654777701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XFzGOGDHGP1h7/oMgEqGUvgVWAwocbgr+2t6Z6eqURA=;
 b=J5cS44vGybtqny/ejaQRbMlX0Ghb4ib3W7tRiAC3c/WakMJOilrpDjov3x3Q+E9/WFT6G5
 kYq+WgcyLxPg+rfo9EQbnph+KNYHSx5bApB5idz0kObfpuWcwhoZhACo3ZV1qsFuxdmSmM
 WYg7LDRiktEcMFBisA0jhm13rQehCJI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-WNVnyT1sMwaKfW3njnKcYA-1; Thu, 09 Jun 2022 08:27:06 -0400
X-MC-Unique: WNVnyT1sMwaKfW3njnKcYA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C9F81C0518B;
 Thu,  9 Jun 2022 12:27:06 +0000 (UTC)
Received: from localhost (unknown [10.39.193.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1922218EA6;
 Thu,  9 Jun 2022 12:27:05 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 2/3] vl: Conditionally register PID file unlink notifier
Date: Thu,  9 Jun 2022 14:27:00 +0200
Message-Id: <20220609122701.17172-3-hreitz@redhat.com>
In-Reply-To: <20220609122701.17172-1-hreitz@redhat.com>
References: <20220609122701.17172-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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

Currently, the exit notifier for unlinking the PID file is registered
unconditionally.  Limit it to only when we actually do create a PID
file.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 softmmu/vl.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 4c1e94b00e..f0074845b7 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1552,9 +1552,7 @@ static Notifier qemu_unlink_pidfile_notifier;
 
 static void qemu_unlink_pidfile(Notifier *n, void *data)
 {
-    if (pid_file) {
-        unlink(pid_file);
-    }
+    unlink(pid_file);
 }
 
 static const QEMUOption *lookup_opt(int argc, char **argv,
@@ -2473,13 +2471,15 @@ static void qemu_maybe_daemonize(const char *pid_file)
     os_daemonize();
     rcu_disable_atfork();
 
-    if (pid_file && !qemu_write_pidfile(pid_file, &err)) {
-        error_reportf_err(err, "cannot create PID file: ");
-        exit(1);
-    }
+    if (pid_file) {
+        if (!qemu_write_pidfile(pid_file, &err)) {
+            error_reportf_err(err, "cannot create PID file: ");
+            exit(1);
+        }
 
-    qemu_unlink_pidfile_notifier.notify = qemu_unlink_pidfile;
-    qemu_add_exit_notifier(&qemu_unlink_pidfile_notifier);
+        qemu_unlink_pidfile_notifier.notify = qemu_unlink_pidfile;
+        qemu_add_exit_notifier(&qemu_unlink_pidfile_notifier);
+    }
 }
 
 static void qemu_init_displays(void)
-- 
2.35.3


