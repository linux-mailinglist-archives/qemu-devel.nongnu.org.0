Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C15759737C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 18:03:13 +0200 (CEST)
Received: from localhost ([::1]:37846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOLVg-0001Mn-Fd
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 12:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOLNA-0006oF-Vx; Wed, 17 Aug 2022 11:54:25 -0400
Received: from mail-eopbgr60098.outbound.protection.outlook.com
 ([40.107.6.98]:6277 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOLN9-0001Kk-5B; Wed, 17 Aug 2022 11:54:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Enx64UbdmPrFP/cdlgSFPk6WHTKV8c9qSGKm04ec0XvkZ2wIBHDrTfJgYKufAO5E/8rVLnU6UwHV/gYHQqxStcVw87yzYkcQgvveaGWuBWjn9YyUyvzEEeb4JwgTf1RZgduNeqVVoz6VzrtQAkdmT2Goju7etPyFwUzhZeXU3LVHR8JLyqdJNWZlPSer6qmRujqjYH2KS5qwA84G/87ffelNOefW9GUnllloob7yOCmQfzmlsWHLA3gFpDvaH6k1C2ASzY8zCbKy4/Pin9+Sa29XUcIHJwEKCaAl5qe2W8H/jLwCTBh+H3rDe3R6eaSkFhCx6kCx2fGNsvIQFlc/Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sIzwjz4l/3PAnNA05/8DZ2l9Vu+py+GBj4HIzSBoh8=;
 b=crMqujKaUWXMBt0LwDWISQ4B55Hv1AWKHTAeoP4foYOe3UBEFXAaIyOELzEOnCas0UIGpqHwXsqGjlOrC07bzmfuvmgkus24r5uZAd4/ChdmoTSev9Fv5uhqpUfyHo/al7ckKF+dxF9Z5UO0rQTep5clzDuJciyYp5oynatPmxKUR2/kFV1rzvJRSBIdUScgWalq+G43YYUj9T+xsE2nB8SbuAkzocMSv9GJGXaWJ8aDRyl32myP0k359c6u8KCgPYAiUeNbzsaXwd3vcnFDAguWzcf/0mdTduJdq0wDOX2je0Clg4yZEQnkysEwULjacIBI24DsR0H14mmVN31C4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+sIzwjz4l/3PAnNA05/8DZ2l9Vu+py+GBj4HIzSBoh8=;
 b=lFRB+wxlGqt1YE0Rl/LivsNWUsZpddNQ5FMnFGTJpkTrxRNr0oxgYb33YKRqomqzbcq1T+Sw3a3IPkZGTb6WWXloh6lo0EDw5aCmCCwIUUWEXnzddEo0hvV+Xb6jzxxh6DxSngjWnPGMG+L9P7d1eQcQ38bK0QWB2NA/q+ES0QQ4vp7CMYhFEGHsqGPkSJvHtefqkpZniQ3rtbKa+rErJIKHtBKj16VeoBEMHXfYe7IEbkoTiOZhtb+AbRlpwb1yXq91tGwSK+3tt/TflIl47J8CElyvIGk29IkwpeDnRf4Vb/DBpRB0+D5I1QPDa0/2eac3na9mp3MB9j21CWrxxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PAXPR08MB6783.eurprd08.prod.outlook.com (2603:10a6:102:131::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 17 Aug
 2022 15:54:12 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.028; Wed, 17 Aug 2022
 15:54:12 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 04/10] parallels: Add checking and repairing duplicate offsets
 in BAT
Date: Wed, 17 Aug 2022 17:53:55 +0200
Message-Id: <20220817155401.2045492-5-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817155401.2045492-1-alexander.ivanov@virtuozzo.com>
References: <20220817155401.2045492-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::12) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a75320e2-3fb8-4a55-bb27-08da8068bac6
X-MS-TrafficTypeDiagnostic: PAXPR08MB6783:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FSx6OmEx5A2fIL2VGOWQK3lOvItUHjRkSaOted+k9wE3Ah+gEhtUfvNJNvu8xdcMR0b9t8sGvA+OCWb0jgxVcb+b9U/OgIUB6tSy6VFG42hNLfHS9sFyZmYr+EPVMfC3ghPQI5DlSV7W+MEk7mQhcLrIASYkcKCSndhKUWD4MG9VAMRULcRWdWfEyGXTJezC3iZz0LX4AYWv0l8bjQfw5WkAL0xFqr0R/cHbU5dz/0KJGDuhmDg++EFHC3IUKeGiXx7vKeY0Og/TvPPQR3tbpJcpUbK3M6QmZmyUTLcrAtyFCZF9nVyB6GdKCQT13rwvRdRQr0QR+Gp6dkDf3QTqEHgJ5QPUiSe8NucjSuk7V2d6gU2r7EyTzDg4+E9InjTEitGeUikbhLISxwGAQrEGfm/KJk5+CZr0Thfmg8s1CZXcYvWk0IfAlkIyPbiNGvKCE3ZP7FDkwkV79sk9PTNhdxLfDXzKjMpVVcWIxHwRihpMe8La3Fch60/ZshBgYWg7RS+XaU4F/qlIQtOCb2e6Ty0ftNuId+y0xn4EQ6vCuidw/Fzg16pSyrMzTYJFhb3TLrGu1WkmH7tFevIxaAKKFcLUYX7dex7RA28qg2hWJJWxNJoiPU+4o9n+1GEjW6WlpwWoHs0bIXi7tdeoA03HVj5CUyOolJHdVrVA0UXdYHg3EP3Q6uO/DW525ruPvAnPlDWuOYymrOSEusItSwpHw1jxnZUL3+M2PbVV5sf/s0Aa6DlSVCa6woRk7xpzXIv8LuBlGvlVGBXxDRCq/dpHcqUYKwSZM8PtVo9revVrRgl/yFXD2VmO7EM4F2epV4w6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(346002)(136003)(366004)(376002)(396003)(66476007)(66556008)(36756003)(5660300002)(44832011)(66946007)(6916009)(316002)(86362001)(8676002)(6512007)(52116002)(6666004)(83380400001)(26005)(478600001)(6486002)(4326008)(38100700002)(38350700002)(2906002)(186003)(2616005)(1076003)(41300700001)(6506007)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oO/7NLZDGNYCYQUiMIqGb5rQ9KK7LvPxCKLWkCidcdijHP8U1TwnTB+pcoXF?=
 =?us-ascii?Q?RsUXRLgtNlBS8Lty1RIdNcZb0VUsH7BrMvV4oXAGB+2QqFUYtbltmcrwDKdi?=
 =?us-ascii?Q?RfkuMmF7vuIAZ6mTBi4QEQken23pZJ4+XGeiuzoHV5muis1u7AAb3BKDWM1h?=
 =?us-ascii?Q?sMcsKMTTeLzpUI7+EGR0tSbV3BQB9Tv/erRxXooV2uZBNqTDOipGQT95U4W4?=
 =?us-ascii?Q?CyYZamJtMVnmUoujWePDsKdpCVO0AsVMwNY4pncEsZyk3sTxVUSlok7sIdJM?=
 =?us-ascii?Q?RXUsaGNVRJHt8QqhD91Po4zT3533Fe+7SSA/MjSrwBXSuK5/IRIullFpi5pa?=
 =?us-ascii?Q?RHAuEuJAnHdjwsYmJ4K73VOa6jZauQZgeQpVJx1YLxZTTJTrLlzOOrMuykXU?=
 =?us-ascii?Q?6CnKFxCcutTaM9mq5Yc2W+jVYSbZPkOa9FNSz8zXLxfUObmA/tYW4SbkzG5M?=
 =?us-ascii?Q?yv8SQBEzK1+bBAtMGDqxEPtICsfHZqv8FlE0EjDfu4D+9EkZc43rLvu8gxuL?=
 =?us-ascii?Q?iXhpGfKuxyq0O2ZTw7X1+fQeFtz52J4GDEW8YoR6SU8t9OexqnJaUQhppHJ/?=
 =?us-ascii?Q?2lfZjPODr5cF4E/1Va7bjw5uEZwHPgp4bpx2yXCGPb6aMssyZ00SOqfJ0mHW?=
 =?us-ascii?Q?Y4CQjtX7Jpy+KATxg78Tmzom53jMP0rxNuH/wc/CYXYoirsb47/exWlvkI64?=
 =?us-ascii?Q?vnXJhVhjxsGOROWkcSpg+GCVzftwINyusC/S43RnfLjcQaRIwZ+lcCJ1MWuf?=
 =?us-ascii?Q?WdSBiHDpdqb7bF704kChz75irWyrHm3LdTQUI7uhhUCaLJEudSERMTPpfnNM?=
 =?us-ascii?Q?qPxxjit/88So++5p4HHLjsqRBLLmlvhdKl9yFk4mbA6Rtu1dYzG+cB2plzuS?=
 =?us-ascii?Q?OkVfMXxCLDuY7YosxIl/nLZfKXy8BHnQpyPRH/7/OKZhmwcoxmNSYaDaJgAW?=
 =?us-ascii?Q?hc1xwdODK1mTYaWQYB+Alj/mo3nFVQ0iJGaOnwfCmGyyCBGcFh6FE0K0Qnx3?=
 =?us-ascii?Q?fHik6rNzuw5bUSr89HEuRCwq8U7yEP/ktgUUP3JokE8j5+NqH13oE1B0o2/I?=
 =?us-ascii?Q?xCQQDGCc5/LGUGK8qGYgm5bC/zYolN675cJE/CBFuEJeYzd1Y5yv+SPg0JG5?=
 =?us-ascii?Q?jOijK3rS8o2vWOIZQpCNlz/r3nD2/S7skYJPH9OVvH7umIbEb303fEqYgqEw?=
 =?us-ascii?Q?+ZiqTq3FI2a3LWp3RPZZ2Rwhbi2mv5Vx3t4VBoS4j0W1BhLyhqmgBim2PHEX?=
 =?us-ascii?Q?yeQ+6d5K6b4t0XbJ3ibak00VvasmlBYjI2SmfPIAKShynBJfXPujOmunmHAe?=
 =?us-ascii?Q?aMzLV2p0TG4gSiP4HpI0FFOP3veYFCIabrYMVOXRLR6/EIhbgHfXiP/LhS0x?=
 =?us-ascii?Q?tB19AZgMyEuDLnshqzQW836i8Wa481dtLBkhQ8H5n9jGlmsx5wnsdgtKEfby?=
 =?us-ascii?Q?N9FjwqwgNtqgYOuMymTHuJDDh6z6TbvcfK+6Gml72TCNnsSMib8TACSPpEDo?=
 =?us-ascii?Q?/cW+4SxZyUWiiZ1/UaQVJQwDdtNBJfr03So6uliVXUvcU3nh0thxEE3OGbui?=
 =?us-ascii?Q?DRk0WROhXkPBK8E91jKHXlufxRofxw7tMN/AByElGy6wrDb0rl9mO6tcEk9y?=
 =?us-ascii?Q?af6Ss3hNod/czO5lDBWCJfk=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a75320e2-3fb8-4a55-bb27-08da8068bac6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 15:54:12.5980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AsLWjvB5KScMFE4wpSg5xidHWPxNXq7AvuthKYcyCuG2cc33SoPnffWEtlit8FGGjsrMPhU7ZsR5qKmVWYZBcYUFmr/hdgJadq2zQYc1xIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6783
Received-SPF: pass client-ip=40.107.6.98;
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

Cluster offsets must be unique among all BAT entries.
Find duplicate offsets in the BAT.

If a duplicated offset is found fix it by copying the content
of the relevant cluster to a new allocated cluster and
set the new cluster offset to the duplicated entry.

Add host_cluster_index() helper to deduplicate the code.
Add highest_offset() helper. It will be used for code deduplication
in the next patch.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 136 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/block/parallels.c b/block/parallels.c
index eba064247a..bd129f44fa 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -136,6 +136,26 @@ static int cluster_remainder(BDRVParallelsState *s, int64_t sector_num,
     return MIN(nb_sectors, ret);
 }
 
+static uint32_t host_cluster_index(BDRVParallelsState *s, int64_t off)
+{
+    off -= s->header->data_off << BDRV_SECTOR_BITS;
+    return off / s->cluster_size;
+}
+
+static int64_t highest_offset(BDRVParallelsState *s)
+{
+    int64_t off, high_off = 0;
+    int i;
+
+    for (i = 0; i < s->bat_size; i++) {
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+        if (off > high_off) {
+            high_off = off;
+        }
+    }
+    return high_off;
+}
+
 static int64_t block_status(BDRVParallelsState *s, int64_t sector_num,
                             int nb_sectors, int *pnum)
 {
@@ -541,6 +561,114 @@ static int parallels_check_leak(BlockDriverState *bs,
     return 0;
 }
 
+static int parallels_check_duplicate(BlockDriverState *bs,
+                                     BdrvCheckResult *res,
+                                     BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    QEMUIOVector qiov;
+    int64_t off, high_off, sector;
+    unsigned long *bitmap;
+    uint32_t i, bitmap_size, cluster_index;
+    int n, ret = 0;
+    uint64_t *buf = NULL;
+    bool new_allocations = false;
+
+    high_off = highest_offset(s);
+    if (high_off == 0) {
+        return 0;
+    }
+
+    /*
+     * Create a bitmap of used clusters.
+     * If a bit is set, there is a BAT entry pointing to this cluster.
+     * Loop through the BAT entrues, check bits relevant to an entry offset.
+     * If bit is set, this entry is duplicated. Otherwise set the bit.
+     */
+    bitmap_size = host_cluster_index(s, high_off) + 1;
+    bitmap = bitmap_new(bitmap_size);
+
+    buf = g_malloc(s->cluster_size);
+    qemu_iovec_init(&qiov, 0);
+    qemu_iovec_add(&qiov, buf, s->cluster_size);
+
+    for (i = 0; i < s->bat_size; i++) {
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+        if (off == 0) {
+            continue;
+        }
+
+        cluster_index = host_cluster_index(s, off);
+        if (test_bit(cluster_index, bitmap)) {
+            /* this cluster duplicates another one */
+            fprintf(stderr,
+                    "%s duplicate offset in BAT entry %u\n",
+                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
+
+            res->corruptions++;
+
+            if (fix & BDRV_FIX_ERRORS) {
+                /*
+                 * Reset the entry and allocate a new cluster
+                 * for the relevant guest offset. In this way we let
+                 * the lower layer to place the new cluster properly.
+                 * Copy the original cluster to the allocated one.
+                 */
+                parallels_set_bat_entry(s, i, 0);
+
+                ret = bdrv_pread(bs->file, off, s->cluster_size, buf, 0);
+                if (ret < 0) {
+                    res->check_errors++;
+                    goto out;
+                }
+
+                sector = (i * s->cluster_size) >> BDRV_SECTOR_BITS;
+                off = allocate_clusters(bs, sector, s->tracks, &n);
+                if (off < 0) {
+                    res->check_errors++;
+                    ret = off;
+                    goto out;
+                }
+                off <<= BDRV_SECTOR_BITS;
+                if (off > high_off) {
+                    high_off = off;
+                }
+
+                ret = bdrv_co_pwritev(bs->file, off, s->cluster_size, &qiov, 0);
+                if (ret < 0) {
+                    res->check_errors++;
+                    goto out;
+                }
+
+                new_allocations = true;
+                res->corruptions_fixed++;
+            }
+
+        } else {
+            bitmap_set(bitmap, cluster_index, 1);
+        }
+    }
+
+    if (new_allocations) {
+        /*
+         * When new clusters are allocated, file size increases
+         * by 128 Mb blocks. We need to truncate the file to the
+         * right size.
+         */
+        ret = parallels_handle_leak(bs, res, high_off, true);
+        if (ret < 0) {
+            res->check_errors++;
+            goto out;
+        }
+    }
+
+out:
+    qemu_iovec_destroy(&qiov);
+    g_free(buf);
+    g_free(bitmap);
+    return ret;
+}
+
 static void parallels_collect_statistics(BlockDriverState *bs,
                                          BdrvCheckResult *res,
                                          BdrvCheckMode fix)
@@ -589,6 +717,14 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             return ret;
         }
 
+        /* This checks only for "WithouFreSpacExt" format */
+        if (!memcmp(s->header->magic, HEADER_MAGIC2, 16)) {
+            ret = parallels_check_duplicate(bs, res, fix);
+            if (ret < 0) {
+                return ret;
+            }
+        }
+
         parallels_collect_statistics(bs, res, fix);
 
     }
-- 
2.34.1


