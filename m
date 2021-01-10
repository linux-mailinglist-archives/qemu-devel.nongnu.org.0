Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCCF2F0764
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 14:24:45 +0100 (CET)
Received: from localhost ([::1]:58568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyai3-0007Ey-QJ
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 08:24:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyae4-0005If-63
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 08:20:36 -0500
Received: from mail-oln040092255108.outbound.protection.outlook.com
 ([40.92.255.108]:6040 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyads-0003z0-7r
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 08:20:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BEghSTVX3UCLcv1z6YdfPSxng8nkRMqbyzwrwKD8y5C6ofvcPRJUqc4ebBr+RKCBzCY02V/I/kgxFrkwajLq9czeBsq/ZkXf9pXMkWZRKlTkZhavdbnOxqbwqoFP2dZvRxpI6LV7fbLN1yUEbkrKlDO9gShaK4Qk5AMmdVu4V0FZBkVyI8xihbQxkLKAA4cHBC7+3sCWDdTRG6bJB8Ws6ZmmaUrB0Cb7bfzrm/+U2ElI7PlWPSriruh6rpb4jjKeHmBlpbIwN1AxWMVHe/bTqRjJMda4Z18Cf9N7LPVE7ji06LJe8BSJm5lynQF6J/34crqRbJ0k9lX0XbGcrwpYhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWCQvrwHfs4UukNcMgmmi3IVA4aqGwZRoCNmGbLm05s=;
 b=I5yYlCiXgN9/ii/aPtmqBqwncJS2PeI51n3P7vfIxUGl08dPWR4Dj2wcYeBHbpcKUyrrHeoiqOeb/HuddWUOu8UZWCoOKaYEzv2+ZTyofp0oeVuuNMYk1aiBjZV8FZ7cZzq38M8Mye8CBaDpa4XKYRcYGe91UbbzWFIq/LFTlDzEUz4ERDZs+kOd3NLJN3GAL6AcfcERrbW9C8mQ42o1WZQdEcSchRQEc73YKDgHLhoqK0pTpvd4KRdJNpn9q3hOeHa+LoMMQg0xDqPjSJFqbqE9KC3o/WVUUHrspbWkDGjYZqeumXNCzu8HHjKGWIjMAQs/FSGuwWc1gidwY0GAjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWCQvrwHfs4UukNcMgmmi3IVA4aqGwZRoCNmGbLm05s=;
 b=o3ISO97CuIv2MxhK0V9t+rYtkCxr3FRZYf5maFe7AEHzr5OkBMFBue3o/XWhb/d0MnoWokBZM7bk/LE1hzinhRo0zBIwPvpOlTLbdxQGCcwq7vLumocmv9mBAql3w/JvxRVZBi2E19tLYk35nBN4n8IwWikAKo8E5D2L0Ehss8yDKGB0GKV8oTbRj7kt5d3udwML461++rAx4UwSMZd1jqjx070G8wQESZePV2zAAXEOKFsLriHyh2ex7gUczM8DoJfZ/HkPgkwbIEg8ZSziPAk+1poj8+q4kn16GvVcbfnkTX2I+1UBrIkn3T8T+3wU829EhNgSqKOQPGc7ELv56Q==
Received: from HK2APC01FT060.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::51) by
 HK2APC01HT219.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::411)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sun, 10 Jan
 2021 13:20:13 +0000
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 (2a01:111:e400:7ebc::52) by HK2APC01FT060.mail.protection.outlook.com
 (2a01:111:e400:7ebc::416) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Sun, 10 Jan 2021 13:20:13 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:C86F4672FA4C2C8B59CF6ED2E9D7E3B1742A114474E048D42D89749EAD9AF374;
 UpperCasedChecksum:7F52FC36AD75B3F7F5ED8AAFBC062CD0ECEE36C4EF78C13B8DC738251B2C457D;
 SizeAsReceived:7561; Count:47
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780]) by SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780%5]) with mapi id 15.20.3742.011; Sun, 10 Jan 2021
 13:20:12 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v7 2/7] fuzz: double the IOs to remove for every loop
Date: Sun, 10 Jan 2021 21:19:32 +0800
Message-ID: <SYCPR01MB350214B706F0A9D774CDE9B1FCAC0@SYCPR01MB3502.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <SYCPR01MB3502023A4AFC1E75DC3747ACFCAC0@SYCPR01MB3502.ausprd01.prod.outlook.com>
References: <SYCPR01MB3502023A4AFC1E75DC3747ACFCAC0@SYCPR01MB3502.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [ZNfcQsGweh7wxFQibmTtP8yLuKVsafu+]
X-ClientProxiedBy: HK2P15301CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::27) To SYCPR01MB3502.ausprd01.prod.outlook.com
 (2603:10c6:10:3e::12)
X-Microsoft-Original-Message-ID: <20210110131937.98351-2-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (111.176.239.56) by
 HK2P15301CA0017.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.0 via Frontend Transport; Sun, 10 Jan 2021 13:20:12 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 3b1b3d7a-fd13-407a-3ece-08d8b56a765d
X-MS-Exchange-SLBlob-MailProps: =?us-ascii?Q?KE5ywuOaN5idtt69Y1RXkPvCFgonS6VzPC0kkpEdaJ7Q5TY8I4NGmRongek2?=
 =?us-ascii?Q?1SDp/LMIEhbLh1MuI8tHwIVGqItjLUb4gbebUIQCektAefYlIrvyFL2Xr7YK?=
 =?us-ascii?Q?UTtdRkIlYw1b6x2lv4JhLXXsIEu4vS9wdbZy0dPTIhKr4C07bcKkGSqBwuPD?=
 =?us-ascii?Q?ei1BxLq/ff+01XCFa1Vm8QxTFQX6sLZGgflGjnLhxLx/moVkKEs4Atgl7axG?=
 =?us-ascii?Q?7uBlwc4Y5PF43WQcPhlAxedqZoimHU6OjDHbBa0vewK99A5yPqunvNFIldXO?=
 =?us-ascii?Q?YCDrswQjwDQKlfvOx7cvTyTA7DX78YeqlLRG4X4+s4CDNZrrrSe39V3YAWNY?=
 =?us-ascii?Q?buYxyHjQoOoV9R6yL9GXer9voVbPUODkq12xgkgV2ufpv9Nkdro+fnQPbKYb?=
 =?us-ascii?Q?+KNjFF6lD0WLDppNk86+e7EMcX1lbgkYpcTjipSKKTmJHL9/dbIu57i41jxY?=
 =?us-ascii?Q?18dUbUJklTLq/SIuyFgFjFIBPN1ycrpL+mGVzjANEOKkA88/Of8i81BvXTao?=
 =?us-ascii?Q?qs2RCjFO6R8pMZ0UHOCSaAfJlXl3ovQttEa8v+8Ow9jM7gjRlZHGJe3Q3jUm?=
 =?us-ascii?Q?wO+h9gB7tiEFtQdvumE342dRJ3Jnj5XcRqsfGpaluwCOhPnfDNs4+yUm4ZzP?=
 =?us-ascii?Q?GUFL/zKXYM4Rad6XVYqIkpwglAHA4URlM6BLuQ93ndfy87SqVt4hftB0hpal?=
 =?us-ascii?Q?mqIEpdrdXYpyjJnvXhvpwqnDSLzSfWKkYfVOBkLHmUvwj33HfH9QyBdP3hhb?=
 =?us-ascii?Q?7Rkpp830rl4GdcOnw6J1OnZdf4hjR/bcBnpdTXq5NcK+8tRvqOn1m2s7j7Hc?=
 =?us-ascii?Q?oLwY+Iw4xmuVR4afNFvQ5Xj1MScxxf02v7cfwS0y6S8euwgu8/0iiAzS8Aut?=
 =?us-ascii?Q?qyrTTlffeHJXT9hCwvgWo1YnCB4NBETxLKpw1hOwn0hvVsqd0SnzNZdBkq5K?=
 =?us-ascii?Q?hfkU1qPkri4WV0v0S7baIozuCHD79LMt?=
X-MS-TrafficTypeDiagnostic: HK2APC01HT219:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VWy5J1ranwWOeZnAI39FGsedg0DZzb7DyF3/IbGf0MxCjZtFwEDeIekDDFv3MZaX5DEdCUJpAuSWnn+CgU+iuzlWoCwRKKCj0ubBJc1vPi6JvEGBXhb7D468zZu1aTReF/FLmpsTYOOsp/KzwajUeT3wOu4E6XFByCdLMm+9FNqedcJxt4s1laUz7Z7HASC+xHMH1o8Wzt/8V3BvvMsgim3SFKyk6jocN/DXpiH8XUmDKtkSlQ4c6qcwMSw05VMqZ9FHqVjLvXAXTB84IMCiROYV1svsUHqtwIQ19s+V6CI=
X-MS-Exchange-AntiSpam-MessageData: /lDsbbySKQJ3yZZqGfCKHlZeoGX6f2+yAUtsyasydGeEbFP+gOOuKYhASXdUuL/IsY5sdDSOc+ZIn4jrIPIdIjX/BRFMWqJtHTGvXgK8ETRwtQUgntFTAyJM0NqwgRBh6pxujBxhkr+KvyhK9EWiog==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2021 13:20:12.9198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b1b3d7a-fd13-407a-3ece-08d8b56a765d
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT060.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT219
Received-SPF: pass client-ip=40.92.255.108; envelope-from=Qiuhao.Li@outlook.com;
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

Instead of removing IO instructions one by one, we can try deleting multiple
instructions at once. According to the locality of reference, we double the
number of instructions to remove for the next round and recover it to one
once we fail.

This patch is usually significant for large input.

Test with quadrupled trace input at:
  https://bugs.launchpad.net/qemu/+bug/1890333/comments/1

Patched 1/6 version:
  real  0m45.904s
  user  0m16.874s
  sys   0m10.042s

Refined version:
  real  0m11.412s
  user  0m6.888s
  sys   0m3.325s

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 33 +++++++++++++++---------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 97f1201747..3c11db4b8a 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -89,19 +89,28 @@ def minimize_trace(inpath, outpath):
 
     i = 0
     newtrace = trace[:]
-    # For each line
+    remove_step = 1
     while i < len(newtrace):
-        # 1.) Try to remove it completely and reproduce the crash. If it works,
-        # we're done.
-        prior = newtrace[i]
-        print("Trying to remove {}".format(newtrace[i]))
-        # Try to remove the line completely
-        newtrace[i] = ""
+        # 1.) Try to remove lines completely and reproduce the crash.
+        # If it works, we're done.
+        if (i+remove_step) >= len(newtrace):
+            remove_step = 1
+        prior = newtrace[i:i+remove_step]
+        for j in range(i, i+remove_step):
+            newtrace[j] = ""
+        print("Removing {lines} ...".format(lines=prior))
         if check_if_trace_crashes(newtrace, outpath):
-            i += 1
+            i += remove_step
+            # Double the number of lines to remove for next round
+            remove_step *= 2
             continue
-        newtrace[i] = prior
-
+        # Failed to remove multiple IOs, fast recovery
+        if remove_step > 1:
+            for j in range(i, i+remove_step):
+                newtrace[j] = prior[j-i]
+            remove_step = 1
+            continue
+        newtrace[i] = prior[0] # remove_step = 1
         # 2.) Try to replace write{bwlq} commands with a write addr, len
         # command. Since this can require swapping endianness, try both LE and
         # BE options. We do this, so we can "trim" the writes in (3)
@@ -122,7 +131,7 @@ def minimize_trace(inpath, outpath):
                 if(check_if_trace_crashes(newtrace, outpath)):
                     break
             else:
-                newtrace[i] = prior
+                newtrace[i] = prior[0]
 
         # 3.) If it is a qtest write command: write addr len data, try to split
         # it into two separate write commands. If splitting the write down the
@@ -155,7 +164,7 @@ def minimize_trace(inpath, outpath):
                 if check_if_trace_crashes(newtrace, outpath):
                     i -= 1
                 else:
-                    newtrace[i] = prior
+                    newtrace[i] = prior[0]
                     del newtrace[i+1]
         i += 1
     check_if_trace_crashes(newtrace, outpath)
-- 
2.25.1


