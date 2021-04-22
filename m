Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5576368526
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 18:48:03 +0200 (CEST)
Received: from localhost ([::1]:32896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZcUk-0004Mw-At
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 12:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZcEm-0007bT-Ub; Thu, 22 Apr 2021 12:31:32 -0400
Received: from mail-eopbgr00116.outbound.protection.outlook.com
 ([40.107.0.116]:34309 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZcEk-0003vI-Mm; Thu, 22 Apr 2021 12:31:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXIL3FXQjQRtnEoLvheA6vlmJPjMFB5uZHzg5t8RrA7+lxppS5BB12hNMhM+S9sXm6VGX0YAyykTuuQBP6/hU4od4E8poqbW3Hs553JMKHgwst1QYPr+cgmFSwGOdcghkyPwXa9d+gUmiKzW86QnlwUZeWnpu1Q9EWgUa/JmQliJriVDO5CrTiUkkFRr0w0xGh5gzd7C/EWEQbbD9E9APWV3iI5jr6iFSm9nbjkym4IvjmVvbG6LhWTD7wcrXtEwotlea3eDHLnSNOaHek9u8auTklDZ/iMO5RHdf3M1Tz0Q/xVAsbUasVoJCBD5wTD9cxKYSvWTqgO+aT5L33elhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWWcweis0PQ09WAuArn3/p9ryekxClrE6bAUzwiMNtI=;
 b=Bb1loXWe/mtui1UdBiehLsrQXHhQCDOHkP0MzDvbE6K0KTF8b5IGqoGgqzsEtn5Vp1J0LNGj/sla9pKah6aZ5NOSkocOr2ck0yOl3EFYxvOb2b5XKdm+u3WDPsLcQ2CMcmsFZFFD8S/1w8hUAPIpRA9ZkUM4Gyg67T+oVXH9NzaQkBvMKapm08g7QqEpYuClIHdoLm93xkD+ciX3ItgpldwPRFxRgccTF7JhQFgpy1ly9/XCH3eIA2mU9hwRjMpDXdjSsNK9sZpP1gtLDIEePXXjYNm3EmynOJQzp6aJZa0jWzJCvRqKm5WhXm8i94ieoxuABZXNTZtMiVs2Jp+p+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWWcweis0PQ09WAuArn3/p9ryekxClrE6bAUzwiMNtI=;
 b=d2DZDSuHJEiybst1UkUtPrEH3EGa6htBIpmHO6Tp0nvSudk/1kOm8k1ZHuZaxWHyZYCBiYjr4OojYHricUlMaYKsHuO3S5QpZugYqe6jpRVDsMaxa6Qt8mDlXeThE6tCi6BcnCDZjaEoLbO46lvVMFZAPOpfKWf4O7mbrk70L5E=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3861.eurprd08.prod.outlook.com (2603:10a6:20b:80::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 22 Apr
 2021 16:31:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Thu, 22 Apr 2021
 16:31:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v6 11/12] qcow2: protect data writing by host range reference
Date: Thu, 22 Apr 2021 19:30:45 +0300
Message-Id: <20210422163046.442932-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210422163046.442932-1-vsementsov@virtuozzo.com>
References: <20210422163046.442932-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: HE1PR0501CA0006.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.222) by
 HE1PR0501CA0006.eurprd05.prod.outlook.com (2603:10a6:3:1a::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Thu, 22 Apr 2021 16:31:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 625663e8-4731-4c75-394e-08d905ac0a8f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3861:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB38610C6E01E501CAFD19BD50C1469@AM6PR08MB3861.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4XRNf2udSqBxEMVCOSCOOtST411Pxl6PcTi6ZqdXAAXZEs7DN3rsIZTuBHgwRhq+3Bwi6I/FeS13ik+8inGR+b7/Zv8Pm7AvWKO85RAOMgBnDsrXBCu48PBX+UWz/BqgMWWeTO1qRmOIkqIFWO0PTtJaQNQQk+5LbUUV7DrMa3Apaq8yBtPiFr54TUgtjZBAAbmZ4Xu6/Bk1TfkbJSKdPAW8IQitwY+U0bNS8vX0RFRJjG0BMJf6HWHRntWVz2jVKdxMHO55OLYiXxfAyL3oGO348subS+5oTnNJzo/dl2jgfFGqVBGXmcIFD1T5iw+HWGfafMMsMId5dNiPBU1ZkY3yMLpldK2KLa6Y2R81bh6oIlnsHKf/tl6ceJrxyA5y21eC7eN8RiAxO1hG5dWTJhlkN2/L5RvoUH5EkNur5AEbCTUKmt+jM8q7TfMUB2j/1SNw8uOQEJ9mbQtwp5hFfqBex3ppjwJnrvd960FQoZAE5c3uSqrJLmMYEGL5iS5Pm+hJ4XeD381rbZ4xRrX9nfwir522/P4uf8q0IzT/D0cTJyvjgvRZYG7N+M0bC9zkFV/H3IgSYY4lu5lUgcLTAaeVxEO/+uPKS3khciKjuv7j7Gk10ejWaVeiJrL2zLNaSwu5xZ7Ll4qZRIfVrTXZYf36mf5ifUMLgr4WWQkRxgee3mGKZIXf+7xmKVrwn6MD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(39840400004)(396003)(6666004)(4326008)(107886003)(26005)(6486002)(956004)(2906002)(83380400001)(2616005)(52116002)(316002)(478600001)(8936002)(66476007)(6916009)(66556008)(66946007)(38100700002)(1076003)(38350700002)(5660300002)(6506007)(8676002)(186003)(6512007)(16526019)(36756003)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?w6uzBz9rc3Aj1Bmz0iZjbYFAJjapqMjID3EBQSNccEclAfr7LszDczrzhxvZ?=
 =?us-ascii?Q?G8M+e5XRc4bvXZidW4Pm7VKPW+LJ7987/M6NZ6zQBz45Ab4hIVh9YYX3JH3B?=
 =?us-ascii?Q?CLec9NARNd1PQs9ltQxPwUn5HXIIqytFxuXLdiGk7YvgqmEN3UyZJlRTKCaR?=
 =?us-ascii?Q?mFY0h7FrUuImRsNXsc0ULcJa8QiyZiteFGePgUOGrvlIgHX6g3KGHCbm0m04?=
 =?us-ascii?Q?MqEh67vxLbmgGEH21J+E90cRmXiypm5QvRMGC3DMjx0jy8jWYjtKZJ5I6Qwu?=
 =?us-ascii?Q?OXJhJq4ESo8Jrz7eaeztPinoWWs8KuX69Vm5MZkoA7Ue7UGdy1hI9ieBUI2t?=
 =?us-ascii?Q?HNW3bOHcDGmI7EzxmWyrTBirgiSnCsczJD2pnrAEkF4hpGb/G5xEbzIY/Nz8?=
 =?us-ascii?Q?yOHEfP/XUCOa79UZnkKIaeR3wLEqsJCsroEFy2N7rW8D2MwIH7OpMzP+W8qL?=
 =?us-ascii?Q?Cq68n/57EijiFftxsP3yISz1xSRbDb4xHR8wkAYQAlqmBT89KZSMv5ocYjtU?=
 =?us-ascii?Q?OcAy7BxtknBTsNBUkwJ8fXvUzak6HM1ZV/BPwG9cV/aPOtBGdS2tXVNmbRVK?=
 =?us-ascii?Q?5UYkd7ZiVg1If0mXBCk6JrddP5G7r4Da1y9ANYXLoRwI5pBhcuVybJKpvzc2?=
 =?us-ascii?Q?+Pnss6l59Wn0PzSrWlPKKUVZje4YyUtrE3OVVYIdY73LIPGlWdSwOkcv6voP?=
 =?us-ascii?Q?mVGzw26ju9jX6qh7LHNIlmjzQ5C9WxlLP2FPFT7uxETI1PkwF32wwCj07Emp?=
 =?us-ascii?Q?Z4/YdZphu8YO1X2Gpv6ShmPKfMdpB+ScmpEAzq/S+ZStuPpatr8IrLw1g9Pn?=
 =?us-ascii?Q?zRbUCUEc9mvHUw3yz+ARO2KUJiBxSP4FM2+34mZlzxvXL4OucHcQ/4gYbb1q?=
 =?us-ascii?Q?v3hwKANrQhh7hbWOjusd01zRVovTIUjE+xZNkOUu2b5QQIviNd+j9OWGqt5N?=
 =?us-ascii?Q?9N7uU10fHAcoa0HhfOt+F7XSamMUWstsQ6PE3K6bMTaMuDXbfleViz0TDD7T?=
 =?us-ascii?Q?S7FGOdzYNCekt1fOHTzve/e9fQ1GGd/LBw4rGiARMGKKrCRpeyQPulYWEzsh?=
 =?us-ascii?Q?7gGt7/CMTQwoZ33aDLRR4eVk8FudMTaQvQvwZ/6PdZcnnUxnm/PqQH16sgZB?=
 =?us-ascii?Q?qROew2N88qMmnwtkASqYL+qCV3e7SCiJXQyBSftr0E+0rxy2q/vLKisMRYYx?=
 =?us-ascii?Q?kdDtNVUYd6eERKuFI6ykJlVbm4Hk9kj9/Lz1kxZYFnBQ5ZUpcpR3561q81Ag?=
 =?us-ascii?Q?2EVWgxN4wuCF4mNr8pGIRhnLV+sn84H9JlioWq3kh9q9TzzLl8FVbTRaomjC?=
 =?us-ascii?Q?vYVEth/6YvkfjFsxf1p1ZluT?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 625663e8-4731-4c75-394e-08d905ac0a8f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 16:31:12.0567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 88Wq7nTdmQ1vENQwNR0Pc1c+bck43VAHSwBRUAvSviQM6diUCYGoyYZkOFPwz0Kv9i+tHmOAu4pIM146/0vlTk49xkRVtgFPajh1VU04/1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3861
Received-SPF: pass client-ip=40.107.0.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

We have the following bug:

1. Start write to qcow2. Assume guest cluster G and corresponding host
   cluster is H.

2. The write requests come to the point of data writing to .file. The
   write to .file is started and qcow2 mutex is unlocked.

3. At this time refcount of H becomes 0. For example, it may be due to
   discard operation on qcow2 node, or rewriting compressed data by
   normal write, or some operation with snapshots..

4. Next, some operations occurs and leads to allocation of H for some
   other needs: it may be another write-to-qcow2-node operation, or
   allocation of L2 table or some other data or metadata cluster
   allocation.

5. So, at this point H is used for something other. Assume, L2 table is
   written into H.

6. And now, our write from [2] finishes. And pollutes L2 table in H.
   That's a bug.

To fix the bug we now have host-range-refs, which work in a
way that cluster is not "free" (and therefore will not be reused
and we don't fall into use-after-free described above) until both
refcount and host-range-ref are zero for this cluster.

Let's call qcow2_host_range_ref() in cluster allocation functions:
qcow2_alloc_host_offset() and qcow2_alloc_compressed_cluster_offset()
used on when writing host clusters. So that now these functions returns
"referenced" range, which caller should finally unref.

Iotest qcow2-discard-during-rewrite is enabled, as it works now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2-cluster.c                            | 13 +++++++++++++
 block/qcow2.c                                    | 16 ++++++++++++++++
 .../tests/qcow2-discard-during-rewrite           |  2 +-
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 6105d4e7e0..999a739024 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -809,6 +809,10 @@ static int get_cluster_table(BlockDriverState *bs, uint64_t offset,
  * already allocated at the offset, return an error.
  *
  * Return 0 on success and -errno in error cases
+ *
+ * On success the host range [*host_offset, *host_offset + compressed_size) is
+ * referenced. Caller is responsible to unref it by qcow2_host_range_unref()
+ * after finishing IO operation with this range.
  */
 int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
                                           uint64_t offset,
@@ -866,6 +870,9 @@ int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
     qcow2_cache_put(s->l2_table_cache, (void **) &l2_slice);
 
     *host_offset = cluster_offset & s->cluster_offset_mask;
+
+    qcow2_host_range_ref(bs, *host_offset, compressed_size);
+
     return 0;
 }
 
@@ -1738,6 +1745,10 @@ out:
  * is queued and will be reentered when the dependency has completed.
  *
  * Return 0 on success and -errno in error cases
+ *
+ * On success the host range [*host_offset, *host_offset + *bytes) is
+ * referenced. Caller is responsible to unref it by qcow2_host_range_unref()
+ * after finishing IO operation with this range.
  */
 int qcow2_alloc_host_offset(BlockDriverState *bs, uint64_t offset,
                             unsigned int *bytes, uint64_t *host_offset,
@@ -1848,6 +1859,8 @@ again:
     assert(offset_into_cluster(s, *host_offset) ==
            offset_into_cluster(s, offset));
 
+    qcow2_host_range_ref(bs, *host_offset, *bytes);
+
     return 0;
 }
 
diff --git a/block/qcow2.c b/block/qcow2.c
index aa298c9e42..d0d2eaa914 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2489,6 +2489,8 @@ static int handle_alloc_space(BlockDriverState *bs, QCowL2Meta *l2meta)
  * Called with s->lock unlocked
  * l2meta  - if not NULL, qcow2_co_pwritev_task() will consume it. Caller must
  *           not use it somehow after qcow2_co_pwritev_task() call
+ *
+ * Function consumes range reference both on success and failure.
  */
 static coroutine_fn int qcow2_co_pwritev_task(BlockDriverState *bs,
                                               uint64_t host_offset,
@@ -2554,6 +2556,9 @@ out_unlocked:
 
 out_locked:
     qcow2_handle_l2meta(bs, &l2meta, false);
+
+    qcow2_host_range_unref(bs, host_offset, bytes);
+
     qemu_co_mutex_unlock(&s->lock);
 
     qemu_vfree(crypt_buf);
@@ -2610,6 +2615,7 @@ static coroutine_fn int qcow2_co_pwritev_part(
         ret = qcow2_pre_write_overlap_check(bs, 0, host_offset,
                                             cur_bytes, true);
         if (ret < 0) {
+            qcow2_host_range_unref(bs, host_offset, cur_bytes);
             goto out_locked;
         }
 
@@ -3151,6 +3157,9 @@ static int coroutine_fn preallocate_co(BlockDriverState *bs, uint64_t offset,
             goto out;
         }
 
+        /* We do truncate under mutex, don't bother with host range refs */
+        qcow2_host_range_unref(bs, host_offset, cur_bytes);
+
         for (m = meta; m != NULL; m = m->next) {
             m->prealloc = true;
         }
@@ -4122,12 +4131,14 @@ qcow2_co_copy_range_to(BlockDriverState *bs,
         ret = qcow2_pre_write_overlap_check(bs, 0, host_offset, cur_bytes,
                                             true);
         if (ret < 0) {
+            qcow2_host_range_unref(bs, host_offset, cur_bytes);
             goto fail;
         }
 
         qemu_co_mutex_unlock(&s->lock);
         ret = bdrv_co_copy_range_to(src, src_offset, s->data_file, host_offset,
                                     cur_bytes, read_flags, write_flags);
+        qcow2_host_range_unref(bs, host_offset, cur_bytes);
         qemu_co_mutex_lock(&s->lock);
         if (ret < 0) {
             goto fail;
@@ -4540,6 +4551,7 @@ qcow2_co_pwritev_compressed_task(BlockDriverState *bs,
     ssize_t out_len;
     uint8_t *buf, *out_buf;
     uint64_t cluster_offset;
+    bool unref_range = false;
 
     assert(bytes == s->cluster_size || (bytes < s->cluster_size &&
            (offset + bytes == bs->total_sectors << BDRV_SECTOR_BITS)));
@@ -4574,6 +4586,7 @@ qcow2_co_pwritev_compressed_task(BlockDriverState *bs,
         qemu_co_mutex_unlock(&s->lock);
         goto fail;
     }
+    unref_range = true;
 
     ret = qcow2_pre_write_overlap_check(bs, 0, cluster_offset, out_len, true);
     qemu_co_mutex_unlock(&s->lock);
@@ -4589,6 +4602,9 @@ qcow2_co_pwritev_compressed_task(BlockDriverState *bs,
 success:
     ret = 0;
 fail:
+    if (unref_range) {
+        qcow2_host_range_unref(bs, cluster_offset, out_len);
+    }
     qemu_vfree(buf);
     g_free(out_buf);
     return ret;
diff --git a/tests/qemu-iotests/tests/qcow2-discard-during-rewrite b/tests/qemu-iotests/tests/qcow2-discard-during-rewrite
index 7f0d8a107a..2e2e0d2cb0 100755
--- a/tests/qemu-iotests/tests/qcow2-discard-during-rewrite
+++ b/tests/qemu-iotests/tests/qcow2-discard-during-rewrite
@@ -1,5 +1,5 @@
 #!/usr/bin/env bash
-# group: quick disabled
+# group: quick
 #
 # Test discarding (and reusing) host cluster during writing data to it.
 #
-- 
2.29.2


