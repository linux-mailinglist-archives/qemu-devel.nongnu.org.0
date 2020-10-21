Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D40294C98
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 14:29:21 +0200 (CEST)
Received: from localhost ([::1]:38514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVDF2-0003a6-Hc
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 08:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kVDDT-0002s6-CD; Wed, 21 Oct 2020 08:27:43 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:41246 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kVDDO-0004XW-LZ; Wed, 21 Oct 2020 08:27:42 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 53D9A91BD3BA74942A1D;
 Wed, 21 Oct 2020 20:27:25 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Wed, 21 Oct 2020
 20:27:19 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH] tests/migration: fix memleak in wait_command/wait_command_fd
Date: Wed, 21 Oct 2020 20:27:11 +0800
Message-ID: <20201021122711.2035765-1-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=kuhn.chenqun@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/21 08:27:26
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, zhang.zhanghailiang@huawei.com,
 Euler Robot <euler.robot@huawei.com>, mlevitsk@redhat.com, ganqixin@huawei.com,
 Chen Qun <kuhn.chenqun@huawei.com>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Properly free each command resp to avoid memory leak.
ASAN shows memory leak stack:

Indirect leak of 2352520 byte(s) in 571 object(s) allocated from:
    #0 0x7f6ca3308d4e in __interceptor_calloc (/lib64/libasan.so.5+0x112d4e)
    #1 0x7f6ca3127a50 in g_malloc0 (/lib64/libglib-2.0.so.0+0x55a50)
    #2 0x557bf3c71d2b in qdict_new ../qobject/qdict.c:29
    #3 0x557bf3c9caba in parse_object ../qobject/json-parser.c:318
    #4 0x557bf3c9ce75 in json_parser_parse ../qobject/json-parser.c:580
    #5 0x557bf3c8c8cf in json_message_process_token ../qobject/json-streamer.c:92
    #6 0x557bf3c9ea59 in json_lexer_feed_char ../qobject/json-lexer.c:313
    #7 0x557bf3c9eeb5 in json_lexer_feed ../qobject/json-lexer.c:350
    #8 0x557bf3c4793a in qmp_fd_receive ../tests/qtest/libqtest.c:608
    #9 0x557bf3c47b58 in qtest_qmp_receive ../tests/qtest/libqtest.c:618
    #10 0x557bf3c44245 in wait_command ../tests/qtest/migration-helpers.c:59
    #11 0x557bf3c445cb in migrate_query_status ../tests/qtest/migration-helpers.c:108
    #12 0x557bf3c44642 in check_migration_status ../tests/qtest/migration-helpers.c:124
    #13 0x557bf3c447e7 in wait_for_migration_status ../tests/qtest/migration-helpers.c:148
    #14 0x557bf3c43b8f in test_migrate_auto_converge ../tests/qtest/migration-test.c:1243
    ......
SUMMARY: AddressSanitizer: 11670244 byte(s) leaked in 8422 allocation(s).

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
 tests/qtest/migration-helpers.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/migration-helpers.c b/tests/qtest/migration-helpers.c
index b799dbafb7..202064e4fc 100644
--- a/tests/qtest/migration-helpers.c
+++ b/tests/qtest/migration-helpers.c
@@ -32,7 +32,7 @@ static void check_stop_event(QTestState *who)
 QDict *wait_command_fd(QTestState *who, int fd, const char *command, ...)
 {
     va_list ap;
-    QDict *resp;
+    QDict *resp, *val;
 
     va_start(ap, command);
     qtest_qmp_vsend_fds(who, &fd, 1, command, ap);
@@ -44,7 +44,11 @@ QDict *wait_command_fd(QTestState *who, int fd, const char *command, ...)
     g_assert(!qdict_haskey(resp, "error"));
     g_assert(qdict_haskey(resp, "return"));
 
-    return qdict_get_qdict(resp, "return");
+    val =  qdict_get_qdict(resp, "return");
+    qobject_ref(val);
+    qobject_unref(resp);
+
+    return val;
 }
 
 /*
@@ -53,7 +57,7 @@ QDict *wait_command_fd(QTestState *who, int fd, const char *command, ...)
 QDict *wait_command(QTestState *who, const char *command, ...)
 {
     va_list ap;
-    QDict *resp;
+    QDict *resp, *val;
 
     va_start(ap, command);
     resp = qtest_vqmp(who, command, ap);
@@ -64,7 +68,11 @@ QDict *wait_command(QTestState *who, const char *command, ...)
     g_assert(!qdict_haskey(resp, "error"));
     g_assert(qdict_haskey(resp, "return"));
 
-    return qdict_get_qdict(resp, "return");
+    val = qdict_get_qdict(resp, "return");
+    qobject_ref(val);
+    qobject_unref(resp);
+
+    return val;
 }
 
 /*
-- 
2.27.0


