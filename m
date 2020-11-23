Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DECF2C169B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:38:37 +0100 (CET)
Received: from localhost ([::1]:45036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khIbc-0002R7-Hn
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:38:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khIDM-0004YA-Et; Mon, 23 Nov 2020 15:13:35 -0500
Received: from mail-am6eur05on2111.outbound.protection.outlook.com
 ([40.107.22.111]:23809 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khID9-0007Ry-AT; Mon, 23 Nov 2020 15:13:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=etKECTe2VHHG9CoOCddB1iixtzqg0wtQAfy3ZJdXc5NovAUuxkMfIXY8G9zbIyLmXLIrsSYcal4Xb9TTI5lLXdyWMaawkQYKobCJHbjYxEafk0uQpIevZqcaulqJeBGM3jf6yQ0OGlc1qOnUd+hkuBUALGR74vZTbBh+JRHY0nmiwpKdjs/DXBFHbIDGF7mL4eC1bhqaiurGl8QD6BRRCFIbS/DAlJ/wjkKn+i8OQ05m/m8redajwlPbPBGNwxRrnltvEntdj5v/B2HzqmE0cyUQ1gM+MxCeeHhoyy4UlbMUc9+/TynSztQf1bweDqNYxSI4XIzpr/cUtVMk2HtNKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVmjpa7LTHgNOBNitCpJ9E5Q/qPVoferWTy/gxqgDCA=;
 b=RUSZZu0I7NWpKpFuC7MaXwdbslTmd2rpc7Yc9jyHA7lV0vjnS4YmNh/c/8dqUJIiw51+YMgK5OdQuaaxXV+TrkegVJ0n8BPNnwYgoQzl5zxnB9P/QIZ47s2e/YITwH08lt6VkcYufkV/o1hhlu/cHgWPb/rn4gHTgypTPLaNUuS27fTAKwkLbW+gyUThJzQJ0l6ASArR7tlJYTtdaTCsSQ3qHQmgKta3QI7ciAEkWir7xL4GsBUqWmapwi3bWXXZNiy+ZRTYMR2pqqkmCmge+tPLr7+rZQ/qfkrUFEM2aTcdMToGXWwsBjHqXkGreiVdNwth/31sdDlinF7vPSc97A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVmjpa7LTHgNOBNitCpJ9E5Q/qPVoferWTy/gxqgDCA=;
 b=n33Yc08DYvXmRUO2VnepPerL+n4cj3eBXA3nGtHV4qZzU9xXRQQjMK6QO05cZRmEhynyRgrCgO4+Y9pyweeH9+b+un2dLEek3qHWxzp/8n98wiSznX+zG3sHtrb26iJN22B4iiYIIAYxhl0v4w6kaK6Aoun+vikcSMzFfqTYgWA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4690.eurprd08.prod.outlook.com (2603:10a6:20b:cd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:13:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:13:07 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH 18/21] block: adapt bdrv_append() for inserting filters
Date: Mon, 23 Nov 2020 23:12:30 +0300
Message-Id: <20201123201233.9534-21-vsementsov@virtuozzo.com>
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
 15.20.3589.21 via Frontend Transport; Mon, 23 Nov 2020 20:13:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a25386c2-aac5-4641-9690-08d88fec30f3
X-MS-TrafficTypeDiagnostic: AM6PR08MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB469022309121DD268347534BC1FC0@AM6PR08MB4690.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mEjISHwFEl5eaAiYuD0k3ZQmoYETrxKemn4Z/aV4jBD1Qi6fJ8UaO3cZLTGpJX+p0+JTqOobsmA8l8iUnvyjSVecZ+dkPGDCD3M83d1HRgfwvT/wDbphwoPjRy4bmgxKizbIrDU6O7+UnY0pBsEB8EK3rvjtbZcZUEV9RRA7x+ve+3pXMSQ8yiGSPCynfPhC1nvUsZx2LI9mGcXfFZxl/Nj++5QKykGVVZSIb+rxQLIK4qpIerWpmV2K+4EZA3VxwR/lvk1gp44xyS1+6cm7sDSKTC64UebgClmSN2l4cy4q/3zB0IR/UUzJ1Ofb1CNUwndNBidc4/1fsDRBe0z1Ng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39830400003)(376002)(366004)(5660300002)(6512007)(6666004)(1076003)(52116002)(6486002)(16526019)(26005)(83380400001)(186003)(6506007)(86362001)(2906002)(6916009)(4326008)(8936002)(66946007)(478600001)(107886003)(66556008)(8676002)(956004)(2616005)(316002)(36756003)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: s5O1/Hmsz4bL2uJb53CA252g6tE4qUjK6Q92+FLzIQecVJRlWW+sr9xW3FK805jk/XQx9ifm9V0pKqSHfXMA+OGpgbwZcnqDSWxtSsspZ0kMdq7wcukOd0cau4SWLfbm3Ku8cyuCqDid6gA7bBsM63uzllt7E8tXKs8nyKkGMJyou3gNbqf9B24RpSYkJrbG/9LSenZOtEZhhjZbbRmIKCv8nprpJTFRzITlrn14ee51hbyBdHT7UE89MpTsBW0ckv+yhLAQRX2iLXOXROG3GM5iDFYFnjpgSZT3VRTFU5pw8vQcaXGy7CWd0xKCtNZovj9avx8tzmqvgxIAPTBAb63DooQjmoFDD803eJWLNGY+ZdWWGo+LhhSDCnS7WziofZ3Gs8wnfMZsROUrOQ05cw3PIVDdtVf4Hscj6sRq53QHTfKED0vt0rJu+SPQYwElybqjTEGaTVEqJSNOu0gTEXJbiIQFra57yBrJvu+bPB3LNaqWHVrUGz3WL1yARBtt23noRtvLbrD5FB9FTS0lZLh3rx0EL42GbJhHWz4qInBlKhO0RO4biOLaC/bbKN5lP6XKV+SDLYhCp5oS0+/KisDxTKfgcE7IpPph/qtmFJlOobEJJtIRQml618zeFLtjenp+u1EmeinfFrAMIEbtgAj8BYg8DzbpYcUw/fKdTWvEu/uLF5LXWB6bcxBRdtfLWFX1ZNSYoFNT8/d3COgoYHYThWUm0ThoXt0m9zJ8z/y2LIx5haJOpH5RewAz6HxqRDlHERJeckjYLtgoQMwkOKIsgGKN6HhKaLm+Xs9zJX+KqFIGiqB7b/ShEgBkmHnlgiM4t6MwB5WpUBM53mwWBvC1gppjgTxnLP1uLjMcSlf80KOyrjSX2rw44NAKEw3z7nr6T994Ct0eQTEti02/lA==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a25386c2-aac5-4641-9690-08d88fec30f3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:13:07.1210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +aEGPxspWdb/7Y7TRyF6df99GF8SJiyIkN0R1HkzJzcXfmorqE9w6iuCrQn7qR2VNqseQLb4lUv1PjGoeln5E5lF4RtwXax492DtP2FbqfI=
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

bdrv_append is not very good for inserting filters: it does extra
permission update as part of bdrv_set_backing_hd(). During this update
filter may conflict with other parents of top_bs.

Instead, let's first do all graph modifications and after it update
permissions.

Note: bdrv_append() is still only works for backing-child based
filters. It's something to improve later.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 50 +++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 11 deletions(-)

diff --git a/block.c b/block.c
index f2e714a81d..cf7b859a81 100644
--- a/block.c
+++ b/block.c
@@ -4953,22 +4953,50 @@ int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
 int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
                 Error **errp)
 {
-    Error *local_err = NULL;
+    int ret;
+    GSList *tran = NULL;
+    AioContext *bs_new_ctx = bdrv_get_aio_context(bs_new);
+    AioContext *bs_top_ctx = bdrv_get_aio_context(bs_top);
 
-    bdrv_set_backing_hd(bs_new, bs_top, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return -EPERM;
+    assert(!bs_new->backing);
+
+    if (bs_new_ctx != bs_top_ctx) {
+        ret = bdrv_try_set_aio_context(bs_new, bs_top_ctx, NULL);
+        if (ret < 0) {
+            ret = bdrv_try_set_aio_context(bs_top, bs_new_ctx, errp);
+        }
+        if (ret < 0) {
+            return ret;
+        }
     }
 
-    bdrv_replace_node(bs_top, bs_new, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        bdrv_set_backing_hd(bs_new, NULL, &error_abort);
-        return -EPERM;
+    bs_new->backing = bdrv_attach_child_noperm(bs_new, bs_top, "backing",
+                                               bdrv_backing_role(bs_new),
+                                               &tran, errp);
+    if (!bs_new->backing) {
+        ret = -EINVAL;
+        goto out;
     }
 
-    return 0;
+    ret = bdrv_replace_node_noperm(bs_top, bs_new, true, &tran, errp);
+    if (ret < 0) {
+        goto out;
+    }
+
+    ret = bdrv_refresh_perms(bs_new, errp);
+out:
+    tran_finalize(tran, ret);
+    if (ret < 0) {
+        bs_new->backing = NULL;
+        if (bs_new_ctx != bdrv_get_aio_context(bs_new)) {
+            bdrv_try_set_aio_context(bs_new, bs_new_ctx, &error_abort);
+        }
+        if (bs_top_ctx != bdrv_get_aio_context(bs_top)) {
+            bdrv_try_set_aio_context(bs_top, bs_top_ctx, &error_abort);
+        }
+    }
+
+    return ret;
 }
 
 static void bdrv_delete(BlockDriverState *bs)
-- 
2.21.3


