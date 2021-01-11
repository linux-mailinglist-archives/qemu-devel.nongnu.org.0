Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E40FD2F0CCC
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 07:19:27 +0100 (CET)
Received: from localhost ([::1]:37042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyqY2-0006yu-TN
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 01:19:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyqVQ-0005qB-Mq
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 01:16:45 -0500
Received: from mail-oln040092253090.outbound.protection.outlook.com
 ([40.92.253.90]:11042 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyqVO-0004qc-II
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 01:16:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WuftetXYpD+YMcXi8gLA4DDMgoS7WsBTZvm2KoWw2hbbomeclN9RTrYjlRxhf05QlAIcb2CTdomcSPdsWmNqBX0yNRBMEQjGmb0TmDASAZFBqr50ImgrFYHKu4t51ogwOhUdgcT2CUQ85hvEgaUgQXXdpQZphCE+zd1nKkOBOJCs+NwcDOLKpjF1mqOh/qYJ+sX9j55yff0UbI8/P2NBUrOImLJmoAXRj2uUyngl73AObM7hEHvQPwhFbJw1HlqDKS9rMigFjG+N9TTBKjg9Bl11c0jzKGk4/myC7FGI4Hr478zpC4DoH+NfFBTZS3WpAlfmxnumcTdMX/WWJxpTnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cU/DLQcN67fmdXItDkz2dQhakfELffXv+QxefRmq63o=;
 b=HH/CzkXbOL+WYW90waqtzrLRK5bTRYC2edZyU6lKkZR5Cuh22u2wLCaFaFeLGvdvVLnQYdV6uVAFZthWRbCntaH6O3BR5ZMtsRxcqbTp0U54ohTc5o5ujve5nRvBS4e+R62uY/LZ6OSVfPmiXC+1eKpqJ7bYANV35hAFmR1y4dGXqHTkFz1xhqndqHUnnx7qRlqQIHjNPS7f3cgqPKxrMySTpYtM08JAKiXppwspsuUS3hoR9QR5D9Ag7U4EcYEKXXKhTH5DY9vTQ0084kEdV39Y7u/CesvGmhKkoZ6iHUoL4vah764XbOaITCKKXIqUGq6MAqidyYBie2RE2FKgHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cU/DLQcN67fmdXItDkz2dQhakfELffXv+QxefRmq63o=;
 b=AFre9B5gMJKzHaJLX/UjS52Jro0un3w8MIw9v2Q9IBzen4VFGx9+Gj5I1EgLEu2iCH+t7Rn5OSSkF9i0b04qCuskYZbhF3AUNyowMFkD8k7y1q5pHbbw7u2KORrrt6N23p/3yzDf1Mj7Q2SUoh8X6mA7r2lVW6zj2munc+D1UqksqxO5F2h4g7Rg+MoGzTPoyHv4Az2HdRyNS2eGCme4Nz10H8oFvNwMVDkRcSxpSmNZh64v0ppMUd/bAU+KvS/jaRmEt8pM7A/S8wb7V20ZGWwS+dOKI1cQ6ApXaAVoQaDv3VlcFNjxDo9AFSQBRyUg+gFT2RXNrMbrCrEh1Dp/fg==
Received: from HK2APC01FT054.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::44) by
 HK2APC01HT221.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::444)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 06:16:31 +0000
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com (10.152.248.59) by
 HK2APC01FT054.mail.protection.outlook.com (10.152.249.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 06:16:31 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:7B6325708695386333C1D5156E22A9423AAEB9B8F8002C50108684C51B41F616;
 UpperCasedChecksum:91BC9BA6941C1CC6D963459A1C04ED688AB148500F53F56503CE60C701EB6995;
 SizeAsReceived:7575; Count:47
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780]) by SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780%5]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 06:16:31 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 4/7] fuzz: remove IO commands iteratively
Date: Mon, 11 Jan 2021 14:11:49 +0800
Message-ID: <SYCPR01MB350263004448040ACCB9A9F1FCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <SYCPR01MB3502FA4DB12C240DD3CFF1E0FCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
References: <SYCPR01MB3502FA4DB12C240DD3CFF1E0FCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [fPSy4t6JJCLRBWGhOpDVbj8IzmG9YZCb]
X-ClientProxiedBy: HK2PR02CA0141.apcprd02.prod.outlook.com
 (2603:1096:202:16::25) To SYCPR01MB3502.ausprd01.prod.outlook.com
 (2603:10c6:10:3e::12)
X-Microsoft-Original-Message-ID: <20210111061152.176206-4-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (111.176.239.56) by
 HK2PR02CA0141.apcprd02.prod.outlook.com (2603:1096:202:16::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 06:16:30 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: f7e97fcc-f9fe-483e-dae5-08d8b5f8705e
X-MS-Exchange-SLBlob-MailProps: S/btQ8cKWiSygBPrM25OmKOGXZqaBnYp0dqYPQpcI3jY0uoIuoXaFtErUpR6B/j0KaKO43jS9+wDxTjlTUGU+EfkEtK5vMJFkBVEoaco1qXAh99lMsDBVqk4urkcJ8f56m6b+REfPeBLX442ZZQQiPRAse6eJhm/ybVyEJ37lXlGrOQ2RRniabUqx1aFZXFLbjnwgQTxzbRf8NSRHzQVt32bsyR75ds0AkEVhzN5Z3cUKbuWkpO9ooQwVV21CGa1tbxTjoNoGSq3E248dgF9lMqONx/4OwE4/YW09CCfyPGuprfCE9X3k7Q4c0K1pL9qDetgu0jufhqMCneXDSNdQibqwRgK/VU8+91myWSrdKywLCCmDWx+xlZjTeWDqW2XL9UIwUnqrC4IBvlhcs/74E9lYPkJ0/0hBC7zDjTiekj65UV/yEjeCZEUMLBOP80jxdS973hPhgVPbuSRrURCK+gOwGBoP0Eg924L9J0d3VaGPBcpBMyFjDINpTD+v03PUCDyEdy8rnwJu7JEK6aFsT3h8wFmV11GDY/ncCH+gtLlG3/Ci7S1fsDci0/ZL3EL2gktV4hMxwaT/hQEfxxhGgOQWZZCAuhj/3s2F4oh0swN+b+qS7mXWaT5SYqfRfi5sx6FDTKaEqCoZbvquaDeHTs4o+jQsazncbbV8TcOYGLe0v+5hLwHNPoxQ6ye13nXyn+WwGtfC4dOnYoxbyV2U+gj5cfJin7SY7X38xJyqvjpfgk9EnKQJntqPzeKoifxtuuN/aRNglI=
X-MS-TrafficTypeDiagnostic: HK2APC01HT221:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b25Y8iP60Gpf1uu8nfstxyxGPzBX2dOpuaGVSI2Of9Id9CVCtJfPJ7mC6k1gErh9b+WmOD4ftpbWMYPojmMCistEe1FI1RmqoexBQk+OwFt6aEJgaSvdlLx9QAC5LrDJ5zkiCtlI3CiNH1dXr5+X+LRoHLP11FHy8YUISLPGAIwW28zi0PRI7ULmqL9U24jr7xPwI96MOAb/yH0h3ReiNPUzOHXUGaMjoSz9e1iuUOFqQNUsW5hM9w2/SESwE7rQ
X-MS-Exchange-AntiSpam-MessageData: tyZ6d4DbMHOYmjQ9FhRz3VFCpCR6slPaNwjPUEcfoFYpDl6aCBUUIp5WEYo5RoYHmHcUhwIktCmPN+Uv9jZ0lNUDK4HSa/L5cY28MhTgrJPmluRbQiBMLnACByyUIC7rPTa2do3O+XfTfJkvuOGzRQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 06:16:31.4266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: f7e97fcc-f9fe-483e-dae5-08d8b5f8705e
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT054.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT221
Received-SPF: pass client-ip=40.92.253.90; envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-SG2-obe.outbound.protection.outlook.com
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
Cc: thuth@redhat.com, darren.kenny@oracle.com,
 Qiuhao Li <Qiuhao.Li@outlook.com>, alxndr@bu.edu, bsd@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now we use a one-time scan and remove strategy in the minimizer,
which is not suitable for timing dependent instructions.

For example, instruction A will indicate an address where the config
chunk locates, and instruction B will make the configuration active.
If we have the following instruction sequence:

...
A1
B1
A2
B2
...

A2 and B2 are the actual instructions that trigger the bug.

If we scan from top to bottom, after we remove A1, the behavior of B1
might be unknowable, including not to crash the program. But we will
successfully remove B1 later cause A2 and B2 will crash the process
anyway:

...
A1
A2
B2
...

Now one more trimming will remove A1.

In the perfect case, we would need to be able to remove A and B (or C!) at
the same time. But for now, let's just add a loop around the minimizer.

Since we only remove instructions, this iterative algorithm is converging.

Tested with Bug 1908062.

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 41 +++++++++++++++---------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index af9767f7e4..59e91de7e2 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -74,21 +74,9 @@ def check_if_trace_crashes(trace, path):
     return False
 
 
-def minimize_trace(inpath, outpath):
-    global TIMEOUT
-    with open(inpath) as f:
-        trace = f.readlines()
-    start = time.time()
-    if not check_if_trace_crashes(trace, outpath):
-        sys.exit("The input qtest trace didn't cause a crash...")
-    end = time.time()
-    print("Crashed in {} seconds".format(end-start))
-    TIMEOUT = (end-start)*5
-    print("Setting the timeout for {} seconds".format(TIMEOUT))
-
-    i = 0
-    newtrace = trace[:]
+def remove_lines(newtrace, outpath):
     remove_step = 1
+    i = 0
     while i < len(newtrace):
         # 1.) Try to remove lines completely and reproduce the crash.
         # If it works, we're done.
@@ -177,7 +165,30 @@ def minimize_trace(inpath, outpath):
                     newtrace[i] = prior[0]
                     del newtrace[i+1]
         i += 1
-    check_if_trace_crashes(newtrace, outpath)
+
+
+def minimize_trace(inpath, outpath):
+    global TIMEOUT
+    with open(inpath) as f:
+        trace = f.readlines()
+    start = time.time()
+    if not check_if_trace_crashes(trace, outpath):
+        sys.exit("The input qtest trace didn't cause a crash...")
+    end = time.time()
+    print("Crashed in {} seconds".format(end-start))
+    TIMEOUT = (end-start)*5
+    print("Setting the timeout for {} seconds".format(TIMEOUT))
+
+    newtrace = trace[:]
+
+    # remove lines
+    old_len = len(newtrace) + 1
+    while(old_len > len(newtrace)):
+        old_len = len(newtrace)
+        remove_lines(newtrace, outpath)
+        newtrace = list(filter(lambda s: s != "", newtrace))
+
+    assert(check_if_trace_crashes(newtrace, outpath))
 
 
 if __name__ == '__main__':
-- 
2.25.1


