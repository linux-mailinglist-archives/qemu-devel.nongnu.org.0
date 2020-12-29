Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C62D02E6DCF
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 05:44:52 +0100 (CET)
Received: from localhost ([::1]:36184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ku6sN-00089k-Re
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 23:44:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku6p4-0004if-Hb
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 23:41:27 -0500
Received: from mail-oln040092255030.outbound.protection.outlook.com
 ([40.92.255.30]:6184 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku6p2-0004Tu-EL
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 23:41:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDHgLxL3jMoqXG/fAodFxfRvPz7bCqbxdJAqUMdshjEPt+Yi3N/jtsaFRrPJCbIK0PF529Dwx+tr69HWFD4sge0pMK19Dgbv4VVdzM0+wHkj6ueJqh+IMfeh96x54g0crBToiS0MJ8Ca1RP3G+ON9p3fal3CRRijayYbDgaSj2R2e4OgPe4cpoQ8f/+QR316S4GEkpuH+fuex+JaI2QfUnTdGUrODhVamowaJCaUuA+m/0DLvafWIXjke3kpMx8rfNvld0UGqcZMi/9u3/OWHZn9DwLd+8+dW+aM3THPy1CHdv602/q/Y9IBxT/xQWynE2hgoluyYPk6Up108gv3Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wK3n7Uk3ZhGJC8cCCDEWGObNFbGcVgU5QZ8HMxsoMdY=;
 b=AncWUKMVcKRmao77+CCfZK0QvqDxikJUyYpk08SYEfMT0MkVuUzSMl1RClCyiEa/D0Lf6PmojaROkHmwz6zeqo4z/n64CuiDRjwrPI0cDH/muk1F5rbpMeAlH5VKj0ikG8v6GL9oBuyz5+gIVg19ucmXp/IYGjj2JFTKhFimCZNuMrVxN4Tv79PvK+TWEq69U+Tq9gqwOrE/3TtxPZDxNJ55YcnTEA/Pcy5VMo4p8tckc0tTma79Qz0SpRN16qzJIu9f4Yhv9So4BU+tTA67BDPwpkr6ettwmYFefWprCaiL6XvOl82IKubXiFS0uvdr7qXF/4WIVGBj0wTS/PrMmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wK3n7Uk3ZhGJC8cCCDEWGObNFbGcVgU5QZ8HMxsoMdY=;
 b=GP0bi3IQQ5KveIEQcO5IRSpozYGmmXyyNWyEtPKRj0vlJfGUZ0tk8KcDOmJcts1t1MdB2SQoAvRPWiJkv3iebStJ431+seHVW9njOxV34cHIt3F2lZK5q7Glk4Pg4iL7nvU7KcQDx5ntkuvWgIV4iaUEjyf3ZXaxM22dVLyAf1/Z2Y757zF8A95Dst9mNO0gx2FieihRvSuDPfalzMCekaRySdarjRe0iRPKmu0cTYnoaQHh3+4RgID+FzS4XvAe4BqaZrFTAKqjngGpRZPsY+kYjU7EAH8v9v0H7+ZruA5VOBAQKP8+Ff4qOx06GozGbI4ag4Io2P7QTC3p9lcB0w==
Received: from SG2APC01FT025.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::4c) by
 SG2APC01HT192.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::412)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 04:41:20 +0000
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM (2a01:111:e400:7ebd::44)
 by SG2APC01FT025.mail.protection.outlook.com
 (2a01:111:e400:7ebd::187) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Tue, 29 Dec 2020 04:41:20 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:57CC17EF41B0F21F7D88F38DE07C8098DF364D95F9724379764449ED6832E544;
 UpperCasedChecksum:520FC871A88D032A8A8C56736FEF2E3ECDD3644C5FA795694364AFEC09CFB131;
 SizeAsReceived:7660; Count:47
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e]) by ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e%8]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 04:41:19 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v4 4/7] fuzz: loop the remove minimizer and refactoring
Date: Tue, 29 Dec 2020 12:40:41 +0800
Message-ID: <ME3P282MB17457CC3B59A47C3005560DCFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ME3P282MB17456B93AE422008F433C50DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB17456B93AE422008F433C50DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [8Q6U9TTSscVdXx6KBmXED5orJf2Huuc5HHP08t5gr6bHnSUSYxdEVqo8bagF+iYR]
X-ClientProxiedBy: TYAPR01CA0055.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::19) To ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:ac::12)
X-Microsoft-Original-Message-ID: <20201229044044.3706227-4-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc (2001:250:fe01:130:6d26:2348:77a5:f7ed) by
 TYAPR01CA0055.jpnprd01.prod.outlook.com (2603:1096:404:2b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 04:41:19 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: bc5fe06d-83d0-493d-1a72-08d8abb3fcb2
X-MS-Exchange-SLBlob-MailProps: S/btQ8cKWiRaJ+ox6yOiFxhBa7ZFYMmiF1Yyh28+MKsrj98hRx6boQ9+6tvhCh+vkL+7D7u+8xSNToZcgEruP6l4r4EUBMeF0zZs12oeFhDJ4KLZ3ALeUapB0nNONbOnqNSBhmMTybpPAshXwpqRVMdi8dqDppW3bb+QoE9OpeN05Ws5h+mdfFUpBdSVsPYD+n4ypCxZgC8DyPiF0sMLbBNS6xIbsOLFQCeNwEGu28Kzg6rV96mSO2X9WHw6VkzeFLUvJFhJCLvGZmrnOLovpRbqHiiroycjvfi6LbnsO6QpUFklQhqDhPUwNlviRUN9lmJg79Gh0QsjtSzqGbHrc0qFQ1Lhz3BqD9AO0Y9bhle+tOs8Yicsd+J6CygXJE++3W9jNObAhrvJDgrzrSNt98rVWqCjdppnc+0EYReJFdxRI8i9Mbe+1gr6c3hlemZbzqC7HrF9bD00k4z/Ldsd7V8D4c8g4F1JYd2YZTRtmojQHcyY4KGCspQbzOitXeE61/ce4pqFDtf95iPKJaopU2Nb/PCqDYGztt4cwns61daw3x7qIj6e40p2DfMvcB52h1QqgZ0HwY4jw5Ai/vYFKxAFfwqgIG3dGo6AQSXNwyOQbJlUiFRCb3YZ6yWmdedr8SPvNrlXtt3d+7cwCTqPjP67amOYOCW9mTtx4/Iu1hiszOqhk8Ahg2PTda+kOnmaps4nboLgm/4vYS26ygXba+WalEfzBiK5yH2oPOzMyDGNRtpy8mui3oDJy68QtZ5xmgBiLBJ/e8E=
X-MS-TrafficTypeDiagnostic: SG2APC01HT192:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ticQJBsA9zHiBevY73rEpfJiOBK9svsfvzqBJNfXlDNnuL9cvALHdJbxtsZHR0Fg0cNTA5KpByvfHJ3Y55bBo6ERrkBvtHzUaWe3++wyYrJJlAZQTe17TwGM1VTKb01vT4qrDfE+z1kMHL8i9cqaev+GWqFoPTqs6bUuGgUZr3drxY4W+KaO8IQSpVVNamxC8ShKBu2I/IW+tBguZDy6MjVxiks8V9/KxoQLk7aYG4gCh9BQm/gTEP3GKGeh2UaR
X-MS-Exchange-AntiSpam-MessageData: E6ItLZdRXceOBRc9pupIJ9p437Vx7p/aNYfMc0sXIf2/3K/XkZEMgh/KKTt9avh+k+XuMz2bIBewM7GKqxOB8vzL5QY33zhP4AtdTrfWu2hCdJMsi3c/MlWXooSqKiAK/ngVsW7KzSv75YwTkWsTncENasVdOI4FQcW+9CE7O0HFHFemLgEuAr5Gz5A9+oHqc4GF8vxSTHF/MZXzx9sv4Q==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 04:41:19.9214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5fe06d-83d0-493d-1a72-08d8abb3fcb2
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT025.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT192
Received-SPF: pass client-ip=40.92.255.30; envelope-from=Qiuhao.Li@outlook.com;
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

Now we use a one-time scan and remove strategy in the remval minimizer,
which is not suitable for timing dependent instructions.

For example, instruction A will indicate an address where the config
chunk locates, and instruction B will make the configuration active. If
we have the following instruction sequence:

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
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 41 +++++++++++++++---------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 1a26bf5b93..378a7ccec6 100755
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
+def remove_minimizer(newtrace, outpath):
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
+    # remove minimizer
+    old_len = len(newtrace) + 1
+    while(old_len > len(newtrace)):
+        old_len = len(newtrace)
+        remove_minimizer(newtrace, outpath)
+        newtrace = list(filter(lambda s: s != "", newtrace))
+
+    assert(check_if_trace_crashes(newtrace, outpath))
 
 
 if __name__ == '__main__':
-- 
2.25.1


