Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 841192EEBCE
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 04:18:20 +0100 (CET)
Received: from localhost ([::1]:45894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxiI7-0007Im-JI
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 22:18:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxiGS-0005tk-M1
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 22:16:36 -0500
Received: from mail-oln040092255046.outbound.protection.outlook.com
 ([40.92.255.46]:6254 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxiGR-0006AM-1e
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 22:16:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VMugwCoa34n4kkbJb/A+IzA8JSfyaiJygfC8jywgRkIHK4hIRThWhc84N8lhn5zpibDr1iOlZv/zOJFizW+tZJ5p1mLSN8L2OlyfsUKfhgUIZX/v+50PSyIYx459hNwXBhA1GRisamFPJ606DHeRWW2OqZiX86YCCephVR1FDW9jvFk4KVonuBsibis0CSg7Kz6bVqHuCGBAN4IwFrPkQ2hvKF3zMPqRBpBenXNV/OAh9vyF2MhOaStaiKCqGYwFcPWoNVjzokWAcltY9a4otM25gTcIFgE1OAsK1jPAPneXJlACvaou0msCr1mlGDIoZ767Xjp+WuL5tf16HQMCsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pymfxXgR5Ic9rjJB8K7r4MLeoOuK5rlkNnhXpQHNvn4=;
 b=fMWrXnUfQfJXS+MgH8PcohvpSK2jkIFKVOgr7O636aIIHfol7L22tIg0xVlLrGp1KcpRg+3PZwYlHoT//qbUxJbbk/RdNC5kbeBhxh1MfUyaDDeefuOykE4NUOxlUOG7hE4pcqoZSD1zXKxXYr0J8vnEDnSRhvQegnS/O2l01x9rjvhjAKCAfyjE7JqUDq+r5YLGjm3DVZk7YGDTmP48ezOuWSmecysB1m5tz2Ijj0OViCrtl0sIOtQ5eQXiN4wR/zmfrVNhSbI1/HeuFJjkzI0QwDiQuvR1MJSiUltHmikVpfQIrxiEXmsVPJE5Z9u8Bj8EawOKiQiPkzEFVUOOYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pymfxXgR5Ic9rjJB8K7r4MLeoOuK5rlkNnhXpQHNvn4=;
 b=f6CNaXfGdrXHysCcfP42T4fVmNTUJNTw5DJWMLrFXA9+l8+mrNJmjvl/Y9wlplOiULTzhEu5muen7xpo1y2Q9StUxbNcxZdVMngUVFhyzFp1KDQgKw8h5cJp5RhE85YIVrn8Dxnwk875vsfUOf+OL2DQJZlkbgLs7HwWih2orryR+hVME76Mp54c7j5EgumdRdpIPLfuarZ3gFINWfeIBrarv4HwVb42qU19t/oDcGpQ7Qwm74ZLF7ZzJI5vmJBhTIgsvsHAOxks32Pih3SOL105LgK+e9a4I9vCE+FYZDcKL+24/mgRFugLwJjWlj9Uo6IMVv4UmFwxuasRlnnVrw==
Received: from PU1APC01FT020.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::52) by
 PU1APC01HT160.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::87)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 03:16:29 +0000
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com (10.152.252.54) by
 PU1APC01FT020.mail.protection.outlook.com (10.152.252.217) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 03:16:29 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:02EB2DC45BF3FBB8DB029497B01B8A000F32B92BA10D42A223750DA1AAE8EB77;
 UpperCasedChecksum:E3FD5F86E29D3A4B8CB8DF9CBE9E51C22ED60A921DA5275EB64A5787CFA2E5B3;
 SizeAsReceived:7672; Count:47
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50]) by MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50%7]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 03:16:29 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v5 5/7] fuzz: set bits in operand of write/out to zero
Date: Fri,  8 Jan 2021 11:12:47 +0800
Message-ID: <MEAPR01MB3494C73A390E99D34BBD74C5FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <MEAPR01MB349464ED835FE8243FB09100FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
References: <MEAPR01MB349464ED835FE8243FB09100FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [LQcGKeLPCiNGewQPq9GZgatJecIU5xuZruiX7wy6KeE+TpSnXhp67cM1NNsFpQdk]
X-ClientProxiedBy: HK2PR0401CA0006.apcprd04.prod.outlook.com
 (2603:1096:202:2::16) To MEAPR01MB3494.ausprd01.prod.outlook.com
 (2603:10c6:201:39::11)
X-Microsoft-Original-Message-ID: <20210108031249.68381-5-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (2001:250:fe01:130:40a3:2fc0:cdf4:4729) by
 HK2PR0401CA0006.apcprd04.prod.outlook.com (2603:1096:202:2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Fri, 8 Jan 2021 03:16:28 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 23b04677-1cd4-49d1-6388-08d8b383ca8a
X-MS-Exchange-SLBlob-MailProps: S/btQ8cKWiT4Pkfzu6B+gslsbaS+QpFwt6dgSuE3OGqBi/GXgg7/xL8bTJe6ZF77ouyvPyG5Q9aiy96/JRToWn3LCRoRvw0jBIkA86aJ3TfalXGDGc0Jh2CPsmqZJevgw5rSgGr8sWwUj78VSWaxqdVRP0CC08qsIkG1EhwORfBK12wavQGWV8ODPQhwOOqmc2A2ayl3QufEKii/QfSsgSz3/i6frydLRWctcuLz1/y6wsggYn3qL8P/DuRodjqK2giKUE05ytRh4wAL6iEfVfQHcvHF2R/oNbRLNHXYWx4ineEeq7Cg3KyFGoilZmHQMAsoGZBIkVmXK8uQFhrO3KDU0qUoNaDMU5PdYSkDBZsroEi92nmB/6WieQOxBYdWJ0Cg4aCfkYYp7Ma3I1eTulkRAN/knqAq4OY0rPTvABcKPi5qFUUI5luzS1S7uomu5FOYRDl3TXtrWA+cb+kKh3IYRWPVNM5K5VGftby0uryYSRmnCqY9Ix9fbM4GVCjAJ4b7quOC+bqTyEjazn5IlavBYaTng5xD0O05vswy8ujix6yKY7rXm8Tvc+hQQ+VGBztEWIsPmb+GWZCdx6OQyxLg7YqwKcCFzjqZULW40KZ5OS4gjS7FiSkE33+kiA2ftuTW5G23gqKb/xxIDT7kS+WvpdyGLRSdf7gepPUf0luQruNg4ztFWn0ewZ0EsEfGl+1hvX2/6vTcRttTZUsCIMuXsJWezft9SQR676zPpQ5IQ7/f50TstVIP5twMm3ohE0x2/NsBduw=
X-MS-TrafficTypeDiagnostic: PU1APC01HT160:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +PWfUBq4ZvLUeXmLzuqS1trAznDfNi0aE9rJ4QVExZ9KSOGxF+TScBwUOtj8MucyQB8j6lnxdy5yueqGJXwIzWbiYySV1hZez5if8F51maMTVBW0UQZGnj1pH6cvPLGa8f37dveHmZOq1SOhOv2pDYB9P9873f1DxeG7eGvu7VVRNgTGPvR4SlwSjbpfoCc6bl9NpnNSao65YiMcKgGwPYSSJCmfo7suFNB7IzIEJb+Y+r7BFJ6CRBR/7bi8UXAA
X-MS-Exchange-AntiSpam-MessageData: 2mlPoqSTYRmJj+2+FRepXG9NZvIVtG6HoHPTt9vPD4fIP4ukOic+hlR8OSCS2g9RiIJnD2/EsQloDeeORl9Q+Pofw+FwJaVIGO2hMur9cfxupVDssM2ETjMJZbDOo7/G/MLmyBxRP8T492O3sz/UvPKValt4qd4aokJHiQDpeOtPx4bMTYtz3NRtQgatDWzlHv5dKQcDHICVZd91fM2qRg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 03:16:29.2150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b04677-1cd4-49d1-6388-08d8b383ca8a
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT020.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT160
Received-SPF: pass client-ip=40.92.255.46; envelope-from=Qiuhao.Li@outlook.com;
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


