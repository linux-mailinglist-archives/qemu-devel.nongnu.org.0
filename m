Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DD62A3A22
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 02:57:45 +0100 (CET)
Received: from localhost ([::1]:53046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZlZw-0003wM-LW
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 20:57:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kZlWg-000252-GS; Mon, 02 Nov 2020 20:54:22 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kZlVN-0001nl-JX; Mon, 02 Nov 2020 20:54:22 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CQCV035wCzhfRQ;
 Tue,  3 Nov 2020 09:52:56 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Tue, 3 Nov 2020
 09:52:51 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH 5/6] plugins/loader: fix uninitialized variable warning in
 plugin_reset_uninstall()
Date: Tue, 3 Nov 2020 09:52:27 +0800
Message-ID: <20201103015228.2250547-6-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201103015228.2250547-1-kuhn.chenqun@huawei.com>
References: <20201103015228.2250547-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 20:52:53
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 zhang.zhanghailiang@huawei.com, ganqixin@huawei.com,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After the WITH_QEMU_LOCK_GUARD macro is added, the compiler cannot identify
 that the statements in the macro must be executed. As a result, some variables
 assignment statements in the macro may be considered as unexecuted by the compiler.

The compiler showed warning:
plugins/loader.c: In function ‘plugin_reset_uninstall’:
plugins/loader.c:382:15: warning: ‘ctx’ may be used uninitialized in this function [-Wmaybe-uninitialized]
 382 |     data->ctx = ctx;
     |     ~~~~~~~~~~^~~~~

Add a default value for 'expire_time' to prevented the warning.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: "Alex Bennée" <alex.bennee@linaro.org>
---
 plugins/loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/plugins/loader.c b/plugins/loader.c
index 8ac5dbc20f..88593fe138 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -367,7 +367,7 @@ void plugin_reset_uninstall(qemu_plugin_id_t id,
                             bool reset)
 {
     struct qemu_plugin_reset_data *data;
-    struct qemu_plugin_ctx *ctx;
+    struct qemu_plugin_ctx *ctx = NULL;
 
     WITH_QEMU_LOCK_GUARD(&plugin.lock) {
         ctx = plugin_id_to_ctx_locked(id);
-- 
2.27.0


