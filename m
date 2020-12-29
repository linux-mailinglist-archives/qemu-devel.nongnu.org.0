Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6AD2E6D2F
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 03:13:31 +0100 (CET)
Received: from localhost ([::1]:39520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ku4Vu-0000iv-M9
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 21:13:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku4RX-0006c9-Mp
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 21:08:59 -0500
Received: from mail-sg2apc01olkn0806.outbound.protection.outlook.com
 ([2a01:111:f400:febd::806]:29504
 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku4RV-0004vy-Le
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 21:08:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oAhrRWXFzIlwf//0q2NBvQ2NER902h2wSUCV0Sn/rWNZXjXpOGIuxSQTsOqKwZIwNybYNdaFL7OYebjFynEXGv5Pry0+RfIPulPHMBUN+D7b0CJenjF+3nz6DukRRF4CgZquSYUwrUMK8OSSn5UXdJ3rAD1h/QWtkZ5J7VNUdjb02D5V+DAXD4+GhZ05Ht9cubIdvgEeo3Y0UThFWYC7OV5/7NpTVZ8YmjCbl3MxF6DA6dHiksha/i1qcHofqre69phfucO40+GWVkVcsIbDD4rfshSzXAGFhqHp/q+H3YsIAoRjYtdTYQsg43kIdXZFYjkmvYgdDcIHrL4o+wtm9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7U3CWaqO/4BtDRpqyPH43l5mb6QPlr2k1azwmdY/YQ=;
 b=aS4MJKD+C7qV5oSg40jxKhyaLtrrKJPKN0EldejTPF3VE//tUtQiQcDLEqwI0MGC3KDU1jMBAKkwFLMLPAw2xVltkVyOE8d+iPNILIiCv137Nk/QJYJm+k+eciYZ8N0c0dFRIIRtKpFtuIbRquUhm1xc2BrDAe/sk9qfbxEdxhmcUbPBtGUePtfeQurBTXC+x5aKSaAwReZDJGsgJlQzVX+66aEAmchKkuTzPwhoCN5UybCsOuMFxDS7Tio2t8p/eOvUafn98YSKAG1gFJEhbwDyPlBElEPMPdfQqtxew3DF0S6NkvxVSGfsDIaQQKRq7vHGzaqsQKD7yvGonKpYxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7U3CWaqO/4BtDRpqyPH43l5mb6QPlr2k1azwmdY/YQ=;
 b=Cex+YShrGlfcUsSZp/mDvYAMS5zR2Sff45EtMRDlStnt5hRCHd5nTkUKuitinLitLgCmW7/24gGGwqykcIrCms4005LKGwq0N9WkaVsjdZ9Go62c6v7OiA+9qf/QJQw/t2NZrBW2gO7OkCSNixVeAR/nJvC9MSmUEK7xSXxXOsDuthG49JDhg8AGjdrt+s9jZRofRMjFlWbrllDvkKprJR+qJouVNIqr18RT8SwcZpsUKGmw5EoLJhaWT8UoKq+qm23J4E/hI0uzp5AZ3TfZlOyo+KTzeWeQzz5POBlt4k7u5RLOwlFknHthcptaKEMaHONtxEuS7tHK16ezJ98ing==
Received: from SG2APC01FT031.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::43) by
 SG2APC01HT132.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::327)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 02:08:44 +0000
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM (10.152.250.54) by
 SG2APC01FT031.mail.protection.outlook.com (10.152.250.217) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 02:08:44 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:A23BF56173FA894D98ADF3C0D1B537ADC2DACE49DF7EF41EC65AC149F5088129;
 UpperCasedChecksum:2D34FAD09947DDFF1B269E50A90F35FB82673C70665439967AEB6974B9E19F85;
 SizeAsReceived:7659; Count:47
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e]) by ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e%8]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 02:08:43 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v3 3/7] fuzz: split write operand using binary approach
Date: Tue, 29 Dec 2020 10:07:09 +0800
Message-ID: <ME3P282MB17455318EE8F9BEA2BCCEE36FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ME3P282MB17451412C0E506C9D5108B35FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB17451412C0E506C9D5108B35FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [Ki2dXBq8Kr57lj1zjnLbKi7Y4V5h8fcsL1zbSImct7b1VIK0/aXC6ts2+5vGZB9X]
X-ClientProxiedBy: TY2PR06CA0035.apcprd06.prod.outlook.com
 (2603:1096:404:2e::23) To ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:ac::12)
X-Microsoft-Original-Message-ID: <20201229020713.3699486-3-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc (2001:250:fe01:130:6d26:2348:77a5:f7ed) by
 TY2PR06CA0035.apcprd06.prod.outlook.com (2603:1096:404:2e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 02:08:42 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 3eac7cd0-f20a-496f-7629-08d8ab9eab28
X-MS-Exchange-SLBlob-MailProps: q+fD6XS3/UL0qSVcdtWiVVAkKoUvAbii0xe3FHCeLW0TeyiMgvgL6dlW32U6T7tG1N7eM6Gf2RUwKSh2nqPJHpLX4Hrd9TFKNEvDw/PfoO3oZjxfPdXUFOz3Bq6T8jJUVJM8sVX9fJtGaW88oEsxT0TBX6BzA8MLIttMozItKIou5ci3n6Fs57HqZ6O4KAl7CnumDLtxGKC+DkJJL0FnPXun6vVYAK71Rh0fjlNQw4e07r2QrXLSP+q10Kt74Z4eORFH2n5C5mbue0Gwmh7Z/RwvKCYlaw+AayPxKmM1JYfyJvd5Dw0VKDQpBx9rTuj5uOC9WwSad3kcazcwER+gkbdW7b7LhSWPIIt91iW/WQa8MNrkDoX7iR/HvJ0VEjwgdUWiuQhFW9au0GdZus9zf4IhovbjGVsy2vGHx5bm5UL4k9knt6E14VThiTd5saVyCX/rZaPVQpJvHGnT9M7mWcC8KBr5lDoXRiSgGQb4w2AZ7xDV0SCEldmrZsaWteXDbNtICDFGsXwZxzTrzU5KciRqZGWjsYm/iZwnrbKcxnKlk/3qfan+pa3VJwdZGFYKwV21vQdsFp0KVp/PbHu+hz3sxqwyp4zqujR70ja8p2krkbz888FZpdUeUlltaUjhdZtt3Ka6OW2LUaQ0zwtNT1X8/ixTAI6/UFkaLCZieLEowVd14Xs5myoK7kvPcmncu7p5KuDG+0drZTwKbgnpFQ==
X-MS-TrafficTypeDiagnostic: SG2APC01HT132:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /USMIt+YwPpxNzCIYZkY5lhFxL1jSiVJ5kn2jT58pbRKayBNf4v7JSzSuX9bb8dc1AWNtToDRdzwF42KSw3m65h/YorBZqSo2hcIKrBP+x61ezNd+Wjw/O4y3OqS3VL5xOHS8KQYYQV+vsYh74DmRVnYTk+CtPLx7SL+myoG7F7cIAb2B4Ym4eGsh+rXZUl7TzSlyIHeQHK7q/lm+HPmlrPwPLYeI+jsGpG6Y2EwMDTHsnBjA11oQol4AcJRPmeI
X-MS-Exchange-AntiSpam-MessageData: jzv4wDCgODqmOSg1HX0KTi54Fcuot98m2jvTqVplA7Ue6D52WpvxvzGfG/O165oxJpr2zpenU90bVgrAuebI77W+FgxdysFO4MuGJU5k/g3/C2INo9a8PI3aeB/BkBr6QR+eYrJMmPlgrCzzl0ZZSfF+Oo8Qjbuh0Ef0DVU8oJ1PGBX7P+EVAILwodOCn+AMyXUZMIfCKE4EUuWwxUBCvg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 02:08:43.6866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eac7cd0-f20a-496f-7629-08d8ab9eab28
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT031.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT132
Received-SPF: pass client-ip=2a01:111:f400:febd::806;
 envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-SG2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_PASS=-0.001,
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


