Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E83782EEBD1
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 04:20:08 +0100 (CET)
Received: from localhost ([::1]:50448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxiJr-0000lz-WF
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 22:20:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxiHV-0007j2-FW
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 22:17:41 -0500
Received: from mail-oln040092254021.outbound.protection.outlook.com
 ([40.92.254.21]:12388 helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxiHT-0006Ye-Nb
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 22:17:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bS2e5Kr5rrtiXOXUEuZW5YE73a4752wEvtiRlvWVbxwwHZN1TxibP+PUXbZ6CydOpstXzGrplLS3/VB17ZqYj5PC8DBjvO6KEGpb9R/kMDdhsKIcchKJmKhHlThW0YY1XxU20YNhOJAxoZ5kXUrDBGDW3eUWvWw4ZMYIYpvpiRv+nKJamhEniGL/kQlpF8DKRuKvST4F4pEidbFIzaSOIEf0kGCGkhKS7qouTqayRldISOe8IJGAyTxWs6IwOk5BNvSCWlpZEdSG9wxiOQFljPWaAQSJCAw/rH017PWnSDYQwfNr7FkoGq9VMZDfiBtNVR0rgJiRAz9CBYOtUfeUig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKENgYp68QvNQvvkC4njciJp56uFN9Sn+k0pkFFO7k4=;
 b=VQuVhFOPPXTqNQGXByWz/frWfLqTtB3qy1WaTf1ahDfjmhowQEe67NPhhe3lXXpiSwO4hwoSo+Nn/McNOAvJZE6OyLH7C60XTW0NyJhE21MFbUA9++4LUrdDbBqBXUu94qOYdQe9a066iFZqwrgal9HCthClwRbfrIgjeXyLs7Cm+pTT4yxN+mCcoPX6kf0ZmbeBTuOSUBtNTit38O3hTqHmZzGlNRzAbdb5t8tgUs09/8TjNAhZXldCGuGwkdeNtWY+0rb8v9JiHXaRvSsRrbqDwSJIng6E0RgdlQ7rlt38dtNnFzZxbGNmEUH2LvY+9iCC/aQj5vsSstnpzfmuqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKENgYp68QvNQvvkC4njciJp56uFN9Sn+k0pkFFO7k4=;
 b=C1G8xk0569atUMz7SCXVLB9fRcX2Ef6Pn2trvY9VSf2ZaFQQ/O3I1zNdsNAUdPb5eDpTWTOKTjgXVzF4vv8AxGpKXSqyW9AAR2oH/CI6fINF9SEz6M3h2iQPd1gweiMy6ktD8LBZxiz0UMcdafaX25cij6E2zs9cDmSX/tW7O3Q0ffXu9reKbmwUpssPOXa+IJeDgdunHp2Zr7qNQb6hoWOLAa/729KbN5F2FnBACycdym9G5gJGMNYLKRgo1yjiegISyLqtYcxDnjEL9HLogbMDb9P2ZSdj99OVvYAJIQAm+djLU0WZ8MTDkTXl2Wwg5pppNlHd/+iMwsTYF2ilxg==
Received: from PU1APC01FT020.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::51) by
 PU1APC01HT013.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::65)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 03:17:32 +0000
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com (10.152.252.54) by
 PU1APC01FT020.mail.protection.outlook.com (10.152.252.217) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 03:17:32 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:6A8753D6148A7CE14E86801EE2973DA40A9C8EAE88117035E32F17E56E0AF513;
 UpperCasedChecksum:723E537076DCCB46EF5EE1C24F76A6015603332B4A642F7934AC71357BA0279C;
 SizeAsReceived:7654; Count:47
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50]) by MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50%7]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 03:17:32 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v5 6/7] fuzz: add minimization options
Date: Fri,  8 Jan 2021 11:12:48 +0800
Message-ID: <MEAPR01MB3494BC563DC50B2DC19D3AB0FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <MEAPR01MB349464ED835FE8243FB09100FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
References: <MEAPR01MB349464ED835FE8243FB09100FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [OIkhXUbajHmxNVz+fzVP2wZoIQxovwIyxHV/j2qKUf55KzLn4HfemS/2YAtGnBQP]
X-ClientProxiedBy: HK2PR0401CA0002.apcprd04.prod.outlook.com
 (2603:1096:202:2::12) To MEAPR01MB3494.ausprd01.prod.outlook.com
 (2603:10c6:201:39::11)
X-Microsoft-Original-Message-ID: <20210108031249.68381-6-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (2001:250:fe01:130:40a3:2fc0:cdf4:4729) by
 HK2PR0401CA0002.apcprd04.prod.outlook.com (2603:1096:202:2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Fri, 8 Jan 2021 03:17:31 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 22853200-c4cd-4045-dd20-08d8b383f041
X-MS-Exchange-SLBlob-MailProps: S/btQ8cKWiT4Pkfzu6B+gslsbaS+QpFwjCPv1UTKlQ1K/B6qAhWFSiQHjLV8IUnXDSGktGLf2dkVc2PDGN7npqzX8colgKjIKzvUjZ4iqli9CE/K8tZGA09NwTqaZaHdzfuaXgzIQFvo6S0QPTPZW4XMZ7rR0hPyd73Lg8JXiJFx3lhMywG+WhAR9i3EJCRhMp3OvGEEtUcPK0WDQTT4IZ+sNp+OXgnjqGE6lIqXzIRjtxg7ai2nfwDm8DpSxHts5SEcZ/Nzo0X8d/gZT1msjuCTGdTUg23vZxoZyyPxfjOHaB3XU+u0jE89YrwbQLVXm7foBClSvLqMFyuajgA1pWKJ3QDEsTT8k8wBka7tAqCMQu6duv3chzVE1PXee6mExvQruyTyWY4X4FJgl49gicDHY6k0ilB3l8QTpIUh1qNxRlQJB6wAwvtwTm/54QeyynO7XJTeNKtPXAIbSLdY6EDXYnUrVO0ZikRsYRgvGbhjRG0LurxLa2vbehXFgTTyFOj8cDJ4ulmBGcF7yYWbW40MWZqdzDi65rIuE+rNQqlA6BcF8CMW0xJPI2Fhm2LqfJ7uuuUCaOz3sCht3T7mVhzUq8F5eYJIbdBssU6Y+eTjayGUII3+BhNBonv9Au/icO4fGM7USA+YWvVO9zIAPnis51QjF1xllzW0mN5B1BowegZvg4DLI8W+nstgcomEas1NVFNuHMllBdA0giFfmjuFuwB53GjgFwRVB/q/ixJVdsJNVgaTX2u6mL+eR9nU5CDMmfVjVVA=
X-MS-TrafficTypeDiagnostic: PU1APC01HT013:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rBe3QR2o/uZiP1MHwK8nDew4B4hqI8iZmUHd/ayJ4khzH44mp5j6oPfxIdLlVQiRwgUz/HLSTBSSB+xoeWZQdAeLfEdq3UTbOqEz8jcQRbkmg4tUJstC6hSknc/cufr2UQ8m7z7MBaAoO8KJfibgcmhKvTMmHFlrXcFVM80ZodcGenRQFVdHTAiaIf4emnYEArVzEbTZ0IYeCApocPSXUYoFTNXf4QWiXH9xBzWKC539k5himqxo+kBdBa1wAhMg
X-MS-Exchange-AntiSpam-MessageData: Ch2v4zyn2ix9MOiIk+mjyJtP5agBAyxTnUCo2Z3ZSSo+f9ovyurZxpC2G3FIAexRDskmKAGTupp0EC4JJyekMYpRygPivInbRjSiOPlXmS+hGz6h/W/Ka4vvgYCqdgwmO5BTtiyUepO/hUmLt5SofwmnMPhAAMyfaYcoPqzNlAZubPDWR/9oHcLLl2bfLzzZRn29mka5DSCpHNW+77Y0hw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 03:17:32.5151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 22853200-c4cd-4045-dd20-08d8b383f041
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT020.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT013
Received-SPF: pass client-ip=40.92.254.21; envelope-from=Qiuhao.Li@outlook.com;
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

-M1: remove IO commands iteratively
-M2: try setting bits in operand of write/out to zero

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 30 ++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 2325b38dbc..8661116075 100755
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
@@ -213,24 +227,32 @@ def minimize_trace(inpath, outpath):
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
@@ -239,4 +261,4 @@ if __name__ == '__main__':
     #     QEMU_ARGS += " -accel qtest"
     CRASH_TOKEN = os.getenv("CRASH_TOKEN")
     QEMU_ARGS += " -qtest stdio -monitor none -serial none "
-    minimize_trace(sys.argv[1], sys.argv[2])
+    minimize_trace(sys.argv[-2], sys.argv[-1])
-- 
2.25.1


