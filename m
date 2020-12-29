Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6733A2E6DD1
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 05:47:18 +0100 (CET)
Received: from localhost ([::1]:42464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ku6uj-0002Pt-Fy
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 23:47:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku6pM-00055K-Ii
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 23:41:44 -0500
Received: from mail-oln040092255075.outbound.protection.outlook.com
 ([40.92.255.75]:48375 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku6pK-0004dn-Pd
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 23:41:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6nUw1Ztq/VkQwGY70Tl7MRUILzjmIcMHGsBblp22oz8n9exdAvPhq8kAzj7rcBk94zDMkg3taNYI76c4h0QBxSFDJkCRwDKtT19IH4vgY10qWiCebJ65kdRVrWarsya1zW0/6O2pkWc+whyB+VqwHKinzSQ3C1z70L9uiGl7cNyAf1haAmEZHj7XjijiygfE8VeXr4wA+d4w2Mk+iHQ4uOdwf1yDarpN0Prqwu0QatAcAYX7ADsb3ezIQePI/2zkyMPFRpKm5epgym2O9PWjE3EVr87RAsC/ejoHkfaLWlZSLdHvHx/GDfIvFGKOpPyrcZPdsrmN9ili7fFEHllfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FR4fikGdSjjd1F3q5G7KKkCF1l0dJlVKYYIfV+Qb6x0=;
 b=AKa1w6GlbtFvfVSr7bSko/WFpcuDO8OP2030jYcfhfkOt4pZfStF/fYSrriHcWZ+/4zofgXiIr0ebZ0PrTFlt/V8UijK5aJh1GdbsgFFufeE525lkfXqCCX3MFAB1S3wCgRNG5v5bXD6V+3+f8W2P8mM57L2RX+CyUM6XqNsOcMgf72EYbY4fi8W7nFB72OiVVXNv0bdSEo+BFYxrWS2bkUZHeI2LzNjm88Tc6S4kmjNXCq1KZTuw82oMWebgVVF77PzTUVE2u6Ky3xX9XB57b/pj8DE4lHHSkXobbkqo92gd1dzLA1LKWrbZTNr2udaqf7vRw8ZlxU1LdkYzLj1AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FR4fikGdSjjd1F3q5G7KKkCF1l0dJlVKYYIfV+Qb6x0=;
 b=lt/zoaznzD2Au/7UQ0fH3F5kWm4oeiF+a8f9z8VEnxt6k6ah3oE7Ne4RU/dyT28w3zl3/m2PpyuwurYTBrunJxJcrX2zePFK/KhbmHnQ9UQG4bEeFey4/iPp/nfXZUYRwo2uru5FInaqXSW63GSsMlTcFJcYgv7UAXgcJIAliOjRqJR7HdTVpa4Bj0hZOkbsDEdeGfTJZWBDxQ1SdWs8Q8+rSlyYVrIxiBhTEs1Qt823z4535w87/e5Xm/htv80zJgmWkITtaStj8aYl0p3a2yA8+O3gJDG4ia0vfVQRzXQb5cNiBZwPZuICJkqzhLlGEerNY7bfbXjceE1quSMtDQ==
Received: from SG2APC01FT025.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::52) by
 SG2APC01HT187.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::273)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 04:41:26 +0000
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM (2a01:111:e400:7ebd::44)
 by SG2APC01FT025.mail.protection.outlook.com
 (2a01:111:e400:7ebd::187) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Tue, 29 Dec 2020 04:41:26 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:E0B42EFCD334BEC375BBEFDC4E0E23EA8AE852CB08D43F203D40EAB2CBECFAC3;
 UpperCasedChecksum:2CEB56DB018DD839F833D7550D94F06DBB1130E7E1CA4BFD17E01F7DAE0FD2C4;
 SizeAsReceived:7659; Count:47
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e]) by ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e%8]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 04:41:26 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v4 5/7] fuzz: set bits in operand of write/out to zero
Date: Tue, 29 Dec 2020 12:40:42 +0800
Message-ID: <ME3P282MB17458E59681E482B73EDC9A6FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ME3P282MB17456B93AE422008F433C50DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB17456B93AE422008F433C50DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [0blPyXVQSS3Q1TGsf33DstTPPHH4DysVAlWagDI31I6l3RCZiHtbmpwJAba0BkCx]
X-ClientProxiedBy: TYAPR01CA0064.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::28) To ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:ac::12)
X-Microsoft-Original-Message-ID: <20201229044044.3706227-5-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc (2001:250:fe01:130:6d26:2348:77a5:f7ed) by
 TYAPR01CA0064.jpnprd01.prod.outlook.com (2603:1096:404:2b::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 04:41:25 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 1e54e6aa-c9e7-4037-204f-08d8abb400c4
X-MS-Exchange-SLBlob-MailProps: S/btQ8cKWiRaJ+ox6yOiFxhBa7ZFYMmilm+7+9bsz0UaWozymeyKgR2ktsuU+YRo/S4MpoiTTmwv1izw7aoQxydy+L49Gm2fNSEjCt2pL6I2na5MEYoXcz0tFJmcKs1uYlZZReR5dfMq+HGcb6XlGpAeZIuuclX7F7Ap6t8bxgXRsjLxuIpcBB4Bwv4uZZ702eZj9YloSzf4mCoMPLw02l3n001TZ6LBlmp3fdWL70FVJyDKVE2Wl9NLAVQfdvOYQ4KXcXFYJtMq2PDeIUedl3i7Dfx73zF/ESSZaw/+SfJcL5MrsIpRwzGX9RAAxcuRhqE6Sk4L5Z/ChTaQc7oYElCsYBTLPPJcbLprwCJl6XF35DQFTR06DR3wYhC07wBnFIcTlChHi07xjxOxvwdf74xxpehUavn4dknzySHfJlxiHGG0QfQyUudLpBG5w1WtBVw5kZUjJTJhZzmMy9wLd1sA9mexFSHfJW08HAAeDNURj6aUpmmuJYjYFIyoE3/pXbmFlLKhTIjaGr9PeNqzdVr8g6fQLy1lbfQSv+qKMW+zPkj0rEormNLAdTMnU5LM1G8rLtTVqvZ2B87P7y2JXnZ6bXCysNByeXtDtK29zNFsRSba2noUGqjZR8xiUFGTcCqAJPTEVM7fDLrPi4WpgIGknDTJePxyvDXa3w3U4AWRQuosRlums/j5Z/WU6QieJ7h0/RWzgMKEhc/xOjSB7SqWr2Kodkk0n4yIPA3gdE8QgZWJnWR978MYAhDa5IywhidCJ93GpEM=
X-MS-TrafficTypeDiagnostic: SG2APC01HT187:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2vhi6XvKSrE25U3cKBVLx8AQXlXVP1QIJMxGeF95mQ8uSyU4ssoAp4AUVc5Bco3AaeYu1UXlsay+x73hT0KySyy4iJ1mcEbHX7LbXqN4pxD4ZbWNMhNTtigTfZBgDOGwdaHS/EuTzDltqqkG5qkchm2SYDF15GA7TxzVsgdE9jgjap/UN0ypqws4pWGqZ7nniNTjCpwPC2xyQCyZj1Ef5Nj2riLtVoyJEaASxC9dt3FtE5keRjara9HY/CX6xA8r
X-MS-Exchange-AntiSpam-MessageData: JCaE2in04+0+yvfv24P2Lf+7LYXQAXYgu6hMiylpSkioDjdoCFIEU9eOPh+gDqY1krzyG/29moXRdS/pgoPgIOSROHjduDhnYs/i2lNpyOcyZQkyuEwBM0xyvYwpuw0glqx7Zc3V8IU/WMyS/Qe6LWTWHhDW5IIA6kpzbJICC52GZb7ntuFzzHicSidLr642Ne0NPz0LNmk+WpJCl/3Zeg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 04:41:26.7265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e54e6aa-c9e7-4037-204f-08d8abb400c4
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT025.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT187
Received-SPF: pass client-ip=40.92.255.75; envelope-from=Qiuhao.Li@outlook.com;
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

Simplifying the crash cases by opportunistically setting bits in operands of
out/write to zero may help to debug, since usually bit one means turn on or
trigger a function while zero is the default turn-off setting.

Tested Bug 1908062.

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 39 ++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 378a7ccec6..70ac0c5366 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -164,6 +164,42 @@ def remove_minimizer(newtrace, outpath):
         i += 1
 
 
+def set_zero_minimizer(newtrace, outpath):
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
@@ -184,7 +220,10 @@ def minimize_trace(inpath, outpath):
         old_len = len(newtrace)
         remove_minimizer(newtrace, outpath)
         newtrace = list(filter(lambda s: s != "", newtrace))
+    assert(check_if_trace_crashes(newtrace, outpath))
 
+    # set zero minimizer
+    set_zero_minimizer(newtrace, outpath)
     assert(check_if_trace_crashes(newtrace, outpath))
 
 
-- 
2.25.1


