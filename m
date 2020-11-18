Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 899762B7D26
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 12:59:46 +0100 (CET)
Received: from localhost ([::1]:40416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfM7l-0002lv-KB
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 06:59:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kfM5n-00019Z-Sr; Wed, 18 Nov 2020 06:57:43 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kfM5l-00084Z-EI; Wed, 18 Nov 2020 06:57:43 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CbhBB6v2TzkZhZ;
 Wed, 18 Nov 2020 19:57:06 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Wed, 18 Nov 2020
 19:57:15 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH-for-5.2? 2/2] tests/qtest: fix memleak in
 npcm7xx_watchdog_timer-test
Date: Wed, 18 Nov 2020 19:56:46 +0800
Message-ID: <20201118115646.2461726-3-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201118115646.2461726-1-kuhn.chenqun@huawei.com>
References: <20201118115646.2461726-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 06:57:26
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
Cc: lvivier@redhat.com, peter.maydell@linaro.org, thuth@redhat.com,
 zhang.zhanghailiang@huawei.com, hskinnemoen@google.com, wuhaotsh@google.com,
 Euler Robot <euler.robot@huawei.com>, Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Properly free resp for get_watchdog_action() to avoid memory leak.
ASAN shows memory leak stack:

Indirect leak of 12360 byte(s) in 3 object(s) allocated from:
    #0 0x7f41ab6cbd4e in __interceptor_calloc (/lib64/libasan.so.5+0x112d4e)
    #1 0x7f41ab4eaa50 in g_malloc0 (/lib64/libglib-2.0.so.0+0x55a50)
    #2 0x556487d5374b in qdict_new ../qobject/qdict.c:29
    #3 0x556487d65e1a in parse_object ../qobject/json-parser.c:318
    #4 0x556487d65cb6 in parse_pair ../qobject/json-parser.c:287
    #5 0x556487d65ebd in parse_object ../qobject/json-parser.c:343
    #6 0x556487d661d5 in json_parser_parse ../qobject/json-parser.c:580
    #7 0x556487d513df in json_message_process_token ../qobject/json-streamer.c:92
    #8 0x556487d63919 in json_lexer_feed_char ../qobject/json-lexer.c:313
    #9 0x556487d63d75 in json_lexer_feed ../qobject/json-lexer.c:350
    #10 0x556487d28b2a in qmp_fd_receive ../tests/qtest/libqtest.c:613
    #11 0x556487d2a16f in qtest_qmp_eventwait_ref ../tests/qtest/libqtest.c:827
    #12 0x556487d248e2 in get_watchdog_action ../tests/qtest/npcm7xx_watchdog_timer-test.c:94
    #13 0x556487d25765 in test_enabling_flags ../tests/qtest/npcm7xx_watchdog_timer-test.c:243

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
 tests/qtest/npcm7xx_watchdog_timer-test.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/npcm7xx_watchdog_timer-test.c b/tests/qtest/npcm7xx_watchdog_timer-test.c
index 54d5d6d8f2..3aae5a0438 100644
--- a/tests/qtest/npcm7xx_watchdog_timer-test.c
+++ b/tests/qtest/npcm7xx_watchdog_timer-test.c
@@ -204,6 +204,7 @@ static void test_enabling_flags(gconstpointer watchdog)
 {
     const Watchdog *wd = watchdog;
     QTestState *qts;
+    QDict *rsp;
 
     /* Neither WTIE or WTRE is set, no interrupt or reset should happen */
     qts = qtest_init("-machine quanta-gsj");
@@ -240,8 +241,9 @@ static void test_enabling_flags(gconstpointer watchdog)
     g_assert_false(qtest_get_irq(qts, wd->irq));
     qtest_clock_step(qts, watchdog_calculate_steps(RESET_CYCLES,
                 watchdog_prescaler(qts, wd)));
-    g_assert_false(strcmp(qdict_get_str(get_watchdog_action(qts), "action"),
-                "reset"));
+    rsp = get_watchdog_action(qts);
+    g_assert_false(strcmp(qdict_get_str(rsp, "action"), "reset"));
+    qobject_unref(rsp);
     qtest_qmp_eventwait(qts, "RESET");
     qtest_quit(qts);
 
-- 
2.23.0


