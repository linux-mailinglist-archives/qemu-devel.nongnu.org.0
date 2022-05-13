Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8F35264FD
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 16:44:30 +0200 (CEST)
Received: from localhost ([::1]:46116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npWWr-0001uf-7l
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 10:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1npWQS-00035m-2a
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:37:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1npWQQ-0005Nt-Gv
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:37:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652452670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YNkNswOe7Or/47ENboGBNVkX3wGwwVdTC94Ui7rMMe0=;
 b=Z1gql3dURNbZSwXUjSw36i55VaK+K8vm/B0veY0DYLuopKbOkez+BOAWmjJtDpqLfS64Hi
 u7fj5ITAlmmjkk21hBYKetzwcl3cn+mwvf2T6cE6nInYsol0t7BsiINUmgKVxjyqF6uJUD
 eT8EpflkWewtIFx66OEwgQ0epHLx/Wo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-PDfNUaQrPLOtwScGA6_d5g-1; Fri, 13 May 2022 10:37:48 -0400
X-MC-Unique: PDfNUaQrPLOtwScGA6_d5g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D057F8032E5
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 14:37:47 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07BC214609B1;
 Fri, 13 May 2022 14:37:44 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH] tests/qtest: kill off QEMU with SIGKILL when qtest exits
 abnormally
Date: Fri, 13 May 2022 15:37:43 +0100
Message-Id: <20220513143743.198390-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

If a qtest program exits without calling qtest_quit(), then the
QEMU emulator process will remain running in the background forever.

Unfortunately this scenario is exactly what will happen when a
g_assert() check triggers an abort().

Prior to switching to use of 'meson test', this problem would
cause tap-driver.pl to hang forever. It was waiting for its
STDIN to report EOF, but that would never happen due to the
ophaned QEMU emulator processes keeping the pipe open forever.
Fortunately this doesn't happen with meson, but it is still
desirable to not leak QEMU processes when asserts fire.

Using the Linux specific prctl(PR_SET_PDEATHSIG) syscall, we
can ensure that QEMU gets sent SIGKILL as soon as the controlling
qtest exits, despite being daemonized.

Note, technically the death signal is sent when the *thread* that
called fork() exits. IOW, if you are calling qtest_init() in one
thread, letting that thread exit, and then expecting to run
qtest_quit() in a different thread, things are not going to work
out. Fortunately that is not a scenario that exists in qtests,
as pairs of qtest_init and qtest_quit are always called from the
same thread.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/libqtest.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 228357f1ea..553e82e492 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -19,6 +19,9 @@
 #include <sys/socket.h>
 #include <sys/wait.h>
 #include <sys/un.h>
+#ifdef __linux__
+#include <sys/prctl.h>
+#endif /* __linux__ */
 
 #include "libqtest.h"
 #include "libqmp.h"
@@ -301,6 +304,21 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
     s->expected_status = 0;
     s->qemu_pid = fork();
     if (s->qemu_pid == 0) {
+#ifdef __linux__
+        /*
+         * If the controlling qtest process exits without calling
+         * the qtest_quit() method, the QEMU processes will get
+         * orphaned and remain running forever in the background.
+         *
+         * Missing qtest_quit() calls are, unfortunately, exactly
+         * what happen when a g_assert() check triggers abort() in
+         * a failing test scenario.
+         *
+         * This PR_SET_PDEATHSIG setup will ensure QEMU will
+         * get terminated with SIGKILL.
+         */
+        prctl(PR_SET_PDEATHSIG, SIGKILL, 0, 0, 0);
+#endif /* __linux__ */
         if (!g_setenv("QEMU_AUDIO_DRV", "none", true)) {
             exit(1);
         }
-- 
2.36.1


