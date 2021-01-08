Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 693EF2EEBCB
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 04:17:39 +0100 (CET)
Received: from localhost ([::1]:44426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxiHS-0006gr-EM
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 22:17:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxiFh-0005E8-8a
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 22:15:51 -0500
Received: from mail-oln040092254053.outbound.protection.outlook.com
 ([40.92.254.53]:43904 helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxiFe-0005wy-HJ
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 22:15:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WuZ0Li6yP8Z6fnk0jyFcDyyoCpewGKdtVlWReoAbXl1iLdSZU/eVaRa+as9ic8KSV3z1H7E6J3BTQf9zwIai6CXz4BfS8GK/D5c67iu2fPZ6/u9tg36Xt+/QhMuC3mNrATH/UKs9GWm8eUC+V6EnsDhRaf7nZ3X/xfjaz7pJQ9OQyWaQ10LCF9laZ9p1f3ZK2fHbfstOqyczr5wg4vg5ATYiqo2ZqZlMHMvaA5bV0aEnlsVsQ4LCzLwTaVA+safpGNgkK/is2WFiaiXABbxb1Ob5GmOEVED6zAEmYHAyY2NuXPgqBgnb7Hh7UMd+taygqeirer0yH1tZHLuf93pk6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=daIkuwIGHrw74SHezGrye+okfNqfgsJCsiPWuz209HE=;
 b=DGNLXTNbSGm30ntE4Sl8BoV9ZbpaBUN8AuI+mEZEJjwacjaPwwD7JkhsIB+zwDUKypntn6hMgFe3FGY4zNFcOQKt2rk7zs4jnqq5IIOY4V3nWDuQY18RLc/ToAflDtE/1gy0VUbnM/MrCJhfHFw4CazOcrQOt1Z6oNFFolbRPjQEAqDCTfGlFRpYEgXgJe5Dfj73pReC0dcVUa1VX2vn4V6o5af1R/z/ZyR1W0sJehDizpE0yLBTUrMAth3AIIWJvCZGc7qLhA0SKJ8pOs31E9z7fzOfLp8eQABItC8wd8cZoHLCeEmWoi1ZcU6bYoxIox862+AHcC/PjdAFIEXD9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=daIkuwIGHrw74SHezGrye+okfNqfgsJCsiPWuz209HE=;
 b=MefoEGI19FLq2knIztVv2mGZ82pQ0tB6KI5y20AkJdGWcTIShH5CH+wGGY01IGAMnFNBXSRbRm1fd9c0X+z81dz4mFYaV53qVBpJtuO93LGEoPpMvIMGvRyAZY3X+AbjONVDMOQWGsFnjNXBnq1oXvi2nakdNm+X94HP1pmHmSjpZB3dkODNzIvDfZbDS5h69VlrxfBsgY8ZUKeuf0YwLeclB3Js3JdsUE5Z+739F3wPG1hWWLb7FsCNFSObCCJ+4/T7IPyanYE75UZXdeTRLCmljOdlnSCc/Q3hSd+YKuHuVHWtIV9iPyhY74kGWqFPPyAlOMohZGXJ6BCXxaxJ2w==
Received: from PU1APC01FT020.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::45) by
 PU1APC01HT229.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::198)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 03:15:40 +0000
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com (10.152.252.54) by
 PU1APC01FT020.mail.protection.outlook.com (10.152.252.217) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 03:15:40 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:972287E98552DD8A54A7B6F99733BD472C715E7E39FB5A148AEEA1BC0B0DA49D;
 UpperCasedChecksum:A8B4BB200F94F958E7C0F90611B3D2F369F905E404BB0ADA30D16849DFD4F764;
 SizeAsReceived:7653; Count:47
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50]) by MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50%7]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 03:15:40 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v5 4/7] fuzz: remove IO commands iteratively
Date: Fri,  8 Jan 2021 11:12:46 +0800
Message-ID: <MEAPR01MB349412AA1436F5540681B37BFCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <MEAPR01MB349464ED835FE8243FB09100FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
References: <MEAPR01MB349464ED835FE8243FB09100FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [OQ6YUpYkedPiaxBDybI7sZS5CJUEt+E57LUKH/R2NESLr8VXndrVEK0xG2wzc1KX]
X-ClientProxiedBy: HK2PR0401CA0011.apcprd04.prod.outlook.com
 (2603:1096:202:2::21) To MEAPR01MB3494.ausprd01.prod.outlook.com
 (2603:10c6:201:39::11)
X-Microsoft-Original-Message-ID: <20210108031249.68381-4-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (2001:250:fe01:130:40a3:2fc0:cdf4:4729) by
 HK2PR0401CA0011.apcprd04.prod.outlook.com (2603:1096:202:2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Fri, 8 Jan 2021 03:15:39 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 5d3d3b8a-c6fc-4cc3-df69-08d8b383ad53
X-MS-Exchange-SLBlob-MailProps: S/btQ8cKWiT4Pkfzu6B+gslsbaS+QpFwMRUHTKJJVtAPn/bWcJTZGva+oXXRMDs2GucWnWtTLoVKR1i2aeCm15OoCdwr7Pwm+AbyYs3cmhEKQBoA/WK0zLcI16YDtS9Xn6FsFAa/C4vIYLKYavlP+pGiWrxq8s9b+VUd1oDvb1/pS5rbhEw6iKGjHEaf7x/zbKnqGZhaJYRHqmQ14oWMGEY4M5GU9hO5JQhp+DFclkYvRaqv2QG8X6dN0SYANKbND4ROPd2PjrEkoOca5SG8FIstjGusaXwyAcB1SzonI51HV4ps/yxseKunJ1lb3jufYgxa5UEh6Xnu2QyTU1pWW11v9b6tnkOIhF8NwbkXF5C7lCDHu6zZpPd5H8bIjoojuZN1+Gi0Pj6mG+SImiQGPxMijyxSaJqTAwsitNl2H6RqeGHRHBex4CJvcnRckwncM94izb7YwnLgAr/L2/H33665FNFBAi0z5ivProNxAcooGJwlXYab0DdUxrcurOKr2WHkl3cY5wXH4ULbpkkQRyy9G2sincfFc5LK5wTbeh3Zi9CI9hkU79LaHkt5iImArF6Khpt50jVIA5VIC0KTWk7D/v8HxeW3/+uUPu7ZQfOn4bUvJurpD0DcwHXRvgUlxhNy/3Jx5IB3rh7UZiDp6hlNJh/HUxjM5iDa1HSX2nXzL7SYcQUuDYiuXbD+b0KArvldioCAyLuYqG3QBTQ8+4q0Zw6qDorBik9P2SgHQB9weiX94lSpVxDogK8k7axjheruKb/QXm8=
X-MS-TrafficTypeDiagnostic: PU1APC01HT229:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /WEPbgPhnOrSHf3degg2BTLnSNva+6yXjyyp8V85rQ1YydTzUr3wfhlryt8z52MQoonUDJKvpRu4XabmqmGnprgHSZZWOgu1uFeEZM1NwLPcs1H/wlnVxeRPfziOsopaxvzDFTllyOt5OnI8YFGufZhgQBSkOagRo7PpfWrz6JzNy2LDTzAmHJh/3+OEiM2AiHlmSdfd/NkSlom7T7nfNWEHvH2Pv/8hIdZjpsvXhxsEEZdQt+ebPs5rLGBsBNJk
X-MS-Exchange-AntiSpam-MessageData: dqgNmY3caNoPzYY38L52v4PPyZSU8F3Fh09kZohXitawJ5xn04Yhv9k5sUqekTOM/+8okRLUiHLyKDIAG4NuOIxQtQSWD0UIOPlSGaSl9qQzYSFfZwS60Kd4qVcnQ7Uu8oMXlyfeSlhiI12tnZDVrq4jt2vPCsLOE+3JahsrqerGpg3Nz0m4XNw1DnvR69fEci9vYDZ66NZxUr4SrUmC8g==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 03:15:40.2598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d3d3b8a-c6fc-4cc3-df69-08d8b383ad53
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT020.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT229
Received-SPF: pass client-ip=40.92.254.53; envelope-from=Qiuhao.Li@outlook.com;
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

Now we use a one-time scan and remove strategy in the minimizer,
which is not suitable for timing dependent instructions.

For example, instruction A will indicate an address where the config
chunk locates, and instruction B will make the configuration active.
If we have the following instruction sequence:

...
A1
B1
A2
B2
...

A2 and B2 are the actual instructions that trigger the bug.

If we scan from top to bottom, after we remove A1, the behavior of B1
might be unknowable, including not to crash the program. But we will
successfully remove B1 later cause A2 and B2 will crash the process
anyway:

...
A1
A2
B2
...

Now one more trimming will remove A1.

In the perfect case, we would need to be able to remove A and B (or C!) at
the same time. But for now, let's just add a loop around the minimizer.

Since we only remove instructions, this iterative algorithm is converging.

Tested with Bug 1908062.

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 41 +++++++++++++++---------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 5cf39f4e6e..45c1627d32 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -71,21 +71,9 @@ def check_if_trace_crashes(trace, path):
     return False
 
 
-def minimize_trace(inpath, outpath):
-    global TIMEOUT
-    with open(inpath) as f:
-        trace = f.readlines()
-    start = time.time()
-    if not check_if_trace_crashes(trace, outpath):
-        sys.exit("The input qtest trace didn't cause a crash...")
-    end = time.time()
-    print("Crashed in {} seconds".format(end-start))
-    TIMEOUT = (end-start)*5
-    print("Setting the timeout for {} seconds".format(TIMEOUT))
-
-    i = 0
-    newtrace = trace[:]
+def remove_lines(newtrace, outpath):
     remove_step = 1
+    i = 0
     while i < len(newtrace):
         # 1.) Try to remove lines completely and reproduce the crash.
         # If it works, we're done.
@@ -174,7 +162,30 @@ def minimize_trace(inpath, outpath):
                     newtrace[i] = prior[0]
                     del newtrace[i+1]
         i += 1
-    check_if_trace_crashes(newtrace, outpath)
+
+
+def minimize_trace(inpath, outpath):
+    global TIMEOUT
+    with open(inpath) as f:
+        trace = f.readlines()
+    start = time.time()
+    if not check_if_trace_crashes(trace, outpath):
+        sys.exit("The input qtest trace didn't cause a crash...")
+    end = time.time()
+    print("Crashed in {} seconds".format(end-start))
+    TIMEOUT = (end-start)*5
+    print("Setting the timeout for {} seconds".format(TIMEOUT))
+
+    newtrace = trace[:]
+
+    # remove lines
+    old_len = len(newtrace) + 1
+    while(old_len > len(newtrace)):
+        old_len = len(newtrace)
+        remove_lines(newtrace, outpath)
+        newtrace = list(filter(lambda s: s != "", newtrace))
+
+    assert(check_if_trace_crashes(newtrace, outpath))
 
 
 if __name__ == '__main__':
-- 
2.25.1


