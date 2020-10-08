Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B7728FA6C
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 23:11:08 +0200 (CEST)
Received: from localhost ([::1]:47942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTAWh-0001NH-HN
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 17:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <ec4e129a86d10accb2cae61a772448aac3a9b492@lizzy.crudebyte.com>)
 id 1kTARe-0004vi-3c
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 17:05:54 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:58041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <ec4e129a86d10accb2cae61a772448aac3a9b492@lizzy.crudebyte.com>)
 id 1kTARc-0007qy-Jk
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 17:05:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=yOUQbYR5WfMn9azUHkF5ABzZei1pcfItPBiOJKrj8Lw=; b=lm2VV
 vIJbIUPLzfZq+O6ghBwblIyvXtMIEiLN3EVxBNO6prsj/xGdJN0LcNsEaCaXO4aRFGDvSlyhyoplp
 U4PG5FyazdE5ik0PZMR2W2NhoIv+jGvyN2uFaJqXIBpzhNIH1gjsZU6sM/TV5lyYog/hAtONMjJn7
 3oXWh5beWCftXYDFFaCj84rasfFzGQCX7zzh5Ezvp5Lg1bl8zWl+vQoKK14mdOKwumWbMYVxW4B4S
 5nmAgleXymvnBkwm1rI+6AXBG/iUOyqhSXb8pCkBbo013vtQ0VXIqcqNmz2jToI7NAgdbVh3W9+Ij
 L1WmoMr001QjXCzGJ7cnnRsp6p86Q==;
Message-Id: <ec4e129a86d10accb2cae61a772448aac3a9b492.1602771296.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1602771296.git.qemu_oss@crudebyte.com>
References: <cover.1602771296.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 8 Oct 2020 20:34:56 +0200
Subject: [PULL 3/5] tests/9pfs: wipe local 9pfs test directory
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=ec4e129a86d10accb2cae61a772448aac3a9b492@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 17:04:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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

Before running the first 9pfs test case, make sure the test directory
for running the 9pfs 'local' tests on is entirely empty. For that
reason simply delete the test directory (if any) before (re)creating
it on test suite startup.

Note: The preferable precise behaviour would be the test directory
only being wiped once *before* a test suite run. Right now the test
directory is also wiped at the *end* of a test suite run because
libqos is calling the virtio_9p_register_nodes() callback for some
reason also when a test suite completed. This is suboptimal as
developers cannot immediately see what files and directories the
9pfs local tests created precisely after the test suite completed.
But fortunately the test directory is not wiped if some test failed.
So it is probably not worth it drilling another hole into libqos
for this issue.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <b30776ea3289dc40dabc7d0063d825d21d9a65bf.1602182956.git.qemu_oss@crudebyte.com>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/libqos/virtio-9p.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/qtest/libqos/virtio-9p.c b/tests/qtest/libqos/virtio-9p.c
index 9cb284cb3c..bd53498041 100644
--- a/tests/qtest/libqos/virtio-9p.c
+++ b/tests/qtest/libqos/virtio-9p.c
@@ -53,6 +53,18 @@ static void create_local_test_dir(void)
     g_assert((st.st_mode & S_IFMT) == S_IFDIR);
 }
 
+/* Deletes directory previously created by create_local_test_dir(). */
+static void remove_local_test_dir(void)
+{
+    g_assert(local_test_path != NULL);
+    char *cmd = g_strdup_printf("rm -r '%s'\n", local_test_path);
+    int res = system(cmd);
+    if (res < 0) {
+        /* ignore error, dummy check to prevent compiler error */
+    }
+    g_free(cmd);
+}
+
 static void virtio_9p_cleanup(QVirtio9P *interface)
 {
     qvirtqueue_cleanup(interface->vdev->bus, interface->vq, alloc);
@@ -230,6 +242,7 @@ static void virtio_9p_register_nodes(void)
 
     /* make sure test dir for the 'local' tests exists and is clean */
     init_local_test_path();
+    remove_local_test_dir();
     create_local_test_dir();
 
     QPCIAddress addr = {
-- 
2.20.1


