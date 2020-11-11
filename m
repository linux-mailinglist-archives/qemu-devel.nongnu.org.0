Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA66D2AF374
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 15:24:35 +0100 (CET)
Received: from localhost ([::1]:36480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcr34-0005nV-RQ
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 09:24:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kcr1W-0004Jg-4c; Wed, 11 Nov 2020 09:22:58 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kcr1J-0000cK-CM; Wed, 11 Nov 2020 09:22:57 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CWRl849jDzhjsj;
 Wed, 11 Nov 2020 22:22:28 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Wed, 11 Nov 2020
 22:22:27 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v2 3/5] util/qemu-timer: fix uninitialized variable warning
 for expire_time
Date: Wed, 11 Nov 2020 22:22:01 +0800
Message-ID: <20201111142203.2359370-4-kuhn.chenqun@huawei.com>
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
 Chen Qun <kuhn.chenqun@huawei.com>, ganqixin@huawei.com,
 Euler Robot <euler.robot@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After the WITH_QEMU_LOCK_GUARD macro is added, the compiler cannot identify
 that the statements in the macro must be executed. As a result, some variables
 assignment statements in the macro may be considered as unexecuted by the compiler.

When the -Wmaybe-uninitialized capability is enabled on GCC9,the compiler showed warning:
util/qemu-timer.c: In function ‘timerlist_expired’:
util/qemu-timer.c:199:24: warning: ‘expire_time’ may be used uninitialized in this function [-Wmaybe-uninitialized]
 199 |     return expire_time <= qemu_clock_get_ns(timer_list->clock->type);
     |            ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
util/qemu-timer.c: In function ‘timerlist_deadline_ns’:
util/qemu-timer.c:237:11: warning: ‘expire_time’ may be used uninitialized in this function [-Wmaybe-uninitialized]
 237 |     delta = expire_time - qemu_clock_get_ns(timer_list->clock->type);
     |     ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Add a default value for 'expire_time' to prevented the warning.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-timer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util/qemu-timer.c b/util/qemu-timer.c
index 8b73882fbb..3910003e86 100644
--- a/util/qemu-timer.c
+++ b/util/qemu-timer.c
@@ -183,7 +183,7 @@ bool qemu_clock_has_timers(QEMUClockType type)
 
 bool timerlist_expired(QEMUTimerList *timer_list)
 {
-    int64_t expire_time;
+    int64_t expire_time = -1;
 
     if (!qatomic_read(&timer_list->active_timers)) {
         return false;
@@ -213,7 +213,7 @@ bool qemu_clock_expired(QEMUClockType type)
 int64_t timerlist_deadline_ns(QEMUTimerList *timer_list)
 {
     int64_t delta;
-    int64_t expire_time;
+    int64_t expire_time = -1;
 
     if (!qatomic_read(&timer_list->active_timers)) {
         return -1;
-- 
2.27.0


