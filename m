Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BC058AD87
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 17:51:34 +0200 (CEST)
Received: from localhost ([::1]:59440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJzbp-0002wO-MK
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 11:51:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oJzYe-0006t4-0P; Fri, 05 Aug 2022 11:48:16 -0400
Received: from mail-eopbgr10136.outbound.protection.outlook.com
 ([40.107.1.136]:43843 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oJzYc-0003rS-9T; Fri, 05 Aug 2022 11:48:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UeeocSLFMA1QZrm4DyhiLgz8ea9vW6kJf9fNQfyq74S6N6P3JTrinI4nStTQ+WgkBpvpsB7l6qXzCiLsdxu+VTCua0vTZp1J9PgpGCbuBKU/1agxzHDFW8IlP/4nDO+XrtEYfiFbiaEZYIMjFFM6BIS5K3s9HM82+zqpJwBgZ8pSmL+Aa8NJFmFopkBMWpazwQMM8H2mZMWK4WQP/cgFmHMKpq8n4KQ1n3nZ8cDlaclHxfKCIPRm0TX9cSnfOxesPotgz9lOOnvbEEZN2O42VTVGoJMvrZlVet8+t39ww+Oq1DSbU9M9Gt6m0yGlFxV48FABvBDakawPvbiN+6CgTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGqG2wiWGoWYDYtT57rAZA2DspjfuQ0ookeIDKQZLbQ=;
 b=NE2mU/3p42IpiaeFxafVGghPVccI0uquwgJjAHL5f0WPW28u4MOKsE72aWje4Wmrx0+6YAAq6Kb+WLYYPs5yd3ILZkz4mliXXr/v6OAEp1D39jKroGG90Ddt8O+3ojJVhguuscvs0btjNilnZBUx0U73XSXa+N23jQsAmrj31bAESE7UtN/Ppiv/I4oHuFJjYU26eApRLEESoftIdtW44+cU8AzGFTM5vdN8FwOGDG563lLrC6DmxISxR2mFnmDMEuAh+Vdd4PNCl4gE+CcAwrAnPcUIEv0yO96HtOaEf5vw0mL7xjWBWSlpkkkKT5xOWJzoJjJKb5biPvszVwl8Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGqG2wiWGoWYDYtT57rAZA2DspjfuQ0ookeIDKQZLbQ=;
 b=v4piLheKf6jvljH4siR4EqgUSGeZP7uv6WMLAFULBIAWu9r//du4H0+atQV8VzEqPFeUBfDwubI8EtYSRggcJvfMmnGIjBHdv0GBSxVtkHuIcKpbO4VRZG0nYnL1zj4YfONA6sCT58t7q1lxANJNE/XBWT+FvZ2xcx/qUdSAdDE6gz/meaRP8rCulLWoeFeFux+lcyvgmLT29KR0u2woPzgmV+98B28Oj60n86w8TDXzlggmEG2fb83kvG9trzMHnG4qBfSFE+kY2WDmST4qal7Y8TBo4rUyugfGypNMTMZ+VEwrj94RMeRvunMLcKERzerPZxgkxFxT0uVgzgHtrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PA4PR08MB7668.eurprd08.prod.outlook.com (2603:10a6:102:265::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 5 Aug
 2022 15:48:02 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.016; Fri, 5 Aug 2022
 15:48:02 +0000
From: alexander.ivanov@virtuozzo.com
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, natalia.kuzmina@openvz.org, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com,
 qemu-block@nongnu.org
Subject: [PATCH v2 2/3] parallels: Add checking and repairing duplicate
 offsets in BAT
Date: Fri,  5 Aug 2022 17:47:51 +0200
Message-Id: <20220805154752.799395-3-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805154752.799395-1-alexander.ivanov@virtuozzo.com>
References: <20220805154752.799395-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::17) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a7dc60d-3d5a-4d7f-c5db-08da76f9e0ef
X-MS-TrafficTypeDiagnostic: PA4PR08MB7668:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NnMtpks78Xnelab/jIiCVP1aEQJ8oqN6fA6JkU0zqBNN/rhDERzhr6vt2/9LVnBAy25QvwhsYr7uSJwpehGcggUjZn9VIju9w39XsUzQnG9WN4I4z52vtbdEJubVFFSMpoOjotyYYKV0zlsd1C7bT703rS1ZWUmPdHhBZALEQHugFhLzcbEfjOJLBsy07eKQQkYpJnTIjzPh5vv2BQRWDnoDvpD+IMRemna0SIPDdhNKvCy48vFSV2Aerm8lQcWS9bD2t0s2cQ2jbrDQRfUF8GHGK6tPak9u0Hqamtglj0veAoTQOCu/Y65iURtPgek6ieQWLeLp2iswOz6gVE6r2mQs03CoCKeCUsrfdwz7+LFUc2kzLUcImSKXKw7Fg0qrQMnGi4Z5kY0y5VOsYuxcggW18uP4Xz3/NhZF35R7ao6j71zebUnMNe9hdgi6H761nPm5Tbz4+SQFUIAk+sdnXCq0eW4PW/zySe4PbbOXPXfES2FI9je2sFUA/UYEhiG/o/ioAqpKTUxgKC7FUW59SRK+/uhsK7KiKGxMDOPDgIwaeTqq4+45/bzJ+5giKSENQPj2WjFruRB6zAhmZY5eNV3du5+OEuTDBLvQa6S7yT0bAR5SvwqQrYUHrFi+Wd5v206lFxc3Z/SQmv7XoIpz1by4jtAsrYKncIDJuLyE2J55+dw88kAfDFD3VEDJUQwVOiI+b7ieCdUD5hxgbr6zX2UOE+SRnMzMWd2G23OTEAG7QJxSqTiSuEG0uYZCkST6CmsjvwCoK02kunkaAn0LEBJwC8/xCqriu6I1mQBOZsA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(376002)(39850400004)(366004)(396003)(6486002)(8676002)(5660300002)(478600001)(66556008)(66946007)(2906002)(4326008)(83380400001)(38350700002)(8936002)(66476007)(52116002)(36756003)(41300700001)(38100700002)(186003)(86362001)(1076003)(6506007)(2616005)(6666004)(26005)(6512007)(9686003)(6916009)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FxOca50Dm2qbGeKJ4DmqXIdMq1OGlPJ/er3tXQj3s9TjILaKUq50EzO5Q5wq?=
 =?us-ascii?Q?cL44q9HItxZsn5OlP6Td5dWuP6loqt5OB6ujLi6E4uaUtCuM76yk/D9H38nE?=
 =?us-ascii?Q?yg3RmxGsnjrGs/Lk9WynwCVQ0U2o7PIHvwkq7rhQWl/WDuaByY0xBh/Xotj4?=
 =?us-ascii?Q?JD8UJRm5ZXLOK41nMYH2A64d1DsSOmDlp8wrllojwFDNq3Ma2g3DaTdjYJm0?=
 =?us-ascii?Q?hveI0ZOR2Aihv9A2oZlxcn5jOYx4DYoZTpigIG3FKbF0kERycNcWdx4AKigV?=
 =?us-ascii?Q?Zk/wTY4ZRearaENDZ4Uo37Zs2SD6ZYc3MJBuJW7oMFdZqtnPYIUarffKO8x0?=
 =?us-ascii?Q?466HH/g5DmGBa/jWYfOhXaNlAaDMyPfPHn8S/LDTJA0tZae1cWCT4s3TBeom?=
 =?us-ascii?Q?Ib7XC9P5HlCJ8oblas75e+ecVXKDdWjhuvlPvPJm/8no8XawoAGQlsJNfbFh?=
 =?us-ascii?Q?dXAEL0DjCeJXEzcG2NReBYE3V0MK8jfQB9ZuJaWbywancohIg0KNEYgKgdNr?=
 =?us-ascii?Q?diV28ufxVCBMgSyRE0ZvmeaN83t4dTov3+COWeklxDcHCH4SAnpXe4hqCUC4?=
 =?us-ascii?Q?VlwchIryAsZLnPzDMPHUTPmeWP/5sy4ERBxTujNvjcbGx3HB/mHu16DN0xH7?=
 =?us-ascii?Q?wBnDg4vay3WgzufMiuTVy2TnJB0uj8BsFpc1mgNtWKvJ/05hjl09B8b88VQJ?=
 =?us-ascii?Q?7B4y6w9AJapQqcGGKDlGUER1V0gJvKjDBzMx0y+iOFNSn0sFwXKbol4//01X?=
 =?us-ascii?Q?/4PWSzVcS5jMVLvbt3+mXnvGsBazoh8enlpQpOxHcU1Hckt6GFqOR5OzB4AU?=
 =?us-ascii?Q?4Z9onNM7OuUtZpvjD/krOwvPlbailutHELhOyv5SOumxFXBIMrzszZnQrEIT?=
 =?us-ascii?Q?dNuIihwWebTWTSD7u6eEEBW/qWG6ujYK7ezKv5D5cIc9Qiv0K9G6oTLe/FlS?=
 =?us-ascii?Q?hCtROO5JLtYVVO3z7zObzcySDsaHqKRfS5oBPi+G9hErCYVmpZSGveEcDaDe?=
 =?us-ascii?Q?k+9vFrNolhkmBbg2hKp42pBTXVh7WgGv56RrZMcj1bZRm2oaVFqPcaafrXSX?=
 =?us-ascii?Q?ss615F5KALy5B5P0nIPdRbU5Fo4T5UlZ6A4ZUbW+tyOLkafxw3u0MuPEx+j/?=
 =?us-ascii?Q?/1XtOJIXiULO2oa66D3Ym8iu+G2M6efLvGfip4vH5586sTW2lbPuzXplSl6/?=
 =?us-ascii?Q?EXScytjaiJ10gpWPQOcAnorZWtUAt/XqolqKH4IKyOrrJiRajROsCA6FBNcW?=
 =?us-ascii?Q?JmlZkb9v/yA/00pqPlF0sJY208XZxyVRFmQL7r1jC81sF3ulsB4Ig4ORvy9b?=
 =?us-ascii?Q?00BjEE19mIqtTNikTndLSfZuSFiHIQt8zTKEl7kRQGDqaYOVayzpJ1ZhvbLo?=
 =?us-ascii?Q?xOhuBozUHqjg+/nE+v0N1mig9fFvvDooYnoPhS0Fb3Gh61sZJPpdkqq7fweJ?=
 =?us-ascii?Q?w9uq+JlK/PpmCiNEw+gnCk6AMr7lKVmH/WnsaToYmhMhTdZhm+uOfyI7xFyB?=
 =?us-ascii?Q?097iZx5mNCQYyUsqcVGqUKJ5LxK1p6mhQHjV08C+JfIX+8qgtNMrSnMTRYGe?=
 =?us-ascii?Q?wHYlSBbvRGem2PcUtES6SfrWFWPSTDLnATkaqp3PDtWrg9pzJWuKwp2RPYh+?=
 =?us-ascii?Q?MRWdZlLA5H3jBqj6muF+fe8=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a7dc60d-3d5a-4d7f-c5db-08da76f9e0ef
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 15:48:02.0809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fSQ3mSpXHxVN3p7c3TRJH4NTV5O3+T/ABi3hOP8Ll+qrPQA9JUdjiSH0s3VX0Gj/DgToFKRUfFtU5PQVCV9GI8V/8nF3H5QqTLVM6KVILjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7668
Received-SPF: pass client-ip=40.107.1.136;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>

There could be corruptions in the image file:
two guest memory areas refer to the same host cluster.

If a duplicate offset is found fix it by copying the content
of the referred cluster to a new allocated cluster and
replace one of the two referring entries by the new cluster offset.

Signed-off-by: Natalia Kuzmina <natalia.kuzmina@openvz.org>
Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 135 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/block/parallels.c b/block/parallels.c
index a0eb7ec3c3..73264b4bd1 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -64,6 +64,11 @@ static QEnumLookup prealloc_mode_lookup = {
 #define PARALLELS_OPT_PREALLOC_MODE     "prealloc-mode"
 #define PARALLELS_OPT_PREALLOC_SIZE     "prealloc-size"
 
+#define REVERSED_BAT_UNTOUCHED  0xFFFFFFFF
+
+#define HOST_CLUSTER_INDEX(s, off) \
+    ((off - ((s->header->data_off) << BDRV_SECTOR_BITS)) / (s->cluster_size))
+
 static QemuOptsList parallels_runtime_opts = {
     .name = "parallels",
     .head = QTAILQ_HEAD_INITIALIZER(parallels_runtime_opts.head),
@@ -559,6 +564,131 @@ static int check_leak(BlockDriverState *bs,
     return 0;
 }
 
+static int check_duplicate(BlockDriverState *bs,
+                           BdrvCheckResult *res,
+                           BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    QEMUIOVector qiov;
+    int64_t off, high_off, size, sector_num;
+    uint32_t i, idx_host;
+    int ret = 0, n;
+    g_autofree uint32_t *reversed_bat = NULL;
+    g_autofree int64_t *cluster_buf = NULL;
+    bool sync_and_truncate = false;
+
+    /*
+     * Make a reversed BAT.
+     * Each cluster in the host file could represent only one cluster
+     * from the guest point of view. Reversed BAT provides mapping of that type.
+     * Initially the table is filled with REVERSED_BAT_UNTOUCHED values.
+     */
+    reversed_bat = g_malloc(s->bat_size * sizeof(uint32_t));
+    for (i = 0; i < s->bat_size; i++) {
+        reversed_bat[i] = REVERSED_BAT_UNTOUCHED;
+    }
+
+    cluster_buf = g_malloc(s->cluster_size);
+    qemu_iovec_init(&qiov, 0);
+    qemu_iovec_add(&qiov, cluster_buf, s->cluster_size);
+
+    high_off = 0;
+    for (i = 0; i < s->bat_size; i++) {
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+        if (off == 0) {
+            continue;
+        }
+
+        if (off > high_off) {
+            high_off = off;
+        }
+
+        idx_host = HOST_CLUSTER_INDEX(s, off);
+        if (idx_host >= s->bat_size) {
+            res->check_errors++;
+            goto out;
+        }
+
+        if (reversed_bat[idx_host] != REVERSED_BAT_UNTOUCHED) {
+            /*
+             * We have alreade written a guest cluster index for this
+             * host cluster. It means there is a duplicated offset in BAT.
+             */
+            fprintf(stderr,
+                    "%s BAT offset in entry %u duplicates offset in entry %u\n",
+                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR",
+                    i, reversed_bat[idx_host]);
+            res->corruptions++;
+
+            if (fix & BDRV_FIX_ERRORS) {
+                /*
+                 * Write zero to the current BAT entry, allocate a new cluster
+                 * for the relevant guest offset and copy the host cluster
+                 * to the new allocated cluster.
+                 * In this way mwe will have two identical clusters and two
+                 * BAT entries with the offsets of these clusters.
+                 */
+                s->bat_bitmap[i] = 0;
+
+                sector_num = bat2sect(s, reversed_bat[idx_host]);
+                ret = bdrv_pread(bs->file, sector_num << BDRV_SECTOR_BITS,
+                                 s->cluster_size, cluster_buf, 0);
+                if (ret < 0) {
+                    res->check_errors++;
+                    goto out;
+                }
+
+                sector_num = (i * s->cluster_size) >> BDRV_SECTOR_BITS;
+                off = allocate_clusters(bs, sector_num, s->tracks, &n);
+                if (off < 0) {
+                    res->check_errors++;
+                    ret = off;
+                    goto out;
+                }
+                off <<= BDRV_SECTOR_BITS;
+
+                ret = bdrv_co_pwritev(bs->file, off, s->cluster_size, &qiov, 0);
+                if (ret < 0) {
+                    res->check_errors++;
+                    goto out;
+                }
+
+                /* off is new and we should repair idx_host accordingly. */
+                idx_host = HOST_CLUSTER_INDEX(s, off);
+                res->corruptions_fixed++;
+                sync_and_truncate = true;
+            }
+        }
+        reversed_bat[idx_host] = i;
+    }
+
+    if (sync_and_truncate) {
+        ret = sync_header(bs, res);
+        if (ret < 0) {
+            goto out;
+        }
+
+        size = bdrv_getlength(bs->file->bs);
+        if (size < 0) {
+            res->check_errors++;
+            ret = size;
+            goto out;
+        }
+
+        res->image_end_offset = high_off + s->cluster_size;
+        if (size > res->image_end_offset) {
+            ret = truncate_file(bs, res->image_end_offset);
+            if (ret < 0) {
+                goto out;
+            }
+        }
+    }
+
+out:
+    qemu_iovec_destroy(&qiov);
+    return ret;
+}
+
 static void collect_statistics(BlockDriverState *bs, BdrvCheckResult *res)
 {
     BDRVParallelsState *s = bs->opaque;
@@ -598,6 +728,11 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         goto out;
     }
 
+    ret = check_duplicate(bs, res, fix);
+    if (ret != 0) {
+        goto out;
+    }
+
     collect_statistics(bs, res);
 
 out:
-- 
2.34.1


