Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 327002EED80
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 07:37:44 +0100 (CET)
Received: from localhost ([::1]:50288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxlP5-0008KZ-8q
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 01:37:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxlN9-0007AJ-KU
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 01:35:43 -0500
Received: from mail-oln040092253063.outbound.protection.outlook.com
 ([40.92.253.63]:6049 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxlN6-00065t-Hg
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 01:35:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxVA58z46w+eeK2sH8qj6gA0vz99gMT3n5afu9wLpLtJcy550dq7KR/GgoK85cjtr+OdB/0JM4S0BgXfp09DS7QJcQxm1aqp12h/bj2fYqHGhwJrRW4tOiXIEucdT3hNsAIrmVadJsqzB5nFyiwsFUG5FTXPxDFhy7XusZrgUd+dK4Svz4UMTztHF8D29UeQ+mCxRteQGW5ctik/TBqN8ZWH6PhczB5S506riWsp935mvJH0Yz61P9GzsPVVp4N73fiUx8Tm2QU9JOum1ykH9aohkLSrhcJMBdpEvItpJuO4PXUkSOcPmWTn3IAbAthrqIDFzMrn/Fo5tXSU1YCTSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RP7QGMU2RCaKuErhgC765MedoLSceDZ6OeSW1ZUbpc4=;
 b=NI5/ra9+Ht2W7z4tkqV6xCo2RFjvXFXIGvWJRP4PP32qCeWdoDsohs1xMxB2ECju1bqHdHvTOcoiTHYw4gSq1EROMFJsr7taNIrhCJidOC8/9sOF5nmLQF3tNguJ6CbGsTjTidP/mxc3t2qDG6aKmN72ZUviG9Utv46jWFU3ueHAU9ta2HcbGYGJLjPyVWyePqN5sqyG0/pDHy1Y+kc2uqnt96sJLzbt4LzCOEzu7/mnRPH1V7eWO5OTs0vA2l/ImZB88eRKnKLh/NA+hNbhm3zfc0hp6ojczOXPTngsEMazaWSsX6R1Oaf3fAKKPmNyOttSG8EJflIyrBIcgQ+4NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RP7QGMU2RCaKuErhgC765MedoLSceDZ6OeSW1ZUbpc4=;
 b=dOSCbcckq76RwaNQUWZUi4GbIXGCy5RfULYfgMGdPtiktSE45V/bI8mWapzz44X7mXDD094rWAboRwpZTtRa8Kbk3LAvzFq7/s6uwi8UUFZYDelWKs03Y43PhX3iniZI0Gc0G+fXwEhE/iQwwc8S5b18ThluyBcaWUQQjNRX+OuX0k/xaItnc7sKcJu/1KsMtu530CUa1c8nL5KIcSLLb9X1AzC+mE5/S13KOJEKqfkEz5Evuvj/oo+B3kLVClG1gbHTcWfiCbAWNZAK5ZyXTZZWPamGEPcMU9Wehqj2gFTbDNa6wlhShbKjAnmX0SrCDrBwNNWHxYOuAhg175pxUQ==
Received: from HK2APC01FT027.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::4d) by
 HK2APC01HT145.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::314)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 06:35:30 +0000
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com
 (2a01:111:e400:7ebc::46) by HK2APC01FT027.mail.protection.outlook.com
 (2a01:111:e400:7ebc::179) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24 via Frontend
 Transport; Fri, 8 Jan 2021 06:35:30 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:21F953B0B9642907DAE53309C2591E9037EB3B53AE4D9F9F58D930EE233B75F7;
 UpperCasedChecksum:23C868EAD9DE585A63F7997B69D01C7223D0CCBDA5A2778DF0BDFC1F669D942A;
 SizeAsReceived:7679; Count:47
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50]) by MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50%7]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 06:35:30 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v6 3/7] fuzz: split write operand using binary approach
Date: Fri,  8 Jan 2021 14:33:27 +0800
Message-ID: <MEAPR01MB3494A93275C5DA1917794522FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <MEAPR01MB349467055C8DBCB7743E4283FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
References: <MEAPR01MB349467055C8DBCB7743E4283FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [UjRGJ1mklsoPH4FnVePS694agwJoUt4RA049nrE+PBroP6tS1ctupdlxRQfXxZPG]
X-ClientProxiedBy: HK2PR02CA0171.apcprd02.prod.outlook.com
 (2603:1096:201:1f::31) To MEAPR01MB3494.ausprd01.prod.outlook.com
 (2603:10c6:201:39::11)
X-Microsoft-Original-Message-ID: <20210108063331.17035-3-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (2001:250:fe01:130:10c6:c22f:85d6:f9d) by
 HK2PR02CA0171.apcprd02.prod.outlook.com (2603:1096:201:1f::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 06:35:29 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 6d564308-54f6-45f0-ee7a-08d8b39f97d3
X-MS-Exchange-SLBlob-MailProps: S/btQ8cKWiT4Pkfzu6B+gslsbaS+QpFwijX0f6lKy8mbTy+qMzxxjKaXdkiKd5MUNpmjGlc3ELqsePgpDTEUiQcsKAEoOQJVsqF9jvyeWpY7gNalufrbpo61+qo8hPGpEeRsFyx3ccEs6YdFRWOtGLpp2SbgrxpuoY/e1rRdWfHp5E3DLxHmdidl0alre7nUGHXPQxiHYdJjZQCfy6GX5c3CBALPqgxE8UY/5RnkOMxeq/7/KF9Cg785iT4stOFixnbZAt5snKEcnHnI1gi4x2+5nMwOgCY2KanMgS6z0S3Z03cYJsemSYxn1tjjD0T6RoEpbdObKF2nCtPCmALxJGZ/qxDbE/9w0mPbt+cDWn74T1WdDs1+uvCfjgo249RSDEBqSJlOdoEcZWgtMjTCXP2pgeIIruWg6bPKGogEfEj5/UoBBhCeBC6k3FIc0EcVTfWmoCh8jPpw/qZ9qLq98ZJ86hzizQHzQK7+CAgDF0sb58cDVTBxMEfViZ3LgkzGj+7FPo738XCedRN6ryJMK+Fu+IQ16rHzH6Ag+zu8Rah7oY2o9zogGaS5IgFESpSTLPacBdskwoCFbRgNS+m3+3pXU5zFcbrKpYcj/D1ggGBzrV+TaaYhKFFFZmjGYQGvTnqOYxLKZeg5loXDCSSrnG0inkX2pt5pZv/Z1qSQv4XhShnA7g2eH4C8q2I0Ds72UP8DUuZgaDHX6zu+mOM0gPRXrX30MbRMCNlOjCalhNR+/tY/ea/fc2fkXsEhNyD6+fTPqm1y3v0=
X-MS-TrafficTypeDiagnostic: HK2APC01HT145:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yFogwRu/ARuyjV/lZyFBuKi3Qupb5HBaY2qr6mgkWLnZ1N8r8HORh0wG8bHkwYvl4jQRv/KgD3NCE/LKixjYKLmqspAWAp1GezG5Z5h1seNhaSiN/ct+cR1uIZqwMmjRKjpWv0+bSuz0hzVMZepvkKin2YngtofkG2gTsvTdltJVkmOE0/IUMEuKT5qBs0xXRDV8azqr5zThkQs/hoYtNH3iFf26RE6HH2NmKOk43+KBoCTV0jUrXAY/xcFdJLck
X-MS-Exchange-AntiSpam-MessageData: g6hDviGJjxGnKoh/OoGfCxeFL9DRpHYP/PEsfutg+k/RgoMf29VsWgTPF5/azF9ZxT8XUw3z2t5XGi6t+hXca8YVQFW/dcgd7UJCzLuCNJXoG+0ChwCW3ZY6olp38D85zdkj1MasvKMpa//fefHULRpxrsXgJVmRIycGe0xL9Ak0LP/4Nd8iIWCbW3Fq4lyNu/cwUEJ50oCkLZx1dQS80w==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 06:35:30.1066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d564308-54f6-45f0-ee7a-08d8b39f97d3
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT027.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT145
Received-SPF: pass client-ip=40.92.253.63; envelope-from=Qiuhao.Li@outlook.com;
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

Currently, we split the write commands' data from the middle. If it does not
work, try to move the pivot left by one byte and retry until there is no
space.

But, this method has two flaws:

1. It may fail to trim all unnecessary bytes on the right side.

For example, there is an IO write command:

  write addr uuxxxxuu

u is the unnecessary byte for the crash. Unlike ram write commands, in most
case, a split IO write won't trigger the same crash, So if we split from the
middle, we will get:

  write addr uu (will be removed in next round)
  write addr xxxxuu

For xxxxuu, since split it from the middle and retry to the leftmost byte
won't get the same crash, we will be stopped from removing the last two
bytes.

2. The algorithm complexity is O(n) since we move the pivot byte by byte.

To solve the first issue, we can try a symmetrical position on the right if
we fail on the left. As for the second issue, instead moving by one byte, we
can approach the boundary exponentially, achieving O(log(n)).

Give an example:

                   xxxxuu len=6
                        +
                        |
                        +
                 xxx,xuu 6/2=3 fail
                        +
         +--------------+-------------+
         |                            |
         +                            +
  xx,xxuu 6/2^2=1 fail         xxxxu,u 6-1=5 success
                                 +   +
         +------------------+----+   |
         |                  |        +-------------+ u removed
         +                  +
   xx,xxu 5/2=2 fail  xxxx,u 6-2=4 success
                           +
                           |
                           +-----------+ u removed

In some rare cases, this algorithm will fail to trim all unnecessary bytes:

  xxxxxxxxxuxxxxxx
  xxxxxxxx-xuxxxxxx Fail
  xxxx-xxxxxuxxxxxx Fail
  xxxxxxxxxuxx-xxxx Fail
  ...

I think the trade-off is worth it.

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 29 ++++++++++++++++--------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index cfe8f7854c..5cf39f4e6e 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -94,7 +94,7 @@ def minimize_trace(inpath, outpath):
         prior = newtrace[i:i+remove_step]
         for j in range(i, i+remove_step):
             newtrace[j] = ""
-        print("Removing {lines} ...".format(lines=prior))
+        print("Removing {lines} ...\n".format(lines=prior))
         if check_if_trace_crashes(newtrace, outpath):
             i += remove_step
             # Double the number of lines to remove for next round
@@ -107,9 +107,11 @@ def minimize_trace(inpath, outpath):
             remove_step = 1
             continue
         newtrace[i] = prior[0] # remove_step = 1
+
         # 2.) Try to replace write{bwlq} commands with a write addr, len
         # command. Since this can require swapping endianness, try both LE and
         # BE options. We do this, so we can "trim" the writes in (3)
+
         if (newtrace[i].startswith("write") and not
             newtrace[i].startswith("write ")):
             suffix = newtrace[i].split()[0][-1]
@@ -130,11 +132,15 @@ def minimize_trace(inpath, outpath):
                 newtrace[i] = prior[0]
 
         # 3.) If it is a qtest write command: write addr len data, try to split
-        # it into two separate write commands. If splitting the write down the
-        # middle does not work, try to move the pivot "left" and retry, until
-        # there is no space left. The idea is to prune unneccessary bytes from
-        # long writes, while accommodating arbitrary MemoryRegion access sizes
-        # and alignments.
+        # it into two separate write commands. If splitting the data operand
+        # from length/2^n bytes to the left does not work, try to move the pivot
+        # to the right side, then add one to n, until length/2^n == 0. The idea
+        # is to prune unneccessary bytes from long writes, while accommodating
+        # arbitrary MemoryRegion access sizes and alignments.
+
+        # This algorithm will fail under some rare situations.
+        # e.g., xxxxxxxxxuxxxxxx (u is the unnecessary byte)
+
         if newtrace[i].startswith("write "):
             addr = int(newtrace[i].split()[1], 16)
             length = int(newtrace[i].split()[2], 16)
@@ -143,6 +149,7 @@ def minimize_trace(inpath, outpath):
                 leftlength = int(length/2)
                 rightlength = length - leftlength
                 newtrace.insert(i+1, "")
+                power = 1
                 while leftlength > 0:
                     newtrace[i] = "write {addr} {size} 0x{data}\n".format(
                             addr=hex(addr),
@@ -154,9 +161,13 @@ def minimize_trace(inpath, outpath):
                             data=data[leftlength*2:])
                     if check_if_trace_crashes(newtrace, outpath):
                         break
-                    else:
-                        leftlength -= 1
-                        rightlength += 1
+                    # move the pivot to right side
+                    if leftlength < rightlength:
+                        rightlength, leftlength = leftlength, rightlength
+                        continue
+                    power += 1
+                    leftlength = int(length/pow(2, power))
+                    rightlength = length - leftlength
                 if check_if_trace_crashes(newtrace, outpath):
                     i -= 1
                 else:
-- 
2.25.1


