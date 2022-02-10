Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A20994B0C8A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 12:41:22 +0100 (CET)
Received: from localhost ([::1]:43550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI7pB-00050G-E0
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 06:41:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <5279f88ced3f628b475f7b9e1cb3b5f4c0377b8c@lizzy.crudebyte.com>)
 id 1nI7kB-0007eh-UY
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:36:14 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:46401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <5279f88ced3f628b475f7b9e1cb3b5f4c0377b8c@lizzy.crudebyte.com>)
 id 1nI7jp-0003Sk-GD
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:36:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:From:References:In-Reply-To:Message-Id:Content-ID:
 Content-Description; bh=rMf4KtmBn+yyQQHi+FpBQwGipj8F3jW/JGrXe3xFgzc=; b=CXo1H
 zFIpz08LUZc9lINYj1BTXeeZHsVTReRkvoV1IWj1kIHLdUjUCPGJx8lKdxJXM43fNLZGqU3gm0dt4
 y7vcc3QfUbmAh0aaJFpfZHSg0d3QXBK56VCR4UKe8Ee6OWzP8/5MHV0/9UatU0CH2tgMnPv+/AezX
 VaWjIUaJ8/hbV0C5lLCYz2s2cMzb4YuGuEJiVW6m1kn7a3MmFFIudU2RVwUSBD67oeW7nWwnwhvhT
 AMmjIHmnl9mW6JUJr9jdoz6B6L7EUX+PSqyj8kl0azpKaaLrKVKmx8ZPjz5Hwm2JY8LPROnVh0/sq
 zJbyEB6Yw0bMlq40KuB33guxsD3aw==;
Message-Id: <5279f88ced3f628b475f7b9e1cb3b5f4c0377b8c.1644492115.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1644492115.git.qemu_oss@crudebyte.com>
References: <cover.1644492115.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 10 Feb 2022 12:21:55 +0100
Subject: [PULL 2/5] tests/9pfs: fix mkdir() being called twice
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=5279f88ced3f628b475f7b9e1cb3b5f4c0377b8c@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Greg Kurz <Greg Kurz <groug@kaod.org>
Message-Id: <f6602123c6f7d0d593466231b04fba087817abbd.1642879848.git.qemu_oss@crudebyte.com>
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
2.20.1


