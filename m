Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 527276893AB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 10:28:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNsLq-0000VQ-MW; Fri, 03 Feb 2023 04:27:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsLn-0000V0-U8; Fri, 03 Feb 2023 04:27:19 -0500
Received: from mail-db5eur01on0701.outbound.protection.outlook.com
 ([2a01:111:f400:fe02::701]
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsLl-0005Cv-K3; Fri, 03 Feb 2023 04:27:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHp//GOx6cO7h6v3bwr8rggLvTkvc1LTe2GcQVDXQ0ltoGs/PNJve2mpITyF1Q8s0G1JioFOw70eFV5jjF5qObLF2W+qdsq6PwCTTCS1AS86/W1DlmKSxwRIKnpyeRx8G8f1aUAAv1s4z5V+Am4xH8R0skpxIdEQy0h+mkjXkmP351zWKFQfSApzHxD0ZiSGUSUKVMNm2QEj7+pMxr0LARxxXJLyULoxwrqwZOLo4dUkGV1VcbE/3I7jgqerF1V1nbG8mzFkOxPYNVCUiYdz3f6RBUYLTrBQXcockiB4wokcbEFHG9YSOJSgfZzd/WnKXccbbbc6CQmMA265iWl3yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vo1lgXihGdPGX1zgEjM4792nwdiM6sYX7aJXr/ahDQU=;
 b=WgWl7AAzCXkUYhDgd2bDnrm3aE9giTKtHk3a8Y7p+3HmLh7U2zLDeliFc6/xsu1IyTwyLRBAdhGQbjwpOa2jd6Ax90IR3iCY95Le56v709LpKZ2f99X0D2w1rBdfEBY6kUpz5NaMvalHVs0ughW8cuN+x2oFscKkhRGdutSpHpSVZocuyQFzlLb+W0nj+NXFNv6aJdrrk2lOy/mEGvmH92w/ZFAhEznPe3TXrs6vz4IKS8z44u7UsnN6RPDwewDcHc31IE0GpzrRC5P4jNjXJwmmz18w+ImrmWxBnIYPKXWd+QvKfhgs/ZQxR2FcFofMP+iaQw416nfDRXHoh1g+hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vo1lgXihGdPGX1zgEjM4792nwdiM6sYX7aJXr/ahDQU=;
 b=fdbNH8iZwnW1haxveKLG7EqaEII9KqxVrd9tngsBqSMRwqmwtIACEWnOvJgo/MVoovIneEJOHOD19iO/TpfEIw+J9ymkPxutH8/1h4R/EdrngGFwMBsJRUX7/6XfPxowtInuuMNkTdFSvxoIdDRU0kC2SxlEIdHeD1FF1lRcejU7M/NkPZSu0lVLUXEc92eS6w573uecx7quK13ON1NyST1t5fJhRcfyPT0fEv66yt1pQpJqmqf4huJZ7wit7nRyP+bF5hV41G3csNs790Dmy6R/zsmsqxMYinsKAGph5RhACJVNJAsQOeCrL2FIclcMY8TfTvg0FWXOzpT6/edGUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PAVPR08MB9356.eurprd08.prod.outlook.com (2603:10a6:102:30f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24; Fri, 3 Feb
 2023 09:27:05 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6064.027; Fri, 3 Feb 2023
 09:27:05 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v3 3/5] parallels: Add checking and repairing duplicate
 offsets in BAT
Date: Fri,  3 Feb 2023 10:26:54 +0100
Message-Id: <20230203092656.2221598-4-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203092656.2221598-1-alexander.ivanov@virtuozzo.com>
References: <20230203092656.2221598-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR09CA0099.eurprd09.prod.outlook.com
 (2603:10a6:803:78::22) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|PAVPR08MB9356:EE_
X-MS-Office365-Filtering-Correlation-Id: d328cfa0-a83c-4f47-753d-08db05c8d09f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qlRciXIjVahvDZYMI7BxToZHydECVaHIJI9u4SKjoORKynJkhrgpv5fA3prHHiHweIyPbvCz4AB0lAfJkdK+cOmK1cwaAnMEII7bVM/1e+xgoe259+SxZ+cJJ3EDtrVnjxh5mTMqnZ0vxhe4p1DtgvZVkKXtZX2j4WgsBsLjLKuAgvArrVxoFwlyM73QC/g0U3f+MdSWw4b9WarPueiftjSRP11dY6zVYO0j/CWTSbnVwh4hsZuOlSfzxi5fjmidgMhpJsjRZiKDQsiRtadWm8/lPfFGEBn9Q5DB/nuJrw4b/SLSQCAAi3CysTQq4zBxWYJnP7Zp9iDzLDiUk9TdC6zn0Ok9X3jxmHJ5N2tecxrE/GiI2+wkzmow1dkt8uDk8kuFTeS3cWZ5+qbn9aidfY8o4VTxGsMwlbQAIwZA/bXaeG20SlO0cHNprGUkrSK3DBkQcWC8O81YkQmIzy0x9YHPYqFx6LLcoMo8y7LEGo2hxYhZpc6omb/ZDuUM/V/+6dfh2ET2u3qzLnNka/ti5mmGDlj9RAFwRbxnVM4VfDrIpKS3sNAI8NTERiOv/BICoCidTh1MuMKbyCivQruoT+8hIkrEt22uSRS71ia+noWi0/wR6DwbgylcBqy8zTwBAmyQU1J3RmfmXUK+/nnzlKUULExmjjHI8vdqB0sGOWLvkhaRmHeD9H8SMb/ECNiZ9QQ5vqIEzk1JjAQvmlhAgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(396003)(376002)(39850400004)(136003)(346002)(451199018)(478600001)(52116002)(2616005)(44832011)(36756003)(6486002)(5660300002)(2906002)(8936002)(316002)(86362001)(4326008)(38350700002)(8676002)(6916009)(66476007)(6506007)(1076003)(66556008)(186003)(38100700002)(26005)(66946007)(6512007)(41300700001)(6666004)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3b/9ywGTSToMjDrwEwsucukX7yqBS/6NqpfclAYjtYj41axWl49YkUYiltsl?=
 =?us-ascii?Q?fQVgEFnQDDeqHuCBra3awiLK48nfTAfBsYrzXKkBvVvEKW08G5m7VwWL9tAx?=
 =?us-ascii?Q?xYfG57jvXY+32bH9/s6PIrJ7em79ZjNijmHE1G+lQdRVb/LwTA3TqX8IvayZ?=
 =?us-ascii?Q?FH1oiNUUoZl0VEOgkRzSW5k0VTwRY2/zyfHOFguXRnOdbfgddpSRMbLfxl9l?=
 =?us-ascii?Q?+ocUGURXoMf6T0cB88NSGHSG4FT3JJViRGVuB+sqYF/q3NTvaBm4oP8INFjS?=
 =?us-ascii?Q?oAqp2SxFNXJxsEqKsygGmzNccnmKOY70TyFscgQVuq3WmjTWh+Yc8IHhRwTG?=
 =?us-ascii?Q?Be55XTzUSDPubeTJGNiVWUzhAaREMjLzfqILeIdrQdmQ5H+RS68uAfawFpZE?=
 =?us-ascii?Q?tTwtj4CpfaonSTMUHQTlez0yRH7Okz29iP9ch1fA/VzU5BkHvy52d/2sslLW?=
 =?us-ascii?Q?phUwE6UQCXjMSHfyS8Nc0lgI5vGdYXRPWCUQbl7JeUs4tQhDmxb7JkPTamFt?=
 =?us-ascii?Q?TFQbv0eckaQ1/eA44eYmCqJjT5+YY2cm4LcVQAvcMJnKNG8WTKditiD82+ra?=
 =?us-ascii?Q?8KX01K//rhFuRiEFCUgUKMhnJr0XdDb2hHQxQyIzq4ksoEyHY0zJrPOoOpVJ?=
 =?us-ascii?Q?e9fHxN6hZS3XNytkNRa1z6dsX21TmCmwXUzuC5o8VFOHI+fJ+5qOqnBaakdC?=
 =?us-ascii?Q?UYGOdkoQ+Xl5GrjieFLurq7YiTDimxSJALJrsYc85ffCNmUc4QOLeC6/i1dn?=
 =?us-ascii?Q?l0evTn9cwambbrKqHFlp6B9i7BZtchkSEs6KJXuWFMW76IJLHi2LKeU0LQqx?=
 =?us-ascii?Q?gP8aIOaPJjdDfjXTvP0fr9HUWmBJwraMNP1dJ3P3HJRnP9VLvsWzGeOEUDt8?=
 =?us-ascii?Q?P5+a0yv6JpD44yoHbD6cyo4VJBzWieXll6E6ANXSx68f6bqpUdPBTh+kVNNw?=
 =?us-ascii?Q?cQHYYFQ7ii7i+vXk61Ho7WJ+OoWOIRY3G8G9ENjiCf8L10hv+RuuTBOLWWyg?=
 =?us-ascii?Q?l1NneBWGMYTeLTjGUx1A35LCQx4EZS73Y4YRWf403EhfpD40CcPqrjWC+l6C?=
 =?us-ascii?Q?iAho8ihf2J1WjnznRR5K9/x7zftANkmPg9sB9BS1lJqftpT8NEr4qNmBdQrV?=
 =?us-ascii?Q?khtK1vaKuUL1X4+qXko7wORiNIMFMBnBeKJqVC8ZiSwV6eeqv9EGmXP/OBSq?=
 =?us-ascii?Q?GcumDisO79woDJVgu3OFWEWeTIs2P6FC6my+YFXHud71NLefu/DF/jBysJ7N?=
 =?us-ascii?Q?hijUZnns/tLNRHHx+EgPY5pWpG2VoONrLsSD7//Gp70KLAeuQnf7pqgxINlV?=
 =?us-ascii?Q?iXV7wQpaMNOSMBpLMkVQSp1AhQLYqis0ik9PfWwUZzOlRueMcIbeJ7fQT0cM?=
 =?us-ascii?Q?gOP8EHDYGQoZauPvFsGC4f3agYcJ3iJV55ICZSRKtoxHdv6zcShDbKvG7cxl?=
 =?us-ascii?Q?RhCKg9qTCHa4TWJUr+hzhCXoBUxPzp8q3Xj+MoE7Z5jye6xWv6SbDNZljuwY?=
 =?us-ascii?Q?zfkk4TFpQvniefSuc6+WuXJ+4EwGBxuV7xqpMDaIIe13hnu66ubFt9EYOAt5?=
 =?us-ascii?Q?bqMWy3j2YtWd7637ZF91u8yQ/wFs5aQPgV1zT9n0OlgM26GbPHxZI4OJUhO9?=
 =?us-ascii?Q?71G3AQ/Q0QMo/kwFMeDfCwE=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d328cfa0-a83c-4f47-753d-08db05c8d09f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 09:27:05.6341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nO/EZx+ccxjBXDTC2MFUTGt8R8PO2wuwQc13C6vkVGyB88CySywGFRwsWMrIAXHtq72cKaiFS/gSc9NtDpI2adAlBUSZ4bYEBonXtnUcWCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9356
Received-SPF: pass client-ip=2a01:111:f400:fe02::701;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

Cluster offsets must be unique among all the BAT entries. Find duplicate
offsets in the BAT and fix it by copying the content of the relevant
cluster to a newly allocated cluster and set the new cluster offset to the
duplicated entry.

Add host_cluster_index() helper to deduplicate the code.

Move parallels_fix_leak() call to parallels_co_check() to fix both types
of leak: real corruption and a leak produced by allocate_clusters()
during deduplication.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 134 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 129 insertions(+), 5 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index d3053b33d2..3ba8f42131 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -136,6 +136,12 @@ static int cluster_remainder(BDRVParallelsState *s, int64_t sector_num,
     return MIN(nb_sectors, ret);
 }
 
+static uint32_t host_cluster_index(BDRVParallelsState *s, int64_t off)
+{
+    off -= s->header->data_off << BDRV_SECTOR_BITS;
+    return off / s->cluster_size;
+}
+
 static int64_t block_status(BDRVParallelsState *s, int64_t sector_num,
                             int nb_sectors, int *pnum)
 {
@@ -531,7 +537,6 @@ static int parallels_check_leak(BlockDriverState *bs,
 {
     BDRVParallelsState *s = bs->opaque;
     int64_t count, leak_size;
-    int ret;
 
     leak_size = parallels_get_leak_size(bs, res);
     if (leak_size < 0) {
@@ -548,16 +553,123 @@ static int parallels_check_leak(BlockDriverState *bs,
             fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR", leak_size);
 
     if (fix & BDRV_FIX_LEAKS) {
-        ret = parallels_fix_leak(bs, res);
-        if (ret < 0) {
-            return ret;
-        }
         res->leaks_fixed += count;
     }
 
     return 0;
 }
 
+static int parallels_check_duplicate(BlockDriverState *bs,
+                                     BdrvCheckResult *res,
+                                     BdrvCheckMode *fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    QEMUIOVector qiov;
+    int64_t off, sector;
+    unsigned long *bitmap;
+    uint32_t i, bitmap_size, cluster_index;
+    int n, ret = 0;
+    uint64_t *buf = NULL;
+
+    /*
+     * Create a bitmap of used clusters.
+     * If a bit is set, there is a BAT entry pointing to this cluster.
+     * Loop through the BAT entries, check bits relevant to an entry offset.
+     * If bit is set, this entry is duplicated. Otherwise set the bit.
+     *
+     * We shouldn't worry about newly allocated clusters outside the image
+     * because they are created higher then any existing cluster pointed by
+     * a BAT entry.
+     */
+    bitmap_size = host_cluster_index(s, res->image_end_offset);
+    bitmap = bitmap_new(bitmap_size);
+
+    buf = qemu_memalign(4096, s->cluster_size);
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
+                    *fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
+
+            res->corruptions++;
+
+            if (*fix & BDRV_FIX_ERRORS) {
+                /*
+                 * Reset the entry and allocate a new cluster
+                 * for the relevant guest offset. In this way we let
+                 * the lower layer to place the new cluster properly.
+                 * Copy the original cluster to the allocated one.
+                 */
+                parallels_set_bat_entry(s, i, 0);
+
+                ret = bdrv_co_pread(bs->file, off, s->cluster_size, buf, 0);
+                if (ret < 0) {
+                    res->check_errors++;
+                    goto out;
+                }
+
+                sector = (i * s->cluster_size) >> BDRV_SECTOR_BITS;
+                sector = allocate_clusters(bs, sector, s->tracks, &n);
+                if (sector < 0) {
+                    res->check_errors++;
+                    ret = sector;
+                    goto out;
+                }
+                off = sector << BDRV_SECTOR_BITS;
+
+                ret = bdrv_co_pwritev(bs->file, off, s->cluster_size, &qiov, 0);
+                if (ret < 0) {
+                    res->check_errors++;
+                    goto out;
+                }
+
+                if (off + s->cluster_size > res->image_end_offset) {
+                    res->image_end_offset = off + s->cluster_size;
+                }
+
+                /*
+                 * In the future allocate_cluster() will reuse holed offsets
+                 * inside the image. Keep the used clusters bitmap content
+                 * consistent for the new allocated clusters too.
+                 *
+                 * Note, clusters allocated outside the current image are not
+                 * considered, and the bitmap size doesn't change.
+                 */
+                cluster_index = host_cluster_index(s, off);
+                if (cluster_index < bitmap_size) {
+                    bitmap_set(bitmap, cluster_index, 1);
+                }
+
+                /*
+                 * When new clusters are allocated, file size increases by
+                 * 128 Mb blocks. We need to truncate the file to the right
+                 * size. Let the leak fix code make its job.
+                 */
+                *fix |= BDRV_FIX_LEAKS;
+                res->corruptions_fixed++;
+            }
+        } else {
+            bitmap_set(bitmap, cluster_index, 1);
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
@@ -609,7 +721,19 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             return ret;
         }
 
+        ret = parallels_check_duplicate(bs, res, &fix);
+        if (ret < 0) {
+            return ret;
+        }
+
         parallels_collect_statistics(bs, res, fix);
+
+        if (fix & BDRV_FIX_LEAKS) {
+            ret = parallels_fix_leak(bs, res);
+            if (ret < 0) {
+                return ret;
+            }
+        }
     }
 
     ret = bdrv_co_flush(bs);
-- 
2.34.1


