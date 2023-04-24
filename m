Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B906EC910
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:34:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsYg-0007hO-Ay; Mon, 24 Apr 2023 05:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsYV-0007fl-DL; Mon, 24 Apr 2023 05:32:19 -0400
Received: from mail-am0eur02on20719.outbound.protection.outlook.com
 ([2a01:111:f400:fe13::719]
 helo=EUR02-AM0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsYT-0007Ri-Ti; Mon, 24 Apr 2023 05:32:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCm2wVNaGvBm4nkDnXpwxg11Xh4BjuJQkuNluHcjwV9HxnQWSFFZXTx5kEuokt8Ei9WtFY4SxT6BKFK9nYWTadmqR23dyrQccYmcfsWXlbBT8BhjHSge6F+1vyNxyvo7bjRdsobg8LlSfAG9eKpynZmftK0hlZi4I6Iek0SC1UerPkp1SD+8XX52Ie3C1TYg7U1bWFX3wsnGqUv8dZRrH2zTJEi4FinzwYXqeTAZvTGZmMp5LYt8e5U2WspUuoFMNgF0OtH71eWznARzwezb7olzMqdLORaT9h//5I6J2XpKo55B1wkFxwiN3LMVxlcWb84H2twvOh3x6pWLQc0xJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KK3P1C61R+xQsw5/2/BWqWPfe3WZoCYaX3UuCzBp0Ws=;
 b=HLZPlhFntws37K9uDQWCpF8LA0CHPbZQh63iLN6uJHt87FeJjN7y5QWG3PFISwjQmnNmkYlIyfqi3xU2e0MvoFdj82s7Sqo8KpPkFAC99jxY1hWX+Lbdavt+ZvLvEePRl7xVPJMdxmapXQGmqKbaQ5rMS1gqm/xgPesgXlAr8OvcgjDX1Ope0p4WCzgWHyMhtPH3QIa5vuPZbiVcBQ297KdFejzKpTjuUPm/TdRNEW/tSuPi2WX5huuPyZvUdqt3pVsB1UPAARWE/s8KCdjCL1Uu0IwpHXWLoM+Pj2BLjYJ2Os6PSy768w8KMWzlobLrTOKP3EKuA6WxbowyytwCNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KK3P1C61R+xQsw5/2/BWqWPfe3WZoCYaX3UuCzBp0Ws=;
 b=h9gug+1qVbOYoGLXDLgnARJwzHclS/f41lbZqkVp/LSHknylLRQUeNXlkG0IqBjOnYm87O8y2EYIwU2DcGOaaa+32GtW5svAij9LOotUzE7MjqXwQiBiJYnX+jHjR6O7DnW30iLJqb4pgCm0RMME04S+MjsYxFFbcpu9hXclsQccJ04TjPFOyM8wmJd8FkyvsbAHhmjPKeMVBWfKX0b5rtATFWfCvSKPeGtf0eYm+gvk8cW4zj5mojvNHQtQ+oP3d7vnQbVLVCl+lryr/eTIzCLMNHvGSJLqdyz8QzPmRIQsQwI/7JxlBF41e+Yi9e0AmB3M69/UACcSDUXSdAxeZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PA4PR08MB6077.eurprd08.prod.outlook.com (2603:10a6:102:e7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:32:03 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:32:03 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v11 06/12] parallels: Move check of unclean image to a
 separate function
Date: Mon, 24 Apr 2023 11:31:41 +0200
Message-Id: <20230424093147.197643-7-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424093147.197643-1-alexander.ivanov@virtuozzo.com>
References: <20230424093147.197643-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0169.eurprd07.prod.outlook.com
 (2603:10a6:802:3e::17) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|PA4PR08MB6077:EE_
X-MS-Office365-Filtering-Correlation-Id: df30d951-1dd8-4bd5-8fb6-08db44a6c309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Z0HZFxSv3XU1JTT6rT9j950MV6gMbffqn9Ck7bngD5JK+qBE7iIe+Vwze6/llT4+U3mIp71b8JMokAOi8oqwcYP+x0x45ENpToSQEI00QvzKOPZYuwqvI3Q0/UdU8HGLNEBuRqCm5lyROsw9hrQr9DOXRZpwKPc83dCwxvIr2TAAqna/3ewmTWwoA80iybkwkL+WM8Tl4MxUfsXy00G9A3qvupjOitUMviyP1UXoFfhPYWQq5QzjxHEUQUDQnXXpDLBLm5sySiRdD1ikIj9koIX+ku5r5MIILyA3P7vyJpj6VgXGLLtqnCT7ajgIXVxTMSi/stwdqjJsYA3tKhBwt6QOM4mq6YQWSaFrz0kqbAevYqR4fMP0FL1deFP8NcPgkZI8zZ+pFzaWSb9zo/Wcos7jPK3cxwiCG2yU+ljaHLDAxT5dcvnvcofxvKJPWljNAaz6xqI6l1Yrd1/Z+HsW0KKH3WnZQmpyvcP4Rj8HAN+64Szt2aXIL0turnU2LTbjze+Ud2uvK2xqZ/YJKQkWB3Qtn0Fo/nq7yOK+sjqiiWl1N2+AL2Fq2tImVPbDq8dAZBBUbVnMVnXGB0ok+CCJAz1ii/v5aNlrDttGshvlsI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(39850400004)(376002)(366004)(346002)(451199021)(6506007)(1076003)(26005)(6512007)(2616005)(36756003)(83380400001)(186003)(38100700002)(38350700002)(66946007)(478600001)(86362001)(6916009)(66556008)(66476007)(8936002)(8676002)(44832011)(5660300002)(52116002)(6486002)(41300700001)(2906002)(4326008)(6666004)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NflwiYO5omqTOmGBHpFgNqTqVu8gsbIhqbuFKsx8dTG2vOgOAoiKMOfViBUi?=
 =?us-ascii?Q?lV7bWK8YdrbYxA6lNmff7SzBtfY3H2QiCnWqpvYzOp5ecVB6PtA6+vEJPJIL?=
 =?us-ascii?Q?ieMm1mlN6GBU7eYvResqktmzJqIc7OsqILia6paR4BlTWoeEVkvSQoo/uoZC?=
 =?us-ascii?Q?bMZ6WtZk1eq6q8F3gZZexlY9VlAiibjjgoLBXcJ44qDRUTdlnApoYLHy5QmI?=
 =?us-ascii?Q?pGk42bJzWdXdJF0/IZUaB9EtXFzsnswdaYlyyXIeYYimK7aYF5zrlw0/ux7h?=
 =?us-ascii?Q?qHt29EeCe2DZY91G4+jFbLrR3Kl6k4yXqdzIxfZDJyQY2Kweo3UK/Xl1AR/l?=
 =?us-ascii?Q?BoFiASC3+RZMgMpvCtd8ekgLssFs6dfA7GxRDmgbwzzl8wbr3M8XPHPgIRKU?=
 =?us-ascii?Q?EudwoDww3W0T5iEw2obGr4J46hcapeSGrq3OtGb0osZT2Pd8kAov5E576MYW?=
 =?us-ascii?Q?ACNbjrVDCVR8xKCw1X55VoYLJogxpfOtSgpbbMRROiX/m0oeJCkgllKkhhdz?=
 =?us-ascii?Q?rM/plfP5nphTO4jdyu246J/YExdVO+ESv8wbwZfks/ESbvdJZjZP2linYylN?=
 =?us-ascii?Q?lltNyBGV3G3ue/+AX1FgZJSNS7eNol3QnVs/mpsZLr6OvNLVNtdknqL3Pwza?=
 =?us-ascii?Q?iS0HCIoTwO5z7FjvDCaIcXSbU4EJPlMkA33w604Q6n5TfROyVffhO7FP/SaY?=
 =?us-ascii?Q?nfoFHcr+Qpl6FhovZxnv4blT8r0o2nwM/FaBX+x8dwBpxKy1kYjzemP9rY54?=
 =?us-ascii?Q?IPRP2H/0vI4/WMbGXtMcWKM8xF7o8caVjefcXGwCoUx3V9ah+A6tuplMMUmy?=
 =?us-ascii?Q?Du/bsMO5oZtvHwh/fpRYuE+9xZaZiLJq7vKIe+9KKKyWi/rE2xMNnv3HNple?=
 =?us-ascii?Q?kYmGsO8a/LxMUf1BPMtaZEhbl10/mEOXdxI4wa1ds9fTKT4adoKW84ujcFIZ?=
 =?us-ascii?Q?vldLU5i4Gu9bEDf3pWNRxEzUdH4eJRkTcI5H5uVx9rUNZ1Dn+4BwZbKJONrP?=
 =?us-ascii?Q?+slq3I34MrVaX7MXi+D76ilax1aBrOZwgliZp++I9U/xKrueRleTlrf478AB?=
 =?us-ascii?Q?+TSzJjXLcqvmiL7s69kSzN06E6EUl7AIq5aWfzTlSG8dch5/Y6C9fuuF3uXH?=
 =?us-ascii?Q?SaVe2YoTOQm1QgNn8YorCrsGyHWFeydA16fBh2VXY0Jq/LGAfo04183TELZJ?=
 =?us-ascii?Q?oqxUjJdrKMc3PnoYK61e1Her7RZQMrjspAMNM4SuoZuejt6QU8XN/1NyQy9J?=
 =?us-ascii?Q?rjj7C80/FrWbTc57tsbXLj4Pip9oFT5lviNUOUoIaS85Mt8MKQsWjsZkvq+n?=
 =?us-ascii?Q?3wGwb3lhJkhS6z6d6gG3g/8/iFCkloK1BlJa2gG/zfKr8sQPrHrJjA1VtoDI?=
 =?us-ascii?Q?XKSaWI7w1Rl6QWSxkyVSCdDWWahAacUs6TtK++3GXTVNn6XWa0TIXdPEJ0Zx?=
 =?us-ascii?Q?dZWDa9Llb6v1AjSUq6Kea1Na2V94LmDLdJ6sgyKNBoAM7yWI9txkVegVfsRe?=
 =?us-ascii?Q?Ccwu9OfLpacSB5SaM+Pdnbk2ir7dWK6OWoDRPHFtG0yzcfrYHKNZz/LpbUhy?=
 =?us-ascii?Q?if+jJtZ/3Pn+Ugn9b2YIRGpTQZwYsIfO2mpXZz7s78UbsZN7huEB3IRYaPkp?=
 =?us-ascii?Q?sw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df30d951-1dd8-4bd5-8fb6-08db44a6c309
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:32:03.1576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9mj6u+A1qurOXxeY1MhlWcCE32DJ0JQ4h/UUiXq5eQSd3OR2LKOSaNYRv/9/K7TByq+fJVXTKGgNobm1mFhlEpFy5/LcghNf/q+qlBYRXZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6077
Received-SPF: pass client-ip=2a01:111:f400:fe13::719;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR02-AM0-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We will add more and more checks so we need a better code structure
in parallels_co_check. Let each check performs in a separate loop
in a separate helper.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/parallels.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 7f076db001..4f14bac616 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -420,6 +420,25 @@ parallels_co_readv(BlockDriverState *bs, int64_t sector_num, int nb_sectors,
     return ret;
 }
 
+static void parallels_check_unclean(BlockDriverState *bs,
+                                    BdrvCheckResult *res,
+                                    BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+
+    if (!s->header_unclean) {
+        return;
+    }
+
+    fprintf(stderr, "%s image was not closed correctly\n",
+            fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
+    res->corruptions++;
+    if (fix & BDRV_FIX_ERRORS) {
+        /* parallels_close will do the job right */
+        res->corruptions_fixed++;
+        s->header_unclean = false;
+    }
+}
 
 static int coroutine_fn GRAPH_RDLOCK
 parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
@@ -437,16 +456,8 @@ parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
     }
 
     qemu_co_mutex_lock(&s->lock);
-    if (s->header_unclean) {
-        fprintf(stderr, "%s image was not closed correctly\n",
-                fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
-        res->corruptions++;
-        if (fix & BDRV_FIX_ERRORS) {
-            /* parallels_close will do the job right */
-            res->corruptions_fixed++;
-            s->header_unclean = false;
-        }
-    }
+
+    parallels_check_unclean(bs, res, fix);
 
     res->bfi.total_clusters = s->bat_size;
     res->bfi.compressed_clusters = 0; /* compression is not supported */
-- 
2.34.1


