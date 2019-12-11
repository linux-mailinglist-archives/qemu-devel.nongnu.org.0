Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8817911A047
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Dec 2019 01:56:49 +0100 (CET)
Received: from localhost ([::1]:37558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieqJ6-0001xl-M0
	for lists+qemu-devel@lfdr.de; Tue, 10 Dec 2019 19:56:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33675)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1ieqIJ-0001Xb-Fj
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 19:56:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1ieqII-0000vD-3y
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 19:55:59 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:54742 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1ieqIH-0000p9-OD
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 19:55:58 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id C68B1527FACBB1B19252;
 Wed, 11 Dec 2019 08:55:52 +0800 (CST)
Received: from HGHY2P002143101.china.huawei.com (10.184.39.213) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Wed, 11 Dec 2019 08:55:45 +0800
From: <pannengyuan@huawei.com>
To: <thuth@redhat.com>, <lvivier@redhat.com>, <pbonzini@redhat.com>
Subject: [PATCH] vhost-user-test: fix a memory leak
Date: Wed, 11 Dec 2019 08:55:22 +0800
Message-ID: <1576025722-41720-1-git-send-email-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.7.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: Pan Nengyuan <pannengyuan@huawei.com>, zhang.zhanghailiang@huawei.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pan Nengyuan <pannengyuan@huawei.com>

Spotted by ASAN.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
---
 tests/vhost-user-test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/vhost-user-test.c b/tests/vhost-user-test.c
index 91ea373..54be931 100644
--- a/tests/vhost-user-test.c
+++ b/tests/vhost-user-test.c
@@ -717,6 +717,8 @@ static void test_migrate(void *obj, void *arg, QGuestAllocator *alloc)
     guint64 size;
 
     if (!wait_for_fds(s)) {
+        g_free(uri);
+        test_server_free(dest);
         return;
     }
 
-- 
2.7.2.windows.1



