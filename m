Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E15C4496DE7
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 21:14:53 +0100 (CET)
Received: from localhost ([::1]:41158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBMmi-0003mz-Gc
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 15:14:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <f6602123c6f7d0d593466231b04fba087817abbd@lizzy.crudebyte.com>)
 id 1nBMl9-00036y-Md
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 15:13:16 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:34973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <f6602123c6f7d0d593466231b04fba087817abbd@lizzy.crudebyte.com>)
 id 1nBMl7-00083n-Rt
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 15:13:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:From:Message-Id:References:In-Reply-To:Content-ID:
 Content-Description; bh=1rxteShGbGr0HytmhaIkOB+CBuQvAnTZiOrMYDBSLf0=; b=T7E+h
 lUK1lYOrLiMAFiUdDnGKyaDNVLQWVBdQ+zIB2qDMnNIG9qisnkqvO6M/wBzgFh3W1Mdr6Plf0xYTG
 snA3RM0sIr2AsclycMl2LhpTV0WwZiBSSMjXYr20lIQ8ByeBB+DdqYZv99v9noL9jpntpg7EyD63g
 F9R07/H69/N0bqXiN1ojERs7krreumuhhetsKC0ewLCFCfxLBqBljHG7uaZU/iwzWofc+a8jNMga+
 OQP2Qv0WtJl6w0bsjoSUQdhhX6nnpyaIRFRs92hBiwl5yPhhVJWExX8vXZX3v/5D0O5qrLZgGFmB0
 e67uDy+eWh5LqdcOqJtp8vi3tRbjQ==;
Message-Id: <f6602123c6f7d0d593466231b04fba087817abbd.1642879848.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sat, 22 Jan 2022 20:12:16 +0100
Subject: [PATCH] tests/9pfs: fix mkdir() being called twice
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
    "Daniel P. Berrangé" <berrange@redhat.com>,
    Thomas Huth <thuth@redhat.com>,
    Alex Bennée <alex.bennee@linaro.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=f6602123c6f7d0d593466231b04fba087817abbd@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

The 9p test cases use mkdtemp() to create a temporary directory for
running the 'local' 9p tests with real files/dirs. Unlike mktemp()
which only generates a unique file name, mkdtemp() also creates the
directory, therefore the subsequent mkdir() was wrong and caused
errors on some systems.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Fixes: 136b7af2 (tests/9pfs: fix test dir for parallel tests)
Reported-by: Daniel P. Berrangé <berrange@redhat.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/832
---
 tests/qtest/libqos/virtio-9p.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/tests/qtest/libqos/virtio-9p.c b/tests/qtest/libqos/virtio-9p.c
index b4e1143288..ef96ef006a 100644
--- a/tests/qtest/libqos/virtio-9p.c
+++ b/tests/qtest/libqos/virtio-9p.c
@@ -37,31 +37,19 @@ static char *concat_path(const char* a, const char* b)
     return g_build_filename(a, b, NULL);
 }
 
-static void init_local_test_path(void)
+void virtio_9p_create_local_test_dir(void)
 {
+    struct stat st;
     char *pwd = g_get_current_dir();
     char *template = concat_path(pwd, "qtest-9p-local-XXXXXX");
+
     local_test_path = mkdtemp(template);
     if (!local_test_path) {
         g_test_message("mkdtemp('%s') failed: %s", template, strerror(errno));
     }
-    g_assert(local_test_path);
     g_free(pwd);
-}
-
-void virtio_9p_create_local_test_dir(void)
-{
-    struct stat st;
-    int res;
-
-    init_local_test_path();
 
     g_assert(local_test_path != NULL);
-    res = mkdir(local_test_path, 0777);
-    if (res < 0) {
-        g_test_message("mkdir('%s') failed: %s", local_test_path,
-                       strerror(errno));
-    }
 
     /* ensure test directory exists now ... */
     g_assert(stat(local_test_path, &st) == 0);
-- 
2.30.2


