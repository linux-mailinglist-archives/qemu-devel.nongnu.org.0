Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0612EED82
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 07:42:06 +0100 (CET)
Received: from localhost ([::1]:56578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxlTJ-0002wu-NG
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 01:42:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxlPM-0001D9-E5
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 01:38:00 -0500
Received: from mail-oln040092253063.outbound.protection.outlook.com
 ([40.92.253.63]:63266 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxlPK-00077Q-BM
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 01:38:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hg7RcuudRXVClt0bRy4+VPoSHUwM7aorWz/O+3KMnMHxU57uhZJHFkh7O/WFYllgBHempwsSADtZSghi6GOjWgQEIFgGHtkkozLuDUR5gDm+IvVzmSKHwlp92pg/5Wy/cbAfVtEIxf303lZK63g/Dm7x0cNRh5mYP+h3ashaq+UA5XEc4bS+ibTEK8U0XDN0P2a9K6/PnH5OrMYHx8180J57vFLsu42abTWRaefkKszzsH++J5wpq7gIpv3TY6WKvK58+Yey5EeKThMApCan5wuNYdbgqHNIH/ICsFfS0IGDm4JH0/wYAC6OZ6mGeVsbjOqq7ZN/MSdnQrnQT5objg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRmV6nO74Mh+1xg6JV5mP/6lpqidg46vYuzrJBmaRAU=;
 b=Mv2J2AYraaZ3ACFlcbVQnWmL7DOivuCtCwumwAfpEX9uePAPE76ieJyGAYDEmvE1x4QbCIWUoG0NEZQ8atfxfwBBpDgHv0PxDU4n/Z9NLslH78r9eb7MOyCjVEqmznKSW+KaLZl6XngL6qF2XOFXIwLlJAIJQGoOYLXcucwqlLP4f2K9l7ZLqSVVxfWHJDHf8KVVE9EY+X3I59vMxeX8Samzx/lmpFz73t5duW62daYS+mErfdiYX7+tWzHXuYHBZM2plY73GzABBA6T/af2TUUM/kAUKZt2DawDH7Q6yrgvzTrB5ZJqBCG1/OTifUJTCaYuYq7Uj6m46CkqVlzMqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRmV6nO74Mh+1xg6JV5mP/6lpqidg46vYuzrJBmaRAU=;
 b=mmGgXVivv7ik9c9ksVoRn1WpOlK4JiFVJkK/SyScS4UCEErj7B5z0MFnwpy79grOT2Pv6aMqIxwL7s5CeGvSX/lmcHBAYTfyc1yHiv1OIG0zpX3oE7uyAoDCPLRXYa52o9O5kMb5WSoKw9h+/hDR0UZsUiwyiyReKgWBlP0aha4rpF982l0tSM/Uq+lsX52JGwXt6jaJJ+ipkER4iwEjnDRJlA5PxvFu1eDf9InMYrikzQ92gs0PPPCaawwle/X4wPYsa0pc0ovk8c3LBo5pwmyi9SzF/zjGKPagE/mjcEphbWx2vHglDvNGZ9bRjjB72f/4X7u/A/PZI+babSWMag==
Received: from HK2APC01FT049.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::4e) by
 HK2APC01HT137.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::380)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 06:37:39 +0000
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com (10.152.248.58) by
 HK2APC01FT049.mail.protection.outlook.com (10.152.249.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 06:37:39 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:6576C93D6AB1290EA3E2E4A128B081B89D49CEF3CB07ED75C2C9AA2FB42C34DA;
 UpperCasedChecksum:FB08F56623533FEB083850642C464F0959C393B99C8E1F345260F231E86102A0;
 SizeAsReceived:7668; Count:47
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50]) by MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50%7]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 06:37:38 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v6 5/7] fuzz: set bits in operand of write/out to zero
Date: Fri,  8 Jan 2021 14:33:29 +0800
Message-ID: <MEAPR01MB3494BA22C439D33D8C1CB9B7FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <MEAPR01MB349467055C8DBCB7743E4283FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
References: <MEAPR01MB349467055C8DBCB7743E4283FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [gIqHBhs8++dXPq1d1LeJ729GuQnyGmA0MOAHlpSkhp31Jyacf684SefOzQqepRC5]
X-ClientProxiedBy: HK2PR0401CA0008.apcprd04.prod.outlook.com
 (2603:1096:202:2::18) To MEAPR01MB3494.ausprd01.prod.outlook.com
 (2603:10c6:201:39::11)
X-Microsoft-Original-Message-ID: <20210108063331.17035-5-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (2001:250:fe01:130:10c6:c22f:85d6:f9d) by
 HK2PR0401CA0008.apcprd04.prod.outlook.com (2603:1096:202:2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Fri, 8 Jan 2021 06:37:37 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 4b5061bf-6bb1-4b3a-4f0d-08d8b39fe455
X-MS-Exchange-SLBlob-MailProps: S/btQ8cKWiT4Pkfzu6B+gslsbaS+QpFwt6dgSuE3OGphhSovPL0zOxNXdVBevMqgo6sNuzWEwkvSNjb6dvfIUhgi07l0MVBRfJkAZWz0z5MDsGhu/y2aESWAuj7l+qJ6NljVAsppp4H5axIvbWMn16Z4gBp9OOuz5mcuI3nP+CGFl3hqFBygWdhJ6pLC4wpoPz2zPoKApzjSD1zKP1WnR8DqAL+gJqc3MmFCaTt5RSlBV5bSxCIc2jHso1wfpnxJNK6+p5qxHyiBpN+jmOlJsGPlUZpVKPPwY9jIQG8sg8Pu7QrFQBP9Ba7mtw6YNlxaPEATVuixGW2ZRHK/IgCkg4fQEBE3uGwsTnhLJRYEnmXe2DNkgsZ0fAf/tz6yUucxkqi5IT8AzTsNsUBAwOdpmwlSSKL5wHJewJCxxkf6LM1i/2cb3I9jNp+CdYc3xE6QJZMANlZiCZUaWM6guQUfIWvE78QJ/IGLNgAr2YWvTdhnELzFhZ/v/RaJsyPsiFuA9Z2Z2qihMM78kDq/ucAKWml4dE2jMsPMvw5hVgVkhRqnoevJgC9YlV7WPFDN41bHSl41DyUFxzsMDQRazbaNSi8bMdy8C3CfOCVmz67HK6a6FI8O7Aa0y4RCx9wmxByZrYpAlpSt4EvS1ht339JynCPLradET12nD+mmmRGdo2MVt34jUbYU7pY0+ISWy6D4RvVk7c2LZnxHWBMBNm7AS8ZRIJaW1wnmhXumY4NghmuxDYgRJ0m5sztjGxXkcu7QSu/gzHr4Uz4=
X-MS-TrafficTypeDiagnostic: HK2APC01HT137:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pmpceiPYwSY/nTlzWiSyjp+cergz9RLI7nhhR8u7CZ7xaYObPn501S8MFRujf2FWvJ9eZlb2+74Ra1qaEVUU0/MEXSud3eCLkskEJ5QxtfrWCxJ1Tjj+bimIg4fbFLdPRAeOJdpfDRabo3LJ6ck5Q2ZOSv6MQjgAiHc8hAPg1XJdm+to0r7frjjxwcvjr17kTrmhqEjazpdFwbYcPUKnvN8cwL/O7GlxWpaKzmqYpsG9QzbjhFsUuCvaYr//K5dJ
X-MS-Exchange-AntiSpam-MessageData: EOmF6pSM6x7aXx4ZJ+uF2K94rfBPsxhB3ukAKcO291X4NBpC2vQBTgHpM9tzbfTWhPlVK73b849ZCQrEWOOGp/7fU7S3ajyGVCIKq0q0ohTgnsWw2DMm/P99ADmm8zbAdI4IGuA8kKx3DYVTocNt9mCb9se4+/+bhzBJHmaK4PXp8eguWvysakIZvVtYufNyu5cyUSEMl4MNB8NzjRp+GQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 06:37:38.3953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5061bf-6bb1-4b3a-4f0d-08d8b39fe455
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT049.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT137
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
index 45c1627d32..2325b38dbc 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -164,6 +164,42 @@ def remove_lines(newtrace, outpath):
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
@@ -184,7 +220,10 @@ def minimize_trace(inpath, outpath):
         old_len = len(newtrace)
         remove_lines(newtrace, outpath)
         newtrace = list(filter(lambda s: s != "", newtrace))
+    assert(check_if_trace_crashes(newtrace, outpath))
 
+    # set bits to zero
+    clear_bits(newtrace, outpath)
     assert(check_if_trace_crashes(newtrace, outpath))
 
 
-- 
2.25.1


