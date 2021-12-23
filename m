Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C687647E64D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 17:20:26 +0100 (CET)
Received: from localhost ([::1]:58506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0QpN-00013P-UV
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 11:20:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QY0-0005yv-7I; Thu, 23 Dec 2021 11:02:28 -0500
Received: from mail-eopbgr70094.outbound.protection.outlook.com
 ([40.107.7.94]:61158 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXx-0005KZ-Rl; Thu, 23 Dec 2021 11:02:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HvQpDgQzDG2yFxg7eads1odiI9A+cGHwYVfN69SeHVeEvKTzMrCKBl+ilgAExZZL//vw7O4q1B2WfaWR+Weo57GeoB1VQ4W9ahVcnnwhXRGtyPJZrFQCl9K6fQzdTVKuXSMaInZ4ZjgcqElloES155Krrdm24zAwrhr1lGjctRUhm+ao7ssVegdExeDoFs6ggZFdlOc4nMH/jpzUdQOLoB4DygS7YGz7LQgk+9t0k4bWI61m4vb6PGPrOJCbmr6U6v37p251pLNttj3y2Lar7SMHmJ2Gnx8YX3BZfsvgBaKaXM6v1Ws0IbWmqo8YQEncCM5Frd2tB4OXs7ajJE3WTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXu3FmnQgyJT9YuFbr3lHECaL5vJaHc5sDd1ZHx1QRY=;
 b=C6cElHrW+kgVMKU9weaBYS6xAnUZi9UbUL1gOpkSUZoR4h/+D70kT1WzC4qpoCF3cG3mV77rhCx/k4cGkpMcmkcGRhQOzEjyMlvkMk4b4Z8PQj1vCEmyqlq5t3sieHXWsviHvY4WvNR5Qj4sIhz4RU5zk56Wew6FzOZNPDBqETO0x/EjOCcOvhjO7p/K/It9h6ph+kTq/FMYzoIIxiqfYWo4ndUxg2MBy9RmzlJtqVlIss/h6sIQSaWHpCrLo3dWS77UM+lnDiFtOECw4nIWKiB8SQIQgQox/wMBDsYgmG/IdHFvfp5b0VleCIi/mBaYRyvnUEMBq31ENqP4w3V6zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXu3FmnQgyJT9YuFbr3lHECaL5vJaHc5sDd1ZHx1QRY=;
 b=HziHEFR/LwsiGKngc+AXq2qBx48hlFpEdDbZLlYr8lVnGoiGaUWqS8SDe2mfDKl0uHTBm/fwDN/mr/MsrAW1lmVvh8kbKp8E/7u9SWvTVnRhaMoCi+8hT8nh7s3iLJWWv3GRK3jIb9NX/Nrr9utI/T2iYoF/GWv/dTInwP//MpA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6148.eurprd08.prod.outlook.com (2603:10a6:20b:284::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 16:02:01 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 16:02:00 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v5 16/19] iotests: bash tests: filter compression type
Date: Thu, 23 Dec 2021 17:01:41 +0100
Message-Id: <20211223160144.1097696-17-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211223160144.1097696-1-vsementsov@virtuozzo.com>
References: <20211223160144.1097696-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR0301CA0001.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::8) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17f54069-d72b-49bf-ac0c-08d9c62d8df6
X-MS-TrafficTypeDiagnostic: AM9PR08MB6148:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB61488FA3775831EE10E3EAC2C17E9@AM9PR08MB6148.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y8109oRm22qLai0kdu3iNi0udUh2Kr2bDshlm0h76BXeQTH2E65qlREfoQ8JeV+tjiopeMkUmqKW1LAOdAEQdy+o9COxEi3ZbeCQJWSgW+BTzrU/Z48Jh3DZv4AQDJ0oKqeNEZUqWmmQOI4as2lssGzZIFxBc7K0potm/7bMrzG9FfNlA3J4k9zknfg2E0ii9CQBR/l1qH7HhY6se9TLSSM18BAdFkOKTpezZphTKf8abg2fzt0xciu3getALznak+CBSJn8xdHT8ZsMTKCioVvxKc8WytUGwNCBCkSPQlN+nVHrQEduQAv/qAGqb2EB9LlJExE6+V8ZBZ+PINt1RS3wkNbxgb5iTlOs6Fwl0lBQLsICx+w/tGhXPa04AyhrCq/jEkJK1bAHEULWQW5d952G0wv7AlwOEjiuLw/SxSGh5DfcG3Ho4kxqCC905z3DsNxYl5mhLqY/oOtfKiIPcD4bIJ0dRV7y2ysNasYg+lM8vHC0hsvAwkV7HVhifHbK+qb8yyun5xNVB965N4vAkcGzGTSBFghKNuXoE+p7KsiOcy6+ok//m1GD6i7GI57egdLGiM6NsoaVEdWEMO0QLxLDDVdkbQQR/s3KoVyvOJW9CaIS0fh6G33DBXTgl8Y/O2h1W+OnNHSBTyzIcJASTpAoy4a5nHA7jNDRA1Qwa+Y6yEu7NVfmoklvUXQp3oagSYA2UkXlhpzHzJTyJfnt3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(5660300002)(8936002)(508600001)(38100700002)(66946007)(316002)(38350700002)(66476007)(66556008)(1076003)(2906002)(4326008)(6666004)(83380400001)(6506007)(2616005)(6916009)(26005)(6486002)(6512007)(86362001)(8676002)(52116002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xquit3CG+yMmRsaqAQhgAKG5Euu08REZXMMwjGs7GqkvoU62biURXvZnFx9Q?=
 =?us-ascii?Q?vXJo1s0bpoGLSKnSoz9ucxk8V0qqiVD9GAsSR7tsgl2Skx33RcQhw9pAIQLl?=
 =?us-ascii?Q?WxQQNlMXFR4UejlVQ89T9mUeBndp4oLuiqdmmOo+yOM8oU7ucdumWeEs5jH7?=
 =?us-ascii?Q?ROqU/6nk1K3SWejeApdn8r7X/XAqDl2z0StedX2JyIBjtUSMeqKCjbA8Hb6a?=
 =?us-ascii?Q?uXd4UEE0r8YyZQkVaWE1aXXZLZ8FcQ0oxmzKVg9yHZ1wX/zhfGYWPQnw9RPF?=
 =?us-ascii?Q?q6lAhTWVrhuNrABaiR9Q+j/Gx87vWzTxXyl+agpkzqDKEtyWzmSSjgj3ROI1?=
 =?us-ascii?Q?ySsLJ8mCBQnZyo1U1H64W7hWUGHMKOo4bq4e9ygyWB4UgKW5VFHewoGcvi6O?=
 =?us-ascii?Q?A4A+qut78zOUdNrWMA5r7D/RpJ/XvOaqhHMzDPiOS3T+C6i+abnt72InXl4b?=
 =?us-ascii?Q?zre4Erq5q9uZDOuHMTvBtnDPU4xnDCr2NLi6ZzHXSI2YRBAtVpypbV2haMQu?=
 =?us-ascii?Q?8r6Ja2wv1ld4xi5svW80GEWSui+mx11fQ5+4oQow9Pxu9hkGcFIq8Gp+zH1h?=
 =?us-ascii?Q?Zsb/ngbkkiuIRNVPOIFNxykz3qikFCgfWtsGuQxk9pZMoypFFToJRyNxspMO?=
 =?us-ascii?Q?L5Pg/TEMiW6L9purwgCBBKF5BwITIVa/OUD3bIqENKbdYgsEpTUJ7FrDi71c?=
 =?us-ascii?Q?MCtw6DTe7US3B2uEWRMF7QX8AVKYye+8TF3jOs74+Oxe1FG1UxN4WPg/Fasw?=
 =?us-ascii?Q?jeME/DzlCDkY8xvOvv1fLCJfIF4INd1uST6ngW8OpmtOj0sCfuPxpDcDA4BZ?=
 =?us-ascii?Q?HOpmwqUOVjrBdDnLe15aRxclvjh1z3d9agnCFdIyQatZWatr8kfky05qUmSs?=
 =?us-ascii?Q?FD7zXbfAFcjjPpiRl+Dr3wv+3sLKxymSY6nTpmnfY+Bu7jcNdCkKrAWKD9Qm?=
 =?us-ascii?Q?tmT7nSRaQZ/GkxXbzrNYSWMbw9nKFnJiUYie06SGzyCB9cA1uBr/2rToLhiV?=
 =?us-ascii?Q?HNynAjyxd2xYBmzrp7U5trQ2y39JXOyJhABldIY73i0SKSH6uZG6WrYTA+wV?=
 =?us-ascii?Q?SPGIhyCAqkxidlMkOaw+anS4apDz9du9gK6TymPk43QCgNFO3LdnNNF+KQIZ?=
 =?us-ascii?Q?H5JuGIsEBcglFUV0j2hgzq1EsgquyI41IWtiu+dmUc9s4/5LH8aTwh5xWqLh?=
 =?us-ascii?Q?N8WDHT1peUSCl1ownV7ENVgzqegwO4btLEya6JR9WOVq/SulGcki9cI7YDnN?=
 =?us-ascii?Q?z3wowV0dHDaYqCFY3LkSwJcJEGrsT08SPO3wY8cpZZRvKEzplbILf6BKe+bk?=
 =?us-ascii?Q?P0p3cJADmfenhhKM9mjFpDWb0p4rFMNOvsNRvbmf9c1D1IxqcJqn7pWI9enR?=
 =?us-ascii?Q?X4i/Q/Rg/llv9SyxasZxmu9+12SYxY+kV/tt6z8asCxIxzt41kGSMH1Jof5r?=
 =?us-ascii?Q?OT5SCLyn4YfR4FDuAw+aeKl6ytTjSSEsnLD6L4LJo4IzfBBZ4NBa3YTKBB2j?=
 =?us-ascii?Q?9H8xCubEQCZuoaxRZCMdBwoJhiSEU46sHu3XWK5QtZCf6xjhic0VYtNip6o8?=
 =?us-ascii?Q?9qP3h+ubPwfnMoP2PaQ3U06pz9wEp/RfXl+jJzp+YaoOoIaKQ26gNL9q7Qb6?=
 =?us-ascii?Q?c8tMsx1TxPQHF89ThHNbdaKxy3bAD+fRVuwaYoKFxZNsepl6A2qtwW9iGcqu?=
 =?us-ascii?Q?sTsQo58hDQE7/tQZS/ngp0f0GHI=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f54069-d72b-49bf-ac0c-08d9c62d8df6
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 16:02:00.8487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kSR5UtzjD6QGG7i9nGXkxaSaIYmUBAUwMCg1/BHah6i9oFS2nX7Uzz2k6+AfE8JBSfYoqV/L+vJkSF3K5gfZnJWiRUluF1G6J+ITGQXJX0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6148
Received-SPF: pass client-ip=40.107.7.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
index 5427ad5456..6414640b21 100755
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
2.31.1


