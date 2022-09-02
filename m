Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2DE5AAAC4
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 11:00:04 +0200 (CEST)
Received: from localhost ([::1]:47044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU2Wx-0006AU-6m
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 05:00:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oU2QY-0000NK-Ev; Fri, 02 Sep 2022 04:53:26 -0400
Received: from mail-am7eur03on2138.outbound.protection.outlook.com
 ([40.107.105.138]:50657 helo=EUR03-AM7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oU2QT-0006R5-Fd; Fri, 02 Sep 2022 04:53:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YzCTW+1h8peEXKhs4j3IlZ9HNxcbbRlhfLeqZ+qbZjEwyY2aTNlVdHhNzNZ/EkFplG5gRchSsJ+4iCAY5ex70nDQfGW+4GIdinJEyGAbDFfHBH8qJESty1cEVCH5SrrKcwMuAdqtD0YacBSewaKlIySTCqXjs9EQX8zeLLlMv14K4hkAf1OUrF9nG3Z8N6dTdIEIoWHxNanNCHIAZhW5n+fm8ZLUwR+JY7LyV3+lg9X7hAay/QJa5QirtTcGcfGbDRAovcGcHZLi5HQ3wbNdcNw5tdIBmrTZ3Pl5D5CM/7sdr+lwHywbz119Mx9dcqDuJq7nD3MQUwl+ZsfmkmAcKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3mEsfs3tV6m8G6dfYyF57ayDsgHRgeBhrnLSw9w7PE=;
 b=Q30pQnE/n8HULYxSsmFV6atbwejDskyMv8KwjEBpskC9c8MngqbuivZM0Zx0Rs2Qqic2VOtOVvV3uy1GoI0IpD/ZXGEYM1/O3NS2KRrLv3aDBjw4EVLkiPrL9JmZR5RN8Olp6g3NcjymifNUla4xRoIJCTCjTZHjbSUmN3l+1b0e+T3ktd4SYgNTIlngOMgaT0ohF2FtBFy43XhFYtluFc+iA5DHRWmEwyuPyXnMXkbnd4ap3wW3Y4h/LZaYGJK7aKQOLSqsLU/GEEMcUZmU0/w9gnK594nRrjn/hB9uxoe9/EJvqf/rv8THDzkXNOgElp6HfFN8PhJUAMHsS7HCcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3mEsfs3tV6m8G6dfYyF57ayDsgHRgeBhrnLSw9w7PE=;
 b=GC1hCp47ruGOa5AR2cJBLE2WxWIAN23f3XnlEPsDBPPu3M9QOleLGab4Lx7QlTzpLUdXhG8hcTPNEyAECVgtGoI2T8CcyzlZDF45DNOaCVGhNUTB8+a+3DK3rvUDyJ7IOncEs96bFWiiYh208VSqA57QN1M/yCexSqhvtJb0+K/U1Ssjt0SfmejTW7yplC1Ted9Ab62TfeTLx32k3lEAQKNlfEIkHaOTqIZrP3PVOK1TsLl54SQgivS7ecGsLOwjYo1iPAuJ5WmBCrTZVol5aOWdcOuiHrXRPEutZwR/SedBQMXym5Dssjg+YXqA+lXohhEzXwwfw5nmUA4XbhzKeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM8PR08MB5619.eurprd08.prod.outlook.com (2603:10a6:20b:1d8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 08:53:10 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5588.014; Fri, 2 Sep 2022
 08:53:09 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 2/6] parallels: Create parallels_handle_leak() to truncate
 excess clusters
Date: Fri,  2 Sep 2022 10:52:56 +0200
Message-Id: <20220902085300.508078-3-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220902085300.508078-1-alexander.ivanov@virtuozzo.com>
References: <20220902085300.508078-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::18) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fd434cf-0c90-4171-1deb-08da8cc08fa6
X-MS-TrafficTypeDiagnostic: AM8PR08MB5619:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4RThiYvXxFjaHsLXuE+AkQe9rYGU5aOhr/MXzcJPAbgtvWT4DCunzTZw2JH9BOW3qqe3Ak8j0NUlysU3csx7TCXtWdkngj4md0WrGtU58/zKhopO5rBOh2YNY8M/rKOyGyW2me/E6BD2afhPz5NGA5KE9CVOrxwinuUpLJ124Z/OG0+q/eL6/T0hCb8HhqSukWcR5YW0LGFb7M0S6ShORwWilbWhlXmHh5Z8YH1ijlongvkrdWdPVvkBPWapbtQE7Ea624AngSJ1ShLmGWhv73/FCCynNskJKFIrlX1MACPg33bZM/abBiBW7D2HXnCjB858bJHTiWFcllnIhygv+VP1tgB+rNq5cvryhIVtY7+jLyYJYGMTUIhbXrwaPp/y8gy/QblRKu38X+xOnBLnaMN9n4fAmUHq949xODXLCuQahIcC0Lp48sz3LrVLyuuA9xFvkQNflPOamsqePK4nKohTjjCVt7m5TNA0wxbIl6IFz3Ku4fY3BHcEL86WF7xcI51GpH1iwCOQpEjRUkNx8sczwjafMDdjGZACyfwTheA3YbxA39uVXQTJqfYQgWRs0LdjYRB6AxgfE4nDcDpgkVQ8zjqvv1bb2XfMtc62b8JeGYV5FZfX9FEuBNazRMrL1CW/HQZkA+h5yOOecYI4p7YbPWyqEISWz4wo1TbhzaQRPwhiqQE/oxtSMNg9AVDiExeh4HmgJCMHCUYYIP6Fdn+G/eVLhBJmePA9ER44ql59j4siC/Na7xvZSQC2T8BOGITswFQNuo+CxtbCVrIndg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(376002)(136003)(366004)(39850400004)(8936002)(6916009)(8676002)(86362001)(66556008)(66476007)(4326008)(66946007)(316002)(6512007)(26005)(2616005)(83380400001)(1076003)(186003)(478600001)(6486002)(6506007)(52116002)(6666004)(38350700002)(41300700001)(38100700002)(36756003)(44832011)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mvwNeSaj7FxDNBteu4Q0wS9emX7sjQKLYsC+9xuX7gDXeXSujXAIDrTQlgm4?=
 =?us-ascii?Q?OnmlE/KEM6999lESujAjq6QRPkOYT2dUY1UoHhHWadobyLzO6hGdYXufYu62?=
 =?us-ascii?Q?ORgS8kYaSbOAHjcke1s8UEGK51zdLrpvpT97+96PmRKueFXXFdHzcx9mM4gC?=
 =?us-ascii?Q?Ek2QvKK7SOSZ3ufYNMUlx1ekJUBbGHLQlWw3YSQ3HekgqXySaLSeStsr/8Ub?=
 =?us-ascii?Q?joArWP4Lh6H5P+hlDboqu2fSkIZvcCIdMKchkZzebC0h6XWW9iwQsioAwszp?=
 =?us-ascii?Q?72P9OxvneTFVmEp4kKfKXHmu/1+/VfXBbsxT1GxrP5DCRc8Sg5DftnVG/7RS?=
 =?us-ascii?Q?0cSvsSlpkGphjB6gZFxlZNK+6awSe/4kTukSAjb/hw75cUJx2/6ytO3E5gpf?=
 =?us-ascii?Q?CJoRHctewpYdjeYeYi4c16aV4WVxZmpEsi8E3Xb6eWGvi7se23Lf06KMhUAf?=
 =?us-ascii?Q?lydks2ADyaAkdo6PnNVlI8OY4olvN2QcdfE06XDO/E+NUKV5W11HgtFA4TxF?=
 =?us-ascii?Q?Qo8x041KQeN/NDQzpUkBBeJ7egDCeOJChu/U4mU/U0ZO8fPUuZGAdGXZRvi0?=
 =?us-ascii?Q?wFC1orX4x58P2yKVUzsbxNCMDgLG4DEd/7+oIgrJx2G1pWVGeq104POrcFXf?=
 =?us-ascii?Q?0iIYi+8P/i4MlpbDA3UCWenUCHh3oxH9NPGyNFhj1cXVjvRO1cGnQ+GPNZJz?=
 =?us-ascii?Q?VkOew9QcGAQVFBXjeGrNEspGCJ9Zu7w3oo4/DHB69vzQmgwJ2LRMrwP9wAYx?=
 =?us-ascii?Q?TJUJOwXc4UAm4x6CWYMNinrdQi6s9eR8Pifji1yh9mh5UoUZH9ehG3lKTIcN?=
 =?us-ascii?Q?oytmLo5ftPdHaS3hoJBjkjMzBuYf+2KQWcdT53WnQMgM5xrWs/RI0Af0xQGL?=
 =?us-ascii?Q?uWXtCUU+Jb9UzkTridQuJYDPtgHvlhEqZF2H3CCefvTxzDN5HvQ0Q0immjuc?=
 =?us-ascii?Q?43Q7e9h5+IDC/3h6YMZg0lWJYkOb3VDJtnfiFM2q+gp5ghwSpbkbOUXKBbG9?=
 =?us-ascii?Q?OwvxZO38Lg/TywX0eDThgJu2dC63B1F0v4T7SMuIf9dX62geThUn2yB7XBvj?=
 =?us-ascii?Q?bJI/Qmoi4vLnoYVwR54LqJhzK8L92TCgDJUcOp3kX610Y9UlURwXnUHVpXPZ?=
 =?us-ascii?Q?y8eI+UjykhyOgs+wLzZp65K3S8nrh/CEXgNkfpsVXiouhrAg0aAXDdRps7Wy?=
 =?us-ascii?Q?s7DMSzuAleTQyKchWu4VHVDrEhZa9UvgFpQ7GqH4DjS3jOQ4478LY2e9s09o?=
 =?us-ascii?Q?wEA4i6OY7pE4Ry1BDExKZWkvWRWfG7+do6ncNdQ1tKjWnYbySdMy9inR8mCX?=
 =?us-ascii?Q?nyf9l5wKHyvCKeaj7j1gsn9jAtrXLGnDX81iL9+NsV4vIO9jL3hXmSBnaMHc?=
 =?us-ascii?Q?DF064CG06RiuuQVUNAWYr/ElsRSDOw0k8qgOM0SHUHS7nwl1iXgs4mR2o39Y?=
 =?us-ascii?Q?YV5oCSViogxgG22CHGq5yGOGpp0THYlB/QTUaF8SnIElj9TWot+1QSJWs2g0?=
 =?us-ascii?Q?q81l4jU41WOJJGn0L5xWPNAYErVOuwA9SNhUHVmx46aRGJLr+hYe3BlsBF+B?=
 =?us-ascii?Q?eMKadkazhSmqlWXEtnWYkJyJef7EH7mVhjlBXP3rwivC2Wzw8VLx7LOKuUfu?=
 =?us-ascii?Q?15KVW27VU6lK5jpzKf6XCwM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fd434cf-0c90-4171-1deb-08da8cc08fa6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 08:53:09.9078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jjhJSD1iDZVdjEhhH9CONn+4j4tk26JhciO5ewd6MSkaYBI9jv8uSh4wve7q8G2j5IewGhOHKXVIrsMXvV9efeFLsRq+Qm7gbgWj+u5nC3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5619
Received-SPF: pass client-ip=40.107.105.138;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-AM7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This helper will be reused in the next patch for duplications check.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 65 +++++++++++++++++++++++++++++++----------------
 1 file changed, 43 insertions(+), 22 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 7b4e997ebd..dbcaf5d310 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -475,37 +475,23 @@ static int parallels_check_outside_image(BlockDriverState *bs,
     return 0;
 }
 
-static int parallels_check_leak(BlockDriverState *bs,
-                                BdrvCheckResult *res,
-                                BdrvCheckMode fix)
+static int64_t parallels_handle_leak(BlockDriverState *bs,
+                                     BdrvCheckResult *res,
+                                     int64_t high_off,
+                                     bool fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t size, off, high_off, count;
-    uint32_t i;
+    int64_t size;
     int ret;
 
     size = bdrv_getlength(bs->file->bs);
     if (size < 0) {
-        res->check_errors++;
         return size;
     }
 
-    high_off = 0;
-    for (i = 0; i < s->bat_size; i++) {
-        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
-        if (off > high_off) {
-            high_off = off;
-        }
-    }
-
     res->image_end_offset = high_off + s->cluster_size;
     if (size > res->image_end_offset) {
-        count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
-        fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
-                fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR",
-                size - res->image_end_offset);
-        res->leaks += count;
-        if (fix & BDRV_FIX_LEAKS) {
+        if (fix) {
             Error *local_err = NULL;
 
             /*
@@ -516,13 +502,48 @@ static int parallels_check_leak(BlockDriverState *bs,
                                 PREALLOC_MODE_OFF, 0, &local_err);
             if (ret < 0) {
                 error_report_err(local_err);
-                res->check_errors++;
                 return ret;
             }
-            res->leaks_fixed += count;
         }
     }
 
+    return size - res->image_end_offset;
+}
+
+static int parallels_check_leak(BlockDriverState *bs,
+                                BdrvCheckResult *res,
+                                BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    int64_t off, high_off, count, cut_out;
+    uint32_t i;
+
+    high_off = 0;
+    for (i = 0; i < s->bat_size; i++) {
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+        if (off > high_off) {
+            high_off = off;
+        }
+    }
+
+    cut_out = parallels_handle_leak(bs, res, high_off, fix & BDRV_FIX_LEAKS);
+    if (cut_out < 0) {
+        res->check_errors++;
+        return cut_out;
+    }
+    if (cut_out == 0) {
+        return 0;
+    }
+
+    count = DIV_ROUND_UP(cut_out, s->cluster_size);
+    fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
+            fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR", cut_out);
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


