Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B082AF386
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 15:28:39 +0100 (CET)
Received: from localhost ([::1]:49170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcr70-0002eX-5G
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 09:28:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kcr1W-0004Kp-Ma; Wed, 11 Nov 2020 09:22:58 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kcr1H-0000c5-9k; Wed, 11 Nov 2020 09:22:58 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CWRl33JYRz15SyH;
 Wed, 11 Nov 2020 22:22:23 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Wed, 11 Nov 2020
 22:22:26 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v2 2/5] util/qemu-timer: fix uninitialized variable warning in
 timer_mod_anticipate_ns()
Date: Wed, 11 Nov 2020 22:22:00 +0800
Message-ID: <20201111142203.2359370-3-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201111142203.2359370-1-kuhn.chenqun@huawei.com>
References: <20201111142203.2359370-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 07:50:46
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>, ganqixin@huawei.com,
 Euler Robot <euler.robot@huawei.com>, Chen Qun <kuhn.chenqun@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After the WITH_QEMU_LOCK_GUARD macro is added, the compiler cannot identify
 that the statements in the macro must be executed. As a result, some variables
 assignment statements in the macro may be considered as unexecuted by the compiler.

When the -Wmaybe-uninitialized capability is enabled on GCC9,the compiler showed warning:
util/qemu-timer.c: In function ‘timer_mod_anticipate_ns’:
util/qemu-timer.c:474:8: warning: ‘rearm’ may be used uninitialized in this function [-Wmaybe-uninitialized]
  474 |     if (rearm) {
      |        ^

Change the default value assignment place to prevented the warning.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-timer.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/util/qemu-timer.c b/util/qemu-timer.c
index 81c28af517..8b73882fbb 100644
--- a/util/qemu-timer.c
+++ b/util/qemu-timer.c
@@ -459,7 +459,7 @@ void timer_mod_ns(QEMUTimer *ts, int64_t expire_time)
 void timer_mod_anticipate_ns(QEMUTimer *ts, int64_t expire_time)
 {
     QEMUTimerList *timer_list = ts->timer_list;
-    bool rearm;
+    bool rearm = false;
 
     WITH_QEMU_LOCK_GUARD(&timer_list->active_timers_lock) {
         if (ts->expire_time == -1 || ts->expire_time > expire_time) {
@@ -467,8 +467,6 @@ void timer_mod_anticipate_ns(QEMUTimer *ts, int64_t expire_time)
                 timer_del_locked(timer_list, ts);
             }
             rearm = timer_mod_ns_locked(timer_list, ts, expire_time);
-        } else {
-            rearm = false;
         }
     }
     if (rearm) {
-- 
2.27.0


