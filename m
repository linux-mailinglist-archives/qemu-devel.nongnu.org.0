Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B55173CF918
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 13:46:59 +0200 (CEST)
Received: from localhost ([::1]:55842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5oDC-0005Px-G1
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 07:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o67-0003by-0l; Tue, 20 Jul 2021 07:39:39 -0400
Received: from mail-db8eur05on2091.outbound.protection.outlook.com
 ([40.107.20.91]:40417 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o64-0007CC-GF; Tue, 20 Jul 2021 07:39:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UH7nd2OZN7ZujSZspP48aSklrU6Zd+dw5dy9e3QBnVgBP+Rmy4pQkVKNWvFQQ8cKG/S5Hm3jtugzoTnsGmpagthO75qAARGsEoddvE5FEdnzWi0ulMNvNcnlbNGyRdrf4cxWGL3TFJP3YbkTvxcYeJaoWZxH9WjgMGOTalrMvK2tRcQCIyY7ELNHUAdIm7cqKbuTXyFOK2zrBrayL6b9tNUks9v0qligRwKVk4xkx0bOiyTo19k4gfL6y5yC7+RPhtSWLvbyq0B6K3f8vn1MlotEpfzSyxyPXVcP6E2gxTOhzlJ/Ih1WRNSuafsn9aXS6OsZDP5P7QesSun80npH/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dR99mHHwsOQc5pdsQBk4io1kxe/OUYDa5scJJ/1+gAo=;
 b=ltrmKCaVPvbCo2OfUOuRRaCK/bS7+BPV8w1EqM16sKg5BTCSgIfz3wcPGw5cLJ8GC7cRfWQX+wKpmApeug5hzvIBtGHKxauPffnTeSsxO/dv7sZrZ+D3z/T8Wn6L44IPL1zZo+On3RpiFFRTgplBW84Y9D8MR06clwLdLpX4fT0x7HtaxvJJHv83SpjUF8mHE3uOVUx+s8xUsYtiaSUCN55jG0ftXTmNDlXRcGPcv5q0KrhfZYISpqLiXoVzyS2/IlpvEMhVXLLoEvt8jMOEFHTzGOV7wsHupliWWN8cXip057uyS/ixc7B8+jvPeHybb3+9Td16hlKBkEwy8JjQGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dR99mHHwsOQc5pdsQBk4io1kxe/OUYDa5scJJ/1+gAo=;
 b=ox7TtBi8NsXyhK9V7pEha6NVOXUDS6uWKsaITfsQg8cmJ8qk5BCyKW6+4noztwouAQQ8rqhC+f+kduQTyV058Us7SE+D/jNagfn3U3fEn3npA8gUIF2E8nTOuEVvknbbYkg1r8MHf9rOgvPcrIBsdMDjE4Ug3RiVhWG+edr5TRo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6119.eurprd08.prod.outlook.com (2603:10a6:20b:290::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Tue, 20 Jul
 2021 11:39:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 11:39:10 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 jsnow@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH v2 14/17] iotests: bash tests: filter compression type
Date: Tue, 20 Jul 2021 14:38:29 +0300
Message-Id: <20210720113832.586428-15-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210720113832.586428-1-vsementsov@virtuozzo.com>
References: <20210720113832.586428-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0146.eurprd05.prod.outlook.com
 (2603:10a6:7:28::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (31.173.85.199) by
 HE1PR05CA0146.eurprd05.prod.outlook.com (2603:10a6:7:28::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.25 via Frontend Transport; Tue, 20 Jul 2021 11:39:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a327a1f6-cdf0-43e4-afe7-08d94b72fdd4
X-MS-TrafficTypeDiagnostic: AS8PR08MB6119:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6119B2390DC3C68B62584C67C1E29@AS8PR08MB6119.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZRpoB5/ePZDtzUKHq7lvZMRzEK5/j3RnVP83Q/Z5isOAoBjSBzs53uTw/RlXlYVKDVYgrL3b72tWvjyOVQ9yGv/Eu/+A9CWWsQeuxOIVLemhiDiFSe598FFZZhoFBlsxBHW/L3JeBW9YbLBy70E4ZpJSfDoLfWW5JwNwbXh02XHPAYH4IGzTZtl5RiUblGju0rm88hrpJSpDbpR06/+KL0QWxf6UH4wIlasjlKiCBQNDyaAq6GARfViUyGacL7r1zuw8BfmKVPMZ/3VXCxcmrIJpG7nygy6uEsYkrgSj6qGx7XO3Nd1/eb7onhLX/Q1jApa4vSXGogCVoorqHihGEDjBR3B3HjsAyPLoE3mW0sudEY13dLryYCoD15OOhFqrGST0mCKeE0mBr9EGOYoNPAl1e05EdsHYVSkzU0h+IbA7NUe9aA0PVCmlyu2oKGTwbkrYb9z+OcSYprdbVsBASkewExRKfBBO6eoBkztBXePg1garkyoi+GW0VFtXw89kjjQIr3rJiJoUDQvRy5Sb1NCvgCA2Jv+1dJafNAv/I+H4Ik+mQi5FH01D5gav/xvc4cF4jHRgkVTq9GgmyMREJSRi5V+240eA+9VFEWvcqBe2NYiQu05dfC7VDSzwtrYMw3MC6WlZIGUAFYahEIghB4M7G2cvdw0R5UqeR5xqgKH83Og96wGXMf3UtF+SpJlrdsel1kE5v6yvC8Eu5kE9LA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(186003)(1076003)(478600001)(5660300002)(6512007)(6486002)(2906002)(83380400001)(316002)(956004)(2616005)(86362001)(107886003)(4326008)(8676002)(6506007)(6916009)(8936002)(26005)(38100700002)(66556008)(38350700002)(6666004)(66476007)(36756003)(52116002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wmLguXHpRJ3GMB2vSfyqPPltpes69U43Ntuhge5GxIDmPpLGFP8c1pVmKaVn?=
 =?us-ascii?Q?dXh+mDCw9fpCBdbPoGp9LD5WlTzTZsqSLp9d4Z29eEUk7lNvaqSMF6GEQpSS?=
 =?us-ascii?Q?8J1nioflzHODrdsoY2vMFpkKZQBDSILv7tixOGN2CbMV/e9AFMkTeohpSUPC?=
 =?us-ascii?Q?a/R4Wp1w/xcqpp3p+IoJsoAjxB4jmE02ZEPFpOeYNLlJ7NCxw8v0QaZM5jN0?=
 =?us-ascii?Q?+be05ZKIKA6f0ZmYHdxC5zZIn6rmf1F9fGSfA0XUu71c1wK6DyU3+5Hh/o5X?=
 =?us-ascii?Q?bjAiUUrjkBlHGOXY+vKJLgn8MN/Z5Oza2iTGgLeBWmzQhfdI4FnZoDk+0sRw?=
 =?us-ascii?Q?A7wIypvfzoanpfMyC2C45fm+ztgE5qjioIDjRSso/v91bHzigTSkhisCCBRF?=
 =?us-ascii?Q?d5N7JVEvpvDUqtRqYFWNjt0NSaTVBvSiX1NBhiom8QNe1KkjoU7y729Gdbbm?=
 =?us-ascii?Q?SMxjlBRnYWoy4o6eQRO133w3+2o25wH8Wd+lvNvFyQZtS50wee72qwB7RQA2?=
 =?us-ascii?Q?y7t6n7cK4ivkvQ64NVWPhgG/BjPdrUbHfdP6To/Kf42d9ooz44Y2Rupckyif?=
 =?us-ascii?Q?MzdZLnYHu2ORVPaNXT/i3YYHHtc367oxrpx60TK0v3/VXonxvrEllVfGdExR?=
 =?us-ascii?Q?wHRLNfOyJoTsMrYTiFTt+y6bEubeYUHKrg4JplvWZZ34CZb+MxI2RqaIPF2D?=
 =?us-ascii?Q?pw6zUj1Cks6lab8W4p4/eaOU1zA+jOpbaysZf8zGNbf7LZdY8Mw0vCP7Ms2i?=
 =?us-ascii?Q?XkoPxEyK3bQowMpW31/sHUPyuNRR2LR+fB80bHT42tTPAkDr+O9Y/83eOCnx?=
 =?us-ascii?Q?0MsC2ABf9LLq77T2a0rsRV+ToNiFqHj/cTU4iwb88Ke/n50wTsuGelImQGLf?=
 =?us-ascii?Q?wP+sC4lAnoTaMtpKJbW89FX2wSz/EMlgQT0cTEYb5gAp2+x0jsI8aVx84C6D?=
 =?us-ascii?Q?OPxHTmAKF9TSgFIxNlRjBTzmIxRHNJ/JsNvvA9XKpmP8o3GKAyyxjQFT834F?=
 =?us-ascii?Q?zr9CUnRr3063VY3l3oMyqjxMj/jUxpvJWntWg5l9AAoBR7rrEiqVbdeFIE1z?=
 =?us-ascii?Q?Fq1Dvrf20E0dEIlj2C6PX86e1jPrfYWWWAW/H/PIn/PbWCsrtTePNeps5AkB?=
 =?us-ascii?Q?7R8YJXGvACTdRERbnuSWyZIoJ+CyE7lIFIxuDwlQr2F/UAqnk/074AU4w4Uy?=
 =?us-ascii?Q?LRgMBr0Z7JZ1C324ubjyIE2wRmIXbbH3H8xDAOq98gTrD2DG5rDnL9fuLqnC?=
 =?us-ascii?Q?4DjQLJrt5M8fzvMrBPYVZjtSodaBkVXd23rPOrEyca3l+GYG5ESH56dUrHQr?=
 =?us-ascii?Q?ot/sl1heES6HgbXAhO0nCz6d?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a327a1f6-cdf0-43e4-afe7-08d94b72fdd4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 11:39:10.8486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4c8oAY18M9QXazh3hQSabv3E2luMUAcvv/MpVGOjyHd4uuzZJcIVJWlHV/YAtjeQSP2F0bfh7sE/tiavAljcnpwVRLxBA/Mlzm5AseycMAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6119
Received-SPF: pass client-ip=40.107.20.91;
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
index 268b749e2f..447fec74df 100644
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
@@ -332,5 +333,12 @@ for fname in fnames:
 sys.stdout.write(result)'
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
index 8ffeb8692f..2a0375bac9 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -693,6 +693,7 @@ _img_info()
             -e "s#$TEST_DIR#TEST_DIR#g" \
             -e "s#$SOCK_DIR/fuse-#TEST_DIR/#g" \
             -e "s#$IMGFMT#IMGFMT#g" \
+            -e 's/\(compression type: \)\(zlib\|zstd\)/\1COMPRESSION_TYPE/' \
             -e "/^disk size:/ D" \
             -e "/actual-size/ D" | \
         while IFS='' read -r line; do
@@ -992,12 +993,23 @@ _require_one_device_of()
 
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


