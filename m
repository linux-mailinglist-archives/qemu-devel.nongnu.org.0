Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9FE38E3BD
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 12:14:55 +0200 (CEST)
Received: from localhost ([::1]:40052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll7bq-0000qI-5l
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 06:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ll7aJ-0007Ea-J5; Mon, 24 May 2021 06:13:19 -0400
Received: from mail-am6eur05on2116.outbound.protection.outlook.com
 ([40.107.22.116]:27488 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ll7aG-0001TQ-PD; Mon, 24 May 2021 06:13:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SLTP9u0Qgtoakrt6I2lVZuzCKPibmHaPMDzDiYbz0VvxPRDlocXwX0IE3jBMl1mZGtag/McXd6gxczWOSc8zN2nactRqq7r9AGMKRTEz+66cO7j08KWz6dFuZ045VLlYMRVTe2mEc7U80I99Ia6PuIQOSmFxh8ySS+j4YEr3LOeNAcNbz2roQ+Zg6XEb/jg50b4zkaJE4ZRVl3DBkqqhPu/1pVtams/kS3MGfpclNBq0JPdsy8MMRH7vdnTx4fGFx9vd0mf0nC+EAiTE4NL/N0ZPAkXkjw3uY+Pbo7FGZnsSP7V2lBcog+AuZqtF8PN0krC8Rlo4anGQntJr/Zxplg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrRcxNGDo3e80KjlboCQjyQxSfr9lqu56ZMhbQjd0xw=;
 b=a9TpPBa4mbxz3qiykVQ6q4S50aSQbBOzLiuz249oTENYzaFd+KXap1CEWVF8SvaTTUkcfOSzZoVhWmK9jd/v4uhQxO1OaGuPTgr3AwmGB9hP82GsMry4eOjOsqRugoik+IIb1ymf7V92wMg2+pYy6sYyKzlFxlFWzGWFQY8DUqkDOI28hKioFt6aZXXtIgmck4AXBjbBOliox9Mh3AVq0hvKeJyaGNQTdapCePX9mxeE/lGiTSlOIeUxwZsUq965NSICboOxNQBDrgN4+mb8+PQu0vJtEKBwnywh0tl7fA7j1FFoT9GcGhyYl1or7S4fOJswExY91iY6grVyejAwrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrRcxNGDo3e80KjlboCQjyQxSfr9lqu56ZMhbQjd0xw=;
 b=fbWTuvP8GeQMOy1w9RaZVX+bwFTB5UpKyVK3jxIRGqmfXOVJRX95Y+IX+40pxVM7L0ITmUvA0dTpJbVhcOOIpXQuGftHxlAHTa2F1sF68Yt6O80AMLpiuET7urCT1R4tfkgL9nqVgKjz5H8bvYNn8TtOyqQ7H2NLUDQGd3mwLDo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5446.eurprd08.prod.outlook.com (2603:10a6:20b:107::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.31; Mon, 24 May
 2021 10:13:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 10:13:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 berto@igalia.com, programmingkidx@gmail.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: [PATCH 1/2] block/vvfat: child_vvfat_qcow: add
 .get_parent_aio_context, fix crash
Date: Mon, 24 May 2021 13:12:56 +0300
Message-Id: <20210524101257.119377-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210524101257.119377-1-vsementsov@virtuozzo.com>
References: <20210524101257.119377-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: HE1PR05CA0186.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.195) by
 HE1PR05CA0186.eurprd05.prod.outlook.com (2603:10a6:3:f8::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 10:13:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc096b63-1f43-4e58-9004-08d91e9c89d4
X-MS-TrafficTypeDiagnostic: AM7PR08MB5446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB544623BC2135B438F115E216C1269@AM7PR08MB5446.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:19;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eyioSCUmw4SOOSrQRjklz7T3AZMmS8BW8OpoSYyQCPKZ1ru3wR4ZRNt8jhgN8YLKuyzs8rzY/B413FDTK0OF4wplBU0tr6I1+97iVZpH6DqWq8S5gzplqRocy5mGqKSg5M+MShbqrmVhBplWoDF/w6vECGbWtivL1+vv3XhW8FGBrQ87faBA+91Za8sBvWI0KZLG21qg8WcovTnTJtNBatfShathKJGCH5iI723OMGjWwG0wPusNScBPZjq6QEBq+SAmZ9m0XBL16kQndXTFWKjygKSpbAr0BadKnhGP+38Xf7WNxvqOoZ9OHuvT4+b8ROuvuMvrC3phZfatjWjdPx5GgukP6PFKir8e2LwYNWTgpq8c9WQPTSeHBUYdCLU62vQkRxyFAMoDw3Gn3uM5EfhOACmGlqh1gCPMqgIlkiCSrI/RHTRNcncg/Y9KPDSQ60VP/uoaY3DPr63bPTXG6pfxP+KuG9avrEB9F/WwKyeIlLXL5XLkSeaE16TmGiAgyEuWRiYr8a1YZ1TcfqaB2YNmmFJKxk9MneIOizxL66kEYuPb7q07vBNFymRPUscDtA0s8QSS16qbPEBvI7dOEpHPgf0sL6dKOaZeIqUJYHsizm38vsiKa/pZ05iQ1mvV0nwZOk2Qq/WhgLpuBU4EJoOvEx5GSKMCNQm2H9Dmx6b3ScCDSfUdMEO0Ns1r0mEkB5Ojel1MrigzJRXs4ltT4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(366004)(39840400004)(136003)(6506007)(66946007)(66556008)(6512007)(4326008)(6666004)(66476007)(52116002)(86362001)(6486002)(2616005)(107886003)(36756003)(5660300002)(2906002)(186003)(6916009)(956004)(316002)(38100700002)(38350700002)(478600001)(8936002)(1076003)(26005)(8676002)(16526019)(83380400001)(69590400013)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8B/81IUAIVIUMhFBrebAbTxWM4gu/055g0HKZdeIBoKO1yQ2KsOJ9n8od7R6?=
 =?us-ascii?Q?/TOdMiC1k3IM4I7ksOzKXz8s8tMgOddYPBVycfjgWJ24fckMolInMLyoGWpQ?=
 =?us-ascii?Q?k7JVNmxETNd6rkvHHuobc14Nct8QRCfc1h7mhFx8+UrSHjgCSe1X+2ANYgE7?=
 =?us-ascii?Q?/ETqnhtJ8qS01ByNU+F+Pkadtse3oO93kBwvE7IyVxXNMM3nle1/9D6t7W21?=
 =?us-ascii?Q?r7bhXlqVN067qBAxqIbmXhlYDxCQDJBvF5pPXHXdQ/ubVyWqyTpCIpKW6DWn?=
 =?us-ascii?Q?CiNqhoDVyTCIHRpnw4OflWOYRqrIzXoNYoGXvlGoZ4ttwdJHViY5T1pW/q38?=
 =?us-ascii?Q?txrfgHwRVQH3lNJQknqlMq72sEWeE1ig5hJ36yPXFPsh3Rq7AMd6egpPs+06?=
 =?us-ascii?Q?UlLOTuOog+CixvboE3RvRvnD5GdjbzccHv8q8MPAOl4nqX71pLT2nDKU++Lu?=
 =?us-ascii?Q?3RTBFwzw4U2a23UvAtYqS5K3xu4Q/9kmKhOQRT5P3r1qXbq1tU5Y2jWmqUam?=
 =?us-ascii?Q?NZdKgdfONHv48dp2jCh5DA3P2C6V+hFl9eiwYOj9FgBjQZnpP9O4eknYoVcv?=
 =?us-ascii?Q?/dS5jeYLvSFES6RiqHCj6GzUNaBs8Vy9HMV+xoJQD2yXFGFXMbl8Dl+97/Dm?=
 =?us-ascii?Q?+iWQTMQQISlYubMtEB0sReLWA39w2kfQ4x+1MSs3X/0Ydzn3BAF1SmlgEJRY?=
 =?us-ascii?Q?dtKRHBuxLPOq/rVfNiWtp7RNREKgQcsRnMnE+JKC/NHMxvfWYo9RK+1/RwQR?=
 =?us-ascii?Q?RNHXUqIadEua+D8dSbeP6avCg9yOSXsRXOLSsGRIf79tT2QruHKbBPhKZX3f?=
 =?us-ascii?Q?p9zskK7NkqXVrzOjaBfBpj9BGND971RZ08MIPJfnuZLflRS4lE31ACSsrZRi?=
 =?us-ascii?Q?47jvTbpksu0oU/sJ3Cix1JGvrawHIF5aweeDWT5c3Xp8JVcscGy8hiMy1TqU?=
 =?us-ascii?Q?ICe9SokXb8dCJyrP+sLnX3b4NU9evxMY1TUlLFDZTNDVBSG1P/vYq1O2mFOE?=
 =?us-ascii?Q?8Sw6WE/bxPL3oB49zDAZihD8KVbv5RzM6QIgCy+cwJIbClzT0+/1rBEy2s5q?=
 =?us-ascii?Q?zG7W2LHRHrRE5OCddSPQxPlTVziO4VcT5VQxAHEUlZHi16QqsV9etcCIDhJf?=
 =?us-ascii?Q?Q4MGlhSr2qii43YM3uhdyTjOHvoNe5UnlvwwR6ZhiGATu4/HrjtsD3n0APEX?=
 =?us-ascii?Q?NbQnAWW2klulDG1wm7PKMCdy2R2pvDiZ5XUAeY9qa/0TTvbKwda9M8nwcmRg?=
 =?us-ascii?Q?ypezPuxWtIAsIXpCL037MWszko1cKyq8clI1JYZUf+bwzSk5lVtg+veJXF1z?=
 =?us-ascii?Q?VPe9tf/xZ3RlZ/5OxOVKhVWH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc096b63-1f43-4e58-9004-08d91e9c89d4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 10:13:12.7478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iOFXwq1T3SWXrMK9fFItmlsS/xIGI3+UXODJJ7Gfk1Fim3eYgQCYWX+T6Bwy4XECE3gwj/JcTxyD2bGv7oj3NxS3S/Ud/ayKJENjR7BKywE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5446
Received-SPF: pass client-ip=40.107.22.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

Commit 3ca1f3225727419ba573673b744edac10904276f
"block: BdrvChildClass: add .get_parent_aio_context handler" introduced
new handler and commit 228ca37e12f97788e05bd0c92f89b3e5e4019607
"block: drop ctx argument from bdrv_root_attach_child" made a generic
use of it. But 3ca1f3225727419ba573673b744edac10904276f didn't update
child_vvfat_qcow. Fix that.

Before that fix the command

./build/qemu-system-x86_64 -usb -device usb-storage,drive=fat16 \
  -drive file=fat:rw:fat-type=16:"<path of a host folder>",id=fat16,format=raw,if=none

crashes:

1  bdrv_child_get_parent_aio_context (c=0x559d62426d20)
    at ../block.c:1440
2  bdrv_attach_child_common
    (child_bs=0x559d62468190, child_name=0x559d606f9e3d "write-target",
     child_class=0x559d60c58d20 <child_vvfat_qcow>, child_role=3,
     perm=3, shared_perm=4, opaque=0x559d62445690,
     child=0x7ffc74c2acc8, tran=0x559d6246ddd0, errp=0x7ffc74c2ae60)
    at ../block.c:2795
3  bdrv_attach_child_noperm
    (parent_bs=0x559d62445690, child_bs=0x559d62468190,
     child_name=0x559d606f9e3d "write-target",
     child_class=0x559d60c58d20 <child_vvfat_qcow>, child_role=3,
     child=0x7ffc74c2acc8, tran=0x559d6246ddd0, errp=0x7ffc74c2ae60) at
    ../block.c:2855
4  bdrv_attach_child
    (parent_bs=0x559d62445690, child_bs=0x559d62468190,
     child_name=0x559d606f9e3d "write-target",
     child_class=0x559d60c58d20 <child_vvfat_qcow>, child_role=3,
     errp=0x7ffc74c2ae60) at ../block.c:2953
5  bdrv_open_child
    (filename=0x559d62464b80 "/var/tmp/vl.h3TIS4",
     options=0x559d6246ec20, bdref_key=0x559d606f9e3d "write-target",
     parent=0x559d62445690, child_class=0x559d60c58d20
     <child_vvfat_qcow>, child_role=3, allow_none=false,
     errp=0x7ffc74c2ae60) at ../block.c:3351
6  enable_write_target (bs=0x559d62445690, errp=0x7ffc74c2ae60) at
   ../block/vvfat.c:3176
7  vvfat_open (bs=0x559d62445690, options=0x559d6244adb0, flags=155650,
               errp=0x7ffc74c2ae60) at ../block/vvfat.c:1236
8  bdrv_open_driver (bs=0x559d62445690, drv=0x559d60d4f7e0
                     <bdrv_vvfat>, node_name=0x0,
                     options=0x559d6244adb0, open_flags=155650,
                     errp=0x7ffc74c2af70) at ../block.c:1557
9  bdrv_open_common (bs=0x559d62445690, file=0x0,
                     options=0x559d6244adb0, errp=0x7ffc74c2af70) at
...

(gdb) fr 1
 #1  0x0000559d603ea3bf in bdrv_child_get_parent_aio_context
     (c=0x559d62426d20) at ../block.c:1440
1440        return c->klass->get_parent_aio_context(c);
 (gdb) p c->klass
$1 = (const BdrvChildClass *) 0x559d60c58d20 <child_vvfat_qcow>
 (gdb) p c->klass->get_parent_aio_context
$2 = (AioContext *(*)(BdrvChild *)) 0x0

Fixes: 3ca1f3225727419ba573673b744edac10904276f
Fixes: 228ca37e12f97788e05bd0c92f89b3e5e4019607
Reported-by: Programmingkid <programmingkidx@gmail.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h | 1 +
 block.c               | 4 ++--
 block/vvfat.c         | 1 +
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 82185965ff..8e707a83b7 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -701,6 +701,7 @@ bool bdrv_child_can_set_aio_context(BdrvChild *c, AioContext *ctx,
 bool bdrv_can_set_aio_context(BlockDriverState *bs, AioContext *ctx,
                               GSList **ignore, Error **errp);
 AioContext *bdrv_child_get_parent_aio_context(BdrvChild *c);
+AioContext *child_of_bds_get_parent_aio_context(BdrvChild *c);
 
 int bdrv_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz);
 int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo);
diff --git a/block.c b/block.c
index 0dc97281dc..ef13076c4c 100644
--- a/block.c
+++ b/block.c
@@ -1412,7 +1412,7 @@ static int bdrv_child_cb_update_filename(BdrvChild *c, BlockDriverState *base,
     return 0;
 }
 
-static AioContext *bdrv_child_cb_get_parent_aio_context(BdrvChild *c)
+AioContext *child_of_bds_get_parent_aio_context(BdrvChild *c)
 {
     BlockDriverState *bs = c->opaque;
 
@@ -1432,7 +1432,7 @@ const BdrvChildClass child_of_bds = {
     .can_set_aio_ctx = bdrv_child_cb_can_set_aio_ctx,
     .set_aio_ctx     = bdrv_child_cb_set_aio_ctx,
     .update_filename = bdrv_child_cb_update_filename,
-    .get_parent_aio_context = bdrv_child_cb_get_parent_aio_context,
+    .get_parent_aio_context = child_of_bds_get_parent_aio_context,
 };
 
 AioContext *bdrv_child_get_parent_aio_context(BdrvChild *c)
diff --git a/block/vvfat.c b/block/vvfat.c
index 54807f82ca..07232a7cfc 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -3130,6 +3130,7 @@ static void vvfat_qcow_options(BdrvChildRole role, bool parent_is_format,
 static const BdrvChildClass child_vvfat_qcow = {
     .parent_is_bds      = true,
     .inherit_options    = vvfat_qcow_options,
+    .get_parent_aio_context = child_of_bds_get_parent_aio_context,
 };
 
 static int enable_write_target(BlockDriverState *bs, Error **errp)
-- 
2.29.2


