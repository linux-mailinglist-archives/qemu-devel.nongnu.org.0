Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A794B9FF4
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 13:19:44 +0100 (CET)
Received: from localhost ([::1]:50362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKfl9-0000EU-Vt
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 07:19:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKfQ4-0003Wa-9s
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:58:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKfQ1-00013m-CR
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:57:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645099072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jS8/suOuNV9CPXi4upEAIZz1tkI/Nhr1PQ0yx8eJC78=;
 b=f5PxPi7UxbIFM+lvKmY+1t0Ay+iz5dZeKlRYebjt5EHWMpjFXmDIKjQ+siT2MI1RCYUiW1
 VY/1TOYjyJV+iZE1xb4OQFPTCCoH8CKytmp7vzLku6e/TG1MeuEKB4uQWI9Ws980ugDLc+
 KHgVdQgU/vJgc1V3xbiW8yWAeZKtnvY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-aRFzzdK_Ok2wI6d4udJbfw-1; Thu, 17 Feb 2022 06:57:49 -0500
X-MC-Unique: aRFzzdK_Ok2wI6d4udJbfw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F4281006AA0;
 Thu, 17 Feb 2022 11:57:48 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FFF5108648D;
 Thu, 17 Feb 2022 11:57:46 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/10] seccomp: fix blocking of process spawning
Date: Thu, 17 Feb 2022 11:57:19 +0000
Message-Id: <20220217115723.1782616-7-berrange@redhat.com>
In-Reply-To: <20220217115723.1782616-1-berrange@redhat.com>
References: <20220217115723.1782616-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Otubo <otubo@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Kashyap Chamarthy <kchamart@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When '-sandbox on,spawn=deny' is given, we are supposed to block the
ability to spawn processes. We naively blocked the 'fork' syscall,
forgetting that any modern libc will use the 'clone' syscall instead.

We can't simply block the 'clone' syscall though, as that will break
thread creation. We thus list the set of flags used to create threads
and block anything that doesn't match this exactly.

Acked-by: Eduardo Otubo <otubo@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 softmmu/qemu-seccomp.c    | 101 ++++++++++++++++++++++++++++++++++++++
 tests/unit/test-seccomp.c |   3 +-
 2 files changed, 102 insertions(+), 2 deletions(-)

diff --git a/softmmu/qemu-seccomp.c b/softmmu/qemu-seccomp.c
index 9f6df8d033..57139cc9ce 100644
--- a/softmmu/qemu-seccomp.c
+++ b/softmmu/qemu-seccomp.c
@@ -46,6 +46,82 @@ const struct scmp_arg_cmp sched_setscheduler_arg[] = {
     { .arg = 1, .op = SCMP_CMP_NE, .datum_a = SCHED_IDLE }
 };
 
+/*
+ * See 'NOTES' in 'man 2 clone' - s390 & cross have 'flags' in
+ *  different position to other architectures
+ */
+#if defined(HOST_S390X) || defined(HOST_S390) || defined(HOST_CRIS)
+#define CLONE_FLAGS_ARG 1
+#else
+#define CLONE_FLAGS_ARG 0
+#endif
+
+#ifndef CLONE_PIDFD
+# define CLONE_PIDFD 0x00001000
+#endif
+
+#define REQUIRE_CLONE_FLAG(flag) \
+    const struct scmp_arg_cmp clone_arg ## flag[] = { \
+    { .arg = CLONE_FLAGS_ARG, \
+      .op = SCMP_CMP_MASKED_EQ, \
+      .datum_a = flag, .datum_b = 0 } }
+
+#define FORBID_CLONE_FLAG(flag) \
+    const struct scmp_arg_cmp clone_arg ## flag[] = { \
+    { .arg = CLONE_FLAGS_ARG, \
+      .op = SCMP_CMP_MASKED_EQ, \
+      .datum_a = flag, .datum_b = flag } }
+
+#define RULE_CLONE_FLAG(flag) \
+    { SCMP_SYS(clone),                  QEMU_SECCOMP_SET_SPAWN, \
+      ARRAY_SIZE(clone_arg ## flag), clone_arg ## flag, SCMP_ACT_TRAP }
+
+/* If no CLONE_* flags are set, except CSIGNAL, deny */
+const struct scmp_arg_cmp clone_arg_none[] = {
+    { .arg = CLONE_FLAGS_ARG,
+      .op = SCMP_CMP_MASKED_EQ,
+      .datum_a = ~(CSIGNAL), .datum_b = 0 }
+};
+
+/*
+ * pthread_create should always set all of these.
+ */
+REQUIRE_CLONE_FLAG(CLONE_VM);
+REQUIRE_CLONE_FLAG(CLONE_FS);
+REQUIRE_CLONE_FLAG(CLONE_FILES);
+REQUIRE_CLONE_FLAG(CLONE_SIGHAND);
+REQUIRE_CLONE_FLAG(CLONE_THREAD);
+REQUIRE_CLONE_FLAG(CLONE_SYSVSEM);
+REQUIRE_CLONE_FLAG(CLONE_SETTLS);
+REQUIRE_CLONE_FLAG(CLONE_PARENT_SETTID);
+REQUIRE_CLONE_FLAG(CLONE_CHILD_CLEARTID);
+/*
+ * Musl sets this in pthread_create too, but it is
+ * obsolete and harmless since its behaviour is
+ * subsumed under CLONE_THREAD
+ */
+/*REQUIRE_CLONE_FLAG(CLONE_DETACHED);*/
+
+
+/*
+ * These all indicate an attempt to spawn a process
+ * instead of a thread, or other undesirable scenarios
+ */
+FORBID_CLONE_FLAG(CLONE_PIDFD);
+FORBID_CLONE_FLAG(CLONE_PTRACE);
+FORBID_CLONE_FLAG(CLONE_VFORK);
+FORBID_CLONE_FLAG(CLONE_PARENT);
+FORBID_CLONE_FLAG(CLONE_NEWNS);
+FORBID_CLONE_FLAG(CLONE_UNTRACED);
+FORBID_CLONE_FLAG(CLONE_NEWCGROUP);
+FORBID_CLONE_FLAG(CLONE_NEWUTS);
+FORBID_CLONE_FLAG(CLONE_NEWIPC);
+FORBID_CLONE_FLAG(CLONE_NEWUSER);
+FORBID_CLONE_FLAG(CLONE_NEWPID);
+FORBID_CLONE_FLAG(CLONE_NEWNET);
+FORBID_CLONE_FLAG(CLONE_IO);
+
+
 static const struct QemuSeccompSyscall denylist[] = {
     /* default set of syscalls that should get blocked */
     { SCMP_SYS(reboot),                 QEMU_SECCOMP_SET_DEFAULT,
@@ -143,6 +219,31 @@ static const struct QemuSeccompSyscall denylist[] = {
       0, NULL, SCMP_ACT_TRAP },
     { SCMP_SYS(execve),                 QEMU_SECCOMP_SET_SPAWN,
       0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(clone),                  QEMU_SECCOMP_SET_SPAWN,
+      ARRAY_SIZE(clone_arg_none), clone_arg_none, SCMP_ACT_TRAP },
+    RULE_CLONE_FLAG(CLONE_VM),
+    RULE_CLONE_FLAG(CLONE_FS),
+    RULE_CLONE_FLAG(CLONE_FILES),
+    RULE_CLONE_FLAG(CLONE_SIGHAND),
+    RULE_CLONE_FLAG(CLONE_THREAD),
+    RULE_CLONE_FLAG(CLONE_SYSVSEM),
+    RULE_CLONE_FLAG(CLONE_SETTLS),
+    RULE_CLONE_FLAG(CLONE_PARENT_SETTID),
+    RULE_CLONE_FLAG(CLONE_CHILD_CLEARTID),
+    /*RULE_CLONE_FLAG(CLONE_DETACHED),*/
+    RULE_CLONE_FLAG(CLONE_PIDFD),
+    RULE_CLONE_FLAG(CLONE_PTRACE),
+    RULE_CLONE_FLAG(CLONE_VFORK),
+    RULE_CLONE_FLAG(CLONE_PARENT),
+    RULE_CLONE_FLAG(CLONE_NEWNS),
+    RULE_CLONE_FLAG(CLONE_UNTRACED),
+    RULE_CLONE_FLAG(CLONE_NEWCGROUP),
+    RULE_CLONE_FLAG(CLONE_NEWUTS),
+    RULE_CLONE_FLAG(CLONE_NEWIPC),
+    RULE_CLONE_FLAG(CLONE_NEWUSER),
+    RULE_CLONE_FLAG(CLONE_NEWPID),
+    RULE_CLONE_FLAG(CLONE_NEWNET),
+    RULE_CLONE_FLAG(CLONE_IO),
     /* resource control */
     { SCMP_SYS(setpriority),            QEMU_SECCOMP_SET_RESOURCECTL,
       0, NULL, SCMP_ACT_ERRNO(EPERM) },
diff --git a/tests/unit/test-seccomp.c b/tests/unit/test-seccomp.c
index 10ab3e8fe5..3d7771e46c 100644
--- a/tests/unit/test-seccomp.c
+++ b/tests/unit/test-seccomp.c
@@ -126,8 +126,7 @@ static int doit_fork(void)
 
 static void test_seccomp_fork_on_nospawn(void)
 {
-    /* XXX fixme - should be killed */
-    test_seccomp_passed("on,spawn=deny", doit_fork);
+    test_seccomp_killed("on,spawn=deny", doit_fork);
 }
 
 static void test_seccomp_fork_on(void)
-- 
2.34.1


