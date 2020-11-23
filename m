Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 800812C16AC
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:44:10 +0100 (CET)
Received: from localhost ([::1]:55148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khIgz-0006u9-I5
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:44:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khIDU-0004c4-M5; Mon, 23 Nov 2020 15:13:40 -0500
Received: from mail-am6eur05on2111.outbound.protection.outlook.com
 ([40.107.22.111]:23809 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khIDQ-0007Ry-Ez; Mon, 23 Nov 2020 15:13:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDc+hjIpeivqG0+lNEe0YEeTdfFCL0aDE7DDT5/N/R/g4ecwMHorXb7csUIC8Nnq4+40Jxdn4iTc5uuzZOuBmy8WyakFUlXq8ETW1UvREzjlUxpP8Y+HogI6gtaTHe8erShP6u82ghAmvooCjh5i+POYwINoY/wbTMlsTmhzfcevnxkjXxx4lks0KZer8z8g4JEiF/hQy0iOxgCs8aXhp/nbBM6Qij7erOlEcMhgORUOeJ4gGq9CMy2c46dagsqZozV1BMlvJvLcW8ghGwHurT9vGjYk7xQpPex+N0qxyfjzFm+JviJf6Xw9QFOqFgA+UYyOARX6VWFhxd6DmgJnfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OheHyaMRfMYYcR/ah1/njMb6IkLTse8lLLrna9dz2r8=;
 b=I4fTJsaQaS6KivLhQ72bnuDkW+HAiqEvEE+qmQcCfNZjJXJtqMT7cwsK5g/LaSXhRmedA5JkXlSuNV0YNx2dG2rDmfGsNWWiEYYH1h+EGxNUSqqaueLDRI4N4sRCYmCfqGB2nuHnKP9gz72J1RdXDySMJvXJuCgMJ60YhTH2+u4WNLepBBvBE/Q1fEKkJ6GYdXyTVoQwZOuapU053HsM2tURYV9/AueIg4qUtTyJDMWHerkOHXEbhGxA1eCzqD1t+yzG1u17wEjafzmuaXQd4leM6LSJ4q0llDbB9W4lPeD22AHGCY4kpKSoJD+leKFV/GD/QY03qzHAWZ7RvSsYKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OheHyaMRfMYYcR/ah1/njMb6IkLTse8lLLrna9dz2r8=;
 b=Xu+HE3mTyG85v2iF0DVTO3rxtF5hfxcPMqQfPB2FK+ZCmuHkiz+6IOAGrfnGAvH7NRX/+YC58mR5MYrge4URt5HPe/o7ulUtgTJeEmGK0YrQzRdqa5FGOYT8xKQzHa7HYL/bTEpEUhJITWl+uzVzRSHed9FXwNx2WJCZ56sznmo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4690.eurprd08.prod.outlook.com (2603:10a6:20b:cd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:13:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:13:09 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH 21/21] block/backup-top: drop .active
Date: Mon, 23 Nov 2020 23:12:33 +0300
Message-Id: <20201123201233.9534-24-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201123201233.9534-1-vsementsov@virtuozzo.com>
References: <20201123201233.9534-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.115]
X-ClientProxiedBy: AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.115) by
 AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.21 via Frontend Transport; Mon, 23 Nov 2020 20:13:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0e73fc9-79e5-4a6e-0be9-08d88fec327f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4690A7479457ABFF920EE6C9C1FC0@AM6PR08MB4690.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:345;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UHjGHsptBd3SnoTKlfnp2NBGOFkQGULwTbwg2gFxiQxv+w+PEg9Z2+c+HKpB3l8XTpehFbSLlG7zH3SWdXum0acdTj6EyzJrVVb+5QqA/GoukVCHKR6Il3US2GGAQbjrQNvhvpDwTREung0Uv/ebZEJ5lSFGaOFFj3rMPupWzCbbdjKphZZfz6w3KYBw5HrLPn0UywdMc31yPJeWn5mELoaa7whh8DaG4kmiTsCr2hYAcs64ya/+242MpR9guTHe4NtetHSKKqfGbRFIcPqVJLGh1xHixJRlwA90wTj9Z5/+f18vcvsb/gF8bDgLkq2G7hkAqHYB6qPti8SQtLX1AG2+DKLR9PybOHx8uJJpJBuLn7/Jijpw9jCX/ATSb5Ab
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39840400004)(376002)(366004)(5660300002)(6512007)(6666004)(1076003)(52116002)(6486002)(16526019)(26005)(83380400001)(186003)(6506007)(86362001)(2906002)(6916009)(4326008)(8936002)(66946007)(478600001)(107886003)(66556008)(8676002)(956004)(2616005)(316002)(36756003)(66476007)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: g2/yRMFLOCrNgFs9z37tEzSfqGWJxnLEUpyhkgmGFPQSDg1s0qEvKINQHoIVJXp0ttqGyMaTaOIO+qLfN84ZY6x+xAutXlPOrbRJmzaeTQNytfhfMtqUTL5R4gb0iZSgeAgOBUqsQ5fakAuMso+niZSYAm9PXTP+K6sYHYH9BXKUs9Wuf5KrWpjQk64XeD6DLMrDmKlgDI4ugv7mxMcy7BPIiK3DDx/gAPyYbf2/Ux6af1c0QsVTuvCQBT+uSceVs0Wiuf4AHt+kh5RYQjh6WH8/heN88OH/jSzLGQBVIbXNFmOtXbUbAfe9JoN/4twzu8RBl6/fh+Yu4ZoyOoKlHLusuHb/iH0FAxvqjkZAyab6FQpnPNtb+dRXHF9YTvWSdGY4/OLYklnUbfjxcrc5MSGXMK6LthMVRf8Wrp8/MIuoRmDMqSx5rE+m9ceCVFJ9tp7P+nSlYGbVLalGbESNSxdK9CQ1zi9Nlc1nfRzRQcrLrf4SZbluCBup2ktGWxtEhGF2RgSOYW8A/fmRAHjwvBBSqzr0YXBSyFcC/4Bq0PyyXE0iNqmJF1VVB+OVGZgOisH4Y6dH3dKhOJpXvpD4IHNRi1Mc7z4T1wFzSRPIb6a0vHMH48QK5h0okUHrvG/yglbxHErYhPafp+WlCuxtDg++RzcwDSLrnxZ+/MgadrAZdu2ov1/5aqbTGgPKdBTxFpmAeLrad3v7Moff6I5TOvV7Fzp9KQK2eO6nJJRWD4x8znwG5mt1Vf6T6S+4jXqsstj8bveaoQ7b9J44QlVU3EC5/dikFuzXlq1yZ1rqTid4S6CeOV23cYJXIYNrAAPfsLRYS6QBQxg2YrFbJ4Xzwniy9CTathu44NrsKl81EQUgHIHO8FZH9Y3vxUb6dMSHlM4XHxVuDDOcEObARUF3FA==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e73fc9-79e5-4a6e-0be9-08d88fec327f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:13:09.9218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v4rjrJ3b8O87+XRbNAXvQKwDkAjDM2DKMae8GJ2pWhNgKOgSWEtq1+cinYyPWQTsnqTh2maznsmzskS/BGkDtpxu9nChgsSdPnw1bVCYZ4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4690
Received-SPF: pass client-ip=40.107.22.111;
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

We don't need this workaround anymore: bdrv_append is already smart
enough and we can use new bdrv_drop_filter().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/backup-top.c         | 38 +-------------------------------------
 tests/qemu-iotests/283.out |  2 +-
 2 files changed, 2 insertions(+), 38 deletions(-)

diff --git a/block/backup-top.c b/block/backup-top.c
index 650ed6195c..84eb73aeb7 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -37,7 +37,6 @@
 typedef struct BDRVBackupTopState {
     BlockCopyState *bcs;
     BdrvChild *target;
-    bool active;
     int64_t cluster_size;
 } BDRVBackupTopState;
 
@@ -127,21 +126,6 @@ static void backup_top_child_perm(BlockDriverState *bs, BdrvChild *c,
                                   uint64_t perm, uint64_t shared,
                                   uint64_t *nperm, uint64_t *nshared)
 {
-    BDRVBackupTopState *s = bs->opaque;
-
-    if (!s->active) {
-        /*
-         * The filter node may be in process of bdrv_append(), which firstly do
-         * bdrv_set_backing_hd() and then bdrv_replace_node(). This means that
-         * we can't unshare BLK_PERM_WRITE during bdrv_append() operation. So,
-         * let's require nothing during bdrv_append() and refresh permissions
-         * after it (see bdrv_backup_top_append()).
-         */
-        *nperm = 0;
-        *nshared = BLK_PERM_ALL;
-        return;
-    }
-
     if (!(role & BDRV_CHILD_FILTERED)) {
         /*
          * Target child
@@ -229,18 +213,6 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
     }
     appended = true;
 
-    /*
-     * bdrv_append() finished successfully, now we can require permissions
-     * we want.
-     */
-    state->active = true;
-    bdrv_child_refresh_perms(top, top->backing, &local_err);
-    if (local_err) {
-        error_prepend(&local_err,
-                      "Cannot set permissions for backup-top filter: ");
-        goto fail;
-    }
-
     state->cluster_size = cluster_size;
     state->bcs = block_copy_state_new(top->backing, state->target,
                                       cluster_size, write_flags, &local_err);
@@ -256,7 +228,6 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
 
 fail:
     if (appended) {
-        state->active = false;
         bdrv_backup_top_drop(top);
     } else {
         bdrv_unref(top);
@@ -272,16 +243,9 @@ void bdrv_backup_top_drop(BlockDriverState *bs)
 {
     BDRVBackupTopState *s = bs->opaque;
 
-    bdrv_drained_begin(bs);
+    bdrv_drop_filter(bs, &error_abort);
 
     block_copy_state_free(s->bcs);
 
-    s->active = false;
-    bdrv_child_refresh_perms(bs, bs->backing, &error_abort);
-    bdrv_replace_node(bs, bs->backing->bs, &error_abort);
-    bdrv_set_backing_hd(bs, NULL, &error_abort);
-
-    bdrv_drained_end(bs);
-
     bdrv_unref(bs);
 }
diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
index fbb7d0f619..a34e4e3f92 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -5,4 +5,4 @@
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
 {"return": {}}
 {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
-{"error": {"class": "GenericError", "desc": "Cannot set permissions for backup-top filter: Conflicts with use by source as 'image', which does not allow 'write' on base"}}
+{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Conflicts with use by source as 'image', which does not allow 'write' on base"}}
-- 
2.21.3


