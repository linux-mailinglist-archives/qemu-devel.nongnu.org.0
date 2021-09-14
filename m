Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9466740ABE5
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 12:42:36 +0200 (CEST)
Received: from localhost ([::1]:59554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ5tZ-0006nG-Vi
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 06:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5e9-0005Ky-1D; Tue, 14 Sep 2021 06:26:37 -0400
Received: from mail-db8eur05on2115.outbound.protection.outlook.com
 ([40.107.20.115]:20224 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5e6-0003Ok-SI; Tue, 14 Sep 2021 06:26:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTCYoCiXtBbaJjGB1dTiy0DcxYh05bvLe8KdC53mNTwn2LUJvg8iVEJ2b/KrUnwg9Qvi59XBDyUa/6YlyReLp8SBnnCCp7i8cDo6KLynf89nqwHrIAeoXLoABADh62qnaK3g7dGAXjQU5t9PLN5ylJeI1jOg06pWtLOsL46di0qSI5YueGmy5d3G/w52pPyx/wlCjwtvTJTNpZugYwqVc9t6BwAkphrF2LN7eOz2SGkSyNIfIXcUSToMTL71rj7DE3SHPfQ0WU2bbu17s7WxLdRHC2SXdE9y0UdtGLlgcJucYGQY22/QagTwoDR1KAdXbkELr9gFxYeCI4W1MdOXmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=1gAEGzacDg87dFaLFKvXy2ZbAwFMsUV1qSooLYZJMIc=;
 b=m9VDOpfDUcgwoYo9qWYmcBH+nwZrQMiZlpVjApPNDuOHgr7s6vI3/3aptroO6cI5pg8boqTFMqYVY9Oc2Kad9AmYrvpOwu9meVjKC5aAvq4UEQmRXCO4aaQH9ApthuGNsHU59fKXSdo4HD8pYmiQd+MIC1U1njhRkkd1oH7UEIEOOPyGG3PskVShUDiAc9QpOT42zYMKNV+bY7gq7FguvNsdslgYWKzmJOLfloaQHyLxk6oQqyZZy3ngb6SY9moqU1CXWoYhs9CsZUY8se35XDvmygu2Tmoj1QzyiLLX++W/wd3r4Vb4qCn8Rj71MxanXuilme1xzrK+lJkfIbb3SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gAEGzacDg87dFaLFKvXy2ZbAwFMsUV1qSooLYZJMIc=;
 b=kxeasRO5JlRJ0e1tNbBfdtFmeDwcJ8sDXM9JfdY+1VYxzdYfTlxJd73YjI3aRFiIqkQ8eQl6e/YF0IhDGWDd9VzS0u+iPrg2VmkvOYqaEe+hjYbjxIsk/MgVWf0ZhQboj4+o1ON5uULra8AXKV8N0XWX4ebrCc5Yw07PykgIZLg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6071.eurprd08.prod.outlook.com (2603:10a6:20b:29f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 10:26:21 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 10:26:21 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v3 14/17] iotests: bash tests: filter compression type
Date: Tue, 14 Sep 2021 13:25:44 +0300
Message-Id: <20210914102547.83963-15-vsementsov@virtuozzo.com>
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
 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 10:26:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02909d2e-131f-4286-bdb8-08d9776a18c2
X-MS-TrafficTypeDiagnostic: AS8PR08MB6071:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB60710CAB5712C48F11120076C1DA9@AS8PR08MB6071.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: asDUj1xjSTzcLrqemA+gEabz4NCB6rnI5JuTlm7ceoryE8VwFct3v4E+GiUfJIbmqN5Y9RRyYej7GZ+l8FPFB7SUttH/nCt/vUTAvlnYgrRTRd+ZavVDY9s92Ht6oXb+W+oDLlQONuhLrkj/1DT4U86Q8RThyPJtfvNXQK5Cne8NGmfoeXQl18YuygdflSXUV/KjOkfjQLqQLERl0mI0sxu0dpGlfWKseFVKU0F3IP/XLi5wnGueeGl6lyvMiu4LTYAQo6L8HOj0J5wiNkThTZuq7bXq2w6odccB7jWthnHsWknuqrQmcketRRQ+15f9s681DP/qmUUkWrkCFOIpY4puz0r9Xko3Nn6Z/o9m2PvDOo6xd9M9soFORdsT0Ao3/dlJ2BojgIonbCs0SRmBlq4MGUk4VggMWliHrhBw7HcpyYoLAm7xDKtHDhdEoashbW8QVapF+wKCjNZeIvmt51uqyJjVSpl5KjpkxVJSR5vH497PFptaBam4dq/W2jYnzGjAVvbbgfl71YOkXAkQN4bfGoaR8VETuOnGoVlteyNz5QqK6sDAXCqxJbWtpD701U/jFunXMEsVfJxSbTjenkFAud+KAedtwS+f8AI8gNU8GXunwDUIxbLtq6wOvBdXFUHvIhP411hok+ndhAd1U0jRdwKj41QnqPvQnGXuCV+wNVQ2l8dtOtkH2nx0WiUjiGi3xIzYYPNvv3sFeElmkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39840400004)(366004)(136003)(396003)(6486002)(26005)(86362001)(2906002)(6666004)(38350700002)(66476007)(38100700002)(66946007)(478600001)(8676002)(36756003)(956004)(66556008)(1076003)(186003)(6506007)(6512007)(6916009)(83380400001)(5660300002)(2616005)(8936002)(4326008)(316002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TSwnY7SgH9f8viMU6JguisEbsY1OE+GYR/afWJtxeKj17FdoptH6lx3waSkr?=
 =?us-ascii?Q?eGRsBNAxTH/PQ3qvl0H8UH+1ATz23sjRdQmFmeM3jBASYUUhBrh+ZsvLKhHb?=
 =?us-ascii?Q?A+Wyy0WP3nZ/Oi7iQtmn5l2MJSO2xpseQLn1/N2vnJmqcHOIzkYkCplMUHjr?=
 =?us-ascii?Q?jE9ATbN1Vp3BoAmoHY06Il0wdou3S2fbpUluHmSd+l91m6XYALgBYysgv64L?=
 =?us-ascii?Q?YEhP71fF/tpTtyLoi24RMVJx6afSz8QUstuTLCH9Ls6GwNcYpa2YGYeAd1R+?=
 =?us-ascii?Q?bIafG8YhKJe5HC8KsoXa2HLkw351hsYqaboaqX34uzwOYUeuMvRd4CZ31/B7?=
 =?us-ascii?Q?ty1bHop3GdZuJPgPp3h8yrcizkYkGeNDKqU61NnfUmB5ZtvomhSo+Bv8vzT3?=
 =?us-ascii?Q?wc5UVi8GZawSSyacn03NvTzM1IeKw49kKN1H+gSnmV1xDU0/CBEH0vHs9loq?=
 =?us-ascii?Q?Hw27MENZ8UIKSn0Q46GaMGBKqkkjx4483z6hr14bHNC5+bLFcYMq09FBKXlR?=
 =?us-ascii?Q?ZaOYV5sXmZqFOzdbwvJB0Woslo+A8KS48vjtsH30v/jZ67nihRiAWdPihB0r?=
 =?us-ascii?Q?z9Qir7nLhwpXv1cHuClsdZj0u78x296TMR4cbRpPEM829SRMyrU+DX0YjZaj?=
 =?us-ascii?Q?rpzlO5EeXwbiB5v6qm+p0pJJsiSSG+4dTwLEhFgn/7wfhghCcFJHTFOfdJml?=
 =?us-ascii?Q?IgTsriwbe59HttFOVB6nhIOy9roncE8wAllg7UanULx3XR/V49qU5t6DdaBR?=
 =?us-ascii?Q?GX9+geOIBlJzD0Uov2WmMVVKHGAxXgwN6AbJeND8lhegB1G5XdxNSSqvNqwL?=
 =?us-ascii?Q?1nxZ/KI+hYdnjZcBJUMfPlnC463JNxYTBoJLlpjIlwQsgkSFHQW1sj9ROLnW?=
 =?us-ascii?Q?XA02LwYh9hxQexC67ZLOCn+on+9rIse/T35ibaw92/H603ZZsZ/kJC2OFAuB?=
 =?us-ascii?Q?Utoo3Anx5N40JvpX4A3wseFPE2hyETJnCBsObzNe/wv/3Dxtp0qiPH9maXrQ?=
 =?us-ascii?Q?KSSIsp2oAh6jmdxJTP8nttI/Tzs7m8hYTCcGBswkeuCdimFH8/mcrcseK2Rt?=
 =?us-ascii?Q?3ta6talotQOMwrtjp1hzLtN9D9IdMzUGJP/85ich3qYQr8MuJuM61lfmeyDt?=
 =?us-ascii?Q?dtaWzOnCGXEF1azPuRYHYFo4+biOww7uU3ENedA92O3o0AS8zdARH0q7LcC9?=
 =?us-ascii?Q?7uVrV45BjQxM3eEwmN02Twpv8EGU2NZi3bBRfnnerzIGhgY7UyLEB/Z5lFFX?=
 =?us-ascii?Q?jmDLMuQ44Nn6/ma6XKWihnVO+HBsoJfs69bCC8FF3cIEoiKaQ0220iEAg4xa?=
 =?us-ascii?Q?5KwgA2lMFn9bbDFqEuzyTZ8a?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02909d2e-131f-4286-bdb8-08d9776a18c2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 10:26:21.6923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFqpbCpiy8ngVyBFYY9aZyUcdGw/htzFg8M7WM59FtOb9Owlw1PxqtlVtUSugmEJCjGltmuRGGRyrDVlo9Zez6SUU0+b+669FNGCFIq+5AU=
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
test output is 287 (test for qcow2 compression type), so implement
specific option for it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/060.out       |  2 +-
 tests/qemu-iotests/061.out       | 12 ++++++------
 tests/qemu-iotests/082.out       | 14 +++++++-------
 tests/qemu-iotests/198.out       |  4 ++--
 tests/qemu-iotests/287           |  8 ++++----
 tests/qemu-iotests/common.filter |  8 ++++++++
 tests/qemu-iotests/common.rc     | 14 +++++++++++++-
 7 files changed, 41 insertions(+), 21 deletions(-)

diff --git a/tests/qemu-iotests/060.out b/tests/qemu-iotests/060.out
index b74540bafb..329977d9b9 100644
--- a/tests/qemu-iotests/060.out
+++ b/tests/qemu-iotests/060.out
@@ -17,7 +17,7 @@ virtual size: 64 MiB (67108864 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: true
diff --git a/tests/qemu-iotests/061.out b/tests/qemu-iotests/061.out
index 7ecbd4dea8..139fc68177 100644
--- a/tests/qemu-iotests/061.out
+++ b/tests/qemu-iotests/061.out
@@ -525,7 +525,7 @@ virtual size: 64 MiB (67108864 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     data file: TEST_DIR/t.IMGFMT.data
@@ -552,7 +552,7 @@ virtual size: 64 MiB (67108864 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     data file: foo
@@ -567,7 +567,7 @@ virtual size: 64 MiB (67108864 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     data file raw: false
@@ -583,7 +583,7 @@ virtual size: 64 MiB (67108864 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     data file: TEST_DIR/t.IMGFMT.data
@@ -597,7 +597,7 @@ virtual size: 64 MiB (67108864 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     data file: TEST_DIR/t.IMGFMT.data
@@ -612,7 +612,7 @@ virtual size: 64 MiB (67108864 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     data file: TEST_DIR/t.IMGFMT.data
diff --git a/tests/qemu-iotests/082.out b/tests/qemu-iotests/082.out
index 077ed0f2c7..d0dd333117 100644
--- a/tests/qemu-iotests/082.out
+++ b/tests/qemu-iotests/082.out
@@ -17,7 +17,7 @@ virtual size: 128 MiB (134217728 bytes)
 cluster_size: 4096
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: true
     refcount bits: 16
     corrupt: false
@@ -31,7 +31,7 @@ virtual size: 128 MiB (134217728 bytes)
 cluster_size: 8192
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: true
     refcount bits: 16
     corrupt: false
@@ -329,7 +329,7 @@ virtual size: 128 MiB (134217728 bytes)
 cluster_size: 4096
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: true
     refcount bits: 16
     corrupt: false
@@ -342,7 +342,7 @@ virtual size: 128 MiB (134217728 bytes)
 cluster_size: 8192
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: true
     refcount bits: 16
     corrupt: false
@@ -639,7 +639,7 @@ virtual size: 128 MiB (134217728 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: true
     refcount bits: 16
     corrupt: false
@@ -652,7 +652,7 @@ virtual size: 130 MiB (136314880 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -665,7 +665,7 @@ virtual size: 132 MiB (138412032 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: true
     refcount bits: 16
     corrupt: false
diff --git a/tests/qemu-iotests/198.out b/tests/qemu-iotests/198.out
index 3952708444..805494916f 100644
--- a/tests/qemu-iotests/198.out
+++ b/tests/qemu-iotests/198.out
@@ -36,7 +36,7 @@ image: json:{ /* filtered */ }
 file format: IMGFMT
 virtual size: 16 MiB (16777216 bytes)
 Format specific information:
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     encrypt:
         ivgen alg: plain64
         hash alg: sha256
@@ -81,7 +81,7 @@ virtual size: 16 MiB (16777216 bytes)
 backing file: TEST_DIR/t.IMGFMT.base
 backing file format: IMGFMT
 Format specific information:
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     encrypt:
         ivgen alg: plain64
         hash alg: sha256
diff --git a/tests/qemu-iotests/287 b/tests/qemu-iotests/287
index 6716419da4..aab03fb973 100755
--- a/tests/qemu-iotests/287
+++ b/tests/qemu-iotests/287
@@ -61,13 +61,13 @@ echo
 echo "=== Testing compression type incompatible bit setting for zlib ==="
 echo
 _make_test_img -o compression_type=zlib 64M
-_qcow2_dump_header | grep incompatible_features
+_qcow2_dump_header --no-filter-compression | grep incompatible_features
 
 echo
 echo "=== Testing compression type incompatible bit setting for zstd ==="
 echo
 _make_test_img -o compression_type=zstd 64M
-_qcow2_dump_header | grep incompatible_features
+_qcow2_dump_header --no-filter-compression | grep incompatible_features
 
 echo
 echo "=== Testing zlib with incompatible bit set ==="
@@ -75,7 +75,7 @@ echo
 _make_test_img -o compression_type=zlib 64M
 $PYTHON qcow2.py "$TEST_IMG" set-feature-bit incompatible 3
 # to make sure the bit was actually set
-_qcow2_dump_header | grep incompatible_features
+_qcow2_dump_header --no-filter-compression | grep incompatible_features
 
 if $QEMU_IMG info "$TEST_IMG" >/dev/null 2>&1 ; then
     echo "Error: The image opened successfully. The image must not be opened."
@@ -87,7 +87,7 @@ echo
 _make_test_img -o compression_type=zstd 64M
 $PYTHON qcow2.py "$TEST_IMG" set-header incompatible_features 0
 # to make sure the bit was actually unset
-_qcow2_dump_header | grep incompatible_features
+_qcow2_dump_header --no-filter-compression | grep incompatible_features
 
 if $QEMU_IMG info "$TEST_IMG" >/dev/null 2>&1 ; then
     echo "Error: The image opened successfully. The image must not be opened."
diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common.filter
index 2b2b53946c..75cc241580 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -247,6 +247,7 @@ _filter_img_info()
         -e "/block_state_zero: \\(on\\|off\\)/d" \
         -e "/log_size: [0-9]\\+/d" \
         -e "s/iters: [0-9]\\+/iters: 1024/" \
+        -e 's/\(compression type: \)\(zlib\|zstd\)/\1COMPRESSION_TYPE/' \
         -e "s/uuid: [-a-f0-9]\\+/uuid: 00000000-0000-0000-0000-000000000000/" | \
     while IFS='' read -r line; do
         if [[ $format_specific == 1 ]]; then
@@ -337,5 +338,12 @@ _filter_authz_check_tls()
     $SED -e 's/TLS x509 authz check for .* is denied/TLS x509 authz check for DISTINGUISHED-NAME is denied/'
 }
 
+_filter_qcow2_compression_type_bit()
+{
+    $SED -e 's/\(incompatible_features\s\+\)\[3\(, \)\?/\1[/' \
+         -e 's/\(incompatible_features.*\), 3\]/\1]/' \
+         -e 's/\(incompatible_features.*\), 3\(,.*\)/\1\2/'
+}
+
 # make sure this script returns success
 true
diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 5dea310ea0..9885030b43 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -699,6 +699,7 @@ _img_info()
             -e "s#$TEST_DIR#TEST_DIR#g" \
             -e "s#$SOCK_DIR/fuse-#TEST_DIR/#g" \
             -e "s#$IMGFMT#IMGFMT#g" \
+            -e 's/\(compression type: \)\(zlib\|zstd\)/\1COMPRESSION_TYPE/' \
             -e "/^disk size:/ D" \
             -e "/actual-size/ D" | \
         while IFS='' read -r line; do
@@ -998,12 +999,23 @@ _require_one_device_of()
 
 _qcow2_dump_header()
 {
+    if [[ "$1" == "--no-filter-compression" ]]; then
+        local filter_compression=0
+        shift
+    else
+        local filter_compression=1
+    fi
+
     img="$1"
     if [ -z "$img" ]; then
         img="$TEST_IMG"
     fi
 
-    $PYTHON qcow2.py "$img" dump-header
+    if [[ $filter_compression == 0 ]]; then
+        $PYTHON qcow2.py "$img" dump-header
+    else
+        $PYTHON qcow2.py "$img" dump-header | _filter_qcow2_compression_type_bit
+    fi
 }
 
 # make sure this script returns success
-- 
2.29.2


