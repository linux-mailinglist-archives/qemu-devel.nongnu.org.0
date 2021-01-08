Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E61002EED81
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 07:39:27 +0100 (CET)
Received: from localhost ([::1]:53018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxlQk-000132-W9
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 01:39:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxlOW-0008PG-Lv
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 01:37:10 -0500
Received: from mail-oln040092253042.outbound.protection.outlook.com
 ([40.92.253.42]:57507 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxlOU-0006ir-LD
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 01:37:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hc5skLcpzVhgejYzlF8C0VuMehUrjGvdbfoypHwtBflew9ls8R5d5te8N3ibyPUIIYM/8zg8js28jsFstjNyLpuDGBKBRjymPP2MdjOQUJmOJ2JcmgieQzNMPXQPRpv8apOaWlHNIW4BkQRS69suDADsZ7g+fnSORk2knJu0hcsn/6iehY1lsjXBKD5qcq/aSqaTcbptBphIoSwnYvUvnmKUeT0BQZJmRlGzjbwC948xbf+jd4AXbZ8p0UqvFiPL9u4OAJdSSVmYd+Bh48qo0Vf8u3WXb72nmUM+7/u0EjHgepDu6VF3naIdm8XvXdPgY8hF6WZgzjWIM/Xr0SLGgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35226rHk2QhbBEeRdjvWNAEkm0dVs5gsYZMFmUzsgo8=;
 b=n1lXNOFBsSE1IFBuJxkTnjonGcxt+CEEnp8K8tLx2HOYcPDxm/mjfKhpy689mF8u7hy3Va4YGXOmv5WTLjoQQbS3TE7gePe6CGy1+lahq4HQF6Fm8dPw8ds5Bi4PVyT0ApvIKDHLLD2qc0A3iLzVkRw3UDrPYbeJ7sv/SjsIj1pKJ2/XteaImMNYrt1V0BiqmMd7ZPoA9po6lfdHlzGkIN/QoR4I95oijebZlyHLyGJClH4TJFik43XLwfAlR1JL0xN/DOKkfjScLEHqwMlRSrzK4L/SkWqHNWdsYWfUcF4CNw8bO8cgtC4hrdz5ZCKDq1MQmkF6mbKmFvgkLm9bxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35226rHk2QhbBEeRdjvWNAEkm0dVs5gsYZMFmUzsgo8=;
 b=JwGE2jxUg4pWhw9M2CitQYJQcXfzfkhrZ0Cj9362XZIRst//9K2g+0iFZEx+TmY2ERt8O4/a3tI5iZ1i2H4P2seHRS5R6dnooHssI37IE5d++GvCwE47MiVMcVWOieTAI81a4hsteSjDctvaK8x1tvoQu/E7RX6kl1ZzoAGUnduvkkb5T3G5kdr6AzO7vJixHfiivIRiI0gYS788prWWa2Lx2p5lSs6sAizPYCRU6dpJevPkmU3mzcf5+wH9RsPa5504jmQN5Q6x+p6+m9C/uBm87LQlw/l1fLFWRXAeOgFMSqylCMhQ7bepYi5xxzEw3aS47TRo/7/SWpuZIUNpIw==
Received: from HK2APC01FT049.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::50) by
 HK2APC01HT232.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::394)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 06:36:54 +0000
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com (10.152.248.58) by
 HK2APC01FT049.mail.protection.outlook.com (10.152.249.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 06:36:54 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:71E8D490654C5EC8953FD317CD1816CB7F5E586241E9D233617B77FFC26A8449;
 UpperCasedChecksum:0F3D19C51CC8F632792BB00FD880BF2B15844D4469CBCAF044468E625862B42E;
 SizeAsReceived:7659; Count:47
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50]) by MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50%7]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 06:36:53 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v6 4/7] fuzz: remove IO commands iteratively
Date: Fri,  8 Jan 2021 14:33:28 +0800
Message-ID: <MEAPR01MB34942D441A4C84A74CB01709FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <MEAPR01MB349467055C8DBCB7743E4283FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
References: <MEAPR01MB349467055C8DBCB7743E4283FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [TRqwea5pEAPc8DyvtaRzjoD17fLDM9hBSItaTY3ip9VLrdjVPHLW5h23CRM1fHw5]
X-ClientProxiedBy: HK2PR0401CA0003.apcprd04.prod.outlook.com
 (2603:1096:202:2::13) To MEAPR01MB3494.ausprd01.prod.outlook.com
 (2603:10c6:201:39::11)
X-Microsoft-Original-Message-ID: <20210108063331.17035-4-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (2001:250:fe01:130:10c6:c22f:85d6:f9d) by
 HK2PR0401CA0003.apcprd04.prod.outlook.com (2603:1096:202:2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Fri, 8 Jan 2021 06:36:52 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 7274a2ce-9d05-4d71-68a4-08d8b39fc964
X-MS-Exchange-SLBlob-MailProps: S/btQ8cKWiT4Pkfzu6B+gslsbaS+QpFwMRUHTKJJVtAPn/bWcJTZGva+oXXRMDs2GucWnWtTLoVKR1i2aeCm15OoCdwr7Pwm+AbyYs3cmhExntpuNY6t1BXTsZrOJnsVvDQsos6/Ij1LbJMrbmsHuy+hjh4Wcyv7mHUt3mLmtLdsxJfG2JDwTwRIgyCXtN158VsehgJF3snIKQnOPxe4OkmMI7DKZWAd5ITQnsBdv2UIpBE55vQMmjh4wu6p77xVJorIUKhj0gByuqVgNeTMwmGt3kD3JPar2lSnE58snMHWTnhE3RdvnIdu3MGisP5PZNwSre/7Pdu9fAwXFr1TA7vZLnQp0cBrjcf6hZRrnf6F9HjMiDFdc0IXVyt0m38YxY/1SlKmb0YSn7bOu6elYRIgLx5bd45L6v01ZyqLhgD1Jc/zVwKsEiH1jFUrYzmvYrJpNmk+48hgiZ5KndAMJKigbVmXnarA6G7/LbEH3wo5GG/P+x+M9FQs93YBaofFNpC+GGdAD3OJ4g7PB9ceu2PLmM9psu1Qs+iZAjwYBJCVeUkB89Th+PdibZmbm16STa7/WXGvdMNEBaxpgllu68+f6HkrBev+t2JVCHZ5/0jO5qc9nCcCyt5703aGh5zlI2Wnz/gPpV6klAgFWOPCnV9H30cLmiy7YpTruLtbkRkLffErk2isZSRwyhd69n0rdwmVd3H3BgF5igR5Y/DdAukhtXWDR72HTvOHgzbzb/fE+UsSIqlF198OuVILaMD0/D339oExrog=
X-MS-TrafficTypeDiagnostic: HK2APC01HT232:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IOKrI0ljdQ/2Hn3N7Re32Az+8J0slQkW3AVVN2EItr+P8WG5R7OFUfzrVj7zp64CjIKmGnSivN4xxkp5UcOuWsybSECAFisVkeYpbe9bpozFuzWBWMFmb5lJ0cOc/UihcbQ2udJ90z+DMLeipthuSRQ47op4F183g1WEdPQI2UyRP6GOyQEF5Kevd+4pKpaQbjFb7extoRfsgBQcB8xnKwW2wdV1aBgF/4vU+m7qIWiEOEOyzotkfgOsIy1Hfvmz
X-MS-Exchange-AntiSpam-MessageData: M5aZtESh5+CpIVY8l8EPzybjX/Q5t75rvqTDXXohhv28Y5B+V0hrfpMZmvOxaV4spM+rWbTUOCwjbiYczCR4R12HSNZJ77N1oP8x4j+MsP4vtddtS8ZZ0KjhChtzX4g/LmUhnvZd8PUQ2MmJ6RSH2Q06pDiSDnBSs+HNTKPJ3A+TBcPTqzuvVaRIeu174k875ntSy+XqvLDPRqlbK4EyOA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 06:36:53.1688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 7274a2ce-9d05-4d71-68a4-08d8b39fc964
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT049.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT232
Received-SPF: pass client-ip=40.92.253.42; envelope-from=Qiuhao.Li@outlook.com;
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
Cc: thuth@redhat.com, Qiuhao Li <Qiuhao.Li@outlook.com>,
 darren.kenny@oracle.com, bsd@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com
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
index 5cf39f4e6e..45c1627d32 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -71,21 +71,9 @@ def check_if_trace_crashes(trace, path):
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
@@ -174,7 +162,30 @@ def minimize_trace(inpath, outpath):
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


