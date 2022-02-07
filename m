Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0886D4AC662
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 17:47:47 +0100 (CET)
Received: from localhost ([::1]:53444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH7B4-0008Ao-4B
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 11:47:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nH71Z-0001vx-9Q; Mon, 07 Feb 2022 11:38:00 -0500
Received: from [2a01:111:f400:7e1b::716] (port=32353
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nH71W-0005Iz-EX; Mon, 07 Feb 2022 11:37:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RXZB2o1g7LOm1EJVZq9Sv/jz2WiztmgTrvX0+jbnR3knSEqFouNwFrjVVrxyHMmyfCUX40CCeNrG6YzX1noluQptFiYm7wwaC0S5NVIrwJp3D+d1sKoiuUw31JyFOf0vGpcW23H8h2IAs9i8TigYRE5ipFfJS7Ri746kCx77xmnVwVkYEghoMIvdV8/rZFmWJQvq8GDcHL2H/bpihlXgEP57vLf7U08o9KABoYDUDqkoiAbc8MS6WODsQjxkIwDBxYjucyODOyV7tMhO08PfEr4ckSjFaZKOLfwDhnIe5fgL/Md5F6T9Ij7WqlcFWYQlNlqdEgrQg/F5lCTRYHGPQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7lnFpgIVdxs1RZImj/ndhVyBDbT/WqjtFKU9MRx1YOA=;
 b=C3CZHvbyx5BMGzm8KQ+HuxHf1vX6T6XZS893+XF2W30VYUf1oqaDyyiumTs8GX3SfzwDwKAB5UYftp5boL0yOhdNWl97e/9EcY75fSOoYUcNF8ds+8odqJV3IIZBEuQPZ8vQT5pmTA2Pd4JWkb2S3ET/KG2FaSNu3FTXzphF/XDs2GA4/8PaeUuaImaTqqsNzQ6fPofsTYErGAWwxT8B0hn8+OAYuKOlfc0ekZ2v1YBonE8xpWr2NshHGta82s1DyQdjyloPI9+B1eai4bOmR97lSp47kp09QP2eL4ftkQnBPyrDJliEUMrQqO0hflRciw20ebN3D7EqSlUxUNlVOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lnFpgIVdxs1RZImj/ndhVyBDbT/WqjtFKU9MRx1YOA=;
 b=dsT6rtRRFMb4Jk+wURCy9UtfTsbtdFN6rcEmgiQf50P8ctTrl3UHw5ZDS3VLwQzKuMLHt9w46QHkr0g/B2gDhmzS7foJEBI081/ayl8yLvOsfKPjHcZL3LzFjsfSahU4IQfcKisStDfric7G+RyMmcN2K2uaKns9ienEGgQ2J9s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0802MB2288.eurprd08.prod.outlook.com (2603:10a6:800:a6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Mon, 7 Feb
 2022 16:37:41 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 16:37:41 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, ktkhai@virtuozzo.com, igor@virtuozzo.com
Subject: [PATCH 06/14] block: bdrv_delete(): drop unnecessary zeroing
Date: Mon,  7 Feb 2022 17:37:20 +0100
Message-Id: <20220207163728.30362-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220207163728.30362-1-vsementsov@virtuozzo.com>
References: <20220207163728.30362-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0126.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::31) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2432d3f-dc8c-465c-50dc-08d9ea582871
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2288:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB22883FCD434486BFF7AD658BC12C9@VI1PR0802MB2288.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:130;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MiE1jCEH3forBYdKmuT/SpUAYbvZGLhgMJl7a+yPupNthj5dWwqcQAdb1NEW87948azTClFmkBoLOVgGVNLv5+bmXLqLZAzQfzFW8Fd0BQG8NkMSTUSKXN6XC8C2BeYDLPVxwEw8NbXq2LuWltS6ZS0/nT6spq9Il/tFK25ykdczU+DDYAPoJr5cNzQKUshCphjcYSUGtns71l+qGbCL2jXzgiQ0yRYeA2O3sdDhiIoszPWI/XNfj4Rb21wDE7kEkIXW8SZ7QfjlDIj8upV4xmExltRUd1+eW76GfhtzQ7UQnQdMftBedspyRvhPFwnnY6t5NhmhDHmPbtQjfLTY4HhniO+R61v0uOLdueS36cKZogdn9Hx+jYWP3uCiYNfm0TM/ty/Pg3zWQQvu9mmHxv8+GE9ZShua9Y/JFy3eMQqH/YpcsDpfyR0f6/O1aaCkdD5o/PCTozne0C5aXYqfawJIbYDEXCrLQgM8eEzI2J9KKUGfQrdLPx+ZZgUclUH4xNHiFX6Ik1SsitdhMjM7bL6b9gCWshfNPUAqt1ExbIaaYhjiPBV6u9Aud/5LCWVbwr9POi9ehIim3BXec+oBIPiLuBLAPscZd3gmdI2iGd94fNobFeFqGAzDmUaAwsm6q5wFfdHVJ/YW5DyKF8D1tqVIJtjQwfqCAjfToc8W9CGnjCDBTzR0qt6O3EbHXH822xWPfYpcrJUFCY6Jof8Fhw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(66946007)(66556008)(8936002)(8676002)(38100700002)(83380400001)(66476007)(5660300002)(6916009)(4326008)(2906002)(508600001)(26005)(1076003)(186003)(86362001)(6486002)(38350700002)(2616005)(107886003)(6512007)(6506007)(6666004)(316002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wQln8QkBIfUPx5Gk043bhlQnOZ3S0OZBd3nYyojlo5A/CQ/R6q7dqCVwRMa5?=
 =?us-ascii?Q?sJonpvUbrC5QdhvjhBIt+fq9OpvhtB8+TC4skmZ+6baEd5FvGIYMAFUGyCjZ?=
 =?us-ascii?Q?mBNz6rCZEA56knePX1SuQed3Wr31T8ozPsVgZkKzRzn/Q+OGi128jJ0G5HMb?=
 =?us-ascii?Q?wd8i2bMSOA375YjqxK77sSSVFuxiSIyLtTBQgvIt8PvRGVxKv7rzKLHtlaHA?=
 =?us-ascii?Q?/+ZYOBoalyr74yxii2zs9qvZczYXgbwARq7U2FA4uIl57lY5ps/OO/ha30NL?=
 =?us-ascii?Q?NoJRyUBRfqD5Ye412TVnZyzvNvwpYtRTxuAmF2bBwGGJMuqxWZB/EVIXOQyu?=
 =?us-ascii?Q?yt2Xahhsk0NCvbu2ZhQ4W/LbP1rcCnN6Yd7JZphBto9ZhUYtcivIwJuRJ9NS?=
 =?us-ascii?Q?iexnMgpL5RJtEZ9pKzQp2UKxo3iTlRo7QpDx2gTo3VbCrSFTvvD5jGmOr2dI?=
 =?us-ascii?Q?01x/j4br7uv4N07GOGtbbq+iJi0NR5vyrppn7IF4Sd9RQ/Q4snzn0FDSbZd9?=
 =?us-ascii?Q?rZY91p5apTBb0Hz8VsVeXFGgjj2Gd9HB5lnI5z3ZbVT3ZRU7MB40H+WNQ13k?=
 =?us-ascii?Q?YaTb1qqEbOyiexTUOKlm7233dlUyd8TubgjnCwVqK1QgKx+BIcsW6VN7dpB4?=
 =?us-ascii?Q?akbzwHMdPDgErwJfdhOHnNBKIT4YQFm4vRUYDiZXyeDfSnOZNuCp1yr2ohUa?=
 =?us-ascii?Q?8alPzOw5HOJCQSQmMzGFMCm7vZ6WkaqhEU4OIJ183HBI2+d/1rEjbxLjzlv/?=
 =?us-ascii?Q?qhr34m3PXOwBKFsdnXIzlXXnWUVjbkHMScsymhAGG5pOkYCtEPvvQvqOfxeJ?=
 =?us-ascii?Q?CeDnGRGUsde+z1/CxlOiom1sKcphg+cALVIwOQbh1vucZTXfjzCbzWp921AA?=
 =?us-ascii?Q?BQSXV6Ui61iFSvqL26gKFZLZ6l+vRr44bkz/QRy+SPVJbnNSgv33gZlTYCvx?=
 =?us-ascii?Q?Wk9bWldCMzGnGL917IuiMwzK1z9RDR6CjWyms/BCdx1aDT0U5+l5yzMvpske?=
 =?us-ascii?Q?dEcSUszF6aycz6aBuHbVr470ozPJ+mNQBIvtb4mgOIDH1oqaJNF9QRs3IODp?=
 =?us-ascii?Q?REx++novSUtvRGLp9APBOXosVpUENk+Kf1PQhgD5cnakYJfW87v64V/BatjX?=
 =?us-ascii?Q?okGKuZ12Puj/1Ntc0C0gjXMqtwCXTQ+BDSMnmn3la9LKSVakcrUsOWvYGUC/?=
 =?us-ascii?Q?Tcqh0l/KNAkzHs9dGsqKDmAk1n5rcD3hUSacUx3isIgop4VPyZswc3ZV6I8T?=
 =?us-ascii?Q?FokecrzrpyNTEFbYiqXs8WoCxWJpkiotM98Y8uMS3VlBLX3WykWyVCXM+13K?=
 =?us-ascii?Q?eTDdkrFg4FbHZ7mKYFvZDqV2H+MtsPRn7mVpgKP105b8C0ucWUunvi7Fmu5d?=
 =?us-ascii?Q?xw5hCPV3iQyJsEi/5+YtpKvlGOdknMjgNCILoAkW/FbWjcBihZ9OImDivISi?=
 =?us-ascii?Q?QX8fBZUkEIjd0pP6nBcnJ80Oof2c3UBiD6oSGksZEeR3oF1iGXgLDyAdglL6?=
 =?us-ascii?Q?g0p2BxV7r1AQhzoA30TpAtrMvviYt7/uw0GNJxEhwmcfpD6C6Srcra8ta/8d?=
 =?us-ascii?Q?CGJZsVWWS+sGO4np1MXYbaQ22Mtgm7q0hXadFa5MV5mHeFIBZ7nc+IEbLd6T?=
 =?us-ascii?Q?ybGkDJuPFXDv1efUtkhjzZTNHKywtEXNpa1FXVoqzTfjOdy3UVKdq6PvtzcO?=
 =?us-ascii?Q?bPBSjA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2432d3f-dc8c-465c-50dc-08d9ea582871
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 16:37:40.7422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M7bskBH/JhSYg/xSG1mU6FoLP3nrCya4qS3ocmtHrUyeTrxOLYXPXcYVm3TLVaU8CplQxBo4kN2Fq8CdIZxqXJ9hYhy++DqOAq+/rQ4HxSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2288
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::716
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::716;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

No need to zero all these things before g_free(bs). Move memory freeing
to the end of the function to simplify further conversion to
transaction action.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 40 ++++++++++++++--------------------------
 1 file changed, 14 insertions(+), 26 deletions(-)

diff --git a/block.c b/block.c
index 71a5aec24c..231d1fc3ea 100644
--- a/block.c
+++ b/block.c
@@ -4815,32 +4815,6 @@ static void bdrv_delete(BlockDriverState *bs)
         bdrv_unref_child(bs, child);
     }
 
-    assert(!bs->backing);
-    assert(!bs->file);
-    g_free(bs->opaque);
-    bs->opaque = NULL;
-    qatomic_set(&bs->copy_on_read, 0);
-    bs->backing_file[0] = '\0';
-    bs->backing_format[0] = '\0';
-    bs->total_sectors = 0;
-    bs->encrypted = false;
-    bs->sg = false;
-    qobject_unref(bs->options);
-    qobject_unref(bs->explicit_options);
-    bs->options = NULL;
-    bs->explicit_options = NULL;
-    qobject_unref(bs->full_open_options);
-    bs->full_open_options = NULL;
-    g_free(bs->block_status_cache);
-    bs->block_status_cache = NULL;
-
-    bdrv_release_named_dirty_bitmaps(bs);
-    assert(QLIST_EMPTY(&bs->dirty_bitmaps));
-
-    QLIST_FOREACH_SAFE(ban, &bs->aio_notifiers, list, ban_next) {
-        g_free(ban);
-    }
-    QLIST_INIT(&bs->aio_notifiers);
     bdrv_drained_end(bs);
 
     /*
@@ -4852,6 +4826,20 @@ static void bdrv_delete(BlockDriverState *bs)
         bdrv_drain_all_end_quiesce(bs);
     }
 
+    /* Free memory */
+    g_free(bs->opaque);
+    qobject_unref(bs->options);
+    qobject_unref(bs->explicit_options);
+    qobject_unref(bs->full_open_options);
+    g_free(bs->block_status_cache);
+
+    bdrv_release_named_dirty_bitmaps(bs);
+    assert(QLIST_EMPTY(&bs->dirty_bitmaps));
+
+    QLIST_FOREACH_SAFE(ban, &bs->aio_notifiers, list, ban_next) {
+        g_free(ban);
+    }
+
     g_free(bs);
 }
 
-- 
2.31.1


