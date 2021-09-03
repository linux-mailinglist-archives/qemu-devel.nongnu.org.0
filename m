Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7903FFE48
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 12:38:13 +0200 (CEST)
Received: from localhost ([::1]:53036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM6aK-0000Dh-MJ
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 06:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM6RA-0002vz-JO; Fri, 03 Sep 2021 06:28:44 -0400
Received: from mail-eopbgr60121.outbound.protection.outlook.com
 ([40.107.6.121]:7190 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM6R8-0002A7-4I; Fri, 03 Sep 2021 06:28:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+sxhzwBEtdiQEjMh4Em8B2fcrqfwtJhOaH47AwQXEUv8DnN2EFH5wcQNKM500SAzD0JsVq9NOPZERhPvgb1WCkN/nrOU0TEh9viXoVzvEutjAzs6TlUQZ84k7180OXDL8slyNanKmF0yt5a7xlPP4aACj3cjRRv0viqc8oO1Ld7nT3sxJygpWTqqf7zRtVdm/SvcM4h03b3bHZo9HxagLoXIwonhVC94j4d3gREdfqoiwtMjno9Hx6JWuh3kA3R9RcD4LTtuevvOCQuE4daDYzja6fs8nxZ5OWRZOvnjuFLQ8asENRm5nur2WGTUu+HqkF5TF/w3UEFVaCKtBd/Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=o3b4R5GGVndcXn3hG4AnNKUZO6WQRTj02QXpue39f2c=;
 b=amH+8cypkELzpZHfwo0X3it2Hnz7KMEHafIdZg/oGbHAyjvmrKFYib/GHuShploN2lJbCxbvXZcjVyxzJLgGO6+zCRags/N4cGvWqzp+Ki6WCTxX+G1B3Q2NNtUkKJSJMQboRKyCbnOrMwZeqLE0GoC20MH3rCwYtCl6yqsRZr8vnSu2VQsD6b+OLxkjQswaj/+eiObxnLuQgqvW9tFiD05TPazc7ZFED4aWdRWPifa37Ek9xDXjHbKntGsGnn+NFwcgmE6ndpI1x9RwRNUnohBp7ij36XmGybMdo5uGawMphwdQhXY1TfbN7fEY67FPtbvp7vYh8JlUe0IY1/ox+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3b4R5GGVndcXn3hG4AnNKUZO6WQRTj02QXpue39f2c=;
 b=TMgHRxwFyv/MbfeLZRRDP+5diBDHThtGLSAn9dFm7yQekabgEE7HITGF0xzri61kaTHvAaMhOsPGAZDq+o3Yv38D+DVx3VltE5uAxPAd0NhJJC7RicXfagGzJMceAduAfXdRK/ZAGM+a+HLjB6rVyxOTOaPaccT0l1Dl9uTW9aQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6945.eurprd08.prod.outlook.com (2603:10a6:20b:344::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Fri, 3 Sep
 2021 10:28:35 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.022; Fri, 3 Sep 2021
 10:28:35 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, integration@gluster.org, kraxel@redhat.com,
 idryomov@gmail.com, berto@igalia.com, philmd@redhat.com, eblake@redhat.com,
 pl@kamp.de, ronniesahlberg@gmail.com, fam@euphon.net, sw@weilnetz.de,
 vsementsov@virtuozzo.com, jsnow@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, pavel.dovgaluk@ispras.ru, ari@tuxera.com,
 hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 06/11] block: make BlockLimits::max_pwrite_zeroes 64bit
Date: Fri,  3 Sep 2021 13:28:02 +0300
Message-Id: <20210903102807.27127-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210903102807.27127-1-vsementsov@virtuozzo.com>
References: <20210903102807.27127-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0163.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0163.eurprd05.prod.outlook.com (2603:10a6:3:f8::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Fri, 3 Sep 2021 10:28:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b971aed6-0e35-4495-bd95-08d96ec595c8
X-MS-TrafficTypeDiagnostic: AS8PR08MB6945:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6945A46CAF8DABC31180BF03C1CF9@AS8PR08MB6945.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SJpM81zDgEFIuCkajxUGUef7o+9YLoN8DO2k3UEWMBEamfRhYVopxBr1L7bzbK6rL2mDWO6UXu9maK61HKaBoevIJfqBZNnKGIK5t9bIqUrU72aGmkPgJNkf29kJSe1xPtlLRr+Oa9ERekuChv9//AchNrV2Aoyx2sJGcWYJcPz3ZUjOZPSPxsGQVG8BLGdmk9mhwj5ZkHVRnlpPyi+zLNlzbylxOlOO1NGiyln6k1pImvQbtUQghonQUAQQ610ZzG4rV3wOqkFrZRF+GA/LEh3rLTBsL/TXNcHKoz7TuECgfSesZVUsDSY6YzkvlZDpOhleJwL9oUrEzZPohZ+aB5eYTta55ngCuEMjPh4Zk3TvmFVVqDYFgvE+JlycW3Y72UYoSm7Mr6vQ86IQRbIilUDuRpP0KjbbBqzsm0L6UIEMNXKNjWWiNLq3IynIt3HrCnKH3TkH9kDDQzlXoFselC+Z1GfhJBh8C7cXWWBWXI8mvXZ7XosogzdcP7a/LbDPKk+PqrzPw0Ev2lPxAFJE+kwzXa5Qhbx1Rk/Iym0qXTUV1XkaTEbkIRvr90s6ulo+zI9HpqSU4A8xDxjiHzfhz72I7eSM+3XIfve3eZZWDIu348hpqHmHNV18jEGoSqbCXMmgFRraYBEB3xsYVlb5HFhQ2GeZa8UjwNII5sT+op5fFUtGunLZzkfKJq0fNPUU84xjZ8M4eaEoN9owQEgH6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(39840400004)(396003)(376002)(7416002)(83380400001)(38350700002)(36756003)(6512007)(38100700002)(6486002)(5660300002)(52116002)(6666004)(6916009)(186003)(956004)(66556008)(2906002)(66476007)(66946007)(8936002)(6506007)(26005)(86362001)(2616005)(316002)(478600001)(1076003)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+0usES+7uFCGMm+LPXchI5DBnJSzrzVTIhkPMugDoy/+4+3Eufd/vJz3Tff2?=
 =?us-ascii?Q?iy95UK9RfdIDVKDdzH5r6S3i240vAJQiZYIKxUDLfd3Ng5ZpASlXLfzkGrfk?=
 =?us-ascii?Q?OInuNJYOd0GF8fX3p8HQMG+cjHte+xOX6tCE6BSgHZFs93hn1F9MHi/J+IrH?=
 =?us-ascii?Q?0W/ruZt5ZZ8hw/x/HpfOGfQNJNkyNep8zhIhdIhnpJDx30hhr5CjShVrnYZw?=
 =?us-ascii?Q?rCgM0V2mJqoIQ6Ykws45QTSFZH5tlG19hRp1Pv2tRuN0FRHQKWe7YHP6BzTf?=
 =?us-ascii?Q?y4QE+Iz6gofC/xDqxmOxIE3sxzdAe0vnTi0YQBxJ/2QSzd+pz7mEu1OCZcJs?=
 =?us-ascii?Q?vmbBxnnJS0DZjbHSuck+Edi6MKCl5l8cT2o5BTHWOaDaP/U+6m4UQWyeoLnX?=
 =?us-ascii?Q?eVi5W3bclsbvZqMiOwHWR4EjHknlyr3OsjTdB4NbtYRBniDPtNZQNqXyfV/4?=
 =?us-ascii?Q?aLOQx+jJ/xU2Ahy1m3ACkKvsZioJzUzKcJcvUHv20xuuLYI4TDMBTrwPwpKo?=
 =?us-ascii?Q?E3J124L5BQVrOaICLeHexG2Nx9ox3I7tQ94xdQEf/zej6Zbrkqlu0H90tvAo?=
 =?us-ascii?Q?a4BSIukFrFEMKlce5GhZQwq8Q+bTnPZPgNziSDAINudERTViKTMRAj69UAu0?=
 =?us-ascii?Q?BjhwpLbHf2EGoYfIgd557oV6U8RdgAy3hTSGWTUc3I0sqBFduJm4c+4i/PKO?=
 =?us-ascii?Q?tFNkaU/ctAHxbB3cGLOQH4i6jDeEpPzh4gyHugZMAAU8hAzYPPwgFLc7ydZy?=
 =?us-ascii?Q?eoSb/ylDPmCBW95dqZI5bGYSar/0ObrzuTaO5iKbKlBgZ5/ErMSboIVugfz8?=
 =?us-ascii?Q?pQnDPK0COuRd+piwzU8G05xTLaM58qv0NnZGyPihAiekDReiC3oRC3p3P6AS?=
 =?us-ascii?Q?au7QLhbg+Hcxo6rH4lDcm9U5dMU1ronizeVTmsPGxnwtoCpq/tB6c1mzu8fo?=
 =?us-ascii?Q?nAURKXfLjgbdJv2kIVug6IesAHXoYmdlR1oSI5kSNUTOP4oZPn6D3ItsAmcw?=
 =?us-ascii?Q?wIKlH5ax5yqjzDUo108V4uwMXg9avWuPKIn7Xl2xUgdmNJxbF0yvRgD+TYxL?=
 =?us-ascii?Q?M/dv7L5tJacp7eEYybew9rShhU7wfo4KmVS8S+PbjROLreu5XBN77UPsfUB+?=
 =?us-ascii?Q?XQAhl2rh4mpfoz0tZ2ZLayibdgQ1bYRJYxsOgpNMnD4ycRQvZtzo2byJDiP9?=
 =?us-ascii?Q?+GLDabXLrdWTsy/z820fSLQAnZBytFI7W0ozo97BpaWmd7sDPNK6uhXBaDXw?=
 =?us-ascii?Q?Z+VEVryYBRdhdQVA3M+eCi62mLAfyjm0kNfM8GQn5XfzTajdiUR7/xKUvSWn?=
 =?us-ascii?Q?b3Nh5ZR4bgLXxfEyt3rSCnfJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b971aed6-0e35-4495-bd95-08d96ec595c8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 10:28:35.1712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AI7sj+nHtb7USjCTiIuawQNM7XesH2zYuQeWIt0Q5AooQmmCXRxXpnNUkvJWfR9RZ51ruGdQQ3LNXb6joY7Kr1gFzdmdaw8MK2ZN9Z9tBEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6945
Received-SPF: pass client-ip=40.107.6.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

We are going to support 64 bit write-zeroes requests. Now update the
limit variable. It's absolutely safe. The variable is set in some
drivers, and used in bdrv_co_do_pwrite_zeroes().

Update also max_write_zeroes variable in bdrv_co_do_pwrite_zeroes(), so
that bdrv_co_do_pwrite_zeroes() is now prepared to 64bit requests. The
remaining logic including num, offset and bytes variables is already
supporting 64bit requests.

So the only thing that prevents 64 bit requests is limiting
max_write_zeroes variable to INT_MAX in bdrv_co_do_pwrite_zeroes().
We'll drop this limitation after updating all block drivers.

Ah, we also have bdrv_check_request32() in bdrv_co_pwritev_part(). It
will be modified to do bdrv_check_request() for write-zeroes path.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h | 9 +++++----
 block/io.c                | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index f40a2e1f5d..6c47985d5f 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -676,10 +676,11 @@ typedef struct BlockLimits {
      * that is set. May be 0 if bl.request_alignment is good enough */
     uint32_t pdiscard_alignment;
 
-    /* Maximum number of bytes that can zeroized at once (since it is
-     * signed, it must be < 2G, if set). Must be multiple of
-     * pwrite_zeroes_alignment. May be 0 if no inherent 32-bit limit */
-    int32_t max_pwrite_zeroes;
+    /*
+     * Maximum number of bytes that can zeroized at once. Must be multiple of
+     * pwrite_zeroes_alignment. 0 means no limit.
+     */
+    int64_t max_pwrite_zeroes;
 
     /* Optimal alignment for write zeroes requests in bytes. A power
      * of 2 is best but not mandatory.  Must be a multiple of
diff --git a/block/io.c b/block/io.c
index 5aca909a80..b4dce946bd 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1869,7 +1869,7 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
     int head = 0;
     int tail = 0;
 
-    int max_write_zeroes = MIN_NON_ZERO(bs->bl.max_pwrite_zeroes, INT_MAX);
+    int64_t max_write_zeroes = MIN_NON_ZERO(bs->bl.max_pwrite_zeroes, INT_MAX);
     int alignment = MAX(bs->bl.pwrite_zeroes_alignment,
                         bs->bl.request_alignment);
     int max_transfer = MIN_NON_ZERO(bs->bl.max_transfer, MAX_BOUNCE_BUFFER);
-- 
2.29.2


