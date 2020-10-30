Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B69692A003B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 09:43:48 +0100 (CET)
Received: from localhost ([::1]:47360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYQ0h-0008Uh-Rz
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 04:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <b111895492f8fb79bcca1c3e9586c0615f46cc97@lizzy.crudebyte.com>)
 id 1kYPyV-0006Ur-H5
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 04:41:31 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:34439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <b111895492f8fb79bcca1c3e9586c0615f46cc97@lizzy.crudebyte.com>)
 id 1kYPyT-000487-S6
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 04:41:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=TYpAqY+nQKdFSjfR6Uv42nfzjmKSdH0n8xLRASXaJqA=; b=i9T8I
 2gUqFsAMQZEou/Y89t/yiDnOHgCaUeP0eMauuUKt0QKoHIXkOyLuYw6G2yhLneJN+6+7ua3QRYT8f
 r2kDcUNS2T88DMqNyaV2B/RLoCZpAilpOXj0Vcr6dZXjqMnoCmXiapxwtb0ggwBOCm611TmktOmNk
 97l0mUVQNJNx4R/r4nXaXbfA23/uS9ZZXa7vsxvSgJio6ODxob8ona5POfqvyNde+4gofK/IyxiAS
 0ObxlY9uOnR8E2nWZNRzWP6JJYc/GC8YcC/bmKhwLShpJ9fZKpPjA0E3F7Q1wlzuw8aRu54cjKHO+
 23BbAis7VwXDxumAFGIN03oXTLMqQ==;
Message-Id: <b111895492f8fb79bcca1c3e9586c0615f46cc97.1604046404.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1604046404.git.qemu_oss@crudebyte.com>
References: <cover.1604046404.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 30 Oct 2020 09:19:46 +0100
Subject: [PATCH 2/2] tests/9pfs: fix coverity error in create_local_test_dir()
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=b111895492f8fb79bcca1c3e9586c0615f46cc97@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 04:40:14
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

Coverity wants the return value of mkdir() to be checked, so let's
pretend to do that. We're actually just making a dummy check and
ignore the result, because we actually only care if the required
directory exists and we have an existence check for that in place
already.

Reported-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/libqos/virtio-9p.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/libqos/virtio-9p.c b/tests/qtest/libqos/virtio-9p.c
index 6b22fa0e9a..0a7c0ee5d8 100644
--- a/tests/qtest/libqos/virtio-9p.c
+++ b/tests/qtest/libqos/virtio-9p.c
@@ -48,9 +48,13 @@ static void init_local_test_path(void)
 static void create_local_test_dir(void)
 {
     struct stat st;
+    int res;
 
     g_assert(local_test_path != NULL);
-    mkdir(local_test_path, 0777);
+    res = mkdir(local_test_path, 0777);
+    if (res < 0) {
+        /* ignore error, dummy check to prevent error by coverity */
+    }
 
     /* ensure test directory exists now ... */
     g_assert(stat(local_test_path, &st) == 0);
-- 
2.20.1


