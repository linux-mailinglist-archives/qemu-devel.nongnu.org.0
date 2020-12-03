Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA422CE198
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 23:29:17 +0100 (CET)
Received: from localhost ([::1]:58994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkx6C-0005Vh-Dr
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 17:29:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kkx4c-0003zF-Cg; Thu, 03 Dec 2020 17:27:38 -0500
Received: from mail-eopbgr140112.outbound.protection.outlook.com
 ([40.107.14.112]:63621 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kkx4a-0000Cm-VS; Thu, 03 Dec 2020 17:27:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XfjcfStFzCI00vqX1KtLrIJ38irBxf5f1kp+/rYVBIMMsbdBKz+uaSW5QOYpvA7yaU/9exE3i9PNHOP5SCXXG9ZFojVPV5R/nu00oMKwrr9EXgFMgC3SVZTlVY+LUqTXD3g5ouVU/eMpNttX0OV6vDS6wfz1CdZtMMe5LWNhMjkgEMODUdf4s1fnlY6mwT0eyEp4HK/75AlJ3weHoF8WTmRK5nbf2AzjTdjHxCZuNLNN6j8VwHNf18hv0dQpnaiEg4JYDdYW4EB0ktff0GCoYLmkOOrCsogy4ZBH1HfeC0cdK0TXoZK5lpj4YcDxQ+3hf6ocs/5nM4FGpAxNjRh8DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chznBUKkFWYtR8Oem/tPGC5ixxu73Z7gycElPJtiRRU=;
 b=SrLcphiYsKNNCf//T3Mknuk53FSop0ns9a+b3O68499x+z2bBCzw7FPIvbAnfGJOKVUTfzJvQmgJrkMaqVCiD+dJR0CC7aX7kpTtXpAdJyTAFIRSXPX87rSWvWumWSUpZudR0AHqJMIoM8Fs4bRTIQ3a/QUUtHSCmgyE4Wfq1W0euO3d6MJFmVChB9ka47hdnk4uT9lvxA5rAGXc0ZSSJue44ar8n8/a99zORFTib/VjpSuekaJoeoeZzGyKHZLkwB5YwOZBh39A4WjPBIwIrffSVli3ktBO/31GgQR7JosIf3JpDGBLV/5S0DEK9VN9Hrrr6yObbn2v4WNrjKAAxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chznBUKkFWYtR8Oem/tPGC5ixxu73Z7gycElPJtiRRU=;
 b=n9p1w5Czws73Z8JhFaJ6y01dfzdTk2FqCZ/tI8kthp9x4RTuFkiWhWiY7mJW5lz9aOG7yl3Cs9NtWWxRYaXiwYYGzIhqpShA+mYb3LRp2xe5gqT8Mt67jzex6swu2ea86xXYRODnfzjkD6VI8TqkSxhxR7btJcnAOcwq7QV/bMc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5446.eurprd08.prod.outlook.com (2603:10a6:20b:107::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.20; Thu, 3 Dec
 2020 22:27:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3632.020; Thu, 3 Dec 2020
 22:27:30 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, eblake@redhat.com, berto@igalia.com,
 den@openvz.org, vsementsov@virtuozzo.com
Subject: [PATCH 2/4] block/io: bdrv_refresh_limits(): use ERRP_GUARD
Date: Fri,  4 Dec 2020 01:27:11 +0300
Message-Id: <20201203222713.13507-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201203222713.13507-1-vsementsov@virtuozzo.com>
References: <20201203222713.13507-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR07CA0036.eurprd07.prod.outlook.com
 (2603:10a6:205:1::49) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM4PR07CA0036.eurprd07.prod.outlook.com (2603:10a6:205:1::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.7 via Frontend Transport; Thu, 3 Dec 2020 22:27:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6ac3eea-4808-40dd-d9f4-08d897da9f15
X-MS-TrafficTypeDiagnostic: AM7PR08MB5446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB544634842F60B2E166322894C1F20@AM7PR08MB5446.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:53;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mpc0oBIRtg6NSSm4YmMHLDfX2T1b6VXyQqmPDrY2H9HokmYqEeBzaCpCacRb90s6ORyM8lvVuwEUTLrLz22C+XqYyZLJ5/nztBUn8QLuKscEcLAYuZlW9x6E7w2ZcIuPzjBupky/gkxRDl7fO1XCPKD/VGLhEvyJeiTafoO+M9W8GpdtZBAMDqPhXl9YOwx5hP04wzZHYmUqKYxiY0OelKXP0ndbS2jyruCHMSGMA34DRGeKV1gpq2SrvHGYW/XaoOSMAB9Wvkgv+2+CrJWvyoLlp1C7tlWlg0KUA9CmMfayFoXWYePn1WKGneeDmeLeSinyzTiMsqZtlARYI3CUoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39840400004)(396003)(366004)(136003)(4326008)(2906002)(8936002)(6916009)(2616005)(36756003)(5660300002)(52116002)(6486002)(478600001)(66946007)(66556008)(66476007)(83380400001)(86362001)(1076003)(8676002)(6512007)(316002)(6506007)(6666004)(956004)(4744005)(26005)(186003)(16526019)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?REWoym1DqRFSf2nHkKmj6WvrqFdsoCs240Z6qXydu1iCmnLmVdpFjnMKw1kJ?=
 =?us-ascii?Q?2p0pu+BdTwfDhDsMzFojDsb59dL0bvm0rz4levOeKw74KdLTPv7XJjQDuFFf?=
 =?us-ascii?Q?dK76eFEM2vM3K+fV3NCeZzefSXpR2P9727jWl+u63qSpp7bB6gj+DmUiJ/X+?=
 =?us-ascii?Q?SsrR/h1+iPiMime5F4nQrfurABNyQWt25BhvYXmyfWxW8hA4A2w9GwoRRmc9?=
 =?us-ascii?Q?FPe0NU4agXMUNlXFKMj+RFNgp8GOYbEq3EUiXz6X3f+MUwd2XUngnUbOvkYU?=
 =?us-ascii?Q?4anf+wuRYPdlWz0hHNFDzJSbZ9Xr50b2CN4pvjl8s9tiNdVZ8sF31w2cm5ET?=
 =?us-ascii?Q?fCKWei2m1xkzaG3RBy+X5xtSL718KJ9XFKFudmpMoiwMBkcPIZ+Mepq+2pmH?=
 =?us-ascii?Q?DOCW1DcLtNOhye14EwXdeJoRhY4e2n4G1kU5dWHsFo/TI8riDv61QHXCXkUE?=
 =?us-ascii?Q?vDSnAps7Gcr2eKA+z8JFk7b/EZNVvTO0HGER2fV5z4gQnEigBDrIKFY+o2jD?=
 =?us-ascii?Q?w0Rw8Nic49R95IrogovkjrcEuhNoTxsZ/sAk5+v+1J6JrgfNltRfsuRwTf3u?=
 =?us-ascii?Q?jWfmE/DR0SRzONU45K/4oymCP7WY6vTlQ51N+5Eec+ysK11UPz4M74dYffPJ?=
 =?us-ascii?Q?rihEU3TViloNPeTBc4aMBsOtsfSBh5OEr8waXen046J2Dnlx4PY0um/ZX5BF?=
 =?us-ascii?Q?FyccYM5veRo58NC5lVYunNdkIA31kLLSZPa82E2mghDoPHYPAXotm6q0Nfrf?=
 =?us-ascii?Q?kALYju908Et7wk4DWS6pTpZPFxsFT+mZReF5nF9H5yQEWBSimQE9MtvvmupC?=
 =?us-ascii?Q?mXPf8lc4BGe7iGO6I/g3pJKQZOHC/QHHYHHMjyaQsyWRzmdX9uc+RRRObW61?=
 =?us-ascii?Q?INhyq6+QSp22P2aJ2NnAGbZBGz+yBDsZEiFEovd5VkF9Wi6Yge754nSDyAGY?=
 =?us-ascii?Q?PvPh7sgvA6hj363KExx1l9wo7jS+XduYaTBPoSh436vV+I8c6JwpzxzDoX3D?=
 =?us-ascii?Q?f/WN?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ac3eea-4808-40dd-d9f4-08d897da9f15
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 22:27:30.2222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JOC9eNhQfXY62qY/0sAG7ej6kd+hHaU3e5SMZPEZv1PGKxDl/3KMATGjcIyZrKs6UxxJBQheknoAkn2+DIiB10L/ZhNTeUMecNm2RJ6aRuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5446
Received-SPF: pass client-ip=40.107.14.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

This simplifies following commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/io.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/block/io.c b/block/io.c
index ec5e152bb7..3e91074c9f 100644
--- a/block/io.c
+++ b/block/io.c
@@ -135,10 +135,10 @@ static void bdrv_merge_limits(BlockLimits *dst, const BlockLimits *src)
 
 void bdrv_refresh_limits(BlockDriverState *bs, Error **errp)
 {
+    ERRP_GUARD();
     BlockDriver *drv = bs->drv;
     BdrvChild *c;
     bool have_limits;
-    Error *local_err = NULL;
 
     memset(&bs->bl, 0, sizeof(bs->bl));
 
@@ -156,9 +156,8 @@ void bdrv_refresh_limits(BlockDriverState *bs, Error **errp)
     QLIST_FOREACH(c, &bs->children, next) {
         if (c->role & (BDRV_CHILD_DATA | BDRV_CHILD_FILTERED | BDRV_CHILD_COW))
         {
-            bdrv_refresh_limits(c->bs, &local_err);
-            if (local_err) {
-                error_propagate(errp, local_err);
+            bdrv_refresh_limits(c->bs, errp);
+            if (*errp) {
                 return;
             }
             bdrv_merge_limits(&bs->bl, &c->bs->bl);
-- 
2.21.3


