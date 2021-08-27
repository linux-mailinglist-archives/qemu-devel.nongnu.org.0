Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD363F9EC0
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:27:06 +0200 (CEST)
Received: from localhost ([::1]:35898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJgZ5-0003wT-Az
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgRI-0001CY-UY; Fri, 27 Aug 2021 14:18:53 -0400
Received: from mail-eopbgr20117.outbound.protection.outlook.com
 ([40.107.2.117]:18413 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgRG-0006di-Iq; Fri, 27 Aug 2021 14:18:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MaFjtlBdLkXH8fYeIFJbxRkEM3MYbRAUNr7TMnRrzitg3D1NkHKPi/vwvYe8OEUVeXeAPB8wSmLAbhggKbGJXAAtzUbmqoBE6vc6JWavEkhPfi0ax6J6ow1tpZJtg4U/NVLN0UMBO/9uRK9gnFB6k8PN/DeHUtkimrNzBqE4ZGSk6UT5kf5jDFpyibCV1ub3MNgpcjKuKn2vvZqFDbgSI8y+ri/DbU/cg6B7p0OK3t6GTQqZS+b0U+YUWt0ZlSlmpbzcdWE8DkKgsmuCtow2K2IR+eCiDP4AXC7QXO6cq6qhmqa+Gqj5eAIdCfZy3lrQ6RfciC0wyBi9+x22CYsDKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ThS0OHbhrTUaHtV/zOstkWXV/QRWbMzz6HXVPF2VBM=;
 b=ATgW/5GpqvgAWMySiscrGXLjPZ+XvBjgGtUjPHEpWo+viT3odpqRXcHtS4+cVBvjPhL/1NwTVDBK3fSWx3OHAkX8JmxHdAigqimDsi3p407OmPzqLwcPk7Ivrbl+bPEKEFJ0FCYMIwXgCzrdp3R3H5pykCWeAZFU4h803kUEMqOB+I9QF5UCHJsN9RZVWxX/wF0SkSBOPAU6hADg9JMgwRvg869YskUWhBWM8eDlAPYngHUnWQJvuTVTuznREZoHV+tt5/fUDVzolul3mdjeGZ+XMal4FJm/NVUY3VmHB/JthtityNuagv/MDQNjn93cX4uK1PMaE8ByTpv3Fj0wjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ThS0OHbhrTUaHtV/zOstkWXV/QRWbMzz6HXVPF2VBM=;
 b=naAMQHP2FfvYIdqCK5NujecR4HRefc77cCRwBPXArmhg2VnkWDhwwelfc9puQz4H92a2B/QcHmxcWMw+egRDaMRC+nMHX2Fw+SddoInB9oL7N/xJHBmAjaBF/JZcRZicPysrwBbaSiPxxpUF0p+eOePGVyKaiofW8CKay3r+XrU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3765.eurprd08.prod.outlook.com (2603:10a6:20b:8f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21; Fri, 27 Aug
 2021 18:18:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%7]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 18:18:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v2 12/19] block/block-copy: add write-unchanged mode
Date: Fri, 27 Aug 2021 21:18:01 +0300
Message-Id: <20210827181808.311670-13-vsementsov@virtuozzo.com>
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
 15.20.4457.18 via Frontend Transport; Fri, 27 Aug 2021 18:18:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c06e2ca3-ddc1-4e22-f782-08d9698717bf
X-MS-TrafficTypeDiagnostic: AM6PR08MB3765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB376579AB20E64972A8E55D03C1C89@AM6PR08MB3765.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:109;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NZscTfFPLFZybLQKe9+413UySkd1E7DrbwETovXKYSRyLsVr4PnqOTaDG+E/zObaCFaXz8SIXDU8Fxm86UmjqcTxZFXVpK4DWdzOhr4BeK7sKC6lIOzbmZfmQC8dVGhU/RtKFtuBGuS2mso/X61m2N81y8w5isIj/qsKosL73N31lbebFT0bLwh0N5I3St48oQ883PaDjiUjXflZUlUeO3O1vhbZhKWW+HasSrVWzw6uCrhqxiELtuymBfTGo0sm6QSsuoeTz1OAJshGOa6KtcDyPs8AVCtioq2JSi3RaBSN6WwGutesVOy9Fdc4dgKoRaMyrpvwnohdJKKyqk7V4eCGC4l5MtKsoSfNHLN4v81JY4Y9tT3ArDWHlmKkxpr4IQCAxswamLNQExrYxhBNAP2gzN+CBWKXCJoIB11HKFIvCcR2JVXgCeWMNzfKbx7tyNuXvQK6e+Jsf6pVqbzrfozKuOrX5uLNkRr4zrH62gRebt9BUyyIP4CgAhe5kgfIR2T/N9C5+xjImJ22wbB3g8Z6PXEhD1iPzLxYmi1ygZ2b4L5cPcCvwytCW5N1Bq43Z4GfjpCqD/PxbRMjEK65alW9YyPIZBrETatDaFrRNgJI79aqHr9NhjEmO27asI3Wc0wsNSgBiYb+h7hTssC1bTlM7FcwgccRRZNpoEKF6b3pOkousnzlzbAF0Izbghe0VrNEzzCQezH5P92zQAUhCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(366004)(136003)(346002)(396003)(52116002)(6486002)(1076003)(26005)(66946007)(66476007)(8936002)(6506007)(2616005)(38350700002)(38100700002)(956004)(5660300002)(86362001)(8676002)(186003)(6666004)(83380400001)(66556008)(6916009)(4326008)(6512007)(36756003)(2906002)(478600001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1MtoPsDC1GkbQ3CBRPMnKTwW3wcjSajvPa+A394eCrG0Mh9LurspPPw8/6LO?=
 =?us-ascii?Q?tQWDB/+rQUkLPIvMb39kAyLyi+Ig25K2gpZFn2VPk/xH/dIK7dhwd5+jzy3m?=
 =?us-ascii?Q?y7YHtLXQfj3Z2DIW6pPqzXCOLXtTNtw5e6Z3T8ajNBYjc8ruE2p/L/Vyt/OL?=
 =?us-ascii?Q?1O/aU44aSa0NX30m6/4zy4bV1/K7UF0CdsetrfyTdfDUtsI9BD51KwXem+eK?=
 =?us-ascii?Q?REZx125I7blPtBoL7s5R7ylQmuDNpCMaR2e0puqua6XUhoZmOEHD3RFmoUZQ?=
 =?us-ascii?Q?L/ifCUdR1DkGqCaeUw7yoK2iLbXEHCNDSCsSXEDXZ7cXSViVcGtWRQFbvEBB?=
 =?us-ascii?Q?lKkJfJZarTTXtiOGGbMbLFhFVmKryMSVKVnVaE60w2Ygdv0IeVTPs6v/nNcA?=
 =?us-ascii?Q?zA58JoeHOq2bMXsbvqwyPc/R41xkEEODXPmAe6E+8mLd1h3nKHhUoZVYUBrW?=
 =?us-ascii?Q?GU4Y7pahNPvVFeX380MFQoz1KCtexV4/tFNcfJdVyB8GrfTIDIqXzG/dJ+dZ?=
 =?us-ascii?Q?y5/wU6OGKc2vb18QP1hBI+h0l4mZ+YMmoTVXOfDxljs00LDrYs1ks0yPqHEp?=
 =?us-ascii?Q?7R53kr68/1DsglXceqVOvX+TMGzWrqUQuIXI57jBDqt52yRSA3R2gOvJ6gNB?=
 =?us-ascii?Q?Kb4mPLuPOqn8/sxucG9dwZLFyVzfkQpg6K/NQDmLuso6cd/+L2AZE9JIsEtu?=
 =?us-ascii?Q?daTXHtolyW7Y3E4wKCElecMKSQpgjo+0+5z95TTg8vdW4JwePkZBsHwAvbjK?=
 =?us-ascii?Q?Vnm7u6kWueDXL/bzT34tX/bp5caJ7TuOAfaI+4XL+sJkWZRtXfH5ojYqHBYL?=
 =?us-ascii?Q?UofAtm9wSRUrVHwTvcWtgDgFQqbfxZAj9XIHGsgKb+KUzno2EZ5V34VlOXZm?=
 =?us-ascii?Q?iIsrusRWj6DzYwL1Jnl3jfGM7znLthwd1iYLMDUaL5jDkOOpP0YViXd/3gBf?=
 =?us-ascii?Q?7kb6sXU2cRKmvyzN/NudiCszTQ7WEf1POLaJtXTRl+hpiQpsQxrK20EKGt+M?=
 =?us-ascii?Q?21G5AUnlMaHHz6s6rvY3zJpR0h9Z9sg6c6zUEZeU6vZNiGGbE7MUBqdN7FsC?=
 =?us-ascii?Q?BgixCd3fAL5oThUBHELMj8Cq7pavZgri80SwQEao7T2CH5OEdTcJsEs9VJ83?=
 =?us-ascii?Q?52AtKeXEQ0NUCDSEFPmBzx1Wy0wCnVUJWFDQKm5kV5s/bcUddZ6dI/nWJFTR?=
 =?us-ascii?Q?+W115UB2ywV8ZWpJtFSl1OVZ8jA8WUtq0PQ3P6dNaIet8TLqKftPFEGsSpBp?=
 =?us-ascii?Q?th/tECQi9+qQcz42XEpANAk2McNs5UlMEBQj9S7EzGKJ5y342bJDKUPP0Ahs?=
 =?us-ascii?Q?mVvHgNOAIfONemlX1NgRg6Nr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c06e2ca3-ddc1-4e22-f782-08d9698717bf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 18:18:39.0838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nm1DNtwFdJ6d/34I3U8Nc9/9nh63gS9BXCJvYf3z+X6UcsiFTHHnBN+x0YvMjKj+vxjwTpjlgLOrW7nK7/aPD2Jegv2INNXanuwjDmVoYD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3765
Received-SPF: pass client-ip=40.107.2.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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

We are going to implement push backup with fleecing scheme. This means
that backup job will be a fleecing user and therefore will not need
separate copy-before-write filter. Instead it will consider source as
constant unchanged drive. Of course backup will want to unshare writes
on source for this case. But we want to do copy-before-write
operations. Still these operations may be considered as
write-unchanged. Add corresponding option to block-copy now, to use in
the following commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block-copy.h | 3 ++-
 block/block-copy.c         | 9 ++++++---
 block/copy-before-write.c  | 2 +-
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index a11e1620f6..a66f81d314 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -25,7 +25,8 @@ typedef struct BlockCopyState BlockCopyState;
 typedef struct BlockCopyCallState BlockCopyCallState;
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
-                                     BdrvDirtyBitmap *bitmap, Error **errp);
+                                     BdrvDirtyBitmap *bitmap,
+                                     bool write_unchanged, Error **errp);
 
 /* Function should be called prior any actual copy request */
 void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
diff --git a/block/block-copy.c b/block/block-copy.c
index 46e6a6736d..6d5d517ac6 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -279,7 +279,8 @@ void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
                               bool compress)
 {
     /* Keep BDRV_REQ_SERIALISING set (or not set) in block_copy_state_new() */
-    s->write_flags = (s->write_flags & BDRV_REQ_SERIALISING) |
+    s->write_flags = (s->write_flags &
+                      (BDRV_REQ_SERIALISING | BDRV_REQ_WRITE_UNCHANGED)) |
         (compress ? BDRV_REQ_WRITE_COMPRESSED : 0);
 
     if (s->max_transfer < s->cluster_size) {
@@ -340,7 +341,8 @@ static int64_t block_copy_calculate_cluster_size(BlockDriverState *target,
 }
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
-                                     BdrvDirtyBitmap *bitmap, Error **errp)
+                                     BdrvDirtyBitmap *bitmap,
+                                     bool write_unchanged, Error **errp)
 {
     ERRP_GUARD();
     BlockCopyState *s;
@@ -393,7 +395,8 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         .copy_bitmap = copy_bitmap,
         .cluster_size = cluster_size,
         .len = bdrv_dirty_bitmap_size(copy_bitmap),
-        .write_flags = (is_fleecing ? BDRV_REQ_SERIALISING : 0),
+        .write_flags = (is_fleecing ? BDRV_REQ_SERIALISING : 0) |
+            (write_unchanged ? BDRV_REQ_WRITE_UNCHANGED : 0),
         .mem = shres_create(BLOCK_COPY_MAX_MEM),
         .max_transfer = QEMU_ALIGN_DOWN(
                                     block_copy_max_transfer(source, target),
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 686a085861..7e4e4bf7d4 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -212,7 +212,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              bs->file->bs->supported_zero_flags);
 
-    s->bcs = block_copy_state_new(bs->file, s->target, bitmap, errp);
+    s->bcs = block_copy_state_new(bs->file, s->target, bitmap, false, errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
-- 
2.29.2


