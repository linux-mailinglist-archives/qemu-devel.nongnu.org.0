Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C462F0CCF
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 07:21:31 +0100 (CET)
Received: from localhost ([::1]:41404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyqa2-0000OT-GI
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 01:21:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyqX3-0006tm-To
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 01:18:29 -0500
Received: from mail-oln040092255071.outbound.protection.outlook.com
 ([40.92.255.71]:64339 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyqWx-0005WG-Ii
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 01:18:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fd601N+QLtzvIExLfpxD9uxD2tye642uDuhnc4zy9HLB2wx5UTi4yBzK+MbwcCUCil6pLVGaePYJNMOXAYg8CDodXqHIuYjNQE4RQ8FlEWVToGGbLtwdmvWZNQGj1UTdqqhlo6u5a45Bd/Ye2mfySh5LKOBBa9oi8SonhrPlL5hIGc7zB/KkdZ5DyjJAGFxwq7cpaTFupjXObJX408ZekyAQZl6W1IPSTWEPa87CFF4PGKWWQYkogKZx5CsCBCBElOjcNO+ohemmzn8R5YCDEckaPWizZ1NREwJZP77ZlBrIzeov6YNbmIpzVDe9iXxiZRceWDXSpnRrxa1lPQZXmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CqrkHd0eGJi/nkPBCL2hDvMALR7Y/Cl2ck11Bv+VI0=;
 b=Ad7DD/muG6WTyNYHdCtrvGnoPlzLioKkCBSLdqt86OuTCbjGEHsNEi6KkKmE06EL/PArKDi07KxZdQVu8dh23hhEVUX3nCq7yatJEhNjQO5cpbQT1pZKktnj1/cVXIwxpzTtVxse2WhzkSD6zQ60oXYNEtQAGIxRjqU7SDNS+mySaNb56uRvOqOsyAfgTiOG0VKCNUUV41/MFp2MEf2U4IC0Q8rvQqas1XwG4ld4FCqhNLQ7G/QMjGEdn6WZEC0vm710XYbVIfmaLpi5fD6mxx3BflIpp61uLaeRxysqOFoxPK+0Vh0bNB2fWzJFdPZGMMtHPGknBJHbcSvBxZNCxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CqrkHd0eGJi/nkPBCL2hDvMALR7Y/Cl2ck11Bv+VI0=;
 b=o/+xJrdDR98O6eWM4IccUj0h1lzU5fy854wOCbvMGx/TTlfNx17elqSO83/C3xPyrdaviVRWC0nSJg7iVA+valGk+971JqynnJeJ6DFlGrqwudIlqzmpkNIcECAhs4MNwFjvLHkPV4Fy5uE3R6Gc8yetNPsqgakGWBRWu93RiMk7BVZAP7nXB9nke5EmLft0CeG4Z2xGMf6GXtkxemeKbSFT+Y5nm8x8gh05/cBjEWAINVHfk32gKmZ0ctORJS9XvhuYaQA1k9X+2PKEz4Vunre8x9AeL/UXoBG5P1ZFUeUwHS21KRu0JRjXI9yL54krwFCuauMbU8lMLen3RqG1XQ==
Received: from HK2APC01FT054.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::52) by
 HK2APC01HT223.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::427)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 06:18:08 +0000
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com (10.152.248.59) by
 HK2APC01FT054.mail.protection.outlook.com (10.152.249.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 06:18:08 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:BE2E455D28BF8F94C9F00D8878581B83F4E3271B3F2D4CDDAABC00DF42174C43;
 UpperCasedChecksum:BA126988ECF333439BA57015C1B77A87080EDB6A7E347E1C586BF8F6300AD4BF;
 SizeAsReceived:7565; Count:47
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780]) by SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780%5]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 06:18:08 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 5/7] fuzz: set bits in operand of write/out to zero
Date: Mon, 11 Jan 2021 14:11:50 +0800
Message-ID: <SYCPR01MB3502C84B6346A3E3DE708C7BFCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <SYCPR01MB3502FA4DB12C240DD3CFF1E0FCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
References: <SYCPR01MB3502FA4DB12C240DD3CFF1E0FCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [dzGac2B9Q3Wa/xd7CZ43t6L56tgbUBB9]
X-ClientProxiedBy: HK2PR02CA0130.apcprd02.prod.outlook.com
 (2603:1096:202:16::14) To SYCPR01MB3502.ausprd01.prod.outlook.com
 (2603:10c6:10:3e::12)
X-Microsoft-Original-Message-ID: <20210111061152.176206-5-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (111.176.239.56) by
 HK2PR02CA0130.apcprd02.prod.outlook.com (2603:1096:202:16::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 06:18:07 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 6b36d934-266f-4796-bb22-08d8b5f8a9fb
X-MS-Exchange-SLBlob-MailProps: S/btQ8cKWiSygBPrM25OmKOGXZqaBnYpENrsmetjiDeaKCJ9y8q4OXZMpEP2LUnAKnE8ZcgunSfmaxOOZb/XinlTKXv+0RvtwkAleryuIkpznu3RlUwC/OKttI8b5lSm2IaKPYAUUHyTGNVfeRdFp7iUsFXfmQKJcrkj85aNrG057XvK6ex4Hq+nt82xjY9duqCdWy5e4GbNoVASTVzM5fTcaRdrWReRIi61cbOkbrimpgZgEG/qOoz7opElib/hKVK6c+HeJwMRO431CPfhZ9PRyrMTGuvU2HvQ7Olln3XAAFptNwoQ+GBDSSmXlWa6UDsTLpVJH5n/mrQZLamjNroIx5C0+rKruAoA1sgLPwW/rOndWYoUygTAgXvqFI8pDteAilnPVOBv7GTFwFtdzfv2B03y0tzoApY/C7uWF3cc2kGSfk22836WaXZ4vaL7AfBrBG47fm+97IzRfyXdq/OFzUa5QjdqAhyaw8HzooaC9bsd+kS/3NyNsyDS6vVla/MxqtXIGIjHUQXee62m1MDpbIq3qHglmd/nKR6cPOTZY3fhnLgbqz/plo6HbyCgr8T6bxVvTE/6f3wlNrOJIjijp51IzFyGsHtHFJv7sY+mU22A7HtyEZF/+iFubMIk0jynjpJ7klROwHfY/Ga55pG38xwIM1OSMzxlQTFcEKWh8+scGmjO3RmNap0Dgg+H6SKsmDUhc05oMiLtBB1N/P0wUwUlLCjGiOSFXzbC8Qi7Tx68JRws69oQADmrrvDeH6KW2ABRid4=
X-MS-TrafficTypeDiagnostic: HK2APC01HT223:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8+Ddcn/Uj7NC1DJCUbBDWVhgdYkztad9It6DmeJvHEQM4NS2YE86cY0g+IDeZJ0rv2d0YSXwDYKUS5vDQIdQoZ1RJpiy01ngp18WKkyXjL/RzmDY5Uq/eAFBlPsHvOvMGxLC+/lnGkCv82scInIohmL5kCdl5AuqICUY3GdZCkfAHBw/S3JE0AHrMo5e8Eely7k+rHu7AmK+z6psxSRp+WsxwpEuLNI5bQzhyUJ2Pq+Pm1QUBdWJbrWjLefFCyZq
X-MS-Exchange-AntiSpam-MessageData: RNwkUZhsFYeIUfKrgN+unia+aG40ySY4mghFduJbggVaNCZsV7FqiMUf+JcM8uhlaC6kNUvtqyoDuzuBpB3RC+LueEg9/Au2nHL/nqeolKzZ+WH05cTMFoSvDnySow2wSraF9WFaNr+qx2cGDOP2VQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 06:18:08.0249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b36d934-266f-4796-bb22-08d8b5f8a9fb
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT054.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT223
Received-SPF: pass client-ip=40.92.255.71; envelope-from=Qiuhao.Li@outlook.com;
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

Simplifying the crash cases by opportunistically setting bits in operands of
out/write to zero may help to debug, since usually bit one means turn on or
trigger a function while zero is the default turn-off setting.

Tested Bug 1908062.

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 39 ++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 59e91de7e2..219858a9e3 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -167,6 +167,42 @@ def remove_lines(newtrace, outpath):
         i += 1
 
 
+def clear_bits(newtrace, outpath):
+    # try setting bits in operands of out/write to zero
+    i = 0
+    while i < len(newtrace):
+        if (not newtrace[i].startswith("write ") and not
+           newtrace[i].startswith("out")):
+           i += 1
+           continue
+        # write ADDR SIZE DATA
+        # outx ADDR VALUE
+        print("\nzero setting bits: {}".format(newtrace[i]))
+
+        prefix = " ".join(newtrace[i].split()[:-1])
+        data = newtrace[i].split()[-1]
+        data_bin = bin(int(data, 16))
+        data_bin_list = list(data_bin)
+
+        for j in range(2, len(data_bin_list)):
+            prior = newtrace[i]
+            if (data_bin_list[j] == '1'):
+                data_bin_list[j] = '0'
+                data_try = hex(int("".join(data_bin_list), 2))
+                # It seems qtest only accepts padded hex-values.
+                if len(data_try) % 2 == 1:
+                    data_try = data_try[:2] + "0" + data_try[2:-1]
+
+                newtrace[i] = "{prefix} {data_try}\n".format(
+                        prefix=prefix,
+                        data_try=data_try)
+
+                if not check_if_trace_crashes(newtrace, outpath):
+                    data_bin_list[j] = '1'
+                    newtrace[i] = prior
+        i += 1
+
+
 def minimize_trace(inpath, outpath):
     global TIMEOUT
     with open(inpath) as f:
@@ -187,7 +223,10 @@ def minimize_trace(inpath, outpath):
         old_len = len(newtrace)
         remove_lines(newtrace, outpath)
         newtrace = list(filter(lambda s: s != "", newtrace))
+    assert(check_if_trace_crashes(newtrace, outpath))
 
+    # set bits to zero
+    clear_bits(newtrace, outpath)
     assert(check_if_trace_crashes(newtrace, outpath))
 
 
-- 
2.25.1


