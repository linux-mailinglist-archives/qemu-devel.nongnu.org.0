Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBF940ABCD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 12:36:55 +0200 (CEST)
Received: from localhost ([::1]:45652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ5o6-0005qH-AW
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 06:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5dx-0004g0-6r; Tue, 14 Sep 2021 06:26:25 -0400
Received: from mail-db8eur05on2115.outbound.protection.outlook.com
 ([40.107.20.115]:20224 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5dt-0003Ok-SI; Tue, 14 Sep 2021 06:26:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XiMfwo9/uj7O6d0J7lrE3ti9GPH3K6WV5vvrTS7snwRBiwLAAWyvSYpe/7ml1xJD4me4gykXy2w3p2KB7XVTCqR0c9FP+rPmhcu3cU8IHtb24rDTQ6dpF0jfJpkucWsJq3CZQdLk+qu2QBRG6/8647bn05dQgv1EOxyvK9Dnb5+Bx7G2lXgcKbaCcIcCEssR4eoQK0wEdrY4FouqX5deGR+3txgEOO5W/a4aZB0GUFpjYO3/YGg6g0QIzBRqpHcoHwyVN9PW6HpmC81vJsHlL/OA27ury/oiUHchkjtKwUaI8RdKmyRXbIpJAdeVQJ6cmhnZHvIp6j3GWsGIXc+Qxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=3ckk487bHh78KNfFinCAGa/VaCSDe/X2bpCZZCwwW8E=;
 b=Dsb2IsoY0Dx12iYcAkinS8LGa5aijpkmicr+X/x8Q8OP7CEj1xD5ENMF2u1OyJLmXiPc4Hutjh69il9EIDZXFDUjIR46EgPCog59WVSFls7oMlGoBzzyN6/A4tN8neUGMZVn2LOZC0y3T8/oBsOuzvRmiU6m7Pr6uh0qHStdj/YeWfijj3sXgQREcbTIBbOAtUcr1ZdPKln6zwT5mEXwoFEbuZ18CciRrrrXmDZHzejzAPOAnHqA2wx2JvJ00j6vBUgLHhUpcpcdOktQqFgEARRvLdW79RRESTn5S+484WPJ/NHpRgbK2f9xMrtR6EXjjlStCapmvVhxsFuwoAr54w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ckk487bHh78KNfFinCAGa/VaCSDe/X2bpCZZCwwW8E=;
 b=cO7FhF+4hK71EC31UEeSVRJj18KCIQmo5EyxNaUCBad/T3JK2U0ZW3BObSZDM/qkIUjCMMmNIl/LkA+uoGwTDBsJcrEyluIcBUE3a+8QOXSAue60noE3lOAg3nfQd/XRgKyA/KfaOljIUF3gt7heyss24l/tChanKJVwie+ulv8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6071.eurprd08.prod.outlook.com (2603:10a6:20b:29f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 10:26:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 10:26:15 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v3 08/17] iotests.py: filter compression type out
Date: Tue, 14 Sep 2021 13:25:38 +0300
Message-Id: <20210914102547.83963-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210914102547.83963-1-vsementsov@virtuozzo.com>
References: <20210914102547.83963-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::14)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 10:26:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1d933c7-a1f5-4bfa-807d-08d9776a14df
X-MS-TrafficTypeDiagnostic: AS8PR08MB6071:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB60711CD24E8E2137463557ECC1DA9@AS8PR08MB6071.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 44weQ2X9xtwr/yur61mXYmTyIs+IZjqs7RdMpVyR8noui/9P3xfcS175rIxEETS8jaRXo1Svw4Cpov/wYGOimvZGDO1D4wc8xeBV3zH8e0GwgL9/gq9vY5JIFCUPSlNz8+2k2KrVqHo5syN1lr3D8ER9MPrkb2urvHAinb3fuRxW3wfXAER8lU3wbXoYKDl8+2TXoAiPYjeVO4vK8TdiiZnpYhAonuN6rmXyW6qKmT8cGuWKDkYOwX4wWA/jaqU+8jQW3wpyLGPI5JibowG3ISMWAGQH/xh/cj+uf4KCcCzBBCfq1LMby24ZtD5UAjfa3jrMLjsBtptovmSWxb+UOZePShNcK3fTKUVltok9nPN8Qk2/RwpCd19bTVp+fhwn5+iLBx9Mn9mA6LEvVMJlxOOlTUiPO4ImbTm1tTQ2BDJ58unXddIScSPN3h81U2tBwLbGGIm3AHReuEFjXwylIioi9y1yz0xoUdGgbEqcuRhENPVfz4zosBuqFmKHDRB8SG+X6yjjF0ivcd6tavfBRvxVsSZgDJiIQCmsqYnMlZ5V8zGbMNtfgnCNDZSnRaFq7iAPYlTS2Jb4VnpD97ieKZdwodn2Uum+zfFYZ2U0Wm6SudDCMdB/0FZ7Ml0wiqbawbAMXIuLft+nak5geuRVhdXjYSN0GIU0C8jg5PRMD6iLOaM3+3FtfulMlofaz2xL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39840400004)(366004)(136003)(396003)(6486002)(26005)(86362001)(2906002)(6666004)(38350700002)(66476007)(38100700002)(66946007)(478600001)(8676002)(36756003)(956004)(66556008)(1076003)(186003)(6506007)(6512007)(6916009)(83380400001)(5660300002)(2616005)(8936002)(4326008)(316002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bmxTcHNajMFSWS8hAX9z8BdlchsdyzESkuuO/6vUTrluzFziLit0qzcymHML?=
 =?us-ascii?Q?OwnKkZZRXZdshSbok1G9aIhs/Te+RJr4pwOTCVJ/3CTUgu4UXlTniqSvQPoe?=
 =?us-ascii?Q?M2FV72IJAOXv/cy3jFdAxHwU/EqSBmcmks91THkeIb5KmY1ulcHCXwWAi0qL?=
 =?us-ascii?Q?1q5lqtnlrInLnRKnxBMPns1kRiRURIaRMHzL8LHL36rykrXU4OuJwqdRx1LU?=
 =?us-ascii?Q?EnA/iztkhMkYFMKjKkj7Kauoxs5gdE8mUPBt7IACazNGVzHu1fGL6m6Hm4FM?=
 =?us-ascii?Q?k/uH2cpns/LsmRNwDifwUjEpzxz4qNUfTnxx3vT5/xhda4mRxXzYyCvRAEPq?=
 =?us-ascii?Q?mDIrfMUbBBAaZwoJMoL1gY/e4VvK47K/VMi2jM2p6tjOrgbd93WGtDg7H4DC?=
 =?us-ascii?Q?qtveWNXSQBjMLkL7RBem09TVR4a83Kvl8rAF4JOXPUDwAdq9qcdgYAApkiaI?=
 =?us-ascii?Q?EoAHWycJkVciDVcdxvj+qz/V1dTCIpxD2UE6l3OuvOVVsB5957sGmVioD5A/?=
 =?us-ascii?Q?xMSSYB0irzDq4KJdEQspT1UXSMrb51vAFW/HSINcGfjauans6UwyXn+e8gAB?=
 =?us-ascii?Q?jNDE1vUaRBZNiXhgAadzu7ln/MZZzMFYY5YR5WaRkfFbyQWFBebB0fvJP8Hm?=
 =?us-ascii?Q?e8v3KrxV0O8FhYAc0jgbo8R3EXlHpoVvKcMKkWlFZt2VP7jJUdP8CBnWXrhp?=
 =?us-ascii?Q?+t3+LNv2k8vjGf0HUwy1AhJgRCVjZ03BwxjPNfJUQF34mA7UlyPrDdyZBcci?=
 =?us-ascii?Q?NbYutjJvwNAlIVzvfBTqKpHQiKI0e7uMomRFHBoFbTroahuT4z9EzSmPuJhw?=
 =?us-ascii?Q?UX0ZqH4nfgbN91bGWemreGfufOsxpu0MKq/UAPrrTC7Mf9MQxUa6CDl89avG?=
 =?us-ascii?Q?NrtgKmJWGEL37G55DexEuBFID2uAsKqcxcDt2wtj9rokvn/CYQJkYmG53IxS?=
 =?us-ascii?Q?5GKZKOdRk51G0rq/F/nhgKSFtMebhPUeWJzVkEwk5NFhYmXNuS9LZOJDJ7qt?=
 =?us-ascii?Q?LxPG6DXvxb4OxToWUICBppJMz8AIIcQ+FybazmxZmkQUAw/UGDq62Or3WGGW?=
 =?us-ascii?Q?tTZ+N/w9gpJ8X951lRTUTzNl4dJIO2U66kpcnYU2jppkyPrj4CRhP2pNGoaX?=
 =?us-ascii?Q?I89A9Mn6Yf2bseDcMmzMlDUjaEWheihgsdwPsMatpmRrToT3IrueG7vdqQnM?=
 =?us-ascii?Q?cVcwgWR6dD1QNEZcarGYbGOiIeydbrixNI6E7JIodDHhF5jAQYOQSJ3xevji?=
 =?us-ascii?Q?cR8O1Xd72iFbyWp/K1c09dxZI7exKg5Tv/5/CIVaRzzN6w8KPy5cyJ1jwwQI?=
 =?us-ascii?Q?vCJrFYmVB6yk/BiUS33gue8j?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1d933c7-a1f5-4bfa-807d-08d9776a14df
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 10:26:15.1529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ur/shpd2xKHACDX6R+WscKelLtgy9TSEpy37L5u+XMq8nZmFtrCEosM2TdrmLB4Q0CqdBEi2RnvjLVa5aWmOZIPwV5uu8wT12POAoO4qVpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6071
Received-SPF: pass client-ip=40.107.20.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want iotests pass with both the default zlib compression and with
IMGOPTS='compression_type=zstd'.

Actually the only test that is interested in real compression type in
test output is 287 (test for qcow2 compression type) and it's in bash.
So for now we can safely filter out compression type in all qcow2
tests.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/206.out    | 10 +++++-----
 tests/qemu-iotests/242.out    | 10 +++++-----
 tests/qemu-iotests/274.out    | 10 +++++-----
 tests/qemu-iotests/iotests.py |  2 ++
 4 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/tests/qemu-iotests/206.out b/tests/qemu-iotests/206.out
index b68c443867..253209eca9 100644
--- a/tests/qemu-iotests/206.out
+++ b/tests/qemu-iotests/206.out
@@ -18,7 +18,7 @@ virtual size: 128 MiB (134217728 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -42,7 +42,7 @@ virtual size: 64 MiB (67108864 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -66,7 +66,7 @@ virtual size: 32 MiB (33554432 bytes)
 cluster_size: 2097152
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: true
     refcount bits: 1
     corrupt: false
@@ -92,7 +92,7 @@ backing file: TEST_IMG.base
 backing file format: IMGFMT
 Format specific information:
     compat: 0.10
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     refcount bits: 16
 
 === Successful image creation (encrypted) ===
@@ -109,7 +109,7 @@ encrypted: yes
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     encrypt:
diff --git a/tests/qemu-iotests/242.out b/tests/qemu-iotests/242.out
index 3759c99284..ce231424a7 100644
--- a/tests/qemu-iotests/242.out
+++ b/tests/qemu-iotests/242.out
@@ -12,7 +12,7 @@ virtual size: 1 MiB (1048576 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -34,7 +34,7 @@ virtual size: 1 MiB (1048576 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     bitmaps:
         [0]:
@@ -68,7 +68,7 @@ virtual size: 1 MiB (1048576 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     bitmaps:
         [0]:
@@ -110,7 +110,7 @@ virtual size: 1 MiB (1048576 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     bitmaps:
         [0]:
@@ -161,7 +161,7 @@ virtual size: 1 MiB (1048576 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     bitmaps:
         [0]:
diff --git a/tests/qemu-iotests/274.out b/tests/qemu-iotests/274.out
index 1d2928e14d..1ce40d839a 100644
--- a/tests/qemu-iotests/274.out
+++ b/tests/qemu-iotests/274.out
@@ -50,7 +50,7 @@ backing file: TEST_DIR/PID-base
 backing file format: IMGFMT
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -79,7 +79,7 @@ backing file: TEST_DIR/PID-base
 backing file format: IMGFMT
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -114,7 +114,7 @@ backing file: TEST_DIR/PID-base
 backing file format: IMGFMT
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -141,7 +141,7 @@ virtual size: 2 MiB (2097152 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -176,7 +176,7 @@ backing file: TEST_DIR/PID-base
 backing file format: IMGFMT
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 0ff9e87510..d9a764404e 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -472,6 +472,8 @@ def filter_img_info(output, filename):
                       'uuid: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX',
                       line)
         line = re.sub('cid: [0-9]+', 'cid: XXXXXXXXXX', line)
+        line = re.sub('(compression type: )(zlib|zstd)', r'\1COMPRESSION_TYPE',
+                      line)
         lines.append(line)
     return '\n'.join(lines)
 
-- 
2.29.2


