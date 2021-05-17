Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2AC3824B6
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 08:48:38 +0200 (CEST)
Received: from localhost ([::1]:37010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liX3N-0008AC-QK
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 02:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liWzn-0003Ei-MP; Mon, 17 May 2021 02:44:55 -0400
Received: from mail-eopbgr30130.outbound.protection.outlook.com
 ([40.107.3.130]:60322 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liWzl-0001jR-Uh; Mon, 17 May 2021 02:44:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HWqDvO69aCcsHtj7olMJNR9I3eR+yy5e0GXFo3U8S7gpV62NtVTcwn+r9INW1N2yGW6zwC+OwHrPtUe6otV/akQ2kmbIxfr1l6/JuALe3SwzcKVtYnDp6EhKH2PjOrfJzp2oN0BB82To25qdOx1BoxkubxZgDWWwaPRRN2zuhzQMxMdjfLS6KlSBX2DPvf6VP0ovG2rsTH5iBtdxea68UhrdxZgZv4bA8lKNb0UQZkfLH/a0ebtmDGuqFewyLHH195D56nqov6RSbJLZbgMNlpljuhmxcA+3VGpMDhsE7c/yk6JS1wymzxySllloew2yIn34niWjc+l6bFDDwhRSaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lc5en+TQwRms/3shKTuoyBietRcJuOfexHtfH6OvFD8=;
 b=NqZQ/7Qas/JTa2qmB3zKpw3BYxwwBLboPOyh6q8AvpN5bF3f09ZckV8Zw9DLureeG92qxItKat0x9jtJf44HtIw4qYRCAiCQyXKfoU/hsFFvm3am3bNg1qmzEZi+eupNqcB78Q0z1rdFDZMKd2Nth0UDcLqlZQmC4Ia8yhpRnQfEQDX41U898nAyDOddHCmurvc404heZx+fGProjIPH3fkXp4dBeKHpoREUUm9JL0WYt4I8F62mBCHIVouvPqgQzwm2tjNH5l+6ELLjYzFyxP+rZDeoJdY4bjTsYgheUjXiXWCpdIJCZPxQSLKM/h14tj7bFvGljWrawMITbc2WSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lc5en+TQwRms/3shKTuoyBietRcJuOfexHtfH6OvFD8=;
 b=Ne4s2mRbUeCE44IZz4Qyxuu2d/eM/V+7Au4i4SmuENt7i7Yp59WPQzpG3dJ919nWbcU95EXLkynEnL7BJ62wBd2Zp6TeAXXEkrU8w+NPwdgsiyg/WdnM8o9V+00f5I4FJKHmnd0ccD/pLb6SLdBvKMWRjWuTTMEr4isWivHZG6A=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3382.eurprd08.prod.outlook.com (2603:10a6:20b:47::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 06:44:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 06:44:46 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
Subject: [PATCH 01/21] block: introduce bdrv_replace_child_bs()
Date: Mon, 17 May 2021 09:44:08 +0300
Message-Id: <20210517064428.16223-3-vsementsov@virtuozzo.com>
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
 15.20.4108.24 via Frontend Transport; Mon, 17 May 2021 06:44:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a380f861-dfe0-46d9-d827-08d918ff4296
X-MS-TrafficTypeDiagnostic: AM6PR08MB3382:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB33829E85AB6A47F837B5D1E7C12D9@AM6PR08MB3382.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:198;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OWJPqdRVqFmIMDS6Sol26aIODxMLSdTW1JinKQKDvx/GSuf9rez6CXDpq+Y8vm7pONcFBpcST86TMWOd7zq8jvWfmTTBd+tmeJwrKbyuoAaU7NDymQ5UP9Fk5P/tQgYxSmT8w6yiLA/4n7HS8iugwwueoWK1O4SU+lgYfX1I741Lxl6NAQDLGSv5EdG4HC8ySOEnr9FI5ybBIvHGiaUt+llhhp27C7HNzAcFgRb5Ef8FKUViUFEFDl8ph3deJA9pOVNTygW6KbcwA+2ta0LN2sqSGZuL3g0k2/hsmdOJbtgDqld1F2viP3EYfnEekncL/p3Y/llmSkJsp9quxYoKxQ9ZlUQhBieOIbN6sCDyV+Wudg1KS44u6IeJH/DePy4G+qt3LVy7xUvAqqElfLNKTqYuarO2Aq8UcPONDjJchcpi8oNRRAj6ATQqloegoJKAElE0bizPgDt/g9yRTt8YBIl6IWwr+KX5p6jVWpXL6CNgRkC0m3KAPnrt4qN7eR+8B80dz2N6b0dsVoZUKi98tz+Qdy5gqNSdZl39Fwn10TkV70seEgurt6FqUS2Zg9fGinjdjaz24PTwAsSeg1oXPslUQgWuiWamN1S1Z/nIglfr45prJ2vt7owumOfxsm1MiVqs2PRirh8sheE1s7d6MFn3tTRJRWCmqDeWKT+5zEivVTEw3xj4gJTbfKasGWah
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39840400004)(6486002)(26005)(2906002)(316002)(36756003)(66946007)(1076003)(107886003)(5660300002)(16526019)(186003)(478600001)(38350700002)(38100700002)(8676002)(6666004)(86362001)(2616005)(66556008)(52116002)(8936002)(66476007)(83380400001)(6916009)(6506007)(6512007)(956004)(7416002)(4326008)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NgzLxAJxZZQvmGuvKO6ekZgLuJwaajTjwhMFaocIxg0E16/j5f2jJYD0u/Dg?=
 =?us-ascii?Q?4WiIhbc+eEJYjzaZC4kygA+Xl2D8Uqxq2LNo3UfID73MHMseAhnKLrutGq4L?=
 =?us-ascii?Q?vAvbw91K423RL4Eppb+dBqt//iCTuLS3q3UJnJWMzi3nqhEGWyzvIBfy0/Qt?=
 =?us-ascii?Q?Pdklo/Y0QBzB7UIdmx0IbR8SLb1MdSmzEqBVgEzalseLwkoAPGlt4Nojs5pG?=
 =?us-ascii?Q?T1EPgIQ2vzSpEJ5eiQUjSSAjKvvpeI6iUoMz4augHWzAJR8pofHsH3R4ifmQ?=
 =?us-ascii?Q?SCWm91ogpS3/JKVa5xZtO6g4wt41FkGw4bmYECclCGi+1blwJf94X1/20MvI?=
 =?us-ascii?Q?xuLW+W2/16R+I2y6/f8nsybPoxUvA4YrDZs63MyK35Ypl/W2bD7NxqWXelN8?=
 =?us-ascii?Q?1PWg/ti6M+oJYrwQr4PaYmdfFQ6vuTxB5GFbBPPCaqwsSapQZ4KTSpiEEdVh?=
 =?us-ascii?Q?1xZnVrGLcZLwvglGRHC8h1yMaCMgmeV9XGIPCmG8q6NClWUm6vDwQpKWyHaz?=
 =?us-ascii?Q?Ys3LHOtWl6vmH9+hMPOlBJOreJw+j1NWoqejRux2O9g1AslmDll1cg5VdbFa?=
 =?us-ascii?Q?bzBWrVDCvGuvoIDbMCASuwhFCR1f2iyZIHsNOJCRGz818oopSyu39o196EQF?=
 =?us-ascii?Q?AZnvvK3jDuQ+fMpxOf2EfWe0hOZwTWP8zZg0Q6j9HsQ/Fo6+Mv5gNzvCbhoJ?=
 =?us-ascii?Q?V1APhcKMhc4hZod7PB7rAY7dR862QJYv+9DhydFM2gR2MOr7Wg9AhjVoWFmK?=
 =?us-ascii?Q?9fAqdbURztbo+aJmGH+RaUrhZbQ7wCUIzgFuWU0SC4jzHSYyX6wKwi2rYs/y?=
 =?us-ascii?Q?bzL5F4sFOSauCjkqAOIuqNxZbe28YB2HDpxU55RYBPHnEsd/3rWO8lHpunyJ?=
 =?us-ascii?Q?gFO7PRIPbTHf86T63v++s05z1Bsfq03s8xPNTDNjN8EaFR+MR0QTVfoOBQm/?=
 =?us-ascii?Q?sOSVigWCBTJvtjXH3AMqdYTymCClOywxkOBRiMJLYy6HHZ+8g3GMBxSgcTKn?=
 =?us-ascii?Q?hmHjpIhnhHaVnKqTvOsY5412/YeIBscCvD7qcCJvI9NPo4VlKgwt8yc+Qng8?=
 =?us-ascii?Q?BwmStus47RyGP5htuVoAJ7fAhmkLVdd5qNuLwywLAeiCYyJs+CcUBSrMlU/V?=
 =?us-ascii?Q?hupLU1WKL8JtPozY2aNihy3Dv0yf+b825pV6t5FxkEBrtiWyxNtsvg9B+36w?=
 =?us-ascii?Q?gYpwr/J8bxpzMh8TEcKU6xkh7/ahmrYv36yjHbSMVFb9jT/rL9W6Ps7nbnO0?=
 =?us-ascii?Q?I4fn4Do0ZEnROToVg0cQicJtnBtj7PA5jkLj7X2+AhI5iv1IWqiWEG1qGR3C?=
 =?us-ascii?Q?V1nZi6DAjxvh7QSPkwpB1g/K?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a380f861-dfe0-46d9-d827-08d918ff4296
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 06:44:46.4108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rF7WYD+vxCm0ARMsx04zaXAsTOIKLaaUKYd/szoINLr7VmQpryleOybydlCQPLF9Lc+OCYqwKQQkrrmG4AepiQZPQeajE4K7egEHvnx/Foc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3382
Received-SPF: pass client-ip=40.107.3.130;
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

Add function to transactionally replace bs inside BdrvChild.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h |  2 ++
 block.c               | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/block/block.h b/include/block/block.h
index 82185965ff..f9d5fcb108 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -361,6 +361,8 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
                 Error **errp);
 int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                       Error **errp);
+int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
+                          Error **errp);
 BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
                                    int flags, Error **errp);
 int bdrv_drop_filter(BlockDriverState *bs, Error **errp);
diff --git a/block.c b/block.c
index 9ad725d205..755fa53d85 100644
--- a/block.c
+++ b/block.c
@@ -4961,6 +4961,42 @@ out:
     return ret;
 }
 
+int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
+                          Error **errp)
+{
+    int ret;
+    Transaction *tran = tran_new();
+    g_autoptr(GHashTable) found = NULL;
+    g_autoptr(GSList) refresh_list = NULL;
+    BlockDriverState *old_bs = child->bs;
+
+    if (old_bs) {
+        bdrv_ref(old_bs);
+        bdrv_drained_begin(old_bs);
+    }
+    bdrv_drained_begin(new_bs);
+
+    bdrv_replace_child(child, new_bs, tran);
+
+    found = g_hash_table_new(NULL, NULL);
+    if (old_bs) {
+        refresh_list = bdrv_topological_dfs(refresh_list, found, old_bs);
+    }
+    refresh_list = bdrv_topological_dfs(refresh_list, found, new_bs);
+
+    ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
+
+    tran_finalize(tran, ret);
+
+    if (old_bs) {
+        bdrv_drained_end(old_bs);
+        bdrv_unref(old_bs);
+    }
+    bdrv_drained_end(new_bs);
+
+    return ret;
+}
+
 static void bdrv_delete(BlockDriverState *bs)
 {
     assert(bdrv_op_blocker_is_empty(bs));
-- 
2.29.2


