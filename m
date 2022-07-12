Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D65572338
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 20:45:47 +0200 (CEST)
Received: from localhost ([::1]:35200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBKtG-00005P-Lz
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 14:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKJm-0005xg-Hq
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:09:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKJk-0006xT-K7
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:09:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657649344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GwfYEabRQuNYr5hT2GRge5eJbHX3Q8Wd8vl/yi8ukqk=;
 b=XDAh2HL4YJ0s54HDcm+fyxSVk9UitpG1kbQxnKZaYT/1tdN7Rd24cwtb6bAcC/NbNGoVvu
 6T+Ov63x1fLkVcJCmW0CJ648fw5t5ghSJBcwPmA/bHieXX3NszWF1Gh6tK2SyIMuwnympd
 5ryxU7zYNDPNVr7rW++fdxzhrycjuCY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-Ic97zXrYMEygtNKaP1DlRQ-1; Tue, 12 Jul 2022 14:08:56 -0400
X-MC-Unique: Ic97zXrYMEygtNKaP1DlRQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5746B108C0F3;
 Tue, 12 Jul 2022 18:08:56 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 14FD7414A7E7;
 Tue, 12 Jul 2022 18:08:55 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 34/35] vl: Conditionally register PID file unlink notifier
Date: Tue, 12 Jul 2022 20:08:52 +0200
Message-Id: <20220712180853.1364155-2-hreitz@redhat.com>
In-Reply-To: <20220712180617.1362407-1-hreitz@redhat.com>
References: <20220712180617.1362407-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Currently, the exit notifier for unlinking the PID file is registered
unconditionally.  Limit it to only when we actually do create a PID
file.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220609122701.17172-3-hreitz@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 softmmu/vl.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 3f264d4b09..36f46fcdad 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1526,9 +1526,7 @@ static Notifier qemu_unlink_pidfile_notifier;
 
 static void qemu_unlink_pidfile(Notifier *n, void *data)
 {
-    if (pid_file) {
-        unlink(pid_file);
-    }
+    unlink(pid_file);
 }
 
 static const QEMUOption *lookup_opt(int argc, char **argv,
@@ -2431,13 +2429,15 @@ static void qemu_maybe_daemonize(const char *pid_file)
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


