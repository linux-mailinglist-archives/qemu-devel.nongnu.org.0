Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C37CD2E6DCA
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 05:42:55 +0100 (CET)
Received: from localhost ([::1]:58056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ku6qU-0005ZO-Py
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 23:42:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku6or-0004ax-2z
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 23:41:13 -0500
Received: from mail-oln040092255107.outbound.protection.outlook.com
 ([40.92.255.107]:27280 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku6oo-0004R0-Um
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 23:41:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HH5osuqtduFnTDpO2Brq99GE+PQTwZHf11u/EEwh4G/nQ+5ttYHpsTYwttMTEKUrwAVpiKMYrSLbBSnCPaSwORmChXHfV8/E+3sFim7dp2YGb3zUY94paAl0lKPnwYL8ztEookOMQwKRHsP/PifvOYusbUBj8cTUyB5WeGak0Er1xpXq2BsBWYrBClH4/xeReP3KGCMJD8lhppGPoRSfCj4TY7NHJw7QPnCOEklHcGMcYo0mnWlbtsIUsc4Ee53dr5jKhZ3A/3ZTeaq/7U62Edk+rmmSw3xe2/x9c2QZz6lXjO6N+5DwPDyeBAo0UFNZEwNDPKSZrKtesOMChdMW1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asFEf41E7C/LI6HYvtDP5NrBaUVrKW4QghpxAocWPww=;
 b=bCH29inEu9MdiYSTX+BnhaOpsIU93/SQIlsG92FXBnhLqVCianHp9vJrTR6ax25luPTB5BGLqZW7faFDNDkQ5tMhwc0N4MRhg6V+HBsmK2dR23iSbCw/TC/0TUd5wZJ317SleaPZA1S4oEy2djwMtcaD7KrLX59O4jsC/pfuBMeP60dhCq2BpAp0qSHZ76YMmQBRiQyuiDyHeUg4lbVWRnpfeJU+DgAZea+d9JN8knJ3kffiPYOI9T+771BNMyDtZthDtCp2hU5SKOPTXBUQzBzRaTICJ1XrEI95fG/15WLUZCyjz0YKRHRfJji9UtlllUjrP0ZAvWTuAomzs5Ma3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asFEf41E7C/LI6HYvtDP5NrBaUVrKW4QghpxAocWPww=;
 b=E6SPiVkDUyI4wZpduGkUvKR4Lv//01cdlZ5BZUO9N75uiCJKbb2FRZlXhYa331wSHYX84CmDW2uTv4cwSb61etLk3OE3O0opd/Vlmx09kfajkcQ6WBW9seRHB5bfMjDTnyJATazhyoIW0/WzIXEAITO0/nepA0vijWaH3ErGfTyks/bLp8IS9m1NeC9MvJ3hRvv5vk0ubV4HIcABEzA02lPLGsAF1BWSeIUzTPgk4rErDJZE7/NehnO4wljV7S16WIaNzIZfffi6DsTPeLkrkpUDlZvM2eJ4+g38zHpEPDEIA5MAq1nSVcLWaTZ2q1EiQuOvN+kVhPLgwpW/TxyaQA==
Received: from SG2APC01FT025.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::4c) by
 SG2APC01HT192.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::412)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 04:41:01 +0000
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM (2a01:111:e400:7ebd::44)
 by SG2APC01FT025.mail.protection.outlook.com
 (2a01:111:e400:7ebd::187) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Tue, 29 Dec 2020 04:41:01 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:D2D56D144EA6D73698207E9F8DEAEB473B947F2B79102BAE9CA82C7C8623C282;
 UpperCasedChecksum:9B4432929F5D4A1198E8F76D46BD775A7C722C04309497AB84A66CC840073734;
 SizeAsReceived:7649; Count:47
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e]) by ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e%8]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 04:41:00 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v4 1/7] fuzz: accelerate non-crash detection
Date: Tue, 29 Dec 2020 12:40:38 +0800
Message-ID: <ME3P282MB174544643E941EFC9EAA2287FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ME3P282MB17456B93AE422008F433C50DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB17456B93AE422008F433C50DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [FpNWG0zo7Thhc7YUudQoHoWXt65tcbg3igWpP9zhuFjLlCdmlGdeYGOYXlFerJMz]
X-ClientProxiedBy: TYAPR01CA0057.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::21) To ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:ac::12)
X-Microsoft-Original-Message-ID: <20201229044044.3706227-1-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc (2001:250:fe01:130:6d26:2348:77a5:f7ed) by
 TYAPR01CA0057.jpnprd01.prod.outlook.com (2603:1096:404:2b::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 04:41:00 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 2a357311-8c2c-4a49-78a2-08d8abb3f158
X-MS-Exchange-SLBlob-MailProps: pt8ZUcDWjMWIUuQLPiUjHYmN0Ah6oaNn166PGN/57hxfdzQIfXPyq26CV2avYg1/z/7/Bh6FrMDJazJTKLSCCqMO8AAJw66sBEwBGEsYsdZGCergt8w711My6CaE7uE0L7fyo2BixcwCIF3GcoElUdb3NCFJn2o3VvY+bzZVEiyW7Irk+8z4UcDS0DWRj0GEu1KN+6dSD4RCZ0xp9WcY2Jnw8sTILQnIVcsOM5VzZWBLCYd2yQY4F+28Udxqm8zF94YcXaKquX/lTTfnx6PPoC142FdC6q7zvPkQxkUezh2Q6I6R+IfzInUKGS2jTJ+bkdmUicGliOnHpjWdAj8c6rrKY7KX0Ba2akWc7w5brIr00ukvH/z0gFgVLuhTJqyYAKtRE+sfv6ZbHtCzCAKWpECBQOm2XwtJY1LfgY9BZhazZY+dG0ffw/Hf6qHmsDaxwQJHP1dvIydZkqu7M9KlGSoZRnBvbOn9ZLaIVp7+wSwmtgITA35YTgDPSnQW3x+W7rnjalyEKH6CnFIGjE411Gd+T/Fb35pKIBKmzWKGdK8EIWjfGqK5LvQgJBv7CeGy7TmE6W+TzRKA743ktrBjlJzTJk/y1mK8OxPDehZOAY1Ajb/2mEFXunFALstCGSFpG844jrz3IjwsRBy8mW0mK/SdboUs1oiu8hgmGL0OU1CJifIvHyln5h1cS5IkRINwfGv5zzTDiOymj5okXOwviiYBzQRTgd2zcbXfl8JSAzEZRWe5AwELGEJb3DCi7iM8KnifBBSOBJXXJc9qpOCzl7v025ZHADHTwNrIL7aTznf+t+jbxmdg+gQ4XaaduBnSs9X+2/c+B8PTIquOZ4nbAketC1bzAmBGzNNDSvtFYCT6JLnY3VeOc/9tfTuHCtWbMtSssalCZpJ7+IDw27uob+QYk0ih73SuLV9/WeEMVMoyYatsKJ4D7TzCnIEcqrp8
X-MS-TrafficTypeDiagnostic: SG2APC01HT192:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t+Rt/VasACneowm2B4HOtXWT08WrGjC9g7TyfXBHpoMjjD6YU5yrxvOOaaMJKLdsBiNBU2nFURD8yiaKLn9vxb/xK81CuM83MCAuvghjAyOaG+FgwjE7WT3XN2YYEfegmOb5kzzO2h8Wd6B01kAheU3dS0KtmEX/YqcGVbyXk3S1kmb44kiZ9Yxs689cUcAQZj9z7SJ8h9lIOoTUgkGb2tUC9LAZoJmav8G52NofjvSXzXanw/TnD7hI5aBDk2U/37a+qZYzwv9sKQT4m0IbhVpD26vrdcTwKgQm+wZLjW0=
X-MS-Exchange-AntiSpam-MessageData: WcfXWgyUMo2WHlxJT5w4AbWkZ40exVKdupwRy1/kGbbPqOcHT2UlcRzc4KcxVVBfZFNkvj7IYIbrXDsIhCc8+B+8IZxzaPEm4wtpa+LnWWpTKFBuw8I5kMYRJpOKVipufjypYUtaaDeOUQyTInlFCXqudaHZrFyLNvfivg0N1sp5WgY9a3O9NmCrmLHyJHImcz+u4jiO+7RWAvgIiDQTtA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 04:41:00.8880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a357311-8c2c-4a49-78a2-08d8abb3f158
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT025.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT192
Received-SPF: pass client-ip=40.92.255.107; envelope-from=Qiuhao.Li@outlook.com;
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

We spend much time waiting for the timeout program during the minimization
process until it passes a time limit. This patch hacks the CLOSED (indicates
the redirection file closed) notification in QTest's output if it doesn't
crash.

Test with quadrupled trace input at:
  https://bugs.launchpad.net/qemu/+bug/1890333/comments/1

Original version:
  real	1m37.246s
  user	0m13.069s
  sys	0m8.399s

Refined version:
  real	0m45.904s
  user	0m16.874s
  sys	0m10.042s

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 41 ++++++++++++++++--------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 5e405a0d5f..aa69c7963e 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -29,30 +29,46 @@ whether the crash occred. Optionally, manually set a string that idenitifes the
 crash by setting CRASH_TOKEN=
 """.format((sys.argv[0])))
 
+deduplication_note = """\n\
+Note: While trimming the input, sometimes the mutated trace triggers a different
+crash output but indicates the same bug. Under this situation, our minimizer is
+incapable of recognizing and stopped from removing it. In the future, we may
+use a more sophisticated crash case deduplication method.
+\n"""
+
 def check_if_trace_crashes(trace, path):
-    global CRASH_TOKEN
     with open(path, "w") as tracefile:
         tracefile.write("".join(trace))
 
-    rc = subprocess.Popen("timeout -s 9 {timeout}s {qemu_path} {qemu_args} 2>&1\
+    proc = subprocess.Popen("timeout {timeout}s {qemu_path} {qemu_args} 2>&1\
     < {trace_path}".format(timeout=TIMEOUT,
                            qemu_path=QEMU_PATH,
                            qemu_args=QEMU_ARGS,
                            trace_path=path),
                           shell=True,
                           stdin=subprocess.PIPE,
-                          stdout=subprocess.PIPE)
-    stdo = rc.communicate()[0]
-    output = stdo.decode('unicode_escape')
-    if rc.returncode == 137:    # Timed Out
-        return False
-    if len(output.splitlines()) < 2:
-        return False
-
+                          stdout=subprocess.PIPE,
+                          encoding="utf-8")
+    global CRASH_TOKEN
     if CRASH_TOKEN is None:
-        CRASH_TOKEN = output.splitlines()[-2]
+        try:
+            outs, _ = proc.communicate(timeout=5)
+            CRASH_TOKEN = outs.splitlines()[-2]
+        except subprocess.TimeoutExpired:
+            print("subprocess.TimeoutExpired")
+            return False
+        print("Identifying Crashes by this string: {}".format(CRASH_TOKEN))
+        global deduplication_note
+        print(deduplication_note)
+        return True
 
-    return CRASH_TOKEN in output
+    for line in iter(proc.stdout.readline, b''):
+        if "CLOSED" in line:
+            return False
+        if CRASH_TOKEN in line:
+            return True
+
+    return False
 
 
 def minimize_trace(inpath, outpath):
@@ -66,7 +82,6 @@ def minimize_trace(inpath, outpath):
     print("Crashed in {} seconds".format(end-start))
     TIMEOUT = (end-start)*5
     print("Setting the timeout for {} seconds".format(TIMEOUT))
-    print("Identifying Crashes by this string: {}".format(CRASH_TOKEN))
 
     i = 0
     newtrace = trace[:]
-- 
2.25.1


