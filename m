Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 369602F0CD3
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 07:22:34 +0100 (CET)
Received: from localhost ([::1]:44120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyqb3-0001hZ-6W
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 01:22:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyqZp-0000w8-3D
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 01:21:17 -0500
Received: from mail-oln040092255087.outbound.protection.outlook.com
 ([40.92.255.87]:59712 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyqZl-0006up-ND
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 01:21:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9BClFyQR1nX46ci9AMj3DJPU4kGwnRt3AxIC0iD+cSA6r1ewVHDjvV8Bs0rgirW0WjaSxMi63ZDf9WBPMsFnZ16yMyRBNySgo96Nrche3O9Q97B0y0XgJyMEb86lKHo0KEO590/SKN4X0QwmHXAytk808j+yvxSZpM2dHRX/MZQ4moynIzd1ykPZ2gzPJunhhrX17DHexlWERiG+Xs4U7zsv8rANKDwO1DI5r4c8c+9s/oFoxWpy7WMLfi6ZRT/aM49n4q7psG0Tqx1RdBPC6LfE+i+p7UWFOxgt+4GwkuXQtAmKkb2HSoa6QSlN5zUU6vNtlLn7TglI+Vgtvoszw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gt4ZDE1o6MqlXqsPI7Z6ZyMUqy8CaNUyoKoTehZjR7U=;
 b=AkFDUmVtgZ9evWn1jE7b7syagqij1HVPV6uDno+W/7RRNcRddEQVV9H+u8YjsOs/Lj+p9lqSOe1mMublaw5vus7YRBbdXEPChsOp7wX6bWTiuOR7tpe0A4amCvBSzl6m9CUL+YQGDNJncEhl+pNsJlvAlQexXgNRJMW6aVdCT6CHkVHEIkt6jbFiNsWlesHguhsPEWuvN6uAUGAnZWZBCkVLV25d/bxnUfDs2GYNChmjC6m0Gct/09hvdjWB2Qrb86fSTOeKAOAiUfzdTGKtzAziQE8X4SuNwPAh2X4w95+xjzfR2iEGqYHjvq2UISndgnBdjjcvY8fmTyYOnVy7kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gt4ZDE1o6MqlXqsPI7Z6ZyMUqy8CaNUyoKoTehZjR7U=;
 b=dTSq2Sf7UrILi4hywjO15zcXL6i7EZjq7/NvmGS7Qf0I9H4wf23ibJ2mjkTnFr29Lhh/7Z2Bva2nd/8W+Qp1qtWlRCFPEnhMIWBPRIBzLxO16lYfr5ZmKx81e8rF5WGKkpniE58UNi8n06XFHpc3hA+iiNTvW70JkUCDTVvJphBy+X0NOnnUcNolN7ucdZ952CANLG1wqXL4dPi/9dgt9N2lvNm1SPyulbhtrXTGaWPgwsLR4eMsUqnoEdFEpM4kekh4mEAoXGU0lShxUu3tUDkhTgE3AztghltGdcwxRtZUNqAciupLMteXxMDXelR11LBwOWtR9WxlizX1dL4QIg==
Received: from HK2APC01FT115.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::46) by
 HK2APC01HT013.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::158)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 06:21:06 +0000
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 (2a01:111:e400:7ebc::52) by HK2APC01FT115.mail.protection.outlook.com
 (2a01:111:e400:7ebc::194) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Mon, 11 Jan 2021 06:21:06 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:38E3E9DDECA07F4849FF7EB97D5AF746305AD67177BA1F7CA52394682C776265;
 UpperCasedChecksum:39F9B02A09D1451E0D20A02DED2978FCBE158C052906D2ADE445B9AEEBE011F5;
 SizeAsReceived:7568; Count:47
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780]) by SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780%5]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 06:21:05 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 6/7] fuzz: add minimization options
Date: Mon, 11 Jan 2021 14:11:51 +0800
Message-ID: <SYCPR01MB350204C52E7A39E6B0EEC870FCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <SYCPR01MB3502FA4DB12C240DD3CFF1E0FCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
References: <SYCPR01MB3502FA4DB12C240DD3CFF1E0FCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [JBjYg9jE4pd5LGZAaqtfUUhdpT97awTG]
X-ClientProxiedBy: HK2PR02CA0141.apcprd02.prod.outlook.com
 (2603:1096:202:16::25) To SYCPR01MB3502.ausprd01.prod.outlook.com
 (2603:10c6:10:3e::12)
X-Microsoft-Original-Message-ID: <20210111061152.176206-6-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (111.176.239.56) by
 HK2PR02CA0141.apcprd02.prod.outlook.com (2603:1096:202:16::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 06:21:04 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: f0131898-9cd5-4604-2bd2-08d8b5f9136e
X-MS-Exchange-SLBlob-MailProps: gjx25WM8ZNWt8qMG3IjM1tewnTO4qKhayaN+CsK5UlmUTZIGraRzzEmUxzNQJ10wn9aGyjdgOLw2w+T2bIv3EAbziqhoRnVxnZUz6GZkZQtfsvhZ5Y5ygyB3bDezhkh0KR0L4bn2ph/DlnbtR1tY/lYydPfhvpO2XaBSbL6oo05tD7x1eqFyiTOjO2se46t2OipKSk1H05AI+kmBB/5+T4MqtdR2VbUmnW9FRaO61ainCn+tQI2ocRNPfnK+KhomFkpi7c2HosqqX4CyQafXTfVglfHL+3Jr1f7guhMto8Jp82nnQeBxR7E3b8V4FfFUhK2HncKDP5FTuQ7CvNLYLeliyAyFjabwHNs+2FnslkRTpNdNCaZYWWif6OrRKUPCVSC10cm2jZs7q+rcXl4YgmYaijlWXjB7xba6I6gU2RDPa+1JApdFPKVSmjtTUxB3eiCtSALee66/qt/5SXQBMcFh64+0/AUH020jNgCxo3URTkL3HVpiie+x/7y7oCDlqS7yIC9QAMU+GZkjDHwd7rP++7V8sjm6PNewGRzKkTi4ofvGYAglDlab6jsuNHyzhph8pjihg2EQqCVR3fZ+MUgsU4B23zQunHlQc0eCd7socQ0h6/MlCK5AFJAK+bhNZ7LMmLc6ALgUSAU1OwetatgEhDpIW7An2ZJj7kXEpZ0gmy3Wnf2i0D4Lc0EFbz1XlGYd6nu1egVPPgdzzMae4gAWAfTnv6+VytvcykDCi/4=
X-MS-TrafficTypeDiagnostic: HK2APC01HT013:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6ORWWo7LLATRyox9rW6DSvUbg+S+xZbAOGEH5siDUqm0N4ivIkMjJGgdcXUAipIQaxUW55RN+dX0LnB0kCzXhav3hlKdFmpBif58h5/r50iFGSzzNPiZIrlu/Q663yJrYYwNbdIFk0GJCpkFV/LdM4gEDNkwsm8yaIXlqd2SrspEVAcZhgehHRHSZ7wTlrMVuZuYAW3M173h5z5QL3+QiltCCbJNwiNmhiDWEcPTuJA0aiYaJ9IJ/ywhu3hb7AzG
X-MS-Exchange-AntiSpam-MessageData: b2KJw1vsXR0DVAK+tRyhFFIha9nsvWa4kI9i/a0e72cNQEPOuNftQsVAqu731TRZ2ME0qTc3em5mP9q+giq+Dk3EY87hqMnW8Ynsoi79Krv4rd5W6RYD2PhIc5xjMT8JPIxBHZqI72cHh2nXMBIitw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 06:21:04.9457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: f0131898-9cd5-4604-2bd2-08d8b5f9136e
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT115.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT013
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
Cc: thuth@redhat.com, darren.kenny@oracle.com,
 Qiuhao Li <Qiuhao.Li@outlook.com>, alxndr@bu.edu, bsd@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

-M1: remove IO commands iteratively
-M2: try setting bits in operand of write/out to zero

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 30 ++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 219858a9e3..0e59bdbb01 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -16,6 +16,10 @@ QEMU_PATH = None
 TIMEOUT = 5
 CRASH_TOKEN = None
 
+# Minimization levels
+M1 = False # try removing IO commands iteratively
+M2 = False # try setting bits in operand of write/out to zero
+
 write_suffix_lookup = {"b": (1, "B"),
                        "w": (2, "H"),
                        "l": (4, "L"),
@@ -23,10 +27,20 @@ write_suffix_lookup = {"b": (1, "B"),
 
 def usage():
     sys.exit("""\
-Usage: QEMU_PATH="/path/to/qemu" QEMU_ARGS="args" {} input_trace output_trace
+Usage:
+
+QEMU_PATH="/path/to/qemu" QEMU_ARGS="args" {} [Options] input_trace output_trace
+
 By default, will try to use the second-to-last line in the output to identify
 whether the crash occred. Optionally, manually set a string that idenitifes the
 crash by setting CRASH_TOKEN=
+
+Options:
+
+-M1: enable a loop around the remove minimizer, which may help decrease some
+     timing dependant instructions. Off by default.
+-M2: try setting bits in operand of write/out to zero. Off by default.
+
 """.format((sys.argv[0])))
 
 deduplication_note = """\n\
@@ -216,24 +230,32 @@ def minimize_trace(inpath, outpath):
     print("Setting the timeout for {} seconds".format(TIMEOUT))
 
     newtrace = trace[:]
+    global M1, M2
 
     # remove lines
     old_len = len(newtrace) + 1
     while(old_len > len(newtrace)):
         old_len = len(newtrace)
+        print("trace lenth = ", old_len)
         remove_lines(newtrace, outpath)
+        if not M1 and not M2:
+            break
         newtrace = list(filter(lambda s: s != "", newtrace))
     assert(check_if_trace_crashes(newtrace, outpath))
 
     # set bits to zero
-    clear_bits(newtrace, outpath)
+    if M2:
+        clear_bits(newtrace, outpath)
     assert(check_if_trace_crashes(newtrace, outpath))
 
 
 if __name__ == '__main__':
     if len(sys.argv) < 3:
         usage()
-
+    if "-M1" in sys.argv:
+        M1 = True
+    if "-M2" in sys.argv:
+        M2 = True
     QEMU_PATH = os.getenv("QEMU_PATH")
     QEMU_ARGS = os.getenv("QEMU_ARGS")
     if QEMU_PATH is None or QEMU_ARGS is None:
@@ -242,4 +264,4 @@ if __name__ == '__main__':
     #     QEMU_ARGS += " -accel qtest"
     CRASH_TOKEN = os.getenv("CRASH_TOKEN")
     QEMU_ARGS += " -qtest stdio -monitor none -serial none "
-    minimize_trace(sys.argv[1], sys.argv[2])
+    minimize_trace(sys.argv[-2], sys.argv[-1])
-- 
2.25.1


