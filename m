Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B22A12AEAB2
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 08:58:23 +0100 (CET)
Received: from localhost ([::1]:45278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcl1K-00005Z-Os
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 02:58:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kcl0K-0007gy-Rc; Wed, 11 Nov 2020 02:57:20 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kcl0G-0001b8-6g; Wed, 11 Nov 2020 02:57:20 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CWHBP0xHSzkh6Q;
 Wed, 11 Nov 2020 15:57:01 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Wed, 11 Nov 2020
 15:57:06 +0800
From: Alex Chen <alex.chen@huawei.com>
To: <armbru@redhat.com>, <peter.maydell@linaro.org>
Subject: [PATCH] qemu-keymap.c: Fix bad printf format specifiers
Date: Wed, 11 Nov 2020 07:46:01 +0000
Message-ID: <20201111074601.37765-1-alex.chen@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=alex.chen@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 02:07:52
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
Cc: alex.chen@huawei.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We should use printf format specifier "%u" instead of "%d" for
argument of type "unsigned int".

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 qemu-keymap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-keymap.c b/qemu-keymap.c
index 536e8f2385..6797006dda 100644
--- a/qemu-keymap.c
+++ b/qemu-keymap.c
@@ -77,11 +77,11 @@ static void walk_map(struct xkb_keymap *map, xkb_keycode_t code, void *data)
         xkb_state_update_mask(state,  0, 0, 0,  0, 0, 0);
         kbase = xkb_state_key_get_one_sym(state, code);
         xkb_keysym_get_name(kbase, name, sizeof(name));
-        fprintf(outfile, "# evdev %d (0x%x): no evdev -> QKeyCode mapping"
+        fprintf(outfile, "# evdev %u (0x%x): no evdev -> QKeyCode mapping"
                 " (xkb keysym %s)\n", evdev, evdev, name);
         return;
     }
-    fprintf(outfile, "# evdev %d (0x%x), QKeyCode \"%s\", number 0x%x\n",
+    fprintf(outfile, "# evdev %u (0x%x), QKeyCode \"%s\", number 0x%x\n",
             evdev, evdev,
             QKeyCode_str(qcode),
             qcode_to_number(qcode));
-- 
2.19.1


