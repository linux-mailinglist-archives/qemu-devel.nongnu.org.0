Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1170E2A1F09
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Nov 2020 16:26:55 +0100 (CET)
Received: from localhost ([::1]:54996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZFFu-0006ZB-5d
	for lists+qemu-devel@lfdr.de; Sun, 01 Nov 2020 10:26:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <7746f42d8f557593898d3d9d8e57c46e872dfb4f@lizzy.crudebyte.com>)
 id 1kZFCf-0003No-Hs
 for qemu-devel@nongnu.org; Sun, 01 Nov 2020 10:23:33 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:51771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <7746f42d8f557593898d3d9d8e57c46e872dfb4f@lizzy.crudebyte.com>)
 id 1kZFCd-0006kh-PH
 for qemu-devel@nongnu.org; Sun, 01 Nov 2020 10:23:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=tgAD6D3APZHppVajKkzG3/l4JDgMPHhecmwfxqWqFbA=; b=cte5y
 5XGQW5J70IeTFzv1Ld7/7JPQK0K5Js1EWjTz9E0DaKN3/dWgT2L3y1BooeUyro73NEG2FY97ic/rg
 nt2bZb6b+5of25Be+zsSfhtMtIw0Qf8sBr6RMss+4/TKzQoUbM45Z1ev8xL+4nrntZlGyam0ehZxg
 8J50sD57/thev5EZuto43Bgkx20cWd92fkiM8KlyvCdO52aVoFD3nlBHcrDsDw++htt2srIGuC3S2
 QstNWetsMWx4ujerqfIpJcBIFLWbeAdvsO1krllXHmEEP6BdayATGEQkfa7pECSyOoSOEWbksR7Kr
 pXxjR+jmcWWbwhHVLDzV8d8TNFM7w==;
Message-Id: <7746f42d8f557593898d3d9d8e57c46e872dfb4f.1604243521.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1604243521.git.qemu_oss@crudebyte.com>
References: <cover.1604243521.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sun, 1 Nov 2020 15:37:12 +0100
Subject: [PATCH v3 2/2] tests/9pfs: fix test dir for parallel tests
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=7746f42d8f557593898d3d9d8e57c46e872dfb4f@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/01 10:22:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use mkdtemp() to generate a unique directory for the 9p 'local' tests.

This fixes occasional 9p test failures when running 'make check -jN' if
QEMU was compiled for multiple target architectures, because the individual
architecture's test suites would run in parallel and interfere with each
other's data as the test directory was previously hard coded and hence the
same directory was used by all of them simultaniously.

This also requires a change how the test directory is created and deleted:
As the test path is now randomized and virtio_9p_register_nodes() being
called in a somewhat undeterministic way, that's no longer an appropriate
place to create and remove the test directory. Use a constructor and
destructor function for creating and removing the test directory instead.
Unfortunately libqos currently does not support setup/teardown callbacks
to handle this more cleanly.

The constructor functions needs to be in virtio-9p-test.c, not in
virtio-9p.c, because in the latter location it would cause all apps that
link to libqos (i.e. entirely unrelated test suites) to create a 9pfs
test directory as well, which would even break other test suites.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/libqos/virtio-9p.c | 14 ++++++++------
 tests/qtest/virtio-9p-test.c   | 12 ++++++++++++
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/libqos/virtio-9p.c b/tests/qtest/libqos/virtio-9p.c
index 2736e9ae2a..586e700b24 100644
--- a/tests/qtest/libqos/virtio-9p.c
+++ b/tests/qtest/libqos/virtio-9p.c
@@ -35,7 +35,12 @@ static char *concat_path(const char* a, const char* b)
 static void init_local_test_path(void)
 {
     char *pwd = g_get_current_dir();
-    local_test_path = concat_path(pwd, "qtest-9p-local");
+    char *template = concat_path(pwd, "qtest-9p-local-XXXXXX");
+    local_test_path = mkdtemp(template);
+    if (!local_test_path) {
+        g_test_message("mkdtemp('%s') failed: %s", template, strerror(errno));
+    }
+    g_assert(local_test_path);
     g_free(pwd);
 }
 
@@ -43,6 +48,8 @@ void virtio_9p_create_local_test_dir(void)
 {
     struct stat st;
 
+    init_local_test_path();
+
     g_assert(local_test_path != NULL);
     mkdir(local_test_path, 0777);
 
@@ -244,11 +251,6 @@ static void virtio_9p_register_nodes(void)
     const char *str_simple = "fsdev=fsdev0,mount_tag=" MOUNT_TAG;
     const char *str_addr = "fsdev=fsdev0,addr=04.0,mount_tag=" MOUNT_TAG;
 
-    /* make sure test dir for the 'local' tests exists and is clean */
-    init_local_test_path();
-    virtio_9p_remove_local_test_dir();
-    virtio_9p_create_local_test_dir();
-
     QPCIAddress addr = {
         .devfn = QPCI_DEVFN(4, 0),
     };
diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index c15908f27b..6401d4f564 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -1076,3 +1076,15 @@ static void register_virtio_9p_test(void)
 }
 
 libqos_init(register_virtio_9p_test);
+
+static void __attribute__((constructor)) construct_9p_test(void)
+{
+    /* make sure test dir for the 'local' tests exists */
+    virtio_9p_create_local_test_dir();
+}
+
+static void __attribute__((destructor)) destruct_9p_test(void)
+{
+    /* remove previously created test dir when test suite completed */
+    virtio_9p_remove_local_test_dir();
+}
-- 
2.20.1


