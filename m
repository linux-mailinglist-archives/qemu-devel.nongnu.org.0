Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 788372BB145
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 18:20:49 +0100 (CET)
Received: from localhost ([::1]:51046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgA5Y-0006tH-BE
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 12:20:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kgA3Y-00055j-5L
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:18:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kgA3V-0008WO-Vh
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:18:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605892721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=H+QYaTTn/mzCaXS2HP9xl/ll8iVlHx9uDxQJUsPo9QU=;
 b=dV9CYq9aLpLOBqUGG0vdsyMEPrZWVfoLJ5m+4OvrlaXdlGs8YKu+WaI9vvc3kVyAw2/PEP
 N1IqE/o1ju7qkIRm7CNx6T3+YO30sIHeOZ7Sa94drcYUmMACaCQmyEMW87M7lrZzklKfjx
 quB+AW7PUbmDXw1qVeRzqQfuEAhpD7M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-LyN6pSncNf6oy9YBs2RkNg-1; Fri, 20 Nov 2020 12:18:39 -0500
X-MC-Unique: LyN6pSncNf6oy9YBs2RkNg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4C81911E8;
 Fri, 20 Nov 2020 17:18:37 +0000 (UTC)
Received: from thuth.com (ovpn-112-135.ams2.redhat.com [10.36.112.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F84A5D6CF;
 Fri, 20 Nov 2020 17:18:36 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 3/4] tests/qtest: fix memleak in npcm7xx_watchdog_timer-test
Date: Fri, 20 Nov 2020 18:18:27 +0100
Message-Id: <20201120171828.488611-4-thuth@redhat.com>
In-Reply-To: <20201120171828.488611-1-thuth@redhat.com>
References: <20201120171828.488611-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chen Qun <kuhn.chenqun@huawei.com>

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
Message-Id: <20201118115646.2461726-3-kuhn.chenqun@huawei.com>
Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
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
2.18.4


