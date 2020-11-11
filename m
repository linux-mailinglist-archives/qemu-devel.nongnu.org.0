Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A712AF376
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 15:24:39 +0100 (CET)
Received: from localhost ([::1]:36894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcr38-0005xb-VJ
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 09:24:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kcr1V-0004J0-Nq; Wed, 11 Nov 2020 09:22:57 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kcr1K-0000cI-VY; Wed, 11 Nov 2020 09:22:57 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CWRl84MRGzhk1P;
 Wed, 11 Nov 2020 22:22:28 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Wed, 11 Nov 2020
 22:22:28 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v2 4/5] plugins/loader: fix uninitialized variable warning in
 plugin_reset_uninstall()
Date: Wed, 11 Nov 2020 22:22:02 +0800
Message-ID: <20201111142203.2359370-5-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201111142203.2359370-1-kuhn.chenqun@huawei.com>
References: <20201111142203.2359370-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 07:07:25
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 ganqixin@huawei.com, Euler Robot <euler.robot@huawei.com>,
 Chen Qun <kuhn.chenqun@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After the WITH_QEMU_LOCK_GUARD macro is added, the compiler cannot identify
 that the statements in the macro must be executed. As a result, some variables
 assignment statements in the macro may be considered as unexecuted by the compiler.

When the -Wmaybe-uninitialized capability is enabled on GCC9,the compiler showed warning:
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


