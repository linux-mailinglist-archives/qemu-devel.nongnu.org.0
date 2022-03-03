Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE364CC668
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:46:56 +0100 (CET)
Received: from localhost ([::1]:43378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPrPb-00074I-AQ
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:46:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrN8-00042C-TB; Thu, 03 Mar 2022 14:44:23 -0500
Received: from [2a01:111:f400:7d00::701] (port=54113
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrN7-0004Yn-5T; Thu, 03 Mar 2022 14:44:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VLiiC1pec9ghapWBRfNopMAM36LMtjMrOZJqxzz/bo9L+yfmERhz4LGJ9SBG90U0NNzTTaqMAeFIk6lKUfHHLYJBx6ZW6dW286fYuAC/i+K+lamqnmWRGFFoUWRkFmjkIstkZ6KvlT7b2+ZsxnVF0toiDQvklZ91W+yM71TtP1dU1NmXb1EX0adpey5Tyxvw5qucBhZNEvStm/iJWadu7RWjA2D2UkokhuaVG6ArVGuktEKjZ/lgoRrzqrmP7YwFtCrRqfB5F8RmTxGIunxgKpL/Yb+tzgu75KxJZRpnYE6LO1onhU6mIzWdXUE4kLIrGx1YX5BgvqkNe7lZpX1uiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ca8vM/oTqjTB8b5Pi2Mz4F8t/yw948dRrpl+Gsj2CCw=;
 b=TLsp5D04YNDEkYgzVb9qeOVz9FSpIv6ZMF80plbMeO9Eco2HjBdWrTLrHyhxAnqxXLY8Wm1W/YpN2zde+Xy6ET8SG7ZtEmYEBEohB6jtB/Vp0xukwX+rnQHRp4ZdzJflAF17ACH61khdHUFkXiJ8/TfJMtMKUCL9lRfG084kbq+b4KV/mgZCyD0FPXwsckW+d5bgqZVdX3TaY2nDyYZJ/0ycGu4dXL4kutxwtcl5yvlK6fBFiYOdAz8j94333hTH7jYGnG8qAgO/8TmFxt6RlJ5sfws8ew9a7ymL8c6Dhlu36V9NIX61cDsm3utp64g66lM4FaA1U7Yjnl3sboZOHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ca8vM/oTqjTB8b5Pi2Mz4F8t/yw948dRrpl+Gsj2CCw=;
 b=jxj+LjJzwA4L9C7YG+6FyBkYIqYPkU0zjZIYEGIZLhD3C9YeN9LvOn67wDmhKt/e1yMNDbnxSRXs/2fHs2yKr+fDseBSenB1GLbh5Q+wp9d+v9orqvKngvqGfEEiSxNPbqe+3lqoUjfm1ZdmT5bEew5wOzoH/TzUvEe/XgWur9w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VE1PR08MB4736.eurprd08.prod.outlook.com (2603:10a6:802:a6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 19:44:08 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d%5]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 19:44:08 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v6 05/16] block/block-copy: add block_copy_reset()
Date: Thu,  3 Mar 2022 20:43:38 +0100
Message-Id: <20220303194349.2304213-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
References: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0038.eurprd03.prod.outlook.com
 (2603:10a6:803:118::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abfd5851-bbf1-448b-1171-08d9fd4e2eb4
X-MS-TrafficTypeDiagnostic: VE1PR08MB4736:EE_
X-Microsoft-Antispam-PRVS: <VE1PR08MB473604486314953126665DFFC1049@VE1PR08MB4736.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dY/Ze2MzJVrTHonPv/Qht9Aahrv2Ky2qmTzKMmtWhzLA4tcq3c6gsEds9YJc+D+MdA0KKOsChf0s36LKOj8AovBeuNEjuwEWASx8iMouAjUj/4bASjuO00NOyq7xaUDfN6LCXYrIJIoVVgoafsQ++Uqwz9hEg4Cjz/6M6AauIipvnBf0xUAvkMKkYKi77VSuJNnmJ6l+OkZ0YM0p2USIlNM7VfQkSH6VsWWqJn9L1qNa3STp5JL1Rb8fL3v5JVqH+q13w0Y6c5b/Kuh+OUOnG7PQC51Il0T+QRyPG1lVt2XuGbEu4UC5aaLRX042CknYjALTgks7R8FF8XDmEGgX9FojmPZg9rr4XhM0oEGgAK769mjAAzdWIIM/lLK+QMjbQrG7XvpB9wLm6H2SAxKz9qTX5W4DOjP2yVOUSEM6yejUyfB/L0YpBUEbcAp8SZ6GAgjjb0LHQVZvUopOzDKCvpOJmN7AVB63awW0fhOLOqwS5w7hLHioTLa3Ez2Dsey21xHmZPJC9rLFjvF3PRangEjEfzbD78Iswy3mbDdKePMq6WqmUr9M1wDA1sycluS6iLwKkE/WvmBHPPUjNy2eot5moojQEHl2Mg5Mtz7Tk9dDtDTyzD6q9x7QUM/+SfSWxFgslQTeQU2HnxiWZkKig2iIDU+9XbR9mrc5Ld/CQ8zQ8TfjgXV5QmzFSFcPii8UzvbSd2PtVTklOxNjuWiZsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(6512007)(26005)(6486002)(6666004)(186003)(1076003)(2616005)(316002)(6916009)(508600001)(36756003)(4326008)(8676002)(66476007)(83380400001)(66556008)(66946007)(86362001)(8936002)(5660300002)(52116002)(38100700002)(2906002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+ltiz6Jrfu4T+swJ72x419oidioIn1ai/gnve0sBzoUimX1QTOLM/tmYg1Bd?=
 =?us-ascii?Q?8vfltOwIFKScJXzbWAa08o6CF6YSap4pKwghw0bUmITT8PQOv1e0iNBT6/MV?=
 =?us-ascii?Q?qM9EQhbrdBlDim1jb7oid4QEmJrMEMYKRMY3Z3d05mDxwIwB8Kr8xSCr6uga?=
 =?us-ascii?Q?RYxt0dqGmdDokBr3JuON7rCPwO0vA/sFyU/uTUAnbdXrW8sao6TwO3Q9ZgEZ?=
 =?us-ascii?Q?7D9dNSY3lJ1CKG/TLmzZXmYHtE9hAq+HDyEbM7E9S9mUHY82dx85iPysaVWn?=
 =?us-ascii?Q?gTfAxR4S1ltTXy1JZk5vw4PVbAhiRLpZks3cOo9qQAwwhPAOP2iDfep5fAoq?=
 =?us-ascii?Q?pAxIZbseVES9LhzuQ9pWxmyz33Of7i8n+EThGtpQHb5mAq7KPWEBN5kmJVRQ?=
 =?us-ascii?Q?jRjfYZ2CZDbu1w+kZDGw1ujrGmrVBzO9uHeCYFrgCKS2GMO7VxSs0eFHyn9G?=
 =?us-ascii?Q?TUnIRUOBjpfgJRdYtvBVc28d/irBJexR43nW7ke6NoHgkHkjUbE7vs0avZtx?=
 =?us-ascii?Q?5yC1O3G0l9mworIDVLkFHmAo0/31AlGaIJbaxpbwW2Ym7AkS5XPrAynEU5U9?=
 =?us-ascii?Q?mOem49uKGUQCWYZuaoLs/FpcuEXiV39JOI+fiEgR+ejTKZXiomuzpc/4P0jc?=
 =?us-ascii?Q?Ez56jRyzAT0ZlUB1d+6ko2ij3CRHUm5D8p5Xab4kOJxaYPEJxr5qRQuUICQD?=
 =?us-ascii?Q?iofUU4ml2rbst+Ojc3qtEBdLfxdBMZCm3ZpkTwysTopmw0hGtyrgTrdTX+Aj?=
 =?us-ascii?Q?De90iFuoARscsfup9X4PQPZyIcFwHbm3mIG+CF02gz4SpwBhgTFZMbKAd/En?=
 =?us-ascii?Q?y+MaNGPkOAN+1+uRdetAqHiSPBCNigGYBa/fkSQ0KkaOY8an2itWngHq542l?=
 =?us-ascii?Q?KQ5x3CyqkBieoLguTD6WYBmg2Vg+zbM1KM5vM2FuZnMv0bROPx42yzJvs2Z6?=
 =?us-ascii?Q?Eq9+DzU1SrLc/s/CQZmZmhC3+XTyX4ehZ6pe2zd5ytrIGNnIXGtThuwA3zIf?=
 =?us-ascii?Q?PaYOL2XS6HLVGv1gaFITtHxpmqvkjGKqTcsuTe6GdimSIYfaIqm89pFcW9VT?=
 =?us-ascii?Q?mgHcr3SNnSgTSfs0hCTpeo0QnVotF061bPA7lp4TyuDrKlsI1Z5Q4JcQQRYO?=
 =?us-ascii?Q?nAn/+zfpCR5ySwySkabcPyc9LRVK02SMxNv0OUpLKexKwb6LEcqN9IDg9Wo6?=
 =?us-ascii?Q?vHxuYaUu/z5Wccp3AVpXvCBs0JzA2fD04PGNRXJqx7xF8HYTct1ZCOMvSw6h?=
 =?us-ascii?Q?oRm6wnw7uW4sZY2Bq90r5tUl+HjFqxvDQVJyH1RxiO1VL7SQuyLdx9uaSNcF?=
 =?us-ascii?Q?Eps5CFRDcSpwX2K/70CqncIWK0+NPA75L64RMEAzD3Ha1WsD7vd++nLteCZw?=
 =?us-ascii?Q?QxnGFxq8ZNIs0MtdxbWqtsq6RooU+SKkP+JlN+44x1R9q3jv8ZKq7cVt08Jy?=
 =?us-ascii?Q?8KhBO6B4RuHgzht1AK4/jRSB4sri4wQ/HpNfQMK+NWKGfD9bB0jVo/gFVJ2E?=
 =?us-ascii?Q?r3ZuVsuA0/lX6AUO2t7Q3vfVzE+x55CklBfwhMTLubH8biPTsR1EebnH+xpe?=
 =?us-ascii?Q?ocg3MWh8zinZ4ktkxa4FSpOVN2LMnMFfkV/8doRkpgKxyHPaafPzZXAdRVW9?=
 =?us-ascii?Q?g10nuwQc2Lh0GXI8pVzR1ADB0ino4HM592RO4hxhd+AZrgZEbQt2LU8BcF8R?=
 =?us-ascii?Q?nlmIkA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abfd5851-bbf1-448b-1171-08d9fd4e2eb4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 19:44:08.3402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8QtpAhziEnMHGF9hlOsVAvXLG2Z2jIfZLQ3/ToTWriM4o4fA4ZaZE/VaNsP5iVeCOA9dwo+g4f25MFl+YuOV070uq84ox/+EMoZDVKFgtv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4736
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::701
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::701;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 include/block/block-copy.h |  1 +
 block/block-copy.c         | 21 +++++++++++++--------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index b80ad02299..68bbd344b2 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -35,6 +35,7 @@ void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm);
 
 void block_copy_state_free(BlockCopyState *s);
 
+void block_copy_reset(BlockCopyState *s, int64_t offset, int64_t bytes);
 int64_t block_copy_reset_unallocated(BlockCopyState *s,
                                      int64_t offset, int64_t *count);
 
diff --git a/block/block-copy.c b/block/block-copy.c
index 8aa6ee6a5c..0834e29b6e 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -692,6 +692,18 @@ static int block_copy_is_cluster_allocated(BlockCopyState *s, int64_t offset,
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
@@ -712,14 +724,7 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
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


