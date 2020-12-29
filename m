Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B544D2E6D2E
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 03:13:01 +0100 (CET)
Received: from localhost ([::1]:38094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ku4VQ-00007N-QY
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 21:13:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku4Sv-00076X-RW
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 21:10:26 -0500
Received: from mail-oln040092255082.outbound.protection.outlook.com
 ([40.92.255.82]:24113 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku4Sr-0005HS-Lc
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 21:10:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GjATAh7JdAHfl4mENn5X1WTKQYDoD/ty3yQgcWxfyst8o8O0ZZd9mFzrDS+rY1GTOEcJwEw9byyAUHDUFA4Qt1R0b162TjMCiqYHTsWCofkE2QfAi6m+YLRNyom/5LgfnL/+DdDJwUIwx0mPtWh+S3/DmrNM4hdkCZPYic2WD9cxDeWAl4KZkC0ua+9NuKdEQPf7L5xCqOOCz4na5c6jU4rE1yOvAOrxMF14J6cRgmMt8hxDrJiezga2khwc6Tsejb4AZa52mdcFnVHsTb79yfLeUH+fq9lfyHhe5O5vR3/3Li9ErP+OIy4MB+whYVumcqsICviIFQ5FdJECJGiIvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4yVYwqybd12lt/z757uyfTIWHqX/qx0WjSeHWKAaaU=;
 b=nqjrEuEij//+JBM60qkOHNEOM/ovjgu3F0ZRKRhcyh2iL+xw7rL20GJG6MvGADJfTSSdQrfMGgQbTwR9XYGHz8SDSTVAiHKyvhWBEaNMV9KoHUVa337krvSYFAb215gjWcTM+somi/fHc8x9MX0JO9tYfgXgHuuUvZ+QwDpsHvk/I/W5A/hvvvVqZgbGx3BaZDLMCJCZhXED7MY6wzkhbWllj9vnXJtEEykw3kRisfgKX1yZ6Bb6JtYP9ipJ0D6UXR5VYq7MExmhfU0oioVaWS56MweiHNqBKzGzpzdlQ9+x2u57zptIfsNZmhdIadGoIqdrsawQEwQ0k0DFjNF7bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4yVYwqybd12lt/z757uyfTIWHqX/qx0WjSeHWKAaaU=;
 b=QqKzTXyX6ZLWFM+vhfunUPgN12UelJtHP80NcuOI2ysYxj3jb7eqCj3IyzHAsFbiIH9ATgFJo3RCb9UWJZ3lpIM7uvAWCDGXjUdQZM13xMC9ROcRNwmgh6kdz/s7ytNpFCuvpij8BxjTyiF/3Mm+IxhO8llIU7glxw3jfcvF2DLS3vf7IUhFdV+xlkqaBE33Il9/9yHOWdIlI2TjlfIDknp08Wt/qDj899PvY1TitLVl1enBrMQfGyx8Vs/8ZuSV250w9XFZO/wdE5X8oFwGIxkj7wFUFWmsFstWyr3osszcKXTl6BquwdCjMaXK8W5QfY0puVulIWVO9QGZub67Ug==
Received: from SG2APC01FT031.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::4c) by
 SG2APC01HT068.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::422)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 02:10:10 +0000
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM (10.152.250.54) by
 SG2APC01FT031.mail.protection.outlook.com (10.152.250.217) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 02:10:10 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:CACF91204535E96135E8009221D8080698D5E126B2A72D86B7DBC0246B1C8CF3;
 UpperCasedChecksum:AF6DA852D7A63220276B82BDB8F767BBB49E9514A690113C852D01B1C8893A2A;
 SizeAsReceived:7662; Count:47
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e]) by ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e%8]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 02:10:10 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v3 5/7] fuzz: add minimization options
Date: Tue, 29 Dec 2020 10:07:11 +0800
Message-ID: <ME3P282MB1745359618A60FDDAE685227FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ME3P282MB17451412C0E506C9D5108B35FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB17451412C0E506C9D5108B35FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [k2g6idY9AoR9p2N0f1W0eH39arfTBB9S4bYY2QqqlkpVVqsyfWkao5qwxeoo7WFD]
X-ClientProxiedBy: TYAPR01CA0145.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::13) To ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:ac::12)
X-Microsoft-Original-Message-ID: <20201229020713.3699486-5-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc (2001:250:fe01:130:6d26:2348:77a5:f7ed) by
 TYAPR01CA0145.jpnprd01.prod.outlook.com (2603:1096:404:7e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 02:10:09 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 8246334b-c514-4f83-09b8-08d8ab9edea9
X-MS-Exchange-SLBlob-MailProps: gjx25WM8ZNXNvqD3/CHhguXtu0t+EKJeMAlDB4EGdHVgL7Lzp1iQITZj6wok5OyAJbw+4nFivRgpceMzafrTbolyAXqpneTGnrXm2+foxW4RE92M6gisMoGBrDc9H7L/SieLXdzm+okHLDJ5lX+IDVrU9hwTslQ2uZF3Z91jIt0a/elbOEz6drthKFz/GGNNQ4NvVZ3NbhndCs3uTETc1Hh/jQL2FLy0Ausd0M0GGml8ZCrRj+UsoVYdBBUIC9UMFtOVTTdu8K4aEjh0v6LdugPxE/wAvlZ7zDaICR2nqXjo8T0lgt0b6KJPHtB/kbrPZhnpI186jFdo7JLEfXFcWdJ/a8orNk/oZHb/N8GiD0/DkfCwYAY5SioVGLMrC5AhK1YC7gjprArpSad7cRzI6aFl9E3HCm/nYGRW6ZdF22+F5Dmtcgbjt14hsDk+O6ZtoDq+SsgdakuQ/7sCl6SlBew1UibCSqoQoEpV8AXNKPFemQSAzeH5Oa6LLpYARJYjaV3qlR0mZdqmOOqqrtGrQGyKq4Nqlzkvj4tIXJgBbdEax9mRaJhX/8M8ChXLMwurq6z8zA1AMjlNMX7DuqeoB8URDEebGOCU3oaSDfICXWcuD3qtu8Ma893F1/K9YCJJ9evBtuPrPZ4eIMIuXjYRKQMyOhe1jATnpdQImx2gVzFH1tX0fM4b2a5l5cVEyJtC7LEAfdPbQzINDvnSnrL8fpBUZuTAkiuEgi+N4hday4w=
X-MS-TrafficTypeDiagnostic: SG2APC01HT068:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bH4XKkPzUnWNmhsDMb1EV+4ApbjpHWvNYSpMt2mMTjINu0SCD9d2DbSZUBs+waCpDjcj0DbKeeLM+HnHmk4mYDyz60sw016VKPvpuez6rAL5NGVm7BymsxGwlylEESKeCTvta97iKydgPzoAsMzZb+61dDvTVjphygWQuNaiCaVjeuH2/WAYAHf3JzR8Z+BTnXAI8nZ8AXf7Je9n16V642CRPIYnlrnRIx9RGBeI0qh/crdRKMX6DNLxXbER8xie
X-MS-Exchange-AntiSpam-MessageData: HO1qPIHnh9LeOGr5+EKfea72Mw0FnqT9WNUuqexz9LQoeY2VW9HqPq/qdbH76lrQcB32rdM1EM/DDJjD6pqbPuH/moD2Em1Tfxn6jeswqPRsgaNU9t7PG7P7ZlimQ5O4MmllKBMkmb8XTMSjgBYkdtiSBluYSjTzj/k2UP0VVKx3nymwLS0xB7GSdTEaHhBYhkuNB7BHxjBfWCW2Ejn2Pw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 02:10:10.0572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 8246334b-c514-4f83-09b8-08d8ab9edea9
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT031.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT068
Received-SPF: pass client-ip=40.92.255.82; envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-HK2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: thuth@redhat.com, Qiuhao Li <Qiuhao.Li@outlook.com>,
 darren.kenny@oracle.com, bsd@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

-M1: loop around the remove minimizer
-M2: try setting bits in operand of write/out to zero

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 30 ++++++++++++++++++++----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 70ac0c5366..4273ee7505 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -16,6 +16,10 @@ QEMU_PATH = None
 TIMEOUT = 5
 CRASH_TOKEN = None
 
+# Minimization levels
+M1 = False # loop around the remove minimizer
+M2 = False # try setting bits in operand of write/out to zero
+
 write_suffix_lookup = {"b": (1, "B"),
                        "w": (2, "H"),
                        "l": (4, "L"),
@@ -23,10 +27,19 @@ write_suffix_lookup = {"b": (1, "B"),
 
 def usage():
     sys.exit("""\
-Usage: QEMU_PATH="/path/to/qemu" QEMU_ARGS="args" {} input_trace output_trace
+Usage:
+
+QEMU_PATH="/path/to/qemu" QEMU_ARGS="args" {} [Options] input_trace output_trace
+
 By default, will try to use the second-to-last line in the output to identify
 whether the crash occred. Optionally, manually set a string that idenitifes the
 crash by setting CRASH_TOKEN=
+
+Options:
+
+-M1: enable a loop around the remove minimizer, which may help decrease some
+     timing dependant instructions. Off by default.
+-M2: try setting bits in operand of write/out to zero. Off by default.
 """.format((sys.argv[0])))
 
 deduplication_note = """\n\
@@ -213,24 +226,31 @@ def minimize_trace(inpath, outpath):
     print("Setting the timeout for {} seconds".format(TIMEOUT))
 
     newtrace = trace[:]
-
+    global M1, M2
     # remove minimizer
     old_len = len(newtrace) + 1
     while(old_len > len(newtrace)):
         old_len = len(newtrace)
+        print("trace lenth = ", old_len)
         remove_minimizer(newtrace, outpath)
+        if not M1 and not M2:
+            break
         newtrace = list(filter(lambda s: s != "", newtrace))
     assert(check_if_trace_crashes(newtrace, outpath))
 
     # set zero minimizer
-    set_zero_minimizer(newtrace, outpath)
+    if M2:
+        set_zero_minimizer(newtrace, outpath)
     assert(check_if_trace_crashes(newtrace, outpath))
 
 
 if __name__ == '__main__':
     if len(sys.argv) < 3:
         usage()
-
+    if "-M1" in sys.argv:
+        M1 = True
+    if "-M2" in sys.argv:
+        M2 = True
     QEMU_PATH = os.getenv("QEMU_PATH")
     QEMU_ARGS = os.getenv("QEMU_ARGS")
     if QEMU_PATH is None or QEMU_ARGS is None:
@@ -239,4 +259,4 @@ if __name__ == '__main__':
     #     QEMU_ARGS += " -accel qtest"
     CRASH_TOKEN = os.getenv("CRASH_TOKEN")
     QEMU_ARGS += " -qtest stdio -monitor none -serial none "
-    minimize_trace(sys.argv[1], sys.argv[2])
+    minimize_trace(sys.argv[-2], sys.argv[-1])
-- 
2.25.1


