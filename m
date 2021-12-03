Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E74467ED4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 21:31:34 +0100 (CET)
Received: from localhost ([::1]:38868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtFDR-0001Jn-3l
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 15:31:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtF8m-0000nA-6I; Fri, 03 Dec 2021 15:26:44 -0500
Received: from mail-db8eur05on2098.outbound.protection.outlook.com
 ([40.107.20.98]:1792 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtF8c-0001dZ-4n; Fri, 03 Dec 2021 15:26:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCYJ9KZdy3AjbZmSZdTmqJMRQ9cETZL22ulHHfbCtdF2wWUtR35tFUqBEz43/9It0gH5o9Iw+5iOzEoAu1iEJLLckGsw6BTMwlROEzxdPHalqbjQj3efWKv8TU1E/ayzf/AsgVFrIcWClyqYvTGW1hOHF09Q8EK3VZxD7WBLaYTyRLA7P38KngXrP/xdv5wpMYVk5iLfDVww4iOLXQeBu7vVeAMYw/ro7voPeEyvKl3FqzCM2DVjL3Sc5nyTdlQnPvgHPgh7ZNegbQkIzmLfpdZoD8cNpPNUQvaocB0DgNuJ/epJgTkktdLzihK5T3YV8F/O2mZW9ZvZl15JOebpSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YoUKZY5FKOIdIUZUJQktFcRHljwq+//pgf/6H6t8gh0=;
 b=WDUNJMKU0gz246BKDceqRoep/wcEk6zBO0lSlL+u1T0BRKwwUVjHxD0+7fcZjJuRyoY4VaqCiWxQ6Bn4ffXJ3DwcT+SwvOTMH/eVS3+a3NxcazKERhsPdg7+VgSGtuV9GEgIhWCSuM1jtVCrC2XVsPwlBx589l0KRkP8i4aPgFGMZFPNpdoe0t7UOYUZwS3e7kE5IrGtwHr+DsPxXPl0U9wYkZz27Hg9bWWG+lBKgkfC909mTpOm9n5ZA/sJksMO7RDyJIVcQMJMgu2XlLJp30OfEcsqAaTNMpNfssAi5SwlE2bgZ6BH8SAp3OgxgCyFJEkVyeVzQMFVHhbCzxP2gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YoUKZY5FKOIdIUZUJQktFcRHljwq+//pgf/6H6t8gh0=;
 b=g/W55+TO1fdoKZJujuajnqBsQEVyBg/HYmPatYWl8JCupqgRuDDwVqmJs59Q0kpuNHMQdWccyC06Gd2AsIfzUKmZWwuIexaBcIypsEVtx1q6Rgi+bjxwRGOy2z8TB0WkWtTsiy6kECKh/CnCQlXMUacDN2IZbjBoAlT0nlvWpy0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4068.eurprd08.prod.outlook.com (2603:10a6:208:12b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Fri, 3 Dec
 2021 20:26:23 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 20:26:23 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH 10/14] Revert "block: Let replace_child_tran keep indirect
 pointer"
Date: Fri,  3 Dec 2021 21:25:49 +0100
Message-Id: <20211203202553.3231580-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211203202553.3231580-1-vsementsov@virtuozzo.com>
References: <20211203202553.3231580-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 20:26:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85dc4410-e055-4633-4105-08d9b69b2c96
X-MS-TrafficTypeDiagnostic: AM0PR08MB4068:
X-Microsoft-Antispam-PRVS: <AM0PR08MB406868C4E42DA11A1559153CC16A9@AM0PR08MB4068.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zPdUrSEHPfbOPb4O9Lg6G6ygvU3OZD1lKsEtZavtJGEpuy3r1WedHS49wraCHPnNXU3SI16w40zK5YU76yEJtmUj69tdvsUu1gocdpW+c4qju9eibHj4D1PfUzLf2kcaObOyhqaWB6mZSOZCG0igIv/Ymr0I8RFjwYW5wmn0HlIeAnGvIazqGWKixqsVtqvedkfbbGoKz984uhRc1lTgMoWo822bjlndJY2GjyLxkohcL8GErV0B0mQQSLGCk5CVwA5RViHd/BjCY1MBN3Kd0gCOovRJ935Vs+nyfcb2E42r4MPMR5c0FFCloAS1KQHVjJomkaBxb3ub+zfVU3jQSjfm8Vj7hMzT+37OmGW0vhsIryT2OObXCwFJBua3oh1sIkVLkFK1vI2EJ/Y7x9rcu0GlCJcMKN+YVbrhiFwoTQPcJMrqyh7wSJ+NiGBtHT0DANRKDtWzoNRKuIc0JcA5kVVmcUrUv6tgVliOKI31G5I2cgAbg7LaPyz1ZwIABeFtPLXzH4sOHhix2qV6C3KBrNWiGZJv/uXnnnpwE8JMzjUWY6krRsssEjKdtEnXhJAJWU9H+aM5BiLoQpLcNTm3aOVzcUdt7fCaSDLZPTBqVbOUEh/LZ1HmuhzwKipKMD9d2oqh/TmbXZ82IxCVB8s94yOFXuWa580CFIya9/I7qJ9mMSq61aMVsL+BglBBOgwa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(107886003)(83380400001)(26005)(6916009)(8936002)(2616005)(66556008)(2906002)(508600001)(6506007)(6666004)(38350700002)(66946007)(66476007)(38100700002)(52116002)(186003)(316002)(4326008)(6512007)(36756003)(6486002)(956004)(8676002)(5660300002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1GC2dVttmgnlqBbPnpMqMVv8n1jrlWHSqb5JRFkunbwrtieT+dQtivyGeQ/d?=
 =?us-ascii?Q?amkh2VsN/aAwB2GFIx0xJmN/DXevCWIjQwh+QWb4eYM+D3Wz+T500XYnlXv9?=
 =?us-ascii?Q?mlErQj1p1Rr2eZ6YGnnu1s0QO3XAv3U5agb4KCX6PKiko0DnnaQCSC52zRf3?=
 =?us-ascii?Q?m3YfoxRDg4PaKv18GeryDoZ6ObzsnOJmPOy9SxhInMiTSU8m8wcsNsFaU+//?=
 =?us-ascii?Q?itFBwS+y91HDo9t7KZxQYijLlTr5s+NnHN0tzs6+X/97lRyAmU5ADPZQa7Uy?=
 =?us-ascii?Q?0IVPRU4eP8c3WFKDv34m6VWAwu59kZQthewjMTMglQ1eXRiBad2o7jbC5oxJ?=
 =?us-ascii?Q?NkPPLfEb0lBhmcOu6UTKskKNIiEOrjmfx4l6wgdQPOC/Wl8ti3Y69mXONj7u?=
 =?us-ascii?Q?bxz45SPVJAtTJvqVq7a7c8O9abehpewBS16fAUFFhli3jByedoLSpgFBS9G+?=
 =?us-ascii?Q?7HtVd7Xegdg9MPhtZ3kOG2MJixHzsBgJG6M7RAurUWoNAZEeFkjvBdz9LOR4?=
 =?us-ascii?Q?w0UjXDVR+kPwRUgHXA+VM8XMpMITCDO6acdXx/tEoa8y4pAwx++gFvaNKUNW?=
 =?us-ascii?Q?8o5jeOCVFtUK8CQrgPjtBkgZh85lnGPn7K3HpOO+s2lHvNuYvkUUBPGIiTth?=
 =?us-ascii?Q?PCFKvJlXLyRQgxOxvM2DkS79UtGzYiaXoli+J0nqzkE19fhtlfWjnqHksAdp?=
 =?us-ascii?Q?Lz/jD8UZnR4d07hBhEYzi415NqctsitbFxiudJMeo942tHyIvxzo/fWx+HpH?=
 =?us-ascii?Q?EfNIBFHrhP0oETHJNr3ZYmeGRHv+czxCqihWPK4iHTtFQSjfBCS4rsD+3CvW?=
 =?us-ascii?Q?00t5HxN692NVeDd9l2JYn0+HX/FyTCT4mMjtnFnE+7kwC2NjWx8mXm/xBXaW?=
 =?us-ascii?Q?lwpG3xGbkmYyGhpSWgj6MC9/ndleRO6j5aTqXGgnxMCzKHdoj2k+O+IZSeTV?=
 =?us-ascii?Q?a8osC15FnAmx6BlgogCd4Mk5EeyXVgGbbLMm8lDnbMmp5jAtWd/Zw0rKCTZS?=
 =?us-ascii?Q?7lK6gCEMaNDqW8FXOSFKNMtxRNUiNqaiT6oWaLI6qdA+YSmdCj5R6Ap83eFC?=
 =?us-ascii?Q?haZYF7kWfjn+xsnVJBX15R8bEOl1MEmjFUliW52M6BhKm5tinE84iiv4odR8?=
 =?us-ascii?Q?dihXXeIq44i65tzlFEoIp6saWUIw0e0E2Gy8LhEEt3hLANOyrOc1Su636ElT?=
 =?us-ascii?Q?EZMD5Juw/A1O8vMV7jNRs9i/kjXVkd2kyQF4ExCnFs/V3Ei8+4n2/coRZuS7?=
 =?us-ascii?Q?yQH0M45SYy1P0eszbuFTRjGfA2QFsrXxCUz8NLNhbmj6gHZNPKaL1SR8JORi?=
 =?us-ascii?Q?J6bZ5AcZ5CfVDKm+5Dxm0uBOLzttC394agcxregTU9JyQidRi8bgfixfDBzr?=
 =?us-ascii?Q?cEWTGgpIzpndI9LOAEgtJZzyovlUHyZ6/+x1zDgo3qss5nz3XhowGrYay7sO?=
 =?us-ascii?Q?mmNPRsHY4f/GVbznRSDt+hqAd6urA8MKWHg9GUp3hLYPpiMYLJZhj4FrNJNX?=
 =?us-ascii?Q?+RXL/tr5ovVEQJXj6clBpIb5cHbRo7PlIjysjWDzFrlh81d8Jr642NZFmQDJ?=
 =?us-ascii?Q?BTSRuHRpjIrLo8AMBFEcIUnve/3/bHw6p7cytxqxgU0i2bDe0UtcbyC5LpIL?=
 =?us-ascii?Q?7Gyk3lBYSOqNTJrYcf4ZgwGKxeuxCk/p1QNNNzSZEJtRcwqh+/cv4roXOUJV?=
 =?us-ascii?Q?CVI9ow=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85dc4410-e055-4633-4105-08d9b69b2c96
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 20:26:23.6226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2MutPTBoHE77D2fvqFiSroTglmtwAQpAW3dFN8Er8asdkENK8Eit2Iae+ToZooT8TNaiy+sMqaWOBkNML3gu8s+kD4v55fBdwKgGAHpLtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4068
Received-SPF: pass client-ip=40.107.20.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

That's a preparation to previously reverted
"block: Let replace_child_noperm free children". Drop it too, we don't
need it for a new approach.

This reverts commit 82b54cf51656bf3cd5ed1ac549e8a1085a0e3290.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 83 +++++++--------------------------------------------------
 1 file changed, 10 insertions(+), 73 deletions(-)

diff --git a/block.c b/block.c
index 69c20c729a..3eec53796b 100644
--- a/block.c
+++ b/block.c
@@ -2254,7 +2254,6 @@ static int bdrv_drv_set_perm(BlockDriverState *bs, uint64_t perm,
 
 typedef struct BdrvReplaceChildState {
     BdrvChild *child;
-    BdrvChild **childp;
     BlockDriverState *old_bs;
 } BdrvReplaceChildState;
 
@@ -2270,29 +2269,7 @@ static void bdrv_replace_child_abort(void *opaque)
     BdrvReplaceChildState *s = opaque;
     BlockDriverState *new_bs = s->child->bs;
 
-    /*
-     * old_bs reference is transparently moved from @s to s->child.
-     *
-     * Pass &s->child here instead of s->childp, because:
-     * (1) s->old_bs must be non-NULL, so bdrv_replace_child_noperm() will not
-     *     modify the BdrvChild * pointer we indirectly pass to it, i.e. it
-     *     will not modify s->child.  From that perspective, it does not matter
-     *     whether we pass s->childp or &s->child.
-     *     (TODO: Right now, bdrv_replace_child_noperm() never modifies that
-     *     pointer anyway (though it will in the future), so at this point it
-     *     absolutely does not matter whether we pass s->childp or &s->child.)
-     * (2) If new_bs is not NULL, s->childp will be NULL.  We then cannot use
-     *     it here.
-     * (3) If new_bs is NULL, *s->childp will have been NULLed by
-     *     bdrv_replace_child_tran()'s bdrv_replace_child_noperm() call, and we
-     *     must not pass a NULL *s->childp here.
-     *     (TODO: In its current state, bdrv_replace_child_noperm() will not
-     *     have NULLed *s->childp, so this does not apply yet.  It will in the
-     *     future.)
-     *
-     * So whether new_bs was NULL or not, we cannot pass s->childp here; and in
-     * any case, there is no reason to pass it anyway.
-     */
+    /* old_bs reference is transparently moved from @s to @s->child */
     bdrv_replace_child_noperm(&s->child, s->old_bs);
     bdrv_unref(new_bs);
 }
@@ -2309,32 +2286,22 @@ static TransactionActionDrv bdrv_replace_child_drv = {
  * Note: real unref of old_bs is done only on commit.
  *
  * The function doesn't update permissions, caller is responsible for this.
- *
- * Note that if new_bs == NULL, @childp is stored in a state object attached
- * to @tran, so that the old child can be reinstated in the abort handler.
- * Therefore, if @new_bs can be NULL, @childp must stay valid until the
- * transaction is committed or aborted.
- *
- * (TODO: The reinstating does not happen yet, but it will once
- * bdrv_replace_child_noperm() NULLs *childp when new_bs is NULL.)
  */
-static void bdrv_replace_child_tran(BdrvChild **childp,
-                                    BlockDriverState *new_bs,
+static void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
                                     Transaction *tran)
 {
     BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
     *s = (BdrvReplaceChildState) {
-        .child = *childp,
-        .childp = new_bs == NULL ? childp : NULL,
-        .old_bs = (*childp)->bs,
+        .child = child,
+        .old_bs = child->bs,
     };
     tran_add(tran, &bdrv_replace_child_drv, s);
 
     if (new_bs) {
         bdrv_ref(new_bs);
     }
-    bdrv_replace_child_noperm(childp, new_bs);
-    /* old_bs reference is transparently moved from *childp to @s */
+    bdrv_replace_child_noperm(&child, new_bs);
+    /* old_bs reference is transparently moved from @child to @s */
 }
 
 /*
@@ -4898,7 +4865,6 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
 
 typedef struct BdrvRemoveFilterOrCowChild {
     BdrvChild *child;
-    BlockDriverState *bs;
     bool is_backing;
 } BdrvRemoveFilterOrCowChild;
 
@@ -4928,19 +4894,10 @@ static void bdrv_remove_filter_or_cow_child_commit(void *opaque)
     bdrv_child_free(s->child);
 }
 
-static void bdrv_remove_filter_or_cow_child_clean(void *opaque)
-{
-    BdrvRemoveFilterOrCowChild *s = opaque;
-
-    /* Drop the bs reference after the transaction is done */
-    bdrv_unref(s->bs);
-    g_free(s);
-}
-
 static TransactionActionDrv bdrv_remove_filter_or_cow_child_drv = {
     .abort = bdrv_remove_filter_or_cow_child_abort,
     .commit = bdrv_remove_filter_or_cow_child_commit,
-    .clean = bdrv_remove_filter_or_cow_child_clean,
+    .clean = g_free,
 };
 
 /*
@@ -4958,11 +4915,6 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
         return;
     }
 
-    /*
-     * Keep a reference to @bs so @childp will stay valid throughout the
-     * transaction (required by bdrv_replace_child_tran())
-     */
-    bdrv_ref(bs);
     if (child == bs->backing) {
         childp = &bs->backing;
     } else if (child == bs->file) {
@@ -4972,13 +4924,12 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
     }
 
     if (child->bs) {
-        bdrv_replace_child_tran(childp, NULL, tran);
+        bdrv_replace_child_tran(*childp, NULL, tran);
     }
 
     s = g_new(BdrvRemoveFilterOrCowChild, 1);
     *s = (BdrvRemoveFilterOrCowChild) {
         .child = child,
-        .bs = bs,
         .is_backing = (childp == &bs->backing),
     };
     tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, s);
@@ -5004,8 +4955,6 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
 {
     BdrvChild *c, *next;
 
-    assert(to != NULL);
-
     QLIST_FOREACH_SAFE(c, &from->parents, next_parent, next) {
         assert(c->bs == from);
         if (!should_update_child(c, to)) {
@@ -5021,12 +4970,7 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
                        c->name, from->node_name);
             return -EPERM;
         }
-
-        /*
-         * Passing a pointer to the local variable @c is fine here, because
-         * @to is not NULL, and so &c will not be attached to the transaction.
-         */
-        bdrv_replace_child_tran(&c, to, tran);
+        bdrv_replace_child_tran(c, to, tran);
     }
 
     return 0;
@@ -5041,8 +4985,6 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
  *
  * With @detach_subchain=true @to must be in a backing chain of @from. In this
  * case backing link of the cow-parent of @to is removed.
- *
- * @to must not be NULL.
  */
 static int bdrv_replace_node_common(BlockDriverState *from,
                                     BlockDriverState *to,
@@ -5055,8 +4997,6 @@ static int bdrv_replace_node_common(BlockDriverState *from,
     BlockDriverState *to_cow_parent = NULL;
     int ret;
 
-    assert(to != NULL);
-
     if (detach_subchain) {
         assert(bdrv_chain_contains(from, to));
         assert(from != to);
@@ -5112,9 +5052,6 @@ out:
     return ret;
 }
 
-/**
- * Replace node @from by @to (where neither may be NULL).
- */
 int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                       Error **errp)
 {
@@ -5182,7 +5119,7 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
     bdrv_drained_begin(old_bs);
     bdrv_drained_begin(new_bs);
 
-    bdrv_replace_child_tran(&child, new_bs, tran);
+    bdrv_replace_child_tran(child, new_bs, tran);
 
     found = g_hash_table_new(NULL, NULL);
     refresh_list = bdrv_topological_dfs(refresh_list, found, old_bs);
-- 
2.31.1


