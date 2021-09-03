Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 685C33FFE49
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 12:38:24 +0200 (CEST)
Received: from localhost ([::1]:53630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM6aV-0000ch-Eb
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 06:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM6R7-0002uu-HM; Fri, 03 Sep 2021 06:28:42 -0400
Received: from mail-eopbgr60121.outbound.protection.outlook.com
 ([40.107.6.121]:7190 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM6R5-0002A7-Ki; Fri, 03 Sep 2021 06:28:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+kOpGR59161n8AJtWGlZIp0wt66MM6bWt85tvKlYXoUqXTmmgUA4unLjItWv0rM7snGU963AAWZ+sDn537ma8PCSNQ3BYk5VZOJ88hMvvOMnuZu3xGKikd495Bj6NxuuQdndMqGB1qLU2ISdfX0HqI6iSV6yChDwdFmObkGKH5uQTLtixzZV4f8OhK/bzWJCkQ3OuHVXKChOP0Mpgvh3KaFwZPbKWgivXu9eoNJHVuVqwb82U3hvGUUBt/A+O4NeLpSC0DBFSpkdmD+em/EPz48EGML2SVdyVEp+5yv8c13r9a/7dDUdQ3N7gha8nbCVB6FqoBkH02INJZMUqMNKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=q3XJZCZ9465fNZaoUo4Bbha9pidk1+hfCBgv1fN+83o=;
 b=iYLKVeK3/6IgC49IA+W5rVKx8UJOJWwYk+heyo/Ch3SW0xv6OYS2wTslkmVAP6FESEFFzQTeJNPqH5JbwLJiurtl1kGJKfHfIRBPGlSQI7yOfkCS+yFfv2jcadbrP3ozBVyFZv6ml2YpDBSFJqkORN0swQxtLsAA6QcjKj8Q9Pt/CdC5q6K4KxZh4CW07pz5QI1e5879bykJniBreSWiztyNtrXZvIM4LZpFV+ZCIt8S++3AghZ1mKuHA4nWoWxiz7++CSKZmT3reZTma0KPIZ+JUDH49G4GZXFOiLsewN9iYUTGtI4Q4DZ6h7fdFmQDDnRhe1s1c+SCtOBgoJjJIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3XJZCZ9465fNZaoUo4Bbha9pidk1+hfCBgv1fN+83o=;
 b=aDF1/oyTuIn9PtWrk9CJ1LljGqzl5pt+ok43c7MMTanpcgc2mMMmN5zLN9iSb4zxN7nYgoS1UvSBACwLO1X/6quwrHvDeuq47846+G6Mv2x+ZDktQ26QWQl5FqbbqyBgfoOoWIctRdSX+w3AtW1Sod6VPhABP07vfba4sQ3gTao=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6945.eurprd08.prod.outlook.com (2603:10a6:20b:344::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Fri, 3 Sep
 2021 10:28:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.022; Fri, 3 Sep 2021
 10:28:33 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, integration@gluster.org, kraxel@redhat.com,
 idryomov@gmail.com, berto@igalia.com, philmd@redhat.com, eblake@redhat.com,
 pl@kamp.de, ronniesahlberg@gmail.com, fam@euphon.net, sw@weilnetz.de,
 vsementsov@virtuozzo.com, jsnow@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, pavel.dovgaluk@ispras.ru, ari@tuxera.com,
 hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 05/11] block: use int64_t instead of uint64_t in copy_range
 driver handlers
Date: Fri,  3 Sep 2021 13:28:01 +0300
Message-Id: <20210903102807.27127-6-vsementsov@virtuozzo.com>
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
 15.20.4478.19 via Frontend Transport; Fri, 3 Sep 2021 10:28:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8787d864-a5b0-4634-7e9f-08d96ec594a0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6945:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6945D4AB9D178F28BAEA8675C1CF9@AS8PR08MB6945.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kO6rLnHGtyAjSaNHHgplZMkqQ/3Cv7q42r8hiy42RHTIx/zdGrVRcXEvVu4R2dxMFmgfjvXpKL3AMXm8Lt9J+rUZH7Quthl5XYOiHWRIO6E88FJASsaFwuum0tHCMPmwdOK+t754jyMxCktiQl3aqxW6dZUjdiK1/Mcury1GVppmTRVlUxY7CH6GmsXurnkgbq3MuVzRg1OguOcR1i29dwDdooZg7T2uAJ7EE68Tt/2t8Um7q2UZKSWQAR9PM0KbJ8VPsI+nZ8iilgP8x7D0/zj4bAyw87osRWeV4dgR0Qz9MeP6JcC3wt+hanpsR8zBP9NcnnE6In4L6J2C2w0rDkEjZOuwiD1Cl1feU1+wEOyKIFBSmefFKLEafDhJ3u4JHp74kX2Q0D/koBYk/ipzvnms71TiKF0YcgQyau7TTXeAMHeirOlY08DGf21Lz6dSuo7yFzxrVIz+Gxg2HPRQ9ac9Wb7AEBAEdDc2RFGhQKaSVul6AwyovjkbB5cKxs9bUss/iJ1PWvtO31NmOoeX0ltoFgskqAeW/G0t1K/zzpdUbcdHulTd3a6zZ6g5Xf1D2+TijIBbRfWJghGTVEochNZVpIo+bO1lxAHa1L+yHLnMdKGZUSi4C4TPmVa7i3sxm5HMhwyfDiKTk7DXI+EzcLeSzEsCOwEf3cRyIR32534u5exqquS1nGVQIsNbcegdqzAY38jyvFtznrzsFK9NVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(39840400004)(396003)(376002)(7416002)(83380400001)(38350700002)(36756003)(6512007)(38100700002)(6486002)(5660300002)(52116002)(6666004)(6916009)(186003)(956004)(66556008)(2906002)(66476007)(66946007)(8936002)(6506007)(26005)(86362001)(2616005)(316002)(478600001)(1076003)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hWE6NYjvjpF8JrUbEzKopKrzHy5OunphdkBPYmE70IpLJl4WvJaspEO1TTp0?=
 =?us-ascii?Q?nmLLbJ/uhjv05GoiAfLLfddpTrgG4X/6SFjkcNBXDtEcRPMYJ/WyC3A+jYu2?=
 =?us-ascii?Q?OTG/Pze3MpFf7CvlD/21jwjPq4P0zxSaPvZTzwFyZLs9jJLO/0ceQdFCe6jc?=
 =?us-ascii?Q?7wi0uqmyoEsSNLLW1n3G9D/An6fRHIqqUYHExswuWFgPFWEWgOiSIxLuVPl/?=
 =?us-ascii?Q?6DLIsOtTKRk3j0C4zWefVJTnTKl6mp0s04NrWbHgG//4EF4R9HlK+4LxTiaY?=
 =?us-ascii?Q?M4NmF1B90dbc9TRWq2l+7LrC7jN46V5D2gyPmoh5hnhU7sPA4g5TojUXTlV1?=
 =?us-ascii?Q?6HuXkYNXJIU8MFrYTLkcVSKnQdz3m6jzW+Ik3jWTbwWB1MiyvmA/Q6KfK2ig?=
 =?us-ascii?Q?l/Y32xL8ylEoqpqiLQIxieQnhi6rBLQeei/AvZfKiPZqgVJoDufpWgFJ93/e?=
 =?us-ascii?Q?WxPt3AWdyAqkM2ibtjF5A8Nw+Atsm/ZORL8LTPvkwfa4TD5FlRzmGM+Do7g9?=
 =?us-ascii?Q?pZ+yN15BXhC+C6k98FETPPsYOdRXgS6ju/6ZR0Gqli7Ai34fpvi6ipk82zC8?=
 =?us-ascii?Q?g0MtsLp4QFKO/qdLmXYq7OFr5GNzGOLCb2XE9V/LiuAyerg5lY5BVDrazwOG?=
 =?us-ascii?Q?+8kTl4dz5Zbspdvp+KxEi/a6Q0rYdKfGO3yRAYt66byeCjWH7/HgYW3wqCy1?=
 =?us-ascii?Q?Rg7ydjTvISHYmocOCwLbuSxBrcNYxnr8SP84jr042nkVNnAbyyf8sT33/Ldk?=
 =?us-ascii?Q?cC24LXEUaBMMJHVEr/6uphmJahQ2pyrprhvB0Mq6Iahp4j6EWzXv3SFpWqsh?=
 =?us-ascii?Q?RXB1qYVmgWcZIOs6vAfSeNcz23VQnxd3yC4RGsaZSe9pBkPQmfj8vZHW5NYm?=
 =?us-ascii?Q?+O+MUwB8oyBVEQOAXUvZV0HEksCU7QeSO3UlQm483rPJVG/iKPKVArv3oGYI?=
 =?us-ascii?Q?1MO9vk95YH3Yk5YDqlkM4zlKpGAQz9OJKQLuvelmupFFnCKPGkouQyDR2Kcj?=
 =?us-ascii?Q?3/7Rht1v5UAk39O4CXuvK1bxfAxSS48QbT0kYHslzP2p2Fli1BrqJTJsLS5J?=
 =?us-ascii?Q?mNQxoSURTpo0vElBmLWzYcy/+wOPpMi/2kDJlYDBp24DalQ6bKhhlfY1tKyb?=
 =?us-ascii?Q?t9Wi7zjdCXApWr1KronLdNjucla5Xy6KzsVM9SEitgcTVef5+7eKUAm8ZlKl?=
 =?us-ascii?Q?JpG4gYsILqhwKBeep3YN4vBD+9EFcyfMrN5GKjV+slKGWOubjij1ab8YHPv4?=
 =?us-ascii?Q?mE+dVEVgi17qAJ5f7iTNi61S/p3lycBYw6LecTOX9CPnVfYfxcJdcWByHKy2?=
 =?us-ascii?Q?pe+I3Sz5wkjLhvbQQXDFhQGo?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8787d864-a5b0-4634-7e9f-08d96ec594a0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 10:28:33.2317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZyxv6ocGRI2X5GbqMb4HE7P/cmJkZ3YdpH/CSgar0l/YVK1kjPg8jay2oeqL0VwXnTnS3JsJ6TB8bq6sYrvcyFfTRG3Fn4/qDYwiG+T6bI=
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

We are generally moving to int64_t for both offset and bytes parameters
on all io paths.

Main motivation is realization of 64-bit write_zeroes operation for
fast zeroing large disk chunks, up to the whole disk.

We chose signed type, to be consistent with off_t (which is signed) and
with possibility for signed return type (where negative value means
error).

So, convert driver copy_range handlers parameters which are already
64bit to signed type.

Now let's consider all callers. Simple

  git grep '\->bdrv_co_copy_range'

shows the only caller:

  bdrv_co_copy_range_internal(), which does bdrv_check_request32(),
  so everything is OK.

Still, the functions may be called directly, not only by drv->...
Let's check:

git grep '\.bdrv_co_copy_range_\(from\|to\)\s*=' | \
awk '{print $4}' | sed 's/,//' | sed 's/&//' | sort | uniq | \
while read func; do git grep "$func(" | \
grep -v "$func(BlockDriverState"; done

shows no more callers. So, we are done.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 include/block/block_int.h | 12 ++++++------
 block/file-posix.c        | 10 +++++-----
 block/iscsi.c             | 12 ++++++------
 block/qcow2.c             | 12 ++++++------
 block/raw-format.c        | 16 ++++++++--------
 5 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 252fb3df21..f40a2e1f5d 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -313,10 +313,10 @@ struct BlockDriver {
      */
     int coroutine_fn (*bdrv_co_copy_range_from)(BlockDriverState *bs,
                                                 BdrvChild *src,
-                                                uint64_t offset,
+                                                int64_t offset,
                                                 BdrvChild *dst,
-                                                uint64_t dst_offset,
-                                                uint64_t bytes,
+                                                int64_t dst_offset,
+                                                int64_t bytes,
                                                 BdrvRequestFlags read_flags,
                                                 BdrvRequestFlags write_flags);
 
@@ -330,10 +330,10 @@ struct BlockDriver {
      */
     int coroutine_fn (*bdrv_co_copy_range_to)(BlockDriverState *bs,
                                               BdrvChild *src,
-                                              uint64_t src_offset,
+                                              int64_t src_offset,
                                               BdrvChild *dst,
-                                              uint64_t dst_offset,
-                                              uint64_t bytes,
+                                              int64_t dst_offset,
+                                              int64_t bytes,
                                               BdrvRequestFlags read_flags,
                                               BdrvRequestFlags write_flags);
 
diff --git a/block/file-posix.c b/block/file-posix.c
index 0afa60bfd1..6c64061a47 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3202,8 +3202,8 @@ static void raw_abort_perm_update(BlockDriverState *bs)
 }
 
 static int coroutine_fn raw_co_copy_range_from(
-        BlockDriverState *bs, BdrvChild *src, uint64_t src_offset,
-        BdrvChild *dst, uint64_t dst_offset, uint64_t bytes,
+        BlockDriverState *bs, BdrvChild *src, int64_t src_offset,
+        BdrvChild *dst, int64_t dst_offset, int64_t bytes,
         BdrvRequestFlags read_flags, BdrvRequestFlags write_flags)
 {
     return bdrv_co_copy_range_to(src, src_offset, dst, dst_offset, bytes,
@@ -3212,10 +3212,10 @@ static int coroutine_fn raw_co_copy_range_from(
 
 static int coroutine_fn raw_co_copy_range_to(BlockDriverState *bs,
                                              BdrvChild *src,
-                                             uint64_t src_offset,
+                                             int64_t src_offset,
                                              BdrvChild *dst,
-                                             uint64_t dst_offset,
-                                             uint64_t bytes,
+                                             int64_t dst_offset,
+                                             int64_t bytes,
                                              BdrvRequestFlags read_flags,
                                              BdrvRequestFlags write_flags)
 {
diff --git a/block/iscsi.c b/block/iscsi.c
index 4d2a416ce7..6bcde6ec6b 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -2172,10 +2172,10 @@ static void coroutine_fn iscsi_co_invalidate_cache(BlockDriverState *bs,
 
 static int coroutine_fn iscsi_co_copy_range_from(BlockDriverState *bs,
                                                  BdrvChild *src,
-                                                 uint64_t src_offset,
+                                                 int64_t src_offset,
                                                  BdrvChild *dst,
-                                                 uint64_t dst_offset,
-                                                 uint64_t bytes,
+                                                 int64_t dst_offset,
+                                                 int64_t bytes,
                                                  BdrvRequestFlags read_flags,
                                                  BdrvRequestFlags write_flags)
 {
@@ -2313,10 +2313,10 @@ static void iscsi_xcopy_data(struct iscsi_data *data,
 
 static int coroutine_fn iscsi_co_copy_range_to(BlockDriverState *bs,
                                                BdrvChild *src,
-                                               uint64_t src_offset,
+                                               int64_t src_offset,
                                                BdrvChild *dst,
-                                               uint64_t dst_offset,
-                                               uint64_t bytes,
+                                               int64_t dst_offset,
+                                               int64_t bytes,
                                                BdrvRequestFlags read_flags,
                                                BdrvRequestFlags write_flags)
 {
diff --git a/block/qcow2.c b/block/qcow2.c
index 0ee664894c..100eda03cb 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -4026,9 +4026,9 @@ static coroutine_fn int qcow2_co_pdiscard(BlockDriverState *bs,
 
 static int coroutine_fn
 qcow2_co_copy_range_from(BlockDriverState *bs,
-                         BdrvChild *src, uint64_t src_offset,
-                         BdrvChild *dst, uint64_t dst_offset,
-                         uint64_t bytes, BdrvRequestFlags read_flags,
+                         BdrvChild *src, int64_t src_offset,
+                         BdrvChild *dst, int64_t dst_offset,
+                         int64_t bytes, BdrvRequestFlags read_flags,
                          BdrvRequestFlags write_flags)
 {
     BDRVQcow2State *s = bs->opaque;
@@ -4109,9 +4109,9 @@ out:
 
 static int coroutine_fn
 qcow2_co_copy_range_to(BlockDriverState *bs,
-                       BdrvChild *src, uint64_t src_offset,
-                       BdrvChild *dst, uint64_t dst_offset,
-                       uint64_t bytes, BdrvRequestFlags read_flags,
+                       BdrvChild *src, int64_t src_offset,
+                       BdrvChild *dst, int64_t dst_offset,
+                       int64_t bytes, BdrvRequestFlags read_flags,
                        BdrvRequestFlags write_flags)
 {
     BDRVQcow2State *s = bs->opaque;
diff --git a/block/raw-format.c b/block/raw-format.c
index d223298dfc..345137813e 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -532,16 +532,16 @@ static int raw_probe_geometry(BlockDriverState *bs, HDGeometry *geo)
 
 static int coroutine_fn raw_co_copy_range_from(BlockDriverState *bs,
                                                BdrvChild *src,
-                                               uint64_t src_offset,
+                                               int64_t src_offset,
                                                BdrvChild *dst,
-                                               uint64_t dst_offset,
-                                               uint64_t bytes,
+                                               int64_t dst_offset,
+                                               int64_t bytes,
                                                BdrvRequestFlags read_flags,
                                                BdrvRequestFlags write_flags)
 {
     int ret;
 
-    ret = raw_adjust_offset(bs, (int64_t *)&src_offset, bytes, false);
+    ret = raw_adjust_offset(bs, &src_offset, bytes, false);
     if (ret) {
         return ret;
     }
@@ -551,16 +551,16 @@ static int coroutine_fn raw_co_copy_range_from(BlockDriverState *bs,
 
 static int coroutine_fn raw_co_copy_range_to(BlockDriverState *bs,
                                              BdrvChild *src,
-                                             uint64_t src_offset,
+                                             int64_t src_offset,
                                              BdrvChild *dst,
-                                             uint64_t dst_offset,
-                                             uint64_t bytes,
+                                             int64_t dst_offset,
+                                             int64_t bytes,
                                              BdrvRequestFlags read_flags,
                                              BdrvRequestFlags write_flags)
 {
     int ret;
 
-    ret = raw_adjust_offset(bs, (int64_t *)&dst_offset, bytes, true);
+    ret = raw_adjust_offset(bs, &dst_offset, bytes, true);
     if (ret) {
         return ret;
     }
-- 
2.29.2


