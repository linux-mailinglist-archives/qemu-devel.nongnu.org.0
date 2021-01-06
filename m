Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BEC2EB93A
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 06:13:03 +0100 (CET)
Received: from localhost ([::1]:34678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx181-0002II-8U
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 00:13:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kx14E-0000LX-NY; Wed, 06 Jan 2021 00:09:06 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kx14B-0007hS-FW; Wed, 06 Jan 2021 00:09:06 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4D9cng0bKszj330;
 Wed,  6 Jan 2021 13:08:07 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.498.0; Wed, 6 Jan 2021
 13:08:44 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v2] qtest/libqtest: fix heap-buffer-overflow in
 qtest_cb_for_every_machine()
Date: Wed, 6 Jan 2021 13:06:25 +0800
Message-ID: <20210106050625.518041-1-ganqixin@huawei.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=ganqixin@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 zhang.zhanghailiang@huawei.com, Gan Qixin <ganqixin@huawei.com>,
 Euler Robot <euler.robot@huawei.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the length of mname is less than 5, memcpy("xenfv", mname, 5) will cause
heap buffer overflow. Therefore, use strncmp to avoid this problem.

The asan showed stack:

ERROR: AddressSanitizer: heap-buffer-overflow on address 0x60200000f2f4 at
pc 0x7f65d8cc2225 bp 0x7ffe93cc5a60 sp 0x7ffe93cc5208 READ of size 5 at
0x60200000f2f4 thread T0
    #0 0x7f65d8cc2224 in memcmp (/lib64/libasan.so.5+0xdf224)
    #1 0x5632c20be95b in qtest_cb_for_every_machine tests/qtest/libqtest.c:1282
    #2 0x5632c20b7995 in main tests/qtest/test-hmp.c:160
    #3 0x7f65d88fed42 in __libc_start_main (/lib64/libc.so.6+0x26d42)
    #4 0x5632c20b72cd in _start (build/tests/qtest/test-hmp+0x542cd)

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
Cc: Thomas Huth <thuth@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>

v2:
Changes suggested by Thomas Huth:
    Replace memcmp(..., 5) with strncmp(..., 5).
---
 tests/qtest/libqtest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index e49f3a1e45..e93424ffdd 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -1281,7 +1281,7 @@ void qtest_cb_for_every_machine(void (*cb)(const char *machine),
         g_assert(qstr);
         mname = qstring_get_str(qstr);
         /* Ignore machines that cannot be used for qtests */
-        if (!memcmp("xenfv", mname, 5) || g_str_equal("xenpv", mname)) {
+        if (!strncmp("xenfv", mname, 5) || g_str_equal("xenpv", mname)) {
             continue;
         }
         if (!skip_old_versioned || !qtest_is_old_versioned_machine(mname)) {
-- 
2.27.0


