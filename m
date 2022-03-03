Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9574CC695
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:52:47 +0100 (CET)
Received: from localhost ([::1]:59602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPrVE-0001Ec-MT
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:52:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrN0-0003jg-FK; Thu, 03 Mar 2022 14:44:14 -0500
Received: from [2a01:111:f400:7d00::72c] (port=28672
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrMy-0004Wu-Vq; Thu, 03 Mar 2022 14:44:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qs4r8XSiXb5/tuVxVTpqCPl7Ksijt3KjNOjLeqdAq8fyMD48tau/cIkmNpdHIcmkoyqSWcchKJX+m4UxtHY9DXkq+YQaNPQ7C3rUoospGETD92HadiJ3gt6aBl/V03CZ62mPYh7FxmRk5Wc4rG9K++LkxKa9e4wU+DHIzhte8ubLKDyCCjf6Z8u1BvO4jR0JMc2Cm6zieS3oU/5E9+j4vMBwIC/iu75N1MWs2DFSSwoAfFKLxH6PjKN8bhk0ACEvpBVgMl6Ow4vrWbf5NomgEqRWECuBYr/Oc4nGJ/vXBO7UzIAGLJLZ4yY998ZgqPabnaXUXZqQv96spb11kQBzgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYCkIsx9+bhwl6XDNZ+n+3c2V2cwQDr4V3HIXM5vypM=;
 b=aUhQhbKzNuYYmPJL8+RBO4S2gNb+sd7X/aJqwULU1KBSlUffCoe1ioIdYXyPStSFguJBqicJmLU0Dl/J2Q8+mpbR2+shRKTBh2zlGHFoKzHOWRKWB+Q4WQHus3ZvE+lbNxm0zRPCoHNcSFDHqRDcwddmwlEc2BDULaidz74i6Q3rVtM8Z+5RH+KpgVqtXaUjPgsMa9W1hfErvtWsPjXD0SE/e0RAF7Vj4Yh1ZaC4bHNkTPhHeR1hLYutMpbUwe6+Nh0uKgyE9V2prMLycmnFV5AP90DiR6psUoYruwJsnbxzKiOvsgRjzSe3CfLVpJsFYu+70xKXwh0Uay94Uh44QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYCkIsx9+bhwl6XDNZ+n+3c2V2cwQDr4V3HIXM5vypM=;
 b=QBPRa/rGh2JPpH4189bAvqE0xtvZeEAkBDWOocJqgMPS+l/yRz/vbrIYIaly0K6KeaSMIkGlNRFtC3oQYFu7+jAwh3hHjtHV23U+9TGYi1kq19ioCu86o8I81bEQXAO4Ip5+mtB5dMRuoeNGxMTEub38VXygMpNjiN0yGiAJcLY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VE1PR08MB4736.eurprd08.prod.outlook.com (2603:10a6:802:a6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 19:44:06 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d%5]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 19:44:06 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v6 02/16] block/dirty-bitmap: bdrv_merge_dirty_bitmap(): add
 return value
Date: Thu,  3 Mar 2022 20:43:35 +0100
Message-Id: <20220303194349.2304213-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
References: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0038.eurprd03.prod.outlook.com
 (2603:10a6:803:118::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f480e729-cd1c-47fc-8afb-08d9fd4e2d49
X-MS-TrafficTypeDiagnostic: VE1PR08MB4736:EE_
X-Microsoft-Antispam-PRVS: <VE1PR08MB4736855DB2C77C895A4D54A3C1049@VE1PR08MB4736.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qjUReXPXmtEXuj4cvS4NG2cbyK+kmTpedorHcCMqplwj76fVE8Z3szm1qN0cxscNXKOW+7/XN5O5LfmtYjxtTfE6rmlsYs/lgOYGq2KltK9PNLGiL0fhI8qadfLnIJZcEKj9np5z13mfotwR4f7UXwHoOpjWRI0CTSj2H/ZhXAYVWt7SzEF+ilHW/rgh3oNTJvRWEYjZXHr1Dg5Zg8BNvumB6QnJCMk1x56X559cW6r/Mz+FmJ9dgOT49oiIeXlpCcvEFdG5dhxmqvf9aU1SJnuIyxvhPIHWPHhJrLXd2P3byyFCyIO98547ZhNevgsyaL4ASTY+t09zS5k0wwIVtTgnG0ZxCiC7ThvUUXrZs8YC4uEotO/uDKvBdfBSqMpazr2JXh6SZ19Rry9p60XTF5tLKiDPAQkru6DGgdH0dnPobqtAtn5/YDqmFBmo24ZYb6sDhGJ9t352uOBIm7Q92FMjnQzNtLexDM2qjOskb7Xf8DquhWCpxs4IEoaIbrt93Y0qDk05R4eqybV1oYCMky89Ey/0DJby/nfOI3sY9SJJ6cAjgeSzwEWyJEVSbH0lmotLxZPC+wpBsStRs5aUeDslMaCOYL1bi/dngCttED3BDe11pCz10Eamki7qBgBarPlHH14giBTqYJ2xNOLfNXtP0tKppy2LZThyXmG+A/HdjVG8QXnvISMo2FlpnSJDK74ClNBUgrlNdJqQNNfvF751OwWLSc8swU3QbQOnC04=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(6512007)(26005)(6486002)(6666004)(186003)(1076003)(2616005)(316002)(6916009)(508600001)(36756003)(4326008)(8676002)(66476007)(83380400001)(66556008)(66946007)(86362001)(8936002)(5660300002)(52116002)(38100700002)(2906002)(38350700002)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0FoPBLowm9zH5ZdbKjdhGnoGSV1ZAnh1jO2VhlZvm6pXLx2IRtNp2ZVIJCC1?=
 =?us-ascii?Q?Pgtsz5RQFYgHhl8RXV2VpVtLjKeb4VqGGBwAUtNAhY5QEBCAoDvwmy9QkmW3?=
 =?us-ascii?Q?GbNrjnnEc11i2rBVC39rOC5CMwpTPLzW4ORcLA79C7AQzpHjOwg9duodAD/F?=
 =?us-ascii?Q?ZMILBsVzU9oMdQMUfWUm7Fiq4dMKerta0rZ6SECg0TMvHlcQaQyJFNT4QBo0?=
 =?us-ascii?Q?ezgFgMByy0KKf4aaSYgSobgJ7GE7HfzaeWZdyA58YEok8Auxtit5UIEu0jpH?=
 =?us-ascii?Q?rDsmZGQzEvqctv0i/N8H0B1fpuBw/WUHL2JyKVfBK+C2erOK+21QIVr8iWWc?=
 =?us-ascii?Q?qiZ9tkBKWkC45cCd4agbslG5/4mrk8LTXCcdBfzOsmA3JaUEujxdJ0T/cK90?=
 =?us-ascii?Q?la4E5Org3bauCsTEYf46LZXLm70CKCA5JC7sFD+O7AaV8alGimmF247oWAiq?=
 =?us-ascii?Q?YlcBbj7vYtInbAwq1w6Lbf29eXuIlFASDH+5vVUy4isGS7usF9RLsGF0YboD?=
 =?us-ascii?Q?T7BBqPi/eiDJJwHCnEVh6pGMM7Bk+KQS+3Tthwl/LP0XYtDW3tTT9haEtL/g?=
 =?us-ascii?Q?bEQpmT6mSOY3OnnaZyI10LICt4g4EXCVkFL1ryN2I+QCaK8xmdW1XAZKtCY9?=
 =?us-ascii?Q?fCR4qaPyS7oJhkmXslhw3E9bD1QqCjFBTYxZ+tGttE0kj+htnjEZTH+jicJD?=
 =?us-ascii?Q?1gYKTG+VjkA3Jvbg1SK2YrORfmRsOcTIpiqMtgIc7AbqwqHri0XJnZ5hQ7l1?=
 =?us-ascii?Q?BeKmytLMyo2BF7utaBxmtV7KQSk6SjELcNGZ43GkLa9+ZmXJh7BgqwSslNHL?=
 =?us-ascii?Q?9knVpxS8GZzW9vUMjuJzqdq98Q7ka5TEvm2Mad4/1s01YHgTSPrRqzGrNMEt?=
 =?us-ascii?Q?mIlLknpu45lTj7wnPvtmpasMdXUcdHGkPhndtrxK/Fk4E0/9iHn/fLUUAJux?=
 =?us-ascii?Q?IDG+XZaTPGHWsZzf1zWvuGSHIbmpV6LrlAM7EZFbU6dag3zaIufZ+ftPcIiN?=
 =?us-ascii?Q?ClqOSz8z40vVsqDiI4kBpwdtuAI7iFhP/Ua7Y4cn6fguYXJnQDUic/KivSHc?=
 =?us-ascii?Q?LPGptvkXjM5onoOMuZQ5xiDZg4af3tsbF1AuXhpE4NJTcfjFj9VN8ubscQ4b?=
 =?us-ascii?Q?TzUVF8kmqo1eOhjgMC4SDS5CQ0588u2qSTnynBUr1DiAu1fDwJ5R0c1uTrjD?=
 =?us-ascii?Q?nUMB4a7Lce3SfvWgthEqdKvcfYkYvxqMwsJk/qEsSax6oOwlGxPGATydph5w?=
 =?us-ascii?Q?5l6m1DX8awUWcyebpNG6WoXukM5JLo39llxtdDMyrDWoDSYc99IVr58roRH0?=
 =?us-ascii?Q?eayvT2IbzYg6owWr1Q6qWip+VX/k2HVEPSFGZHxWHQsleZpZYkAMy4aZ/wEC?=
 =?us-ascii?Q?IQz56fqW4wfvId3IZGVT+ZgGQbh5xesqpHpx9TYqFMikytqjWr32gSmeQqY5?=
 =?us-ascii?Q?sPru7LP5XFxd7LKnJQ/m9yAzwHmLzHBTi8uW0eoaU/chxXDP6EVr48OsKV61?=
 =?us-ascii?Q?MYSHxB3XZBJdpzFSLK8kRHezCXV05t6WkaSeH3+53k0r2tKQNO2vF3pJYd/P?=
 =?us-ascii?Q?1iHFBX6tA6dTYfrjN0/dWbHW4sZ3zeIkRVLN1gApSu+aT4lYUySo70484ckg?=
 =?us-ascii?Q?ZMBiBnjRMWHr1TCCiFsLkpEOoky4Mv2qbB8/ejkKQr5A9HQC3vjRuLPsMqam?=
 =?us-ascii?Q?7/IvIQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f480e729-cd1c-47fc-8afb-08d9fd4e2d49
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 19:44:06.0112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDWdrNe+/2+Gn58MoUWNjRoymGWwZrfgp9SWTsH4abRaV2i3z3Asmr0NHQIcuoASNUAmpSqT4j3kMjsTxohXUcd8PtjNRgBOApucfqcxrUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4736
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::72c
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::72c;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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


