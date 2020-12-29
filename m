Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1616C2E6DD2
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 05:48:16 +0100 (CET)
Received: from localhost ([::1]:44606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ku6vf-0003Lw-5P
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 23:48:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku6pP-0005Aa-Qy
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 23:41:47 -0500
Received: from mail-oln040092254070.outbound.protection.outlook.com
 ([40.92.254.70]:5440 helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku6pO-0004fk-1L
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 23:41:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UwyzLKVbQH6k+YZRTj9WUR61R11yz719TnJBvvuEKxZXtSz7R6JSpIOv3/Mj/+96ypyFfZHclF8hfrB5cD8oBKxH6qZgh9LDfY9xu06zJq+sd2MpZaushFpWdYspiQjuEB9D09wNH8TyzyRtZ0I0vfWOdY1vCeSQXSG3ASf0gg8IRrthGP8sfPIJKzr3h40TwtZNqsFiOwQR6Dakf0vOqCc5p3ZYE3peCTCMuY7iErYIcx/FqbuwZLvzljI8mMPbtcxxZA0fuK+979/bmRNX7ary/iP7fNDCqN7o9fzoP+E06l+BwJcjjvLS49YQ464zP7rF/clkovYd8XxWjM/FKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxTOO5W1fz4ZgM+M8sX7I4Vv0Pmt8JHxRpdNsForf2o=;
 b=BwWxh/RIVFoEqKr+l0MyvaV/g1bsZCTW4wJalNsfMF2zpbZPI6MlrgvGGw4UzD4NmXcVyl9CXoWDPfVxz5IcOMM7XGb1pVkkC1UujScNBCjdlCIJrOMsPg3/mH4N2T0IC/0Bokfz05v396uFgkYlMbrkFFGflf/JAgrCgy8/AfS/NvOW681V57GCY7+nfaSTrOhN2Cp0uPFf0Kgg/qUJOtrSxhjB7i0oL11VKWYAOgxzT2L/y8ye8RKF7gbrZ5403JVEjjMHD6i/I6N0hXmzv7Pbbi7d4Pi1lfMiX4aN8soGXrEw7o8I7u5zTGNyysYMAQyT/dtVcK7aIhJy3jZZkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxTOO5W1fz4ZgM+M8sX7I4Vv0Pmt8JHxRpdNsForf2o=;
 b=o4uhBVOi/3jdcnzrXwRYXtLCwHl9/buPu1J8qVS+ayX4V8fibr1GgcX/J6Snr2j00kCKTtdn7bGy/IGIN/uyXcr+duNU4WkWpLDGdlHjusmGX8gNH1ZyEN84yS1A2/lkDCLs0Aix9DBfwmiho3lDiwmqA8+FKhGy5RQ3pythN2Z4I48vP4Uht1SA5OWYvUfPX8GA/S9JD2BCmhzuxdJOgD0o4lLMUWVebUilinbPlPlBN/ks43N0y0eriip5BuKcbqfCMWPvvdWPUlUUbAln5IoG5aYmjRz9d2Q0KzTcFnm9gDEoqJ+O1vMnDkqPWCbMNn0s/1Qxz5ISXpfu5Yj07A==
Received: from SG2APC01FT025.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::4e) by
 SG2APC01HT222.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::432)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 04:41:33 +0000
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM (2a01:111:e400:7ebd::44)
 by SG2APC01FT025.mail.protection.outlook.com
 (2a01:111:e400:7ebd::187) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Tue, 29 Dec 2020 04:41:33 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:2E38E0D612DAE27D869FACB455ADB821069B540FF8CBA68999FA92234AFAD1FE;
 UpperCasedChecksum:2AF128A5B12D8E8E5C56C1D4108CA6A4FFC1FE784040E80C54CE99F2BAF62636;
 SizeAsReceived:7634; Count:47
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e]) by ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e%8]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 04:41:33 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v4 6/7] fuzz: add minimization options
Date: Tue, 29 Dec 2020 12:40:43 +0800
Message-ID: <ME3P282MB1745F90579724DF1BCC3F18FFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ME3P282MB17456B93AE422008F433C50DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB17456B93AE422008F433C50DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [SwRVs+iBt2QY6IKTcH0L7ryAt5O7vRRc3yab6raQOZ2iuHvTot74ABrdxVChDqr4]
X-ClientProxiedBy: TYAPR01CA0063.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::27) To ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:ac::12)
X-Microsoft-Original-Message-ID: <20201229044044.3706227-6-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc (2001:250:fe01:130:6d26:2348:77a5:f7ed) by
 TYAPR01CA0063.jpnprd01.prod.outlook.com (2603:1096:404:2b::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 04:41:32 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 90dae100-6835-4d50-8d32-08d8abb404c2
X-MS-Exchange-SLBlob-MailProps: q+fD6XS3/UL0qSVcdtWiVVAkKoUvAbiis6b0itYI0jAVIvDJzTNll7JXAYGjrTskBo+22MjdKnPgmTfCi/am3XE3gqWXGAHfNOdQvs6iqGcp28uvGecIn5CKcmPLPEEjEQYRz6MlxaQGsVeAVHCXBXXabLW8unlT2hogjiqNJJq1+ZaSp9BBlm1LONv0T/hvKw7q5NHYCmqFJOja5pMo4i4LUZ1BuCUG118KES5XHOgg0Ge2yfMI2XRP7a0c+VSIaz47r+bFH/nn4utvNzrfbRwW8aGRbie8vsnlFI8E0fc0xzxUSHDuPH7R2Qbz6vKzug3UV0Q3roEtJEVSJf6zqT+INn3MdMwzPlxg3pziX4ZGNvHc1HP7omKTF8hj+jb3e44enKEMSZsvgwCHvkz1gN85L0+3hJxv6FRySbZPw32O0whnzRpIqo6niQiS21fClu6IgueM6N+NbS2I/RpYITbhzUt7HJ/0CEk2UqpQWHhrfHg16i5i80xotefJRy5F/g8zGGGAUMeZlIg6FRLv3OgpNz3uClG0KnyBp+7IiKBVAS/36ancqh2nTF4bDkXcHJrp79xIvWHbLByy7EXZxiROkY1YCDqBFZvWQOB7jlffS9h9+8fBSfhLJDfVmlwCznNweEFJQ3+Zz5NfuGFiKZgrWLmryqNQD/mus4LYLp0yytD1Y2bqQAuptedhAFo89KxmbPMuw79PE8m+YeC42A==
X-MS-TrafficTypeDiagnostic: SG2APC01HT222:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FW+iyqX8Z4Cv35965WpYP5ooL1Mb/MHvq8VK+SZRB/4w6Os5G6maReAQPcIwV7wTy2SdassTbgh1ewK7gCJ8eevoGUR5nIgu5oxElif6dfZP2ADYeZfK75S3BgeOSsPNbWnxa52BFiophUcadcbfA343MPSKlAy9g2K/QytvN9f+jW/r3ERq06iuUf1nouVHsfz9in+aeKqXLCvdJxPBNc+hM1seiTATlHC8SWyiW4kLvE67AvXOcdAYdIbkqHmV
X-MS-Exchange-AntiSpam-MessageData: U3kqlMxsud7+7cWryXGNqHuLslKBSfh/zuw1C3W9lOXtsAXX6Bvr+PpQfJej7CT7DcWFYV61i6LfAFPlGGb1DOkjGZF9SS0+DVoZFgQNRIJU9q5IoLSkXoSWkMIhBBa3gb0t6PCygWvRqKQWAJvREugx4/yjGvONvWxwJpmgBUAPVOOjx1FG8aEvLbmz22ufG+wwiRhrhRYyvbbDmqzfGA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 04:41:33.5008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 90dae100-6835-4d50-8d32-08d8abb404c2
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT025.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT222
Received-SPF: pass client-ip=40.92.254.70; envelope-from=Qiuhao.Li@outlook.com;
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

-M1: loop around the remove minimizer
-M2: try setting bits in operand of write/out to zero
Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 32 +++++++++++++++++++-----
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 70ac0c5366..a681984076 100755
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
@@ -213,24 +227,30 @@ def minimize_trace(inpath, outpath):
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
 
-    # set zero minimizer
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


