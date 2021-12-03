Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E429D467ED7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 21:32:29 +0100 (CET)
Received: from localhost ([::1]:41988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtFEK-0003Tx-W2
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 15:32:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtF8j-0000mR-Fp; Fri, 03 Dec 2021 15:26:42 -0500
Received: from mail-eopbgr70109.outbound.protection.outlook.com
 ([40.107.7.109]:27177 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtF8X-0001ct-1e; Fri, 03 Dec 2021 15:26:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGvjHj0JasZP3XhpvujiChPMjY++GlVWL6oxE/3NCfUu7+izvjXdvCV+jkEiI6i+A583LYuV3D0vqGFpFV+g+anpbVjbRVtxYoCDRcTbPWg4UllJfyZOfbU3XmVUgIPkZfs6AZIkjuGDfVQ88f4O0G8C2pUv4XCwCZ/xd/xBTWX/1RXPyBH3BRV9w9A/K/NlPmdbCgaqalwgkWCHT4VJex90FsjiOmpSJCqzPIKyjYUp4yMcaWY+agIwoPAz2iRlDxh9eVX2BhtkstQ0GqWqVRPxkJm08tPcnAn+5ckOj6NDMmNHTg4wELAQ6ckBe+WdMerD/6dHSz0moODslerM2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZvGX4zovZ9qw9xr/gKSNZRrvZVtKBZCYKmmnfizP34=;
 b=SO14lw1fwnzbGT9PTr3+HMW18V+RtwsKJSlMOlFYAoKjPvkGy8OBDUMCnPnvqJN6h34DNnCsfyoKNv9xvJSlxfDkdIy/jNupYl1v4DKkGwcbLhakJ/wBgGMxyQn1T0o3rleZsjU1curYuL/CV/y9YjHHryUkw+RNB6oHBRhvc4HzQjwyhOsgL20qgaZwpQfr0f1Vc3JvCbuX4Pj7ynQGc2qEi/PvYlUrkYKOYRKKvY/MWSNx5T8+iHjD2cViHe2bKiTxPNhbAuVpbuZFuG2FIURSAMagC89m9mQBQJxCFEFk/xADICMNHfFZEixjkAes9FTKL9bY54VZePIU4SxMCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZvGX4zovZ9qw9xr/gKSNZRrvZVtKBZCYKmmnfizP34=;
 b=DJKryJ0BE1e7V3SBVsJcbNM+YR8fjCXI58k+W0Vy7x/+RYGYVK/1E0rMj03b8JpjakYYTBCfq4MALe3/gZwV3gHyo8l9IUqrG87BE7Ir1ts2RMRp0Gm/zDqdx+GwsI7n03SZLjqfBWVCzVpLUCAYlXlQkF5tdwSN/jv8O2N7IAo=
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
Subject: [PATCH 09/14] Revert "block: Let replace_child_noperm free children"
Date: Fri,  3 Dec 2021 21:25:48 +0100
Message-Id: <20211203202553.3231580-10-vsementsov@virtuozzo.com>
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
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 20:26:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b6ba73a-c7da-45ce-2e07-08d9b69b2c4d
X-MS-TrafficTypeDiagnostic: AM0PR08MB4068:
X-Microsoft-Antispam-PRVS: <AM0PR08MB4068B50F3259F2A21D5E6699C16A9@AM0PR08MB4068.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BspJ1PfxvMlm+5S48VzN3O6EKUiZsj7L4954Wh3sKAY/nBQoZV5NwsQf6GxbJiV8oncKX4z+S5s/dn56U5W+nAWnjiQ5GR+BzupwsOZOrNa+5vOquS74jJ+ThaEDiLrSRk04gIlnHnpLMHYEz6/8y1NHPJGFGHP+RkUVPTT4+5aIJ9qYjjNXD+nJQbomZd8kQa6AC+pD5iWMClVdFCe4UetHmxfQdwdEuhJ9C4UUfgOTBGtyUzfMz50ulQAQBUiSlIiYjbbImmoQqAa3w2CAMvU8kLpw5xYUq789VoXC3hFOh3l0Ge49xZv93A+tW+dWsLB+ABhamg5jpRvTOT0WRFp2EjB7xaPQ5H7I8zztoHfLE5+pBdYruvoshG8FjdvmG3T7jQ4n1vAmVqczLKtsDQnTCEwEw+hdid5ubpmVpsTwZuPsIhsh1k+kr9yOdnCvZ2EMnle4TqWve7txZRW9thvPgfsupJZ/7tq2RqXx9Dy1S5YKDJ1Jykr90lLJwob6aqpDoSpQccIf8B9ODqqF2zF6vlbn221RX9c7vM9Hsfrvg3rvjPhPtP3Y74VQ7zVLmfKJWTH0ZEMf/+AY2miqUIMlSDRaSmwK6iN8IV8hlg1Oul8ZFwizf9ws72DAB3R3+KLNX08BLL6Q757KKrbN0kVekDJGeNgx3+LrvoDRr4DWR5nXKdZ8ng8QhyYe12qat12WztORwPe8KHqcwnOkjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(107886003)(83380400001)(26005)(6916009)(8936002)(2616005)(66556008)(2906002)(508600001)(6506007)(6666004)(38350700002)(66946007)(66476007)(38100700002)(52116002)(186003)(316002)(4326008)(6512007)(36756003)(6486002)(956004)(8676002)(5660300002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fih13V7O4bbO1rAtHnSRoru82shgk/0+Pj/1e2aaA+HNRSWAVHyDrKDxjZDQ?=
 =?us-ascii?Q?atA2LqXPBxtBfW4hKvI9tmDI3GdQT8HEb86VOrtYEJmdaKqoiBKpTQNoGzOU?=
 =?us-ascii?Q?YdiNYygjzyJt+/tDQ+iIH36+y3sv010OAZ30l3GhaXsjOFwGdhbQvHfGXzRx?=
 =?us-ascii?Q?u0TMeL4ImcAtnThbGiwyInNXlOIR04O3aegUgh7rVDClOBH/CpUTNwXWIBCI?=
 =?us-ascii?Q?auaTj+nAqEh7MCmto5ZgO0IRKu+LfGQQdgH9niFTSDXbjG0xVSU7r+O8lcfr?=
 =?us-ascii?Q?poQ2Fivlmj83lehOPlXQKFAhN6Ri/zA8/udNMXFHT1wet2mHJ2VsnFxvOi8w?=
 =?us-ascii?Q?kdeZnilFQAQ1ECmekqFE2EIK1BmxOjYVAWa4Z04Hfo8CDim8brwTUXLXHf0M?=
 =?us-ascii?Q?NqOUsqDlbOyVpFdsP6cE9xrIyhLvlSbTYaMHzJSOM2m6duIi/tt8nkYRqXk7?=
 =?us-ascii?Q?63+v5a0H7VnLTEYeh1r543fbZiH3U39hFO6nlVjJUv6TywcynyZUnzG5Sap/?=
 =?us-ascii?Q?DPc/Q26qWHAxFCVnpq21pfIfpqtyBJ6GqvzGiv56k9SIkz2ydI8XKHIiBX/Y?=
 =?us-ascii?Q?gChO+NE/XH3z9pfD3TXXB95hk6IlMDp1ErAXrvFYScileHZfXN7ZFMDdAtqL?=
 =?us-ascii?Q?YhrNWHXcLOdYhd/+W2q47reLIfZX00Gl6OpFW2hw4x81erYVoW3OxOElRQHi?=
 =?us-ascii?Q?x0bN4AIreG9FTVj0rvuWMoAhGQbpXW1kwgBRsoH7W/kH8QPlk3Xkm0iVTG2k?=
 =?us-ascii?Q?dbnG3YNGmwI0EVkxwFgceYT0sOLsW3KxmTLcQy84CvxOqfpHqEGEr0uvCDN/?=
 =?us-ascii?Q?XLNkTnYUjzuI62dvhPDcCWn+J1PNFEmfolNuGOLfGj4dmMcdUeI4ngPn/41O?=
 =?us-ascii?Q?ipQvalTvTwiZH8zjPMQnOoi76KkoVomOn8wg5sA3bTiVeV40X4df8FurzQIQ?=
 =?us-ascii?Q?ic1K/VoYq4XB4H49Rb08sRep5uc1QyVe6O4nnf5tH0aCYQJ1HigrL6Jc+hMS?=
 =?us-ascii?Q?dFIjWMSDNy0+LezF6aOPoOXP+nwGi0chQ0M4XB/K47q6U1CFxnXnmy6PCczN?=
 =?us-ascii?Q?7CCSiJHcf7ArPVFkngQJ6eVhc+uUP1ymQSbTV6Ud47g/c7UPBVnFx1bbGFg+?=
 =?us-ascii?Q?+pKlV5y5EaHLD7slxm5Tz++9Jx1Mpgf6cQsWp0G7kWZzFjP985c5yj7FXMSb?=
 =?us-ascii?Q?vYMO4IXQPmMisrNGv1NxqDi8tB9OVkePKcA1OEXcVuEaIvzbxbfg5fw6iytq?=
 =?us-ascii?Q?nszz8s/OW6ZRn8htNPptcwNIm0iOUL4X1eUAqNMmJm30YcFmvsoA93NzWyif?=
 =?us-ascii?Q?ag0mji2LUGpSP3BPRKz4GidmIZnCTi/OFoGoHBUu8L4XhXO7s6qxp5iD4wM8?=
 =?us-ascii?Q?+HVLHUXJnpwIpvE6TYNByfSXqSsSPzFuU2bxURTwr1GLztibZs9AeKOzk9GY?=
 =?us-ascii?Q?uRaqdD9POr2EHOfM248TGhIyJOuMNrOFwCD/NU7s5V5AdfOJ8tqd4gRd+v8w?=
 =?us-ascii?Q?5cu5WS5Z7L0sOCZRXrK42fh2eBDQQAKYwSxFlx1uKlyFip7q1pW8MsGV5Ip6?=
 =?us-ascii?Q?P6RM2QdvSLTkUKmRwaVyFYvc+cR5SNVyl5N3M0Vk1cgeKsftRWNJngVS+oOc?=
 =?us-ascii?Q?2MtNT+13IEYAkb+OUnRV5iXU+e+J1pgI4Z79a2Uj0BxQCS5yqvUxID5DbE6v?=
 =?us-ascii?Q?k/mjmA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b6ba73a-c7da-45ce-2e07-08d9b69b2c4d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 20:26:22.9824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OPhQGGwOo8H4KCVnbkBWC3tzn8Lm7AIh29hF8aSGtR6xsq5K6yFMza+TMvkwaHGiILHquh7DPoLbToq6BSHgbT6g1W6YLPEOB7TdaaKF/1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4068
Received-SPF: pass client-ip=40.107.7.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

We are going to reimplement this behavior (clear bs->file / bs->backing
pointers automatically when child->bs is cleared) in a nicer way.

This reverts commit b0a9f6fed3d80de610dcd04a7e66f9f30a04174f.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 102 +++++++++++++-------------------------------------------
 1 file changed, 23 insertions(+), 79 deletions(-)

diff --git a/block.c b/block.c
index a97720c5eb..69c20c729a 100644
--- a/block.c
+++ b/block.c
@@ -87,10 +87,8 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
 static bool bdrv_recurse_has_child(BlockDriverState *bs,
                                    BlockDriverState *child);
 
-static void bdrv_child_free(BdrvChild *child);
 static void bdrv_replace_child_noperm(BdrvChild **child,
-                                      BlockDriverState *new_bs,
-                                      bool free_empty_child);
+                                      BlockDriverState *new_bs);
 static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
                                               BdrvChild *child,
                                               Transaction *tran);
@@ -2258,16 +2256,12 @@ typedef struct BdrvReplaceChildState {
     BdrvChild *child;
     BdrvChild **childp;
     BlockDriverState *old_bs;
-    bool free_empty_child;
 } BdrvReplaceChildState;
 
 static void bdrv_replace_child_commit(void *opaque)
 {
     BdrvReplaceChildState *s = opaque;
 
-    if (s->free_empty_child && !s->child->bs) {
-        bdrv_child_free(s->child);
-    }
     bdrv_unref(s->old_bs);
 }
 
@@ -2284,26 +2278,22 @@ static void bdrv_replace_child_abort(void *opaque)
      *     modify the BdrvChild * pointer we indirectly pass to it, i.e. it
      *     will not modify s->child.  From that perspective, it does not matter
      *     whether we pass s->childp or &s->child.
+     *     (TODO: Right now, bdrv_replace_child_noperm() never modifies that
+     *     pointer anyway (though it will in the future), so at this point it
+     *     absolutely does not matter whether we pass s->childp or &s->child.)
      * (2) If new_bs is not NULL, s->childp will be NULL.  We then cannot use
      *     it here.
      * (3) If new_bs is NULL, *s->childp will have been NULLed by
      *     bdrv_replace_child_tran()'s bdrv_replace_child_noperm() call, and we
      *     must not pass a NULL *s->childp here.
+     *     (TODO: In its current state, bdrv_replace_child_noperm() will not
+     *     have NULLed *s->childp, so this does not apply yet.  It will in the
+     *     future.)
      *
      * So whether new_bs was NULL or not, we cannot pass s->childp here; and in
      * any case, there is no reason to pass it anyway.
      */
-    bdrv_replace_child_noperm(&s->child, s->old_bs, true);
-    /*
-     * The child was pre-existing, so s->old_bs must be non-NULL, and
-     * s->child thus must not have been freed
-     */
-    assert(s->child != NULL);
-    if (!new_bs) {
-        /* As described above, *s->childp was cleared, so restore it */
-        assert(s->childp != NULL);
-        *s->childp = s->child;
-    }
+    bdrv_replace_child_noperm(&s->child, s->old_bs);
     bdrv_unref(new_bs);
 }
 
@@ -2320,44 +2310,30 @@ static TransactionActionDrv bdrv_replace_child_drv = {
  *
  * The function doesn't update permissions, caller is responsible for this.
  *
- * (*childp)->bs must not be NULL.
- *
  * Note that if new_bs == NULL, @childp is stored in a state object attached
  * to @tran, so that the old child can be reinstated in the abort handler.
  * Therefore, if @new_bs can be NULL, @childp must stay valid until the
  * transaction is committed or aborted.
  *
- * If @free_empty_child is true and @new_bs is NULL, the BdrvChild is
- * freed (on commit).  @free_empty_child should only be false if the
- * caller will free the BDrvChild themselves (which may be important
- * if this is in turn called in another transactional context).
+ * (TODO: The reinstating does not happen yet, but it will once
+ * bdrv_replace_child_noperm() NULLs *childp when new_bs is NULL.)
  */
 static void bdrv_replace_child_tran(BdrvChild **childp,
                                     BlockDriverState *new_bs,
-                                    Transaction *tran,
-                                    bool free_empty_child)
+                                    Transaction *tran)
 {
     BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
     *s = (BdrvReplaceChildState) {
         .child = *childp,
         .childp = new_bs == NULL ? childp : NULL,
         .old_bs = (*childp)->bs,
-        .free_empty_child = free_empty_child,
     };
     tran_add(tran, &bdrv_replace_child_drv, s);
 
-    /* The abort handler relies on this */
-    assert(s->old_bs != NULL);
-
     if (new_bs) {
         bdrv_ref(new_bs);
     }
-    /*
-     * Pass free_empty_child=false, we will free the child (if
-     * necessary) in bdrv_replace_child_commit() (if our
-     * @free_empty_child parameter was true).
-     */
-    bdrv_replace_child_noperm(childp, new_bs, false);
+    bdrv_replace_child_noperm(childp, new_bs);
     /* old_bs reference is transparently moved from *childp to @s */
 }
 
@@ -2729,22 +2705,8 @@ uint64_t bdrv_qapi_perm_to_blk_perm(BlockPermission qapi_perm)
     return permissions[qapi_perm];
 }
 
-/**
- * Replace (*childp)->bs by @new_bs.
- *
- * If @new_bs is NULL, *childp will be set to NULL, too: BDS parents
- * generally cannot handle a BdrvChild with .bs == NULL, so clearing
- * BdrvChild.bs should generally immediately be followed by the
- * BdrvChild pointer being cleared as well.
- *
- * If @free_empty_child is true and @new_bs is NULL, the BdrvChild is
- * freed.  @free_empty_child should only be false if the caller will
- * free the BdrvChild themselves (this may be important in a
- * transactional context, where it may only be freed on commit).
- */
 static void bdrv_replace_child_noperm(BdrvChild **childp,
-                                      BlockDriverState *new_bs,
-                                      bool free_empty_child)
+                                      BlockDriverState *new_bs)
 {
     BdrvChild *child = *childp;
     BlockDriverState *old_bs = child->bs;
@@ -2781,9 +2743,6 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
     }
 
     child->bs = new_bs;
-    if (!new_bs) {
-        *childp = NULL;
-    }
 
     if (new_bs) {
         QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);
@@ -2813,10 +2772,6 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
         bdrv_parent_drained_end_single(child);
         drain_saldo++;
     }
-
-    if (free_empty_child && !child->bs) {
-        bdrv_child_free(child);
-    }
 }
 
 /**
@@ -2846,14 +2801,7 @@ static void bdrv_attach_child_common_abort(void *opaque)
     BdrvChild *child = *s->child;
     BlockDriverState *bs = child->bs;
 
-    /*
-     * Pass free_empty_child=false, because we still need the child
-     * for the AioContext operations on the parent below; those
-     * BdrvChildClass methods all work on a BdrvChild object, so we
-     * need to keep it as an empty shell (after this function, it will
-     * not be attached to any parent, and it will not have a .bs).
-     */
-    bdrv_replace_child_noperm(s->child, NULL, false);
+    bdrv_replace_child_noperm(s->child, NULL);
 
     if (bdrv_get_aio_context(bs) != s->old_child_ctx) {
         bdrv_try_set_aio_context(bs, s->old_child_ctx, &error_abort);
@@ -2875,6 +2823,7 @@ static void bdrv_attach_child_common_abort(void *opaque)
 
     bdrv_unref(bs);
     bdrv_child_free(child);
+    *s->child = NULL;
 }
 
 static TransactionActionDrv bdrv_attach_child_common_drv = {
@@ -2952,9 +2901,7 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     }
 
     bdrv_ref(child_bs);
-    bdrv_replace_child_noperm(&new_child, child_bs, true);
-    /* child_bs was non-NULL, so new_child must not have been freed */
-    assert(new_child != NULL);
+    bdrv_replace_child_noperm(&new_child, child_bs);
 
     *child = new_child;
 
@@ -3013,7 +2960,8 @@ static void bdrv_detach_child(BdrvChild **childp)
 {
     BlockDriverState *old_bs = (*childp)->bs;
 
-    bdrv_replace_child_noperm(childp, NULL, true);
+    bdrv_replace_child_noperm(childp, NULL);
+    bdrv_child_free(*childp);
 
     if (old_bs) {
         /*
@@ -5024,11 +4972,7 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
     }
 
     if (child->bs) {
-        /*
-         * Pass free_empty_child=false, we will free the child in
-         * bdrv_remove_filter_or_cow_child_commit()
-         */
-        bdrv_replace_child_tran(childp, NULL, tran, false);
+        bdrv_replace_child_tran(childp, NULL, tran);
     }
 
     s = g_new(BdrvRemoveFilterOrCowChild, 1);
@@ -5038,6 +4982,8 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
         .is_backing = (childp == &bs->backing),
     };
     tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, s);
+
+    *childp = NULL;
 }
 
 /*
@@ -5080,7 +5026,7 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
          * Passing a pointer to the local variable @c is fine here, because
          * @to is not NULL, and so &c will not be attached to the transaction.
          */
-        bdrv_replace_child_tran(&c, to, tran, true);
+        bdrv_replace_child_tran(&c, to, tran);
     }
 
     return 0;
@@ -5236,9 +5182,7 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
     bdrv_drained_begin(old_bs);
     bdrv_drained_begin(new_bs);
 
-    bdrv_replace_child_tran(&child, new_bs, tran, true);
-    /* @new_bs must have been non-NULL, so @child must not have been freed */
-    assert(child != NULL);
+    bdrv_replace_child_tran(&child, new_bs, tran);
 
     found = g_hash_table_new(NULL, NULL);
     refresh_list = bdrv_topological_dfs(refresh_list, found, old_bs);
-- 
2.31.1


