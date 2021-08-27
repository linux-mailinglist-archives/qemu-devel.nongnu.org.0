Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6AD3F9EA7
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:21:26 +0200 (CEST)
Received: from localhost ([::1]:51748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJgTl-00040A-LR
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgR6-00013g-Li; Fri, 27 Aug 2021 14:18:40 -0400
Received: from mail-db8eur05on2112.outbound.protection.outlook.com
 ([40.107.20.112]:12641 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgR4-0006Un-Tl; Fri, 27 Aug 2021 14:18:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XtghcKRL0/l43m0faeLeRWcyuXlrk4rU64l+JHxhaxijVjEVQgeF01YkA37dqpnypLkmRkCzWGwWW5anxb6Mclt1Zea2m9dOryLFZjMvdvPfvVU+PD9FMPk28SsaXHojNSiug8PR8CrBVwTf1rugE6KUf9vregoyF3sQ8ELNklWmPbWp9huAzdWcAgs15Erze1fPntS8TWKR9AZcNj9T/CJelUuzFWcwneLmfB6C3iWhZyGqvkJ4CeVkhSlzbiQMExKSL637bfSv8/J13NMMsmgyauieTyUwGM85VM8ZUqAEi080bQWwl8vN9SERMt2KWx8K5zvHy+P5SguLAYwbUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YuQd5gQe7rRebxcPWjlO2ZJZ3QIlfE9b4AMlG+KaCSg=;
 b=Qm4ElqLjr357qddEEgZcgVSZ6SRs5ryUf+p77QenUXR1if6lBDwjUdh7PoVUvqCYnu2vc3UW0JrdZL2MyjgwVefptLOEbCSQtTlKRGd43J07YEWyBw0QewCphUNv79vm696ePJLZzeAC9CcfFatoib4z/sblWri7HFLxn+CdErOV13p8SEPKfRS+CyGxZHvFvoE3M2nUr0zpKNsEGDRRGgsJArJ2+rRusJj+N70iFRE8Z0hWZPM8jYztCxLae/vrBZrieyUsVOPKkEoOoKG6oe9oBoXJZhZz9LfOLpMNX9mUZbkj1z/kEEHullfkaukUmuS3lxxqPC45LKv8SX3Png==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YuQd5gQe7rRebxcPWjlO2ZJZ3QIlfE9b4AMlG+KaCSg=;
 b=DepXHa8I52A6HPKtciTB7gX0+jVRBh4Yr0kaLIQiXHo8yu5b57rIcNUlKscsqceXB89O63SsngXYOv09RvabXSB+kbvS0t2FgeYGhC3dwQ4dvZBvBspyxK2tTc8D1kh7ooMTs8lnsGo78QImB8FuaP/ajU5IM+BXVKB6vSWfu5M=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3765.eurprd08.prod.outlook.com (2603:10a6:20b:8f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21; Fri, 27 Aug
 2021 18:18:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%7]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 18:18:30 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v2 05/19] block/block-copy: add block_copy_reset()
Date: Fri, 27 Aug 2021 21:17:54 +0300
Message-Id: <20210827181808.311670-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210827181808.311670-1-vsementsov@virtuozzo.com>
References: <20210827181808.311670-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0402CA0012.eurprd04.prod.outlook.com
 (2603:10a6:3:d0::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.220) by
 HE1PR0402CA0012.eurprd04.prod.outlook.com (2603:10a6:3:d0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Fri, 27 Aug 2021 18:18:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1259983b-0a05-4ae2-9b82-08d969871292
X-MS-TrafficTypeDiagnostic: AM6PR08MB3765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB37652FC079BF9D2D3EBDE610C1C89@AM6PR08MB3765.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:69;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bAwBsIt3mTGzjBKy0lN0UAQPtV59O3SrkLRMOzKGg5hyPCfZsLfeKj5zHC0x65ysrq/Wb+XQGNyQNbpMJ1Dz2l+jZup5CSorq2pZloeaBPEFEf5bK7z2adB5G+JlSKHFK+ZpXc9ammxOEbz0KilvnShUcxQzZ6QBm0ip2QLctOj8/BTHznKHCkYDw2ccEHv1dxG4U6NgQhStEk70cwIj8ZKbv5nq5vxL9MZH+yw3aBqheETxjBCT9LGHvzfVqB+niz/UeomOJYHAqelFtdlsJHWNquzvTl+/xlp+LCpyjaVmYUFmvzZj1UBTzGAXLi7J8ctGp/wSMM5ish6itoZBVeF+8M4DKPF9INdEUtG6YjNTXTCb9Y3MMjzpVcMreVsAe16Di1exqvqbf/lB8l/E25LT0UZhl+MyDP07ZCBCd3K5nxnDaaDfHvtE5/9U6kNxG+i62sRYSDdKMU+6AYj/ukjJZDEsqNo3dcuJwzbUY37JQBm2CIfEfQMQdAr7Sk4jT2U+O9l2a0S3RQ37efQVr8z6bDOpPQzg7en+WKqvhf3HRpDQwlGJUOdlQAzNcfEVcy9/LCfXWrHonWR/5U/9eC8ybboWptTLfToDDPgwiuFzpzZ+LotG4YF7EAF9EyalHB/cBcSSrfd5mCnvZ0cZ394JhsTLl25LN1FcLcckFGmzirGxK9RpcYXC3acWiiM7Us+cE4NBDEcJ3FjxMZw8uA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(366004)(136003)(346002)(396003)(52116002)(6486002)(1076003)(26005)(66946007)(66476007)(8936002)(6506007)(2616005)(38350700002)(38100700002)(956004)(5660300002)(86362001)(8676002)(186003)(6666004)(83380400001)(66556008)(6916009)(4326008)(6512007)(36756003)(2906002)(478600001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g6RZZGvsRZRCDTRAcUsICcu5m7TNv8mK8EWebzjLiSYeptWM9rYWMIyslW8H?=
 =?us-ascii?Q?b3nsc9pL4ivnV9uXgSmf+hsg8QnLPUYJrslFyCIgACtjnbQDQvtkBY2QaOlA?=
 =?us-ascii?Q?ddaz9CKJUMWbwULray43U1HQVtzeNHbB6AhdGmma4V/8fABexqCXKpf7vj5h?=
 =?us-ascii?Q?z3gSJMaWfdmv3lSOdRBRjKhRsvtBhetIuFsg+Q7pbwVyIf9GTi/pcZWRUpKE?=
 =?us-ascii?Q?ohkx7S7Oq0gyMABYqJR+RDYKy0r3IB77g996k8Xg3zRMcJwVS5+ZyZjaUgjm?=
 =?us-ascii?Q?enNUjS57Ne2a+n/iYUTsTsdrF1Aroo4ozij13mZJRQfm8SmgWXwMaDG+fD7G?=
 =?us-ascii?Q?bxZvTenS/QKfz7MsXE9TXLeVGn5YfRZpHxzqa7hZkFNNnzRUJfKohaN4Evi2?=
 =?us-ascii?Q?/ExYdeGLGivebiq1s7bDf8Wr8jeQWH/EehVkb7QW3RdFvm4XiJoC6WaDTtMy?=
 =?us-ascii?Q?M4aZQ0g/r9YotTeH45CXm94EcbXRVR4TyUVXm4EaoKW/3OTm6JaxaWzVB6nQ?=
 =?us-ascii?Q?cBWmzeqrgCHVhKxm90xw5SIGk9A3hwD6DMfyJhWxArK6gKU8l99/u+pnw9uK?=
 =?us-ascii?Q?TqpVel6h5J00cXyRBPZcqHxXw0Fq3/ukW1ith0KlNgosAM2sgONe18w0LdhN?=
 =?us-ascii?Q?va+JZ2MRtjcfvEWgO2zXDbLQwA2XYvbjTxra/ngz04Rj39Pbs0NG9JdfW+G+?=
 =?us-ascii?Q?EI9oLe1ypHuGKY9Nz3kglQEtHrkAb1mrIczn+gAN9vOaCqwZLXhF+B5uriMG?=
 =?us-ascii?Q?OfyLOTjOUu7CMHJ0fpLczoGPrVfYBUgBKMp7GGHiNF/7j4HG5ibOJA2CH7V1?=
 =?us-ascii?Q?MLO0F2bXuamCqoU6EMTVgIJa1iYPGFKTof0JxgK5M5DvswXGx8EZq/5U1mf4?=
 =?us-ascii?Q?BSXB0pJke4weicaSJMLYJhTr5T8/N3hqFvJ8ahIeC5x9LrWqRx9eykBK3z1J?=
 =?us-ascii?Q?IpDIMwsZpuxWlEB02dWx/+/JslzRmh/P8PSj/ctOu83rmK2maM/QYx0pWIpq?=
 =?us-ascii?Q?GJMtjjZpSlzmGRi96B19D+UpO7/epiqdDvTCYU/CnO43pB+gR8Nl93kIzFMr?=
 =?us-ascii?Q?cIYhx8AM0svN/Yaa15xWOBhv4fn/g72sdft6OWKDS8u8Fg0velYr7c1yz4EE?=
 =?us-ascii?Q?G2EYJiEGb2rHGHf2ITO59b5MEUyZQsIwPH41gnrYkiErA0jsP0c8zX2Ow4E5?=
 =?us-ascii?Q?C190zQLBigkfokkmVOtLLKhxSed332z/yRWoew37cWT/0JUzyEh58h5vzgDf?=
 =?us-ascii?Q?WTHD8pNHeHMhyT0LoXPgM8qnsZB025E4FUs2v4Ip4yixDz3agUGz6OmtnSqJ?=
 =?us-ascii?Q?8h/ALmwnmwLOTH5V8uTnwVEQ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1259983b-0a05-4ae2-9b82-08d969871292
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 18:18:30.3939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RiAnFeSwMpNFvkHhBdIdnGPKCzZkzL5kJeIeEm804xv0y/SkefB0ZwJ9najlDiHzaZPi5NfbS62r7kGuabQ34h3qMNwZqA/SIoi1sS3IBHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3765
Received-SPF: pass client-ip=40.107.20.112;
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

Split block_copy_reset() out of block_copy_reset_unallocated() to be
used separately later.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block-copy.h |  1 +
 block/block-copy.c         | 21 +++++++++++++--------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 8da4cec1b6..a11e1620f6 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -34,6 +34,7 @@ void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm);
 
 void block_copy_state_free(BlockCopyState *s);
 
+void block_copy_reset(BlockCopyState *s, int64_t offset, int64_t bytes);
 int64_t block_copy_reset_unallocated(BlockCopyState *s,
                                      int64_t offset, int64_t *count);
 
diff --git a/block/block-copy.c b/block/block-copy.c
index 65019d0d1d..ca51eab149 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -689,6 +689,18 @@ static int block_copy_is_cluster_allocated(BlockCopyState *s, int64_t offset,
     }
 }
 
+void block_copy_reset(BlockCopyState *s, int64_t offset, int64_t bytes)
+{
+    QEMU_LOCK_GUARD(&s->lock);
+
+    bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
+    if (s->progress) {
+        progress_set_remaining(s->progress,
+                               bdrv_get_dirty_count(s->copy_bitmap) +
+                               s->in_flight_bytes);
+    }
+}
+
 /*
  * Reset bits in copy_bitmap starting at offset if they represent unallocated
  * data in the image. May reset subsequent contiguous bits.
@@ -709,14 +721,7 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
     bytes = clusters * s->cluster_size;
 
     if (!ret) {
-        qemu_co_mutex_lock(&s->lock);
-        bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
-        if (s->progress) {
-            progress_set_remaining(s->progress,
-                                   bdrv_get_dirty_count(s->copy_bitmap) +
-                                   s->in_flight_bytes);
-        }
-        qemu_co_mutex_unlock(&s->lock);
+        block_copy_reset(s, offset, bytes);
     }
 
     *count = bytes;
-- 
2.29.2


