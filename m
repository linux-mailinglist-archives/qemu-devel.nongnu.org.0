Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF7321534D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 09:30:42 +0200 (CEST)
Received: from localhost ([::1]:34906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsLaL-0004kR-Vp
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 03:30:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jsLYY-0003PK-6E
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 03:28:51 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:35024
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jsLYU-0004Iz-G6
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 03:28:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594020525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=36Lm0Bi7svE+whLJ15hKmgqYhOIWjqV9aJsJr4usng4=;
 b=XE3p99cpPi4lkxuWh2eNNK09UMHlnKWQg7Dm5m3WwmDk/vGj8fnSFYJOxVBWkH18KFx9YL
 sC4UfaCBSonVw5K4f9GR1yJPgUKoB40Igs2DUBlt7dZl6GW1rSFirsrNVw0ytwD8Ao6juK
 DUTpnUjYIBxPlB7hoIsJFNCC6vwyU+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-dddrdE6nPraz4zQ06hwXvg-1; Mon, 06 Jul 2020 03:28:41 -0400
X-MC-Unique: dddrdE6nPraz4zQ06hwXvg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63A21EC1A0;
 Mon,  6 Jul 2020 07:28:40 +0000 (UTC)
Received: from thuth.com (ovpn-112-144.ams2.redhat.com [10.36.112.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58D8B5D9CC;
 Mon,  6 Jul 2020 07:28:39 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 1/6] fuzz: fix broken qtest check at rcu_disable_atfork
Date: Mon,  6 Jul 2020 09:28:30 +0200
Message-Id: <20200706072835.23582-2-thuth@redhat.com>
In-Reply-To: <20200706072835.23582-1-thuth@redhat.com>
References: <20200706072835.23582-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 01:39:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

The qtest_enabled check introduced in d6919e4 always returns false, as
it is called prior to configure_accelerators(). Instead of trying to
skip rcu_disable_atfork in qemu_main, simply call rcu_enable_atfork in
the fuzzer, after qemu_main returns.

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20200618160516.2817-1-alxndr@bu.edu>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 softmmu/vl.c            | 12 +-----------
 tests/qtest/fuzz/fuzz.c |  3 +++
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 3e15ee2435..9da2e23144 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3832,17 +3832,7 @@ void qemu_init(int argc, char **argv, char **envp)
                                               machine_class);
 
     os_daemonize();
-
-    /*
-     * If QTest is enabled, keep the rcu_atfork enabled, since system processes
-     * may be forked testing purposes (e.g. fork-server based fuzzing) The fork
-     * should happen before a signle cpu instruction is executed, to prevent
-     * deadlocks. See commit 73c6e40, rcu: "completely disable pthread_atfork
-     * callbacks as soon as possible"
-     */
-    if (!qtest_enabled()) {
-        rcu_disable_atfork();
-    }
+    rcu_disable_atfork();
 
     if (pid_file && !qemu_write_pidfile(pid_file, &err)) {
         error_reportf_err(err, "cannot create PID file: ");
diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
index a44fe479db..a36d9038e0 100644
--- a/tests/qtest/fuzz/fuzz.c
+++ b/tests/qtest/fuzz/fuzz.c
@@ -211,5 +211,8 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
 
     qemu_init(result.we_wordc, result.we_wordv, NULL);
 
+    /* re-enable the rcu atfork, which was previously disabled in qemu_init */
+    rcu_enable_atfork();
+
     return 0;
 }
-- 
2.18.1


