Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8A82F9A4B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 08:01:17 +0100 (CET)
Received: from localhost ([::1]:36850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1OXN-00082W-0C
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 02:01:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1l1OVc-00076l-0a; Mon, 18 Jan 2021 01:59:28 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1l1OVZ-00071M-7h; Mon, 18 Jan 2021 01:59:27 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DK2g04QfPzj8nX;
 Mon, 18 Jan 2021 14:58:04 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Mon, 18 Jan 2021
 14:59:02 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH] npcm7xx_adc-test: Fix memleak in adc_qom_set
Date: Mon, 18 Jan 2021 14:56:27 +0800
Message-ID: <20210118065627.79903-1-ganqixin@huawei.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=ganqixin@huawei.com;
 helo=szxga05-in.huawei.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 zhang.zhanghailiang@huawei.com, Havard Skinnemoen <hskinnemoen@google.com>,
 Hao Wu <wuhaotsh@google.com>, Tyrone
 Ting <kfting@nuvoton.com>, Gan Qixin <ganqixin@huawei.com>,
 Euler Robot <euler.robot@huawei.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The adc_qom_set function didn't free "response", which caused an indirect
memory leak. So use qobject_unref() to fix it.

ASAN shows memory leak stack:

Indirect leak of 593280 byte(s) in 144 object(s) allocated from:
    #0 0x7f9a5e7e8d4e in __interceptor_calloc (/lib64/libasan.so.5+0x112d4e)
    #1 0x7f9a5e607a50 in g_malloc0 (/lib64/libglib-2.0.so.0+0x55a50)
    #2 0x55b1bebf636b in qdict_new ../qobject/qdict.c:30
    #3 0x55b1bec09699 in parse_object ../qobject/json-parser.c:318
    #4 0x55b1bec0b2df in parse_value ../qobject/json-parser.c:546
    #5 0x55b1bec0b6a9 in json_parser_parse ../qobject/json-parser.c:580
    #6 0x55b1bec060d1 in json_message_process_token ../qobject/json-streamer.c:92
    #7 0x55b1bec16a12 in json_lexer_feed_char ../qobject/json-lexer.c:313
    #8 0x55b1bec16fbd in json_lexer_feed ../qobject/json-lexer.c:350
    #9 0x55b1bec06453 in json_message_parser_feed ../qobject/json-streamer.c:121
    #10 0x55b1bebc2d51 in qmp_fd_receive ../tests/qtest/libqtest.c:614
    #11 0x55b1bebc2f5e in qtest_qmp_receive_dict ../tests/qtest/libqtest.c:636
    #12 0x55b1bebc2e6c in qtest_qmp_receive ../tests/qtest/libqtest.c:624
    #13 0x55b1bebc3340 in qtest_vqmp ../tests/qtest/libqtest.c:715
    #14 0x55b1bebc3942 in qtest_qmp ../tests/qtest/libqtest.c:756
    #15 0x55b1bebbd64a in adc_qom_set ../tests/qtest/npcm7xx_adc-test.c:127
    #16 0x55b1bebbd793 in adc_write_input ../tests/qtest/npcm7xx_adc-test.c:140
    #17 0x55b1bebbdf92 in test_convert_external ../tests/qtest/npcm7xx_adc-test.c:246

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
Cc: Hao Wu <wuhaotsh@google.com>
Cc: Havard Skinnemoen <hskinnemoen@google.com>
Cc: Tyrone Ting <kfting@nuvoton.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>
---
 tests/qtest/npcm7xx_adc-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/npcm7xx_adc-test.c b/tests/qtest/npcm7xx_adc-test.c
index f029706945..5ce8ce13b3 100644
--- a/tests/qtest/npcm7xx_adc-test.c
+++ b/tests/qtest/npcm7xx_adc-test.c
@@ -129,6 +129,7 @@ static void adc_qom_set(QTestState *qts, const ADC *adc,
             path, name, value);
     /* The qom set message returns successfully. */
     g_assert_true(qdict_haskey(response, "return"));
+    qobject_unref(response);
 }
 
 static void adc_write_input(QTestState *qts, const ADC *adc,
-- 
2.27.0


