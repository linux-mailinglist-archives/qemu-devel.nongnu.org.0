Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1002F076F
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 14:29:02 +0100 (CET)
Received: from localhost ([::1]:37952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyamD-0002LR-Fz
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 08:29:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyaeS-0005PA-KA
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 08:21:04 -0500
Received: from mail-oln040092254093.outbound.protection.outlook.com
 ([40.92.254.93]:6160 helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyaeG-00047l-0N
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 08:20:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NR6V3RVLlVd0AwZ5mT4K0jQvbXFi6iyCALA9AuFOmQ2CJw1ijCziTgndNhJWGdMZTNMtdLZk22sQgbr4xTR9tzjGr0bYw8l/GoGdGCD9+SKRnalvA5kP60WpW1XE6Fzz4lCi+DqmnQWhkv5JzHrpMNhsD6sFfMISvPI+otc08zpV7FB3Nk+gVcAxRZJSqYXc6oqjDSB3y7CLken0pdQP3uHadlQ30kH1j6+Q6hk0tRqS6WxFBMbIOE8pBx9Tp6g6sfvL1wZnYpjvY1MF5TknuvHfLQGZJ8MUSFWoNGUd10tKMJMii9YniRBypX+izgAbK7xF6CtizzgDaUrv6+xw0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XptUlGrlbQq6fLKY5LrXciHjbkk4pDTTuT5hg8euBcg=;
 b=URsy0hCvc/EQdmduH6OjFbyY7aks2nWHWfNRO1Nt4DubmpLFlBXrmUZji1DmRCblrB7M05HI8TK7HPbK4paJMhMk5z00jfZer2fx3mBj40jCuAaiCSvLlopH3jq/bJZHsIXLNQdteOUjNw1Hbfw2jlqMV8ucty8ONjCH/fTSe1mscQVzNlKYiGBdTDwOzAChYQB6fb5CGGII6acVn8fhEt78f5Yb27Y5MGgfa6GTUaar4zU4hArKXbUVx5XQlqGCQwzSomKum7IChl9MsQLU057yQmEpAkJhlK78CmyE9wl/E5myIWPZ72kNzNnsFRkmJ+WNbldzYr90+WMXOJZSew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XptUlGrlbQq6fLKY5LrXciHjbkk4pDTTuT5hg8euBcg=;
 b=qg0v5Uy58CsOxHF6GkBvnYtLeCXR8zvr31GoPkWYV8EMFPPskFzUaPr/qEz6ZyHljars8zDDz3/AsZPTi6MJlrja1w9ZU9BJrjVSy5N3mYVKXhkkz2up3ggacG35e/lfMxtbVMrX+J2q/tXUFwRUtOuUKpHe0OaWzK8ryyXDoHT40cNiio3iphkACKzwx+tg+WuizbZq8QbIidLkbnHDYmuR3vT1wjETj5JQ7RfHv0z1TVu4xmHEagOBrmn11W7KtEAragj6vKV9JD8f0Ya8M2XEReN70j6Ske9FBAkKeBszvnEyweJYs/wwCYW0KfO4+QxWlI4m9+5roqhokjNPbQ==
Received: from HK2APC01FT060.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::48) by
 HK2APC01HT159.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::316)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sun, 10 Jan
 2021 13:20:35 +0000
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 (2a01:111:e400:7ebc::52) by HK2APC01FT060.mail.protection.outlook.com
 (2a01:111:e400:7ebc::416) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Sun, 10 Jan 2021 13:20:34 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:E87BD653A0F9E4EDA1E37BBC4BA51B50C8686D196E5DF582C406666B6AD5E7E5;
 UpperCasedChecksum:4A5B9426CDEDDF914891C6840ECB9BDDC92BE05152F8491B28E05060F3AB9E9F;
 SizeAsReceived:7548; Count:47
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780]) by SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780%5]) with mapi id 15.20.3742.011; Sun, 10 Jan 2021
 13:20:34 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v7 6/7] fuzz: add minimization options
Date: Sun, 10 Jan 2021 21:19:36 +0800
Message-ID: <SYCPR01MB3502E530BD3FA38C02F92082FCAC0@SYCPR01MB3502.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <SYCPR01MB3502023A4AFC1E75DC3747ACFCAC0@SYCPR01MB3502.ausprd01.prod.outlook.com>
References: <SYCPR01MB3502023A4AFC1E75DC3747ACFCAC0@SYCPR01MB3502.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [YdHCCOdvVQBdDvD7zGgkzViHvhWzefwB]
X-ClientProxiedBy: HK2PR04CA0046.apcprd04.prod.outlook.com
 (2603:1096:202:14::14) To SYCPR01MB3502.ausprd01.prod.outlook.com
 (2603:10c6:10:3e::12)
X-Microsoft-Original-Message-ID: <20210110131937.98351-6-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (111.176.239.56) by
 HK2PR04CA0046.apcprd04.prod.outlook.com (2603:1096:202:14::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Sun, 10 Jan 2021 13:20:34 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 03d621d5-3a08-4561-c64c-08d8b56a8362
X-MS-Exchange-SLBlob-MailProps: S/btQ8cKWiSygBPrM25OmO0bBkd81GAbWssNP9Loc5WrvkweIsbXvxQtSWQkHhOyiNsnA5IZhwCCd/tMmNZdtjL8bYVJP/PPSt1+rdCQoljKqAcOHWgRTjLEKGgB69l6/SiG/5k8VV/EEwljwHXv6h5D5AXdeJYY5L0pyPv6l01IgJNmlcBF9cAm/XKu3AqVoy9FvicQKBsnLS4hUmYkTDr0BHcy3W71NGaxu82t3l3GwcT2O6UuRadnCjMLUlRT+++3ftYIBm4BH5JNxjrD2/rAMrPSNjJC7DUek/OKVM0Z1L9HL1X9SB0lIsjOsi5cJ46ryzihqm1XrwGXPTSGyCtSotuH7yaeYBtVnyUh3hYmUWgnNh0JYQfv6vgzXlgGys/FXp69Zan9CQFCck0xMB7zRrprGTbNYuG2KVCjSwq5e8cFet/1m2Q6BFIzAUHF+/jGk7eZBRalF4OnaxQ2gyq6VFCPy/wYzWxHuH88bcWgX9A20VgeS28nMz3Q4G86TX83JmWnP1RmzcJVy2H8bixR5YkwggdHGND9WHN4ZHkewBw3lQiQIxooJM8xkkrQ2yB0DTxpIDWB6vY92t5FCnXuJApBQHBf8RJIKAk/YxZlkc87fjQCTN8kG7ElJ2UzQy8U7aU+48OjsBF+vNT6OyD/MxaRlPOrGqq8VEsarVFXelKczZaBaST7HYQo2Xl4mr2tyBWdI/kB+625PgfVl52aQVCWujQ9+NiXk6IUYMi+rg8744/6DcMbHb0K00M4V9+4RWTVRoI=
X-MS-TrafficTypeDiagnostic: HK2APC01HT159:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 94rEvasbaDs+xIGp7EIkK0Y3Y20i1PzIFj556Quk7c8kBeimZlJ0gsVvnCuBvzcgEX/PAFvNmyuQuWcL/cEjZmsnp8KJlcF51k1iuvi61eot1xhGqwNS5EVTDMKkzXuFRBVpnd7EIzDU8+MwlZunSmV7fow4gxhUKJr9wdrOyH/EMBY7tjNTWfr7aJ801DHHPzq5C2isAtTA2OIDjPJKv6FS8fUFg26r2rudaITbf2ISCD+2XAPJZlYvkZ9VfxeT
X-MS-Exchange-AntiSpam-MessageData: kBt5rnC+ignrlHLSDsbTvJDmY0It7Dj0vuEpnx4RxdKNUVRwZuhnOugbgax1vUFMbx/9m4Gj87ItHmqiZJyOI15OBfZViPSWzDW/venh1OGBLDcxGnz4SZoucsmuqaExUTjL9Rlw8R0f0afrGImzgw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2021 13:20:34.7595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d621d5-3a08-4561-c64c-08d8b56a8362
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT060.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT159
Received-SPF: pass client-ip=40.92.254.93; envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-PU1-obe.outbound.protection.outlook.com
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

-M1: remove IO commands iteratively
-M2: try setting bits in operand of write/out to zero

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 30 ++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index f86bbcf6b3..d2e3f67b66 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -16,6 +16,10 @@ QEMU_PATH = None
 TIMEOUT = 5
 CRASH_TOKEN = None
 
+# Minimization levels
+M1 = False # try removing IO commands iteratively
+M2 = False # try setting bits in operand of write/out to zero
+
 write_suffix_lookup = {"b": (1, "B"),
                        "w": (2, "H"),
                        "l": (4, "L"),
@@ -23,10 +27,20 @@ write_suffix_lookup = {"b": (1, "B"),
 
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
+
 """.format((sys.argv[0])))
 
 deduplication_note = """\n\
@@ -217,24 +231,32 @@ def minimize_trace(inpath, outpath):
     print("Setting the timeout for {} seconds".format(TIMEOUT))
 
     newtrace = trace[:]
+    global M1, M2
 
     # remove lines
     old_len = len(newtrace) + 1
     while(old_len > len(newtrace)):
         old_len = len(newtrace)
+        print("trace lenth = ", old_len)
         remove_lines(newtrace, outpath)
+        if not M1 and not M2:
+            break
         newtrace = list(filter(lambda s: s != "", newtrace))
     assert(check_if_trace_crashes(newtrace, outpath))
 
     # set bits to zero
-    clear_bits(newtrace, outpath)
+    if M2:
+        clear_bits(newtrace, outpath)
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
@@ -243,4 +265,4 @@ if __name__ == '__main__':
     #     QEMU_ARGS += " -accel qtest"
     CRASH_TOKEN = os.getenv("CRASH_TOKEN")
     QEMU_ARGS += " -qtest stdio -monitor none -serial none "
-    minimize_trace(sys.argv[1], sys.argv[2])
+    minimize_trace(sys.argv[-2], sys.argv[-1])
-- 
2.25.1


