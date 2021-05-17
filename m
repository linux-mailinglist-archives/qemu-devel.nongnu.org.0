Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0243824EE
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 09:02:01 +0200 (CEST)
Received: from localhost ([::1]:45058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liXGK-0007Jh-BT
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 03:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX0F-0003qL-4n; Mon, 17 May 2021 02:45:23 -0400
Received: from mail-vi1eur05on2135.outbound.protection.outlook.com
 ([40.107.21.135]:63681 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX04-0001xR-6x; Mon, 17 May 2021 02:45:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LlTW2qlsRfQVroN5Xl07kmjXpeKPjoQNpKae69UKub7fUgpTg/f+cFWxzEIo6t/3omYKI9tjO+mXVwnyakMvVcpj0niuxiZRLGSo5eBekdggkwN3iiVRdhcP3QfV22ciY8+iIkhOUnM63T1wP6A8nKV2v9QmqM5ClZ1px75XYLjQAHHHu58TuteCeqQuA5xRbWz4gAR9iUq+vo8RhuMPEPxxn89LiOlGmMHlbwWLEp1xQkFbSef6wTzGYnweFDIR7aHu2/uKvcIvCAhuKPvueNERXegEFDtGkoalptASx1qukRICaXGaeMHb5RFMyFie5BQqHXUVqV8pkIMCl07G+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUYWS5ENJfmupLHeAXkGDaTKugf2LxXrwM9Q5mKHtgk=;
 b=bSz/6C3vcZ+rAoJVXHzoDAFkebwESzetse6T2tyAX6KqYKTP71+Gkgjcpiuk3ZXbEqlxsVvVBnMuV8dcBJt+Rjr0dlh9fi73YnBvxIHpmf94s1kfeP2jsfSNKIykywiK7I91HLtnAvSUxu+yvLaFXiCLwGnZzVJqa3ohNbPFt7OHwdIGeedrGS46i1K3F4SE8+pbUdjVKItfDI7gchyUmxG2eitw5HtHbxj9Luk7tSuPLJrDDSVhSiVu1VYKMNvvzltFLgh8jbhzeKCod4Tj1KT6tSrS58Gjkj9suK3UxjsZr31yCNAr9kxglJBaBuhSa1V5tGdZ8kKhmjYweKIUrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUYWS5ENJfmupLHeAXkGDaTKugf2LxXrwM9Q5mKHtgk=;
 b=d5f9soL92Lx6wqYsHh1D6d4zzgNXNIGBlrbd3nGntK234Lqe9xyuTJNrOz8duCmkDCOFVPClC7TlzgTqoTvqnAM2nGuuc7gOhqKnZdl9cB/COcdgU8tmAl3huCI3CpVBU0qwBGVfvuJF9f4986yPHJtCe/0bJTGz7MVZEXlKrBo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4341.eurprd08.prod.outlook.com (2603:10a6:20b:b9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Mon, 17 May
 2021 06:45:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 06:45:00 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
Subject: [PATCH 11/21] block/copy-before-write: use file child instead of
 backing
Date: Mon, 17 May 2021 09:44:18 +0300
Message-Id: <20210517064428.16223-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210517064428.16223-1-vsementsov@virtuozzo.com>
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.231]
X-ClientProxiedBy: HE1PR05CA0275.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.231) by
 HE1PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:3:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Mon, 17 May 2021 06:44:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1596a971-eb10-4a06-cdc1-08d918ff4af2
X-MS-TrafficTypeDiagnostic: AM6PR08MB4341:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4341DEB8C72570801FA7B5C3C12D9@AM6PR08MB4341.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ze+UOyXVz9xH5tBSaxexU4p8/Fa5MbVrOP4Bup0mgdeU5IPqs8mjJWYlFj8nEneZy94G3ptllPPHzQ9DCVhCXveHCRC1HUo0tmsMN/2lNtscftyIgP1Movz1CBvKHX1jepuZzR1RCT5Nyx/y5ksMvGLNikePZbyUKw49FMt6OfYsLxkvnyngFDH887tk3dCCQa/OCT8trh6Ps9ywUQEWBX4K+tELayyDl6zsd5/6VcZcMabSBtvZLDIDfu3IzYafThZrLanpOJrW8HpsdSrxPtOcKC/d8eYndpBN2nm8SvNVrxs8sCZfyL1lHO4/vLNp8heQE4hz3QJ/8DEVfx5zNFYZfnC+apgXF0KkOAu7VnHNodm86Ir/SX2zxcTTd9X+cevi6xjOyCYfEiVouC7HOQzpcm/fy/2WhEkE0o2Gihf/bUxpwBBE3aRudxhw5oUHfRzgdpkstiYpYRZUzwRwgAOa8a2pk5sITMT9a30KLhE7br36HgbJBCoRXjozCu2DmM9q7k8m5jHKXMCbGoiZJf4ahZwRsm1DjsYBb5D3WlodEETEl0/Fewc5+D6sotzRQ05m+ODhZeZV/Nx7qn+barHEy6mTtXUROs4LrbhnA0xXXDV92ZaT0lO/7u9Gdbrxw1X5APwOYihcRIK06mDkqS1nVH9A7O7jyg/Kb9yJ4i99n5xUzL6sSgZnTJHeCbMo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(396003)(39840400004)(366004)(1076003)(8936002)(316002)(107886003)(4326008)(6916009)(6506007)(38100700002)(26005)(8676002)(5660300002)(86362001)(38350700002)(186003)(7416002)(2616005)(6666004)(16526019)(66476007)(66556008)(2906002)(36756003)(6512007)(6486002)(956004)(66946007)(52116002)(83380400001)(478600001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?l+wi2pL2Qvox2gdWn+Mo11n5K84shf9Su96QHlnwLwxBNVd0pCazGMHcRFNf?=
 =?us-ascii?Q?h43QiNvT2vI81ic58n2UAUq5cYdpFfBAWetO9inRtmzF0e6LcPV8zEv89chF?=
 =?us-ascii?Q?bsSlKr2q3joOlpVwq3x/GoS0EUZmjFLZKP1MslW3A+ofrn9fdWMPkise7HGk?=
 =?us-ascii?Q?ErzvAE3lit1AklSbJijdCIYlYskZa9nhcclZJIzQs6QEDIlMN/ZHNKt9qi2D?=
 =?us-ascii?Q?9M6boIZ9M3z5+AXmtfpoVxOYT4NO1VulWyIQPMACY2wGknkOd7FClhctNdln?=
 =?us-ascii?Q?2ENt8uVjU1TsTlqot3/So8witD90zDCwvaazxgwu5Ya47v5ZUG9zDCLVeSd3?=
 =?us-ascii?Q?8m+f/b/uSS1XqHXHpCS65T23kAeYKn8LZKl1bq2D778VOiYEm9C3LNrO4XyR?=
 =?us-ascii?Q?IyNOeHfgnrK+TQZPK9ss8/zFdo1DEMMn6VhfHChERwdxOayLwr8cWaiLFVY3?=
 =?us-ascii?Q?GjRYL8Z1yRhjuO6ZTFMYUbZbxzUqPUx+BW+jRfmAiQCHUf776aPRTkpcLPxp?=
 =?us-ascii?Q?JqbTn34kZG/ssqT6cUBDsDoCWXRYw+Jcc9lUOzw202c5a8e2aVIygSGts2m8?=
 =?us-ascii?Q?6nE4wQdeawxaeV3+aBE5GQECJk7oKF3uBKksoXam5DaPrUAnY853nvTsDbgG?=
 =?us-ascii?Q?1UVf++KHCepA1cyKYSQGW5LEVZ6af9CWRqy6KTtAMvsb18fZDwBmYYSIMacl?=
 =?us-ascii?Q?LzXTRDyZNoWSthEeoGjPMGYXQJzcc11GCdijutkn9bywYciylp0oDeAA+est?=
 =?us-ascii?Q?pGwHxiyLTBCDepYcqbcpnk9xFyFSKy34vIoRuLUG54Bm6p2kgoSN9lKaq1aW?=
 =?us-ascii?Q?BRdZaAE61IfLiMFsi240ggZCIRinepIKhGAVfJ8ysnZEuXmxTQQjJQS+GBdP?=
 =?us-ascii?Q?69rmdydwvI9/j6XQSPqXU9ZqewdB/6uoFtI79RpBNE6SV7urihbuoFnejSIB?=
 =?us-ascii?Q?fWdkZXAPrPGS9ghPXYN6WjFsDpGog5bfZBnEMBePENglkPp8m3kEwogsKWC1?=
 =?us-ascii?Q?vVTmILwG0v+NRWhuEYdlUH7P3eIAmidOXep5cN6Do/a9LJi0pn9pdSvQOmTm?=
 =?us-ascii?Q?rdQXROGtY6CV29tPYn+1wgfVj9BC6+ZWYkKJB4lwD8aMNKoVCD3X7pFTWqcX?=
 =?us-ascii?Q?nVG22ZC9FCjmT1exLAGrdVweied6MYKtSAzsxOvtTf0NadFaf4tXkR/9u0jD?=
 =?us-ascii?Q?ViWm0ysZMEossxtFcUtBNvnaolRLXPyly8X8vxtTqu06YTsl1RLGstUH7GcM?=
 =?us-ascii?Q?UDT+SDezLJx+QEYv9Jpi6taodx81BLTz0ZWUCY55nQl38hCKiykEai7858cL?=
 =?us-ascii?Q?K2yfhu/BnRgI4abYU6ttLoe/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1596a971-eb10-4a06-cdc1-08d918ff4af2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 06:45:00.4143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lSDfHBLps+jOx1UWwnlaDElVXMgIOioifh+YqTKaow6HCvzXsw2mWlS9PIhOXyIYtakR49RxbY+KGfoQf17ldv24JMCp2HiEVCRdZaVdP5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4341
Received-SPF: pass client-ip=40.107.21.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

We are going to publish copy-before-write filter, and there no public
backing-child-based filter in Qemu. No reason to create a precedent, so
let's refactor copy-before-write filter instead.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.c | 40 ++++++++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index af2bb97a30..2f06a524b8 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -43,7 +43,7 @@ static coroutine_fn int cbw_co_preadv(
         BlockDriverState *bs, uint64_t offset, uint64_t bytes,
         QEMUIOVector *qiov, int flags)
 {
-    return bdrv_co_preadv(bs->backing, offset, bytes, qiov, flags);
+    return bdrv_co_preadv(bs->file, offset, bytes, qiov, flags);
 }
 
 static coroutine_fn int cbw_cbw(BlockDriverState *bs, uint64_t offset,
@@ -71,7 +71,7 @@ static int coroutine_fn cbw_co_pdiscard(BlockDriverState *bs,
         return ret;
     }
 
-    return bdrv_co_pdiscard(bs->backing, offset, bytes);
+    return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
 
 static int coroutine_fn cbw_co_pwrite_zeroes(BlockDriverState *bs,
@@ -82,7 +82,7 @@ static int coroutine_fn cbw_co_pwrite_zeroes(BlockDriverState *bs,
         return ret;
     }
 
-    return bdrv_co_pwrite_zeroes(bs->backing, offset, bytes, flags);
+    return bdrv_co_pwrite_zeroes(bs->file, offset, bytes, flags);
 }
 
 static coroutine_fn int cbw_co_pwritev(BlockDriverState *bs,
@@ -95,29 +95,22 @@ static coroutine_fn int cbw_co_pwritev(BlockDriverState *bs,
         return ret;
     }
 
-    return bdrv_co_pwritev(bs->backing, offset, bytes, qiov, flags);
+    return bdrv_co_pwritev(bs->file, offset, bytes, qiov, flags);
 }
 
 static int coroutine_fn cbw_co_flush(BlockDriverState *bs)
 {
-    if (!bs->backing) {
+    if (!bs->file) {
         return 0;
     }
 
-    return bdrv_co_flush(bs->backing->bs);
+    return bdrv_co_flush(bs->file->bs);
 }
 
 static void cbw_refresh_filename(BlockDriverState *bs)
 {
-    if (bs->backing == NULL) {
-        /*
-         * we can be here after failed bdrv_attach_child in
-         * bdrv_set_backing_hd
-         */
-        return;
-    }
     pstrcpy(bs->exact_filename, sizeof(bs->exact_filename),
-            bs->backing->bs->filename);
+            bs->file->bs->filename);
 }
 
 static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
@@ -186,6 +179,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     top = bdrv_new_open_driver(&bdrv_cbw_filter, filter_node_name,
                                BDRV_O_RDWR, errp);
     if (!top) {
+        error_prepend(errp, "Cannot open driver: ");
         return NULL;
     }
 
@@ -201,22 +195,34 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
                                       BDRV_CHILD_DATA, errp);
     if (!state->target) {
+        error_prepend(errp, "Cannot attach target child: ");
         bdrv_unref(target);
         bdrv_unref(top);
         return NULL;
     }
 
+    bdrv_ref(source);
+    top->file = bdrv_attach_child(top, source, "file", &child_of_bds,
+                                  BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                                  errp);
+    if (!top->file) {
+        error_prepend(errp, "Cannot attach file child: ");
+        bdrv_unref(source);
+        bdrv_unref(top);
+        return NULL;
+    }
+
     bdrv_drained_begin(source);
 
-    ret = bdrv_append(top, source, errp);
+    ret = bdrv_replace_node(source, top, errp);
     if (ret < 0) {
         error_prepend(errp, "Cannot append copy-before-write filter: ");
         goto fail;
     }
     appended = true;
 
-    state->bcs = block_copy_state_new(top->backing, state->target,
-                                      false, compress, errp);
+    state->bcs = block_copy_state_new(top->file, state->target, false, compress,
+                                      errp);
     if (!state->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         goto fail;
-- 
2.29.2


