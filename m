Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D5F468C2A
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Dec 2021 17:47:56 +0100 (CET)
Received: from localhost ([::1]:39928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtug7-0005ZZ-Jg
	for lists+qemu-devel@lfdr.de; Sun, 05 Dec 2021 11:47:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khlebnikov@yandex-team.ru>)
 id 1mtuDM-00024z-On
 for qemu-devel@nongnu.org; Sun, 05 Dec 2021 11:18:12 -0500
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:60746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khlebnikov@yandex-team.ru>)
 id 1mtuDI-0001CK-CS
 for qemu-devel@nongnu.org; Sun, 05 Dec 2021 11:18:10 -0500
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 5D5922E0B0A;
 Sun,  5 Dec 2021 19:17:57 +0300 (MSK)
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net [2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 Nc7ng97gqy-HuLGrnB8; Sun, 05 Dec 2021 19:17:57 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1638721077; bh=qjlwsxvSac4hOSK78fwlfqcok5dspyYJkM5S0bFOvnA=;
 h=Date:To:From:Subject:Message-ID:Cc;
 b=OTF58rpOskwwjq6Mc8WK5DSiAIaFnuQtzBUhbxodLQt6aqfmt5stSHsIaCjF/Q8P2
 6/ErcoNvOWqYHHzrrlMOHiVDWp3j6kByhnXnIlqhkqWTdN0zZMkpu84tKGKrowoCRI
 a2zR3nNmcTUHxubH5PUToz28QHTA3s4IKFgEVF60=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from localhost (dynamic-vpn.dhcp.yndx.net [2a02:6b8:b081:8024::1:6])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id YbAz2Fa83K-HuP4HsVJ; Sun, 05 Dec 2021 19:17:56 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
Subject: [PATCH] fuzz: pass failures from child process into libfuzzer engine
From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Date: Sun, 05 Dec 2021 19:17:56 +0300
Message-ID: <163872107649.53117.6457962986798427964.stgit@dynamic-vpn.dhcp.yndx.net>
User-Agent: StGit/1.4.dev11+gd5bef96
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=khlebnikov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 05 Dec 2021 11:46:49 -0500
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
Cc: Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fuzzer is supposed to stop when first bug is found and report failure.
Present fuzzers fork new child at each iteration to isolate side-effects.
But child's exit code is ignored, i.e. libfuzzer does not see any crashes.

Right now virtio-net fuzzer instantly falls on assert in iov_copy and
dumps crash-*, but fuzzing continues and ends successfully if global
timeout is set.

Let's put required logic into helper function "fork_fuzzer_and_wait".

Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
---
 tests/qtest/fuzz/fork_fuzz.c        |   26 ++++++++++++++++++++++++++
 tests/qtest/fuzz/fork_fuzz.h        |    1 +
 tests/qtest/fuzz/generic_fuzz.c     |    3 +--
 tests/qtest/fuzz/i440fx_fuzz.c      |    3 +--
 tests/qtest/fuzz/virtio_blk_fuzz.c  |    6 ++----
 tests/qtest/fuzz/virtio_net_fuzz.c  |    6 ++----
 tests/qtest/fuzz/virtio_scsi_fuzz.c |    6 ++----
 7 files changed, 35 insertions(+), 16 deletions(-)

diff --git a/tests/qtest/fuzz/fork_fuzz.c b/tests/qtest/fuzz/fork_fuzz.c
index 6ffb2a7937..6e3a3867bf 100644
--- a/tests/qtest/fuzz/fork_fuzz.c
+++ b/tests/qtest/fuzz/fork_fuzz.c
@@ -38,4 +38,30 @@ void counter_shm_init(void)
     free(copy);
 }
 
+/* Returns true in child process */
+bool fork_fuzzer_and_wait(void)
+{
+    pid_t pid;
+    int wstatus;
+
+    pid = fork();
+    if (pid < 0) {
+        perror("fork");
+        abort();
+    }
+
+    if (pid == 0) {
+        return true;
+    }
 
+    if (waitpid(pid, &wstatus, 0) < 0) {
+        perror("waitpid");
+        abort();
+    }
+
+    if (!WIFEXITED(wstatus) || WEXITSTATUS(wstatus) != 0) {
+        abort();
+    }
+
+    return false;
+}
diff --git a/tests/qtest/fuzz/fork_fuzz.h b/tests/qtest/fuzz/fork_fuzz.h
index 9ecb8b58ef..792e922731 100644
--- a/tests/qtest/fuzz/fork_fuzz.h
+++ b/tests/qtest/fuzz/fork_fuzz.h
@@ -18,6 +18,7 @@ extern uint8_t __FUZZ_COUNTERS_START;
 extern uint8_t __FUZZ_COUNTERS_END;
 
 void counter_shm_init(void);
+bool fork_fuzzer_and_wait(void);
 
 #endif
 
diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index dd7e25851c..f0e25b39ea 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -667,7 +667,7 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
     size_t cmd_len;
     uint8_t op;
 
-    if (fork() == 0) {
+    if (fork_fuzzer_and_wait()) {
         struct sigaction sact;
         struct itimerval timer;
         sigset_t set;
@@ -723,7 +723,6 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
         _Exit(0);
     } else {
         flush_events(s);
-        wait(0);
     }
 }
 
diff --git a/tests/qtest/fuzz/i440fx_fuzz.c b/tests/qtest/fuzz/i440fx_fuzz.c
index 86796bff2b..0b927f4b3a 100644
--- a/tests/qtest/fuzz/i440fx_fuzz.c
+++ b/tests/qtest/fuzz/i440fx_fuzz.c
@@ -147,12 +147,11 @@ static void i440fx_fuzz_qos(QTestState *s,
 
 static void i440fx_fuzz_qos_fork(QTestState *s,
         const unsigned char *Data, size_t Size) {
-    if (fork() == 0) {
+    if (fork_fuzzer_and_wait()) {
         i440fx_fuzz_qos(s, Data, Size);
         _Exit(0);
     } else {
         flush_events(s);
-        wait(NULL);
     }
 }
 
diff --git a/tests/qtest/fuzz/virtio_blk_fuzz.c b/tests/qtest/fuzz/virtio_blk_fuzz.c
index 623a756fd4..9532dc1fa7 100644
--- a/tests/qtest/fuzz/virtio_blk_fuzz.c
+++ b/tests/qtest/fuzz/virtio_blk_fuzz.c
@@ -136,13 +136,12 @@ static void virtio_blk_fork_fuzz(QTestState *s,
     if (!queues) {
         queues = qvirtio_blk_init(blk->vdev, 0);
     }
-    if (fork() == 0) {
+    if (fork_fuzzer_and_wait()) {
         virtio_blk_fuzz(s, queues, Data, Size);
         flush_events(s);
         _Exit(0);
     } else {
         flush_events(s);
-        wait(NULL);
     }
 }
 
@@ -152,7 +151,7 @@ static void virtio_blk_with_flag_fuzz(QTestState *s,
     QVirtioBlk *blk = fuzz_qos_obj;
     static QVirtioBlkQueues *queues;
 
-    if (fork() == 0) {
+    if (fork_fuzzer_and_wait()) {
         if (Size >= sizeof(uint64_t)) {
             queues = qvirtio_blk_init(blk->vdev, *(uint64_t *)Data);
             virtio_blk_fuzz(s, queues,
@@ -162,7 +161,6 @@ static void virtio_blk_with_flag_fuzz(QTestState *s,
         _Exit(0);
     } else {
         flush_events(s);
-        wait(NULL);
     }
 }
 
diff --git a/tests/qtest/fuzz/virtio_net_fuzz.c b/tests/qtest/fuzz/virtio_net_fuzz.c
index 0e873ab8e2..6b492ef9e7 100644
--- a/tests/qtest/fuzz/virtio_net_fuzz.c
+++ b/tests/qtest/fuzz/virtio_net_fuzz.c
@@ -118,26 +118,24 @@ static void virtio_net_fuzz_multi(QTestState *s,
 static void virtio_net_fork_fuzz(QTestState *s,
         const unsigned char *Data, size_t Size)
 {
-    if (fork() == 0) {
+    if (fork_fuzzer_and_wait()) {
         virtio_net_fuzz_multi(s, Data, Size, false);
         flush_events(s);
         _Exit(0);
     } else {
         flush_events(s);
-        wait(NULL);
     }
 }
 
 static void virtio_net_fork_fuzz_check_used(QTestState *s,
         const unsigned char *Data, size_t Size)
 {
-    if (fork() == 0) {
+    if (fork_fuzzer_and_wait()) {
         virtio_net_fuzz_multi(s, Data, Size, true);
         flush_events(s);
         _Exit(0);
     } else {
         flush_events(s);
-        wait(NULL);
     }
 }
 
diff --git a/tests/qtest/fuzz/virtio_scsi_fuzz.c b/tests/qtest/fuzz/virtio_scsi_fuzz.c
index 6ff6fabe4a..c7eaf3242b 100644
--- a/tests/qtest/fuzz/virtio_scsi_fuzz.c
+++ b/tests/qtest/fuzz/virtio_scsi_fuzz.c
@@ -140,13 +140,12 @@ static void virtio_scsi_fork_fuzz(QTestState *s,
     if (!queues) {
         queues = qvirtio_scsi_init(scsi->vdev, 0);
     }
-    if (fork() == 0) {
+    if (fork_fuzzer_and_wait()) {
         virtio_scsi_fuzz(s, queues, Data, Size);
         flush_events(s);
         _Exit(0);
     } else {
         flush_events(s);
-        wait(NULL);
     }
 }
 
@@ -156,7 +155,7 @@ static void virtio_scsi_with_flag_fuzz(QTestState *s,
     QVirtioSCSI *scsi = fuzz_qos_obj;
     static QVirtioSCSIQueues *queues;
 
-    if (fork() == 0) {
+    if (fork_fuzzer_and_wait()) {
         if (Size >= sizeof(uint64_t)) {
             queues = qvirtio_scsi_init(scsi->vdev, *(uint64_t *)Data);
             virtio_scsi_fuzz(s, queues,
@@ -166,7 +165,6 @@ static void virtio_scsi_with_flag_fuzz(QTestState *s,
         _Exit(0);
     } else {
         flush_events(s);
-        wait(NULL);
     }
 }
 


