Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6924C6B77
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 13:01:35 +0100 (CET)
Received: from localhost ([::1]:47122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOeiY-0006zm-LO
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 07:01:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNo-0002Lk-LS; Mon, 28 Feb 2022 06:40:04 -0500
Received: from [2a01:111:f400:7e1a::731] (port=24768
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNj-0002Kz-1o; Mon, 28 Feb 2022 06:40:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMr/EUl4ZznhWh86hpAroa8mcydmOufmZZkg+8XboE6im3maSKd/I+H+6FUyY++f0BL7lWEKCszFDRyGS+3qz1JjuJZJS7jQbGlXu8FFIXpK7/NmOkGjrFo/zRmAlsAmu70Krd8r9rcpflf1uz9SQ6m4GbCf0WI40vzsZamrkrhNtKUvfg0yXficR54TGRMXIZdimND4JVrvLHKdRCicW4f7W+8dsvrZrTYQulwW6d8JL8HjpJsQFUpYuDLyJneLDF9ayQwVi8LHECHs+r+9T6DyhMei5UPLM+tDYA3w0afyfwKFM2CSbOW/ZO2oRi4u+SPxiRTCr3lbbyxwJPRrgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NmMZWPsXy6sCn/KTx0rcRRhgXC50lQ65Ci4s+q4S0Dk=;
 b=KrtSlCs0vy3fMIyNj0pij72fNSFMRORX4xh9Oj8unO43O+EiMDyVicLqL+4uX0gs/dtAivcY472qsDR54OpYtyqFpqPBEnThuqVSIJOUndzYH+M0VrkrjIhrv3uHF4hKYobWrB4XHaC1WFkYC9nBQOZ/UvlZNpYZJvE+rFKrlGp7WU4W1wFHcfe9BsiaBIoL6g+NBw7MXaZaqJIyGmspWcaX7WeRSn+xiBKx4WvA54jmOLiR+/jFVGjau4FLw7+AUWURHCB7LyZBtz+9Y17xPtPz7pVebiYFNtKVvczyb3lcjcCjyypMjDyxUevzKP05SIoGElWPALURv7Lz5PfEuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NmMZWPsXy6sCn/KTx0rcRRhgXC50lQ65Ci4s+q4S0Dk=;
 b=Uy5RNvFNRpCfdO/hGKCexhbOrODAI5LCgmjqdD/tBo33aDg5sqazkciIZknN/ck3MOkelTju9VIp4ZMstd4v5spPml5nwdpO6aaFCn5xSnqA1PRkMno0THVaJRfxRkwcRMxiNJobmWj8mY27S56/icN/jlIyCGWifpB1RPgu6lg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB8PR08MB4172.eurprd08.prod.outlook.com (2603:10a6:10:af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Mon, 28 Feb
 2022 11:39:47 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 11:39:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v5 03/16] block/block-copy: block_copy_state_new(): add bitmap
 parameter
Date: Mon, 28 Feb 2022 12:39:14 +0100
Message-Id: <20220228113927.1852146-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
References: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR09CA0135.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e089cad3-ec8b-428b-da4b-08d9faaf058e
X-MS-TrafficTypeDiagnostic: DB8PR08MB4172:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB4172B63B4CD60108CA5A8F88C1019@DB8PR08MB4172.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HN8w0OgEQToIC6qUO6NJeh/Zr4Z9xkb8jgANFQF+c3KE2aPRHazrGMPeJl1dTNXV809mA2kKB2h2QAzYQSRkWnIMQi47TzBQhSb+OzwEoOYUChMAqBx3EzLgsCKwIqUXBEWcrVjxad1CHkaM7ItmvEEPC4ur1Fg7V72NoHqpvZoutup3VKDuOPRekiGOlfqEp8OeLSk6rPBKvsjzU/GBajHBdpdYEHaxhmy+NMxDAUJQs+RYd3Ie1H5YjMFApE/Y73umWSw3qtSzcXEmsgYkLH9XqrOJZL935uPF67sOzlBXzph+0vqOc9p8vuPy2wvA899DVyRZlYzxlXn+KUfSK/+fvoosKuy5nRB7udM1x1z2JLrg0D94JWPkxkgEtua2Ghk/2AP9SlT4brx87/Ohc1XRMg8mzuf+lfwuvZAiWyE5hTIGjFPOXlWwWGr9qmWjyredBfda0qjKaCwTl8SOfrvddgfM3VTc8TgdvM5A91n1oyabM5f5Y5ZzP1M0aWJ2iS9Gr4kzcR7YqDtF/GRqe/SHfwZW5OApmFKICbnrknTLVIF2xXxtfFXy43eZOHDWeWVzRdbCnapAXSAwEwjyGoo6Vzr85Rc/L/L3dhq3kd2tLeH2dY/oT12Xms7NfjocBHXXVQSaGQvK43ck70pDr6VUsuM7Ksx+Dhn6FxGmN4EiUdLN0a0O930EwcNQAvIf+Q4qi3gItbnzn8CO5z0Czw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(1076003)(38100700002)(26005)(107886003)(38350700002)(36756003)(2906002)(316002)(8676002)(66556008)(2616005)(186003)(86362001)(66946007)(66476007)(52116002)(6666004)(83380400001)(6916009)(5660300002)(6506007)(508600001)(6486002)(6512007)(8936002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lKr+Zt6QyfoXQXxtn8tPJrWaR8EQhTK9i7tz6pn65CiZI4mIKNlt05TWSGCp?=
 =?us-ascii?Q?/yy29NuDyFiM95fQOYce/ZJlJiN23Bm/DAkAmFSMtiz56Rjo+RE8v7IGzgjI?=
 =?us-ascii?Q?cLsgb3y1CgdOzIPArJ0lJ0v6wOtympvqwriYGFiPA8uWy0q/B0UG1IytABFf?=
 =?us-ascii?Q?GjuHzuM/Pbobd01+GvSXK4aIjuyVCqZ+F8IRhCmzM1vUgfwymR9qPensA/rb?=
 =?us-ascii?Q?GVYqpfLfxa3kWENOKccYD6FcpeDvjBWL8n9654eEyRqal4Z2U1rjg0X+aqWq?=
 =?us-ascii?Q?My2WsG6NsK4PDc399kr7oh3Wl466hNjucPOR8eiMMJPM7/Mg5oHeEHqHHhZS?=
 =?us-ascii?Q?VSfLG4rrIC8N1VskzpouKz3bTdpl4U6m0S0+tKkxmcITkcBJmqft/f8bSh9H?=
 =?us-ascii?Q?uwOdd9O14WQqLxUkas/YdSnJHKCWvT+1r7BDngC3GwPjcfTfyhCKh0E2/YDV?=
 =?us-ascii?Q?A1eU44WEBlrIbkm9U/Rh0/ONDXAnIXNW3p7VGmKE8I99jdVoMZJnsYMFmMJs?=
 =?us-ascii?Q?cbBIwa593vJKDKJLlrX5SI/OeUHOYCpKckzX2tXLWoVl98nTzBbvak7Rvjaw?=
 =?us-ascii?Q?Jd3tWEMGX8jX4Wb/SlfXZEwW4tS2woBCbviqaghhWTSBdQqWmsFevfIm6UNL?=
 =?us-ascii?Q?IszryixP/VPfA268q8L4LIBkllAo8UZuy2PSkbI6PZET7tnulPf8a36dz0W7?=
 =?us-ascii?Q?5emkZ6mVBmMgmd252Ipf/HpQch63/P7GD+JNgRbKeCY9MM1ctjwQctUq6ISY?=
 =?us-ascii?Q?9Q0y947LIOmlc5RgZG3RTdoSDkwWgCxjznsEIysJLTHganGk73N1GVFQZ0bb?=
 =?us-ascii?Q?TrT6voUL8FnsXDRVB1wl0Guxp7CoRmS2dya/iOCHGNieXjGfsFkK+Xa9ZNnr?=
 =?us-ascii?Q?W/BQFT6shXrkekWP3Ub94iRw+JqVsxstNv2h3AoUY8H7thldhqvQQsvjV2JY?=
 =?us-ascii?Q?MSLK9G9JeUY03Sbv4ade08a0hCYoxW+tzsVenx1AIbqU2jDfyy67ttDRFgRf?=
 =?us-ascii?Q?FgY5b1VCBB3tqRthaeYY8plmT9ot70wj9UPmyPBw5xokY5qXNF/HXA5wv7if?=
 =?us-ascii?Q?8vuINKSIVX77ZPweXhXI6Jp5OIZwGb6tCZSb37qS6nmK/d8XuiToc3gw5M9k?=
 =?us-ascii?Q?1OgJYiuMpTp981TsAscwUTqKv4qAF3hd34BCK0uF9TqKTQKNM194RuEOmkxk?=
 =?us-ascii?Q?7/QX7IIilwaVWKrrGhzT2fxguDXiBhe/5zgwlFjBqNLSP+JBhqwbJWq5vdfB?=
 =?us-ascii?Q?ViT/ZMC+QiJWmRbgv3Hv5CXX2E4kWlWtbOyaPTatIYaH8PcPPORzW3ZYJNNf?=
 =?us-ascii?Q?Jfesfcu5YPEdkyULUpazsZQNmKIAbj5bExw7hnXW1l1tkeXQxWVYxazYvcD0?=
 =?us-ascii?Q?fm5WtR/WZyanhB5aPqvtTV9J3LCZfMoPap0+CDlQj+nYbwzOOtBEMH4DcX9p?=
 =?us-ascii?Q?8MnsGKS8ywVzOGOV5yOOk1GtR4FmVRUaAeLXLcYAttucmagAjRZ32QyMh0IM?=
 =?us-ascii?Q?PK//xwMwcj/Uv+eonXSrjfa6XIlhbdFZuF18kC2g93iCwQHaCEX+OWuQk7hS?=
 =?us-ascii?Q?WqodJbznzOanW57VxE6RL19vDHpTad07dmIE63AAn6t/FV3ayRsZTEuL4lKU?=
 =?us-ascii?Q?hzdj9LgEHQQNOlwgguN4MZixI39KCy/Gis7DQMu3k2jAZs2QNbqKVZCj7a7q?=
 =?us-ascii?Q?SHaIxVyVw+st7Q5dR3iRj6WI/rw=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e089cad3-ec8b-428b-da4b-08d9faaf058e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 11:39:47.1448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hO/v7la3xeJyP6QePWECEfcwVjvmDzF/wnhe3g4ei5ClQZWY5zx7cQg6RKrny5cMWBt3cG1bnIIZ3RRvTn0348MA9ICE2HHTvAwUwqYPosI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4172
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1a::731
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1a::731;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

This will be used in the following commit to bring "incremental" mode
to copy-before-write filter.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 include/block/block-copy.h |  1 +
 block/block-copy.c         | 14 +++++++++++++-
 block/copy-before-write.c  |  2 +-
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 99370fa38b..b80ad02299 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -25,6 +25,7 @@ typedef struct BlockCopyState BlockCopyState;
 typedef struct BlockCopyCallState BlockCopyCallState;
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
+                                     const BdrvDirtyBitmap *bitmap,
                                      Error **errp);
 
 /* Function should be called prior any actual copy request */
diff --git a/block/block-copy.c b/block/block-copy.c
index abda7a80bd..8aa6ee6a5c 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -384,8 +384,10 @@ static int64_t block_copy_calculate_cluster_size(BlockDriverState *target,
 }
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
+                                     const BdrvDirtyBitmap *bitmap,
                                      Error **errp)
 {
+    ERRP_GUARD();
     BlockCopyState *s;
     int64_t cluster_size;
     BdrvDirtyBitmap *copy_bitmap;
@@ -402,7 +404,17 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         return NULL;
     }
     bdrv_disable_dirty_bitmap(copy_bitmap);
-    bdrv_set_dirty_bitmap(copy_bitmap, 0, bdrv_dirty_bitmap_size(copy_bitmap));
+    if (bitmap) {
+        if (!bdrv_merge_dirty_bitmap(copy_bitmap, bitmap, NULL, errp)) {
+            error_prepend(errp, "Failed to merge bitmap '%s' to internal "
+                          "copy-bitmap: ", bdrv_dirty_bitmap_name(bitmap));
+            bdrv_release_dirty_bitmap(copy_bitmap);
+            return NULL;
+        }
+    } else {
+        bdrv_set_dirty_bitmap(copy_bitmap, 0,
+                              bdrv_dirty_bitmap_size(copy_bitmap));
+    }
 
     /*
      * If source is in backing chain of target assume that target is going to be
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 5bdaf0a9d9..799223e3fb 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -170,7 +170,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              bs->file->bs->supported_zero_flags);
 
-    s->bcs = block_copy_state_new(bs->file, s->target, errp);
+    s->bcs = block_copy_state_new(bs->file, s->target, NULL, errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
-- 
2.31.1


