Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D81922A0866
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 15:49:55 +0100 (CET)
Received: from localhost ([::1]:46664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYVj0-0005pt-Th
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 10:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <fd3237f7b005b1b73c954ccd5c6011e8228e19a3@lizzy.crudebyte.com>)
 id 1kYVeB-0000Ux-Qw
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 10:44:56 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:58665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <fd3237f7b005b1b73c954ccd5c6011e8228e19a3@lizzy.crudebyte.com>)
 id 1kYVe9-00035C-K9
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 10:44:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=Z0ImmQscMHR59q1t1F4LKh1wUiJ144ww81BSEZTFXJ4=; b=maWH9
 Zaqg7MXsiOZYTaKdHsTqDQT5Tvpzt6xGKTRI8DJTHh8IFa/HlPWiNpnH0+WjVoNQUKdcM+7VSPMwo
 j96LBYvezriAJciR5rkWyc3lZaaB9quHi7IE1No9I3LnDml3KoPpQ53aSoJh2qEegbtbKU9Wwyz6F
 p029C6RHiu4esUshm5YhUH73W22DO3PITc3Iw2tld/w17BxG3pA6jtgWFbb28AOutGYXhEV24/nVg
 Y87DLW9cOqqCD28qCCTDx5wjWVQw3pxl05JBOyTDXjlsJ+bopBwC3q//OB6/SdwY3ubSzYhf9OQuC
 +kAypCCbOI1Nmbr+DuWOunwDzpxIA==;
Message-Id: <fd3237f7b005b1b73c954ccd5c6011e8228e19a3.1604067568.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1604067568.git.qemu_oss@crudebyte.com>
References: <cover.1604067568.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 30 Oct 2020 13:07:03 +0100
Subject: [PULL v2 01/16] tests/9pfs: fix test dir for parallel tests
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=fd3237f7b005b1b73c954ccd5c6011e8228e19a3@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 07:59:50
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

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Tested-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <a37fbc713614f7615b11d0a3cb8d9adc3b8fba4b.1604061839.git.qemu_oss@crudebyte.com>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/libqos/virtio-9p.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/libqos/virtio-9p.c b/tests/qtest/libqos/virtio-9p.c
index d43647b3b7..6b22fa0e9a 100644
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
 
@@ -246,11 +251,6 @@ static void virtio_9p_register_nodes(void)
     const char *str_simple = "fsdev=fsdev0,mount_tag=" MOUNT_TAG;
     const char *str_addr = "fsdev=fsdev0,addr=04.0,mount_tag=" MOUNT_TAG;
 
-    /* make sure test dir for the 'local' tests exists and is clean */
-    init_local_test_path();
-    remove_local_test_dir();
-    create_local_test_dir();
-
     QPCIAddress addr = {
         .devfn = QPCI_DEVFN(4, 0),
     };
@@ -278,3 +278,16 @@ static void virtio_9p_register_nodes(void)
 }
 
 libqos_init(virtio_9p_register_nodes);
+
+static void __attribute__((constructor)) construct_virtio_9p(void)
+{
+    /* make sure test dir for the 'local' tests exists */
+    init_local_test_path();
+    create_local_test_dir();
+}
+
+static void __attribute__((destructor)) destruct_virtio_9p(void)
+{
+    /* remove previously created test dir when test suite completed */
+    remove_local_test_dir();
+}
-- 
2.20.1


