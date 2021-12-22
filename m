Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8203447D60D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 18:51:27 +0100 (CET)
Received: from localhost ([::1]:47260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n05lu-0007oa-IB
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 12:51:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05be-0000pH-Fx; Wed, 22 Dec 2021 12:40:50 -0500
Received: from mail-db8eur05on2127.outbound.protection.outlook.com
 ([40.107.20.127]:22544 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bc-0002Yd-Kl; Wed, 22 Dec 2021 12:40:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBUfVpY6NHt7PQ4z+1bIuFrJXxPcwCsQrItlUpC3aGEHX2IKgya2zmdpH35FcqqGsYzznEs9HFHw3fVvbAElYBd14Q/2bYRa2Hmbnl6pAtL/gwc2bA91G0+VSnoqxcrNKwmVER8Sg5Cd5nJ6klDpP3IDauVVtLQAN9a2N3CcHJsZVGa70nU2tEg+vEoh6FwueUGoTBmbgoNKUL0y0Nbs/9VcL1wqQJ5LWoKzVyVHwN2olFprDFtZazsC6IugpNk8aaWx4rbf4Zaj7sYxK1RzprQR4Z/LnoVaUEMukaJzeqkR0S2rzPNeCfE6ybxaEjbfcQGtMBligxUzVpllSG+A9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASMuc1iD/rgUApJoFMSK1L7vSXAimDsPhGlCLCMesH8=;
 b=OBvR+WiSxhu1rEXT+F8IjS56h1bkeHUZH81KxXFgXkOmzLhP/2ZJFazClLR1fvBBciwzOQbXOxIj1Ae23R1knvMlQvnOSm5u7WyTvxqVq6VOykcGY54LhYFOotpO2xpQYJHnC+1egpJ94kLJRZBuuvgQUXO1e58rEnsjK0cKA2sv3wXiByUysbokZ4Se1p41k/nFk61tKB8BkIsmHVRdrZq4zgvKxb9835egcuzsU3QiA+OVDcUdcuy7ahNmzNI4XH19M+XrAFPuSY20Y4FET7sHjRWAkYBs9RoX0Aj24QQHgYxUkx93vysufXNUvBqzRWrmonGNTS/bFf6BNO/K8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASMuc1iD/rgUApJoFMSK1L7vSXAimDsPhGlCLCMesH8=;
 b=QXNV9/w9sqz092NMgm973Ef4Y2IEyvSN7ezXt896fOm9MtXyHByB18ehnRzQ5QiwaPtBWOBJNbPHvnNkpTDipqgxg/F0Eo+QWfDiq3rMBATNE3zi/i66YWDosZTf8WMeX5pXMcxIICQ+PSWb6YakzEWqCv2tWovxv4mgZaX55UA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by DB7PR08MB2988.eurprd08.prod.outlook.com (2603:10a6:5:18::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 17:40:36 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e%6]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 17:40:36 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v3 05/19] block/block-copy: add block_copy_reset()
Date: Wed, 22 Dec 2021 18:40:04 +0100
Message-Id: <20211222174018.257550-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222174018.257550-1-vsementsov@virtuozzo.com>
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8P250CA0017.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::22) To DB9PR08MB6748.eurprd08.prod.outlook.com
 (2603:10a6:10:2a7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9683bcc-7188-42c3-37c7-08d9c5722968
X-MS-TrafficTypeDiagnostic: DB7PR08MB2988:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB29883DAB42442411B7512C16C17D9@DB7PR08MB2988.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:69;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ULeZyRZm8BEFDG+2Vtvkx7QNgSnV4Tu/jeoUGxyCxe3lTdXQ98uV69PiYqHjBuGuW6xkvmV+BjQTL7SkNm+7so6G7wudkMIT/Qvx+4YvTgCeb4Ef/bKlUZWmZVvnNY3HvJ6Lz09ZkDePbx+LdO7wMMRh34fYH1X+E0mmsg5+aJO0N84otuuW42KEHfn5yW7xOuumzpjHYa+ORH2VjIWXveC1Wgn1FY45HH8PwOav3gYZxBaDd2nXwHdtXGiHOMiqNmAExOOVMO/qbkRNwu01W4LCGDMK+UgDYhxA72Td2UBz4uuXgksiwbeuILZ3jdv1D0mtrOGojgpXvSA8DLcdnIvCxyeXu74EvFuTke4Uy/U12GrHFVSTNVBDjuvsr17mK2aiavmS+W738HpQ5h3hJhFR8QiS/n8fwaCHbTvAs29LqW4G/idUbmgcsgeztFA5DNWxe/KeT/Ak5tZGygROXoZFDO3ppSP7N0KZHyzYN/ObrfdqzH+EHRRnZC7yNXEOefd2vdVizgLKMRqRpGfey870Fi3bIyuF3Z/Zau7paLvcQr4ELqSa2cy6PYSMBDHNOBHqDMBLnWiFJ7jxJ8PiGMRoGZTJJdyhiByZgVm/Pk1w/1pn/Crak0BmQXMaktPAuAbW5ONFfzUL2J36w0d2+9KNn9DDUugKA/mQbkYvfk8/B8w4ASNVB2adKbjJKIf7FOKWofv6MAsC6h+7Wj5P4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(6486002)(66556008)(38100700002)(66946007)(8936002)(1076003)(86362001)(83380400001)(5660300002)(52116002)(36756003)(6916009)(2616005)(8676002)(38350700002)(508600001)(6506007)(4326008)(6666004)(186003)(316002)(2906002)(6512007)(26005)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?71eg1mymFUEqyaEh9POXBDXkepEvaOWH13SP0S/9nYcDFWb5Nq2j9ebyp7wy?=
 =?us-ascii?Q?HJqEB+gOYjjNZqGzEbDGvo0XtwVBk0JGSccvZhFiXR+UUAJzlyOH5TzdpzzF?=
 =?us-ascii?Q?qTn+bYnDMQJDtGYW2oiRNbRYmHACLWcrI1Fgmrtk+AmpOFyfAorgwz/anMYh?=
 =?us-ascii?Q?Bggg45+svHTXPU2UucceXz8nugb+n0ZlcWvBKUhS+38NkDhZX7UOLSs1D19/?=
 =?us-ascii?Q?2vLI5nhF+D3rYrFU/r/d9hjysW5KxjEUtHgX4MZMrprf1l8NQ7Dy94DrjJD0?=
 =?us-ascii?Q?b5DdUcV2k6uDdc2FCcnrrzSyF6+zypSHxuT7rMGFqyVZSAmibJLvwjF4rqcZ?=
 =?us-ascii?Q?zu8gf7SG6CTFNiiixoP4F65tpey699AmqA1mG0wEoRBRre39GXTe+ZIokc3g?=
 =?us-ascii?Q?89puo9wxHyPT5BwVfBEtn12QNYmXJ+8W485q6hrAlJJhsdCNaBsS8kgHNK6u?=
 =?us-ascii?Q?UJRsEXHdhdTPGFZEXZAziWFilpSdgiIwDlOqmlfYklCSVTJxMUEwsGGRybXU?=
 =?us-ascii?Q?aUa9VJeAQ85zpBGGVjIe9vUj0czR0NaVI+ol8VjYP9exQIf1lSuS/MGvreR0?=
 =?us-ascii?Q?+qHc267hb6svW6m8pHZzcKqqY4KtvJn/yAKkNOVtr3JxNq9kDZ3DQcXoWvdU?=
 =?us-ascii?Q?8yaFKx9jgVW77jQ6RpneYoErjloEuQYNKcL4YMaXE5IMMhTAze5TcU1T+Sqw?=
 =?us-ascii?Q?HiZpOWiEPQVxmNdc8NXIpfYmxEOflQAp9baNuwNrbfce6jT/7eCjpPjNsT3M?=
 =?us-ascii?Q?aPM6zWnJmpEk237CQMXLf5mf5+AkCZptVL817jE/u1dyHfXs5I09ChC/ypGe?=
 =?us-ascii?Q?rgso0zNFvY6dtVj8jomag49q9+PkVi3YJnFp6whyAcPi00+cFE9maZLgFnLM?=
 =?us-ascii?Q?CDharTjdhVDaxM4WZhSf6wcKB7iUgr6roZQaTGCJM/oarIqnvMAB8HbmXtPz?=
 =?us-ascii?Q?ffHUKYK5alc3N8/GjtRYVA4ywwIs/VYuHBme2BV9xlaMmGifslCYy0zoVu4g?=
 =?us-ascii?Q?NtMCAxwbfE2t5iwYSZvvXmdK9zuBhz6oOEQbmBqIVJivrb+i2UUilfkhE7rE?=
 =?us-ascii?Q?oqxa+BluRHrVe9WC+Nmsis5IsNJV6pnvAXH6QdBjr6RDdafYsfg9yP1UODew?=
 =?us-ascii?Q?4UcHZ3SS1tnTMyDIX6tj1b9IJOMJJuKZhf1FR9bXEzf4YYj/leneQPeUqRjj?=
 =?us-ascii?Q?3GYE0M8h7EvrehDEwdmqH39O3NbzBFXlGIYg20O1Ky/DeOPFgaMr6m5q1vp7?=
 =?us-ascii?Q?UxNGdO107l7b2W0oxyiJUPiMQitPNer5zpXcFiAuA3qWmYqK2D1DslChnWhw?=
 =?us-ascii?Q?QEQn+lB/Ss5KH7tdVUJQO1nP0ATBvi+zjsa/D9VG6aSfL/UcevM/mFlEkp8V?=
 =?us-ascii?Q?8jSqkbYgupznvrPu/UOn0UIiQW1d4EvnIrIFCTbFi7aQSPM34VJkKN4riPVD?=
 =?us-ascii?Q?poBmfopd0DBHOxUMndnT6YR3ZQZRDh1nfelxPxGzjYsvjG77vsOSBJjGdcbV?=
 =?us-ascii?Q?e4tljtRPnGrC7NOXYJvwtcSLwE5+GAi6FE54NflnORCySr1RLuEg57sKuCH8?=
 =?us-ascii?Q?W7VZGFrVQgZE2OQT6bKVrxRCUQ+zo92NXWWTdbIWYRjj6sRC/Tl0uw5Nt+sT?=
 =?us-ascii?Q?OT068kD6H1Mhf8f5rEeuW/mqzonOJKverntbsr8uIf+EJIOA8pD766psLtWC?=
 =?us-ascii?Q?wLMbz+kauvfFsAWWX3fQOm2ywzM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9683bcc-7188-42c3-37c7-08d9c5722968
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 17:40:36.2836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /KelLESCBsJ/NAY0GrAbUzixpHbUb8l0/kQlbyD1jIaIMxXXd6OrcS1w24KoYcQtV0cTRe7Obgcu67+3FQZb5WmmXtcwSLHbQi5oU+6HYAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2988
Received-SPF: pass client-ip=40.107.20.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
index f6345e3a4c..6228cf01d4 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -690,6 +690,18 @@ static int block_copy_is_cluster_allocated(BlockCopyState *s, int64_t offset,
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
@@ -710,14 +722,7 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
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
2.31.1


