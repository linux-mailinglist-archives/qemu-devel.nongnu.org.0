Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5833E01D3
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 15:20:43 +0200 (CEST)
Received: from localhost ([::1]:49782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBGp8-0005SA-ND
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 09:20:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBGmi-00021Z-Ft; Wed, 04 Aug 2021 09:18:12 -0400
Received: from mail-eopbgr30097.outbound.protection.outlook.com
 ([40.107.3.97]:60758 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBGmg-0005Qa-VO; Wed, 04 Aug 2021 09:18:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6wZ5cTDDivrkaIfP38w2P7Em5MT8RTLIF7j+IcYToN8LZj70KXsM+5kauImeuY0W4oTmzJ1aZnNrovehL6EIcw5mig6UVsZmghTohPwbD9rAsQ78WeMqEdYp5YsPvOQc0amnfhrXxa2x4BcN7Xh+vZYF7vIXyVJEUhdS54YRRfs82Q4dCFZ94+AXSUTKzdCvlZzGK7WhyIbJeYYgCqtuy5uLEl8DoOPveUoVwqgINspydWBCNK82/Mr6NT3QzLW8jNIHPIPHdbhYf9rlTFcMx4oeaAnQoO5RWvUjaTiYCZdf7/0u14ow2RYZSrffe2On0TcYacwqWkKLV9aEPnG7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ATt7ZKx8+/fxa/WqgVtbWqdpc8xEmDyoZJiXkSZVPK4=;
 b=UPfQibr9bGrLBUUUZAauut2p9VQvr3BXPMIWqan+5sHg5aj5sZKOKyRw5VgfURqZDwXuUZZjzqK4uWCRZhx5vsMnPLVNsl2tJOjSHXAcgWJPZqCJSvEJYa+OvxPwSExWVTpq8DE+dV9m3Oui739XrTTGiq/dq5bxaqxfeATj7Yuvns63hrGa1RYDWxVQplAAxSLOB5kph1ZeJXySYrqP+8OEBFU03psaFk+i4tE5XJczPVymLNZG3Z8kon4zOzj+kfDjjuSUjdo0Zv7cAkoD0qFgZpePkfu0wWFgYdPy2+Mee0pMy2h09VM6kgY8L6x6J8Olj3bSSqvQE5hT3Azg8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ATt7ZKx8+/fxa/WqgVtbWqdpc8xEmDyoZJiXkSZVPK4=;
 b=Y/WC1/XgdSEpvEpc/iy1PcnpR3P4Sd9fWHgexBXXE0d/cAcBbQRNHAuRdUxgPrs0cIOnSV0/WqJVYXv70aPRyVB3PAA8lOR8DKV11R1IRzp/Temib58hi9tlsVPaVdvI+K5f2zo5zNirqfrkcJ3gOTyFX2TT8H8yt5GD6yin6vg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2034.eurprd08.prod.outlook.com (2603:10a6:203:4b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.26; Wed, 4 Aug
 2021 13:18:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 13:18:06 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, mreitz@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, kwolf@redhat.com
Subject: [PATCH 02/11] block/dirty-bitmap: bdrv_merge_dirty_bitmap(): add
 return value
Date: Wed,  4 Aug 2021 16:17:41 +0300
Message-Id: <20210804131750.127574-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804131750.127574-1-vsementsov@virtuozzo.com>
References: <20210804131750.127574-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P192CA0003.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::13)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P192CA0003.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 13:18:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d6f6608-3771-4f54-7163-08d9574a4bd6
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2034:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB203450E2FEC17CB0EC6EC0B9C1F19@AM5PR0801MB2034.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:115;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4u8QFKlB86Q4brFytqYlTdfLgTXxAokVfMqiU2do/a6/vNqIVDOBVOQwFstlHmdfC1QWGCQJPKhNmXfzxykTG86teRVwQk3Zz8epcpUjHckYiNmy5Z4M6sHm5m6tQFj6rj3aInLoZBCPZb/4/UJ6FLKmND1dsLeTRhddXMhonnJfFcRi7gonH1FvveQyaws2BJDPZCYsJvia0qCUXVYK0sqXedJqXyMqC2YbnXMNWLv1x1H39yJ+6LSGIFZe/qpUjMmYXfFVhTbtCBw/7cVWiHF4mLn53T5CCroDtXs+d8Y/7Xmvhz4WBjBbquZeUgCOqt1us4jexY6xSSQzyuIBzjW+vlqPgHhOLs4hzGECPuCsDYk0qxmNr69zmTQmd2qcgtUWoMzqJLZ3axlxjqTwHYwhzp8b5OcSe6LtThAkT6y4pKK7NCDO2gsL0f+/YkqdShqj3KgVDGDvlsd+lSUBz5MJ61w/IO39sgz9k3rHsiDRiLojCbmZ3EerFMkDhp/N7QYyu8ehk89OYdKWRj9lzebxJwPw55YFE7Gs6kMkPJ6T9INUQ7ywr90u+QaMOPeZQakE3U4+vA/x/lKP42lBJ7n5Jj2pjMRimZytOaA7GcayxYMfhSMrEo9dqLph7cmuYMV4Wuw1TjuwKd+FWG8UolEGh1G7xnKRx/JC4VJmpahEFD2lXp2SK8k0H/iGlNnmYa8VX0JZPVVZ9SOn9HNQMZQ3xcwliDOPI8N6FYinkts=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39830400003)(366004)(136003)(346002)(5660300002)(6666004)(6512007)(478600001)(83380400001)(1076003)(4326008)(66946007)(66556008)(66476007)(6506007)(36756003)(38100700002)(186003)(956004)(2906002)(2616005)(38350700002)(316002)(6916009)(8676002)(52116002)(26005)(86362001)(6486002)(8936002)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yCt0lE6rl3EdT5rmi4PazKelAvxjuCYCE5UBkXWpwdKUBnqCyrGyVAwxUbrF?=
 =?us-ascii?Q?S9PpP/GBP6HYFmeXyb4ug5MChGh/XfYIc/RnFNPs4gFZzeT850w3TdKsIi4Z?=
 =?us-ascii?Q?E0SH4ISgREGzMWYC7L63ElfQBYtPJ8Bki+tXDLc0Q4ZTAP87sb8JnXUGveit?=
 =?us-ascii?Q?8tBggzNLSGJrnuVx6wTdaYc/Ml5WPY+kaqcYuROlNfMyUe9/+jBB3nTrW3hz?=
 =?us-ascii?Q?81jZs4nUtRVCSpXl46jRFwrOp+5Jy1NAefSHAIBdlGCTWQRHExWX0UBVSDnX?=
 =?us-ascii?Q?xdQ7iDdeO6jkDOe6keWk7TLfkHZySk40xEw4Dqw+YGKFBTB+DQjPbW99mgqm?=
 =?us-ascii?Q?TrxQV4dX7/9UyUh9nJLjvA+C2bjtvB8FMmHSj5sOPzlKGZwZjyhUX/CONN+P?=
 =?us-ascii?Q?f064EgDnBSS+Ld9f/dLoBd/rh1vhmp0K9wc+2X7rpSPOBrOLMclNOmois2NQ?=
 =?us-ascii?Q?eMhTmKy1kpa40srIFswx2KBXCXNdTLY5TkalPNX2eVYhi/bXsmWqrfidxiA8?=
 =?us-ascii?Q?RFUInR3lQ5QGOb9VNgrtU8ZSJYEps2i/37XbHVq11oStRTpxrt0KGmzU9Spk?=
 =?us-ascii?Q?rYaZ6iAXTtvozSgmtlQXCJt68sPn+/7/BtmBrirs3+duPcwoGxG9M+qsgYT+?=
 =?us-ascii?Q?15uayGrjW4c5fupFB7TqG/af8a8zl1nPQWMZ8f5zb0uyuH4LJ8J0+WpbsCcD?=
 =?us-ascii?Q?vEMy50Ayv3zxI2+kTqU7Pkbu13eYfZ7+MrrYFwy1kE8+FZQkO4uvVW5vB1Sd?=
 =?us-ascii?Q?kyUU8hFOXZOS0LdKwnOlpvyI2qYhjCcRh6K9HU534I5GHhb7iGE1ssBtmu2u?=
 =?us-ascii?Q?XFyjSbhMATbKcJ1auOV+HJpWngDl88sFyJsnZu6NdcD1ZzsX6AA5cCiiY/Qr?=
 =?us-ascii?Q?HAQj6sdXkTIZ2Gzgw7r0jlp9J0hZSNKHvqjDcLzDWaGXC+eXSuokLVwRVwmP?=
 =?us-ascii?Q?OWh4XIe63vUx+f8iAs07FazlNw4lUkjnJG5pE05OqldOr/oJ5pisIw09GTpd?=
 =?us-ascii?Q?jfs2dVGvIFFS9l3jGapNEnmzh4PolTL6KVElxLkzcJ4dNqkY3jMiC1Np6lkY?=
 =?us-ascii?Q?pdNLBxJO6emOM+D6jsIcHeTGXf72a1T46Xg0QdYwSc8dLHw0zF6I6UpP3Pzo?=
 =?us-ascii?Q?2g5aWxp5InaEdauupRzcc6cBlb90CuhttTp1GrfHd3pLWLkzid1hf+MveODq?=
 =?us-ascii?Q?1nZsblq74mlkzRp3/p+lBzobnawj0WDKzvdHo7XKeH27KZyhxj17Kz4b53Eh?=
 =?us-ascii?Q?GJ8/HXxuG6jZwC4+U176nkjGtsOX2pDFRJW/M+W0pY8Nn6C0Reldyh71AkWs?=
 =?us-ascii?Q?0KDMnzOk36Dzz+kVchlXA9sB?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d6f6608-3771-4f54-7163-08d9574a4bd6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 13:18:06.2879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQyP04q1qVEc9va2RH3wXYB6129yu8pFgSfWtI9SniiaAiYpyC073NpjfYZtjLMUaKibYzbevLDjuVeOIAM4w5BB+kB3YEerIFC9SvehNNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2034
Received-SPF: pass client-ip=40.107.3.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

That simplifies handling failure in existing code and in further new
usage of bdrv_merge_dirty_bitmap().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/dirty-bitmap.h    | 2 +-
 block/dirty-bitmap.c            | 8 ++++++--
 block/monitor/bitmap-qmp-cmds.c | 5 +----
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
index 40950ae3d5..f95d350b70 100644
--- a/include/block/dirty-bitmap.h
+++ b/include/block/dirty-bitmap.h
@@ -77,7 +77,7 @@ void bdrv_dirty_bitmap_set_persistence(BdrvDirtyBitmap *bitmap,
                                        bool persistent);
 void bdrv_dirty_bitmap_set_inconsistent(BdrvDirtyBitmap *bitmap);
 void bdrv_dirty_bitmap_set_busy(BdrvDirtyBitmap *bitmap, bool busy);
-void bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
+bool bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
                              HBitmap **backup, Error **errp);
 void bdrv_dirty_bitmap_skip_store(BdrvDirtyBitmap *bitmap, bool skip);
 bool bdrv_dirty_bitmap_get(BdrvDirtyBitmap *bitmap, int64_t offset);
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 0ef46163e3..8f8b428baa 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -881,10 +881,10 @@ bool bdrv_dirty_bitmap_next_dirty_area(BdrvDirtyBitmap *bitmap,
  *
  * @backup: If provided, make a copy of dest here prior to merge.
  */
-void bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
+bool bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
                              HBitmap **backup, Error **errp)
 {
-    bool ret;
+    bool ret = false;
 
     bdrv_dirty_bitmaps_lock(dest->bs);
     if (src->bs != dest->bs) {
@@ -907,11 +907,15 @@ void bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
     ret = bdrv_dirty_bitmap_merge_internal(dest, src, backup, false);
     assert(ret);
 
+    ret = true;
+
 out:
     bdrv_dirty_bitmaps_unlock(dest->bs);
     if (src->bs != dest->bs) {
         bdrv_dirty_bitmaps_unlock(src->bs);
     }
+
+    return ret;
 }
 
 /**
diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
index 9f11deec64..83970b22fa 100644
--- a/block/monitor/bitmap-qmp-cmds.c
+++ b/block/monitor/bitmap-qmp-cmds.c
@@ -259,7 +259,6 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
     BlockDriverState *bs;
     BdrvDirtyBitmap *dst, *src, *anon;
     BlockDirtyBitmapMergeSourceList *lst;
-    Error *local_err = NULL;
 
     dst = block_dirty_bitmap_lookup(node, target, &bs, errp);
     if (!dst) {
@@ -297,9 +296,7 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
             abort();
         }
 
-        bdrv_merge_dirty_bitmap(anon, src, NULL, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        if (!bdrv_merge_dirty_bitmap(anon, src, NULL, errp)) {
             dst = NULL;
             goto out;
         }
-- 
2.29.2


