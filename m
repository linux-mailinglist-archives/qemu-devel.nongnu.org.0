Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBF038B1CF
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:34:35 +0200 (CEST)
Received: from localhost ([::1]:47464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjkv-0004Wk-VU
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZv-0006Iy-Ms; Thu, 20 May 2021 10:23:11 -0400
Received: from mail-eopbgr00114.outbound.protection.outlook.com
 ([40.107.0.114]:2638 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZt-0005ik-LB; Thu, 20 May 2021 10:23:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwMLVqDmt3U9PTJ6argVzwLQz/R50dKk1O2oZmLOCBuqfsdrYiQKSj7cgioqCOL+zSVuAn0n1YYPQsHsTWhIBS+K8pH3xunAtphXT8PXtR/JzrPDdJH3WpSYErutwhaqrKfdJxX2ltUtpSwDKcKdEpizjcml5/0Kxv/nyqCNQ8kAgmZKLFnPuqJL9EWOdFUvUwKGDcou3QdMKV5Dma3CM4WGjKCJYbWfREx68rh04eFjH6/85SgFLmzQBqp0GTrdatyFgzzAE77J/OpVbKNlhj+wnQLyo0xBxlG7eeQFc26QLfrnOFqiydOrCLW6INB/8aC2I5dAtsngeoHYSjGc2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/q9xcd+/7Yq7hQ6FYf2psORRuWQaXyG4dc0/KfIYO+4=;
 b=Bv5NFUCywF4epFiLzqgIMD/qvp7zbunlO517hLP23xdAX+0Uyr0Mt2VsFeFk0406lnqxxFyNqd/B0tKC7QCorCYuKS87AS3jC5pWenwXpJn0u3Rk4BFoNjHSA4LVClBMnWh/ORnw/pjS+mEh0GeM81H35sydclekkeSgwdAa5qsAK9zzoQYtOCtGQzfvV55SGY6KmVr6gKbPmAxwv3dhcMWTPUy97dPorJjI4rlzjtO0YORz60qtZ0c/joFTGYGcj4+FmyoRkjlaWn8gTWKbMxfl2C1W/FVcU0Qphr7vBX3Pph7/ERy0eYRUMJ5iRHB4jcZgZdQRi51zmiEltXFpQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/q9xcd+/7Yq7hQ6FYf2psORRuWQaXyG4dc0/KfIYO+4=;
 b=TF/TYwqfvsz0917e6t0CNaWzVR4yG/XU30Wy26tWFaSHxuIKrVSrmhhDRYXSBjrj8yDHS54IIvq/Rj+e4+N2hpoKB4X7gFSYuYcVPeUN+4zsTnUYmCMc2A6O3MXzi2nhekSWVJzzSufcDf5T3XkwRpB/U2Y4ECTWHEJ0/GLSGJQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 20 May
 2021 14:22:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:22:46 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 17/33] block/copy-before-write: cbw_init(): use file child
 after attaching
Date: Thu, 20 May 2021 17:21:49 +0300
Message-Id: <20210520142205.607501-18-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210520142205.607501-1-vsementsov@virtuozzo.com>
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.197) by
 HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:22:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0c87a2e-967d-4d91-255a-08d91b9abd69
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3544866B36D6F1E5571CCF6CC12A9@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:40;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vj+7pBhTGHoUpY6cbdfXe0HVIGSYiY8gzPcxl/OljKy5kfTWYORcymSoDA8bSvjeUUq4Sx7db2t1vJgChje8X2prgJGyV6FdjJXben3RUEARCyf4BhaYatVYKVkazuPSF0dIm+n/DL+qSgJjYoKMXks9C0VVFWHbGb0JIqy4dhj4YZWC6eDpM97kFFBgw1JYHnQDduHqfUt2TgqRhfm3PEVeVDvUVKkEwIKzsvH3NuYyGxbFagP5ViJMfvqfFbDpUyBUDNMICIIg/+L1IClKS1Xc5RQYmetySOSjiQ823ja47spWH85lvRcZu2uNkhTYp1R3Djv5g9cxq+b244ahKbkXm47ImwAHnBVNSJfHZAbzVsnV5aj9YVcEN0qFzTp1BrBCjup8twXcKmwD/laSlo8bJsRnsvtXKBchLUIBdlaXjhUnRez/xsF9rIacMnz0tSF9Dhx2GukIIGCPLVod6CB1WF4YuT2a6e9eU/5FaMrosqXBa59BWsgmCJZ66hmwSTqEwzY2sxQOwGvRNKIPeJVHQecyN4phIKY7G1hMpwaDfeKhhik9bL4SlkA5GShjdnb0HzbgFywKPjH4LLupygfpCLCfNy6LdiPzoUZPwlL215nHaGqQIJiV3noHi2BarAk7fLkZ45UQA+MupFFYN/jZSZoF0qH2GxUF7QDTcXxovZcXECNmOwdLlFcQqHkT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39840400004)(396003)(136003)(478600001)(1076003)(52116002)(86362001)(66946007)(66476007)(4326008)(6486002)(2616005)(66556008)(956004)(26005)(5660300002)(6506007)(107886003)(7416002)(38100700002)(2906002)(8936002)(36756003)(186003)(316002)(6916009)(6512007)(8676002)(16526019)(38350700002)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?jDNikNd6P7Sl3rQ5oXK9QqY2mlYmSzat74sYpa3bdXGZ4G7qjxZjQV9twf1n?=
 =?us-ascii?Q?sqrM/HeBap5kjfCVkshPC9iZ8MywKRhmAkeBi+d5bCagP0RPPg6pc/TqAmXq?=
 =?us-ascii?Q?k1vDd0nhPPHOfI40zkawP0X/KREX+7O1moZkJUQ9wWz/DUiVyvZOfQveGQXG?=
 =?us-ascii?Q?qR62fABYTuPwtOf+/ir197dUGvffBBpX0/+TVSfCH6BH2WU95aZ3lSKTFuJa?=
 =?us-ascii?Q?co9Ki8OywYRn3dATrjmN1eqID4B8Uwo3eQCf7jRUa7gMhAL/KNUqZsRQRA8v?=
 =?us-ascii?Q?EFbqpszBV5tDIpIK7ToQUWCp4HeLYxLVLM84NoQkrwwBvOEpgskKvcoj6x98?=
 =?us-ascii?Q?FOC+y6lYSE0cPjr0j1ZWqE7uSLleeLdB7AreDRmXf9cANwU1LX2nq/ksFxbj?=
 =?us-ascii?Q?fFDmpJlSX4ehSo6dEztlVRMxZwWi2sV0JK87z42ZTRmY99BTS6wKFRk9QT0A?=
 =?us-ascii?Q?q6703RFbPHIGLeDtuEu+0sDT2TeiAwG2tkFLY8B7ycAgDjHiXq0kMFeoNDpm?=
 =?us-ascii?Q?mbXfEbGZH+qB4GgWO8k3D0Qx0/9TjEi2F8vm2n34K2eU4QTG9n6TKPh+PRFu?=
 =?us-ascii?Q?1eSP8j1DMVYmQdmdio3W4IaJee/T5yWpUVGtCiqfZ+ZcPBQgePk3qTT8DimI?=
 =?us-ascii?Q?j0fSnFEzzt3I4NaoVZif8YMhpKbj0fTnyHq/pH+RGzuid5VUhxsPxdyGr2F/?=
 =?us-ascii?Q?6krapcjDqnj2wASdHr6WTDGgI9RN3Jy3eCMvl/SrNshGkoQFuvaW54yWZlvi?=
 =?us-ascii?Q?egkQ1tj3rycMz2vU4tlpHM3OTPaZh7zMFuuvFUcHHidWesLSbuf0QU82Z+I9?=
 =?us-ascii?Q?Dt4+fw+6MBZTvwlXx2dp8x3pOr1G4TGBWXn1FadVEiw8FdfLd+6rGrj6DYE7?=
 =?us-ascii?Q?nVWr8NS6ySVs7VbHJDezMeS0k3VuPMRUw/hSUnRoMKhgo+gMK7li/ynI4cRC?=
 =?us-ascii?Q?Hg3c33OhRp/xus2WFhLgZlm3Ymyq8Ne0bvDmiY1c6C95r7xcHSZkiEdHWiQz?=
 =?us-ascii?Q?NRPqKRl7O5lqElb9WWeYEuXPXtHtt88ZyYNQxk7jvUKwCgtrNZFWIoJD5709?=
 =?us-ascii?Q?zFic7ORCLX8j0SA3W5R9DcXuo40doW6pkfU4c/W0IsRGMca1tXfmJ2Mlw6es?=
 =?us-ascii?Q?VHW0nnpXA5NTt1iKEcFOUkgeUaE2Qm1MeC2onJCqJedpdptVjDEv+BuRbZXL?=
 =?us-ascii?Q?du6H72u/RPmFsXoJ9tSe7FqvX+R3hRrT5ZUZB9ZbwndZk1Ci8Syy+/ZZB8qD?=
 =?us-ascii?Q?vKUS7j+y0qdTGLxzvxrNUEIzUytDhMyd3ofseY44ifJGQ3Wasyu4MvamVnCn?=
 =?us-ascii?Q?uNP29xTBpkWNWcSglGVyZW/t?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c87a2e-967d-4d91-255a-08d91b9abd69
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:22:46.8633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QOJkHcaEibBpotI4h6jBl1ONrsFpKGpSVl+esoTWLxfGQ/rCRF/6T755WlIN5eDDyUpYPabEbp+KSr43BtKLFzh915Kr98Lpuj4ed+ewhVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.0.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

In the next commit we'll get rid of source argument of cbw_init().
Prepare to it now, to make next commit simpler: move the code block
that uses source below attaching the child and use bs->file->bs instead
of source variable.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index d7f1833efa..4858dcf8ff 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -149,13 +149,6 @@ static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
-    bs->total_sectors = source->total_sectors;
-    bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
-            (BDRV_REQ_FUA & source->supported_write_flags);
-    bs->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
-            ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
-             source->supported_zero_flags);
-
     bdrv_ref(target);
     s->target = bdrv_attach_child(bs, target, "target", &child_of_bds,
                                   BDRV_CHILD_DATA, errp);
@@ -173,6 +166,13 @@ static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
         return -EINVAL;
     }
 
+    bs->total_sectors = bs->file->bs->total_sectors;
+    bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
+            (BDRV_REQ_FUA & bs->file->bs->supported_write_flags);
+    bs->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
+            ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
+             bs->file->bs->supported_zero_flags);
+
     s->bcs = block_copy_state_new(bs->file, s->target, false, compress, errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
-- 
2.29.2


