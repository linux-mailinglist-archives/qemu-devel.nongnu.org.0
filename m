Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3713F9EBF
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:26:40 +0200 (CEST)
Received: from localhost ([::1]:34886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJgYo-0003Gl-0w
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgRC-0001A0-EJ; Fri, 27 Aug 2021 14:18:47 -0400
Received: from mail-eopbgr50135.outbound.protection.outlook.com
 ([40.107.5.135]:51459 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgRA-0006cN-Jb; Fri, 27 Aug 2021 14:18:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7OJ9g7w0tSXbEHw1QC2UIrlqTGdLQXnzVhYTBJJWAPgORIT3uiUMsUm5axHKNggbzKSBMMJs4QVzfe8MuBkTvSv70hIKbPS04ldvH7esZnud6cr0+RWl/KT2aSXJrtyFkeOV4+W00EQBsoLqrZ8SQvQW2yED0OW3gPk8EGgSN1dweCCKw8ziDNJw0DdWmFpU8fJELjT6adyu5OF2GEmjXk95fpkmWxSN273alfwQflUrapl2vBf4cRCT9JmAJf0lZPGl8K11PBP6MLzjOWfcGg3JwkOnbSec+u3QJ0+qnqfxx2FX8FceYIrCsDlZDlZ83lT3NhF+Cstt8Mb+n0vgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oz2e5FWoz2L/bowX4vUdc1F1h28PnR7YuPTjoEgbQ9M=;
 b=E30QhFcJcWco3dqXErBj/d6TTjzZYVXe9zsu4fvjkjbeDp5Am6GlFIv+KYGIk5lotlXPqtzRpwXaqUwDMK7FxUOVG/vqmf40UCKM81H5yRqngkL8wMPMj7g0U/E3pLhXAJkwuF1FxspgY5QDPIVEpHMgITsqjPIO/Ee+Cy9ut11zlxZl53J2j3GkPyUegogFYoeHcMlD4CUDDyWz2FvAQpT26KJh5n5lg2jTJpdvRXtr8E6CoGXmQVU7n8zGPToRtGgUC19eG3PUB2RL5Dv9OCEm2taYL29ScHCmYB4PniTdDaGvNMY5rCR0Bw9EAlWrIbuO1hgXsuiJz5jdXr/hjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oz2e5FWoz2L/bowX4vUdc1F1h28PnR7YuPTjoEgbQ9M=;
 b=i54O1YkvlMXFthnFQBgt5tyWkLvunqKKL9Uf7GGignKFb6MWsuEPgjAmqp0jm9yaY8WrDvXdo+WOrZPjbImpzMB+fa6lZIzDpJTHX4nQcx+R1aJe6iiMxCNcFvuHlKr5FVdwrghxW/855KABy6f8ArNjrHoSKySh+w7xjFNnIi0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6774.eurprd08.prod.outlook.com (2603:10a6:20b:399::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 27 Aug
 2021 18:18:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%7]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 18:18:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v2 13/19] block/copy-before-write: use write-unchanged in
 fleecing mode
Date: Fri, 27 Aug 2021 21:18:02 +0300
Message-Id: <20210827181808.311670-14-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210827181808.311670-1-vsementsov@virtuozzo.com>
References: <20210827181808.311670-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0402CA0012.eurprd04.prod.outlook.com
 (2603:10a6:3:d0::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.220) by
 HE1PR0402CA0012.eurprd04.prod.outlook.com (2603:10a6:3:d0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Fri, 27 Aug 2021 18:18:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74df608f-ee1c-42c8-936d-08d969871876
X-MS-TrafficTypeDiagnostic: AS8PR08MB6774:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6774CC76391BDB1B942C5DBDC1C89@AS8PR08MB6774.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:62;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i+RH9miEWyUhijPz5I9G8UechZb4mDGFe7xTBFOmcuYXaW2V0nUVoL5QEf3MxKdCqlFqfy/cU7WNYUur+b1KqDXp54OBFhY0LuoxXS+ox/SAdcnDsyj98CJM1KDZGVfyXbvG3vVjOWKA5qeYOu4og8DJXwZYeOcqyk02auTs9pxXF5CMB/YAPlU7VceadUio779M2TSfrp6fnJ2V9MtRwKvSwA6XciCDkvOlDTTryrbhgZDPewl7xHe7ouNIw+HiXYEbl1KHuyENr+C+lEsX1P5ZRL4V34A8v0l1otXY/83Ue6INxcHLVFozTnnAV9l8rrNRmwmDd2KGAxCrbxaPT874Buor/Fb2uKH/dTDPyciRmyAQb3vO0rma7Sg6G3sFU2XWBhdg0WaldxzfsXzoeI1LPttLCXdnOF4Rf3NY++aQBcqoq79pF253S7WgRWDzdwN07vHMIwj2zQXitnYReI5WpyvpGqyRdkr6IhkvhL4Pi2ggyujM3yrkLZfCQEHW8xMKdIwdm659UQziA17xhiabh4w4N3yvAB7PUdHXge9uadrIMQUp2QW4Vb1jLiQF6sinLM/wQDNKFLOlhRjV5i03zdON2JIMa7eHZ7nC2WHu7oovtXUo9eCamdK8YzLQ3i/hhezVyMwEk9ppJK6sZZPhDUgOsbDm7vSaKcx49QLk6ZXkTu81u5HqkCZs3sHTfwA1LqtezacHvUo8CYq8JA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39840400004)(136003)(396003)(346002)(6506007)(52116002)(38100700002)(8936002)(26005)(66556008)(316002)(6486002)(86362001)(38350700002)(6512007)(4326008)(5660300002)(2906002)(83380400001)(66946007)(186003)(478600001)(6666004)(956004)(66476007)(6916009)(36756003)(8676002)(2616005)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FX617tHGv8JQlki6tEvwdTmIzxqQ234kPyBxuRTLbINm0YwTQopaAiDBPBCv?=
 =?us-ascii?Q?HdmiQe/q8WIfFOhXmH29ammwcRHr+Zw5X+9FOULBLBd28JOs/ijLrx0tfn+f?=
 =?us-ascii?Q?vCe+0sxxKoabshkqm0N7CTX4BBeR2Xqj0WQDqHL+/kaOToIk5hQ2A/Lk0UOJ?=
 =?us-ascii?Q?uSpPeT1zdcd4tx3xEaoda7catVCExh1Qd3x4b98/tzfd+1g9buRkBotcO313?=
 =?us-ascii?Q?rQbbrcgvPSDziJ9DvmyxUgNeYQgrtpDtU+I3yYeS4cu+4Z78220PlJEbh+Es?=
 =?us-ascii?Q?0TO4jLdOC6Uq6vLSF2KM4M6JHhn4KjXPxQXhglrSdeKv6NM4ws7sOkfkwdOz?=
 =?us-ascii?Q?g3i5vpBLmQ+Ic+cLFA1iOva8wXqlAcwTEdAvBu6Bl51EIwQbdOdQn8yercZx?=
 =?us-ascii?Q?P4ghlBlYrD/PFNGyP03i7jxLHmVLW3KcmlM3ygjsjnHy3nIftrHttu+8H9FJ?=
 =?us-ascii?Q?/r5uh7HaA8YqLtfIEcwZtBDk/3x8rLgGF+Xncvpt3IID2TjsJUN58zA2ECYU?=
 =?us-ascii?Q?bCLfr6gRelq2VOHgdtUyYsfD22O/ViCYPxC4ai6ZGMpTaAZuaF0krRGyhcu1?=
 =?us-ascii?Q?VrZX7T32cszAijvwYhqaG+MfCcNDeK19+Cc+x8/PQysqfJQAfclVK/K4qV1I?=
 =?us-ascii?Q?7Hx48K04OSmN5LQhoZG1gCX8SvTg80+XYQk155dKEjvrRXX51CFoMBnQqNQV?=
 =?us-ascii?Q?QWtlaHOTvvpzPP8TzUIK9JEUVb3kfN+fA8Ggb4HxrixWB5etSSqxhJGXMlUW?=
 =?us-ascii?Q?iGl3UBah8jnlCceeReGIO1fxsW0pJFw91uQKwGP/lNsEwr4lMM3TtZ6Oi3Wy?=
 =?us-ascii?Q?Ci+24pcAYNyWrWTgN15Ok9S2RLrUakHSbrMbi0WNouPMUAoyqIuZ06Yrnz02?=
 =?us-ascii?Q?+eHDFvi7EBYDWIDgPtC291tURCPcU+BFM6UjxfyYOCiyQO6NCzTS7VolwQYP?=
 =?us-ascii?Q?FHRjKKcjZJhMPHxjyEFO8uDeMBbVDzyYOgmSdqZKRNopjJ2R5madIp80orqI?=
 =?us-ascii?Q?RDb9XMeGNBzsZf1nSnqiVlt9SLw0XucvF2lrvgs6YNk/BM5tCSDcDKem0kQB?=
 =?us-ascii?Q?UzUCttdUPGV1xGNTjfrb+ABJTpsbXjjKb1jkgiLDpGkjL/1lUSsMiI0LBkMp?=
 =?us-ascii?Q?UlNsyXlp/czouyVkYGGAkHQuPdVBvnN7m48mo3L8VLmyZmVAYLvS+NRPUODI?=
 =?us-ascii?Q?rTa2pm/GjWda2Yh10oTwbkjOzvS3JbFbD1MvK5C0lEeXtkhfhKiyxy+wLhhI?=
 =?us-ascii?Q?/OxIpPmaRaUPelJQju1V9eerDMkCA1UpEn5H7Mdrw9/2CVbrM4VYAqumCgw9?=
 =?us-ascii?Q?fvMAVc3Xh0EryTB6jqnUZq4J?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74df608f-ee1c-42c8-936d-08d969871876
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 18:18:40.2547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wv8UDQYOLSA2oMNSZqqxoQPkFJPVXqtXMFKKMsX0oLgEKilZHOjouwVceHSYcDKWeWFND/C36RBYLxUeMoqObIAGiSTZHPNefD8lXPPrLSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6774
Received-SPF: pass client-ip=40.107.5.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

As announced in previous commit, we need use write-unchanged operations
for fleecing, so that fleecing client may unshare writes if needed.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 7e4e4bf7d4..91250cc634 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -132,6 +132,8 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
                            uint64_t perm, uint64_t shared,
                            uint64_t *nperm, uint64_t *nshared)
 {
+    BDRVCopyBeforeWriteState *s = bs->opaque;
+
     if (!(role & BDRV_CHILD_FILTERED)) {
         /*
          * Target child
@@ -142,7 +144,7 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
          * only upfront.
          */
         *nshared = BLK_PERM_ALL & ~BLK_PERM_RESIZE;
-        *nperm = BLK_PERM_WRITE;
+        *nperm = s->fleecing ? BLK_PERM_WRITE_UNCHANGED : BLK_PERM_WRITE;
     } else {
         /* Source child */
         bdrv_default_perms(bs, c, role, reopen_queue,
@@ -212,7 +214,14 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              bs->file->bs->supported_zero_flags);
 
-    s->bcs = block_copy_state_new(bs->file, s->target, bitmap, false, errp);
+    /*
+     * For fleecing scheme set parameter write_unchanged=true, as our
+     * copy-before-write operations will actually be write-unchanged. As well we
+     * take write-unchanged permission instead of write, which is important for
+     * backup with immutable_source=true to work as fleecing client.
+     */
+    s->bcs = block_copy_state_new(bs->file, s->target, bitmap,
+                                  is_fleecing_drv(unfiltered_target), errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
-- 
2.29.2


