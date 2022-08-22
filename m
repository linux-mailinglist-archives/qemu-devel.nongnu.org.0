Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C766959BCCF
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 11:27:40 +0200 (CEST)
Received: from localhost ([::1]:50326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ3ie-0000fh-1y
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 05:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oQ3NY-00060u-8W; Mon, 22 Aug 2022 05:05:52 -0400
Received: from mail-eopbgr60129.outbound.protection.outlook.com
 ([40.107.6.129]:44014 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oQ3NW-0006yB-F5; Mon, 22 Aug 2022 05:05:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4omuruiKpvFpv10dNBlOvVhv6qdX5Ni9x5//ZkHdAv2RHFgPV6vhxT/ZP1XBqkEGwovtPf1ziBfhXhwsGu4tVvTM6QJ18HsRQeGOAx7JS5a+Ofz3dnCKc48FXperuqpGnCS6HjlfrP0cJTOrDignHTZ92vK6sBUCinssnKRw5JwlDi8avkm1Ebh48U7VRa6zk9Jtal4P3OuDMEFMXBHq/VhvPRE6HA1tIccuFF5xTU6WyFnI3rKKf9a1vxDuYBg5tN9zu3yDmChjR10N8JnIwqrH7CegV5lxx5moipMtinC0ekcoullVKjfqZ33jGKtBE+5GVGQ14+DVnUxk9wHow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NY1d+vmyYp73ILXzqGFIEFj1iysQ+Wo2GXLo4IrsRVA=;
 b=MCpP2ZbPL8KOFJ1Fq+ICrxl3oSgQPxPOQfj5cTcSPBXCoGMykrr0mpH0QArpL5wyHlyFTH2UW8cfdOCWhkfkGx6Eraf8lRmX9wq5jvY/NJOhitI3Ta69mLxihEvW8/9SjYwXC+R4W9WOhLUXTmiZrPGiLUkAhWfEhtl7Nls2Bbmlcq/CW4Ybw6BLHHvAXnhrd/wEu+dwwb8erS40wnibaVT4amKWH3HQkdkCr9QGj5b2Dot+vPLn/55p3lS7ZFeGV9QthGiris16kqQglw6slA7EtFM9QrGeaeBraZApYzIKKs/Hf1XJQu858llPKbec/hO5U6AFvPiwaxJ506scDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NY1d+vmyYp73ILXzqGFIEFj1iysQ+Wo2GXLo4IrsRVA=;
 b=SWOZhN7a8GtaUpFcQ50CuHx3ag7Sk00glWQGqtukUJ9Uqb1y3dwRkhOme9JbkpHbII3k1UEUW7klm6E+srPoxMvEJdRC6P7lYr0Ltk91iTgxbEmOVNkHQIDYe+moRZNFoV7QqlcWhw/ZE2qzdAI8L8ZKS1YUfoCIJNasbtk2eadhf2wMJNedZlfG/yiwE+Ln2+zFWCXlXr/5Xbqn6B7fWzU3u/M+R37J1Kvu5dSB4RlGoYnALY7FuIIz7dSBpShI6z3v/WmrLma2bcHVXyStu4YKeoQCekuR2BH3GkCKvQq8xR2skh5hMYMozYHWlSaXp/xx19z8DdAvvz/rAH70aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM6PR08MB3382.eurprd08.prod.outlook.com (2603:10a6:20b:47::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Mon, 22 Aug
 2022 09:05:36 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%7]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 09:05:36 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v5 8/9] parallels: Move statistic collection to a separate
 function
Date: Mon, 22 Aug 2022 11:05:16 +0200
Message-Id: <20220822090517.2289697-9-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
References: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::16) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d587366-a7c0-4c46-9604-08da841d79dc
X-MS-TrafficTypeDiagnostic: AM6PR08MB3382:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P1xNfYAlcwifrGvOuvsNaW69P0IW3FaPZ39x9L1l9ar7bziyceytDWsK/DbfB4viPit2c7rpKSgvh7cJlT7f2ZQGD67Z0wIZ049rPCNJgUXRglF6O8r2DQ/AM6SJDHDwtrWN1Ma2hxUBCM/qV3qtk8EwFdwdHb3IaBX6506nm91cYjEFc4ZFI8S8Fqb+KfTBW2XdKD/BZ6ftm4WDwDBHmDvKreWs//Py2BBdf0a3S37gK5fhQ0AXeSg+7pLtAdcI6YBrkXKsqCXxfbEmpDUh9aPf3bLF9wDIV1dw9s9TBrNN/Ucddfc9IQhUKvaHjYlRBmvrfNPsypKAHgNINHiOCVNCvEqXKKEYTT1/z4JDbi98xmCBnyTZB7Nida00GGKIwAmotUfZXVQXfVuedT4Fqls4Vpu5Buk+7IVIUHkLXLhQDA7mJzTfTrmbkmesHyuCZceBh5pBkxb6ns6McHZGwNKfB7FX6AI/6D070Ew+3/fRqk6M6ij1riWP9NnsBLAsYJH5YG/klXvqUPrT57FePG06AUmPDTF0Wi6vkbRRNryabiVcDadZS9L8537BDTlvB3upJKHbhIJ93tzZo+R/mD+4wp5Xu7oqJOKZPEpK/3sSs5vlKcRFgIbHFMwhUKogQZNeqUs2Ig3sjVmFnhXGl2oNtzx0/hy0juSDSBHiwSoUxfdwleT06tWq7MTs40xWSOt3Futq4dgfNrEKdYsiyf9rwLCQI8wTOjNtt4XrPXg/1Y+D5qSd3B9tSAEvooe1NjtDJ7VFbRfxE+APuz7XhQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(39840400004)(396003)(366004)(4326008)(8936002)(6666004)(6506007)(6512007)(26005)(5660300002)(44832011)(52116002)(83380400001)(36756003)(6916009)(316002)(66946007)(8676002)(66476007)(66556008)(2906002)(38350700002)(38100700002)(2616005)(1076003)(186003)(86362001)(6486002)(41300700001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rdMHosnmmA9OFbi5be4vCgvDn8LNeke42qdQ6+/Kh2OzG3hTg9F9QQqD4jdY?=
 =?us-ascii?Q?WZfykjzt+6eLjPhmRqEkauo9tioEQuOzGCFNmz+i4CJgYGxPXbx0x1Jzqxxk?=
 =?us-ascii?Q?nBg85iBrzXg1DlG+Es2LqibqcoFBeDx8uEJYb/TSnO7CEwEHmAoLEqqwoJ0f?=
 =?us-ascii?Q?uSVhzVoxDyoZcjYP0wcGUPy4NhEgDcQC92ZB9klBO4KhFhu7rrOdCGOMdTOU?=
 =?us-ascii?Q?pYT85tCPbN0lKy4BDVi36RUho/sHlNWTAWg85pOFDxqCI53W3gwlAK0cYSEg?=
 =?us-ascii?Q?6ogg4PIqD+bxS3XM1bTW09Wj/80XBylFlR1bn8NdImttlxGVeM+fryM+VVOE?=
 =?us-ascii?Q?N6cs1pyevSkv9aAq/aqS0R+WMy+qGCykMdPlspuekS/oZJ6d4zhQkWcS4OQ4?=
 =?us-ascii?Q?LWDY0HePMkyOZ/9V9MSg48kHY341gX4YhNFNdwYhBjWvRlsb7xvGbnF8W48J?=
 =?us-ascii?Q?/+EMg/pVJGURiJ++ZT7oLikQk3dzW73YcLBRr5lbKEkXuK+aenLrvT7tX401?=
 =?us-ascii?Q?ZD4BdXJVaZR82cT3WE7wd/YUHbgSWqkjASJWcAeOqJ+y+h3hwgMI/Qy8K+4j?=
 =?us-ascii?Q?1j6B/t+XoGvMoEmzk0dmz19BfxLiW0TUAeF79tWDPf3lm36t4IP7VIMEGFqD?=
 =?us-ascii?Q?0tolgwVstLbCxY2ytBRxJ/G4ImkgYvEXhxi65/p5pP4Z3qeC0FYU3mYfAWAn?=
 =?us-ascii?Q?y1+T20vGI5ihOLeuPh9ymH03aiy2KKj1jvZ4aFxBMZ368HGhWxjpUrBaVEP9?=
 =?us-ascii?Q?zBdZmbhoDWyLG0UlcSqP/s22qp+d+NOPRIO3sXB2ecyI6VhI+GcLtDknrI4Q?=
 =?us-ascii?Q?gGte9xaGcdfG/vbYQNFfHiZe2+Kkaf0yyZIf9vvFmiFK2ctdCSpUf74xQDCo?=
 =?us-ascii?Q?BbQkHe4aiv52HoffTn5wU3cyMuAP8ZncE/vvU9OYor9ZBjKTOUkhnHRetSdI?=
 =?us-ascii?Q?nSFqbi5xgzOkKhLanD0XC3zPw5OQznPzJXHChTi6L8Dnx/WaUNoxNO4fGcPZ?=
 =?us-ascii?Q?BtMh1P23pPUHS6KzXTstGNuHZeDKlsxWDd9vQCfu/IfuWX2Omuo5TpR6WHc7?=
 =?us-ascii?Q?uUNrT/VsvFlvgz6AChS8kG9QZCzOfnMmgvELheT8r23VOPll+sOwgnTBM7Dh?=
 =?us-ascii?Q?6zVUt/oxVzZSwN70qGMfQApT/hwJAVgPaCndeRJAc+5XHBaz8xx9c/tVI9bp?=
 =?us-ascii?Q?riwWU1vXGsCYZUcppmv5zfdCjjxV/yZWjGCp9PEvbREhRNkAjT9no1Z9Z44z?=
 =?us-ascii?Q?LpMqR4+/NcgdXVDaUZxRZdaRFkzGQNZjsXvLedzpgntptiNgDwqBS28Y/UL6?=
 =?us-ascii?Q?URdapqLcmVy/Lav0uh+XKTmWN1xb5TjZTe3Wk8GMxMM0XPzqtHjfm91LHrf9?=
 =?us-ascii?Q?RbpSmoP6Ewqjv4xfQOL3os7lRTpj6OC1eSpAZbnODQ6ARXAWaN6vqHJ9GWkx?=
 =?us-ascii?Q?N7f9TC5W2jbIBgKKHQTGuepGlj6bHILsRD4dcLIXPLXn4kz0+T/yIxeS9Ms4?=
 =?us-ascii?Q?HCsDDiZNnDIvEjcxI/ldEh+sPd7d0zCFaZJbWXTyb1wc0ELxPwGFH8ScT6eB?=
 =?us-ascii?Q?bkjTkvTNlauE4mB7g8bekKrEa5DU+94JIbAhhV1JlczLkdldflBr7E+6VY1b?=
 =?us-ascii?Q?Q0i1Bmv4Fi9tKXMl4BPLZQ4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d587366-a7c0-4c46-9604-08da841d79dc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 09:05:36.0857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XWa+/Mdef4jMoFHFFktq9wdyR7yvZPv/YIR1PXbvfgpC6hU9ZlwYZ1enIgKfzKM/4gLYLBbwG/byKL490z2lCLJFtbqpzcFhtjLaeNU2wQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3382
Received-SPF: pass client-ip=40.107.6.129;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will add more and more checks so we need a better code structure
in parallels_co_check. Let each check performs in a separate loop
in a separate helper.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org> 
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/parallels.c | 53 +++++++++++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 12e8d382f3..0fe6dd3237 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -528,47 +528,56 @@ static int parallels_check_leak(BlockDriverState *bs,
     return 0;
 }
 
-static int coroutine_fn parallels_co_check(BlockDriverState *bs,
-                                           BdrvCheckResult *res,
-                                           BdrvCheckMode fix)
+static void parallels_collect_statistics(BlockDriverState *bs,
+                                         BdrvCheckResult *res,
+                                         BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t prev_off;
-    int ret;
+    int64_t off, prev_off;
     uint32_t i;
 
-    qemu_co_mutex_lock(&s->lock);
-
-    parallels_check_unclean(bs, res, fix);
-
-    ret = parallels_check_outside_image(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
-
-    ret = parallels_check_leak(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
-
     res->bfi.total_clusters = s->bat_size;
     res->bfi.compressed_clusters = 0; /* compression is not supported */
 
     prev_off = 0;
     for (i = 0; i < s->bat_size; i++) {
-        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
         if (off == 0) {
             prev_off = 0;
             continue;
         }
 
-        res->bfi.allocated_clusters++;
-
         if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
             res->bfi.fragmented_clusters++;
         }
+
         prev_off = off;
+        res->bfi.allocated_clusters++;
     }
+}
+
+static int coroutine_fn parallels_co_check(BlockDriverState *bs,
+                                           BdrvCheckResult *res,
+                                           BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    int ret;
+
+    qemu_co_mutex_lock(&s->lock);
+
+    parallels_check_unclean(bs, res, fix);
+
+    ret = parallels_check_outside_image(bs, res, fix);
+    if (ret < 0) {
+        goto out;
+    }
+
+    ret = parallels_check_leak(bs, res, fix);
+    if (ret < 0) {
+        goto out;
+    }
+
+    parallels_collect_statistics(bs, res, fix);
 
 out:
     qemu_co_mutex_unlock(&s->lock);
-- 
2.34.1


