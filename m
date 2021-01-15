Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B372F73E9
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 09:00:45 +0100 (CET)
Received: from localhost ([::1]:46260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0K2G-0004f4-DY
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 03:00:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1l0K11-0003gq-2I; Fri, 15 Jan 2021 02:59:27 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1l0K0y-0007wZ-A5; Fri, 15 Jan 2021 02:59:26 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DHD7H1Btyzl4xy;
 Fri, 15 Jan 2021 15:57:47 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.498.0; Fri, 15 Jan 2021
 15:59:00 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH] qtest/npcm7xx_pwm-test: Fix memleak in pwm_qom_get
Date: Fri, 15 Jan 2021 15:56:34 +0800
Message-ID: <20210115075634.717909-1-ganqixin@huawei.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=ganqixin@huawei.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 zhang.zhanghailiang@huawei.com, Havard
 Skinnemoen <hskinnemoen@google.com>, Tyrone Ting <kfting@nuvoton.com>,
 Gan Qixin <ganqixin@huawei.com>, Euler Robot <euler.robot@huawei.com>,
 kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The pwm_qom_get function didn't free "response", which caused an indirect
memory leak. So use qobject_unref() to fix it.

ASAN shows memory leak stack:

Indirect leak of 74160000 byte(s) in 18000 object(s) allocated from:
    #0 0x7f96e2f79d4e in __interceptor_calloc (/lib64/libasan.so.5+0x112d4e)
    #1 0x7f96e2d98a50 in g_malloc0 (/lib64/libglib-2.0.so.0+0x55a50)
    #2 0x556313112180 in qdict_new ../qobject/qdict.c:30
    #3 0x556313115bca in parse_object ../qobject/json-parser.c:318
    #4 0x556313117810 in parse_value ../qobject/json-parser.c:546
    #5 0x556313117bda in json_parser_parse ../qobject/json-parser.c:580
    #6 0x55631310fe67 in json_message_process_token ../qobject/json-streamer.c:92
    #7 0x5563131210b7 in json_lexer_feed_char ../qobject/json-lexer.c:313
    #8 0x556313121662 in json_lexer_feed ../qobject/json-lexer.c:350
    #9 0x5563131101e9 in json_message_parser_feed ../qobject/json-streamer.c:121
    #10 0x5563130cb81e in qmp_fd_receive ../tests/qtest/libqtest.c:614
    #11 0x5563130cba2b in qtest_qmp_receive_dict ../tests/qtest/libqtest.c:636
    #12 0x5563130cb939 in qtest_qmp_receive ../tests/qtest/libqtest.c:624
    #13 0x5563130cbe0d in qtest_vqmp ../tests/qtest/libqtest.c:715
    #14 0x5563130cc40f in qtest_qmp ../tests/qtest/libqtest.c:756
    #15 0x5563130c5623 in pwm_qom_get ../tests/qtest/npcm7xx_pwm-test.c:180
    #16 0x5563130c595e in pwm_get_duty ../tests/qtest/npcm7xx_pwm-test.c:210
    #17 0x5563130c7529 in test_toggle ../tests/qtest/npcm7xx_pwm-test.c:447

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
Cc: Havard Skinnemoen <hskinnemoen@google.com>
Cc: Tyrone Ting <kfting@nuvoton.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>
---
 tests/qtest/npcm7xx_pwm-test.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/npcm7xx_pwm-test.c b/tests/qtest/npcm7xx_pwm-test.c
index 33fbdf5f54..63557d2c06 100644
--- a/tests/qtest/npcm7xx_pwm-test.c
+++ b/tests/qtest/npcm7xx_pwm-test.c
@@ -175,6 +175,7 @@ static int pwm_index(const PWM *pwm)
 static uint64_t pwm_qom_get(QTestState *qts, const char *path, const char *name)
 {
     QDict *response;
+    uint64_t val;
 
     g_test_message("Getting properties %s from %s", name, path);
     response = qtest_qmp(qts, "{ 'execute': 'qom-get',"
@@ -182,7 +183,9 @@ static uint64_t pwm_qom_get(QTestState *qts, const char *path, const char *name)
             path, name);
     /* The qom set message returns successfully. */
     g_assert_true(qdict_haskey(response, "return"));
-    return qnum_get_uint(qobject_to(QNum, qdict_get(response, "return")));
+    val = qnum_get_uint(qobject_to(QNum, qdict_get(response, "return")));
+    qobject_unref(response);
+    return val;
 }
 
 static uint64_t pwm_get_freq(QTestState *qts, int module_index, int pwm_index)
-- 
2.27.0


