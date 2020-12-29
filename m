Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A28E2E6DD0
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 05:44:56 +0100 (CET)
Received: from localhost ([::1]:36514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ku6sR-0008Hj-De
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 23:44:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku6p1-0004gp-Oe
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 23:41:23 -0500
Received: from mail-oln040092255030.outbound.protection.outlook.com
 ([40.92.255.30]:6184 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku6oy-0004Tu-8x
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 23:41:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0eX++1TzYrlUN9f2+QJ9rxp9cG8NS3pB4muug/WPCqM5chISDQ8ZzZ3cIWyqkH72KLkNAAe2tiQq6riXJIMEVOK5Y7oHOTKLAucz0oPanKO2/7rNG9Y8x6CYGHPlVxkKXeGLia3sx6dPcDjDEFPcULWSQdVHLiesHPk7AbKogEs0gVY6g4aFYFJytP6iDjUZsNXvZIUKsMb2Ult/Od+dQWqJs6Z6Bd9R4cJ8VXIJ/4Tjv8fWe6xIOiglQVNmy+SP5hqIaudhAxYqQR6fB2FjDK/OXzGY98dhePMCGNN2llomTiCt8uXt9K5vPBlkzBidoBgMV4xD5JtLREV2ACE6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7U3CWaqO/4BtDRpqyPH43l5mb6QPlr2k1azwmdY/YQ=;
 b=HK4P+LtR+ALh8uS5WhVwgt5TOWdUhv7CQizZESX/v9Nx7nIetMzyJ9XNsmnWeJQb/sEtyXoEX2oKCJHr5vBcUdgRTEh01gKOCudHRFUlEFae840gbablzsYEq8o+oFQesNeKTcIPKUstXb4qPg0Iz8cU5up1OD0/5CtYAdvoo44yyoJxHCcUEGT5eyYerfp7RHr9D6i7/8leGG2GPu6yvn8edvMl4+j0p9LmBu4a7WdKpz17MSHrU4G5KOvNK4ZZvMzMsK4Tu6WO0Bd0f8mvNdFheZH7awMUExADT4KB1wNJVkU3mf0xV9yGOlFIncxj8I7aAk8985/nyj1JMgAa4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7U3CWaqO/4BtDRpqyPH43l5mb6QPlr2k1azwmdY/YQ=;
 b=VJsOzaBOQ7OhjYENjAZlPoyO34ESVr++YD258HaFrWfD2ulEBHdimxakMTGB54n4q2f22PEQVdpfwwPBkGKegcays6dBUGvz/hVi16DBSFnp47rRFTJ6qV95DV7XUIW7Z0aGKNgImDUBjJhFzEtUxUwwfSS9cX/MstWZXZdL8Q6v3VSW6IJ168tALK5G/O7GuKNf7RBBMOon0FzDY4aTZn3aR/sNwp+vxdcnDg+4ivkXTTKHOWkw/A/GMYfTAPoVRikCJ+K8zN3MbieRUUG2I+cTvpnLXLTxb08sR+YDaOJfjQHSbLOqsiAZ8F0fNDioGND2bI0AaRmQjbVCCBPxzQ==
Received: from SG2APC01FT025.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::4c) by
 SG2APC01HT192.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::412)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 04:41:14 +0000
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM (2a01:111:e400:7ebd::44)
 by SG2APC01FT025.mail.protection.outlook.com
 (2a01:111:e400:7ebd::187) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Tue, 29 Dec 2020 04:41:13 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:BF9F7790F66757943C7B13BC89A77621CD311CA219F62A9C272302821F9AC615;
 UpperCasedChecksum:511A8F647AB433A9932D61DF2D47B8926BAACEF20D5A2256253B62F9D31FAA78;
 SizeAsReceived:7695; Count:47
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e]) by ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e%8]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 04:41:13 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v4 3/7] fuzz: split write operand using binary approach
Date: Tue, 29 Dec 2020 12:40:40 +0800
Message-ID: <ME3P282MB174580AA2D8580EDFF256757FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ME3P282MB17456B93AE422008F433C50DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB17456B93AE422008F433C50DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [5WJ3GKPgRY8x9wIWFnWzRuZUXzSns184af6qHWZ0+wOM2zVQ9AQ+eGpHLiDee4K7]
X-ClientProxiedBy: TYAPR01CA0056.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::20) To ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:ac::12)
X-Microsoft-Original-Message-ID: <20201229044044.3706227-3-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc (2001:250:fe01:130:6d26:2348:77a5:f7ed) by
 TYAPR01CA0056.jpnprd01.prod.outlook.com (2603:1096:404:2b::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 04:41:12 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 371997fe-960d-46d9-2c38-08d8abb3f912
X-MS-Exchange-SLBlob-MailProps: S/btQ8cKWiRaJ+ox6yOiFxhBa7ZFYMmiF1Yyh28+MKsrj98hRx6bocrdkNxlG3L97dNpRZFoRssMRndBTQuSigFuW9B8nw8W2n37G6dOrRKBcqZe8/uViNeZQPiWQ94jdQUfYuxWEZ4dPt4puzTxSr3Ng0yEEMduNZtz33XK0I5T/2ZIwheY81Ax99JRo7uY+7/nAwynRcQ6XN77xUN3mFQ2QO3i7SVgIxb5/H8/SFu5yxa/FLk3/JUaS7SkLbbDQ4OiMyb0I+DA1PAJcBEtpDAIdkow/Bo4xybE86ySIkPc+5vjfhOw+Mz7HNXLVjuoG/4bc1E8pxAx975rd+bK4Md07K5queDEILn0zrtitwkWvrY1MgkwLXdGVuWNjXhDE6vq3zDk3gkbr2GA3+Oy3DetfKc5RAwsFLTFhl3+Fu5GLvcdbPM0IiM1s+0TY9RWtuugllWNtIPpMNG5+EyiB+JRpb0UaSpzicOH3njqWbgSjDVyM0TPF0a5Jp/DF1S0adAb0/EUhi+EPZLhh/iYY4fAp9mIeeomyHWGWqzOMcemzpr0lqAbBfPdJcd34gbENRDS4bbMFLPnfzDqE0PN8XL+i42qW42PScnovqdF1ptxkR6efVDyDJK8RiNCKoEGCSJpi0XWsn0ToFAbcqr87g7kf7oaIPqGMGAu8ovASmS6G+58cMLTAvYuA1SSL6c8fpTooXu3btUU84NL9WjHmdeo/EVyWzS1VPinNiSK7H/NfBeoKPIjJfDzTZf4mJNnuYvl/g8O1GE=
X-MS-TrafficTypeDiagnostic: SG2APC01HT192:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u5XUQ4dtAxdrq9teX7pxo5v5/lpBUz93jZ2EcPKmrgzJvWC0qk0vRhbIkyNnCtN5IZwezaAt4TaopCM4To+4efO682vnpmtEBBsIkO/qolHBhZ8YMnDLCNtudwiQXdmAqikbAvJG/k4GSYdxoDFF1pD8NeJ4FWRbSi1KUnWbkgFOQc+1hatlA54sGL+tZ3ilWKR+slvTYXPjIbCfsDDvR0bDc9tX3Li2gqsKtsZ/A+EhBwT/xtbMrP3qbhjafFJl
X-MS-Exchange-AntiSpam-MessageData: Vy0X4ACAO9YUFCcl7Faxxe4fpzNh3BgCX+BzF3XzQOAqpjqGcn2+vPlkYDeF5F8FkGh06Yvki2wJtPZld8T6ykzkM5iC4CpprFrrBKWfSGMpvsspgjadLPyC8wZb3/KoP0atScVps7Dlf7SSeo7+OBRDv6CL38NXXFJXEDlKm0qU0WJ2rnwB+/08iIdJEB2vTQl61pvGKv60CgpyHrbNgg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 04:41:13.7724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 371997fe-960d-46d9-2c38-08d8abb3f912
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

In some rare case, this algorithm will fail to trim all unnecessary bytes:

  xxxxxxxxxuxxxxxx
  xxxxxxxx-xuxxxxxx Fail
  xxxx-xxxxxuxxxxxx Fail
  xxxxxxxxxuxx-xxxx Fail
  ...

I think the trade-off is worth it.

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 29 ++++++++++++++++--------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 0b665ae657..1a26bf5b93 100755
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


