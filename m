Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56285398A63
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:25:39 +0200 (CEST)
Received: from localhost ([::1]:56490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQsM-0004pl-92
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfT-0001Fo-9q; Wed, 02 Jun 2021 09:12:19 -0400
Received: from mail-am6eur05on2123.outbound.protection.outlook.com
 ([40.107.22.123]:34529 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfO-0003Gh-VA; Wed, 02 Jun 2021 09:12:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNKvX9D0wIL6cRnwKX+5aaMT6pEeXEEN7uggEMqVS89tfy9QyP3GsxI9HCfca1wwgmLCthNGv6J51lj7LoD9oSe7Azxcm5YXiDhf8g3ALFlkKE3MUNbk+OBAcLswcp7NgsMEkthJyPD17ywK8eNMiEmKss00V4/IK1cz2YQXfrss3CWzCc3xR0XNkLct8WYlX2AsYD4iapOYztTBoUWPw0phErNWWhqdy6lsO3V4xS2DqgUGqfInPc5O58wSsKWs43BN8U22a0IhtbNW4UimfNkTNsd3Ra07iChgYs9kx6nUww2eCaSKzSLZ9C02+PDjWFSRUaJhkXSab4YtEHRoew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6gZyGdYcdOdZ98c6iLrdZgo9WnaPWMocI/jDACuhxI=;
 b=eg84opFIeLgNNwESwkt8LRMbc5/J4S4bACW6nc6vGnGrckQVAaoi5ogXe9j1FNRLmPU9eHYe/fozZNjm5M/tRR5JucD1DMjN59zCB0BGhuTP1ImBD1I0YkVBqfc8bVH53ALJCCm1k62vDOfbKvXKFqnSrVItpm44vEBf5VMkjOC5lzGN5QcwwHcnIX6OHi3nNkFXNbJlGOH+ioqaIh5IV+8CdiVGdwBY6pOk6wP+VfhpDq80IcBaTLs44j7b0qJ2s/oydWRgIkXwCy94cb4zfe+dBH+sR7Wx7y2d6ICLg5zm/Xz54kiKD52mTMZlvH+cSoqvwFaNxXzsvEDWbMIroA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6gZyGdYcdOdZ98c6iLrdZgo9WnaPWMocI/jDACuhxI=;
 b=ANQAbj8nnBlXVkAvm5QJ63St7+OmGxkLfiZA8pJz7LftJwoZntl4e7iIa4DyI5eLyuv1zg9jW5juG4bQ7ZCL+EFisAqi4liGx9UVoT862ycs8bweXilLAeObKlKbcNR/2Bdnl2C1IlvgikmQ0+QsInkmSE9E/Cv7PCCaFpmnCTI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6693.eurprd08.prod.outlook.com (2603:10a6:20b:39c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Wed, 2 Jun
 2021 13:11:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:11:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 20/35] block/copy-before-write: cbw_init(): use options
Date: Wed,  2 Jun 2021 16:10:53 +0300
Message-Id: <20210602131108.74979-21-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210602131108.74979-1-vsementsov@virtuozzo.com>
References: <20210602131108.74979-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: HE1PR0501CA0011.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0501CA0011.eurprd05.prod.outlook.com (2603:10a6:3:1a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:11:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08e7b3ad-93c3-4ffa-3f96-08d925c7fdef
X-MS-TrafficTypeDiagnostic: AS8PR08MB6693:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB66930506F705D346A7A99B17C13D9@AS8PR08MB6693.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:110;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UNobeSAdaSPnaYSRWupENhISIehzJlaYTo6ng3tKh4aR0nZmNRaCqn2kyxT+4kX8l8FaBUjoUgBJI7w6kh0NuLuSADQotc3brMePqVKSOpvqkjAeN3cGuBO/0luTRwKLEggCXFxr7Ypmo8KSTEpkXp969QrlN6M0QY/qdfn0HSIPLu8ZkQJEztg4QdE6UB/4m/qNbSZlnZTWuB6qds52Ui0D9HrXlAFkaAiTTrg6XuWpDLWE3RPybTN05A+CkVv9OcKlABowXAiLzycxL8WfwFqgJsgIdhkz0cMiRCrOw51nD27nSvRcbtBlhTq1HARtUmHdJrcSugxS5UgAgvBJon7wD+2w4akQ8W+CFrYlmbnaZgijuIY1DrAy7vOK5sAW5kKLo1eKbAb/7GcNHWiogPo8GtHpc4EOa+WmyKSTmqlq8FYp0mW6okrl3DvIuVdcKlFoFC8rZfnFM5CQeYm42yUiQJF2EMblKfAyavfn13IV18S3189W2QKY7XSgETr2yoOY+ioMgvyjtmBo+vEga2cpbz4IrquBI6VBZnnlFlznL2GyBndFeORKuATbVWUZ7pWd4kQqZm//LHutEiwmQzHpQKQT8zdibKbajiuiBZcH1iui9KZWkfXo72MSxErOjIDhUdDNmw/x0ep4zTITFKtbB5RaF9HGhWqjEEhCDuKSj1GgZt1VpQu37t7qnGM9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39840400004)(8936002)(5660300002)(83380400001)(38350700002)(38100700002)(36756003)(1076003)(6486002)(7416002)(4326008)(6512007)(16526019)(186003)(2616005)(956004)(316002)(6916009)(6506007)(66556008)(478600001)(66946007)(66476007)(2906002)(86362001)(52116002)(8676002)(26005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?uO9PWOF7jpd30EJR8Jcqf70jqb+ureteLjyFFBD8eiSgiUqzyn4TwrK+c32H?=
 =?us-ascii?Q?W/UWre7VTRnO2394xEQjE4oNbIio2h0z6lXhuSo8aVWwnBQ8MWc50lWnf2aW?=
 =?us-ascii?Q?q20H3ay37mrq7KLp7zyBQYUaAmEB4DHYrjxPYuXOD8+LlSJvan3cjpK9dVkw?=
 =?us-ascii?Q?vwm6qnZGpiSA6xkX0A6PqltuNcTfMdJZQbXV7etScotHFM+6WnChM6M4da4x?=
 =?us-ascii?Q?7c2+/Yp71VGlEhAfchPdRKpfIui9j9oeSymwaGr25sX+CUsb9bt22oIhQ1UR?=
 =?us-ascii?Q?FCdLfsXhj83sqlSXyXPczY5o+HH6uQf30Q7og6QdInC/4IUQOiRdF3knJL7k?=
 =?us-ascii?Q?dI+yxakAqgseDaFOF3StHNogZH1aYaFZYskG0cvT0wcG6nYh9k7TiUyNpN1f?=
 =?us-ascii?Q?AnSe+IXCYMmJrZ2f8bSZUt2clUNGIjMyEd4FY8rJXVFwBLXet3syB6nim3J2?=
 =?us-ascii?Q?L/j4lQyX3aKz2V+olyFfbuL60gd4Bb2hZB4qvgYEGMDrLQ21Wpxl3zaC8EA8?=
 =?us-ascii?Q?nbmHwBk09fWAIaRbVN/WkAwl03j0eROro8w6+IvRDTvQe1wyaeDrnOfIdNb8?=
 =?us-ascii?Q?Lh7haq0SnKD+PVmxIywcNujs5UzcLyZVSt1ydMbpCf0RkRjeDLXbT9F8qER2?=
 =?us-ascii?Q?r4WkFUYhw/Gp0C5JDu3Xc3gFhnpwk3kcIOJiDTfOCdamPhbljomeRkvKmWH5?=
 =?us-ascii?Q?vs7T0UQTDjuTVWMxWhw/YTmYuMLNo59HnaTNHO0vVPJnJfCYfxOLwa1R7TJP?=
 =?us-ascii?Q?J2HVhD5XEkNRVrM5oUvYAysX0iDEwiJzxMOC1nkHsKQ9PXoUErlyt7E7gJbq?=
 =?us-ascii?Q?KMdOuYAfB5Y1BoNu/0+CQwfjEOyQqcyOUU7t8JEDAL/fKuJ8bTyP0vTNDGNe?=
 =?us-ascii?Q?tUZtz88cDu/OE8jgnTwaRZGVtbF58tNAI/WNIH+OL4Eir1FhpYxpA+liuypM?=
 =?us-ascii?Q?WMzGO9gCe9AoRrn86vZslEOlr2Uwgl1QAJVPCWy724BeG4NRKDVWVMf2DZ0n?=
 =?us-ascii?Q?zzc8DD5QgSKpqkDIsUoXiT6fHDcxumIx3RSnqNDnWrWsICPGLjqF+KwhCzWy?=
 =?us-ascii?Q?LeL1uspfZ4VA/G1JmTNG0TkBG/vSJ5pTc4Sx2piiur+cDGq/26wA61hxcI7W?=
 =?us-ascii?Q?HrieZ9OINdl8RYuV+YS5KTrCwoZH5S4W5oroQZyy8jZLjFIVilkVzIc6JYx9?=
 =?us-ascii?Q?soAWT8VEeD0TQt3QdqiD/m+IUOSSlf8Xqv9GZ8obhFx6evIafHy1pO5afhZ0?=
 =?us-ascii?Q?2vTa79Uom1xUNWahwAAQYQBAurd1a6IshM282X/LToTy/5si6/g3aW2lKDz2?=
 =?us-ascii?Q?tIGDulP5A+nvgyXaC2ROa0jX?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e7b3ad-93c3-4ffa-3f96-08d925c7fdef
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:11:54.0163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZQwjIkj3/Mdsln07t29tDOLQbNb2xNyPOdWVJinjpAH7vdlvXU2Gsh5r3aDPXPYaJ5DhXW7LQKhj4d0iYW+uUo7JLRkx4DVH18VKCdLTtLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6693
Received-SPF: pass client-ip=40.107.22.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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


