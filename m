Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B647859BCC6
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 11:24:27 +0200 (CEST)
Received: from localhost ([::1]:33494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ3fW-0004h8-UO
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 05:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oQ3NV-0005uM-U3; Mon, 22 Aug 2022 05:05:49 -0400
Received: from mail-eopbgr60129.outbound.protection.outlook.com
 ([40.107.6.129]:44014 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oQ3NT-0006yB-2y; Mon, 22 Aug 2022 05:05:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYOVV6tZD+8u36H6XVaaz4yI/VZT3WFo5i1Cwq6UbibWLAQMRipM1fMvHbW1mLZQrJZiorO1Q1PkO2hJCVzwf+MALiFGvKYHvfQkfg866HggRfd7xXYyry/cGGpA5GLBRjct8W1I0KPtIHKP5fnfvzDPi70uS/mKRgYhBrVeh9qv5cax39hoJQ0kCx/HDve0+DNl23bLz3oiF2tYC7jo6jjMyrumGGyuOd2xdpyVC9CyqwA0UVw+w8H6N0dZLcWxLZqsyCOyO6NVG/7qtidgW+fY0QRlgUzLsajP37gVjHx7Kla03k4x0sBdz/GU7oSzLERD/MCs9g3XmdhagVdG5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UyXo4RABmlKEgWXRunM44X2Hz6d71hKRJy4m1/7v4U=;
 b=PlN15HaVoqV2UF33DRkVNwH7ULjBOzl1yUvRhwqo9OOc/2NNxNcYDzBG/IySS8oU49sXj+MrhEXiCA7sbEx//mjpd++HMmPjNUnXOWd8pdw0KcyIa2tB2OW7PggzSyQbriuW8aHCLqm52CgvweIdzSsF6BYz8Y5s+nMt6CMm71FtRADfToJ44HIopMKD6CiZh7YqqtKlfLUOHl4meWiT0PwzAyCs0W1qoR+/2147wdT26+tWG+mTEkSA2q5ti/M+HE93C59LjTpcgaJAIxHNPpUKAVoeWCy7/rZIFBOdSGXb4m+Q/6es+/FdfnNZdl1V+IH2iMGDPe9BRUpupzGSAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8UyXo4RABmlKEgWXRunM44X2Hz6d71hKRJy4m1/7v4U=;
 b=lAvSTLtR0RkhwboMe95/sSFL4EvPPValKF7CJPSdSYrOxKDylLuqPkG4cFupx5whWTaY0CUsJfKiZNQY3R9AAAQKcENiZeFfaKlGG3OXNvS6d4M2rabG12ZF0GeQiuc1S0SSYnsSOZCOMjYSngfN9BRMJuxZXjOM6OK0Ism6E0aRzJqBijnEAKBIy9RBFlWh0whjE1wg86a1dRqNnvVfuyvaLj51b+up2BtFqHir0V2fw57E59Zrjl+dEk959TnmeJgmz4FxvuJfL6hgbGTzsjpjKJEU7GHCqkxkh23Jzi0MgAUFsoyY43Xr4L/IgmLzBJklSE3qMYKN3d8IO0iS6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM6PR08MB3382.eurprd08.prod.outlook.com (2603:10a6:20b:47::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Mon, 22 Aug
 2022 09:05:34 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%7]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 09:05:34 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v5 6/9] parallels: Move check of cluster outside image to a
 separate function
Date: Mon, 22 Aug 2022 11:05:14 +0200
Message-Id: <20220822090517.2289697-7-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4299c3b8-f0c1-4683-a7d3-08da841d78ad
X-MS-TrafficTypeDiagnostic: AM6PR08MB3382:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d2GnH7t0DXUVtfzIjOt/jSD1U8gMxKjU95Bu/o3LHEffU0il5mRhvJUhMcVe3/MfK5ZumKtCrLBizhc2XHVdz+/LFNojXabKMCq7UqY5FhEZmMKYbj4W7Ix5AOAeQ2D0UgPZV5819mkNtFb7mx/MR9nQ2VvVA62YKIHG0zW+o+1xvRbpSQJZv+Z9d6oGN2L8bHuLzAzUVxgCODr/zR1zQziAGlyLvTAGQouGtoldKxkQNzvfmRwD7gyBx/fL29fJu6tqL2oCa9tiLwGYB6mJVONXDOcsEXeBvjedSpT7vZGijtOsOD6XgjZianU/VPG3cLmGg1Xk9ZI8NXYOQYDan15Re6wbACuxkiY6wyDvlWn3vCQNoVI1B765Snp/PGjQ9E0FJDVH2zLCWtQXmfhe+U1uRGfXLXHSPw/HgPIVz5agr6kFIsq0KsS1b5dPZClAgJRlKf8V5MOhC5PgH+AHngBjDzOEGtOhkDyLH8/32fMZ5Z/NrLhdcYmxOtJuKRuEu+wRDWlvHjAzADkM5wxtePKyP2VGUNz05xDMslFSAxJzxibEP4HKq1LJijpgGbcIVr4ed+tOV9y0/XLtRfH1Aif1KRff5gwTdDL34Hcso8ePX+dinR00mJhGarZRgqzvtyhqKJawv0BchAIFofFgSAhQLnVyzlyMqbKGVOLxAbsgylXj2g2f9GcY1x3Z0b4ytO2DfdUAtt1SRozYr88i2Yd70AZd0AULEtnjNl7PqB4wN4qAtblte2xi3L8oGN40RraQnl9PK+ibWL3hQ2qWug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(39840400004)(396003)(366004)(4326008)(8936002)(6666004)(6506007)(6512007)(26005)(5660300002)(44832011)(52116002)(83380400001)(36756003)(6916009)(316002)(66946007)(8676002)(66476007)(66556008)(2906002)(38350700002)(38100700002)(2616005)(1076003)(186003)(86362001)(6486002)(41300700001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nE/hBITs71tvvhpsPVD74nggQ90BCfgKfu6bj6ygIzAkqFmmN1URuIcLErXj?=
 =?us-ascii?Q?RPowpMUaq7qcZVsUHnFbBQnWd1muOOXLZSSMpF/gNx5SKQGfbHJgjBD8nYcQ?=
 =?us-ascii?Q?64VwSVYBkFB3PsbsMDv8lvWik0AbKjKd30+EZYnqB9JjzMtJ1hzT8PaS9j0z?=
 =?us-ascii?Q?8rMBfeX+uBTz0g51VYJDGNmlUQfoayPwO3aT+bMeyzMqqQ1/9u91bFk91WTo?=
 =?us-ascii?Q?hUwhBaATeK+IXV2Ej/wZgcisqsFpUYxylajN78oNb+VPUb4duQVBzhM7WSIn?=
 =?us-ascii?Q?qN6EkLlmr++qNONMwZzPxjnap4hZP2xWUAyWOb7rnVq07/jz6s0lPbfaBOLr?=
 =?us-ascii?Q?yKakMJ5p5rLjHgMyJT2uw04q3IML5J5E1IKAKRGigkFGheB3ZKWt09jGV+kd?=
 =?us-ascii?Q?ir2UuL/6n7MwLoAY3xDNT5gQfPfIqafQiHjC9Vf6dCiU7XItTwMRlPJkzrPa?=
 =?us-ascii?Q?FlZjwghv7IxR7U6PZuM6UXno/FiQv+n/YsCqKbqrgrg+jKYX3RWFrHaYo5lT?=
 =?us-ascii?Q?AekzD+G7HboM74D77ZUSaBsfq14FdYJwIeZc2W3iARaTrYtGP/PXNk0tT6xo?=
 =?us-ascii?Q?m2pNSV6fnqPrMALWKKih9tAH1YyNAJWmPV8MMTTJADzvg9YWSlM1lY74eqYm?=
 =?us-ascii?Q?cewS4oR7MgeXmqhcAdVurZtJq9DjxcCfbPieADW3SlCg9y6LoJrgsmhVwFVr?=
 =?us-ascii?Q?j5qCHyXK4PHl/TPeHJGrLslc9YGW0xSUP3RxVvemQ92Z9dDg68GpNDmPq5q5?=
 =?us-ascii?Q?rU6fMvGvUsnT+hs7OE/3XsevVDcl35KYHvaoi0aCXB4tUG3Tol8O/RruJnzr?=
 =?us-ascii?Q?PHxkHGhRUz6wWaKmM2zgKUXVgI+pae6IeCul0YniKkzbDuhEbyDRqo6E09Ws?=
 =?us-ascii?Q?mZuPNYKSxTiVBIQKeKJVr4y8tev6VrkSTKKx05mCZC4jWUYHNEjEhsqE0KAP?=
 =?us-ascii?Q?0gFKkGDP1FVaURPcSRI6mWD/p99LVuVi3zyEhlyMMtULAldgfM3/5FxeuJNw?=
 =?us-ascii?Q?52fbwLDYt345v3+KWSCWqDhuY7i3Q/9CC518wAyMFo7s/VFHXfW81qHT/xc2?=
 =?us-ascii?Q?OocGJ9SPAX0xy/IOZNQpnQ3EtNKWSfvgDpxvkjfqM7iL+2mkkTQE727sVK79?=
 =?us-ascii?Q?MbOCODFCCzqu3PK4Dkwrtu3gzEDIu2e46tmaciLajBZhIlVYtGFbKBNdwTEE?=
 =?us-ascii?Q?kblmfqzu3Fnbgyj2kqyJ74jqFWmXTqVLYBCw91k3T4RbfGnxWT+us18uzWxc?=
 =?us-ascii?Q?MjrJNFEgr/KhlpwxBpCUqbQmGbxLOwX7J68/pg5vkOJAPfvzJVuBfbfNbr+F?=
 =?us-ascii?Q?9TvcO8sTQiPGPxeJnPS53lTqT5cYCxJbL7SMjyon1VEGXAaWML8sIc9t9uf+?=
 =?us-ascii?Q?aIvPbpdJeOqb54WlVLBGU2Rr4rYLVlowdqD+ZpcADTqrJjCQA4dJ1LQ1i+rh?=
 =?us-ascii?Q?jQvG7K5oASmj7F/ihFZ/8OioipJWtMJm7xhPGzGbwyqacXuUd1rSyqElpF9f?=
 =?us-ascii?Q?+fh3mgVGYKIV9bDd6EYhEKrUGojCOjv7OPQbJi0gLP+h9rz9swZRWXnHRqCW?=
 =?us-ascii?Q?cryYc2nDRfCcz6zrEw9WKp+JOuptdofxBTrG1w+3Dk0oV5bZyzDFIog143Ws?=
 =?us-ascii?Q?xy6Ka61MhI+RjYzFps4yNx0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4299c3b8-f0c1-4683-a7d3-08da841d78ad
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 09:05:34.1785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MbaMlw81rlxcCLQ82m4QKNVROjXAxuUqoQ/vjTqjGSfHl9a61atcdcW5pukgBq5BiLGp3fa5R69ZBRRhYuelGMttWKDzMafXeM+2q3sy30s=
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
 block/parallels.c | 50 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 36 insertions(+), 14 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index a35035e231..bf074f247c 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -438,13 +438,43 @@ static void parallels_check_unclean(BlockDriverState *bs,
     }
 }
 
+static int parallels_check_outside_image(BlockDriverState *bs,
+                                         BdrvCheckResult *res,
+                                         BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    uint32_t i;
+    int64_t off, size;
+
+    size = bdrv_getlength(bs->file->bs);
+    if (size < 0) {
+        res->check_errors++;
+        return size;
+    }
+
+    for (i = 0; i < s->bat_size; i++) {
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+        if (off > size) {
+            fprintf(stderr, "%s cluster %u is outside image\n",
+                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
+            res->corruptions++;
+            if (fix & BDRV_FIX_ERRORS) {
+                parallels_set_bat_entry(s, i, 0);
+                res->corruptions_fixed++;
+            }
+        }
+    }
+
+    return 0;
+}
+
 static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                                            BdrvCheckResult *res,
                                            BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
     int64_t size, prev_off, high_off;
-    int ret = 0;
+    int ret;
     uint32_t i;
 
     size = bdrv_getlength(bs->file->bs);
@@ -457,6 +487,11 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
 
     parallels_check_unclean(bs, res, fix);
 
+    ret = parallels_check_outside_image(bs, res, fix);
+    if (ret < 0) {
+        goto out;
+    }
+
     res->bfi.total_clusters = s->bat_size;
     res->bfi.compressed_clusters = 0; /* compression is not supported */
 
@@ -469,19 +504,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             continue;
         }
 
-        /* cluster outside the image */
-        if (off > size) {
-            fprintf(stderr, "%s cluster %u is outside image\n",
-                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
-            res->corruptions++;
-            if (fix & BDRV_FIX_ERRORS) {
-                prev_off = 0;
-                parallels_set_bat_entry(s, i, 0);
-                res->corruptions_fixed++;
-                continue;
-            }
-        }
-
         res->bfi.allocated_clusters++;
         if (off > high_off) {
             high_off = off;
-- 
2.34.1


