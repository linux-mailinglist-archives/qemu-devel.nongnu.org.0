Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 736D82EEBC8
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 04:16:36 +0100 (CET)
Received: from localhost ([::1]:40330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxiGR-0004vW-Gl
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 22:16:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxiEF-0003la-DN
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 22:14:19 -0500
Received: from mail-oln040092253060.outbound.protection.outlook.com
 ([40.92.253.60]:60864 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxiEC-0005JW-DY
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 22:14:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KS3NASzk2QR2loOq3KhzU3RJVZyJlnVIcSmXy0vZ7LyqDEPZ2/cpbSYw0+ofWJoc2yG1KNzNWNUk8QfcqUP6N5oo9UCFBxv0zaJJPB8tR37zJBR5eAssre7JUPZp78qcuTycNxS6NxKHasnR0hRLxfgo/K/XRpHaR51j4t9+OFVTGFjQUWyFE21A+FQLKa4GILIf+sFLLV7XmR8glz4pMeEJAH9LI90bUAzEm6DQ+9Tum3ZOSrAEABQicqlNSDRmPOa/4OzzRCGE8OrDRVw01Qa2yY3151jDTzbEW0aouPLBy2NsHEey9OhN1GMYtJnOGpi096+db3UtWCs8FHCVzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJxPZMUQKm4IJzUA1T8PavWZtYwQl92dwiRgDToLD8Y=;
 b=RkHzgy4QOmOH3YBO+X7qUa8/iNlaSzH3Cg3NJhwXdIrBtUZmyb+KmbWwhYIMK2iTXHoWyWcLGSo5DTtMeKmS8clo+KPaQxBbYKKzOdB6c5lKpQBRUKtPGqoSjY+Fvv/80lcRrMjdQNIP+lamWTDMMxGQyJshfrosY4BgShaeOD9MoE652JP+6ZY+gs5v857meQ765+u38tYWVIhAazlBho3oxwBdF1S6nTbeB680VLIRyJswe8XcZ5ZAIwQXQfy8lr+Ky9QaGEWz7BKihHD9CnRlWymSVnMw1idNFBFADAsL+i2VM2QkUVVGEzW+xz7NSOmdCV425AYfP/j/PqF1lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJxPZMUQKm4IJzUA1T8PavWZtYwQl92dwiRgDToLD8Y=;
 b=gSbhqkIXKWstKrNIlwEf/LtGM/sRu+EUtTE8U2N6tYHvUt4KwnA7JgAnNSG/JYOc8HpmmmhZ2GSf8BtAUSRPYLP1t+fynxObsBuLWSfm2rtXZyuYkywvjImwp6yuv7BppVp6caWRpF8DAMg4nn0OllpHFDgLWcezSmb7NBJOs7iBWz0l6T2kevEAJNSgbMy0J65VQIUVQfVgYenT4zivsumx5yd1Uy2pXX631u2QaL7p3isC+8P+ZEu3EftZ95xft/K5AVUtiTMoCAzAj19SFXf0hRkCJbPt9MkRKHXCk67ZpeCDvhr2KarkOnWUEGvDZT+iOqeYtzOp+YkURaOxcQ==
Received: from PU1APC01FT020.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::45) by
 PU1APC01HT191.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::176)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 03:14:04 +0000
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com (10.152.252.54) by
 PU1APC01FT020.mail.protection.outlook.com (10.152.252.217) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 03:14:04 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:CD810F83DB2CC6A35640D1D1A7AD2A5734D8D02EB195FE6D04012F0A896A02C6;
 UpperCasedChecksum:6362CEC9DFBB24E7C95EAAEC4391EBD81EA36121BF6B09E16F3F9CE71C9EFF26;
 SizeAsReceived:7670; Count:47
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50]) by MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50%7]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 03:14:04 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v5 2/7] fuzz: double the IOs to remove for every loop
Date: Fri,  8 Jan 2021 11:12:44 +0800
Message-ID: <MEAPR01MB349414BD723B23B5CEEE8756FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <MEAPR01MB349464ED835FE8243FB09100FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
References: <MEAPR01MB349464ED835FE8243FB09100FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [Rioarmk9br1URyIGTnF6Hwj/tOZeXETA7musnMUIPZhdMB20pFOp5YlqOTQVZlnm]
X-ClientProxiedBy: TYAPR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:404:15::14) To MEAPR01MB3494.ausprd01.prod.outlook.com
 (2603:10c6:201:39::11)
X-Microsoft-Original-Message-ID: <20210108031249.68381-2-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (2001:250:fe01:130:40a3:2fc0:cdf4:4729) by
 TYAPR04CA0002.apcprd04.prod.outlook.com (2603:1096:404:15::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 03:14:03 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: f3390425-e99d-487d-4774-08d8b3837435
X-MS-Exchange-SLBlob-MailProps: =?us-ascii?Q?KE5ywuOaN5jiCpCm+ROEFRq2FG9qaSQFWYDFNIHdV2arQDmV1t64dVMhqdix?=
 =?us-ascii?Q?uSWKJhU0im+B++lXnHUlkqDRZg2aMeFjDB6dIUPmvlpf5Vy5T3HSEt8eAtI4?=
 =?us-ascii?Q?mZGyGWSTtiQS1Y+HpZJBji7IqOeeKIh1Mj9mETUWK5u/fhueAuWQKM2g87kq?=
 =?us-ascii?Q?vDHYVJujGJD0A6j0SD0sZ7WO2e4q/Wvv5xot+YUIy/FWG4rpXzz1EP3WOmV7?=
 =?us-ascii?Q?7nyMoC21KMDaj15evy3zwewkVGqOrnnOW2AAsAhiImTLRqpA1CoxujiWO1yj?=
 =?us-ascii?Q?cvwiTBUOSykQ81aKXe9L6NYO/o88cwNV/BuR/1umOhwSOCyfJLMUT9JFqQky?=
 =?us-ascii?Q?eUQZ2RXlRuihroaZjIBE7wBmgi5u4GEz5jaR5AGC+4EMbnSOjnZ+2RNmoM3a?=
 =?us-ascii?Q?rOnVD/SFwCUJmP6yoo67ipyY9+LUmC0solfTVGtYCAAWXSSzcQ4ablZcR6ZG?=
 =?us-ascii?Q?OYYDKgD5H7xuHj09U/ABH+vBVTBpFV39j7LkOXpRVfZoCNxHTWxg/AXyl11i?=
 =?us-ascii?Q?yeB64Sw02/KA6akDH8n9+KwbOTJPA2sJovcuXPcfTE7la6Cb6HYuJ0CYxv1X?=
 =?us-ascii?Q?eXK6Ymk7EHA4IyudD4kqW7qvjn9rTOtenZBqRmQKiYibbH57F0sBHLAgyEfk?=
 =?us-ascii?Q?u8yYbQINCQ+HtEV9osMnfNs+F0FP+LXhexzYKkOjvbo/H1A5/RwgOoqv+NFw?=
 =?us-ascii?Q?BtYtP6Y4/o0F1YezmgMLgk47Ph2M3GtuoLfStOeOyBamS+mjBoDJBCPesafV?=
 =?us-ascii?Q?6uwPv4AANdKyN3OV3HXGGMSoGYN/DACSFkVB/l+pMO8cLfnD/NvE2d+eCtDj?=
 =?us-ascii?Q?v8Rq9HkgpApmcpm9YBt0Uo+1CijRpbMeEV7xpQYI2DObasQ8ogkDSda2gLZK?=
 =?us-ascii?Q?tW69PjXvbVbrk6ua1os0Za03RTHKsYwRLZD830izwgOEKeESYmevyv9Uk8LD?=
 =?us-ascii?Q?h5PNKmqgufqZbYC3XoT/LsP2YJLsFxf2?=
X-MS-TrafficTypeDiagnostic: PU1APC01HT191:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QtPvMHG/Mne9Mg+XDdcqc0FTftcwnDdMTGwbjEmkNgMvWJI8PJq5PVvjfvWhQ843A5D+1fuCtazYdbfutMh+wyg+EfLFuAUYZIZteekIZX7fEtWjvYBU9BuBorWNhGtGWBpPJnf5jFbNn/PS0t5HWY7RrMr2sDJtQjTn7zDhqXmAE7EqC3YnPPkm2qYNIW9+RF1nW6hr224yzndjctOeANkRvGmQglzrFlltohE2acw0g/0GKP29iY41w9hgsNrN30JK04zfdvmobiaZg0/faMpP8rZtYNJCUguURqbsBdY=
X-MS-Exchange-AntiSpam-MessageData: E6Fy18vYEFUCjX5cp2I2vUQLsiRQK7Yv04UGA+LjK3gzHLOazpzJAdZ4KkS2nwQD+s6ZdoJVzQZz6JmyYpNysOIxHiv5Cx1JrM49+Ff1UJJ93T0eLbQE1PKJWns0e11KiRnjan43+xICI9BNDp/pGw7UTWQd0BatQmMYtZkGg0HyRUwLyYBMlfx6ugB3e6ZHv1vgY9wNJk4wegS/5Qm1Lg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 03:14:04.3902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: f3390425-e99d-487d-4774-08d8b3837435
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT020.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT191
Received-SPF: pass client-ip=40.92.253.60; envelope-from=Qiuhao.Li@outlook.com;
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
index 57dcaaeba3..cfe8f7854c 100755
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


