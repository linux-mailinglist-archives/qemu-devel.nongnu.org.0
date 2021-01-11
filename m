Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 897282F0CC9
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 07:17:11 +0100 (CET)
Received: from localhost ([::1]:33170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyqVq-0005FF-Hp
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 01:17:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyqSl-0004ei-Di
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 01:13:59 -0500
Received: from mail-oln040092255092.outbound.protection.outlook.com
 ([40.92.255.92]:43472 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyqSj-0003iF-H7
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 01:13:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JavuOaIFY2NR+nhPFjwKTgVg8wQ95DSpqU8vyg5ErwQ/82slYWpm6yjXgR1YDnV43pGMPOMpkPSTn80ieuOSu/T6Fk13u6wvgy080TJX55Qf4bwFKoGawgizKR8DH5I8TdZR9iyk5uMNC+ig6ucjtezuqStp9LO26h4AjD5fuAOfzB41omYXd4NmBDXW2VNG3GrLosSvkM6XjjEKoDnMgebJtJZOVMH92mB5/KcKeunM5Jl6lco5b1+3HIK1N5m5N6VaCX1h/si6b02yz/H85ndxtipXAmFCuIoraYiOYd51RlpepsBHclCZ07PqKrgxd+bvrJOEiE+YAriKvV8aaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6elFADColTZ1H4wdYADJXnK547NGaYfuNoPdnVaOgpA=;
 b=a2TE/4TKyO0J1b6SOo9SXOmHlpGYJfGXseRNjT6K7/QPhH0LC6ruEmfkknS9paqBFLrJ+S+huF92Mw5QKP6Ak12WOD/FF6bJvhwgkDfxPRgVDFxh8vYtMXyoVuoNko7k5NFjPkdGRe5DeVvjg7EYlbMMKfmQwBn/kqivq8wADPUii594kkw+3NSuGF7uKmVXsBTaU4ZrRxDW7G/iGi82NScCbp5HdRnQtMpZVgNCpG5D2eljoQz2xiuCg8pWx1Zq+lEYcmRjypnuaB+h1k7+e/Ygc2Wu/dkDZ2C+R0DGAZUx2R50YP940Elb2oDo+vWaW3lLI3ypzFspbs8p8PHqEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6elFADColTZ1H4wdYADJXnK547NGaYfuNoPdnVaOgpA=;
 b=aHEfiWfQUH0Yj+Og9myOWGJoLw5DMAm/bi3etP1ai83rjpPQRgibJEFs8UZlMwwdTzm604+HaEYK2qIZO1C+O+fQqkQu/eCA18tt2WYm71rEwlhUigJwlHbUqCYunyjBSMEYxO+PRq2isBcDfGcCrNngruMOYJiVe4bVOJNjPCau1MCrHGJcJHjRyzvPwMyiV3HkUQCb4fLhTqt2HPqUywxIeOZzH3r56q9pIydWNr4ig7Qm5bzG5BEMdoFPeNI2ks9rCuQYtJRzVbEx/CBP2xKtG5/ZPdmv5lmSbLbEOHn9ecw0HCpB0tCB515l7axaP0wvyZTM6FSsijFML6N2rA==
Received: from HK2APC01FT054.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::48) by
 HK2APC01HT180.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::467)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 06:13:47 +0000
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com (10.152.248.59) by
 HK2APC01FT054.mail.protection.outlook.com (10.152.249.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 06:13:47 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:CD8F0471EEFCC95F66B152751E5219F1D127793311A8687B4F293EC5DDA1FAA0;
 UpperCasedChecksum:43ED1CD95A49559A4ACE4FED8032C8779DB5B514DD7E72271CC399E6B9FD8FD0;
 SizeAsReceived:7564; Count:47
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780]) by SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780%5]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 06:13:46 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 2/7] fuzz: double the IOs to remove for every loop
Date: Mon, 11 Jan 2021 14:11:47 +0800
Message-ID: <SYCPR01MB350280A67BB55C3FADF173E3FCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <SYCPR01MB3502FA4DB12C240DD3CFF1E0FCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
References: <SYCPR01MB3502FA4DB12C240DD3CFF1E0FCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [Mt1T9bO+g1U4yzmNBVsB3pkkgKjzonh4]
X-ClientProxiedBy: HK2PR02CA0143.apcprd02.prod.outlook.com
 (2603:1096:202:16::27) To SYCPR01MB3502.ausprd01.prod.outlook.com
 (2603:10c6:10:3e::12)
X-Microsoft-Original-Message-ID: <20210111061152.176206-2-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (111.176.239.56) by
 HK2PR02CA0143.apcprd02.prod.outlook.com (2603:1096:202:16::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 06:13:46 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: e60637fa-1437-47b2-95ff-08d8b5f80e4f
X-MS-Exchange-SLBlob-MailProps: =?us-ascii?Q?KE5ywuOaN5idtt69Y1RXkPrSrL7zR5FKqmkiwKFeFiXr8PxXQqE8eobEgaLQ?=
 =?us-ascii?Q?/Z1GXjKo8aayz4a+a2NWA1gxrs2rAk02Tp2l9KdSZT/l0Bu5cjUU2CCR7kwS?=
 =?us-ascii?Q?xpdgZ18PtlRmOFad5/W7UHSxu1t2zrVR15eigXQGaa46ojtfIyZftmRm9wji?=
 =?us-ascii?Q?022aSQjeDub9ECymSu1tYFhxjT8BHcEO0eZMK1U57EL3WF5cpBacQO89CmTu?=
 =?us-ascii?Q?EgkqXyEZzWuiCnzVBqxXtYW1hjeArIgmBItu+F8BRPNgMn1WbxlsrVYnk/UZ?=
 =?us-ascii?Q?5zI0gJtXvZxVZz4V2M60J8MBaB21G/99dMkme11+c9y9/U47beDLRXZvQahx?=
 =?us-ascii?Q?5GUMPZKONcE/k+i8Bhwbr6H9g6F/N1vxss4V5XTelC/0o00WFHfHgCVYoe5t?=
 =?us-ascii?Q?TLrvPINenSOPzGW/pi+/YOYzs63FtNQ/6RxukLG4dMZbrHOH0L87dTNvLwng?=
 =?us-ascii?Q?fkwP9/ovBmUxey7ziz32D51Ok0ju/4H23rnTLy1TVbspyboSXkP7+JnacKv1?=
 =?us-ascii?Q?/xaGQ13UnDEg4A3Z0HpDBHILWA6JbNwj6xHYrC74A+yfiKz6XbdHoN2gcUtD?=
 =?us-ascii?Q?U2cysnC0MtGKTFOBRKZJrkRsy9GOV/xoCWt4AIxH+Ec/F6oooulsVRIUx9ew?=
 =?us-ascii?Q?WdkHCBYkqn5tuiRAoPRKMDhVag9xkJG6f6tLCtKdmIs/20f8FXx34L1V7zrF?=
 =?us-ascii?Q?2B0Fs6cNzBTZjRONC+UNCEsL704KZ4oTZjBS5ngd5KFhKejtPIDF3HQxGHwR?=
 =?us-ascii?Q?biGpQcdlNFzOLqwUbYvY/AJrircVzhfgPJ1OglyFXG5X5khpNqrRkcfqfAB6?=
 =?us-ascii?Q?vegR6XByQ4KFFw8W46pzM+f9HyiJSV+X5GN2F+soE4Zih9AbN0xwI/L9oYw5?=
 =?us-ascii?Q?LmsfsZlXkXdDXm8U2Ybj5dW9IkBI9itYDIiJ1knFZDkgRW4odJf1tJKA3TEk?=
 =?us-ascii?Q?rYhDvhgy28rlC5fZnN60yReDiCL6a89+?=
X-MS-TrafficTypeDiagnostic: HK2APC01HT180:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ss2t0sqSw/Nr1viq9Wxxj0oAnVmdGB4nxLt7ZCVlcfgwl399PH/zJm+xhYuxUvHchZOVifEXlPkYyS+15Os4DG5Q7slpO9srf8PPCRLbRpqNoONoaXH78vVJGt7t1i5co0nqgt4A8+J8qo4K9uGOQCPNbG9AIPjW1It0/aNjMsribqDliXZnrxQSUKpdAX/yHP0s2jaD+bAIolPyvnNDi1vXaffcXGw1SqcSYgc6mGu2NLkZCC+hPXdZjmjeaJXy3HKST7FAoxXxHwQ0nQ73bHONAFUaLnrhYZGq32OcAg8=
X-MS-Exchange-AntiSpam-MessageData: RKm/D4N9Nbg5qfVX4FSORgX5rQoUl/k62NsBzC+iUwnUd+vXBBpZTs41ed7POJBGPN/EOvCgq3OHXCQDaRQpI0UCuUnOc/E1PdwvgcfivdJPqeG9kpioVjspLPK/M7VWdDIf5Q0+TRInw/a4o1r/hw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 06:13:46.8519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: e60637fa-1437-47b2-95ff-08d8b5f80e4f
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT054.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT180
Received-SPF: pass client-ip=40.92.255.92; envelope-from=Qiuhao.Li@outlook.com;
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
Cc: thuth@redhat.com, darren.kenny@oracle.com,
 Qiuhao Li <Qiuhao.Li@outlook.com>, alxndr@bu.edu, bsd@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of removing IO instructions one by one, we can try deleting multiple
instructions at once. According to the locality of reference, we double the
number of instructions to remove for the next round and recover it to one
once we fail.

This patch is usually significant for large input.

Test with quadrupled trace input at:
  https://bugs.launchpad.net/qemu/+bug/1890333/comments/1

Patched 1/6 version:
  real  0m45.904s
  user  0m16.874s
  sys   0m10.042s

Refined version:
  real  0m11.412s
  user  0m6.888s
  sys   0m3.325s

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 33 +++++++++++++++---------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index a28913a2a7..cacabf2638 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -88,19 +88,28 @@ def minimize_trace(inpath, outpath):
 
     i = 0
     newtrace = trace[:]
-    # For each line
+    remove_step = 1
     while i < len(newtrace):
-        # 1.) Try to remove it completely and reproduce the crash. If it works,
-        # we're done.
-        prior = newtrace[i]
-        print("Trying to remove {}".format(newtrace[i]))
-        # Try to remove the line completely
-        newtrace[i] = ""
+        # 1.) Try to remove lines completely and reproduce the crash.
+        # If it works, we're done.
+        if (i+remove_step) >= len(newtrace):
+            remove_step = 1
+        prior = newtrace[i:i+remove_step]
+        for j in range(i, i+remove_step):
+            newtrace[j] = ""
+        print("Removing {lines} ...".format(lines=prior))
         if check_if_trace_crashes(newtrace, outpath):
-            i += 1
+            i += remove_step
+            # Double the number of lines to remove for next round
+            remove_step *= 2
             continue
-        newtrace[i] = prior
-
+        # Failed to remove multiple IOs, fast recovery
+        if remove_step > 1:
+            for j in range(i, i+remove_step):
+                newtrace[j] = prior[j-i]
+            remove_step = 1
+            continue
+        newtrace[i] = prior[0] # remove_step = 1
         # 2.) Try to replace write{bwlq} commands with a write addr, len
         # command. Since this can require swapping endianness, try both LE and
         # BE options. We do this, so we can "trim" the writes in (3)
@@ -121,7 +130,7 @@ def minimize_trace(inpath, outpath):
                 if(check_if_trace_crashes(newtrace, outpath)):
                     break
             else:
-                newtrace[i] = prior
+                newtrace[i] = prior[0]
 
         # 3.) If it is a qtest write command: write addr len data, try to split
         # it into two separate write commands. If splitting the write down the
@@ -154,7 +163,7 @@ def minimize_trace(inpath, outpath):
                 if check_if_trace_crashes(newtrace, outpath):
                     i -= 1
                 else:
-                    newtrace[i] = prior
+                    newtrace[i] = prior[0]
                     del newtrace[i+1]
         i += 1
     check_if_trace_crashes(newtrace, outpath)
-- 
2.25.1


