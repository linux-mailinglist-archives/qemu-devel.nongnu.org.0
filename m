Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C51032C3DCA
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 11:38:16 +0100 (CET)
Received: from localhost ([::1]:52952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khsBj-0005jV-Sc
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 05:38:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1khsA3-0004yA-3H; Wed, 25 Nov 2020 05:36:31 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1khsA0-0005XQ-NY; Wed, 25 Nov 2020 05:36:30 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cgy3G6JQ3zkfdN;
 Wed, 25 Nov 2020 18:35:54 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Wed, 25 Nov 2020
 18:36:12 +0800
From: Alex Chen <alex.chen@huawei.com>
To: <mdroth@linux.vnet.ibm.com>
Subject: [PATCH] test-qga: fix a resource leak in test_qga_guest_get_osinfo()
Date: Wed, 25 Nov 2020 10:24:03 +0000
Message-ID: <20201125102403.57709-1-alex.chen@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=alex.chen@huawei.com;
 helo=szxga04-in.huawei.com
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
Cc: alex.chen@huawei.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fixture->fd is created in fixture_setup() and, likewise, needs to be closed
in fixture_tear_down().

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 tests/test-qga.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/test-qga.c b/tests/test-qga.c
index c1b173b3cb..eb33264e8e 100644
--- a/tests/test-qga.c
+++ b/tests/test-qga.c
@@ -111,6 +111,7 @@ fixture_tear_down(TestFixture *fixture, gconstpointer data)
 
     g_rmdir(fixture->test_dir);
     g_free(fixture->test_dir);
+    close(fixture->fd);
 }
 
 static void qmp_assertion_message_error(const char     *domain,
-- 
2.19.1


