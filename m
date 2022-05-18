Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0BF52B5B7
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 11:24:41 +0200 (CEST)
Received: from localhost ([::1]:57850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrFv6-0007vd-Di
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 05:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrFc1-0008Jy-4g
 for qemu-devel@nongnu.org; Wed, 18 May 2022 05:04:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrFbu-0004NB-4x
 for qemu-devel@nongnu.org; Wed, 18 May 2022 05:04:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652864685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mpjD4d1Ru+HPNRkWzijal/B02WoIxSM17EmdFi5iF2g=;
 b=H0cLrjrV4XQ6aNPqGU/9mBE6uqF3TM9ef2NORKpPuLVdWs+6DHvSnDXeN/NCKgmDn7kQvO
 QfO0RcHpBIKwD9lEE1K+qkHpCH5udIhp2tLgUlHFkHlVGDwbtAExaHlNzhb4G73wqhgalJ
 Bekr6eTbfV5FoCJo5GuYlmeOOV96Ae0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-CnfIWxnwOSimS8ixZJToCw-1; Wed, 18 May 2022 05:04:44 -0400
X-MC-Unique: CnfIWxnwOSimS8ixZJToCw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABC0C3AF42A5;
 Wed, 18 May 2022 09:04:43 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D3EB140EBD5;
 Wed, 18 May 2022 09:04:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 4/8] tests/qtest: use prctl(PR_SET_PDEATHSIG) as fallback to
 kill QEMU
Date: Wed, 18 May 2022 11:04:34 +0200
Message-Id: <20220518090438.158475-5-thuth@redhat.com>
In-Reply-To: <20220518090438.158475-1-thuth@redhat.com>
References: <20220518090438.158475-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

From: Daniel P. Berrangé <berrange@redhat.com>

Although we register a ABRT handler to kill off QEMU when g_assert()
triggers, we want an extra safety net. The QEMU process might be
non-functional and thus not have responded to SIGTERM. The test script
might also have crashed with SEGV, in which case the cleanup handlers
won't ever run.

Using the Linux specific prctl(PR_SET_PDEATHSIG) syscall, we
can ensure that QEMU gets sent SIGKILL as soon as the controlling
qtest exits, if nothing else has correctly told it to quit.

Note, technically the death signal is sent when the *thread* that
called fork() exits. IOW, if you are calling qtest_init() in one
thread, letting that thread exit, and then expecting to run
qtest_quit() in a different thread, things are not going to work
out. Fortunately that is not a scenario that exists in qtests,
as pairs of qtest_init and qtest_quit are always called from the
same thread.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220513154906.206715-3-berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/libqtest.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 4a4697c0d1..2e49618454 100644
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
@@ -301,6 +304,20 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
     s->expected_status = 0;
     s->qemu_pid = fork();
     if (s->qemu_pid == 0) {
+#ifdef __linux__
+        /*
+         * Although we register a ABRT handler to kill off QEMU
+         * when g_assert() triggers, we want an extra safety
+         * net. The QEMU process might be non-functional and
+         * thus not have responded to SIGTERM. The test script
+         * might also have crashed with SEGV, in which case the
+         * cleanup handlers won't ever run.
+         *
+         * This PR_SET_PDEATHSIG setup will ensure any remaining
+         * QEMU will get terminated with SIGKILL in these cases.
+         */
+        prctl(PR_SET_PDEATHSIG, SIGKILL, 0, 0, 0);
+#endif /* __linux__ */
         if (!g_setenv("QEMU_AUDIO_DRV", "none", true)) {
             exit(1);
         }
-- 
2.27.0


