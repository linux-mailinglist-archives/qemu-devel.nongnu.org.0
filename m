Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D40F2E346A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 07:00:16 +0100 (CET)
Received: from localhost ([::1]:35092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktlZi-0004l4-9n
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 01:00:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ktlXP-0002VH-Qm
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 00:57:47 -0500
Received: from mail-oln040092253016.outbound.protection.outlook.com
 ([40.92.253.16]:6042 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ktlXO-0001do-0g
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 00:57:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HLC7Uf6fGfzHnW4vywXILZProjrHwLUNsC3rCIkLHpzT61T/xhk7pSBjGwDAUZskAzZg4V6Xjqrlitzc5XmBQwqJtDLk8SJJKveF6dZtQbWy5azvGkzR6rfib0uWnOddGxwtZ6wNTHTGZ7endppnmEi0SWB/SbsinDpcCq3WM0OjX2eX0BhzvgA9TDxkSUewz2zwLf6Ij6wskduPpve22DWw93TLg17qBoMx6uIx+up/L1lpe8tvdmaSOMJ+QpGlT3DFY736MP3mCmSjPU6yu6hH0DcSXi4ZCYg683kCRiNhmr7KSKylm2L8DNjhbnSJL93428ln6Xtxrhm9hdXOmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aF+abmtRxoN2Hh3tuhNdPH9OGC2gMkwQfKUJUY+v+FM=;
 b=FBFAT0jhSrR3vtlgG8SJXHKNteYDoMm/oZgrkgF6ileQgs54e6vH4wXMTLdj9wu+i7u0SbDftXkxSBu381sp3+Myj2hkXalRWvj4AOI9jh1IDG+AoJ1ZTexs7v9Jp+FRjYN2wLBH8gbGVW4N50B3mrrcA3KstzTj77U4A7bpNk5OZ9Z3F3rPfDttNR6N055do6sgl3Pk7g6h4x9lGmzy1EXItRPjSiNB38FfMd/5CRk6dSxmcknIp+zm8NJn5hCsrKUKAB1R7nK0D/XmZ1M7ptbT2N9T2wg04R2WBsagnF1mC5T01CPrQ9COTo7WrojuXsho6Ctve0bGx4gwpkhY8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aF+abmtRxoN2Hh3tuhNdPH9OGC2gMkwQfKUJUY+v+FM=;
 b=M1KbV7Ge9XA9T5CXhJz8YPtBPoTM2lnnI9fRZV5zByL1dR4aa1R+Hf2COZ2vXDd6lz//Np2tuzQJPC3nzIwzfQLss6wS6lOKcB0gfncFNZRxxyZE3Pl9wwFFL/XWfG2nv00bxODrFf5XV84/dEqRS1dnrSyUFOOjdsEKFMAbG66IUuU5h4/z0URRbbVGIGjsruuAmdhXAZrB4vvPIE7ULSNbWGpw43nrmSxPggKW/OitDhNzeep9Z2XqW9CAR7jpwbQiCqzS6MClutl13MgszGrusQSNUUnbRNXPERJj8hvyqWgtiPx99UIsd2RcLJs4adIrcMwzUysKwPlind+wdQ==
Received: from SG2APC01FT037.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::43) by
 SG2APC01HT111.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::445)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Mon, 28 Dec
 2020 05:57:33 +0000
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM (2a01:111:e400:7ebd::48)
 by SG2APC01FT037.mail.protection.outlook.com
 (2a01:111:e400:7ebd::367) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Mon, 28 Dec 2020 05:57:33 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:7F2D52FEB5F34A3D3C0D9D3935E0033B7E50A36939E48A442F7DB723F549056E;
 UpperCasedChecksum:BDAE21F28B0EC58911B90F15A1D34603879C552C7A9B1A523ACE5A34CC4E5718;
 SizeAsReceived:7679; Count:47
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e]) by ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e%8]) with mapi id 15.20.3700.031; Mon, 28 Dec 2020
 05:57:33 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v2 4/7] fuzz: loop the remove minimizer and refactoring
Date: Mon, 28 Dec 2020 13:56:43 +0800
Message-ID: <ME3P282MB17455626AA33AA43881D4CA0FCD90@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ME3P282MB17458B2705C43E860A26171DFCD90@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB17458B2705C43E860A26171DFCD90@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [zTPGtTI20wVpTiXIh8Woxb1NHhZKbHb6sfu7gbeLO4tXOUIi9oCC1GEMmUykdOQW]
X-ClientProxiedBy: HKAPR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:203:d0::21) To ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:ac::12)
X-Microsoft-Original-Message-ID: <20201228055645.3666065-4-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc (2001:250:fe01:130:2110:d78f:cec3:aac7) by
 HKAPR04CA0011.apcprd04.prod.outlook.com (2603:1096:203:d0::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Mon, 28 Dec 2020 05:57:32 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 1aa7e11a-15a6-41cd-7fa4-08d8aaf57858
X-MS-Exchange-SLBlob-MailProps: S/btQ8cKWiQjHo/KsCc3LvvB0a1Ll3PYC6K0w3QFDR8L/49KzYOzEGTn7Hq9fn4IR0wezor/f+Emnt1Mb8V43yKbqidC1x4ESs6iS3JzInahkerrR62V6rAwVEX0rJUlTr9hBjovipAw6yrXF80fBiX4nZtJtXZCrbTEXSUDShUnAh6nhW1HPw7RxI3a5bj3vEw8iU/MiETrTpDZYu7vprXaYREuHCoy0QuFder6/3DelQaUAoj5RwpKYjcM4lTsPT7na45OLk/6j48qGLEWmvRHTuP2R4tA/4IZjJWumYtWXmYSScSKMMidYDwqhbXsf6gFDwfkRnc3gmz4OI52LqwBTQ7LuHdfC4qlGupvsAQATA1h4VS10i9o+e3/GAbNxHQ9EyFJdVuTWB7JyFjzvS5mcieI0ySaXhC7Cc5dwUfxWRmZumyaX13nxVP+9DAr3K50WUMp6MljwPVOJ8FVNPvX3L23iEBhWw15TnHNfCIcxi2o7rantMdfOs7FHH1na/KBQlPpAWC/j+1Az/Fi4HINHqR6Cf6bc/gNPEyb5W74vEKT/lXBmAibQneyZ5lITj0lFq9dkl0jCBW+PeZhmp7jzZ4A0OQtlKQIltJma/DKdl3ieeJP4voHA9P4Lkat0hQpopAOSP+z7yB/kYbrdnvWU6nGvTfDxAfzrqoJBeWNIqsUHpyXWCObB//hGIM7/N6HQNhSTRjhTUMdNKuYSKYCPRZQStdQ2RcWM8Onsq0josBcMkgdnYhQZZhceGkLQPqM/o5Cm/E=
X-MS-TrafficTypeDiagnostic: SG2APC01HT111:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DDSSBjNQJRgE670BCcHK9PGosCM9VmDcJ44JknO+snFl0lcGmg5mvDL9ErmvKmiX5w8zLC1vwxNsZvc8T7o6sKvYFFMggYaDtMWpQz6Q1me1XKuK+4ERiJ7T5PMsZVwOOZ6NlSvMQwbHLZutkkUxtAjAaW3AhnsDqmz35hyIhPBH2aBo2RgpFEn5SKwk4luehx4HvsKQg+ChT9LerJ8gGSBmHgeAuOICDfyMErtw9oHJ0Zqc0bX28cdMlxRPEcbk
X-MS-Exchange-AntiSpam-MessageData: maJwQ+QGe/ckZhcWUWaeGlGaew1iWWuDyBqTtkuyuSRQxg08dVQGfJnshsG4zp7oZa369dfH41cQi785D/1A4g4PyNuZxj6F8Bl3hEMTXu15dO8L2GXeWcq4tr9aCvV6O4PZis3LIYFNhQn14dx9Dg11UWx/HXucv4MWy+jcUFxMonCIiJYhgHHXt+2YPXKwcsX61pm1HpgMp0HZ1iUELQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2020 05:57:33.4784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa7e11a-15a6-41cd-7fa4-08d8aaf57858
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT037.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT111
Received-SPF: pass client-ip=40.92.253.16; envelope-from=Qiuhao.Li@outlook.com;
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
index dd6eeb7258..0cc88da933 100755
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


