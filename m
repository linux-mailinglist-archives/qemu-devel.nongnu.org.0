Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F91323AC1
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 11:49:36 +0100 (CET)
Received: from localhost ([::1]:50142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lErjZ-0008M3-Go
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 05:49:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lErhd-0006eg-WD; Wed, 24 Feb 2021 05:47:34 -0500
Received: from mail-eopbgr80124.outbound.protection.outlook.com
 ([40.107.8.124]:36517 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lErha-0007Jd-Eh; Wed, 24 Feb 2021 05:47:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cd8NnINd/nhkwojKGePgZI7qmw/gzl+Fojf+L4xjf8kkYf9N2YtjJD4JssamGZPPBN5IS6Lp9Wa8yrwBIWiVOmvdhYLdJsc+Xb8BESxS9BQTkxgQk0tpVdc9R6D0zs+EQQSk4iSA/uA1MMBjkHeLF3yOSvSq89F/vTbB8cJZkrGqiPeYFwg8ZRbu7oKFZLFs5sihReA1wpLtOOHLpJi4E/o33JafiYZJa0KGq3IiKVXlQc3btUjnVwQYYO7sJEusI8PvijRyZSejypjTqgOy741BzPfJL83X4uVSY0RNiL/iX8o4u6Em0BdbJIkYTW7kDaG9RtBb7iyEuXUpfRjxrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWatco1vbjpU95+hxsFVUdG10wWNRJZJS4e+gmnf9bs=;
 b=D4bqJfkex4X1PdVLAvXkXib23s/PPgY63xYnvqIIc8QCQss41b5OWlWp2WoQWIOajAfU+Utz2VmbjvetA+gxIj0gAVbG+XRm0EWcaqpM8HpiouOm856qs4wkDXrIznwHUse4Z9zyLnB7SnvG7GI8VXJ4IhnWQnlsntegzwOeJc6yhQYSRXM6pU4Wg10OL8/JihlwR1kd7J6GB1wkQZjaKXmw0ZJSOBtGgzgv04AoP9FXgWEUNaTWm/Ifa4F2ZUkwQGJ7URnBleotSjFPjmdXawrlmTKqXxVwkBo7NgpLFOFVtIiKnxau0hh9qJkkTovHHSNWh4Gk/TXGLeWFgcEGLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWatco1vbjpU95+hxsFVUdG10wWNRJZJS4e+gmnf9bs=;
 b=uyVjqsQyx8oa0GCAx3pyT4zKg4rK2m9tMRL1E+/ezl4HNrkjGIFsdPBSXnKg6M/niOorlkfikJlyKYrcMqYZJ1MCkedCzcoh7716KXOn8L3577qBfbVaQaj9EllmTAT9dk47WSBPDOJNZmuZ+TzodeeT8N07WHtN6ckKLh6ZtZE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4951.eurprd08.prod.outlook.com (2603:10a6:20b:eb::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 24 Feb
 2021 10:47:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.032; Wed, 24 Feb 2021
 10:47:25 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PATCH v2 1/6] qcow2-bitmap: make bytes_covered_by_bitmap_cluster()
 public
Date: Wed, 24 Feb 2021 13:47:02 +0300
Message-Id: <20210224104707.88430-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210224104707.88430-1-vsementsov@virtuozzo.com>
References: <20210224104707.88430-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.244]
X-ClientProxiedBy: HE1PR05CA0177.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.244) by
 HE1PR05CA0177.eurprd05.prod.outlook.com (2603:10a6:3:f8::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Wed, 24 Feb 2021 10:47:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bafd2dcc-1d5e-46ba-e4c2-08d8d8b192a3
X-MS-TrafficTypeDiagnostic: AM6PR08MB4951:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4951BE434C3D43A2B2DDEAE3C19F9@AM6PR08MB4951.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:73;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uEEsaHTcY8iwFdU2iJOxiYszIs1LND22bw1DaY1Y7Ls90dZ94nq2oxeH94UXl68Pb8aqweBgmEgBEjkur4WZxQgAw6zXjHC9IBUl/lj2KgINWy6dRXC8fFQNbIDy1cC15p7GwASTQMO6zbxHMgIXhVQrFhhcxfuVUAowFcV1d5anEDOo53M++PuWL+jHCOmpX/8TXWBUmMw2YQVzkmz9bH1yu2/zd2ib73rNzwLWlHZ3j1/C5i+4QILh7iXh2D7byMhtbj21KeJ9eOoFqdflpCDoCSm4Ihbu0i8q18MebkwyIwqcWqvrMUxr+hUxYC6v8JqH2yEsjQiHwZHC6jsZmu78/sKdcqUeBhmVKp6jI6tvi+IZmZmFhnEIQcIP2n0T9j8ZtoeOfQFKlvg5Am5NVXRRlM5YkDg0CEyb6s86dAiMDndEs1pcYh5Q1ltqUWMLvUEsoVHNAzU6FeIbk5T5sUAmNU2wyOx44FICOma+svXPntYhF05gwYCf+uXIYVon8cTf6K11hXpvGFLN3kXLs+Jr6xQRnN3iCyjMVIp64oxbqKAriloIbFOOFup+oq1d6Cx1bwAAcawlmXUR/hwtUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(136003)(376002)(366004)(396003)(186003)(956004)(2616005)(36756003)(66946007)(2906002)(8936002)(6916009)(26005)(83380400001)(8676002)(16526019)(5660300002)(316002)(52116002)(6506007)(86362001)(4326008)(6512007)(478600001)(6486002)(1076003)(66556008)(69590400012)(66476007)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Ik5ojkU5WCjU+ulrtk5SW+bK8E6DrksGdqW6zLx4bnvHi15DVQ3f8DB+wBqS?=
 =?us-ascii?Q?9Jv0CFhjcX/oQg7VQUjZZsWN+r6M3ML+xab+PZdbG2vtlcjHKvHgtPhh21Hi?=
 =?us-ascii?Q?mBsUMMbtBGKgtTXwa0V3w11EWD/9D5jH8vdmaXANRT5a1Pdimzy8y/y+RNXa?=
 =?us-ascii?Q?XHTn27kPg6DYGl6o/am0fCUIZczI7mnXWCz/BT9T/Bxr4OOeB/CvDmokMRvg?=
 =?us-ascii?Q?/eTUC6vuiHSrYWobTObh5K1Ycqr0oDpIa0UFTVsP4Pm3bfDq313Jzwq5p3Is?=
 =?us-ascii?Q?gtAm0u3BeQLOJVjvlwx90OM5A+TwmpP3yPu6L0YheW5s2jU8nFYXI85nCj64?=
 =?us-ascii?Q?aKWuSLqIQdCl9vSqGbxH6wRHJdOzwjV/skgcZi6pAj/wnWNlI2WL1cjQeGM4?=
 =?us-ascii?Q?QnBRC47W13SsR95uVurMamg5hmhRlrlNKqUlg6XARGChnK5yZRbtDj8me1uS?=
 =?us-ascii?Q?v4grG3jo2Q4uXLlXbYkUWrom8Ik73d1GOVyv73gH8c2IsVEabOMS2pdX5i3c?=
 =?us-ascii?Q?b59W579+Td7gWaNxtp6rCrOHcMol3mIO5vtabC4AR5EJhsnMbTXBcB9zr0QU?=
 =?us-ascii?Q?GIV6TSPMuBy7QKm4kYAwBdX8TZ9NXkI7kDcv8dsC2Ug3Qi1PELvz5rMRhg11?=
 =?us-ascii?Q?B9+/RVqyC8QnGiew748jUIC3echamDI3NKn/Mqc5GUOnOz2jY2p56T2EybXN?=
 =?us-ascii?Q?gNJ18WuO68pX+ntLSQRuMtU1bGD8pTmIVUjETZ3QATXIGL1qJqMuJd0NFfVv?=
 =?us-ascii?Q?DqJJU19KUGK1lMnLXZWPDE1RZkJp43fPWYkVAluv0KzOI+JqQ78sI5Mxzuq+?=
 =?us-ascii?Q?FPGM+UGcmtI3OFDYwDD6mdQLxjuwZrico3sb0LiZHjKNFlU+SYibjKwRHshM?=
 =?us-ascii?Q?ttGjsGpE5CXeSKFWx6wBoKE9qrJdqv0bd/ICDZs7qu4YMUakbb7PSdbXIdQf?=
 =?us-ascii?Q?aL2+mArj998AZfvB34xjMXPhKHljOzX5jz04cKvWPbSFaKPT0n0bwG1NSPvH?=
 =?us-ascii?Q?BptO5bYDRyySFS5YUnGKBiSYbQ5Zs0QH7yIBmCyWYwWqA6NstZKRA2bJppEB?=
 =?us-ascii?Q?VMULYRoMXJt+P7PHhWzKsAlwGIYuZE+4vipdBpfHYNYTpWI8Zncf6Ezc9zH2?=
 =?us-ascii?Q?1AYip6pith17r6AcIF9tl6h+5QEWbsTw5KWXOrgB1qVj7LnsjaLLyKrmjBay?=
 =?us-ascii?Q?U9TpWdqiOCvMdUov5d0FNk8Ta0QlZlvq0M5qibv6F+Fn0A9uDgppecTTLdqY?=
 =?us-ascii?Q?3o7vpiMVszbMIc8mRn6PinlTexNzXDuxb3Py0QaTgDyUhmln8T9eo6C79HFf?=
 =?us-ascii?Q?G6EL1PO8j0cIqyiUzZH7ix0v?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bafd2dcc-1d5e-46ba-e4c2-08d8d8b192a3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 10:47:25.5643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lr6hD5EnyYpV4PgGOu1U4rBvOjrxB+WL7+E9QffNLL/1ONBMIJlUH/JZ9U47DAwGGZKUR9XKXYbjMC20ucDYN/+XOz2V29RtVcnQYhFKJLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4951
Received-SPF: pass client-ip=40.107.8.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Rename bytes_covered_by_bitmap_cluster() to
bdrv_dirty_bitmap_serialization_coverage() and make it public.
It is needed as we are going to share it with bitmap loading in
parallels format.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 include/block/dirty-bitmap.h |  2 ++
 block/dirty-bitmap.c         | 13 +++++++++++++
 block/qcow2-bitmap.c         | 16 ++--------------
 3 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
index 36e8da4fc2..f581cf9fd7 100644
--- a/include/block/dirty-bitmap.h
+++ b/include/block/dirty-bitmap.h
@@ -57,6 +57,8 @@ void bdrv_dirty_iter_free(BdrvDirtyBitmapIter *iter);
 uint64_t bdrv_dirty_bitmap_serialization_size(const BdrvDirtyBitmap *bitmap,
                                               uint64_t offset, uint64_t bytes);
 uint64_t bdrv_dirty_bitmap_serialization_align(const BdrvDirtyBitmap *bitmap);
+uint64_t bdrv_dirty_bitmap_serialization_coverage(int serialized_chunk_size,
+        const BdrvDirtyBitmap *bitmap);
 void bdrv_dirty_bitmap_serialize_part(const BdrvDirtyBitmap *bitmap,
                                       uint8_t *buf, uint64_t offset,
                                       uint64_t bytes);
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 9b9cd71238..a0eaa28785 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -726,6 +726,19 @@ uint64_t bdrv_dirty_bitmap_serialization_align(const BdrvDirtyBitmap *bitmap)
     return hbitmap_serialization_align(bitmap->bitmap);
 }
 
+/* Return the disk size covered by a chunk of serialized bitmap data. */
+uint64_t bdrv_dirty_bitmap_serialization_coverage(int serialized_chunk_size,
+                                                  const BdrvDirtyBitmap *bitmap)
+{
+    uint64_t granularity = bdrv_dirty_bitmap_granularity(bitmap);
+    uint64_t limit = granularity * (serialized_chunk_size << 3);
+
+    assert(QEMU_IS_ALIGNED(limit,
+                           bdrv_dirty_bitmap_serialization_align(bitmap)));
+    return limit;
+}
+
+
 void bdrv_dirty_bitmap_serialize_part(const BdrvDirtyBitmap *bitmap,
                                       uint8_t *buf, uint64_t offset,
                                       uint64_t bytes)
diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index 5eef82fa55..42d81c44cd 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -278,18 +278,6 @@ static int free_bitmap_clusters(BlockDriverState *bs, Qcow2BitmapTable *tb)
     return 0;
 }
 
-/* Return the disk size covered by a single qcow2 cluster of bitmap data. */
-static uint64_t bytes_covered_by_bitmap_cluster(const BDRVQcow2State *s,
-                                                const BdrvDirtyBitmap *bitmap)
-{
-    uint64_t granularity = bdrv_dirty_bitmap_granularity(bitmap);
-    uint64_t limit = granularity * (s->cluster_size << 3);
-
-    assert(QEMU_IS_ALIGNED(limit,
-                           bdrv_dirty_bitmap_serialization_align(bitmap)));
-    return limit;
-}
-
 /* load_bitmap_data
  * @bitmap_table entries must satisfy specification constraints.
  * @bitmap must be cleared */
@@ -312,7 +300,7 @@ static int load_bitmap_data(BlockDriverState *bs,
     }
 
     buf = g_malloc(s->cluster_size);
-    limit = bytes_covered_by_bitmap_cluster(s, bitmap);
+    limit = bdrv_dirty_bitmap_serialization_coverage(s->cluster_size, bitmap);
     for (i = 0, offset = 0; i < tab_size; ++i, offset += limit) {
         uint64_t count = MIN(bm_size - offset, limit);
         uint64_t entry = bitmap_table[i];
@@ -1303,7 +1291,7 @@ static uint64_t *store_bitmap_data(BlockDriverState *bs,
     }
 
     buf = g_malloc(s->cluster_size);
-    limit = bytes_covered_by_bitmap_cluster(s, bitmap);
+    limit = bdrv_dirty_bitmap_serialization_coverage(s->cluster_size, bitmap);
     assert(DIV_ROUND_UP(bm_size, limit) == tb_size);
 
     offset = 0;
-- 
2.29.2


