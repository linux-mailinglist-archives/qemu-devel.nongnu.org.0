Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8156678CE
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 16:15:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFz5j-0003rL-Of; Thu, 12 Jan 2023 10:02:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pFz5h-0003pi-Uf; Thu, 12 Jan 2023 10:02:05 -0500
Received: from mail-dbaeur03on2097.outbound.protection.outlook.com
 ([40.107.104.97] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pFz5g-0007HH-BJ; Thu, 12 Jan 2023 10:02:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BgRdyI/2YyMNCpd5C2yKp3cThu4wusmJzp78TPcWHXU8trt9KYbQY41n3oXH/H8ouFxHlolISriAasLn1RnHyq1gYocAksdl7FHs7DRbzLiqKx/IH0iH8Y8OGhVVEl1cePDAHIfzIR8ca+Kf/hgdSVDxwNtDQ3AWGdyWL0BnPDFnR4XiaOmoQW9TSCCaPMmfhGBRg6+CJcn/ASR+/3JD0yBISDoDW10QyeRtitE07xzAy2qarVtk5ptksr5Z9nKB+V1/QPSiM/+Gmx8gmphzdTOfbB/UK0wdMvPjmYN/5oAxmemDINAHmRpkWoIMtiaWHr0X8pLRHcJAgCh3FbK3YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQqIMllBP0VYY9BpCMO4Gag2VOImYYXZALM80YlwIso=;
 b=BY9bck963gkGRd23RDtpygR2Haje2lYnestIRtSnREyCNbkJpiEdKIzjOp3ISVuMJuDAIG/KMgGYY5j3lPSeL2EpjXWlsScgs22W75ONzvyRIen7vYOk56aSZuwJLvXL92XwzqzARjK/EltEH0eddrsPEhHxf6oWlzXGzwdraR56CAx1s0+V/ZCSPGqyasLpVBu8rXL5Leyk7AocpvKUqBXGMgtHoXm2IM+7wpU+VPW1wN20UgiypKGWcOFINRd8wpAahY9Zyp/exw9LAP71JD0znxmk26bGcoi12d4i43jce+a8KBD3LBspQhXRXHysfrgrczq9zmfay1wNScv6+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQqIMllBP0VYY9BpCMO4Gag2VOImYYXZALM80YlwIso=;
 b=xQUEYzf5okpkqmiUHe8TxJ7VfE29sg01s9pTJo8lahDvVKDlV690Phe1gpek6rX9XWkmbnhgOquu5lxuQCy6XifHsEdMG+fICQKAxo4qdR1Mgj/Kq4UkZx+WJmZ3xDEP207GOilGY1MovUHxR+/3MLy7+/49OckT3fhYTxR9iBx4vSKGk+NUtz0SSUuV9tvLy6bDx9/BtM7UuueFltyDll+pfBRmOzrEXVf1KgKNBzPvuiK48pobT+uWMQlzyV6U2ugIdMHYh4V4uykRUIUQ/3/8SMqaIQHfEFOV1R6Ghca1gyemp4s6vH8f0AQCm28bFFAKjLVPfn88LO7WJ8xMuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB9250.eurprd08.prod.outlook.com (2603:10a6:10:419::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 15:01:57 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%6]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 15:01:57 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v2 2/5] parallels: Split image leak handling to separate check
 and fix helpers
Date: Thu, 12 Jan 2023 16:01:46 +0100
Message-Id: <20230112150149.1452033-3-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112150149.1452033-1-alexander.ivanov@virtuozzo.com>
References: <20230112150149.1452033-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0701CA0035.eurprd07.prod.outlook.com
 (2603:10a6:800:90::21) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DU0PR08MB9250:EE_
X-MS-Office365-Filtering-Correlation-Id: 490bc33e-e63a-44e4-f515-08daf4adf375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZNSLoBpOj5gOVZY1GyELOjIn1500Zlu/cYT3wVq9KbRqDq0bKuPXhGnWl0GVFmG6v9T89BTxUhY98tkiY/p9SYaJ/QJMvnLAj34aZ9YYs0+iiy9/JdgjYVrSa3h0SdBb99eu11Lo/gd0Itl1PTS8GeANIxd0zqLY2L0o9Z/O+4v30fpD6ds8bgFSOZzRw7zpr8A7hwoGkwvROJQei01RxOkg6KdSTOYWfDygaReR+0sU5d+nA98NDV5HE8WtWG250TqGenVGdID9mR/5yjs56BCXcDuV1SDNjNml4uDDMqC5aoNoO1Ady09V9DKefA5MQHFQyRNj+WOAr5aWBCBMVpkh2E3hKyL16N2hctCUhMeynY7ELhVlGLkOLQZEl9nR71DNpkgLsSivOuUaNuFmHMQ3GJZBFaZGKdyQl9/miQifo6zSjGaa5MkWV5xFcVpfTU+L2YrVB2ijX2/Wcn0p0BYwNetEgiHioi7GW5I6da7u0tYwoXqE2t+9KObdRwRia4FvLWPHDzbqI//EPdav3DNpRpQDQzuCO5Yg79wpHkVZcNs5dihd76XK7dSySIkB3wqQ9T9uL6cM15MaYTXlfOkCF0ePhtTHRd7zrM5oPNR6RukRz79K6uH5XmUZ3I9y+BBI4bkpfx8F23xECbP1EGuaHwC1pQhvJ5/PqWdlMknapnYYOUBi75sTxpejNWyliesgwBNH+xZDzYyJjwAwFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(366004)(346002)(136003)(376002)(396003)(451199015)(36756003)(5660300002)(86362001)(6486002)(316002)(6506007)(52116002)(6916009)(44832011)(2906002)(6666004)(478600001)(66946007)(66476007)(66556008)(8676002)(41300700001)(4326008)(8936002)(38100700002)(6512007)(38350700002)(2616005)(1076003)(26005)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rGgsXf2yq5EATJGbkgsMZYlKtU96CVRAn+73l3TDLIdcydqx9IqwnMs0iXKh?=
 =?us-ascii?Q?V3yEGhQNKBvoY9c27MbUa24gsMVVz/VYY0U5/QC5b503VdDsd+NfaR7pfKhY?=
 =?us-ascii?Q?BbdxN3j3KJEERGWYvZLymx36BvtECB8AzsuFn6jsBA5QHr4CK/kn6G0wKoLb?=
 =?us-ascii?Q?f7BAZtCnLRK4SnByxhCwVXS/ufFhiGXOJlShO8aXNNEovK8nldegiVYro25t?=
 =?us-ascii?Q?jFlRSGxGpr9AY8jdwBRErJF50H0xhjNACUjXu44UIukx9J9tLkvU52YD3So5?=
 =?us-ascii?Q?1kYpkZrqJw9n92fyA9O6H5OCdeEBv81dpdxKjlog8oP07EgqBY6hLcw97hMs?=
 =?us-ascii?Q?hXW8Wyy6rKvmxJmFGI/0aSVa/kk0Kz6zRD4PZ/3P03gXsMKij75bH+Jzkslp?=
 =?us-ascii?Q?WzYYsFzBxU75wdDT9pj72yezEWBrQ/6vF6GgLgRO5KYfDTPdX6xNxm5l9Fsc?=
 =?us-ascii?Q?oIBHdEVTLO7nJ6XRpR4gcalSW8k1XUYisxFeSNLkA9zd3TShyuJ7PRQo1cen?=
 =?us-ascii?Q?x2lMgGKQ/pUfm/PKUf2R+KNVIj7IZlJuKNKkiOB+q4HR0nvrEwXPaULk9/JG?=
 =?us-ascii?Q?zxQOQqXv8ksc4T/VTGT/SJoCv5vWwz1wH04nCqqsLtr2Bi9cuioIlGfgN8oO?=
 =?us-ascii?Q?OVjNEWhQMqXEFSEYWesFxudyJIwDBVt4NRfvPEiG6eLTwlP2MoqgSAKriLIL?=
 =?us-ascii?Q?4XdvB7luFKnSSOTwLKTiDks560Uv2UGDn2ycZ5Mv02iA4KG2MokkqDRT2y4z?=
 =?us-ascii?Q?JQxZgZKOamv2kf+kKaSP3bA3qGfeuAhhtTzIoH7W+aceo+KJ7VClSAn9024h?=
 =?us-ascii?Q?+9MzfbfKQXc7zBWMQsIxqKP23U2i46TqM7tdTIKXjywN4Dci9pF0cu9Ei2jj?=
 =?us-ascii?Q?O8CnKIJ1uVjMSLMFdDC8Ku7T8HN5HmI94DabiSCmnkpIVB3e5LqzXexurWrm?=
 =?us-ascii?Q?CL9PlVbAOdvo2gyt9M5hHT89G/J8D+FZort/paHQbtXWt2I/6acwmirDCsdM?=
 =?us-ascii?Q?M9odviIKRFR6/90gzzo/3AfyOJrF0eI7mlzk/b+B3MBDxqXawns67sGJHNjT?=
 =?us-ascii?Q?m5bs7dg9BQAC+iOomLZr8rKDF2yE5OFhl4hYe8Ipnwm4htwyS/KTS+0d2YIu?=
 =?us-ascii?Q?wTF38SDMwupJX2Y/W69ZzK+YqOLf4OkLtXc2dN2Fa7qdkmoTxqrndqGiCz1q?=
 =?us-ascii?Q?1lrWJoyt8Lr7ulNGOEcxjAyMeXo9UoXlHVtGYnAzbTtoxekqapln/rUIvM1V?=
 =?us-ascii?Q?oRFfKxHsz8LBD0vMrmxoN5qLGE2G5+4EQnSNJG71BSzpXhlgX1pL35Ej0qZe?=
 =?us-ascii?Q?ZjwDT/eNBwtdfY/gou4tutny/nl0OjrIwKR/WXMR50sTb8yY8+rQ1HOD2ULc?=
 =?us-ascii?Q?UD1qVFP1XYCFNkAl+Ghv5q3uP5BwPjdCUP1tUjB16DPjHbQ1u5YsAd7rmQv4?=
 =?us-ascii?Q?EfknEdI00MjZRygJAyjdNzxMgtdqKd2YLwMb+igv+iHrmknvQk38ph25vUev?=
 =?us-ascii?Q?CM5dDdzsgWA6qESPRtUahyv5qnOipoZplNV1Sx+B9qCUBfe6oMtxoQbbcso1?=
 =?us-ascii?Q?H00GyR0EqTlEKz+yn6xu71sSxA7pMf9nWO5VM2hJC0R/O7cmCHigI1PmoVEc?=
 =?us-ascii?Q?b9zJHou6+BP17pmK48BdbAA=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 490bc33e-e63a-44e4-f515-08daf4adf375
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 15:01:57.8709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lOHybdLlG/suf2HgqrIh79zxGuQrj/owoT6kBjnJ2ePxZuzsLGOnOIzuDCAIDxpIXW/jki6zFbzzI1dLPt6l1RL11RrKKntwvMoO84XnLXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9250
Received-SPF: pass client-ip=40.107.104.97;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

We need to fix leak after deduplication in the next patch. Move leak
fixing to a separate helper parallels_fix_leak() and add
parallels_get_leak_size() helper wich used in parallels_fix_leak() and
parallels_check_leak().

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 88 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 61 insertions(+), 27 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index ed2cf27abc..da1e75096c 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -475,21 +475,53 @@ static int parallels_check_outside_image(BlockDriverState *bs,
     return 0;
 }
 
+static int64_t parallels_get_leak_size(BlockDriverState *bs,
+                                       BdrvCheckResult *res)
+{
+    int64_t size;
+    size = bdrv_getlength(bs->file->bs);
+    /*
+     * Before any usage of this function out-of-image corruption has been
+     * fixed. If the function returns a negative value, it means an error.
+     */
+    return (size < 0) ? size : (size - res->image_end_offset);
+}
+
+static int parallels_fix_leak(BlockDriverState *bs,
+                              BdrvCheckResult *res)
+{
+    Error *local_err = NULL;
+    int64_t size;
+    int ret;
+
+    size = parallels_get_leak_size(bs, res);
+    if (size <= 0) {
+        return size;
+    }
+
+    /*
+     * In order to really repair the image, we must shrink it.
+     * That means we have to pass exact=true.
+     */
+    ret = bdrv_co_truncate(bs->file, res->image_end_offset, true,
+                           PREALLOC_MODE_OFF, 0, &local_err);
+    if (ret < 0) {
+        error_report_err(local_err);
+        return ret;
+    }
+
+    return 0;
+}
+
 static int parallels_check_leak(BlockDriverState *bs,
                                 BdrvCheckResult *res,
                                 BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t size, off, high_off, count;
+    int64_t off, high_off, count, leak_size;
     uint32_t i;
     int ret;
 
-    size = bdrv_getlength(bs->file->bs);
-    if (size < 0) {
-        res->check_errors++;
-        return size;
-    }
-
     high_off = 0;
     for (i = 0; i < s->bat_size; i++) {
         off = bat2sect(s, i) << BDRV_SECTOR_BITS;
@@ -499,30 +531,32 @@ static int parallels_check_leak(BlockDriverState *bs,
     }
 
     res->image_end_offset = high_off + s->cluster_size;
-    if (size > res->image_end_offset) {
-        count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
-        fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
-                fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR",
-                size - res->image_end_offset);
-        res->leaks += count;
-        if (fix & BDRV_FIX_LEAKS) {
-            Error *local_err = NULL;
 
-            /*
-             * In order to really repair the image, we must shrink it.
-             * That means we have to pass exact=true.
-             */
-            ret = bdrv_co_truncate(bs->file, res->image_end_offset, true,
-                                   PREALLOC_MODE_OFF, 0, &local_err);
-            if (ret < 0) {
-                error_report_err(local_err);
-                res->check_errors++;
-                return ret;
-            }
-            res->leaks_fixed += count;
+    leak_size = parallels_get_leak_size(bs, res);
+    if (leak_size < 0) {
+        res->check_errors++;
+        return leak_size;
+    }
+    if (leak_size == 0) {
+        return 0;
+    }
+
+    if (fix & BDRV_FIX_LEAKS) {
+        ret = parallels_fix_leak(bs, res);
+        if (ret < 0) {
+            return ret;
         }
     }
 
+    count = DIV_ROUND_UP(leak_size, s->cluster_size);
+    fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
+            fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR", leak_size);
+
+    res->leaks += count;
+    if (fix & BDRV_FIX_LEAKS) {
+        res->leaks_fixed += count;
+    }
+
     return 0;
 }
 
-- 
2.34.1


