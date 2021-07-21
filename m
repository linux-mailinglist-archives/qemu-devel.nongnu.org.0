Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 242D13D0C72
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:32:43 +0200 (CEST)
Received: from localhost ([::1]:58762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69Ws-00009X-Rh
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697i-0007gW-Ov; Wed, 21 Jul 2021 06:06:42 -0400
Received: from mail-eopbgr80132.outbound.protection.outlook.com
 ([40.107.8.132]:21413 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697h-00027t-30; Wed, 21 Jul 2021 06:06:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbhRLeI7uNKiO/M9wajI1bPHH67A3Q8RnMTNBIrQ/gYsXNVWyeqYNELM3Cp9jPGh0IZjif2o9oCArRQ+E8kuTP5eUivcOaICPxd/zu+59lP8WHWhzxCQBe0vh6PXNS9nRDB37wEaRZyv4B/BdZMO5vWSW8Rfzv1XzEr96zavb+8PgO96n+jSQc8Oe372vER8dsisKPRIYe4kyj5N8nAyQjcpADmJZsGdjrh/It6RR17+J3C4/5efNkHfJZi/GUilr113R5hn4RzhJeAjpD20CjZ2Q4iPaiIPvUv2/2QITL0dOFdHWDA/e5FMfIRkSIsZv0RSDj4+vpNxmKBMFFZ1hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6gZyGdYcdOdZ98c6iLrdZgo9WnaPWMocI/jDACuhxI=;
 b=F9OxL/GBtLYPFAbp4uVNrSt2dlMnq+904e6slUXmNw/K+w9EQZLw0rJoR6N493mcRcGtJaiB7H9V34hpHzngSydYfsNgER6EFh2zgyC8OJZVjnTgj/K5C4jdNOimY1EblN5H2Yaif+ldacXZHdPOVRY65LGJyJeT34DTiJITbfUpprcJYyALw19Bhz7I67dfRNQxEY8gkHIYnHp2ipwUDaoTugrOOhkF7EA56XnX3yQjJtQ/ta//fV9zbDEAthm4yY4c6lauAJdclaVzG/AiQ8mIgAIfXjG4YUnHbfqeoSYmQRk6w1S1qeTIKe4RthqVovkOvRCNSJom5RS9LByWIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6gZyGdYcdOdZ98c6iLrdZgo9WnaPWMocI/jDACuhxI=;
 b=vKy231MywqxckrO9GlRUO8Pg5a9oKv1r+oCHyRe3HO0WjDdRSWg+jrMgD3MoLZlsfYET9VuDrf4k8BNTtwvd0PZVAKDNW1Gge++7s4eG8dihKnnBGSsMZNPAO0f3C19weddmfrFLWesUZMYzET4kN0pH5y1OrcLadXiJHj7/kyU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Wed, 21 Jul
 2021 10:06:35 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:35 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 18/33] block/copy-before-write: cbw_init(): use options
Date: Wed, 21 Jul 2021 13:05:40 +0300
Message-Id: <20210721100555.45594-19-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721100555.45594-1-vsementsov@virtuozzo.com>
References: <20210721100555.45594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0701CA0068.eurprd07.prod.outlook.com
 (2603:10a6:3:64::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:3:64::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85523c48-c638-463f-f03b-08d94c2f3905
X-MS-TrafficTypeDiagnostic: AM7PR08MB5494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5494278F454651844E260C7AC1E39@AM7PR08MB5494.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:110;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u8nG4+X5evzY5XEzyDM0vdZll6UlVcFUCiKQFyHlVyaPz/tWPh6DKyZElcESIyS4szLxmzmITfvPE9fzl8eZr5QEqdF6QVY7t+2M4BbORD3wSI0L6IcLteza/60BTTwBT4Ma1Z8hlO4dBghRvsw04x5NV3hEfHBcXx+E1Fi9kiUJuxSMfJiqOW8LL8uly6m88+P14Ws8izyllcKvreNVGXLQFESWR4YoW+F1WMpqhQ/V/MCiOPrWLPVgePta/3OS+ss8wOQP70VkwQHF39uBiV7YEz5k3RRavHey49e7I73nZvBERqsIgXkyTE8RC+luU1756VtD2V0oELcjV2GQ4kNBKZflt88N3XDQnWfyrNKW9Ri/BpO74d3umo9xf1MUxNyLS19Xyv1r6ZOhRK1WuNGBxAwGjxzmh3uM/wctn1FzBVTifIr7iwTgdguE2aOH8sGd5TxsUZjKbe1z87OUUJgVO/8zktn6p5AU1Xn3hAxv3lpfCxAhXmKBPSjCqB6P7nfTlBMKakgDGbCa6OqziP3tK4HzohNMnLBEWdJMP2mk73FTa2/Vm5dkZjBOwEwMNoDGqAXw9u5YyScGK7jsVZnPe0GnFxQgzqoAh1IIWheXlTD0DgkauncSCnkwdMbNrT7Op7YXL50gKUO/XoicO92PlrvS6C/6GLq4u/tOB6Trs9PPQLzJSbvZKwL092zm6vOoMHdnyAVboKRlHOy7/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(366004)(346002)(396003)(136003)(4326008)(36756003)(186003)(8676002)(478600001)(6666004)(66946007)(86362001)(83380400001)(66476007)(7416002)(8936002)(66556008)(5660300002)(2616005)(956004)(26005)(6916009)(52116002)(2906002)(316002)(6486002)(6512007)(6506007)(1076003)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tiiBkj69YoPS0xEnSKrL8pS3vV4bP2YYNQe4hff2oW8MmkBn1nWDg5mx9t7b?=
 =?us-ascii?Q?zEE7g0qpRRTgGlVz0UA2GfXOWl8z7EvE3KHu4ct7JcYwaqebfp4bcOhMxPGL?=
 =?us-ascii?Q?gVgfw+PPahuQ/pvCIcCo0lmZRXgaInEImnCMP03yqd6FiKcNtH7L7+WOngW+?=
 =?us-ascii?Q?uJx3+TqZ3weeJJP6IX7S+7gcMElFO4yoDRm6RxDkpVOO2RzAbIJez1FImncn?=
 =?us-ascii?Q?N5UiTT4BMSEW14IdO+otDbdgWuLZmjlrdE3i/p88XT/t7Wiaap3b7nPvfzJn?=
 =?us-ascii?Q?ilcL6KJpMAZKkEWnXO9nzROZdVWAQPKtVkQMSnXW9WkoXyHZYyPVTBIEErKS?=
 =?us-ascii?Q?b6ZIRXe8woKkjOTBIBg9tjBGUje7YoUfltCp/Ugr6aT9NRc78E8Ix/DWDExv?=
 =?us-ascii?Q?ZRr0U9OgtsdRo9+nQesky7vFlYMYo1GYKPfpFvItJdWJE4eYPbgOIK1wOIvD?=
 =?us-ascii?Q?tE5ZCSM61MftiI6QN+W08nawYzMagD4SncPpVs1hWzoPaBUuJVpxaRjBAmtK?=
 =?us-ascii?Q?Hj4kL3N2ByR+JQ0U7c8svrYw6avsKkCtKc75OlgbSXvWZW4ljFztTkyd4A+n?=
 =?us-ascii?Q?Kr19lUE58prVDXH/8sECE/KOUA0Kl+koaYo9C+IrPsiN5huI1E8Ts/QTb3pV?=
 =?us-ascii?Q?3i8VD3rVp3p5lAcU40MpOQi7t9CyT/lPbT8q1UD3zKMkwmBcwi05tkQf/5lx?=
 =?us-ascii?Q?uKCzf+lb77j+dSsTBGook7hV+M18GswA5rnM83MtDq9T/WFa1uv+newKkSUO?=
 =?us-ascii?Q?3KNzTViXPCYyxa7Wl5XtvmWyzz5Of3g2RCyTdRiAHiXpmCw73jvRtMaTSeG2?=
 =?us-ascii?Q?Zid7CqzHuWt6IRKD46MTOOk80go23YjclF2uLU7NkFoJqogtJ5fYPqKpG3xM?=
 =?us-ascii?Q?znpG8+2d6EevAivKoUK9p10lIt0mbIV22CXlJlj8eLbmOC0nOgtrK7/3/vie?=
 =?us-ascii?Q?/XEzP+oyd6/8TBdUPMaTWaXsZcg2Pp4VaZWjtcycQvz5iDyQtE9vuDPjHq9Z?=
 =?us-ascii?Q?7a5UDrIQO/8wlfVpzQw1bOAoZos2mVyBKAjj7umEuxCgeh3aRqCTExuV9Tyx?=
 =?us-ascii?Q?5sUKqHqiwBSHRY++tRbCMkIANPPke8i0PHD8n451qQCLJwvBL87XNf5aEp0q?=
 =?us-ascii?Q?Yx0fD5vlpbH3d1zhI59uBFNazIsxkh1+zH0AUZr/oP5rStvfHI/OvZnjsyGf?=
 =?us-ascii?Q?QdYqI4AdFr/GrWWewAznT2UQtQ2s1bxlBMs6st7D/7nDxgiv7f6CdTNGaU4F?=
 =?us-ascii?Q?dAVMsQ5U0ZIudny3GIjPoNohtNPHrvzmIoxpiOhlKofl3njVvOi77NJBMx1g?=
 =?us-ascii?Q?OnN0T1EWV9NH9dKHyJdfhaws?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85523c48-c638-463f-f03b-08d94c2f3905
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:35.5222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R9vkGBar5o0WpqbboiTAGa/V5t0tJbVmMpM13zMqoRQQMSG8OHWJCGY1x8q2xdRSLglWQJFRrGZqtDeqQAzdqCzg2hf/6cV6xM1gvg8aXzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5494
Received-SPF: pass client-ip=40.107.8.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

One more step closer to .bdrv_open(): use options instead of plain
arguments. Move to bdrv_open_child() calls, native for drive open
handlers.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 1e7180760a..1cefcade78 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -144,25 +144,20 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
-static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
-                    BlockDriverState *target, Error **errp)
+static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
-    bdrv_ref(target);
-    s->target = bdrv_attach_child(bs, target, "target", &child_of_bds,
-                                  BDRV_CHILD_DATA, errp);
-    if (!s->target) {
-        error_prepend(errp, "Cannot attach target child: ");
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                               false, errp);
+    if (!bs->file) {
         return -EINVAL;
     }
 
-    bdrv_ref(source);
-    bs->file = bdrv_attach_child(bs, source, "file", &child_of_bds,
-                                 BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                                 errp);
-    if (!bs->file) {
-        error_prepend(errp, "Cannot attach file child: ");
+    s->target = bdrv_open_child(NULL, options, "target", bs, &child_of_bds,
+                                BDRV_CHILD_DATA, false, errp);
+    if (!s->target) {
         return -EINVAL;
     }
 
@@ -209,6 +204,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     int ret;
     BDRVCopyBeforeWriteState *state;
     BlockDriverState *top;
+    QDict *opts;
 
     assert(source->total_sectors == target->total_sectors);
 
@@ -220,7 +216,12 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     }
     state = top->opaque;
 
-    ret = cbw_init(top, source, target, errp);
+    opts = qdict_new();
+    qdict_put_str(opts, "file", bdrv_get_node_name(source));
+    qdict_put_str(opts, "target", bdrv_get_node_name(target));
+
+    ret = cbw_init(top, opts, errp);
+    qobject_unref(opts);
     if (ret < 0) {
         goto fail;
     }
-- 
2.29.2


