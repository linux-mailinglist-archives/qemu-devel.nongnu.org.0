Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5024BFF9C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:04:16 +0100 (CET)
Received: from localhost ([::1]:44182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMYaD-0004fh-Qi
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:04:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nMY6M-00061j-Sd; Tue, 22 Feb 2022 11:33:23 -0500
Received: from [2a01:111:f400:7e1b::71b] (port=19495
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nMY6K-0008Lc-3D; Tue, 22 Feb 2022 11:33:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMLhl+zXHli5c3ntbIVvhLg3zpeM1rcva2cTD6WKGskuj41BL1mu0KK1goQ7iL4jaAqOkqVAHodT6iX25rY/TC398E7fITogGLBVS4rOjkw6mABr/BCb6J3guqG0RFv6aWiisQXn/G00j4McGmbMPB9p/DK6mNrJXjxTLwHgk0wY7r8NF/4OLHNAXYbSA9ySPR5Mv3ZFdyjqcYG4yXDXOcBfKRNcwV8T5oE6EuF5AMOGbMBdhvuk+zXnc7ya1uDRy5t9Fsd0qI5FPZ1rBWFsPSMHMtM2/cXqMoywRDQdI0evZx3YuVPE24/jLiuc//bi9YT1i4QZ1ZKjFHAumyYHfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYCkIsx9+bhwl6XDNZ+n+3c2V2cwQDr4V3HIXM5vypM=;
 b=IfwCZxAnBs/C/Q0OGAtRuPEiUczOqbPdbxW0nufSAxilGLbdZvwfn78uqBZz1aHBs2Y+MbsnXr3s2a8awh5u+cL+7KqzlCk9lSaRCSHw/Nl4aVsPHrZjwXmwU/TAuGDks5OYx9iYk4IQCBCc6h5YSciURHDIUloxfTRujE/2KuyzelSYokmZdLjAbXTq+UTk1Y35jSkJ/ODDoH2AvlCTvjwhmglcbM4to3sBZ1TJxSl/WMzWuhIzNyXDPN/HXbb5Kj+GDCaZU+EAuvl27IMVvCu55rzXpJDdlbGLCSxd7EEjueoOWO3kZyXzV1TowDCe/ZQkt/bCo8Tg+Yf+82Xlrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYCkIsx9+bhwl6XDNZ+n+3c2V2cwQDr4V3HIXM5vypM=;
 b=BSH3qc4fRLBJjM+8HqJyM0PTxkmxJhp7oYK1Y7KuozNO8M3EUvTcO0kHbjJfsEbNqzMpkxdaD7ozNSrZxHI06/Qe9zxrpyjVXalquxTTAqTHBLnhcwvSUqwd5tvffBKmmNZFK26l1CwqldDXU3aKZLZmQyuyLmVgpC1HVOYnKGI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB6PR0801MB1669.eurprd08.prod.outlook.com (2603:10a6:4:30::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Tue, 22 Feb
 2022 16:18:49 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Tue, 22 Feb 2022
 16:18:49 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, eblake@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v2 1/4] block/dirty-bitmap: bdrv_merge_dirty_bitmap(): add
 return value
Date: Tue, 22 Feb 2022 17:18:30 +0100
Message-Id: <20220222161833.1453641-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220222161833.1453641-1-vsementsov@virtuozzo.com>
References: <20220222161833.1453641-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0401CA0023.eurprd04.prod.outlook.com
 (2603:10a6:800:4a::33) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3bcca1e-9799-4481-fbe5-08d9f61f01f5
X-MS-TrafficTypeDiagnostic: DB6PR0801MB1669:EE_
X-Microsoft-Antispam-PRVS: <DB6PR0801MB1669840EF141DCADF0FD0788C13B9@DB6PR0801MB1669.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kzJLLutTWeMuPkii1iCsSuM3Q80tuAQR5Dh2Vkk9v7ZMV+UAjXYO7HMoydJzRGXyYwrV7BzcuTXxE6jHd+ltZ62BpVhKPBIJLiXN3fsr3fBfu201ptqMVqTMhthF5d/DWS5fnwr0cL4VuXQoH5aVH1WniM16MP8grfnMHI1N4Rmt48Px7EjThkFRpLySMSwNnr7wle/9x2IpgaI8ITfU/OWX5VdCtR3H/NAKTheAVE34YOSzroFPKDjYE2Lms5OLBi3AmZVxq4ffYb1wWZCC5QmfVYQhqRvggzJxTaskfOfZYNcTxh2NpJ80EOCPO+tltQxs9ddEufxUvCJPxaxmUpXpQpjqpgCQDJSoYKeRYRf7hMIYbG0s5YUwfmN8NmmEeJW7ZEn+2ITLzatxzIoSysEBExovg5/yP1GOICU3V9lo+nitS6iJUX7OO/PPV+XVXdjumpnkpd5ph+cAA3rZzgYw2FbP7kX+SCz742nEi0f7b6B/8Ee4GcwIhgDGLdl93qjIyDW5oMlWslfHgg30S0aN6kju3/KZQKTxd19D/hd03qXIQLmlEL707EY+ImvIbVbFMFuCle77Arr9fu5lhuFNR7IXM2p9WytJLkuCeOsH4l8df/JdiujxQASQiAZ1BC/CbiZMsfHgKMou2zby/mT/MLQSits1p3RDcjE22k5Px7oiu/w1BKezi13+UIBkV7cbo2cKP0ld8eYc6WRhHV53BpGC0jewUZxw6NXL1ig=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(86362001)(6666004)(8936002)(52116002)(66946007)(6512007)(66476007)(66556008)(8676002)(38100700002)(2906002)(4326008)(38350700002)(107886003)(36756003)(2616005)(26005)(6486002)(186003)(508600001)(83380400001)(1076003)(6916009)(5660300002)(316002)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RPcvgTCyiN/w6xtaHaWhTFviKN+t0VDK47WR+NFELS7gaA/zkS05rsaQUzF6?=
 =?us-ascii?Q?PlIz9oxQlPVa/nBxkKOYmU7AlN03luZ9k2a6E9SZl9u9NaJLvn7SvfSjDGkr?=
 =?us-ascii?Q?26QGqU0x6o/L9oKv7qUJxW1k/UnRTgW56lsoF3ee9n6R8uz4W9dkAFUfD/Oj?=
 =?us-ascii?Q?ke1ZQS2tPLLZH6TLrGSJco9IN22p46Bclo2JpogRHpCSdEb7yqx5ErvM7fST?=
 =?us-ascii?Q?rubWFCqJkfpiFN48z68LR1TQ1+5KehQSXbKf38orEThjQofWm8n4DdXK24/F?=
 =?us-ascii?Q?I4kIxX9nMtimwciH8RXBKRv2M6TeChE0zdpJaFILvq/ZqIHGYOp5V85i3vfe?=
 =?us-ascii?Q?a4Q29N8h0+QDd0jmTxu34/7ZNnhninzJZbdeRcsdx6ZgpCtAONgrXmE83vGG?=
 =?us-ascii?Q?ZJ9/MhWy3HiaW8Eczx9y6Sn0mlN0wYooiGgOSvQhTJpqOcHW3ycI8zXlLL2E?=
 =?us-ascii?Q?VY16/lhG0F2jgBhBjsPK0VUxz0DeGhNGemzW0Cmgi5tVhC6JKfOTDifZ9l4t?=
 =?us-ascii?Q?FSjcs89+d/ZtFYjC+2DlCu5OhSW/GwImnYRVfafWW0TJkxoVk7Gf8A+c0MOz?=
 =?us-ascii?Q?jqSCOO4h/O7bVupK5cyXW840EMTEzmJz4kizNkrv8rw0tcAyMojirr1G6ZUe?=
 =?us-ascii?Q?FxePpDns4LP5cyqe6bbGP6f0avz8NQIS1oP+ZM3tamv5/kiYl6ftDMPhswpX?=
 =?us-ascii?Q?VRKEy7ESI2V6ajxGGnjgSWZy3j8/0LDg6Fa/jVytAebn/4VO1IqU1E3SG5aE?=
 =?us-ascii?Q?m3wmMHV90tVBtdjJvpsQ/Z2eJs8KjN31kUGniWPJfwhXioCKfoWc5anBA8/R?=
 =?us-ascii?Q?VPlpal5EPPDKzmEvjMLGQEv2rXOsfEXvIdZL4PT0BzlMRT3CodYFTtPLsLzf?=
 =?us-ascii?Q?GZ5OV6fBv9QxpuzBArGx5eP3iMq4n8eagl9XS+ySOK7E+1EqhBgWFG4oAUtB?=
 =?us-ascii?Q?/iOpeFa5GogUkSfYMZ79IgrTLuG1Sjydqx9epM08RkC7aNlS3zTWkzD27ZKJ?=
 =?us-ascii?Q?ygpvYzXVhObbso4DrbB6g02wDgdyhC6TFFSwnRdb3CzA38R1DZZSKPWDiZFN?=
 =?us-ascii?Q?jJyJ3NPOoVp/yf7HEAzbKRqgjOOLcYk3SV2ELoQTYtQFTEyaosql3dPCEzl4?=
 =?us-ascii?Q?Mg4oQVsrYXdqvStyR+ea35y54zmOf06F8odYzD0szxV4BRBrvrbeSh9l/x44?=
 =?us-ascii?Q?Qz8023C+eJrf1+18aZbL9BuiY8WCKWBuq4l9Kt7MrSJDqJ1oTqk64frJUqci?=
 =?us-ascii?Q?tIjtlcpYQe8BemDUkzttUY2vyMyQZedq0YcqMtg7ra9v7dC7q4nWMoUlRmvL?=
 =?us-ascii?Q?izWLCOXxl2+Lxvl9TNOFwAw0ofPm0GTNfLcT/C7LsNcg/5yo0tFmsDgItYti?=
 =?us-ascii?Q?at3SSi7Cc+dKxyW0R7mMSh+iQXZzLW/DMIKzNoZRDyWhPEx1IxMHQWckVBOs?=
 =?us-ascii?Q?yrDGQR9tK5K4/uYCukOjzkavDHxM97yaKsv8tDsdr6K5s25HsZYN0O6YpT2N?=
 =?us-ascii?Q?axHkbpSICgSrN4II9Dghva42CzjhpUSRFpRM8okcsV6jhDE+E3CWd+UsfPL4?=
 =?us-ascii?Q?8sUqIHo6jiB+JCAd9VpHgXQG9RBgqhioor1PraXk+MODEcXyNAoBUGOaa/Ii?=
 =?us-ascii?Q?UUjxXD1fBslhs2QiSJefp3vnpc5CMI1IsLwBClKzDM/y99HN779ARdNfF5oO?=
 =?us-ascii?Q?y4IMOmpYE25CEqfko6Cnowham9U=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3bcca1e-9799-4481-fbe5-08d9f61f01f5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 16:18:48.9608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gh5bj9EedVY4v5+AmzOCiIzEHiAg+qLuS/rTPBoBvYPZklYVyvUxMDNA2eNLy4g+beZVndL0C81Fy0nhRcdxCY8tAOr6qdhf+Q8MwlEKR7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1669
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::71b
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::71b;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

That simplifies handling failure in existing code and in further new
usage of bdrv_merge_dirty_bitmap().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 include/block/dirty-bitmap.h    | 2 +-
 block/dirty-bitmap.c            | 9 +++++++--
 block/monitor/bitmap-qmp-cmds.c | 5 +----
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
index 40950ae3d5..f95d350b70 100644
--- a/include/block/dirty-bitmap.h
+++ b/include/block/dirty-bitmap.h
@@ -77,7 +77,7 @@ void bdrv_dirty_bitmap_set_persistence(BdrvDirtyBitmap *bitmap,
                                        bool persistent);
 void bdrv_dirty_bitmap_set_inconsistent(BdrvDirtyBitmap *bitmap);
 void bdrv_dirty_bitmap_set_busy(BdrvDirtyBitmap *bitmap, bool busy);
-void bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
+bool bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
                              HBitmap **backup, Error **errp);
 void bdrv_dirty_bitmap_skip_store(BdrvDirtyBitmap *bitmap, bool skip);
 bool bdrv_dirty_bitmap_get(BdrvDirtyBitmap *bitmap, int64_t offset);
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 0ef46163e3..94a0276833 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -880,11 +880,14 @@ bool bdrv_dirty_bitmap_next_dirty_area(BdrvDirtyBitmap *bitmap,
  * Ensures permissions on bitmaps are reasonable; use for public API.
  *
  * @backup: If provided, make a copy of dest here prior to merge.
+ *
+ * Returns true on success, false on failure. In case of failure bitmaps are
+ * untouched.
  */
-void bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
+bool bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
                              HBitmap **backup, Error **errp)
 {
-    bool ret;
+    bool ret = false;
 
     bdrv_dirty_bitmaps_lock(dest->bs);
     if (src->bs != dest->bs) {
@@ -912,6 +915,8 @@ out:
     if (src->bs != dest->bs) {
         bdrv_dirty_bitmaps_unlock(src->bs);
     }
+
+    return ret;
 }
 
 /**
diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
index 9f11deec64..83970b22fa 100644
--- a/block/monitor/bitmap-qmp-cmds.c
+++ b/block/monitor/bitmap-qmp-cmds.c
@@ -259,7 +259,6 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
     BlockDriverState *bs;
     BdrvDirtyBitmap *dst, *src, *anon;
     BlockDirtyBitmapMergeSourceList *lst;
-    Error *local_err = NULL;
 
     dst = block_dirty_bitmap_lookup(node, target, &bs, errp);
     if (!dst) {
@@ -297,9 +296,7 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
             abort();
         }
 
-        bdrv_merge_dirty_bitmap(anon, src, NULL, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        if (!bdrv_merge_dirty_bitmap(anon, src, NULL, errp)) {
             dst = NULL;
             goto out;
         }
-- 
2.31.1


