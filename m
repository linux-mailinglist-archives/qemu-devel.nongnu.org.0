Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE774C6B58
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 12:56:39 +0100 (CET)
Received: from localhost ([::1]:37678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOedp-0000F2-WA
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 06:56:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNo-0002MY-R6; Mon, 28 Feb 2022 06:40:04 -0500
Received: from [2a01:111:f400:fe02::714] (port=28447
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNn-0002NC-2J; Mon, 28 Feb 2022 06:40:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuQFtPVZaD8VJ6lRqguDKwHdRi54TfY1zmEjLZJeHMCmZf0FUJDcqvzV+sSEvQSPwE4ZL7JAb3gXM0P7Oj+3sThvYWCBtNGPji8uZCIeywPxFTsgM7WCy+gGcJ7vY5rMLhK/gWjpFc/tfzQeBajtyy9g6RSgaLgqZYLHUXzyeKIIfbZzkp9j8Ic/wVORkjyPBdNOwgdnNWqDvJClsj/5TP/4r99uVcNd5gomz1rKycR/F7YzXV1bwmTBwdzSWHtphhHVmGtDuZsU5T08Hq8e5P1cQo4kqGLsI3BQE1FXSxai9mRM9oQsGR5r/2+djB/mpPe6V1GLYjIgK30mRSnQDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wk0CPYEsGMCibsoooULP+lClkB+WEx4/8kGPfI0xzIg=;
 b=e+TC+t+sagvBRTf85F1AhBbKP+AHMnUJLkymOteT0sFLq+Fcx45K8sIjXecx0k8mWBWkaONyeZ15ZSPZT78xG5WNPGFj9SmgyhU4ZCMc0hFInfl5zfw6gIUtz+SsbxL6rGqj5+tql47S1ykP624FYpONPOOKHYCGV8cdUwvJzyWQz5iTkwXkE2rWxR/fBFzm9hODZkuK1YAeOSrhg68XZ3xUTDogXDihc2cpwxvTgJXh1uSC0VyxOi37yVQQopMUXaahYKcrUufbCwaQjy4mfP5tAM1XFjeUc65xXrrNGnUs8GcHaxpjs8udVulVSwKccBqdzXOWGLxjFOOBvOT9qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wk0CPYEsGMCibsoooULP+lClkB+WEx4/8kGPfI0xzIg=;
 b=skdhYkuIFzYps7d1XbCAu/sffkUIR9UyGOUqDYvValR2T7lOpIOcRiJlK+yEAk+C/jDe2xtXbe8NxdLZNeaajkefy7eqD6ltEke9GAJMXz86S6zsJEY+LCpS+7dAY/Z0kBwqO2Mc3ePrKrFjaavp+DuH2OBe4x5WI9KnbV6Tm/s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0802MB2272.eurprd08.prod.outlook.com (2603:10a6:800:9d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Mon, 28 Feb
 2022 11:39:53 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 11:39:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v5 10/16] block/io: introduce block driver snapshot-access API
Date: Mon, 28 Feb 2022 12:39:21 +0100
Message-Id: <20220228113927.1852146-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
References: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR09CA0135.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9ff71ac-0689-4585-17b5-08d9faaf096f
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2272:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2272B3DD7AEC5771CAD943E8C1019@VI1PR0802MB2272.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hK/d7dNIYeIZVkv29/DoPGb8NpF+QCGt420xLiM/nbicgnKFa3A9nsvHUz1amUmEX0LNjybOHuQhwn1ogxBLd37FVzjMWJhIfBrCEo70xTmQp2zPBiOlY3Qj9RzI61PjXM1eP5f+rJ089yDWLRkOR4Y5jn9PnPgVmYz5rLI4OsfI5/PF5Ax2b4zCjx8/kQNH5LnJJNTJahBPBxBS1ZWOWXem2mloaO81lqgInSIeEMqF15XBT9q05pN05KHZMSotfqlR2rZhKEX0id+8jtdHCYmpfm5263ewYVjJdPM+JzaaNoofr4Q1mrJqvy8m+Y1zDnmaNS2LFYm+l5QSKqOItfBFGZrmV8qO/o5yBFILdxqm/OpMBTRFz1tC+qLDMmNiPvH4PfjTgVPL0hug6KLvJVT2QzTqjf/jlofWj1+kbcBu0Z+6lQqFxau/HDgJov0l0MWG3O3v8FdO+e+Mh6rvCt5eOLfp4jthp0QprOmwMOChXKesA0C+oYoqcNecuMcOG9t4QlgJ25Bnae+JFFjcxjw/fpwRY3qvZ+fir6Lg7f0M6w8EtUDtRIovyOyn4rKpHhLcKuJL2gCyRm/BIPfDLhnHWq+duTAFETTF23orCB+yznZp90k6MXVHwlSDQbmx17D54EugFeXSn6qo+bdWdaWYSiuSbs+tUOJC9G8bR+BJvevWP82z3DcfiuLUJUYvbtQmYF1Tf4y3UBVx+yOKWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(8936002)(4326008)(2906002)(66946007)(66556008)(66476007)(8676002)(86362001)(36756003)(38350700002)(38100700002)(316002)(83380400001)(1076003)(186003)(26005)(107886003)(6486002)(508600001)(6916009)(52116002)(6506007)(6512007)(6666004)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QEa6YmHkcQ/2a+C9sRq4TzepS4spbUBAWEtbNL8fV+KNZY475HGra9QfnlF0?=
 =?us-ascii?Q?h93sA591SkqyIRD1OpKyJuY8nPm/e5MlspHB7Wuos4q8twF/bJ9EnogNFzLt?=
 =?us-ascii?Q?iY1xNGTKJvNVYBQdIH6ZS4vB2h9M0sQEa+82JBC266oWCu6QEvVJzBcad4z2?=
 =?us-ascii?Q?0IiOFwb+t4V5JgBg05z7s+fhX3b5adEgIWaJtoyH5hj7+6BPdON/bN5iCaTG?=
 =?us-ascii?Q?fUDtm1vf2Kp5MaR4+nKTB1IXpKytVJjs07LmXBN0RfEOIrrhXjpewVyWSxvz?=
 =?us-ascii?Q?8SFvrFwkLc36uGHH06G53uhw0aE6g/S7QW/pXVqXaop+sg65zTZUf9pWAxqI?=
 =?us-ascii?Q?oEemV4F6HqjpuIbnQOcVMkgiV4A4vVQfl62MPlHf1z40pviSOZreEqPNS1pt?=
 =?us-ascii?Q?KyrGBsW0z3zPJ+rKQKbQ7MqilaqEAkSNTxDYGbXc+acoK0hHTxlFD9QR6L1w?=
 =?us-ascii?Q?pcY4OGCDqY/oUgUE61nZcXKm2FultG6bdvU1oSuLgNTF5S/AVobpBdavEO0T?=
 =?us-ascii?Q?xxMJYt/9v8RPGyEud1BcsI4Bn/jfg8I1ZPpcLuz6zhR2CS4IG1Fuc3cpH4hx?=
 =?us-ascii?Q?ChC6JU0i4pQ+Tzn43CrvbVdDDzVSUPuv9MTko2HVfaqUB4T/fRWV96cO1Vd6?=
 =?us-ascii?Q?R1N3lR+W5AI6OLrLoKdbgRwE74Sk/LYoU7nWHLUoG6Tk0Bcwog98CXyGcuN7?=
 =?us-ascii?Q?GLnyVecCy6kFQbpgkGP1iIa6FXi1DUBimSQtzS6OWCg2B6LVQAhTaFZGOYJL?=
 =?us-ascii?Q?4oX7Bq1SMm1y8e/XKZGBLiCEuUzgeiSkAGb2cPTE1wL+etwbCmYaD5rU2nf8?=
 =?us-ascii?Q?JkAN0NPwveOgfAFNYT/JqlwVBrPaZp96MhK659rzaMzzGiLfr2hqVhmH0iVe?=
 =?us-ascii?Q?VA95dC89R9AacKOT6f+lSwtYzmwSIU306ZFbUNqalF0glcHiJVilHu7lbrDB?=
 =?us-ascii?Q?1Yz+Y6F1N48zn86f9iBaUwDS67HLobofakbOnlfEQ2eeUfjTkdTifWf86gHx?=
 =?us-ascii?Q?eknV7IGEmOGjCUWRfSkCZu8RuQdg/G7S0RhDvxw4X9orWpPZgU6eu8GBoL0t?=
 =?us-ascii?Q?PM0hrwxqFHz7K+6VIrLUubU4YiHXEwU/jihHzoew/LxN+B9Slf4NnHWAPBz4?=
 =?us-ascii?Q?DbyFxtXsZCJhFZloVs8S4RzdgRuDWCpcNrqw6YVTUcPo40cYA/Sdf3e8BtHJ?=
 =?us-ascii?Q?apo54ZYfj+XNJ7mgIjaSgsYF7a/biJ/d5iinCxi1G1sIX1xDgLHka+QkMBUl?=
 =?us-ascii?Q?0wt6WpK1UorUhGHuGSJB3BX7iOSJDqE54yLKLqLABSZOnXW0YqaFj2qyIc9t?=
 =?us-ascii?Q?LvqnLeA00Ztu0cv5xp7TJp1hEq7OdgsPFwwIb2eAVxzEskz1y9P5Uy8KU5zt?=
 =?us-ascii?Q?ivJJ5UR6PsihTq5SlOmVMSFjIpm01LwJR9Q4d7+KkgR/s59jbKthkvqe9jAT?=
 =?us-ascii?Q?PPkiIyTb33ySui2I7f5672tU1UWxv4it440LzOX7o6v0kTqtg0PP7OwhO1OG?=
 =?us-ascii?Q?cv1QnTEM01dT4w0Ds86wXcufbcJOn15gMqJIVl0j6S5JC5LZRV6Ut55nuDBv?=
 =?us-ascii?Q?iELPjX413Uy7zSxEn/Fw7oHw1SF9ggj/m2a4797PeSh1xhwFYcU2yUqmevDC?=
 =?us-ascii?Q?QabgTCPzBpHatmCTyfB0bdyAkIf4Zxkk0gvVcabuKuNMyZN/QTKQpw8L0o46?=
 =?us-ascii?Q?NpwmbQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ff71ac-0689-4585-17b5-08d9faaf096f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 11:39:53.6944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMqWT+W5wenOYJJg/xjuxodhaBBM4Z94x5JJf9/pfoqLxlx0CzlP+egWFiSQDJ78P8Y7fSLIKeu4X/W0WJbrhoYx67dlNQwxp1WjhldxL/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2272
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe02::714
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe02::714;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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

In future this approach may be used to allow reading qcow2 internal
snapshots, for example to export them through NBD.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
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


