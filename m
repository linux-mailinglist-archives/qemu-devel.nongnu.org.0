Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AC8400C20
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 18:32:55 +0200 (CEST)
Received: from localhost ([::1]:50968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMYb8-0006xT-Bo
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 12:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mMYTg-0002nu-9g; Sat, 04 Sep 2021 12:25:12 -0400
Received: from mail-vi1eur05on2102.outbound.protection.outlook.com
 ([40.107.21.102]:64544 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mMYTd-0007MU-2U; Sat, 04 Sep 2021 12:25:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RN+Wd4vhj1ALZHzidgR+F8/euyMC7xpEXL6ANz0GlEiJOiqa3jqI41haTJUIuEMs25lNzCF8oVHd//UPr6//omfWu8lrhc+FffLIRDkqXKQfxRIzdxCJiaj7BCQ8J3tWwdW2KckE+1mtIRgj9zZFS/qp5P0ooZFM1+X00TtVsPGAgRXH618zOrojVLT4/ZdXdTrE0GpgN3h3nvornYzMsL8qeFNYLUl8DhHfLejU8pi3uG//1v5W9oG2tICEPNBYvuFrcFT+eB7giuMia57mtlvMXcPZOG/+7EZtj1GpWa5smq2N3en8ClIkzK6MWdKmGX5PqdmIHQ50l7XGp/wStg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=8rIvAILB+1i7Lzmx+VgeHtLRUfWktVVAEb1Ww92jGqU=;
 b=H9yJMJBzjMYJtSSdqQfudr85jsaP+TuPXoEE27jddDrcP5jgM+RJiApH47PJ2t/iqCsiUKSXZDyHYeZ6xVIxvCvG39coUvcn0bbc8LoHqvKA9QGTXX9RXqG/hIdJ32HHqZz2Ft6tJo54GNL5upKA2KHpJ5jnG3kTuS76t9SN+R0oJ6qQjHzrXNeAlQeD3OQzWGwZ2WALMDzwPQhg//viJQuUyxe0KdPDkDYCYtd6tu/X9QiEx4DDUG9OO/ghKwZvC+xps+ZUclG4jnuYCLyLyov2IgKaFj2Vew7XsE+iMngmfj6SFpVWObagu76mneFZ25esQCbIzfAoVm6k5OBjiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rIvAILB+1i7Lzmx+VgeHtLRUfWktVVAEb1Ww92jGqU=;
 b=Ot78ji+Qk+tpP7nAq8E3X3h7els7cRe6Y6jO5jt0GHLw3q671catSMFwnKisE0Mu/2mJaFbHKmFUZ0eVZDOZsvrylHoy+lzsGbEgyXfYhyoFSOeXgkYjL/z9K8SggDlfdQnJnXWaqCwIo6+kXQlkVQ4TjLduIxZbjRSYsSzIYsM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6904.eurprd08.prod.outlook.com (2603:10a6:20b:394::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Sat, 4 Sep
 2021 16:24:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.024; Sat, 4 Sep 2021
 16:24:59 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, hreitz@redhat.com,
 kwolf@redhat.com
Subject: [PATCH v7 06/11] qcow2: prepare for tracking guest io requests in
 data_file
Date: Sat,  4 Sep 2021 19:24:23 +0300
Message-Id: <20210904162428.222008-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210904162428.222008-1-vsementsov@virtuozzo.com>
References: <20210904162428.222008-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0275.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:3:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Sat, 4 Sep 2021 16:24:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b21d692-d6b2-43d9-248f-08d96fc08a59
X-MS-TrafficTypeDiagnostic: AS8PR08MB6904:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6904C0FAD5AC9170AD67C2A4C1D09@AS8PR08MB6904.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:459;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bwtXlhrHg+Dw3+kz+iQ1aHbQcK5HTlKpDIDn4IGFJJyuxlYcssJM//kQN+QMC3oULSa5NsQyqn2n2KrZUdyNMIfivBNmbLWDOi4g7uU/KVk/x3KO3s/NGHAK8avtJ9nWFNCCvqJqkNoQE2h2mAy0hlNZQD4pVF1dHIZ5UpgdQUDyIHngAlq4B0Qtt9c9eKup8e8C+aIEp2SqrjybjKfNlhZ4BdaY1mvxa74OpFFmdobPAo2OVvFF2f/q+cKl+rI8SKr70DhbeuLraGhgP3f5nVU9TFmxconcvnXi18LAS4D+WLtXZIPvtWhzcikkPSqeW2my6Ft9X0gZzaptmbQJCooWNj7CsMfTCH24tDUdN3PlWSDgdIhD+ATRlrl1n/DqOe0hJbYVoHaKysrpeBY4AwC37NSrfBGc7kBcgtuknSjBsFLB3Tpzax8I+Q5K3tsRvihQ/oGszisxHsRSzUpgY01/gNZwcFvjAleFRKoSGHPBeAwo3fIxeAGs9IAR+GwCoupo3MKHnUyfiKLnkkI+h3t1Jt5n1zAdXZq12HNH8KxUGerB1c5XyVEH8Rq+cVAXgY9WCubEJEHw0IeSTRva7tUDMdFCAwVMhcffqXJi5V88KWJ1dvffQ75hWavvz+SBjojAMR62vUN19YqVhUcgGbWtWykRzpcxFmYQFipR02oYSXKBRLtHPlALnWA5BxfQnRTNmp56tai2Rvo+JvyIbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39840400004)(396003)(366004)(6486002)(66946007)(8936002)(52116002)(6666004)(83380400001)(478600001)(4326008)(38350700002)(186003)(38100700002)(5660300002)(2906002)(1076003)(8676002)(6506007)(86362001)(6916009)(6512007)(19627235002)(66556008)(36756003)(26005)(2616005)(956004)(316002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UpM0S7DzsZ9pXEMcRsQ1DSORZXjLrnv3ffcALzwPB3w5nK875Y5MtKT6ULwJ?=
 =?us-ascii?Q?Hnj+09V3aAajfpJwaRn/mcgjlM/HgmLCcZNh3glNvZrzy+NfJGXmErMWbmg/?=
 =?us-ascii?Q?3Uti0KeKeaFM5xSB/cdcTMu0WywFLkLc/mYI+lFWvQMhLULmDdQSN3v/haz3?=
 =?us-ascii?Q?0H6iX7t/oN5v9zAHLZg8z8VXDnF+2/4MuPBaYHZpqkhK3U4coGt5h/DcejzA?=
 =?us-ascii?Q?toxmxjsHq4qRXvJldmY3+cGAPRLGldCR/08BCoCOm8Y4K8/CUjnjsM4APXx7?=
 =?us-ascii?Q?M1kIpjMrbl5jBKfUiaDKDrqoImxX4nTIBFFmT4/Poq5ChpT+qqsE2JBj6mZN?=
 =?us-ascii?Q?c9D9tmuh/2jku+tKMl7xyAv7BbVQIxRYEiZjRUEZlF9iWYFHvdKxxXjVVYsI?=
 =?us-ascii?Q?VOd+JzM2eizEQhpPZcSHMuwOhHzWlCk91m2IWKyB+UFsKUmQyxQ53kYww1aJ?=
 =?us-ascii?Q?+pX0GYVI3yNw9j7pUGU0BP/ybUSgitjAT9cYvx57DnEu1H4H5kbf/XZeg6Ta?=
 =?us-ascii?Q?suNJyBnvS3RVtS4yMDtL3OJdKseEu2djcJl56I5usd8WS1gQ6cI21BqPJqOP?=
 =?us-ascii?Q?yFWeKM6BSq/pA0xvoWvoy1gTT/pMm+HuItoF/lb5hEeTLXSKGuANGLeppF2l?=
 =?us-ascii?Q?8v0A27C6XkSdrSQJtOupkcfSdYucWvjS4Z2fwEwuu8MCYyT4wVuoTFmq42Aa?=
 =?us-ascii?Q?C1B/HX1BKoE0JuBGBTY21GBt4LeInAdOCfjOFXtl9rnn8WEXR5kbbJT5/UEC?=
 =?us-ascii?Q?dOjGddN1+dOlDjSSRf7PiycxW6ByfVnQUaYh3WKUlwrOrUAkuXQKgqpFKyx0?=
 =?us-ascii?Q?kBjLs3NdzkIeEme+1SS8zKiTCSxMaxU/mXRIPQIzj1R/yqbfToLxs+3JaNO8?=
 =?us-ascii?Q?r+DXvvEU7JKMG9XxfbuQdxn8CYRxG+ZZe1/61dKpYa8E+OJy99sCia4PkjNM?=
 =?us-ascii?Q?RaSpx7wgyGvaZr8fsVCzxen2KxR09u6qhgESq4ZGJ36+1G8wqouzWJHMdz/R?=
 =?us-ascii?Q?YAZjKPvHGe7+w3WSIFMT9c6nqMFP+wy+pZRcz9ipuHS4ac6FoP6Kg3DVBTk3?=
 =?us-ascii?Q?ECtPB/Cb3C0fhZskewYAhDqYT+ac07HYC9JwoMUC4r9e2YJ/CbEerQ+V1yaV?=
 =?us-ascii?Q?sfcDidqrjkXpmboT03GFiU5LDFjAZAaMJpgTmOrA3Hj6QrmBoMIxCDNnsOiQ?=
 =?us-ascii?Q?nWJQ0mPhheXQoR9nxok6WEd4NL6QTj71jNNyktP4s73Ei33XB7gQv6TBx4m4?=
 =?us-ascii?Q?a8paH1IcsUIYvhauhvq2WjNK6H+Vs4EbY6OwrfISbwL1zq58n33a8bCuf8g4?=
 =?us-ascii?Q?5is27HrzmsWfC78Pia4jDXEJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b21d692-d6b2-43d9-248f-08d96fc08a59
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2021 16:24:59.7945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aIU83kTQbAb65Sq11cZP2tK+LWM1+LDdnPAS8AQiLUS1je6rkWnOELN7Np12ndnd5FO7wTcnP6VNxqb9igf9YVUS+Mvkx8IdiL31WEVOiI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6904
Received-SPF: pass client-ip=40.107.21.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

We are going to fix a bug of reallocating host cluster that are under
guest operation. For this we need to track these operations. Guest io
operations in data_file has 3 entry points:

  qcow2_get_host_offset()
  qcow2_alloc_host_offset()
  qcow2_alloc_compressed_cluster_offset()

These functions provides the offset in data_file. So for now, add a
possibility for these function to start a BlockReq.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.h         | 11 ++++++++---
 block/qcow2-cluster.c | 45 ++++++++++++++++++++++++++++++++++++++++---
 block/qcow2.c         | 17 ++++++++--------
 3 files changed, 59 insertions(+), 14 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 4859ca3d0d..7b9fafc6ec 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -29,6 +29,7 @@
 #include "qemu/coroutine.h"
 #include "qemu/units.h"
 #include "block/block_int.h"
+#include "block/reqlist.h"
 
 //#define DEBUG_ALLOC
 //#define DEBUG_ALLOC2
@@ -420,6 +421,8 @@ typedef struct BDRVQcow2State {
      * is to convert the image with the desired compression type set.
      */
     Qcow2CompressionType compression_type;
+
+    BlockReqList guest_reqs;
 } BDRVQcow2State;
 
 typedef struct Qcow2COWRegion {
@@ -906,14 +909,16 @@ int qcow2_encrypt_sectors(BDRVQcow2State *s, int64_t sector_num,
 
 int qcow2_get_host_offset(BlockDriverState *bs, uint64_t offset,
                           unsigned int *bytes, uint64_t *host_offset,
-                          QCow2SubclusterType *subcluster_type);
+                          QCow2SubclusterType *subcluster_type,
+                          BlockReq **req);
 int qcow2_alloc_host_offset(BlockDriverState *bs, uint64_t offset,
                             unsigned int *bytes, uint64_t *host_offset,
-                            QCowL2Meta **m);
+                            QCowL2Meta **m, BlockReq **req);
 int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
                                           uint64_t offset,
                                           int compressed_size,
-                                          uint64_t *host_offset);
+                                          uint64_t *host_offset,
+                                          BlockReq **req);
 void qcow2_parse_compressed_cluster_descriptor(BDRVQcow2State *s,
                                                uint64_t cluster_descriptor,
                                                uint64_t *coffset,
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index bd0597842f..9887f80dcc 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -567,11 +567,17 @@ static int coroutine_fn do_perform_cow_write(BlockDriverState *bs,
  * file. The subcluster type is stored in *subcluster_type.
  * Compressed clusters are always processed one by one.
  *
+ * On success if req is non-NULL and resulting subcluster type is
+ * QCOW2_SUBCLUSTER_NORMAL or QCOW2_SUBCLUSTER_COMPRESSED req is allocated and
+ * initialized. For other cluster types req is set to NULL.
+ * On failure req is untouched.
+ *
  * Returns 0 on success, -errno in error cases.
  */
 int qcow2_get_host_offset(BlockDriverState *bs, uint64_t offset,
                           unsigned int *bytes, uint64_t *host_offset,
-                          QCow2SubclusterType *subcluster_type)
+                          QCow2SubclusterType *subcluster_type,
+                          BlockReq **req)
 {
     BDRVQcow2State *s = bs->opaque;
     unsigned int l2_index, sc_index;
@@ -721,6 +727,21 @@ out:
 
     *subcluster_type = type;
 
+    if (req) {
+        if (type == QCOW2_SUBCLUSTER_COMPRESSED) {
+            uint64_t coffset;
+            int csize;
+
+            qcow2_parse_compressed_cluster_descriptor(s, *host_offset, &coffset,
+                                                      &csize);
+            *req = reqlist_new_req(&s->guest_reqs, coffset, csize);
+        } else if (type == QCOW2_SUBCLUSTER_NORMAL) {
+            *req = reqlist_new_req(&s->guest_reqs, *host_offset, *bytes);
+        } else {
+            *req = NULL;
+        }
+    }
+
     return 0;
 
 fail:
@@ -809,11 +830,16 @@ static int get_cluster_table(BlockDriverState *bs, uint64_t offset,
  * already allocated at the offset, return an error.
  *
  * Return 0 on success and -errno in error cases
+ *
+ * On success if req is non-NULL req is allocated and initialized.
+ * On failure req is untouched.
+ *
  */
 int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
                                           uint64_t offset,
                                           int compressed_size,
-                                          uint64_t *host_offset)
+                                          uint64_t *host_offset,
+                                          BlockReq **req)
 {
     BDRVQcow2State *s = bs->opaque;
     int l2_index, ret;
@@ -868,6 +894,11 @@ int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
     qcow2_cache_put(s->l2_table_cache, (void **) &l2_slice);
 
     *host_offset = cluster_offset & s->cluster_offset_mask;
+
+    if (req) {
+        *req = reqlist_new_req(&s->guest_reqs, *host_offset, compressed_size);
+    }
+
     return 0;
 }
 
@@ -1740,10 +1771,14 @@ out:
  * is queued and will be reentered when the dependency has completed.
  *
  * Return 0 on success and -errno in error cases
+ *
+ * On success if req is non-NULL req is allocated and initialized.
+ * On failure req is untouched.
+ *
  */
 int qcow2_alloc_host_offset(BlockDriverState *bs, uint64_t offset,
                             unsigned int *bytes, uint64_t *host_offset,
-                            QCowL2Meta **m)
+                            QCowL2Meta **m, BlockReq **req)
 {
     BDRVQcow2State *s = bs->opaque;
     uint64_t start, remaining;
@@ -1850,6 +1885,10 @@ again:
     assert(offset_into_cluster(s, *host_offset) ==
            offset_into_cluster(s, offset));
 
+    if (req) {
+        *req = reqlist_new_req(&s->guest_reqs, *host_offset, *bytes);
+    }
+
     return 0;
 }
 
diff --git a/block/qcow2.c b/block/qcow2.c
index 7fbcc600da..8aa5679fe9 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1833,6 +1833,7 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
 #endif
 
     qemu_co_queue_init(&s->thread_task_queue);
+    QLIST_INIT(&s->guest_reqs);
 
     return ret;
 
@@ -2090,7 +2091,7 @@ static int coroutine_fn qcow2_co_block_status(BlockDriverState *bs,
     }
 
     bytes = MIN(INT_MAX, count);
-    ret = qcow2_get_host_offset(bs, offset, &bytes, &host_offset, &type);
+    ret = qcow2_get_host_offset(bs, offset, &bytes, &host_offset, &type, NULL);
     qemu_co_mutex_unlock(&s->lock);
     if (ret < 0) {
         return ret;
@@ -2335,7 +2336,7 @@ static coroutine_fn int qcow2_co_preadv_part(BlockDriverState *bs,
 
         qemu_co_mutex_lock(&s->lock);
         ret = qcow2_get_host_offset(bs, offset, &cur_bytes,
-                                    &host_offset, &type);
+                                    &host_offset, &type, NULL);
         qemu_co_mutex_unlock(&s->lock);
         if (ret < 0) {
             goto out;
@@ -2629,7 +2630,7 @@ static coroutine_fn int qcow2_co_pwritev_part(
         qemu_co_mutex_lock(&s->lock);
 
         ret = qcow2_alloc_host_offset(bs, offset, &cur_bytes,
-                                      &host_offset, &l2meta);
+                                      &host_offset, &l2meta, NULL);
         if (ret < 0) {
             goto out_locked;
         }
@@ -3170,7 +3171,7 @@ static int coroutine_fn preallocate_co(BlockDriverState *bs, uint64_t offset,
     while (bytes) {
         cur_bytes = MIN(bytes, QEMU_ALIGN_DOWN(INT_MAX, s->cluster_size));
         ret = qcow2_alloc_host_offset(bs, offset, &cur_bytes,
-                                      &host_offset, &meta);
+                                      &host_offset, &meta, NULL);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "Allocating clusters failed");
             goto out;
@@ -3976,7 +3977,7 @@ static coroutine_fn int qcow2_co_pwrite_zeroes(BlockDriverState *bs,
         offset -= head;
         bytes = s->subcluster_size;
         nr = s->subcluster_size;
-        ret = qcow2_get_host_offset(bs, offset, &nr, &off, &type);
+        ret = qcow2_get_host_offset(bs, offset, &nr, &off, &type, NULL);
         if (ret < 0 ||
             (type != QCOW2_SUBCLUSTER_UNALLOCATED_PLAIN &&
              type != QCOW2_SUBCLUSTER_UNALLOCATED_ALLOC &&
@@ -4051,7 +4052,7 @@ qcow2_co_copy_range_from(BlockDriverState *bs,
         cur_write_flags = write_flags;
 
         ret = qcow2_get_host_offset(bs, src_offset, &cur_bytes,
-                                    &copy_offset, &type);
+                                    &copy_offset, &type, NULL);
         if (ret < 0) {
             goto out;
         }
@@ -4138,7 +4139,7 @@ qcow2_co_copy_range_to(BlockDriverState *bs,
          * the refcnt, without copying user data.
          * Or if src->bs == dst->bs->backing->bs, we could copy by discarding. */
         ret = qcow2_alloc_host_offset(bs, dst_offset, &cur_bytes,
-                                      &host_offset, &l2meta);
+                                      &host_offset, &l2meta, NULL);
         if (ret < 0) {
             goto fail;
         }
@@ -4593,7 +4594,7 @@ qcow2_co_pwritev_compressed_task(BlockDriverState *bs,
 
     qemu_co_mutex_lock(&s->lock);
     ret = qcow2_alloc_compressed_cluster_offset(bs, offset, out_len,
-                                                &cluster_offset);
+                                                &cluster_offset, NULL);
     if (ret < 0) {
         qemu_co_mutex_unlock(&s->lock);
         goto fail;
-- 
2.29.2


