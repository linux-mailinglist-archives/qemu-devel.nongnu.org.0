Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF58B2F0770
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 14:29:17 +0100 (CET)
Received: from localhost ([::1]:38276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyamR-0002TJ-LM
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 08:29:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyae5-0005JA-RR
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 08:20:37 -0500
Received: from mail-oln040092254093.outbound.protection.outlook.com
 ([40.92.254.93]:25836 helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyady-00045L-Mo
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 08:20:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HZK2hEr1ffldQaXWLYtIuPExbg4wHD9edggGJp9TAN7RXz72tgD7Pg+64KFT+C4ZxLtJHrC6qDF1fAdznDFLM8Nf6WdkxfH1ASXjMkmzC8zKng75bcZOP27W4wUW956StBZA1bjlpkkKsd/XMyezVPehknkGjcvboQhaU7VDXRLbFPkaKRv/serNXuzG8SuxrvyEUlmmJfxw6F053+F644aOg4aCmTcfs1N/9tCCQgyfBFiA1JfHpvG20ijHnwyzHtVN8yUzGnnP3Z8S0RSM4nwmJBJ7aEksyv91eQxScMyNgZPqpArbbqU+VvKZxwIH7kzsuVk6PVi/917wx0oIAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/fmEzl5MRJz69Oqt8xtIeAA6debynlRzRD4wWQ7EvQ=;
 b=TZ3hMLDq99R+MoU0NCrQgqPhtnXWMepoEcbqqdADKuB24R45F+Br2z4LM5kD3kdZyEuw9/bsfFp61iu7FjSWn9Bsbgmbd4Q20hxd09hesPKeSPxeEr8yAZ1fAxjG/OMLvBju2zA0qaTWeptJTO0y9ddQrS0za9PPWKf7attExdqdM05hvCLOLz/eHOsNDImuECnktVtNXeA/UPiM9ftuQoNLmfZMYuvn0kX8wEdxGsiVoEQ8pXJchOWVsoOHHATFDT0loBXObZ5PPT2AyR+uPba1iBPCCqh0wOQcUcrudkkPQUavhp2wgb9mAScUg7zduMEf7/CbzKrvW0MayyMJBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/fmEzl5MRJz69Oqt8xtIeAA6debynlRzRD4wWQ7EvQ=;
 b=gf34aCZ32eiA5wD4x+cWvGZconaNvdRMFlr7RvtolkfhqJWIVCoFX3ls+HUkrSqr7/vAgGo/0cYNHDHZXadll2saLset8+Ir9sEeIeyv1IvvI+Kb47GiQfKvQzEnrDA4uWyuBC1+ci3nvvdASgQ+1vl/ehXM6dB8Fpujuu5dDsQ2wPPn14T54mObJpXZi4dtC/38JEMej/0LDKNmEY+UlBq1+r9nAzZhD2zVVYkh66K88tiVz25qgKgt5jeuKW6CN9NfRyY4jQJzlypVGcJxFgqltkYlpbklZNgMX76lBbUyWwU7aEztxCJkI1bK08kYMoftMJ5ICtz6jpQ4SXe2sw==
Received: from HK2APC01FT060.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::46) by
 HK2APC01HT092.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::382)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sun, 10 Jan
 2021 13:20:24 +0000
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 (2a01:111:e400:7ebc::52) by HK2APC01FT060.mail.protection.outlook.com
 (2a01:111:e400:7ebc::416) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Sun, 10 Jan 2021 13:20:23 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:8F759C8646C72B952F79E2FE54ED85748038C2CA12C1BF1489C493BCEAC6368F;
 UpperCasedChecksum:09F57D5EE6BF2456CCC66EF778F1B847F048689A171689FF59A29D1FBFE27139;
 SizeAsReceived:7573; Count:47
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780]) by SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780%5]) with mapi id 15.20.3742.011; Sun, 10 Jan 2021
 13:20:23 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v7 4/7] fuzz: remove IO commands iteratively
Date: Sun, 10 Jan 2021 21:19:34 +0800
Message-ID: <SYCPR01MB350270E50984958949101151FCAC0@SYCPR01MB3502.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <SYCPR01MB3502023A4AFC1E75DC3747ACFCAC0@SYCPR01MB3502.ausprd01.prod.outlook.com>
References: <SYCPR01MB3502023A4AFC1E75DC3747ACFCAC0@SYCPR01MB3502.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [qNcAFgIP5ep646nhT5IUF/wW9pMVZ3cs]
X-ClientProxiedBy: HK2PR04CA0064.apcprd04.prod.outlook.com
 (2603:1096:202:14::32) To SYCPR01MB3502.ausprd01.prod.outlook.com
 (2603:10c6:10:3e::12)
X-Microsoft-Original-Message-ID: <20210110131937.98351-4-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (111.176.239.56) by
 HK2PR04CA0064.apcprd04.prod.outlook.com (2603:1096:202:14::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Sun, 10 Jan 2021 13:20:23 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: c2781ace-3b52-4479-16b2-08d8b56a7cd7
X-MS-Exchange-SLBlob-MailProps: S/btQ8cKWiSygBPrM25OmO0bBkd81GAbWJADUOi50NfKRvBQZEallobRy7DwHVxRY4CzH+0EetlqsQ0griGApdJnj1vpLTz4Zp15bNNZkp9h81RHAYS38+Azd7autjNQTlPGExUndt4ocqnw6Tvpl9mjmR+XUUJS+0EMgmTjr37i8qWJfYnP1Aq7geWN4sZCl7vgS9jwYjftllsDffHJbfxA5SDc6n/4YZHMyQhpKaxv3aGCRU/8p550haWgNXINdZI2yZlkVCMpxSM/Dd4GbUS5QcXvwV0b3y83qMsdJhb+xTB3SKz0uPbSlLjqeymh87WpjD5AMZxg0CWQ+/1ftnMkGC2LPqqNszJmdN0f79Pc1C1JPwc5m9ywyRSbYZpoEBartczgYay/IsvVH38kn8tpifo3AuIpPPiFxf0NUvNE9qu+Y6NWONeQZNLv5/d+KHeZee9UD92BaqrFalgIuxxn52o8kFHrKxBhp9hDEQO/u4XZZNGszTOxLoemkOg+BNWseFbWXJrG/Ike7nvGU2SUPkmCY/U8+xGfe5QvhGAD1Mcin0M+Vvg8iSuS/f07oLdg2Xf0Ps1NM9XPfOdGyOoseabQgAr9lDodxbq3x9C78uVea+nT/2ELRgrNcr6yOmK0f1/kpLUKB3W+aNRJySO3tuyY+9RWHWa0Gi/oFzfc0i8z5q02ueAMFbh/TZ0S5udSeJgpFoToY2bTDgtBj0udvwj0bmQy0ILpDTMaH4BEStSt4vAC5fhFiYMtflvxn5W7YBloef8=
X-MS-TrafficTypeDiagnostic: HK2APC01HT092:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wJl8KBxRq9687F1GWWRuIyCIP5wPGtPKgj0t8XHpenlpxhUnJrXJcl3ULoxJLOKqDWlyd2E/OlHLNjkXrmxPcn8ZDhGc7qaIGZ2VmOycnAV9difTTjMxYFTDylzEPlL+f4aNFVHEw6/kUBihByDxKH+TC0gsi5U3DiXhtr2nNP+WQeqbyEB5rVxc5PobDVBfDLqzUdu1xhJAlx+1/0B9O8hSPcVyJZne6hTsqN0hcwzUb6gFTI9AHhMYJqsiX+U2
X-MS-Exchange-AntiSpam-MessageData: QcNmziquf6yL2HEDe/Mn1CEieucIXLgMTpQqaM+on502/d8ouRlc7xFBV2NXZfq3+Bd/0IkzLndYOIxV3o+ANgQXz8+h/FMCC6x4T8TAVKuhsXCAy5Wm/2GUNcqkWN+CNejxsy4r7U0RUtv+/m/0iw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2021 13:20:23.8137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: c2781ace-3b52-4479-16b2-08d8b56a7cd7
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT060.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT092
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
index 319f4c02d0..287266fe39 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -75,21 +75,9 @@ def check_if_trace_crashes(trace, path):
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
@@ -178,7 +166,30 @@ def minimize_trace(inpath, outpath):
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


