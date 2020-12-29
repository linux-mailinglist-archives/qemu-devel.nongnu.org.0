Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5C02E6DCB
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 05:42:58 +0100 (CET)
Received: from localhost ([::1]:58242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ku6qX-0005dv-6d
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 23:42:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku6ou-0004dG-Cw
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 23:41:18 -0500
Received: from mail-oln040092255107.outbound.protection.outlook.com
 ([40.92.255.107]:27280 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku6or-0004R0-Sg
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 23:41:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxoU2Uv5cdAEUL0GhBN5k/Qd9RIsERt5OU/k2CNVZImno1CVnz1pKkakD3Ry7+WWVwy3rE0HdsVxncZZwKcd4uTNbiLsaQJ0aZA0xltlPnEA/G6sX9cq1PlmDjiC0qaIxiaCkWW16cXrl6qHim037/bRSDrkom+jwjduz52Vg5/pmwQhNreG+fiVE5UIynMqymy5t+gExCaG+4wYcMFwcmRBFmlnrRcZ7nvkExgSbGSAccRW5vHomZ4X05ulZ/mgHeboHxSnzH+DTN3EPO7gEavALk7WRHdMz7gVB6P8PUeDLLIj+Vt8Sa+4rjmSZqwZvYxqZyV2dGAlrNhai5ixlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sG1GmprGsMl3k4rRNoIj6GXzWL3roc1+FGD8fQ/FZ5E=;
 b=gfsAK1OfPItw6+lwA+469EeisLZG6ktKemx6/QxQ8WMuvpJIOb/MNG5Ptlio2dfw2dZMbuOwnUJHaLo8K5D1iDBrOosPcnaOzb38VX8j6lPO+GQ49M0gi+AqXrtgUMqim6turw8aQTzBp7HoNQFkJIJhFdPrDYQChpHEHWYiqhOfkuqN6j77FuqQ+Pj40g3CM3IIMuquiJStqO/xAV9BYWz8LzO/LpUwrCXuuKkdwjk9f570ABmh15jkPfUh2gp1Xj009huapIn6nWcLSnaF/0exeACR8y3LJxzO3LocnkbuVTdCorrbO1w+ZRCdi1X5Ve5Svi+8xT8npTwenWAuJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sG1GmprGsMl3k4rRNoIj6GXzWL3roc1+FGD8fQ/FZ5E=;
 b=GFIKOGbJl/ncaDyEzpdkJywBoI5polF2yQKIFd8oTrIl17EBbA49IDig3roh71Wg8ZxV0g3QDFYkCvOuD+5oxmAH+iW7H3t6AzaVaHmG/jKpMqtDtNPptsSMsH4H+HPV4hSjkMde57VfocZz0B9anE6SkEzbV+XuEFdlHIg2DucG1sr6ufWjpBsam8YUIUT6CAB/UVxlVUf6Y5ESmG3GDjo1IWdgb1/tV6q9HoykyYBO8qnBekHanckwNX9r0mPt+anF0scNshh+zDoRYn9Pw2DThYrdLbkF42I761Nqgblrhg9urPzFLsjyvhl9X11D90EI1Jz8nosUT7LF3iHMOg==
Received: from SG2APC01FT025.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::4c) by
 SG2APC01HT192.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::412)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 04:41:07 +0000
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM (2a01:111:e400:7ebd::44)
 by SG2APC01FT025.mail.protection.outlook.com
 (2a01:111:e400:7ebd::187) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Tue, 29 Dec 2020 04:41:07 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:3446043F68947CD490118B5FAFAA73E187613CFD520AE690C050B58FE9B9E4FD;
 UpperCasedChecksum:70AA99C655FA50F8BEB802EE31C48E80781D6A685482623C8691848AFEF2748C;
 SizeAsReceived:7677; Count:47
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e]) by ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e%8]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 04:41:07 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v4 2/7] fuzz: double the IOs to remove for every loop
Date: Tue, 29 Dec 2020 12:40:39 +0800
Message-ID: <ME3P282MB17455D5C7EBFF7D9D7510A4DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ME3P282MB17456B93AE422008F433C50DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB17456B93AE422008F433C50DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [wJzSKXjFNAAFBU3D1PpuN4GpapTSscxoJj1msfLXoepMoAexyGPXFqytXxHbzP0p]
X-ClientProxiedBy: TYAPR01CA0062.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::26) To ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:ac::12)
X-Microsoft-Original-Message-ID: <20201229044044.3706227-2-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc (2001:250:fe01:130:6d26:2348:77a5:f7ed) by
 TYAPR01CA0062.jpnprd01.prod.outlook.com (2603:1096:404:2b::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 04:41:06 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 6be3f89a-4058-404e-a331-08d8abb3f52e
X-MS-Exchange-SLBlob-MailProps: =?us-ascii?Q?KE5ywuOaN5gUKW4Ngaj7XpCefOhcv0ruVZnfG8mmZVeJim02NEm/Ja8/qxDQ?=
 =?us-ascii?Q?evFlw8W0w3tSjVSXlwlb7+tjEqNutwGEG9c2u6LBhpXC4LkMb4HOKW5gARYy?=
 =?us-ascii?Q?SrJZkt987mdYUCaqFB57/Q+UZxGFazNT+Ca3KVwwHu7kokZ30dGe2vlIrwn5?=
 =?us-ascii?Q?dvM1VZ6YR8MMByGdDBz9fAG4qBpvKcKfRNN9bkG2mRz38ks9LA5svdHjOAdN?=
 =?us-ascii?Q?oGPihvQKOe5LG00TQ5V8SBomPAsky4wPLUxyJg8dvR1UKS39vA7HBXJDin5h?=
 =?us-ascii?Q?zQC2kJrUqIksv8fytpIqO5MJYbi2YHfdfmm8cEaTpYDvWrmuSH4azzv0eyBF?=
 =?us-ascii?Q?ilT+K9npdMiOjcu1fobahBO5lgApXmM3ebR0Y7gWUDbtII/QfKOmVxwmm3YA?=
 =?us-ascii?Q?l1qv6fHzXLhBXOOllrAekOnqEHE+gXu8t/jnnfWM9YjTVf/yHnNM6uay4Moc?=
 =?us-ascii?Q?m8P9xgsNEeA0c6MDeLS9CyiYxCabXSuTckCn46/YhPBR5T1tVMSDyZlWKQ0j?=
 =?us-ascii?Q?6jNLO3tVZXAzfH75E2IU1TO5veD0jP9I3H1VkYrYIN8fjkT/5Tg8PLmFRbfF?=
 =?us-ascii?Q?cnF/eWN6B2a/BBPHj1wAcuuFOMlCUcN4WJz351+z2+bZjF530S7fMoIK94Qn?=
 =?us-ascii?Q?3NXuURGdd0VHsZx+sS3LpPrKs0w6QPELtbUbNwgCFZ3rBWjjkERHp8YDtn5m?=
 =?us-ascii?Q?8hFOown1KWSW7nPt6QND1KhpnpTk0PIXEpvJz/joxRiTN1f7BTD6WG44pWWB?=
 =?us-ascii?Q?b6d/r3AEuiAnC7rOy4kgJfjuY6LjoyDt/Li6Huais7iFh6qMzJgkDXzjk2NK?=
 =?us-ascii?Q?+fsMCYL+0GZBW9uzVQRIoi1m0yZYzb+timx6gYrGinUXUas5PSt7g0rXKdFz?=
 =?us-ascii?Q?vLfLtz+ngG/VT6GncD9eZEGMPWDahoVWTS2JGtEm/rqyAEDP2u9nXeffrs3R?=
 =?us-ascii?Q?Pb1q86ed4UtuvnzOub1iGUQDyv78Vy7Z?=
X-MS-TrafficTypeDiagnostic: SG2APC01HT192:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PPkk8FkJ2Y4R1REDn+tFonXG97hfkoovIXjsSMEuvXI4SYZArrAuE6SjUYef+z6bXhYklvXpRSeSyEz3VY9iLPmCD66W/smPBN/1sCV/AimsLPUvKUuBaPiFHgunvMejzVDwREKIZ1weFiTjnTLN5kN2BPP+hUG1ZtaWi0mJSNjDa3CtGjYH+1LHecdkwpfBRRslKGUl6+8YRobZ+z18V8lF20gpDDmyOVEULXI2iiu9AeqxOJHT8+tlZmijk06u39bXyjno6t5uwZ52bfKV4p7lUFuBgHsj40Abhyovdss=
X-MS-Exchange-AntiSpam-MessageData: GuEzI3nJtB/N8DlLQ6Jxbic7vWfH0Ft9gPNqgm+f4niOQmzYVC8mrCzrI4h64e2pYJRGKgDvUfVhfcIHp7wp1fbh4INx4G0ERGV5braE4RdFSMnFdfqcEF5NRgs73NEOW9vItf38jsn0m/TV0FHNbVQJTcRiIP2fV4/HITg/ysSjatEElbWpycEq+uqAab7Bnq1pHRb5r+dui3kouFnt6g==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 04:41:07.3467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be3f89a-4058-404e-a331-08d8abb3f52e
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
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 33 +++++++++++++++---------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index aa69c7963e..0b665ae657 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -85,19 +85,28 @@ def minimize_trace(inpath, outpath):
 
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
@@ -118,7 +127,7 @@ def minimize_trace(inpath, outpath):
                 if(check_if_trace_crashes(newtrace, outpath)):
                     break
             else:
-                newtrace[i] = prior
+                newtrace[i] = prior[0]
 
         # 3.) If it is a qtest write command: write addr len data, try to split
         # it into two separate write commands. If splitting the write down the
@@ -151,7 +160,7 @@ def minimize_trace(inpath, outpath):
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


