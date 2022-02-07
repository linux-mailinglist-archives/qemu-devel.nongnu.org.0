Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F044AC7D0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 18:44:33 +0100 (CET)
Received: from localhost ([::1]:50580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH840-0008J9-Dv
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 12:44:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nH71c-0001wQ-II; Mon, 07 Feb 2022 11:38:01 -0500
Received: from [2a01:111:f400:7e1b::716] (port=32353
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nH71Z-0005Iz-Rm; Mon, 07 Feb 2022 11:38:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYVUqFAE4RROaJdbOnrU1zaHP3j3ZWu63NXCUmP9Bzz83CHv05kfVtjAgfivQmZg7cRr/FSjxnGX9I9QfpT5CuNLhXYPWN1gVzqp5pLcgI6gh0wTP2G0ihMyrFU0gbutAU7Dc3soHVxptG7IcCOmel1A/3jA+VC+Cxd3Y363s9OERtx/fQ+nbe1lXOkkqWNo4eWjsKlC0XkqkpCgEohTI9udKCY/0VqSPjER3Or0PCfWc9J0XQQmf+rUQQVXZ7EMho1/v2ym8udGtU7LqcLyg3HBIjZbl1KcloAMQPIoYG4naDM1pz4PRRFrKkZv/GO03L3EdC3iFIXmDwALfd3Ceg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qgBjLGqaRpQxkoNuZY6HzxzJBR8Z9gINVDxuoPbiF8=;
 b=DfmlI+Hki5ebmUQWDHI4ANLUgSyNsmBhUv7kNIqXoTg6PWqocNnSEdtJCpFeonT+Dy74XX2OD9OulPgHCp6NW7l5ODErqu3qAWo4LMjPOQ4D8piNTpXklR81TZ9GIrOWhS3QTn0/ylmG+cFYgW3Ag6ZUvKKoPZ3U9gAcvVvJXJ3RqmUAAukQdemWsBirq6ACy3ilMTbT2UpdpUGwjYon40dyY7ThlbOrfn+Sg0G+H5IaIlKqYzWcRUDHDiH/wmO4E7waOGihMTqEY0RMpdFAv13Jo54Vf6cXYdFWle/vf9LjSaFFzg3Fv8Gjn3JSU0yMjJ6/kfMQitxUA98GvKc7yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qgBjLGqaRpQxkoNuZY6HzxzJBR8Z9gINVDxuoPbiF8=;
 b=MLuqLF+XBQlKGASTCxtlsLalCfI1uTVs/knf4JJ4tXOCUXYSePQQ7N60F6RmEaV7LmEt/+/7el98YUW9dfbxA1XgEaLPJM+XKQxCvsmWdog7M2QEBpyQq6vnTrxyFS9GBig0VRCh+NpHr1A5g3CreSvzY6wtZv2aO1zxSm1I4DA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0802MB2288.eurprd08.prod.outlook.com (2603:10a6:800:a6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Mon, 7 Feb
 2022 16:37:43 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 16:37:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, ktkhai@virtuozzo.com, igor@virtuozzo.com
Subject: [PATCH 10/14] qcow2: qcow2_inactivate(): don't call
 qcow2_mark_clean() when RO
Date: Mon,  7 Feb 2022 17:37:24 +0100
Message-Id: <20220207163728.30362-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220207163728.30362-1-vsementsov@virtuozzo.com>
References: <20220207163728.30362-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0126.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::31) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea0ea432-c4a2-46c8-991f-08d9ea58298a
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2288:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2288E0176326E9420EF4D5D8C12C9@VI1PR0802MB2288.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:220;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eU7G27XAXA/KdSOqzX1lw/7BTFW1w+i8EwZnQz7rCaO69KDtnpSj1erM2u+cWx9iJGzIj57eWjy5LOqvlWzhIFrnebcVAdRQWq9Tt8PRXtVe67ZG6E/d4sF+V0bYb6eE/NHQKH3OvKZ13Xv/CIhDaaA6Md+44KkxgKHk2A2BegoHppIHtXNRWw9DxUjeNtkKE6YAgG909hYu+erp16NpbpGQkcsACI/Tx/691O3CeXSpM6zO9SFQL4XP97vgZhtXeg4yfowmWyjXqSKu8+miQDKQgg7tkcl/07pn9fmOFpkJZ470V+ESARxXF7q7x4CBWT77+P2Hn57SSzz+WjgitnpgxNYwVWGLDxGLrlN5u04IZtwmrxX9zTbUw0TiwZotu+UeG6r44gClgYjRM5Q7z1xx4mcKDHsgbtirOxtwBPLplbqUY7PRONzuhxfj5P0lYtoXQTxJGR/ovHy4zMG32IUbtvP/AsIJuf7pPRbzjCHlHofXjln1HaG32RvzfGhaHa7LN3NhCanK+GHc3YZc8V48IklUaZlHVpNgEU5JnuuQ0cos16Rh1tXzxmc8s2o+zCssDMLQTXU7JFJkOdkAZ9SjWbA9t6uqgSPPebPXL34TEWTdJlO8Re5xuB09sUCiqBiiRysklU6mSR3cmxWWD9fPQpyMCrfcDMfXfkU83mOjFXVA4e8U10uuxJzCTqeGPkkaakKcAlkJmQ24qkwmyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(66946007)(4744005)(66556008)(8936002)(8676002)(38100700002)(83380400001)(66476007)(5660300002)(6916009)(4326008)(2906002)(508600001)(26005)(1076003)(186003)(86362001)(6486002)(38350700002)(2616005)(107886003)(6512007)(6506007)(6666004)(316002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K37W0busVPuxsp/snNQSVv7O/JWCa9MrfrBI1FjV45awX9q6peypWOSjMLQx?=
 =?us-ascii?Q?wUAksi9KFYqsJeh8ey/Km2Y7X+RhiEZ2R8JhJG30YMdVBwqUABAm6KqyuJ+o?=
 =?us-ascii?Q?bRD//beXF18tJXkNcRcARgtVtBu6t6OQiBcEUd4qit1q3enQbZ8lv8dS9BnT?=
 =?us-ascii?Q?ZFj68WmgZ200I/qQvR2KvWJ1/Ii1vBjOCAcclXxAlHm+YPX4d3vzJSZDJd/H?=
 =?us-ascii?Q?dnWy9kIxALA9Il9pUwQMjGNMuXXqHNeq893gW8PipHzlCBVEtdSgvpeqE1Wa?=
 =?us-ascii?Q?Uv2wdS/phOAP3nr6mC+E3aV+0YBx4jENt9QDYuC2ifmAxKcROGYpjTrpwE8d?=
 =?us-ascii?Q?Lt0FzVBJlloWprAPXNuinDu765U+qEBpwq2c0nALQBbPf6ehvEmT992Tx23V?=
 =?us-ascii?Q?92HCc3mVf9z0pkKk6R9nlbqNCHv45QT9SWqfHCqY3izp7gWeKQspW6G9pWop?=
 =?us-ascii?Q?1sHeayCGPvkjDJoWI6P3C4K2hfgtJDywfw3epd+AGyTIdfrZtFkvwuyGaKwj?=
 =?us-ascii?Q?acMG/1IiqK6GD0BBH5f1dMMtFytGXPYeWDew/HAKjtdt+uGqnU3DAZZFDMNX?=
 =?us-ascii?Q?2mgReQew1MBaD41srQsrAizgzeLeTK4Dn6y+Q3RZ3afpnEODkDqILLcN2y5y?=
 =?us-ascii?Q?dFji4RGufTi2Nrz5jTTIZueXqMfDXBOb3ckOsLDSwvrO4bhU/fZizIemPpQD?=
 =?us-ascii?Q?nGjJS/Zi7BW18biOzkNejpXpQr0T2awbB40UXJ2Wi6XqigaXTtwEMhnE0YSQ?=
 =?us-ascii?Q?HQwo1hXxeJ1ItknIVMcBySh4oPhUlRsEZSsUj8E8DGsorzo4x1/P5gLCbxf9?=
 =?us-ascii?Q?ayTJjqOzAr4atIr91mNKfWgCflW4shrQ/tjFoQwvRjbfIszCn9Ote34YjDiO?=
 =?us-ascii?Q?AAjPx5m7ijE8Ovm0aRCAkt1vf34Gno8LUUHdLaeTBBh+qzrEyQVfyL0KqCkk?=
 =?us-ascii?Q?z+1WUDgAe91bb3btgEqOy3VyqbiNby0DFuwb/SU2MCcDYcuGn/5dZG2umbRd?=
 =?us-ascii?Q?MuTv46CiIg342YvEZfUm0m9EvXHsDjRFonZAQFsSZwbK1a2NRs+VFft9Nd8S?=
 =?us-ascii?Q?50Bi+MWs+IP6LAUN95RBCYnhdhLpAqGnNjfdUAeZ8QMhLHYWIm9thT/kfYpA?=
 =?us-ascii?Q?96QaPj0nRdaTKQIz88piotRYDqNvSuRjqyfAbiRV1UzsS7IoDHziIjBUvb+w?=
 =?us-ascii?Q?f6tk6WpZ7/tZsRNmocZsoibnUzyyGqgsyUSrf0ThxjM8KalhYLhVD6Yvgy1D?=
 =?us-ascii?Q?yAllGrDAUpHsgMb7l2BlGeX6QC7zc830btZxt8wEoGObg8P1ybM/RRrXnlsw?=
 =?us-ascii?Q?/PR9E9SpXT1HRdaKbXZjF73QNukIoiRo/9pDgSZ5zwQ8MkdYFOiJJmgH6Pgx?=
 =?us-ascii?Q?eXUU//cThBjXhg6VD6BDqeqxzOtsC8dAJJeS/bjOk3n2GNzbGDuhdvV36b6W?=
 =?us-ascii?Q?YoZbmqcoI72pIdCdBukkPiljpnEaQMmnUeq9Ybb20SwrgWU+3WHWhgDHqG6R?=
 =?us-ascii?Q?KTb5PwRnrVIS7IEcuVsH0J6dQb8c9qfDERQufMr9EmrZWghIpDnjfr/2+XaY?=
 =?us-ascii?Q?JG1aYGFIG8PvSQNMQIn/flY9koh8VE2/fch5F1om+Kj6qvVwCahB7H6Zm28e?=
 =?us-ascii?Q?jEUSEGVyLP3Jpnuq490eRWGxhX3BxlcJN8S6V8aply7TtZkOm4P+dsnRbWmY?=
 =?us-ascii?Q?9oNsgA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea0ea432-c4a2-46c8-991f-08d9ea58298a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 16:37:42.5869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a2m9EzHYqnq3zKoZNE/UnGMBbBlWwCVcGcNxRwO0nyzclFh28M69C1AOpvyJ1j6w3jQT/OCvEIS0g3jweGCI+I1gROIbMJA2HE9/t228tIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2288
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::716
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::716;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

qcow2_inactivate() prints errors on different failures, let's not
exclude qcow2_mark_clean() call.

Still, if image is read-only, no reason to report failed write and no
reason even to try write. Write failure is possible when we open dirty
image for check in read-only mode. Let's not do it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 04994df240..ccfcd0db05 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2699,8 +2699,12 @@ static int qcow2_inactivate(BlockDriverState *bs)
         local_err = NULL;
     }
 
-    if (result == 0) {
-        qcow2_mark_clean(bs);
+    if (result == 0 && bdrv_is_writable(bs)) {
+        ret = qcow2_mark_clean(bs);
+        if (ret < 0) {
+            error_report("Failed to mark qcow2 node '%s' clean",
+                         bdrv_get_device_or_node_name(bs));
+        }
     }
 
     return result;
-- 
2.31.1


