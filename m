Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5919682A7E
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:29:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnrz-0003V8-6z; Tue, 31 Jan 2023 05:28:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pMnrv-0003TJ-Pq; Tue, 31 Jan 2023 05:28:03 -0500
Received: from mail-he1eur04on2122.outbound.protection.outlook.com
 ([40.107.7.122] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pMnru-0006XE-6i; Tue, 31 Jan 2023 05:28:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULtTUaYwV3akWQ2YczpCbHPCB90cmDlQAcX+r1PKd9Nh8xxL3dx5hXkPqWtEpRROL6wB7MpQOFsND/OJabJTBh2cl593eIIrLFbLKMpc62KT7kzZd31yj3D8Nn/p6M8ZWj34U+98JZIX7a4s6Zab25uouaS485qxF9TRmH+XA+FRtICFdotzBd9+mA7LU1aSr2NPXhBXSYPjEvQOa4F8shghQHnkEIFYMDjiI18ISkqWhnzwOdbAWso5WYgveK5VUZTBWrzgMVeQ2MTUCnD8TdoP4LnsH5Sfvmv72P/Yf/wvna8kgaMScyU5HrS6L4TEejo9gHZsy9vFWFph3v1Jqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWNw2FjimG9keLRlRJjXGZrCUECC6PKOPARIoIOoQRs=;
 b=d4r/+cP8/sUSvQpJv9wWhHH1R3Bt0EgjHGv8omTFbOq84NU6FDXAwKwjve82JM4suor97UhZtUSEEp8WXcborn/h1GbVHsDjdGH2TfDcJl2cZPBSBIBhXfd5Eyo7+7+ThIGiWAZVI6E/uC2uttXmmvS5877jVYt5bF94jynNM9paAT8v9Amzs0XeJRqlAHx++1im22LQaZ4LxoiPKXgqd8WLl1fSZ83NxvETO26Pmn5lFDCBKk7NoJ8jixhfGxZz1rAIPDOJVl73m3XnZwDvEYvyLu/5ExucWeufAzSY4KuKSVNAqRnw4oEkEjexKH884ovytSS9IaiNiD7BjYYXvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWNw2FjimG9keLRlRJjXGZrCUECC6PKOPARIoIOoQRs=;
 b=C38YuR/VPAWtBKeJD+H61nP0diYzmfxmYIK+qrRWwA06IssBoCccOdPjaUfvTOLb1RCEmc4EaIcLYLJjY381IPLH7JKbUbd2pngwJiNZn8k0u8BslRw8Tt950aKZ3n0yagwRhRm+7IaylOmsYF6l3uXUz/ImtGEU0RWV9oRI0DHlcH95Ylp3n5qt1Wds0UGiVf4/kWK5hMUwUF7ldcXl1oOIUBTCtnwekd65jSBRXDbOlKI1d5V6gjkb50e1YkWTFQD9JxgtNZMRT3Lun5FXpgwjVtZMEPqAQq35FBYfHBW2DR5WrZOITnH44V1mLlT1ez8xCl1K8dqWYD1SX9W4oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB10217.eurprd08.prod.outlook.com (2603:10a6:800:1bc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Tue, 31 Jan
 2023 10:27:52 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 10:27:52 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v9 10/12] parallels: Move statistic collection to a separate
 function
Date: Tue, 31 Jan 2023 11:27:34 +0100
Message-Id: <20230131102736.2127945-11-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131102736.2127945-1-alexander.ivanov@virtuozzo.com>
References: <20230131102736.2127945-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0602CA0016.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::26) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|VI1PR08MB10217:EE_
X-MS-Office365-Filtering-Correlation-Id: b097a0d4-5854-4c64-2c56-08db0375cf29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hWcpKp8d/apIrfiXVOtM4Q6Jadse1ruyEozF5d+49pOil/KJSG51eS4OHUE3SeqRyWfY1jMq9U+bTVKID5di41Em66pPZb8Ei0CflE9JGWeYf8Bjg9wD67eqiIkc3kSt2qys7uqn8zoc/Wl68/d2UhK9gPQ/EhEFzgD3hwgRkC3OlQMO3tJPc/FxSFScSACvjbE1T0Fkgfdp9adoEbdNFecHZEC79iWwMl9hGN4+BP9Hzck55ccwTgyifphfuZDYl2Mqbv4DzVgzGNeq908qrQVtLApfbnTDv/OhcOGsoKLSAhwZK1jOpQy8sLOIpb+Gw7ZAkgQzUxdwhX645Iynj7XLfejUiVUHmHneITOrVH0AGP5ESmwsGqRP1RIz6zZrIg5BfmF6fhG49lucZlkl35yVxIn51zNynuWbmhKm/SIJRBsoSeAgIHOI9HKOUmgG+ft7hyBZfZm0TGcbosZ7K5M9gM/BlWFLudikxBVPK3CZbErCW67D74mQuK7JXY5QEZ5T0vBAPAEAEY9TWb027z4hVCmhYbIa6HF2kgIMtIUuXUS5DXTEiXjgTl8gKiLpDm6VwrJhW9DgkHVgbAHGqADIvquBmyGjnp1jfGy6YrxnLVl22wbMuK0U3o6mjqL6hZJIT1ZT/o1jS0yrHhDfaHQhaZ3hYuFVNz3STSD+8EhnGw3UOuG91m//Qs6PUcEKtXKhcjZZfBrbWHFk2Qqv4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(346002)(136003)(366004)(39850400004)(451199018)(478600001)(6486002)(26005)(186003)(86362001)(52116002)(83380400001)(38100700002)(38350700002)(2616005)(6512007)(36756003)(6666004)(1076003)(6506007)(4326008)(8676002)(66946007)(66556008)(66476007)(8936002)(5660300002)(6916009)(316002)(41300700001)(44832011)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fw5uy61poGZB//hMOa0wNXlu2wMUvcBDJzY4iIKTmRn4eJ6jcqWwQOvfMXiu?=
 =?us-ascii?Q?tJdF1frNMGHr62Zov0/S1bvfV4ZMSgabmvZFvTJzEBCmwJgParkAVoQw3YVC?=
 =?us-ascii?Q?FLvLMrwGic5EWUE35T/BPSozgjLU8gYErsIUnRk+iY7p3Z9utwr2uEPbCfy3?=
 =?us-ascii?Q?AAvaUniR9JwETTCnugJdTYqfk5tp+LmbVK2J8Y3Y5nru0y8Du+imY0E1HWIF?=
 =?us-ascii?Q?mveGxcPuZRRtFnKSMox5UMmrVWXo5xuIi00mtO4kIC3Vr1JjjLeFBCYMmJDD?=
 =?us-ascii?Q?rNFrdBYn/lsRmzXwnzY1Oj7GJbcLerMf5EPGkfsJvOHJOvipFlsaF3TmoVpY?=
 =?us-ascii?Q?pU4LBEhnUY13MuxpM7MEUm5Sn1rqINopSQPg2edPNVqmXJx/iL1IE4GWcj3T?=
 =?us-ascii?Q?giJP/ezpvHIsAx14eBo4bfsyZLk3BV1AnaKectoJFRmHzRSBKt+psbm52GW5?=
 =?us-ascii?Q?6YHQarZDjpJ4+aDvNzPSlgZbYGoVR1o/rrVzo/oPkQ/F/Tacqm4wa3kb5NJ/?=
 =?us-ascii?Q?DqO5XzeAug9hqpBfCv+PJmrsyLS6mlJ9fZxL2Ka9gqh4e7IV9HgS6mKWhw8W?=
 =?us-ascii?Q?8qawz+C7cAeTJalRkqYJaQ/xP2X4h3CIyo3/ZdysCUfwjZVCugnJxCny2BTq?=
 =?us-ascii?Q?l0SlG77bpInid6heoDm47Ml/CEktt9/Y8vKH5eIK7jLL/mytPypBU+TTnryt?=
 =?us-ascii?Q?LfLciU5D6NlkDUFQzJcoSOsIll9amADDXUgZ7Xn4Xe5CeAYrQF3xpPLGh4FL?=
 =?us-ascii?Q?UWW0VnurADOsyfYDDrPiAAsITiph2HYw+xwVYge73kN3TumW4G8ofj/tXFXD?=
 =?us-ascii?Q?J6n8Bx7Fua+pI+K26wOqxU56WUMNHcw3dPFiJJ1rH+vksvx9O13U1t+jinNQ?=
 =?us-ascii?Q?vq3N8LIIXvyKkIPJc1TejMSKU7R1qx4PpZ6dgCFbkcFqBipnbnqgmwRPn7qq?=
 =?us-ascii?Q?KT0XlF3nXkyKEkK99rIoL2pWINV45+B6bWsUJVve1Zlp3TZHSSyv1Byd1NvW?=
 =?us-ascii?Q?6saZyonAZ/kmWbVj9ZdIeKbOUQbF9ToehocLut9eB9n+MsyWwPJifEfT/OaK?=
 =?us-ascii?Q?JjXTLArXZU+PvrOaBmqtRnuMmi4SgKdfX/CbNn3v8yOfxIehGbY+tK5QwZpx?=
 =?us-ascii?Q?lxDpcHDXu6JOBxF7ds3MVIt5Pwgg2i6z3va7MAb7KbrRMVlP2/rlMoHQUKd9?=
 =?us-ascii?Q?1NzLy9NfRZRETsBvGbr0VTLQj4CAgQPrfftQdXzzYCTHIYPPvB6w9D/7H9I0?=
 =?us-ascii?Q?ZIZ2bUMzuKdviyu8mdLKisFsdV/Riskq6jJHQVac57NH9xZGpfHV4PWMRVeA?=
 =?us-ascii?Q?qsF80YGfUwa+JGMRjv9Q/7aX5JyzJECjw5tQS79H++fDQDLmIAf8H6Dls79G?=
 =?us-ascii?Q?sRfhmDeAjSQq41QBccC/uuwPg5EL2Y7gqH/G1AenR3R7NpgO0OyOvObEQWaT?=
 =?us-ascii?Q?bJDxb9aqUEN1nHBg1/acr5WpZ/SHoFN/y5I2wB5O0/EyQH3eBMi8wz53gRgw?=
 =?us-ascii?Q?cWL6HCg9bVzJ1taBlV+9TGRZjlTAB4x+DfwcA7mNik6Ik7m/eovC1NJVKoti?=
 =?us-ascii?Q?Nq0yipXpokL8NvdhZr7zkGQEIJzOmNalvcsNcQCk9iv3nLz6sO/fwOx6Bq2b?=
 =?us-ascii?Q?A6cmF9ZCfuvoEMUnT0v3EFY=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b097a0d4-5854-4c64-2c56-08db0375cf29
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 10:27:52.5790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W304lJOvs7H3/M76DegdQ2iuQeOC/+wLWnhH5z2plRao2PRCM6pcV0raaRGMUJhoAE4cePTR4Yjj2wmnRN2KX5iQ1TOtN09bv2DIRax3wP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10217
Received-SPF: pass client-ip=40.107.7.122;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 block/parallels.c | 52 +++++++++++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 22 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index eb39db53ec..23c9ba7b7b 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -522,47 +522,55 @@ static int parallels_check_leak(BlockDriverState *bs,
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
         if (off == 0 || off + s->cluster_size > res->image_end_offset) {
             prev_off = 0;
             continue;
         }
 
-        res->bfi.allocated_clusters++;
-
         if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
             res->bfi.fragmented_clusters++;
         }
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


