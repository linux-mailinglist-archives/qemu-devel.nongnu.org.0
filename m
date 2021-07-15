Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE203C9EF2
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 14:50:19 +0200 (CEST)
Received: from localhost ([::1]:43526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m40oj-0005ce-SC
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 08:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m40nk-0004pN-Fb; Thu, 15 Jul 2021 08:49:16 -0400
Received: from mail-eopbgr60108.outbound.protection.outlook.com
 ([40.107.6.108]:59553 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m40nh-0002ly-JP; Thu, 15 Jul 2021 08:49:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xd4dZnbOgHpNLI8x+FXVfQX8NBYIS95SkosPfHLdxSnCLs7ZR+CE8Htu1mLs87SZAfSvVWZYz/ICouuDwfgsz5dwh+YXnkGGXL2mIDgygLiE7sn+2p4hLg14r/Mj3fT7tqs3R+i2PNC3s8BUDXDDgWxD2Pp4Azx2b6ao8PfiEY02o8XMZew0GSoTRhgRPiSAvjAEX01Rh3G3W1UmmJ5QPyMgSUggvZXxW/UHECe6iRQL1pTnAR95xXzmZVEIddWgrbZ2fcx7FZmcO5XkUYVLFK0PQbLk4wWQt+teJ8xuiJtp5rjKdCTlenpT8pFDp/WiMQr2uQDXbCjnABnucqAwEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsA4JMesW+XPZjwroWu/j3FxswxBIrHd1KFPsMs5v0s=;
 b=Gg4grVFcrEGfunS8dq/zkOM3bDfTXz3/E267GsdG6PgUwqAHxsgmmAPz8SKonKGKkWyqxBBs0MUdIqVSerQe7wAtyi0bHwkzHDaXi+/FfPMZQa61Nb5Jn2OzaeKEWzg8eXAA6IcJQD8IlA2p46dUDnhswUaj0pNbDj5ESUk8Fsxl6fXRihoeUyuaI22xJpaa0n8w08IxinY4CcZego2bAy5Q2XryOrvaVK56KoCex4PyO0r/YeTtbNR+S1IWggHsaPsz35YbKrHy1rStWajVGsYvaxgbLrd4ejBhRV5SjSKe5d3BEUn3BtJhJ+xxJyLPyI9FR0UDV267z5MSuBrRvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsA4JMesW+XPZjwroWu/j3FxswxBIrHd1KFPsMs5v0s=;
 b=kINCiqOvDM9a6Vuy4l2yyf8Q0nL9ABPRZHFgTc3HFanebpfPIwD4H4BosP5oeUnRtiTZuXoEdgbXZzzzHJHdsXR1arvyxBIO/ogUjtGR5XDCJUIKLpPL75fKx9rNwNV7c3c00bk5NmGFOW62wERTbHHy81oHKzaO1C8Nx6wxTL4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1907.eurprd08.prod.outlook.com (2603:10a6:203:4a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Thu, 15 Jul
 2021 12:49:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4308.027; Thu, 15 Jul 2021
 12:49:08 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 programmingkidx@gmail.com, vsementsov@virtuozzo.com
Subject: [PATCH] block/vvfat: fix: drop backing
Date: Thu, 15 Jul 2021 15:48:53 +0300
Message-Id: <20210715124853.13335-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0401CA0118.eurprd04.prod.outlook.com
 (2603:10a6:7:54::47) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.193) by
 HE1PR0401CA0118.eurprd04.prod.outlook.com (2603:10a6:7:54::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 12:49:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2e2b217-6e73-4325-1b9c-08d9478eeffe
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1907:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB190713668A309CC21C1B3B93C1129@AM5PR0801MB1907.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:79;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kdTrQxqU10G+X5FP7bIQ7GJzITMVq3eBPOKvNYEHnB01GCxATfzbrdS1mtgxPeWfdoEi9ATXMM85fAyToiDm/5YMZYXhQaMoqTe9Z1uaRotb35iv0pmbf4ZCXe5o04iHfuWEodRgl2KV/Vljy0uD3jYcHgeKGm0b5LMVOZncXGdWl470yr14a2f0JtKZsoKOSjMiYTkz030xR1WBjxNfLyS2W6DViIhiYRtg+N+Wq0jQay1uACTaWL5mDY/vY5A3QfPzSyDQbBZ1iQxkxygqzI+wkxiAqD2g/qTdlmX3ujnXL4uEijRCJxUCFx/OJvQIjcTvZyN5FFooDDACREeAOgN9Bq7l164/hbWASQ1axPZ6B4anlG13AqNwK2nuja/BCyxmjVYAUENwetRyxq+UzirDejEUfmoqiYgMd87gb6b+QC4T/MkSM/5odXxfUvpsuIwHqdXVZInxydxJ25DNOfmUaLQURqW8ZPEF5DIHw18twYKR8+blePYcpfzhjk8N+LZTx0uUqybS2EXmcKIxAd4BcXmGFox9CB86N32oplvBVNKCrRbPTBk0DLildhwwUiY7NoCFVw4HZbxExPPTH123+ebaxw9EWlUQGyoJmRebhXvYWOBF4o6A5153GZRshIc22c0qd1IGCOuIF8etqkAErJR5AMABXLWxE2mwE0bd+KXIutUr1inPfyK3BACboBv4ZapRPhAU9OY6ATw0nA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39830400003)(396003)(366004)(136003)(376002)(66946007)(107886003)(6916009)(38350700002)(6512007)(2616005)(6506007)(38100700002)(2906002)(66476007)(956004)(66556008)(1076003)(26005)(6666004)(86362001)(186003)(52116002)(6486002)(36756003)(4326008)(478600001)(8936002)(316002)(83380400001)(8676002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OIvBmY19v0a+DFC+AECHox6A9+193+IbIV5kHClTDXA0l8ICu2Dwp9AcYom1?=
 =?us-ascii?Q?UEdLQZunFR8B9dBLrW0CeEdMky3HA3wcYmaABMLdxQKJ60kEnSyxjAhbiOJY?=
 =?us-ascii?Q?eKL2pI6D4hz09rAqE22Hknle9+P1L40Pueuh/Aq4EjN7N0ryLP3Jt1f93y10?=
 =?us-ascii?Q?HmmfaxzS7n6Q5DoyfvG20P9tAK+DyG3MU156cdczNomAuftyWrxq+QA0d9zc?=
 =?us-ascii?Q?fvZp5M5qEx700HFLT2uVjWvvzCv6AVSkWFykqFaembg/CQdnDCQ6ESIqb+jB?=
 =?us-ascii?Q?+s/VSd9DBM5O3ohg+BnYLdWA9d3MmViUhWu9ExOwePTEYlaK50wTEPHHLeoL?=
 =?us-ascii?Q?0VIDoBaji27njHKJMXviQAIrTj4wOIWTBJ5Zz2GrFhlVD1xKYqmVAyBHu0vJ?=
 =?us-ascii?Q?rR0LaFDH1yVtHEyNnxb/ZOCDwRh6Hzg1xlvrp8gmBS5hVVLVS6UH48dxWYto?=
 =?us-ascii?Q?Q0BwpdV8MdK9UNLo+8fLuikkBWyLFeVvNYyqwwJRLb86VADfQGmwW4S1JC4W?=
 =?us-ascii?Q?+mNO5LW7LXIbQLWblPbLoPabCaUuUgZ/h7Lch37kJf6ZiV3XYQ1Lz35DuF1L?=
 =?us-ascii?Q?ZTdF0J/00dwCBaraUDMhR2ZO47brXGJeXccuFVTIe+aX1lHlWJ0KgZdzbyNK?=
 =?us-ascii?Q?PVQ51aoQEw4odTirSUF38SnIJMknVtVm02Qfcrm4f0c1/UL5OqiM9LuMXzot?=
 =?us-ascii?Q?1nAE+x9mc3EXROX84MdJwNifT4Q2Ez+QkcZjQK31lU5DDoAcWpfD58vRLA4n?=
 =?us-ascii?Q?G3KNdlz3n3nZepgXW0AKR3nQAYReGWQIBLkSMSxo+bFx4D6z/0ywnUvpB8pK?=
 =?us-ascii?Q?joge0w+PtKcghyqu7hR9svYBx84VXJL9MschiJ10IEKrvpqWnzhOOzNXAn77?=
 =?us-ascii?Q?C/dr4NYaMIuRFTHn8Usj3WpIGPMubhheTUslnD00n4v6VOMG3mi2EGbGQ3hs?=
 =?us-ascii?Q?rvA3zkY9KYHdlOMdIr08d7AYCUaccX9rRTFe8HJHJ/MucQUfb0AMCLLeYp0s?=
 =?us-ascii?Q?rFK8EvPZUC6pW3rvxOQ0NIGrGqhQ7YedX7kJTX9GZkgrmt7lnwidPxrgefVG?=
 =?us-ascii?Q?G0FIFyIqeeTD2Bk1A9ht+f3f+fDTHOXAcLVZnLgQXZlEy3JKnPBfZb5kIO9T?=
 =?us-ascii?Q?CD/Yorp8m5j71VXdw+3PIcf9wUQP9lBENstnYP4NlsYxOG2Wruc7XtlMBHzD?=
 =?us-ascii?Q?rGe1YsgJI5RZrWu+Y+jmVsE3NNwBfzUIjJfg9lJ/Cit6u2nRyZ2RaUeLnyaX?=
 =?us-ascii?Q?EIcyNaPHX5GJu4GGgSJ+GU2f090sDKnadItl4zBSueaxlx7SHEy3J7fSlJhd?=
 =?us-ascii?Q?lnGpEDo5HIpfJDhNVcZ0w3jC?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e2b217-6e73-4325-1b9c-08d9478eeffe
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 12:49:08.8415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SqK0elHArcEzByfRbGuZKzCcBuy5Hz1BagRp7PPuYbw4uwDa3p0z9ceRnvnJn77OeGcOfIdx3VAvfvG5G0aX/1P6EKqhHZsRfSb3hG87Ch4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1907
Received-SPF: pass client-ip=40.107.6.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Most probably this fake backing child doesn't work anyway (see notes
about it in a8a4d15c1c34d).

Still, since 25f78d9e2de528473d52 drivers are required to set
.supports_backing if they want to call bdrv_set_backing_hd, so now
vvfat just doesn't work because of this check.

Let's finally drop this fake backing file.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

Honestly, I don't know, which scenarios may break after this patch.
So, that's just my idea that it's more correct to drop this thing than
set .supports_backing in vvfat driver.

 block/vvfat.c | 43 ++++---------------------------------------
 1 file changed, 4 insertions(+), 39 deletions(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index ae9d387da7..34bf1e3a86 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -3098,26 +3098,6 @@ static int coroutine_fn vvfat_co_block_status(BlockDriverState *bs,
     return BDRV_BLOCK_DATA;
 }
 
-static int coroutine_fn
-write_target_commit(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                    QEMUIOVector *qiov, int flags)
-{
-    int ret;
-
-    BDRVVVFATState* s = *((BDRVVVFATState**) bs->opaque);
-    qemu_co_mutex_lock(&s->lock);
-    ret = try_commit(s);
-    qemu_co_mutex_unlock(&s->lock);
-
-    return ret;
-}
-
-static BlockDriver vvfat_write_target = {
-    .format_name        = "vvfat_write_target",
-    .instance_size      = sizeof(void*),
-    .bdrv_co_pwritev    = write_target_commit,
-};
-
 static void vvfat_qcow_options(BdrvChildRole role, bool parent_is_format,
                                int *child_flags, QDict *child_options,
                                int parent_flags, QDict *parent_options)
@@ -3133,7 +3113,6 @@ static int enable_write_target(BlockDriverState *bs, Error **errp)
 {
     BDRVVVFATState *s = bs->opaque;
     BlockDriver *bdrv_qcow = NULL;
-    BlockDriverState *backing;
     QemuOpts *opts = NULL;
     int ret;
     int size = sector2cluster(s, s->sector_count);
@@ -3184,13 +3163,6 @@ static int enable_write_target(BlockDriverState *bs, Error **errp)
     unlink(s->qcow_filename);
 #endif
 
-    backing = bdrv_new_open_driver(&vvfat_write_target, NULL, BDRV_O_ALLOW_RDWR,
-                                   &error_abort);
-    *(void**) backing->opaque = s;
-
-    bdrv_set_backing_hd(s->bs, backing, &error_abort);
-    bdrv_unref(backing);
-
     return 0;
 
 err:
@@ -3205,17 +3177,10 @@ static void vvfat_child_perm(BlockDriverState *bs, BdrvChild *c,
                              uint64_t perm, uint64_t shared,
                              uint64_t *nperm, uint64_t *nshared)
 {
-    if (role & BDRV_CHILD_DATA) {
-        /* This is a private node, nobody should try to attach to it */
-        *nperm = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE;
-        *nshared = BLK_PERM_WRITE_UNCHANGED;
-    } else {
-        assert(role & BDRV_CHILD_COW);
-        /* The backing file is there so 'commit' can use it. vvfat doesn't
-         * access it in any way. */
-        *nperm = 0;
-        *nshared = BLK_PERM_ALL;
-    }
+    assert(role & BDRV_CHILD_DATA);
+    /* This is a private node, nobody should try to attach to it */
+    *nperm = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE;
+    *nshared = BLK_PERM_WRITE_UNCHANGED;
 }
 
 static void vvfat_close(BlockDriverState *bs)
-- 
2.29.2


