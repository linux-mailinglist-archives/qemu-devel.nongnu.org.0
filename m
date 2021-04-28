Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 620FF36DC81
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:55:07 +0200 (CEST)
Received: from localhost ([::1]:59760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmWj-0002XM-Cm
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyV-00065r-TL; Wed, 28 Apr 2021 11:19:39 -0400
Received: from mail-eopbgr00117.outbound.protection.outlook.com
 ([40.107.0.117]:54347 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyS-00021X-Qz; Wed, 28 Apr 2021 11:19:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZTLV9uCAXvLdbWTcig0t67m2S+5LIpFQdYrFBacEbc3ndzQ9GbM3yqynlqD6R+/uYJvxHM+Tu1Gt7TIbECtz2mm6B9pBB86nCB8ZAXOMEmbq4EvnRff2nQsD8aL8plykiciGC+CeQ7Uo3WVuAbypBY6CEag5nV1sqAStALAAuROmkppjukyKSXaveDBPqlhrKZ0I/GKW6aJNfuLGGd5kEW4oXPnOHIMHXkiJlMJtwZiYOJ8HVkXUAKkMayXQipEND1dcO2phmY9YQ28mGoiEi/WZ+mGgxRaD6p1vfFYg6oA4a/LvnWc8Pths0ENEXdUNS2R3Nma9hw8KmxG0NgaFAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wql230fj2DOXdP1vAPMD2wQnX2m8D8h8CeRv4Sp/fLU=;
 b=KJxBVb8q/ndTOiXmIqetQWbInBR0rUgX3ER+cDe6zbLRqO9ZZmEx16ZPLvsnmjvkhTj1+X55vxRQQ1YUX62hg/gJAtktjQJ4lXpYys8bkRDJTaGrAbSwkV1JbW0+F0a5UWniiwZWNrxfO2H7G1aKKAcnY0d6luD3918/BkjWgCezxNoGtoNEr0n55jukV0RsMtuSmlS+3IJ37iVTK1OsFCo7liF5yj9enMvImgUKer0e6C/XKVPKXTts/J8RG4uGZ7CxfO/wWSpqfFxqq7hZ5SWZO7WjNir0CPNXgtkBKt4N0OOsdHzZLhLVZu/8VXA87SXc9HX9D/0h18B9MsDq9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wql230fj2DOXdP1vAPMD2wQnX2m8D8h8CeRv4Sp/fLU=;
 b=rBmsm+Q+8J/PfkBLZ+re7BzrFpqub4KiSHjLrrpW/NbVteTveMB+7yRsYsMx1/ZJm8lIpvBwxoDaIpZhkAl+pPORWJpeGa4n3XZMe7eVOCKXJIaoBm1cPeBwLh0lnDMAJm1Iu0cFA5680sISGOrg8MdWeeNFSjtT4fRRqF0rT4Y=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6151.eurprd08.prod.outlook.com (2603:10a6:20b:290::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 15:18:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:18:49 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 24/36] block/backup-top: drop .active
Date: Wed, 28 Apr 2021 18:17:52 +0300
Message-Id: <20210428151804.439460-25-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210428151804.439460-1-vsementsov@virtuozzo.com>
References: <20210428151804.439460-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR09CA0045.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR09CA0045.eurprd09.prod.outlook.com (2603:10a6:7:3c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b572ea7-a574-4124-0c1e-08d90a58ecce
X-MS-TrafficTypeDiagnostic: AS8PR08MB6151:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6151C57E47208D912905CC22C1409@AS8PR08MB6151.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:94;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: obw8n5h7gXViebcE9+Fg7W9O0VqVby7mmIDESbU5IZIeKVSsYi7K/batEr/c2xIQzJ6jOeug6tbSTe6n1D+cmkGwZFJwIEQ4gHWv2K54HNBx0lS3a/UcxlOROZW+kLTVtdjmz43a5FY+wbSPo/TXq/0Oe72xHhvsBxCx1AJXF/3P6s5yYFWh68fSD96rg51U2ZOiSjQ4+9zpKdmzDzZve4QFTuiV3L7zNcAgM1CnFCgUmKAErvcwua8xbof/w0ceqObTlh1jUVgyDHTHPtNgboh5W6SIbD+y6zdLXK+wOyMtiUPfIioy148pSbch7QIq64nXEgO7UXVxDOl5Zl90yOGKlLZg6AC3+OmUTOZdvAknbpMLVK0J+ICIKoi7wPpg86plYe5P0cM4n9ugeDXY0KuEYeWXIGmCuKNmMsFxpobfaruy44zMNU/ejz8WE1akBvC2B4YBX6XuxfBfQdGq0ng7ygIfGnvh7x04Mac6t0dQRGAEl9Q2nPLSNz31dwoLYz3jy9ByO/08NioPmrk9syU//r7Q/lCVgWAOjn0YCOBVYvxEk+jQ1EvzfXvqFw1W/vZCA45J6zDA/5lm2UT/GFmRdLbzOw688ODv/W75hRekJnzldhHd5ipoumkuetdeRR5f6biio+Ckwmza0z1RkqYIDA1bwGMZAO+QUaCZXFCJyj9H/9kMhuPE8j2WVEVRCSgIZmUe8npOpM1Od1ufag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(396003)(136003)(366004)(346002)(478600001)(52116002)(36756003)(26005)(956004)(86362001)(6916009)(6666004)(5660300002)(316002)(186003)(6506007)(6512007)(2906002)(83380400001)(16526019)(4326008)(6486002)(66556008)(66476007)(8676002)(66946007)(1076003)(8936002)(2616005)(38350700002)(38100700002)(69590400013)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Yq4CLbGyVJWXMPCCL2VbxfB/64ePIWnIq2dO8aIYBodrOX+SvuiuVf8pxsMs?=
 =?us-ascii?Q?Sku2dZGAjr5qfUQMXgxnS7sldFKAvvIN9/DER92kYqApY/E8U31/1YfveJbI?=
 =?us-ascii?Q?MEr9dWxnZvV+sYS5LUxmv61myah9E34JBPNIcNBU2GNjBM9L3kiOJrOoCCTl?=
 =?us-ascii?Q?rIqFbSWSmhZo7ggvGs0Pzo/y4JWhoDT8eQd0YGV5Rm1tgkbjlXiDnAbFAOhp?=
 =?us-ascii?Q?/T5V1p4aennLoT7A4as3pD4FOfECeUBbGX6Uwm2cjNsTRfyvmKv7sLOyDnT8?=
 =?us-ascii?Q?DMrp/2rcZvcBkqLZIs8lxglaCL5Y26K0sikVuwvXNwCYNS7ylFBh/SgubF2E?=
 =?us-ascii?Q?wj5kp2AzWK1LrTAJw0m9vsK7hMYBTdb5fIddvar1y7D6KqNZGyVL29mYhz6L?=
 =?us-ascii?Q?g5EMVlkqdGWcsphpCkw50JB5b1j3AkrNV4T1oA3qXkRbWO/rMd3smiu82Gpp?=
 =?us-ascii?Q?/b24uasKbElP5tYiMdjKbyMAySb84YjCpKt0pXjsO9o/wMoMLjpJIsAkBSYe?=
 =?us-ascii?Q?qhWYLQePhIbXXcRq571hG3I32oZOAzig67QLEcViu3tWH9ww57BRT05NYaya?=
 =?us-ascii?Q?rvegmG1Ng3moAfsaKg+0DMWwWO9R1W2WUWg8bGAGCQWmWeYyHmtx+BacRqhX?=
 =?us-ascii?Q?xO4S1WNBIVZBRVPR7RhNDgH5rwmlD22hRDLs0ECGBJksoZjs5WB7Q+/pz0HS?=
 =?us-ascii?Q?vwMgKuKlr/BljS5zjOztF4TtZa2PClBRrM6P3qWYnpf60hEOPYAEorkFNYSb?=
 =?us-ascii?Q?ItpVQbt9ffJL0AdwqQ5tJzeetxtC8C2iVouBarDnYI+btHFr1TZ8onDfUNfX?=
 =?us-ascii?Q?l07YHVpwZJPRt1DbdBSalNR4F1ykgn04+c8pDeu7mwnXjG1gqeH0LSxYCM8Q?=
 =?us-ascii?Q?yDzR+gDyAjZSYCAaPcYIWjK6oBjxmK33KVuZnzKabZ42Qat17xO7g1fNsP+j?=
 =?us-ascii?Q?MmKZCKEF3fLAAOj//5DluhHSmyTM4gDFSoBUU9l98pEWdSPmOYvLVaYeIiap?=
 =?us-ascii?Q?JcjWUq+TIj7QjFc3i0jcMI2vR3q1V8O2/Bj5CjB3l0QwFmQ5NsLreC2ZBB6I?=
 =?us-ascii?Q?TShYP+y8Fb95jbS3Pf/P4CXVsfTUuNIZD7sSoOZPZINmu+KSfzxbeU3VpQTw?=
 =?us-ascii?Q?eO1lJDtRsj6GotkWXm7jAPvgyEptZGazmLAZFFq8YYbtSyDTqJmf28F03uYk?=
 =?us-ascii?Q?IpaCM0D2yM661ha1EUUZJ7+zcP1cOByulgjMs8yDACPdyfNk1fRs8Bv4rhYJ?=
 =?us-ascii?Q?8wm9wK0CrfXcYSoTpvkyNbxx9b1wwVkIKiyguJiuHb7pu9YziuB8Zh06Y84e?=
 =?us-ascii?Q?FILfQRPtX+UdzwvZmzHwrgnD?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b572ea7-a574-4124-0c1e-08d90a58ecce
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:49.7774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IwCTo/rG6/7iX1jfkhVXTv1MWR+69NDXoW9PbXP3PGKfXhgQpT8bMtqwV7zuzL+Q1EtGFg7iX/ZdvFA3N9h32EHSUga7x3OmohkrgSYusbk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6151
Received-SPF: pass client-ip=40.107.0.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

This commit efficiently reverts also recent 705dde27c6c53b73, which
checked .active on io path. Still it said that the problem should be
theoretical. And the logic of filter removement is changed anyway.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block/backup-top.c         | 47 +-------------------------------------
 tests/qemu-iotests/283.out |  2 +-
 2 files changed, 2 insertions(+), 47 deletions(-)

diff --git a/block/backup-top.c b/block/backup-top.c
index 62d09f213e..425e3778be 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -37,7 +37,6 @@
 typedef struct BDRVBackupTopState {
     BlockCopyState *bcs;
     BdrvChild *target;
-    bool active;
     int64_t cluster_size;
 } BDRVBackupTopState;
 
@@ -45,12 +44,6 @@ static coroutine_fn int backup_top_co_preadv(
         BlockDriverState *bs, uint64_t offset, uint64_t bytes,
         QEMUIOVector *qiov, int flags)
 {
-    BDRVBackupTopState *s = bs->opaque;
-
-    if (!s->active) {
-        return -EIO;
-    }
-
     return bdrv_co_preadv(bs->backing, offset, bytes, qiov, flags);
 }
 
@@ -60,10 +53,6 @@ static coroutine_fn int backup_top_cbw(BlockDriverState *bs, uint64_t offset,
     BDRVBackupTopState *s = bs->opaque;
     uint64_t off, end;
 
-    if (!s->active) {
-        return -EIO;
-    }
-
     if (flags & BDRV_REQ_WRITE_UNCHANGED) {
         return 0;
     }
@@ -137,21 +126,6 @@ static void backup_top_child_perm(BlockDriverState *bs, BdrvChild *c,
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
@@ -241,17 +215,6 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
     }
     appended = true;
 
-    /*
-     * bdrv_append() finished successfully, now we can require permissions
-     * we want.
-     */
-    state->active = true;
-    ret = bdrv_child_refresh_perms(top, top->backing, errp);
-    if (ret < 0) {
-        error_prepend(errp, "Cannot set permissions for backup-top filter: ");
-        goto fail;
-    }
-
     state->cluster_size = cluster_size;
     state->bcs = block_copy_state_new(top->backing, state->target,
                                       cluster_size, perf->use_copy_range,
@@ -268,7 +231,6 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
 
 fail:
     if (appended) {
-        state->active = false;
         bdrv_backup_top_drop(top);
     } else {
         bdrv_unref(top);
@@ -283,16 +245,9 @@ void bdrv_backup_top_drop(BlockDriverState *bs)
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
index 73eb75102f..97e62a4c94 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -5,7 +5,7 @@
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
 {"return": {}}
 {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
-{"error": {"class": "GenericError", "desc": "Cannot set permissions for backup-top filter: Conflicts with use by source as 'image', which does not allow 'write' on base"}}
+{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Conflicts with use by source as 'image', which does not allow 'write' on base"}}
 
 === backup-top should be gone after job-finalize ===
 
-- 
2.29.2


