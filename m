Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F46C2DBB27
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 07:23:25 +0100 (CET)
Received: from localhost ([::1]:34330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpQDc-0008V3-NS
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 01:23:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpQ7y-0002cn-FO; Wed, 16 Dec 2020 01:17:34 -0500
Received: from mail-eopbgr00123.outbound.protection.outlook.com
 ([40.107.0.123]:51180 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpQ7r-0001E7-DR; Wed, 16 Dec 2020 01:17:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=byUn8QSV59OB0uaEC8i3DOWCjQf0W+KXhQK1BlDimp11TSgZ0AavaLvKaTCKgIC4bT7BtyuYEl9/TDtzURFoED8urxLvdxrdSkeFbddvjKXAgLrjCYL+YFwHm0hX0yr005ZaWrOBo1G3mr73iyoaAYrHQ/q6823acVApfmCB/kyDk+E9OgvUggXHXhcm70iw+USDTDeazcsfKI37hbCQP2tl7nDLWeUDvB8iT1v5OrLBB1fjmo71hdCMuvTbsb73tEr2bb5DjdTu6DXk+86NQL5hVsBuCB2Sq5twFLGEwHo++bwxl9NbHzlE0BNwYbSitizuHYlLOziV1kKiqP6wPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avDoDJt8s6WZWtYVhHRa0PqWPJYjWOUDROl2/vpS+sQ=;
 b=auoGhZAplkA1VJtsjjuDP/naAZQS64UWtBAVLkK6ewtj+hEBp/tEqZxef92XGzmRn69TZ4JI5OO8Vowe/vCWGInwHCYkFbDt0L7BU3FTCsrFPL1cqCmVBKsQq2JzpKunoG4MtOoVz97WNICbFlTPed+o9LGo7LQnvaueahNBxlnRd6JolN6/YmKeX+hwnxrUrZLB1t6xmYZdchJdfgjULZou2CSQ9QPV5NTILdQhbuZ59DyDOtf66cVNvkTsO0PN1BPsE+vQgSSpoG8MFNtvu2wZjKIC8TLkwF29wNBI8Od/W8K2Ikmx0lw5v1SfMDsjEQFl0S3ispnndToM9QLHvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avDoDJt8s6WZWtYVhHRa0PqWPJYjWOUDROl2/vpS+sQ=;
 b=Mxu31HFdHmVoHVli5GLFS7A2GNcsO4rz7sB0mlWFR9r45+OTjeRssNAV0WaxNdca5UvmBGeGVcDqH9V544oWFjijY8ktj6ayRf/77UEq7W05MElAn67cxpQtzLDVFD1OO8hD+clDTz4AZ+HoKr1Xii6kvb/VfEGesuOew4AfoWY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6309.eurprd08.prod.outlook.com (2603:10a6:20b:29f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.24; Wed, 16 Dec
 2020 06:17:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.024; Wed, 16 Dec 2020
 06:17:17 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v15 01/13] copy-on-read: support preadv/pwritev_part functions
Date: Wed, 16 Dec 2020 09:16:51 +0300
Message-Id: <20201216061703.70908-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201216061703.70908-1-vsementsov@virtuozzo.com>
References: <20201216061703.70908-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM4PR0202CA0008.eurprd02.prod.outlook.com
 (2603:10a6:200:89::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.92) by
 AM4PR0202CA0008.eurprd02.prod.outlook.com (2603:10a6:200:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 16 Dec 2020 06:17:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5133af0f-36d6-4f83-198f-08d8a18a3d4c
X-MS-TrafficTypeDiagnostic: AS8PR08MB6309:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6309CAB6D186CD19BE0F2012C1C50@AS8PR08MB6309.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QtDZnLUsHKm/ZSWCgQgUfW7weYxq9IquSD/EohH3dIqMjh3sY3lr01EEp1Yd+xq7gEbxS96SeoW85ekwx5Urp/s+e/JsALPThrizGg5hQfPagTcNT9NuAsS8ftFwlRBpRUpSpkWwhQD2QAkxGS9vxxvw18tBg2QbdUM5A2lMBe0HpDmWW87XxU0dPiuQGuT72sTaujCONl1dG/Y/22XRfFNmocbi8nWOrWOMYw3xGgmGjbD+jd07L/Y9w0ZVhkEdHX/G/Lxqfo89VHliqE7wBK0HSntipg7D8xHlEFHK3GQz5ikJTr5vnDu47DAeULZC7NYzrhbNWlX0pRUZZJHF8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(366004)(39830400003)(346002)(4326008)(5660300002)(66556008)(66476007)(186003)(16526019)(956004)(6506007)(6512007)(2616005)(66946007)(36756003)(6666004)(1076003)(86362001)(6916009)(316002)(6486002)(52116002)(2906002)(8676002)(83380400001)(107886003)(478600001)(8936002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?B5jGsAplPcgLWWGfCj1sLP+JySG+mq1uoLRqefY9AsSpBS4Sp2E4yUcVmiQ/?=
 =?us-ascii?Q?n5/VcOl1u9OvM2o27nWBR8orPC3kgfcgoqYtRiHXumuW3jusIxwAemAg2+j/?=
 =?us-ascii?Q?Ww+K/pxlgwDkvF/iAue3C+uBH6q2M7r0Q6oMwa0Cr+PEcwWDePNIUWMvC/vA?=
 =?us-ascii?Q?aG2r+6u7kPRArTVNrQLGEcmo97IvKK7q0WAlDBONnhy+eMv9t4mYm4mYIVsE?=
 =?us-ascii?Q?P5WIbaAIzsibNTi2IdOMziZ/xsEGf8qW0zmPN4k1tf7bLm0LnmhEgFB/dSqp?=
 =?us-ascii?Q?rIQ5VZF0NIn0vBbgBVvtITJGKo2hykswvvL+sMmwiISD7ayPYvrOJDgTN7ZV?=
 =?us-ascii?Q?k3J+MuqZaS1Pnbf5LcvhLbVL9yrssIOH0ea7wqARSws3tT/TRmCZ7loUsZKi?=
 =?us-ascii?Q?zY0KqVgT4ciOA3b2tCYRIzZEQ/4kmV0ZU5QyijCSbQqQqfpDQTipBf2wI9F1?=
 =?us-ascii?Q?03wmDdKI51DwtDIBMrNnbbTQbYgl3pw7FR/Z7xC1/1cHHXhDvirhsR054j0i?=
 =?us-ascii?Q?Jlvh7JRTxwmPgU5HzdUMIqkd/1F8HLsPE6bcqjHuHTixAf4A43e8CGM2Md/Z?=
 =?us-ascii?Q?2MBvEvp/82z2yRLTYFdgljTAnoj0wIt80PxRxHoMjbFLwGkDe0WzoOrI6Ukk?=
 =?us-ascii?Q?LzR6DokXJ6ofbrdlwHZkDN4U65CQbPhrtQ+OYhT5nR48/nA5+s+VyncN1arA?=
 =?us-ascii?Q?5WUNHLA4MkVlI8eGKU3Q29RQCI+4dsgSFXzVBx8zg0i++NOgDf4ckWEY/AXY?=
 =?us-ascii?Q?hbttGjG815XQ7r/Ajlh6fh1WgjpkFvoRSey9TNfF7TF7O+TeTUOuoC1HMree?=
 =?us-ascii?Q?c3gWYxZVEdfmpmdLoSOUFfEdBUrtzxWble2H9Zz59x2aF3qoRreHQmuhh5j8?=
 =?us-ascii?Q?yARhiYthMQV9h45GI6DAS226FfRz965X6tCfQPa6bU6nP1SMv8G5U42GUgBI?=
 =?us-ascii?Q?SfS+Sn+09TglVICCrlnt3oddr4CNCK6OlWzGAPL56w59f4+ZxBT6Uq5LulOY?=
 =?us-ascii?Q?Ityg?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 06:17:17.8453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 5133af0f-36d6-4f83-198f-08d8a18a3d4c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/55NFxjbHZ4hNYCptL6aTJ0ixathbX34eXwE5WNXznSANmVnf87JaSvPQhSmm6Xz/bVbPbGMNGH/Z+TGyFZ3asVCYfSWOWIdKeLcLgEAE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6309
Received-SPF: pass client-ip=40.107.0.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com, den@openvz.org,
 andrey.shinkevich@virtuozzo.com, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

Add support for the recently introduced functions
bdrv_co_preadv_part()
and
bdrv_co_pwritev_part()
to the COR-filter driver.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-on-read.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 2816e61afe..cb03e0f2d3 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -74,21 +74,25 @@ static int64_t cor_getlength(BlockDriverState *bs)
 }
 
 
-static int coroutine_fn cor_co_preadv(BlockDriverState *bs,
-                                      uint64_t offset, uint64_t bytes,
-                                      QEMUIOVector *qiov, int flags)
+static int coroutine_fn cor_co_preadv_part(BlockDriverState *bs,
+                                           uint64_t offset, uint64_t bytes,
+                                           QEMUIOVector *qiov,
+                                           size_t qiov_offset,
+                                           int flags)
 {
-    return bdrv_co_preadv(bs->file, offset, bytes, qiov,
-                          flags | BDRV_REQ_COPY_ON_READ);
+    return bdrv_co_preadv_part(bs->file, offset, bytes, qiov, qiov_offset,
+                               flags | BDRV_REQ_COPY_ON_READ);
 }
 
 
-static int coroutine_fn cor_co_pwritev(BlockDriverState *bs,
-                                       uint64_t offset, uint64_t bytes,
-                                       QEMUIOVector *qiov, int flags)
+static int coroutine_fn cor_co_pwritev_part(BlockDriverState *bs,
+                                            uint64_t offset,
+                                            uint64_t bytes,
+                                            QEMUIOVector *qiov,
+                                            size_t qiov_offset, int flags)
 {
-
-    return bdrv_co_pwritev(bs->file, offset, bytes, qiov, flags);
+    return bdrv_co_pwritev_part(bs->file, offset, bytes, qiov, qiov_offset,
+                                flags);
 }
 
 
@@ -137,8 +141,8 @@ static BlockDriver bdrv_copy_on_read = {
 
     .bdrv_getlength                     = cor_getlength,
 
-    .bdrv_co_preadv                     = cor_co_preadv,
-    .bdrv_co_pwritev                    = cor_co_pwritev,
+    .bdrv_co_preadv_part                = cor_co_preadv_part,
+    .bdrv_co_pwritev_part               = cor_co_pwritev_part,
     .bdrv_co_pwrite_zeroes              = cor_co_pwrite_zeroes,
     .bdrv_co_pdiscard                   = cor_co_pdiscard,
     .bdrv_co_pwritev_compressed         = cor_co_pwritev_compressed,
-- 
2.25.4


