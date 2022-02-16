Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEAE4B920E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 21:03:16 +0100 (CET)
Received: from localhost ([::1]:34976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKQWB-00060t-CP
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 15:03:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQGa-0003w9-Me; Wed, 16 Feb 2022 14:47:08 -0500
Received: from [2a01:111:f400:fe08::723] (port=55682
 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQGT-0006EC-MB; Wed, 16 Feb 2022 14:47:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CoMPLG0t6CSoSeTMANEOx56gedT9Bp72CN8zk2hD7h/RkN3HV3hVsJj1jpfDF8R2WNAepXJiuZ1rUb9E6RZena8xv6J4l9gpWdOs5rrWgeDOH0dmzSrvpflQgFgC0F7SKXaW84hZCAC/rFgTk53YY1cebWiHldJ0WYtSFDiw8wBddNldy5lQmO4a70222VS3qoJtoumzbFptNC6ddUELhy96tccPGnwrTLF7RZEEmuW+Uf2qdkew9+J5xvv3xHfb6qKQ1zx6KeeMVbOKTfMrLQs5pX1DopDDi0Fr0C9b6BFgSkiiU0iYd03qfmcCP4Vx/uH3ocgyieFDkyZUBfqkNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=giIsqwMQ/SbM8wV0PiBL06+2PzS3/KTOorsF/WkowaA=;
 b=eX9FHn/+/I5FepCpyyU1hWPF6S31zxX0sU8nKzOol+HyWe3gXBOpSuYTt75hD6+FSs7SNUjbLJd6P5xwSeULi5CTT/r1OYTkbMH5dvOwnmfGJeix2/+mBXG1blgXYqxb9c4Gv0Yy1nWEejdz8Waa7RrLXJNd4Q4fg/87z0XMvZ+Dm+qBpwgwmHWg5S2yanDu2OB4DU7Mn7d0UJEgByzqhoVOuB47Wnor3s5haGxsIe5xHiZMJ/2WE24LM6BBAFitUWma8KyIrkWri74USE49Jyk258dKD/iGQGe7BDrvuQhg8iEGTUde3JoWDgAnYeOnj2lr6UrfmMbcv9k7IF4JWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=giIsqwMQ/SbM8wV0PiBL06+2PzS3/KTOorsF/WkowaA=;
 b=hzxnbDlYNZVp4LHaaE99YEEqz125NIEeYrC6YMa8zHyGMDcvGVLajYW/D0/Whw3n6/4C6NF9MaGqZUfsWiXCPWDAbN3Hf4KMhPLXKyhYz32P6WnbTkoeo4uJpegDM46KSUkc22qkZwR5lrQ5eB3zrXHf1G4woxaCYat8NY5dr4M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR08MB2851.eurprd08.prod.outlook.com (2603:10a6:205:d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Wed, 16 Feb
 2022 19:46:39 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 19:46:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, nikita.lapshin@virtuozzo.com
Subject: [PATCH v4 10/18] block/io: introduce block driver snapshot-access API
Date: Wed, 16 Feb 2022 20:46:09 +0100
Message-Id: <20220216194617.126484-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220216194617.126484-1-vsementsov@virtuozzo.com>
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8PR05CA0005.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::10) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a257745b-c7da-469e-6704-08d9f1850c74
X-MS-TrafficTypeDiagnostic: AM4PR08MB2851:EE_
X-Microsoft-Antispam-PRVS: <AM4PR08MB2851D586F52D214364C25A1CC1359@AM4PR08MB2851.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:359;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8dnsSOdILBc7DVnbJLYBzg4Vc27yczPKiPEaygAUWnKYWiFHtM896r3t68gUOxJzKq7+kqsqCp7nfmcc0aoMmgVmEp4gxWxpsr2FPTmtPdiNsajVozk1J9DiJLRDv5vejZUxGKwSFugGPIOO/OsMf/MKFRkBbxtq+s2oGi621I5XgGr+cbTWqDfU8NHWBjnOq0UtnhINEdvs6g8IkudU8LjTi8KjwNWXNoGvmfP7ZoUtzq893z9G4jl+yWwtW+cNZGAdVRvWNLXDzI59OSA7tR8a5EqKjKxW+GXwFmreDrteRKRzJM1ITwm14kRDj5sd5PEH/iYZOMThpk+L6CXYMnPh7FKv0AZ2zs9LJ/UxiqROSJQNy5AnkX2J6/XXknIwmwzHy9HhXGo9aKhlxT8VBVgzTCFBJyFJFIU79N+TVZeIrn82cd9ghUdZ8hHvbusLyprWtBu7xb9WSPdo2sq7M0RZgaxIptI3FF7+jwSCR9s5yzMJ+i6QFFIBsoVEYvQp72u86lu6gSaeqxkJ7wnDR1sDGLCMR1Bl8ncSx/K66wcQKChT9Owniqy5bv3eXggnBhKmswVWtG4i+ub1qMMz58x2v54SMOLgCrJV6mvQmaj6w6etDijbU4fW4X7Y/5mY+oYnUB0MnUxXD3lxEBJCqFqXxd2guADUPYxNQDjJ7oplB/vqb0vT51gmvXcCrKDdLLTkjVo5BwGtJ5Jvxgh6eQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52116002)(7416002)(6486002)(1076003)(36756003)(2906002)(86362001)(83380400001)(508600001)(316002)(6916009)(5660300002)(66946007)(66476007)(2616005)(6512007)(66556008)(8676002)(107886003)(4326008)(26005)(6506007)(8936002)(38350700002)(186003)(6666004)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b2DKTx7TYkS+lxuADhEhLiYstzd+g4RqGZFgQ0kWlCJDYBAIxmpE7zAJjt1Z?=
 =?us-ascii?Q?jGBssk3Z1wDv0vW7U7aLDUIwwvQJC0IGQFU0VuArZJYPY0tGQ2exolykDUch?=
 =?us-ascii?Q?CKSZacccgnw9w6pLyqS3kKABsjYKcb3cZxTR0ttXufPbAI2NELkPWgu+sGyW?=
 =?us-ascii?Q?b0Q6wB1o6EtQNkQ6oQGEXKEV/2me7TFqLv1Xv09dfK2LP8W4pOxqbDXF/iz+?=
 =?us-ascii?Q?zh/6Oxj9i21wgLRMIAePBJi7hp3gON8VK1rw1nGwJmY/IBuIyg+fwi75p8oA?=
 =?us-ascii?Q?WH0JDOAdjzHtRkVqcA1na68ji1GvEmJJ8vImS9zgIt9amxB/FEdw5X/qmbNz?=
 =?us-ascii?Q?uma3E5cQR70J/0KimcFIOV/fwpv2Ip/Pw6ZfWJjYHAV0V+D8ObfpBhEaKRI/?=
 =?us-ascii?Q?nTjhoD7HyucVR3n5TbeXBnwn5s3YObPJw3AsZNpXsPzKjgOoBXfVcIwiUD82?=
 =?us-ascii?Q?1dnp91SquBwBJuq2+ZwGjYjGXxddRZq/15vHgWXxGKv0hcgsGchUboV+1juG?=
 =?us-ascii?Q?L74cIhYfQGj3XsgwBHfXkTk3dTbNW4lPUSYUM04vzFCS1+h06XmCElLsKCSj?=
 =?us-ascii?Q?R5K0fu9U0LqVP+mVRUq8n3/W7KUUtUjZCAnp9aCWfV+pnC8Wd5KwIkxcI+uO?=
 =?us-ascii?Q?S+9/DtEKsKcC1NKiaoSu6Z34NXkL9ttmqLv7qqhrZOnxhGltHzFWGhQc/wTV?=
 =?us-ascii?Q?tVbAWqrgVR5lDnwLlp/iEylvm5nENCS9fwYcEIfYqnuD5Dn0Ru04a+Grs1R6?=
 =?us-ascii?Q?6iFqZhudNG0m3ejnkEApM2r1/brg9sKW0VEaU/bssddKTG4H6ykXaTRpINRB?=
 =?us-ascii?Q?zxuGb2OcFdUQRQrLzeKy6M2znU1rx0bpnl5FU2uwN0jmpfZVjrZUvoleh4mo?=
 =?us-ascii?Q?pX5kfRTB99pP7dJl51npgy2slLbfjRgAj+YBi2sqtj4rzyDJTHQNlWd80C3T?=
 =?us-ascii?Q?52ObPV+OYZAOpWjMyAb0OcVes8aKSvqTe9cHnn8hBH0DRbf4vee0A8zqX3d4?=
 =?us-ascii?Q?Pqh+NXH27XFjXfNXGRHG4k5zQadiO0L2jM/90KQXyjtM0w8fbSyEfQ8Wb3IG?=
 =?us-ascii?Q?v927WVPUCryx1yzfvon/op/0jLU8ESCB3Ecgcneh/8nsb0OsdJMIa3crnsAX?=
 =?us-ascii?Q?LH0FuqeTVYZq0W9bhNTu6F5UTQHLhdMEvfBMIF0G7y49xSzfusEMxIf1KOYA?=
 =?us-ascii?Q?kZN8oxGjiulRN+71XdDnC4OLPyp2J53WpxXOYMxwJB3CvK/sR2L1LKJLSWYV?=
 =?us-ascii?Q?Au+vt36niDbYjncxN5C+zNVttUEXR+0WTxwVGrQ4SbQkkenFBJza4jf07xgB?=
 =?us-ascii?Q?iubckuQt580WXm2jsSiHlj+P+ZviHyiLgEeIiFSPmdVRfhPTsLtjjBc1Ws8Q?=
 =?us-ascii?Q?vttOwK7JQw+bNZLnb7mi99KeGaRfFlkdM+wo61aVDeF/H5emoeoNDGUJPo0e?=
 =?us-ascii?Q?KAliBp4U7QV8tszqUZlTa1zOdG+xDPFUxRm+Oaykxslj690YwMPviP46AcDZ?=
 =?us-ascii?Q?ldUDgn+oLSJyHnxFH7g25x9yRyUY8tASQArgjv/GXJmWIwhl3VYg24xvPWjj?=
 =?us-ascii?Q?XAZZO0JjsZi4NfLVXwHsvUKS6KJw1EVwbjJkUY3gAbAXB1JTIdWcW5RVQDHp?=
 =?us-ascii?Q?BNJE5yyle3QcRtiYumo/f+EUhnlwbKmLgRZVAyptI1rgfGe1h445II3yUTQB?=
 =?us-ascii?Q?cCMPBg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a257745b-c7da-469e-6704-08d9f1850c74
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 19:46:39.4503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u5zzYKGRmNkI46/xOk7FxdJZQ0JX0uZvPL5d+hmTe7xQsxcJD26hQHbcVzNrIy06GCl2xTJ7Pdu1VBCRbTtOtp/MSxtnJSvsQiH30trQJfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2851
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe08::723
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe08::723;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Add new block driver handlers and corresponding generic wrappers.
It will be used to allow copy-before-write filter to provide
reach fleecing interface in further commit.

In future this approach may be used to allow reading qcow2 interanal
snaphots, for example to export them through NBD.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h | 27 +++++++++++++++
 block/io.c                | 69 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 27008cfb22..c43315ae6e 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -376,6 +376,24 @@ struct BlockDriver {
      */
     void (*bdrv_cancel_in_flight)(BlockDriverState *bs);
 
+    /*
+     * Snapshot-access API.
+     *
+     * Block-driver may provide snapshot-access API: special functions to access
+     * some internal "snapshot". The functions are similar with normal
+     * read/block_status/discard handler, but don't have any specific handling
+     * in generic block-layer: no serializing, no alignment, no tracked
+     * requests. So, block-driver that realizes these APIs is fully responsible
+     * for synchronization between snapshot-access API and normal IO requests.
+     */
+    int coroutine_fn (*bdrv_co_preadv_snapshot)(BlockDriverState *bs,
+        int64_t offset, int64_t bytes, QEMUIOVector *qiov, size_t qiov_offset);
+    int coroutine_fn (*bdrv_co_snapshot_block_status)(BlockDriverState *bs,
+        bool want_zero, int64_t offset, int64_t bytes, int64_t *pnum,
+        int64_t *map, BlockDriverState **file);
+    int coroutine_fn (*bdrv_co_pdiscard_snapshot)(BlockDriverState *bs,
+        int64_t offset, int64_t bytes);
+
     /*
      * Invalidate any cached meta-data.
      */
@@ -1078,6 +1096,15 @@ extern BlockDriver bdrv_file;
 extern BlockDriver bdrv_raw;
 extern BlockDriver bdrv_qcow2;
 
+int coroutine_fn bdrv_co_preadv_snapshot(BdrvChild *child,
+    int64_t offset, int64_t bytes, QEMUIOVector *qiov, size_t qiov_offset);
+int coroutine_fn bdrv_co_snapshot_block_status(BlockDriverState *bs,
+    bool want_zero, int64_t offset, int64_t bytes, int64_t *pnum,
+    int64_t *map, BlockDriverState **file);
+int coroutine_fn bdrv_co_pdiscard_snapshot(BlockDriverState *bs,
+    int64_t offset, int64_t bytes);
+
+
 int coroutine_fn bdrv_co_preadv(BdrvChild *child,
     int64_t offset, int64_t bytes, QEMUIOVector *qiov,
     BdrvRequestFlags flags);
diff --git a/block/io.c b/block/io.c
index 4e4cb556c5..0bcf09a491 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3587,3 +3587,72 @@ void bdrv_cancel_in_flight(BlockDriverState *bs)
         bs->drv->bdrv_cancel_in_flight(bs);
     }
 }
+
+int coroutine_fn
+bdrv_co_preadv_snapshot(BdrvChild *child, int64_t offset, int64_t bytes,
+                        QEMUIOVector *qiov, size_t qiov_offset)
+{
+    BlockDriverState *bs = child->bs;
+    BlockDriver *drv = bs->drv;
+    int ret;
+
+    if (!drv) {
+        return -ENOMEDIUM;
+    }
+
+    if (!drv->bdrv_co_preadv_snapshot) {
+        return -ENOTSUP;
+    }
+
+    bdrv_inc_in_flight(bs);
+    ret = drv->bdrv_co_preadv_snapshot(bs, offset, bytes, qiov, qiov_offset);
+    bdrv_dec_in_flight(bs);
+
+    return ret;
+}
+
+int coroutine_fn
+bdrv_co_snapshot_block_status(BlockDriverState *bs,
+                              bool want_zero, int64_t offset, int64_t bytes,
+                              int64_t *pnum, int64_t *map,
+                              BlockDriverState **file)
+{
+    BlockDriver *drv = bs->drv;
+    int ret;
+
+    if (!drv) {
+        return -ENOMEDIUM;
+    }
+
+    if (!drv->bdrv_co_snapshot_block_status) {
+        return -ENOTSUP;
+    }
+
+    bdrv_inc_in_flight(bs);
+    ret = drv->bdrv_co_snapshot_block_status(bs, want_zero, offset, bytes,
+                                             pnum, map, file);
+    bdrv_dec_in_flight(bs);
+
+    return ret;
+}
+
+int coroutine_fn
+bdrv_co_pdiscard_snapshot(BlockDriverState *bs, int64_t offset, int64_t bytes)
+{
+    BlockDriver *drv = bs->drv;
+    int ret;
+
+    if (!drv) {
+        return -ENOMEDIUM;
+    }
+
+    if (!drv->bdrv_co_pdiscard_snapshot) {
+        return -ENOTSUP;
+    }
+
+    bdrv_inc_in_flight(bs);
+    ret = drv->bdrv_co_pdiscard_snapshot(bs, offset, bytes);
+    bdrv_dec_in_flight(bs);
+
+    return ret;
+}
-- 
2.31.1


