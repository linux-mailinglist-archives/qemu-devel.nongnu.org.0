Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7611F2DF131
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 20:11:52 +0100 (CET)
Received: from localhost ([::1]:40780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqhdv-0002hI-Fb
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 14:11:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kqhPZ-0005sZ-Vw
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 13:57:02 -0500
Received: from mail-oln040092254092.outbound.protection.outlook.com
 ([40.92.254.92]:24149 helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kqhPY-00055L-1i
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 13:57:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TV1aFEgxhcXznb1RWUmUrkODbVWPkL68Q8ORmH8WCjxUyderc/T9sRAXYusbwILACa1kd3Oa6xj763whIJ5quqNwyyZAqzjWsxI2QkYrfdu+OGi2nIItQTd/1ZXer5lAIDdjxGEg9tdt985m/ah6Iw0hmiu5XpvDE/pLdTVHXJUj0TyjV5HW0HV+y+rhpxY62GeNFN9obt0AWLSexjxjwPIf8y6hXpNlNrd/GqPx3BO14K78N4o4bCA3EAXlHGazNNI5iJwsqpa+UEw1vSHb2ynUOTmegCfpug9AX7r7dS9q01MU/po/nSj9CeZRQR+I1AVCLI59T6FAbqGiQFAs/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/O01NKbmuqTHCDxTUZiKCsxg4wQTydouSBGYUzUjxCE=;
 b=REHt9l4sZ5bjCBNjuxM7R0xQolr6v2vN3oZ5hbR3UhTlGQw8Uw7P2HRCoSMxfqXnubT31cZuhd/i5VC700S+8C1CChPJ6MkqUxLSiWmJ2GBqscxeRl76NESvRINcHW+X4hE7sUZeEvOJpZouONjoRjJCFcJfBC6dZCMRLHke4PT2aQ6uCaa+1y8+UYKmlxQSWz+Pjzdy5hga6kPpspqcGScnLBKw555UWJCLTgYXGoN1XfDrYT/Nl2DLYfOzvADh4CERqmjQlp7YPg2ouqkCakeefYXbuFGPnp09HZlskjFgHji3SuMfOFPcz4+hfOWrVXwSoF6rqxR+/bEs3sgTCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/O01NKbmuqTHCDxTUZiKCsxg4wQTydouSBGYUzUjxCE=;
 b=YMgPsvhfrAAAQYO8QtvjQh1j1yCmaWbC1+HlJdANWCKDKqjIyvdLm44VHY5aR3aHyer9iNOWkLQuITqkNrq1Sg8BAV81FThITgRXvyXYJ78bpa3vQjYs7w3ll+DB8RUfRw1zF05rWwkMDdFdbETOFu/D11mmsE8sO9qfNABJ2G0024EtbVsqONaLSPpq8ae2dq5QD7kuUum+9FMv9hF7LNhUJz6/C7ZTjeHFKMegaN+ty0PUd/9t23J/I2I3sXxoT5r1uKFTSjseyKs6M/gMhjXEo1ZVxRHwNmxONhONzy7dPBUyF11wZJxUY4puBzUjuEfdvcGHhtW3aas6bpcvkw==
Received: from SG2APC01FT053.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::51) by
 SG2APC01HT106.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::366)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22; Sat, 19 Dec
 2020 18:56:47 +0000
Received: from ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM (10.152.250.58) by
 SG2APC01FT053.mail.protection.outlook.com (10.152.250.240) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.22 via Frontend Transport; Sat, 19 Dec 2020 18:56:47 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:C7F0F7D503A3264E2484D22E18B6010CFA2156AB0FF06CC7EF680D242776FE7D;
 UpperCasedChecksum:D970A6621A2DD60698B6D2B0358724384CCAEBD8315F4B70C212E9B976191E46;
 SizeAsReceived:7646; Count:47
Received: from ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM
 ([fe80::d86c:2255:e334:54f7]) by ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM
 ([fe80::d86c:2255:e334:54f7%5]) with mapi id 15.20.3676.025; Sat, 19 Dec 2020
 18:56:47 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH 4/4] fuzz: delay IO until they can't trigger the crash
Date: Sun, 20 Dec 2020 02:56:27 +0800
Message-ID: <ME3P282MB14920C8592A1D04D4A5685D9FCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ME3P282MB1492BFA2302041F2AB420EBEFCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB1492BFA2302041F2AB420EBEFCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [5gEi2XxWoLtq1h9lbQEJQ3eNiy+duYVMTJ4CqQH9plhAueF9Wlr1mSgS5wJ5+Gr2]
X-ClientProxiedBy: HK2PR03CA0053.apcprd03.prod.outlook.com
 (2603:1096:202:17::23) To ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:a0::14)
X-Microsoft-Original-Message-ID: <20201219185627.426615-4-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc (2001:250:fe01:130:1079:e2bc:42d3:a57e) by
 HK2PR03CA0053.apcprd03.prod.outlook.com (2603:1096:202:17::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.19 via Frontend Transport; Sat, 19 Dec 2020 18:56:47 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: a2bda46b-7e8c-4cc9-2629-08d8a44fd64f
X-MS-TrafficTypeDiagnostic: SG2APC01HT106:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /K9j9It8fYR6+edx2WzQ68/rcQPhYkij+zOfT9VSq5lft6TIin3srY1o5Sd2TeTW35NBi8pN/uSPWFiysdlGif12b2D9NTuCzGmAXgh0YbgwL+MN2LsDPOMGL29tuzfDr35oGHC2oJ+Ixk46zX5wj5hPqIzOhmFqcXcgjoV+iZpwXxZvbwohDPmmjbDp0tKzqLk+SHsxaZNQN/LbjNclM5tTm9g76s2iisD2q404Op/chQaiEFUJVSbetlAAPDoy
X-MS-Exchange-AntiSpam-MessageData: ef2+HdtEHADD0ati5CgZzbjCKP5mjwS/xSDnhuYu0oMc+BAdLXvuzLEtbgubeE6x4QPI6RSoqtFkkUx7ibb+C/iNQnAlzucRGSBGv7Rl+GM69Ywgl/eXZvwlUG2gRKGM3FLuelYGCUp+ghTHDk97/RxqKbMBSlQmdHflMq2GqYRAsJLRaXUh5aXPrMx47RIsOAQp+dA+KsM8YTuimq/myQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2020 18:56:47.7429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: a2bda46b-7e8c-4cc9-2629-08d8a44fd64f
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT053.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT106
Received-SPF: pass client-ip=40.92.254.92; envelope-from=Qiuhao.Li@outlook.com;
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
Cc: darren.kenny@oracle.com, bsd@redhat.com, thuth@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since programmers usually trigger an IO just before they need it. Try to
delay some IO instructions may help us better understanding the timing
context when debug.

Tested with Bug 1908062. Refined vs. Original result:

outl 0xcf8 0x8000081c            outl 0xcf8 0x0
outb 0xcfc 0xc3                | outl 0xcf8 0x8000081c
outl 0xcf8 0x80000804          | outb 0xcfc 0xc3
outl 0xcfc 0x10000006          | outl 0xcf8 0x80000804
write 0xc300001028 0x1 0x5a    | outl 0xcfc 0x10000006
write 0xc300001024 0x2 0x10    | write 0xc300001028 0x1 0x5a
write 0xc30000101c 0x1 0x01    | writel 0xc30000100c 0x2a6f6c63
write 0xc300003002 0x1 0x0     v write 0xc300001024 0x2 0x10
write 0x5c 0x1 0x10              write 0xc30000101c 0x1 0x01
writel 0xc30000100c 0x2a6f6c63   write 0xc300001018 0x1 0x80
write 0xc300001018 0x1 0x80      write 0x5c 0x1 0x10
outl 0xcf8 0x0                   write 0xc300003002 0x1 0x0

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index f3e88064c4..da7aa73b3c 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -214,6 +214,27 @@ def minimize_trace(inpath, outpath):
 
     assert(check_if_trace_crashes(newtrace, outpath))
 
+    # delay IO instructions until they can't trigger the crash
+    # Note: O(n^2) and many timeouts, kinda slow
+    i = len(newtrace) - 1
+    while i >= 0:
+        tmp_i = newtrace[i]
+        if len(tmp_i) < 2:
+            i -= 1
+            continue
+        print("Delaying ", newtrace[i])
+        for j in reversed(range(i+1, len(newtrace)+1)):
+            newtrace.insert(j, tmp_i)
+            del newtrace[i]
+            if check_if_trace_crashes(newtrace, outpath):
+                break
+            newtrace.insert(i, tmp_i)
+            del newtrace[j]
+        i -= 1
+
+    assert(check_if_trace_crashes(newtrace, outpath))
+    # maybe another removing round
+
 
 if __name__ == '__main__':
     if len(sys.argv) < 3:
-- 
2.25.1


