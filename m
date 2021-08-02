Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 673AE3DD673
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 15:07:37 +0200 (CEST)
Received: from localhost ([::1]:58292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAXfM-0007UI-BE
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 09:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mAXbC-0000g8-22
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:03:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mAXbA-0000Ph-Au
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:03:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627909395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9d2/3bpDY1t4XsQxslnkCPrFxqCF7gn1s6shhmcNxcU=;
 b=hY66oLkxSnMrFJplxIRitJNv0TL3xs7CvwxKsJx8YJAHKnkGdMwjpOS8ksjpLmPcVnxFQ8
 uipAOs5w1VuPzq6tifNcw08uv27XcxT3BV358bb3yCQbO2tIODptSxzjBs4e2P+HyHn91S
 DxusfhNVDJBFQ0lIaFjE4UzB5fImlGI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-KybLuOVsMuay0RWlKOe9EQ-1; Mon, 02 Aug 2021 09:03:14 -0400
X-MC-Unique: KybLuOVsMuay0RWlKOe9EQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AEF81F6B2
 for <qemu-devel@nongnu.org>; Mon,  2 Aug 2021 13:03:13 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F67317567;
 Mon,  2 Aug 2021 13:03:12 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] seccomp: fix blocking of process spawning
Date: Mon,  2 Aug 2021 14:03:01 +0100
Message-Id: <20210802130303.3300108-4-berrange@redhat.com>
In-Reply-To: <20210802130303.3300108-1-berrange@redhat.com>
References: <20210802130303.3300108-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Otubo <otubo@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When '-sandbox on,spawn=deny' is given, we are supposed to block the
ability to spawn processes. We naively blocked the 'fork' syscall,
forgetting that any modern libc will use the 'clone' syscall instead.

We can't simply block the 'clone' syscall though, as that will break
thread creation. We thus list the set of flags used to create threads
and block anything that doesn't match this exactly.

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
2.31.1


