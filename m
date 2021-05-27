Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6873932A5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 17:44:15 +0200 (CEST)
Received: from localhost ([::1]:58568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmIBC-0004CP-Fj
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 11:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmI8V-0007vz-O5; Thu, 27 May 2021 11:41:27 -0400
Received: from mail-eopbgr70114.outbound.protection.outlook.com
 ([40.107.7.114]:51616 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmI8T-0006YN-Sh; Thu, 27 May 2021 11:41:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C0POvWC2bWUuewB/cKPB2I1JVSSxzr0H18/cBXtC7A2KvbZDxKKKk/Ky9vj4YWGbnTaHoq+WVquCTW7kEkZMmmPhXWEKlUeHCNzr6//5ErMJoJ3g20BJIBYYvGj2kULMHdIOSj6vGYTgUOh/gG381ikSKicLnUoJtr5CGFK2ZMh20/qVAudjLYuXY5awj1wyxifmrPYIIqUuNY7+24TYvvvu+tfnbvrtbqm4YAutNQIbjpMyTKINuQs4hioTF9AtQubGQfm0zxwJ4DV06mKclriOiNzIN0HPb4qtGidt2Gm07QpshTybmJXBBe7euXk/Lbk9/FXVDEOHeEWiYtVmEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRGPwpJuuMrY7C2mhOvOGXuHunyhZk/yXi1/6Ynf4JA=;
 b=E1A60mwv4NVJr1p0L10Qir7Hkn0uFZuWbIwTB4B4wJVqVBgSFnjEAfqW5uVSAqEJMiwDO+7Bglsn7EjEqVBOJ5QtGZHPKRJWq5rqUkHQcSKgiORsrOs+qLq6qB5AkmJh0jPfPtp/Dlvr5HBvPwOHdbCUMU1HfzCzNdxVaz8wwqKi9tsK0JSz7XAnWAKwRGgu3GH6W1PocQEH4es3aXn6BO6hcRZVR9+F74FoAyi5LMjkKxV7j7mi9AKxCucoG6p0B8oIxtgP86ev55zGsTLAgSUtkQ5YiWuy0BDMhoo7UGUHcYu9+j2VsSq8OtAWNah+6nqhx5cFu9xwu9kC/2Vb3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRGPwpJuuMrY7C2mhOvOGXuHunyhZk/yXi1/6Ynf4JA=;
 b=gEh/EXktXUHLvn+xL8a6QwDW2mV+SFBPZqf41coLh0tt/BBQpB/WAgnEriLUcgYPk+B/A6qtegiEuqM/FfMzQ/vaWEubVP67X+Qmu6tzinRAHxbsoqPlOxs31NMj5J3MJgGVKmAb0mbw3VrikqGbLtRWonafh4y+4nS69QQUyGE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1780.eurprd08.prod.outlook.com (2603:10a6:203:39::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Thu, 27 May
 2021 15:41:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.022; Thu, 27 May 2021
 15:41:19 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, codyprime@gmail.com, armbru@redhat.com,
 fam@euphon.net, stefanha@redhat.com, vsementsov@virtuozzo.com,
 jsnow@redhat.com, mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v2 2/3] block: drop BlockDriverState::read_only
Date: Thu, 27 May 2021 18:40:55 +0300
Message-Id: <20210527154056.70294-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210527154056.70294-1-vsementsov@virtuozzo.com>
References: <20210527154056.70294-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: HE1PR0901CA0043.eurprd09.prod.outlook.com
 (2603:10a6:3:45::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.226) by
 HE1PR0901CA0043.eurprd09.prod.outlook.com (2603:10a6:3:45::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Thu, 27 May 2021 15:41:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58ac015b-d21f-49a5-4aee-08d92125df09
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1780:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB17809F3D22E8945D8BDF6170C1239@AM5PR0801MB1780.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:208;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1h1j0W0GYouBFP8MzuX7+JYLD2iz+JGwKbh/i9g6m7XB6uZNl91eBoSM2wjyDZGvQbORUPHGopX+NxbdpmT4spXr66eAXIhdimB6w3S9KRwAlvHzpGNC1pcDhFBA+6uEMJLThKGAOVpTipDeAjyXOec6hbffuil2zjCM/Ce4WykeYEolkEz6tzxVFCgi2FdR+VSlXgpyjBOtRikGSrQ2CfQz5M9Z1oFoEagW5Jv+YUgnR42BOtF+/o0MwCSny0D+kHn/jFovnpLQQwvkm/MJQZQawsPZjQJQhLd2SqHbcgKi/v29kXR9iIs8XsDW1mZRo9yq8uvlHRX4quPnas9/DaGTc7HqJt+uZnSxj8h/hEVc5vM+cSLE3FfGCHDq3i/tpZYIMYRBZiSuwtCVhDqkFphS0KOLTt8/B/t4A4j7NQlbTUz0/PO6cHXbexazsTjL9Jc+VUrNFOdc04gmpXObtHHftEi6sQ3fcd39Kbv8cBbgtx0KcFipekIM0FUaAUiOLmouaOkJmAham516dYr+/YzCYXmgxejbz17r7iSHIwpG1mdU0POd9ns3PSS5z4c48C5uYuGkkrgUvUPQaIvFrWV6OfJrWkVVxR/MM5ruwWRPk9R+H6qGhUXsliWlby1fjXmKXUfygegcUUJs9AZo+2WhOUHd1c/PyQyDrovqtUhwFzVEhwW/ZedwV0XUcj2j
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(136003)(376002)(396003)(366004)(52116002)(83380400001)(186003)(38350700002)(16526019)(478600001)(4326008)(38100700002)(1076003)(6666004)(316002)(6506007)(86362001)(5660300002)(66476007)(66556008)(956004)(8936002)(2616005)(66946007)(26005)(6486002)(6512007)(2906002)(6916009)(8676002)(36756003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?jtgHqKzM6dUzjLhrwM2rSG8kWQZhc6kAKfSsoGdEcKUgkN8mtoq8bGupWB+s?=
 =?us-ascii?Q?6X8xbN0tz7VbF+l/0ed6aF0zl4umu9cy+ka7rOxL2P3y038keiA63YK1uf8J?=
 =?us-ascii?Q?AzVa1kui2Y+qkNQOTnki8BSLxmldz2pYDhbv9TNwLbnFOmaLtpFalsZImDT9?=
 =?us-ascii?Q?F7PS2H2/agVOsnHuVEHzSPl+S8duT+eOhgmk5asAyskFZnrabStIHcWFslgG?=
 =?us-ascii?Q?kNK7znO33lG2Jn0uVJlqbOSDoHWpVR0g2BdVbXmNdaFDr7noo9T5fJJ78aZI?=
 =?us-ascii?Q?pZuev6meo1HjXXbO3U9ZwyjDLF1Jp1IYgUjgfWv3bm+T6SMUAKn0oVc0Sz1D?=
 =?us-ascii?Q?mgjSli23j1l1RVTW1jXZM0fyoDowInfLyf04Pe3TZfFJJ7e/ChOMjdjAfS9D?=
 =?us-ascii?Q?3z6GKtr6fj1UQ7cpp/+CFnBUw8+LcNi4oCgZs9Z21kDYo8wbCdKHL+40KSmo?=
 =?us-ascii?Q?NueQFfYrEjtShl/2TAflQUyAfG3dFLedIgGwA/jw5RYHvaPOB841zdGTqTl/?=
 =?us-ascii?Q?hGRF0/qLK4Y7M3ozGBKSGTkN+qQQj3XqxMDd2E4aisp50Ms+drI22TzX6+3J?=
 =?us-ascii?Q?kDAtLnUg9EdzjhuMNvkteJasSd9Oq2yeSNQQHtfVSInLa+L57PhgMs8X76W6?=
 =?us-ascii?Q?Enw0fetzEPWe64c6+LvyFls/VAQ+hwWZBCDkBgzm+WQs6kFT29oUf5wSwwVB?=
 =?us-ascii?Q?4zBbOkUmEirVNk9zPTXA10hcG+KQfkNx1E38McmXMRgnSBDcxLlcVB/DjuGg?=
 =?us-ascii?Q?IihkvQgOGiDqhfqPVz5fEF2d7FCD5fIzhvyryWr0/xAqiZ5KgUFn2NcYDYCW?=
 =?us-ascii?Q?WJEyCeW+3S5Q5wRad10KtHW1S3sw/UNCmH5VfA7N5PKSL1QZm/6RSpfRzlZE?=
 =?us-ascii?Q?3Pe2SM+1yJH7c6QmKETsYqRShKq1W04DVD0gCkuthgd38U3cuP6ZGPC+MJtc?=
 =?us-ascii?Q?bBD+37VPL7s/zEP8yzZwcp9aTU6c+PAUUkVMKHCo4qVHbRIrjnIuI77LIBEx?=
 =?us-ascii?Q?L+TFQMHSnjO6QEpmlEEYwsbw74+L9QpihxIgkxPm9pJS7CusPPNz7uUkyAF/?=
 =?us-ascii?Q?u9mX6XXSpzptXDwwBJEqyqbJNS+dBjuuqgY0oUk6BGJMrZuchM6Pj2giHOX2?=
 =?us-ascii?Q?6hjvvvBsD3tQ+PHtQx17SuyO2CrPhJasidx9I42ZkBMEP/Hvyf7C/y05iG/W?=
 =?us-ascii?Q?ih3PquEpkZKfP37NcNbifwctBAFR9Evu2j2fcE7bMDdpJLS/a/DRgdS0XhtG?=
 =?us-ascii?Q?VPF+sYCyACz23S23I7Zr/k/urJFAPRB8FZPCEIhJ57pZOaLIMtSgapVrVQCj?=
 =?us-ascii?Q?fszlC8I61Bb7zMpLBVPSzcBb?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ac015b-d21f-49a5-4aee-08d92125df09
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 15:41:19.0275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dzO97RmvonKCbn2HZ2TRsge5/EJKrnkWA97lZLjOhwQ/WGBFqyyDYHcAXNfmr5phcoUIbtgxE3G12h1LGJL7iQUVV/dwrwk4CdCuBMqqOag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1780
Received-SPF: pass client-ip=40.107.7.114;
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

This variable is just a cache for !(bs->open_flags & BDRV_O_RDWR),
which we have to synchronize everywhere. Let's just drop it and
consistently use bdrv_is_read_only().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h        | 1 -
 block.c                          | 7 +------
 tests/unit/test-block-iothread.c | 6 ------
 3 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index b2c8b09d0f..09661a134b 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -843,7 +843,6 @@ struct BlockDriverState {
      * locking needed during I/O...
      */
     int open_flags; /* flags used to open the file, re-used for re-open */
-    bool read_only; /* if true, the media is read only */
     bool encrypted; /* if true, the media is encrypted */
     bool sg;        /* if true, the device is a /dev/sg* */
     bool probed;    /* if true, format was probed rather than specified */
diff --git a/block.c b/block.c
index 0270b609c4..d36329e712 100644
--- a/block.c
+++ b/block.c
@@ -265,7 +265,7 @@ void bdrv_parse_filename_strip_prefix(const char *filename, const char *prefix,
  * image is inactivated. */
 bool bdrv_is_read_only(BlockDriverState *bs)
 {
-    return bs->read_only;
+    return !(bs->open_flags & BDRV_O_RDWR);
 }
 
 int bdrv_can_set_read_only(BlockDriverState *bs, bool read_only,
@@ -317,7 +317,6 @@ int bdrv_apply_auto_read_only(BlockDriverState *bs, const char *errmsg,
         goto fail;
     }
 
-    bs->read_only = true;
     bs->open_flags &= ~BDRV_O_RDWR;
 
     return 0;
@@ -1549,7 +1548,6 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
     }
 
     bs->drv = drv;
-    bs->read_only = !(bs->open_flags & BDRV_O_RDWR);
     bs->opaque = g_malloc0(drv->instance_size);
 
     if (drv->bdrv_file_open) {
@@ -1771,8 +1769,6 @@ static int bdrv_open_common(BlockDriverState *bs, BlockBackend *file,
     trace_bdrv_open_common(bs, filename ?: "", bs->open_flags,
                            drv->format_name);
 
-    bs->read_only = !(bs->open_flags & BDRV_O_RDWR);
-
     ro = bdrv_is_read_only(bs);
 
     if (use_bdrv_whitelist && !bdrv_is_whitelisted(drv, ro)) {
@@ -4548,7 +4544,6 @@ static void bdrv_reopen_commit(BDRVReopenState *reopen_state)
     bs->explicit_options   = reopen_state->explicit_options;
     bs->options            = reopen_state->options;
     bs->open_flags         = reopen_state->flags;
-    bs->read_only = !(reopen_state->flags & BDRV_O_RDWR);
     bs->detect_zeroes      = reopen_state->detect_zeroes;
 
     if (reopen_state->replace_backing_bs) {
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 8cf172cb7a..c39e70b2f5 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -194,13 +194,11 @@ static void test_sync_op_truncate(BdrvChild *c)
     g_assert_cmpint(ret, ==, -EINVAL);
 
     /* Error: Read-only image */
-    c->bs->read_only = true;
     c->bs->open_flags &= ~BDRV_O_RDWR;
 
     ret = bdrv_truncate(c, 65536, false, PREALLOC_MODE_OFF, 0, NULL);
     g_assert_cmpint(ret, ==, -EACCES);
 
-    c->bs->read_only = false;
     c->bs->open_flags |= BDRV_O_RDWR;
 }
 
@@ -236,13 +234,11 @@ static void test_sync_op_flush(BdrvChild *c)
     g_assert_cmpint(ret, ==, 0);
 
     /* Early success: Read-only image */
-    c->bs->read_only = true;
     c->bs->open_flags &= ~BDRV_O_RDWR;
 
     ret = bdrv_flush(c->bs);
     g_assert_cmpint(ret, ==, 0);
 
-    c->bs->read_only = false;
     c->bs->open_flags |= BDRV_O_RDWR;
 }
 
@@ -256,13 +252,11 @@ static void test_sync_op_blk_flush(BlockBackend *blk)
     g_assert_cmpint(ret, ==, 0);
 
     /* Early success: Read-only image */
-    bs->read_only = true;
     bs->open_flags &= ~BDRV_O_RDWR;
 
     ret = blk_flush(blk);
     g_assert_cmpint(ret, ==, 0);
 
-    bs->read_only = false;
     bs->open_flags |= BDRV_O_RDWR;
 }
 
-- 
2.29.2


