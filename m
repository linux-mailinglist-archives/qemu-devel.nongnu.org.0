Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3BA2E3465
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 06:59:07 +0100 (CET)
Received: from localhost ([::1]:60404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktlYg-0003a5-7i
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 00:59:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ktlXI-0002Iy-W1
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 00:57:41 -0500
Received: from mail-oln040092253038.outbound.protection.outlook.com
 ([40.92.253.38]:20256 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ktlXG-0001ZQ-8M
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 00:57:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hD7abYTCibCSKotqCNLDirQySv7XSKbRAk/b9KRlDI+6eKCR+pZqPfl8aexBA+FH3h/zFhyQvsz4MBLadPzs2esddLj1GCrKBROM4KSWQH+2+Q7iplhDcLPknRhQBcvodbxUAhNA60pT7TfJ//JFRZegiOti4n4nC3RBXryiO92cnsDgzYOo2NNRu6cUxqupsYYUUYA6+3Q7s14qRkYxupjpNG5ZrgRrvV9Sg9xQ5l2Z2njLRS8Tvg9gAFU92n/+4Z5s5InJvoPQRGFg0hjXCPYkbheRPF+fyx1/5W34cGkppaUjFpuVkFS6AFechd42QyynRX9Sb8Q5uh5RQJ6eCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIPe3sz5ECsb2/9POlh44cNXGX8W9h6zsP1DhXTkAHs=;
 b=Tneh8qIbYyMEQlNMYaFG/CEkW/BB7t3hLZJ/mhEnGGl6fXzxvt8V5iLmX8PaKN36SkNsH0YV6ObQXl4WgNNJogzBDCteSqIEVzV4ESdT25lAx/jbt4p8HCoyADrxQwZT2/EUcPGcyuPj1V/3yodz4JJJKeAdGYJjUtxGgedBClQKur48hZA4pYzImSJySbHna7Y4la/4Uje8k2TtNK73IR4ftOThPXE7MjD0qM8igTl54mbW+/T/krj2WRaajIz3WcAwDdbT0yo6SXt060KE27DY2Q5XRhDfnFEdgJ66fbJJREESY/0b6h0oVqhY9ItziCAv2ML+U4zAt+c/UtDJRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIPe3sz5ECsb2/9POlh44cNXGX8W9h6zsP1DhXTkAHs=;
 b=eyJxoNl0MaBoWQPXwyHB2vtVb8hXvrbwDAZ2lcoy4OzZd8u5AelvncQMlDfBeOI6GogAr+ge51fEMuVBP2MexS/sRH1vcrYSKmjHtcVjoiux2A2F2LNZ6EnTDZnqr7vUAbwmqjy3urURWL5RYBTD7r5DZ7buZVmL5aAAJMRSnkFBgSBxNRngZMrY1Y4rKNKENAFq+Pa6xfbXYailH4jxcFCivnGQtWUnk5AyBa6L02pUho2AxOPnYNXoaN/85cfg8ftt5CR/y372OO+GPbZAKDIPx7XEBAA7TjD0bmjASLXHTgGp88DBsKKSHyjBlRdxCDNiEGcsB1yiwrj8ZAzutw==
Received: from SG2APC01FT037.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::47) by
 SG2APC01HT171.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::256)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Mon, 28 Dec
 2020 05:57:28 +0000
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM (2a01:111:e400:7ebd::48)
 by SG2APC01FT037.mail.protection.outlook.com
 (2a01:111:e400:7ebd::367) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Mon, 28 Dec 2020 05:57:28 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:A2035B9978E04D838858834F1224601E377F5A16D5B7E4F5263C1D67EE6ACC50;
 UpperCasedChecksum:F61A523463E7FB4F127B1DA3175435B46CB291A7BE456B445F7A7E9292A5553D;
 SizeAsReceived:7660; Count:47
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e]) by ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e%8]) with mapi id 15.20.3700.031; Mon, 28 Dec 2020
 05:57:28 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v2 3/7] fuzz: split write operand using binary approach
Date: Mon, 28 Dec 2020 13:56:42 +0800
Message-ID: <ME3P282MB1745BCFADCF23D090E89E0FEFCD90@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ME3P282MB17458B2705C43E860A26171DFCD90@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB17458B2705C43E860A26171DFCD90@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [E5pmyutdy+mwnKoYh9xatxv61HkPg+IFQChE1H2/tFXdKFmVgeGFNVxHBsPAECIi]
X-ClientProxiedBy: HKAPR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:203:d0::16) To ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:ac::12)
X-Microsoft-Original-Message-ID: <20201228055645.3666065-3-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc (2001:250:fe01:130:2110:d78f:cec3:aac7) by
 HKAPR04CA0006.apcprd04.prod.outlook.com (2603:1096:203:d0::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Mon, 28 Dec 2020 05:57:27 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 7f3458eb-0712-4858-d436-08d8aaf57547
X-MS-Exchange-SLBlob-MailProps: q+fD6XS3/UI4W5gxJ7aMBVnMbxNbPZnDQiDRL0dxvih6pz4BHG+zkZOL48qvsulrDAX1nNg+1Dj/sTNTuCGAKGlc81s1FO+MpYpTG8IxRl5zgNI6zafyk+U816x2Ey63dFGRiFDiOWSCxYOgbjX6fi1R0dnGuP6EYbbR+HnEQp7OV+fMuHGanpPUUpjizY/ccuri00kuXf0zbjmZdtqcoq13dbO0QOJi5AhvPHXWk50wo2LM2naGN9T5QQ9TQ5PWkzp4S6pYp3RZg0wuulCIQgz6SF2EeExH/2O6f+E3qZNh9fYzsljvg/7BNN/j6WzEIaWc+G0YYsOFSmqpSwWnTkN3wQ+EeuACjQJhthRld0pX33gSovsadcTbM+sQCJ2CLpAhk7lROPzeliu2ZSFmvgHExcXlBvpt/4gDAdTLuuaCyoHoAeuvFh3QhKKzJrjGUOuSDzsv1GGkKmYiCND0GdBs7ztKFACZUvGIpLQJa0nJzUvEK+LLTpuoCtMT0rK/yuSLMO4M+9KL/mAYzsVB/SKNv57Pt0B8TA0ZvMMjsosGx67A3dmNtUq7hxiPWyjuh7Hd39DvQzAGfwGdrQZ97bOu3NBRH/eAKWKRFxu+BwaHnQG/l0RudwJlh7Ve6S7vI7uw5LyWIydQ2jtSKD8Yvf8hikYLpHH85ZgvQu7XQ7LrxrA8PKBP9LMPlyuKj/Ap48TOQHW0vLF6jRq62x9B9Q==
X-MS-TrafficTypeDiagnostic: SG2APC01HT171:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y1PEe3/lyfbzJUc/Bt2UunptmCI5auL7QkGKXJs9kRqA6J7xelJOL/jKYbub/cAG53pAGIHOiNf81P8r9U+pcbOz8Su3llM53+4rgBmwjJF9iPA/bPCDUMfHRQZ4IfwQBoNGSB35i9fCw3AkGYUIaZDlqvd/OhC1+wxGsj2d2QCF86ljzkjWHvlMk9uvfq7wZOPz0a8HWyWUZGzz+Gk7U7WkaheEhyWLukD82HeRQFchwAFmFE8RxI36PyL8gfxM
X-MS-Exchange-AntiSpam-MessageData: +HjGNDgykJ+Cwx+bQa/VYkqlsMaXQhxM7HyiLLH3nmPLXElTeFyNFVynDgL1fGWUJRIKN2D32PPmjVkkRjukBUeHZu8GqHGZlX+wvRaHt/i0nqv+TYr/EHF0FCBmIOLM+N+hhaC6+RVrMl2eV434dTBOOjJECae+08woiqqZYlBtaSao109bacsbLnMFS/f1hYfaJ2FM+a8Nx1GVuWuCFQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2020 05:57:28.3330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f3458eb-0712-4858-d436-08d8aaf57547
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT037.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT171
Received-SPF: pass client-ip=40.92.253.38; envelope-from=Qiuhao.Li@outlook.com;
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
index 71fb0cef32..dd6eeb7258 100755
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


