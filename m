Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 478153BBA21
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:24:07 +0200 (CEST)
Received: from localhost ([::1]:56480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Kpi-0001gZ-Br
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0KiO-0002zE-4F; Mon, 05 Jul 2021 05:16:32 -0400
Received: from mail-db8eur05on2138.outbound.protection.outlook.com
 ([40.107.20.138]:40000 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0KiL-000816-EV; Mon, 05 Jul 2021 05:16:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=btlLezHBUuzbbBk/SK1m/7VHQFoPQHjslceCynSZA90N4O7xyF9KYrjHNDmVLHBwaK3o+0pEtf6yha9QzYoWUwSR2bU/q60nLyt+C8x9fGflS2a7PhLZgLFWxFo5UUoD7wR15Tlx0wh+l4qrxcfd66MMaZ5ecSLCfpkBo7JKla8DjV5/kCQRVwkR6+kpLucSS4HfNPuTs0WRhvD7oowF83ueWcwDxOUGIzQ7UzaILRdCqKzfZffI/KTsONorxkPOMV4JG9QVkm2W1pXpN5YuGecWnZnrlNeQ596HDi+Nm52ub9xjAusHUvzF0k4aDgkRbDIfeJT7qO7fY4cTZaRUoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iw7oqltgwahQORdX4pKkqcEE7IJVUWBLjX1XvR+Ug0E=;
 b=KT9NsgjHw4bBLbFTJb85IK0LUmszZR0eGsqII6+bKsKahM8vdLLh5kogmqBVXFb7EU7qLqDfLHXxdKj3wvR1O3fkqQEUwP75uA3mMJ3cUP9gi74y8sEpz3JWAf9zAslHrz2yrPpCGtKsvL6udWG+lQNbGdcJrsCBJ6xsL9byXYQV7rRqWwGjsyYcAyvNw29TlwTpBbqtLfwSzC62dO7EIbcKsfYxPp/6l0OYN9R1nCJAHwMKyI6fmCxvWAQPKmwc2/pqxy4hZlJfSUNd+jOxPZm1FGIJUc8xZKMTRVtu3HI7j6FvBoFr044FLeXQpjNw4TaV//urEtYKeBmRW3FTrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iw7oqltgwahQORdX4pKkqcEE7IJVUWBLjX1XvR+Ug0E=;
 b=jYmiFD+huNrVLBevVx5D8E2WOOZKgv/3Ieyv4jvHOKKBdsrzcMe/3OWWQtXhHPyCgE6RtKeyvl3j0WfDG2qsr1fjhyrRuvrkRbVj38p8rwZ3qQxcnfyIlPLButIbdxqjD9JVbV0wF9LeSDLf0lsiXbESqEHTkg5qndhUK6zFY4c=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4470.eurprd08.prod.outlook.com (2603:10a6:20b:b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Mon, 5 Jul
 2021 09:16:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Mon, 5 Jul 2021
 09:16:16 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, jsnow@redhat.com
Subject: [PATCH 11/14] iotests: bash tests: filter compression type
Date: Mon,  5 Jul 2021 12:15:46 +0300
Message-Id: <20210705091549.178335-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210705091549.178335-1-vsementsov@virtuozzo.com>
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR05CA0235.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR05CA0235.eurprd05.prod.outlook.com (2603:10a6:3:fb::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 09:16:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5515c7ed-743c-45ec-679a-08d93f958abd
X-MS-TrafficTypeDiagnostic: AM6PR08MB4470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4470A1299CE19388F81702F7C11C9@AM6PR08MB4470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6be5AhbSgr9ynPY7xj1LJYpUqhzufn641HKVcrcxcItVIBlJ2h/wiecPx5XS/pcPHaiq8aGez7kR+wjfw1z8IUt3Kp4zb8YfZ3UsNt9dBuPCsIddCPYddxAPM2LzI/2t4zOK7KW49HvAgJ2InbkRHHBBrVcm+2OfZpUiezRayx3XTT7A3LumRV92DkE+8VjUVT8uzniZjFoPHg7ItQR6G5U5OF1ZCoqyGGLpb6VJOTCSt8dy5WnAUNIOVD0pL+OTK15d9MkJ7bxZgsdHWUJ3KWgogMtHLuyzvf/3Z7KHhT2tvz1ioChndpdtdXEPQ9GE9glcx3dGSsgWyYLpnz2WpUJgwSMT15hqfK6+IIV4X2uuqir8bsuvf/Im6d8EQIh6IFyfTfCfiSgXo5E0cHGzN/Ej/2Y3Pbo0OQVsGtR1bw01fPknBi9u1ScTYUnNRW5oXiesa/UxdhaDQAv7g6E9ilvZal0DsmamI5ylPrNXIVI6XC7NyzMf/XZJgnfU+RaBGTU3H5fquMOeHWGgq/NJk/TYZ4EBxwcw/d/Ks0Ssmfy6ukLfRq/fqVduufa/rt8/J9N55d8xjmIgPSommbzxMzgX/mI0DFvjPyyOir2kZZZ+DGdB/69SOuBGBxQd57KSe5n5eNgq+i3SNUG/lbD2mQSm4PXGezyLvKMczfsxNQt3wPWLhYtw5s9oPgFG7ftI746P4Z6X06LFHj9JTzK42+cgdh+XCocdwrIlvOFp9lY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(366004)(376002)(346002)(396003)(478600001)(66946007)(66476007)(66556008)(4326008)(956004)(2616005)(83380400001)(6512007)(2906002)(38350700002)(316002)(38100700002)(6916009)(6506007)(6486002)(1076003)(26005)(186003)(16526019)(5660300002)(36756003)(52116002)(8936002)(6666004)(86362001)(8676002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H2ie5bwtPVM6NM1gvw2Cv9fNqGsUfobkS49XM/i36Sny8yJ4nFcv5hhNAD8s?=
 =?us-ascii?Q?+PgOq4JDK1zb4xN+3WBz6gK/5HkvY+LiFQR0C5Oe+2/p1jnDjmCHdgEepgeP?=
 =?us-ascii?Q?kHUAOoQlGDybFQpGLgH964krCIdDL9AeFzlhc/oElxFO01W1ZKCzDQeEdzXp?=
 =?us-ascii?Q?OKcLCiaRL1yOHXeoga0UPd4kotVd20RwdMofBtMZ4NPDe5p3EscH7WzVvCaX?=
 =?us-ascii?Q?J4EBy0xuzxMYCRkxAMDn2FX8tpJzllttbdJsYdvihf+hwsZndEdIjWSM1Njw?=
 =?us-ascii?Q?XJ79pDMbOmt/F8IPAPozEXo/mqq9rmi/xLw6y3D+iPYt05A36qG+/sBp6WAK?=
 =?us-ascii?Q?TlqXOdiHK/W+c/6fSRe49BzzjTn5Tlx79ry2/RJOP5YM3LVilLfXnV6os/KD?=
 =?us-ascii?Q?7hvbm3KqHUQbFQHplg9d9Cm2GDbV8U8VQ5uT4muSCEuNfSFdeDJrIc49v1bD?=
 =?us-ascii?Q?230kcRI7gQhxd0lhswqvs41GNMqppa6ACSPVQ0JeejInRM87kxOFaPJlWWfr?=
 =?us-ascii?Q?HbzRgHCgTFkrHYQ4nG8qxONAXlltg+N9yODsTgPomE4yN6Y6nTmiB/0/LE6E?=
 =?us-ascii?Q?N4aKzuqg2UPF8YuT1/M4HBNt1yJmRW/9iuox/lhaiqEz+TsIK2Lo30zc8HJr?=
 =?us-ascii?Q?CUpkX96SIJCH04EXQM0OdhgVlxyCZvA9zMkcL/Knf2qH/5WNR4l3p8gPZjU1?=
 =?us-ascii?Q?F2WWNoRbDcKleqbmeuv8pMKn0Q0Xfz8TtYxQpwjAI3Q5URQGRd2TzyHNYWO3?=
 =?us-ascii?Q?OI6C0F0SZZdunxrSukC0UVaIs6aEElm3ALNt75MyavTJXhoqMUDyZvk9U27T?=
 =?us-ascii?Q?h7a6Ig67zWySZgJC1IRFoQeIfztCQWjiplrzWejJSS5+HJ9fpNbox8Z3nZ4Q?=
 =?us-ascii?Q?2V3q1bdpGmPoekxnklU202rMY/jqdcU7fxcaholSPwlpBxJsADRLPDo+MsIJ?=
 =?us-ascii?Q?Fm6iN5vnUD8vjhUWjP8A4sL6BslxsWZxQ2cQ8JxZjmcaQENh88UJrqxtmGW/?=
 =?us-ascii?Q?g6VIJO6zlOym0TyZ7cw97rc6pUKkuGcPsUxiNmSgSf71i9zD413BrhXb4MzE?=
 =?us-ascii?Q?JpbuIyhosNACGOoXoHDsXnnh5pKpCz7wo8jbbV4QfWYB53T6JGvh2t/SAJZx?=
 =?us-ascii?Q?1HRXlkn0ytIOOAg1wRWINzdMLX3eQol7Dl8DokKhszO/jn4vwK2k9ujK/OeA?=
 =?us-ascii?Q?f3UMHeZmHOaimNsPPl0q+OTS0GAXrdAHlQlfL4z2DnId1xBbFDSSdRYGHhtL?=
 =?us-ascii?Q?0oq+dPj1rXDum/7KovHDmCCKPKqqkPZREdsUCAQ8X3SbUG36n7PUvjY0vsNS?=
 =?us-ascii?Q?ZdmgEa4SzqplbcPwRAtiknUT?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5515c7ed-743c-45ec-679a-08d93f958abd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 09:16:16.1116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KtObQDAcqjCSkSRREe/zx7gU/hjXa469VB9rKJunPSZD+vYt+gAkqUo50913c6Ku7wPIAY91sc1vpczIj07YKY7hpsVkoF1IljfSxbfrM/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4470
Received-SPF: pass client-ip=40.107.20.138;
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
 tests/qemu-iotests/common.filter |  7 +++++++
 tests/qemu-iotests/common.rc     | 14 +++++++++++++-
 7 files changed, 40 insertions(+), 21 deletions(-)

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
index ee30da2665..11b6404186 100644
--- a/tests/qemu-iotests/061.out
+++ b/tests/qemu-iotests/061.out
@@ -524,7 +524,7 @@ virtual size: 64 MiB (67108864 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     data file: TEST_DIR/t.IMGFMT.data
@@ -551,7 +551,7 @@ virtual size: 64 MiB (67108864 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     data file: foo
@@ -566,7 +566,7 @@ virtual size: 64 MiB (67108864 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     data file raw: false
@@ -582,7 +582,7 @@ virtual size: 64 MiB (67108864 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     data file: TEST_DIR/t.IMGFMT.data
@@ -596,7 +596,7 @@ virtual size: 64 MiB (67108864 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     data file: TEST_DIR/t.IMGFMT.data
@@ -611,7 +611,7 @@ virtual size: 64 MiB (67108864 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     data file: TEST_DIR/t.IMGFMT.data
diff --git a/tests/qemu-iotests/082.out b/tests/qemu-iotests/082.out
index b70c12c139..f8e2e039fc 100644
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
index 268b749e2f..78efe3e4dd 100644
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
@@ -332,5 +333,11 @@ for fname in fnames:
 sys.stdout.write(result)'
 }
 
+_filter_qcow2_compression_type_bit()
+{
+    $SED -e 's/\(incompatible_features\s\+\)\[3\(, \)\?/\1[/' \
+         -e 's/\(incompatible_features.*\), 3\]/\1]/'
+}
+
 # make sure this script returns success
 true
diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index ee4b9d795e..813b51ee03 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -697,6 +697,7 @@ _img_info()
             -e "s#$TEST_DIR#TEST_DIR#g" \
             -e "s#$SOCK_DIR/fuse-#TEST_DIR/#g" \
             -e "s#$IMGFMT#IMGFMT#g" \
+            -e 's/\(compression type: \)\(zlib\|zstd\)/\1COMPRESSION_TYPE/' \
             -e "/^disk size:/ D" \
             -e "/actual-size/ D" | \
         while IFS='' read -r line; do
@@ -996,12 +997,23 @@ _require_one_device_of()
 
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


