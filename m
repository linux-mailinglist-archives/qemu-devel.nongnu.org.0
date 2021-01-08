Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAEB2EEBC7
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 04:14:47 +0100 (CET)
Received: from localhost ([::1]:37156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxiEg-0003dM-PI
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 22:14:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxiDK-00032C-0N
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 22:13:22 -0500
Received: from mail-oln040092255087.outbound.protection.outlook.com
 ([40.92.255.87]:45504 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxiDH-00050x-Sx
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 22:13:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iFCZtX8pYeTrQFyHn7Ozs/szymKSkv+Rj6mBkhWHd9DJYo4fekbF3XfskbKkvYlPxG1eH+2f8bm2gud5pKy8ssmy9qZcFfPMTif4enn3TbVJzffs33hIWG5hJ3zaqtX/HFNAAR07+grjVgRcfrlAyKvJ/RcNdgI94xmDtzoaUg6NOg4cnCWtV6mUClkUd8uq8bRmvUGzc039suGemKli0ALyUGQb5WtDR9nSmCMziqqCu0Urmf+Cql470z5VtVS2SwY52ZwXmsRom9gC/qaPeEYDGawOuMV3QuiAHUpJzUjPh+KP5gOlPt/XTZBZOvmClpU6C7ObV9JvhAlIB+S0Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZzMeIeF7oRU3rb2XxJOm5i+jO6buo3M4OPxcAAGog8=;
 b=GgfNDXAlV07YjZaGrzBknZgC4eOJBur3yO/QigTaSNev7MHrUTRMeuQfU0GkrRb6E9Ip/bD7kbt6X6AI4Xu2chS0s5eMHhzjwTQYixRZQ7okfiob2wL4Rtgkz3ijaD0CU4tGDNKpU7cSJfg6EVs16GU35t+hoSKwAgT75z6oeorAy9CXIPPWzUjy0wLPP7HhVmsubvizuLjz1HEHNWxMSNPrAWtrqFHBpBbBRXIb+/I094E5VN3chgR0yXspTdQUlD4ZPB2nMxsx2vyCNUNYIRxyPE6eBwg81i92FMwPes+W7OsoG4ort8FNdkbIKIQvJDUxsVVLotmJxybNN3M/tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZzMeIeF7oRU3rb2XxJOm5i+jO6buo3M4OPxcAAGog8=;
 b=Qc/eZkxCbmK34u+l7lKQ03bxmfHr645RLywmokn13B73Ar40y76fDeL8tDbBno3aXekVsDTNyHxa9KVrF0nzpP2DbCNOE5x3ggoy+v2clfvdZORFlTO2oZsfVTm4VQWxvy8q0wlGXcM3P3PB/6MlhDTIy+F/8+uBHR3WQbbzuPO/KyNROJE7HT2lhlyk6WHUAwDucT7jrhOSvLR7XjQEjEVoyBcW3tPVGAjGDWERptLqMUFoSkMe+uZDWfVxwAEft9Hv+AMRQ7P5qSx5CON2TMo3hT/ZsTgQGkoZUtGDOeW8VwQpp9wqf9Ma/SPdg+k/ZYpVTMyGZotydCYzC1RdIg==
Received: from PU1APC01FT020.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::49) by
 PU1APC01HT220.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::183)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 03:13:09 +0000
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com (10.152.252.54) by
 PU1APC01FT020.mail.protection.outlook.com (10.152.252.217) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 03:13:09 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:EE7FEA5B91FE485F0FFC4E7D1012ADF80D9811EADC9A4AB3CF863D61942E13F9;
 UpperCasedChecksum:E75E671473DFF35F3859F28D26AD28D5F92C4E0FC84D61ECE93D3D50B39DEEB1;
 SizeAsReceived:7680; Count:47
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50]) by MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50%7]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 03:13:09 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v5 1/7] fuzz: accelerate non-crash detection
Date: Fri,  8 Jan 2021 11:12:43 +0800
Message-ID: <MEAPR01MB3494019A5F569161A374B3DDFCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <MEAPR01MB349464ED835FE8243FB09100FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
References: <MEAPR01MB349464ED835FE8243FB09100FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [1Sq9Xv2xgljMRqMq+YO2bt4lij7OPtVQjwWEvNeDwNPtlFneJ/bY/zyokZ/a3Pvy]
X-ClientProxiedBy: TYAPR04CA0021.apcprd04.prod.outlook.com
 (2603:1096:404:15::33) To MEAPR01MB3494.ausprd01.prod.outlook.com
 (2603:10c6:201:39::11)
X-Microsoft-Original-Message-ID: <20210108031249.68381-1-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (2001:250:fe01:130:40a3:2fc0:cdf4:4729) by
 TYAPR04CA0021.apcprd04.prod.outlook.com (2603:1096:404:15::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 03:13:08 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: e6c7d8bc-7006-45ba-7c49-08d8b3835333
X-MS-Exchange-SLBlob-MailProps: pt8ZUcDWjMXXMqkvBjwk7eqI0ybQiCJH1ia8kS3e3N9rVdkd0tTxrmYAOqW+/rzyqC3CNXFcWHzXPzGit+tC3D39vUcmpc2VA1TN+S7418WsVYc1EdFOQ1At11WIa+WsCpZgTGY4SRShiDnFMAGK8zlKK45P1k0dlXjv00zcHdVNgqxlTEWrvYsGTHsbIJaNCDGFtjDQ1vSoaA1ROLeu3xkWdilkfNW+481Xx8wIEqUV0+uPdwnMTtiO1SZ7Y1CijzWdUhAXsLVtG17QcDlq6E6vEk3c07Qiek2N0i5PnHJo+JMrqlyuvtmKMzGXEcQiobKwGyjEpDflHhIpznc4t2vZx9D7tLuefDiXmOMF2adldTFkteu4l8wGyFf31w+XQhdrORr/XdKlkDBkzH3t36p639bmp79MWNWuOiyx7Rx3ls/N+y39+prcXfJ/5T/YuYvYw+uH0eEutN1Q2SCqrW5Yr1ouzCB7zpN5ZUl50YJINxZyiLn/j9bM/qjCO0JfL+zFK25ESE5Rlb2WzLPUVEw3qQcQcKSoqlehBq6k4/ELsnWa7tzg2je7V5/fg6spFJGFLktxGN7BAzF5s+XSe/ry7l5+ImscGGfiYgiLgroVfBCvcr8t6H8hjD2F+7jfb8/HiG+gO5vWmZclFWwYN4o0Qy++xrlPsd6oDMqhkMljnwaeer+U36CVmxw2MVulysQguPgMF0u0qvpk1jHsHSEGDpfqfNXGxOuFosCfSE8MinHBLOo8puTq1nHCiEXq2Qt3gB29kY9fepLPqvVyLAuz1+NDzkQ3+jkpPFbgem1+KS61fab+4DVdY9hjKQctW96A0fvlOhjAwoF/U+0m0BnNeBdchC3W6RT7z91fF/baweMpkmMN9CQOhw88g4wq2crZfLIGkGlfCsKY3swB6VAodacwr5DYpmf1DLsoaNmlYkm9Shnq1ggrPcS9Fb+9
X-MS-TrafficTypeDiagnostic: PU1APC01HT220:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sNzumnBHOW6yD6TkqCnE5dK1MujpusOWfhhRz3a1kZXSn05pB1nyZjRqRS4jXEm5mZ/yQU3sBjUehtOasZuFuwvMQHUJZlJ7Vzwh2J1NAm2IllQpxURq2e7aEg6XV0KJWIrXWUfzlJ+sg7SeeuDIIDQdb9X0juDjC19TL3YBMALvZSTarabY4IcaKocBuF0S3dkhaEnADMoGYjMpyII+uWAK+3XrVDe1zA8zYZPvxdA6OXOTp22JTZoZEdOIlE+YQk3U45Mjf+B5mUv27AOU2ikik4sNVYXBpxMXjtiGdTc=
X-MS-Exchange-AntiSpam-MessageData: S0qjOrMpjhtYvzYP3FQ8KeyZmtShgKh3jaFDQeNNEn9MLexFrdhzvzirjrcciat5lxxRSA+XFRmxzR4Xw4biZ/FFRS8ZDC2Jcn5yncPTqYfUpDVj8X1K8cmog4MB7/HlW/rhjHcb6emBGNPYBA4Xx4skKKItTaWPn93o14A2gB4oOtPmNh6SYNgkL+Zqi8mhTXRK+mS4qnaaxnHA5iTcWg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 03:13:08.9806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c7d8bc-7006-45ba-7c49-08d8b3835333
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT020.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT220
Received-SPF: pass client-ip=40.92.255.87; envelope-from=Qiuhao.Li@outlook.com;
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

We spend much time waiting for the timeout program during the minimization
process until it passes a time limit. This patch hacks the CLOSED (indicates
the redirection file closed) notification in QTest's output if it doesn't
crash.

Test with quadrupled trace input at:
  https://bugs.launchpad.net/qemu/+bug/1890333/comments/1

Original version:
  real	1m37.246s
  user	0m13.069s
  sys	0m8.399s

Refined version:
  real	0m45.904s
  user	0m16.874s
  sys	0m10.042s

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 39 ++++++++++++++++--------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 5e405a0d5f..57dcaaeba3 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -29,8 +29,14 @@ whether the crash occred. Optionally, manually set a string that idenitifes the
 crash by setting CRASH_TOKEN=
 """.format((sys.argv[0])))
 
+deduplication_note = """\n\
+Note: While trimming the input, sometimes the mutated trace triggers a different
+crash output but indicates the same bug. Under this situation, our minimizer is
+incapable of recognizing and stopped from removing it. In the future, we may
+use a more sophisticated crash case deduplication method.
+\n"""
+
 def check_if_trace_crashes(trace, path):
-    global CRASH_TOKEN
     with open(path, "w") as tracefile:
         tracefile.write("".join(trace))
 
@@ -41,18 +47,28 @@ def check_if_trace_crashes(trace, path):
                            trace_path=path),
                           shell=True,
                           stdin=subprocess.PIPE,
-                          stdout=subprocess.PIPE)
-    stdo = rc.communicate()[0]
-    output = stdo.decode('unicode_escape')
-    if rc.returncode == 137:    # Timed Out
-        return False
-    if len(output.splitlines()) < 2:
-        return False
-
+                          stdout=subprocess.PIPE,
+                          encoding="utf-8")
+    global CRASH_TOKEN
     if CRASH_TOKEN is None:
-        CRASH_TOKEN = output.splitlines()[-2]
+        try:
+            outs, _ = rc.communicate(timeout=5)
+            CRASH_TOKEN = outs.splitlines()[-2]
+        except subprocess.TimeoutExpired:
+            print("subprocess.TimeoutExpired")
+            return False
+        print("Identifying Crashes by this string: {}".format(CRASH_TOKEN))
+        global deduplication_note
+        print(deduplication_note)
+        return True
 
-    return CRASH_TOKEN in output
+    for line in iter(rc.stdout.readline, b''):
+        if "CLOSED" in line:
+            return False
+        if CRASH_TOKEN in line:
+            return True
+
+    return False
 
 
 def minimize_trace(inpath, outpath):
@@ -66,7 +82,6 @@ def minimize_trace(inpath, outpath):
     print("Crashed in {} seconds".format(end-start))
     TIMEOUT = (end-start)*5
     print("Setting the timeout for {} seconds".format(TIMEOUT))
-    print("Identifying Crashes by this string: {}".format(CRASH_TOKEN))
 
     i = 0
     newtrace = trace[:]
-- 
2.25.1


