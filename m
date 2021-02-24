Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9733323AC8
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 11:52:04 +0100 (CET)
Received: from localhost ([::1]:58020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lErlz-0003I0-Mj
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 05:52:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lErhg-0006jd-I6; Wed, 24 Feb 2021 05:47:36 -0500
Received: from mail-eopbgr80124.outbound.protection.outlook.com
 ([40.107.8.124]:36517 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lErhe-0007Jd-Oc; Wed, 24 Feb 2021 05:47:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kq8tDVHlkkRVjzC4Bn77hfvuqVjwW+EPeA6AQRon8aFd/Osn2f2o9/Q9URwXUX294qhGte+x8L+KMtO290xnwkQ+vYEHVCZPZsxT0U1o4MSL7VDsM+IoU5zFqAyhQhhzXHHLuLPrZt0TzzLMxlgYoaRlCRPYqY0W5BfsPnBhzg6gMIIS1vfqlr97pa2a8lh3hZVDgZHE5vd78EpLLMm9RySoyRFNWn3Abuadl/6Z0nfV4C6Nws1w5dn+gzh7ZKu3DGgepS0AOogdlhVH6Lw8ScMRFzVbWxFBxKvDGI32ig77Ya3Laf4Lxfmo1GuKZYrIH/WVkttimq7cErrWxVgT8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y74/Ieo2TPJayegsix7wobuvb3NPrAgOTDMcY3HGGfk=;
 b=eyWUdVurvd6i6+EuoZGOjM/qn1bn2aJng5HvZ/l0hOgYsvOEJT6c3HhcZIAbqXoxzwWkxRj5QpXyLcwJvyvqrTnbW5icye3CSKyLcCCa+y+mBleZHVrRucm5CJJNJc6vRmkgkfeMdxGZV24pbbgcvtLYvLWvOoKHh+ni6A9XSmYPkH16sU22uIs+jTXNmCS/x/UdYPcLfWug+WKVx1R9DqCGXNDSov8spyqwIZG0sy8DbtwYM92ir6WQ1+GRzPY/sPluQsYtAxzF8kNojyFQgsBWCuRyE8HrjHg3NzuvcIpCSM3yc94qVXMHusCVtYk5kzr/wWT+qlee2txT6vhUYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y74/Ieo2TPJayegsix7wobuvb3NPrAgOTDMcY3HGGfk=;
 b=O7r7VyTGzj1UTvfy/GpJSy+4NnPc3pLTe9pbrKXFdwi7qEZrvCgWuN1tBXhyf+yKJpYLY7Q9uBRUmC90f9Ut427s9POLF7KxIgQs0UgTuH70ANgK/KHi5v8KTdewNowiAG9Ehs2Oq6JX0HlAtl/MHYTq8cVfxC3Oqa0x+A16Fec=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4951.eurprd08.prod.outlook.com (2603:10a6:20b:eb::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 24 Feb
 2021 10:47:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.032; Wed, 24 Feb 2021
 10:47:28 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PATCH v2 3/6] block/parallels: BDRVParallelsState: add cluster_size
 field
Date: Wed, 24 Feb 2021 13:47:04 +0300
Message-Id: <20210224104707.88430-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210224104707.88430-1-vsementsov@virtuozzo.com>
References: <20210224104707.88430-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.244]
X-ClientProxiedBy: HE1PR05CA0177.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.244) by
 HE1PR05CA0177.eurprd05.prod.outlook.com (2603:10a6:3:f8::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Wed, 24 Feb 2021 10:47:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a810cd1e-d178-4562-6a9d-08d8d8b1946c
X-MS-TrafficTypeDiagnostic: AM6PR08MB4951:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4951B0DB54B637B87DEAD6F3C19F9@AM6PR08MB4951.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 97ct+gwgZ+c0VFrGjZMpOlNhVNA/SOrkfi0A5JUCJQkOkAFgj/rrnQ3tknxhloaLJKwm8nx0vKiFH/HqMgK1vQiMxZTtOu63ZYQ9sPi4ZpPm/dB65w5WUoV8JpdtiD9ZHdKSyMOECxR99q9fQYBPd91rm+8Wm3FW4pRve9JEiPfpWHGA9ofekerdM+L6XZ+ok+qi9Ui/fl/tuDfMC72mVnIbqpVKuPQzwt33DGQdRHFDYV8fSUFNGKnTAa7fvY7GI2lnO0NYNMEeacTRkNPBVHXEpOL1ey1Ajekys9tUVgGEk2IETEJ2dCxYk+AqxaERhKEgVlu7xg0bbbFYlvZqIP1QU4NgSlqZf9lVhtLPwOvrKV4XpYtFC4w5XjGoDDXcq512ptTgE4hg3qiQ2F56wEZaTap1UpzpSLycSHh+fUB2EZfeNDXkIYMMEdzFrlXCFHHm4GVARvaZeTL3b0v5vki89P0oIXWxPAFFSNAe+M5Y90HU4VcRHc4QnNqtgS6GA64zrDq+H0tyjuXmYI4tkDVrG248ynVXcmWT7mH5SN5h/CJA4wWjkknsi4j9R6HD3gKH/kQAEeHX1JhQuw4Bbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(136003)(376002)(366004)(396003)(186003)(956004)(2616005)(36756003)(66946007)(2906002)(8936002)(6916009)(26005)(83380400001)(8676002)(16526019)(5660300002)(316002)(52116002)(6506007)(86362001)(4326008)(6512007)(478600001)(6486002)(1076003)(66556008)(69590400012)(66476007)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xojvHW93exhUuqx4U1Mv5DBlQEXtDa9QVnfPc/MbaX0/q8zCU1U4wWWbSEsO?=
 =?us-ascii?Q?WEhUzpExZRbegxwa+rGILnbDej4sJtYUXlr6uahy4c9K9vh/5SYB3N99DKE8?=
 =?us-ascii?Q?suPfhWvsf/Z2s6dILNCjl9HNelahcIuc9IZF30740zqYBzSBWwjLG6cAbHWg?=
 =?us-ascii?Q?pXM0E1LmGNUL6XQ5Qm01XVbwgZju9GD2hOonksICmzVoimm1u1QHzwQeBZkv?=
 =?us-ascii?Q?zGqkjc8L0lHpZ5tUwHmMwl6eCz7WeP0iDbMiKMhUkI/u5YHGVntkaWmNqvaU?=
 =?us-ascii?Q?TfMsR7jT/FHfTQCTHN6JyWBcbD53QOX6sfLqYtUWIUEfBkYVTFMz1EqfdHWg?=
 =?us-ascii?Q?ZGYOXNeWJQynX0GMYQ7cyjaIr7x10xQ/CTaD8Bn2h96NVXSIejitYEYp786L?=
 =?us-ascii?Q?pjK+MU42vymPVPel0JwXwQlgkUW9biyc6WuE9DSFstaMVzE2LtzsOgJHD/V5?=
 =?us-ascii?Q?08DnAgET5IjZHMnoBgxpjOJSIVUsp92yqhcoXk/RYDx6AeMFYP4SC5Kd1OQl?=
 =?us-ascii?Q?HhQRNWTfTx6ygx1EP62Wgi23kCboDvTZ17A0eEMsYc+ON78w7Up0V0etgtvP?=
 =?us-ascii?Q?H+7uH72j0nzVnlrbv0nW1cduew+VDHyz1rYzEY89hNqjT8wGwtDi0m0ydqOW?=
 =?us-ascii?Q?wAgtaNBHfWWuX2MeWO6IoB9RUlJp5IFpnsWm6jEFEt8XplKWDKq3yW6VYXBG?=
 =?us-ascii?Q?20NG3fGQMzRV4OSRxiAWiRn/m5a8wpUzQO6yvx5A9M4yi2jWX3sQxW/KfaT1?=
 =?us-ascii?Q?vOtyqFNbauwIknzxQjZts6ZXmjixRnfht6v9OsIZREZFhY3YnqV4AFTC8+Pf?=
 =?us-ascii?Q?wvRQl3toh2TEguYT9iVP6S15eocSkHHn/HZ78OkuFCkR4IIzpf0iCVhnFWiS?=
 =?us-ascii?Q?uf+zd21ThmK/ZxFAQqsLWmlfl82MVukDN00h9Sd69TxRZe9AwE6p2YPJFeRy?=
 =?us-ascii?Q?fKWKtrnzJWDYha4gWsZP4yZ9+zQwZx8JBqdAk5ZZtMx6wuCgnKDnu+qY6F5A?=
 =?us-ascii?Q?uQp7WuzB+9b/sPooMNoM1qfjxO7vxY+yi4mtxPqYmLVQAA50/kwaeAZ0nzJI?=
 =?us-ascii?Q?f7Y2Ye5wXVKHSkpdM+Q3s6BBSWH8YTqsLykJogc3AtCGlXkeQHeAsy2/qcEU?=
 =?us-ascii?Q?iZ1N2NMd3FBybIxdOn4pf7tYnVe9XCaRkrytdQDo3nJmBfb5PcLvXN29v4yj?=
 =?us-ascii?Q?b0aFk6Yd1v6xWLfAvSD2QsNMgnRP2384W9s2OdKVVsxjTTzCUJx16B9Tv2NX?=
 =?us-ascii?Q?quwLBJZCOY27p4d/R4cAMmjTZpW0lXPbSdmdIcDEp8ACOEEWF2i0wInHOq3/?=
 =?us-ascii?Q?f1w0BoGTMvgF0XWd210R1O/L?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a810cd1e-d178-4562-6a9d-08d8d8b1946c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 10:47:28.5561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oxpKrN3V2f4T79zHNPwpG5Hi4fIuuPvuYGblGIt6+hV5RFrmt+Umttxe9yoLuIYvZDwluA4bO2Ple31GPuID8Z81slI/53Eiyia/OCDb70k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4951
Received-SPF: pass client-ip=40.107.8.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We are going to use it in more places, calculating
"s->tracks << BDRV_SECTOR_BITS" doesn't look good.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/parallels.h | 1 +
 block/parallels.c | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/block/parallels.h b/block/parallels.h
index 5aa101cfc8..9a9209e320 100644
--- a/block/parallels.h
+++ b/block/parallels.h
@@ -79,6 +79,7 @@ typedef struct BDRVParallelsState {
     ParallelsPreallocMode prealloc_mode;
 
     unsigned int tracks;
+    unsigned int cluster_size;
 
     unsigned int off_multiplier;
     Error *migration_blocker;
diff --git a/block/parallels.c b/block/parallels.c
index 3c22dfdc9d..9594d84978 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -421,7 +421,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     int ret;
     uint32_t i;
     bool flush_bat = false;
-    int cluster_size = s->tracks << BDRV_SECTOR_BITS;
 
     size = bdrv_getlength(bs->file->bs);
     if (size < 0) {
@@ -472,7 +471,7 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             high_off = off;
         }
 
-        if (prev_off != 0 && (prev_off + cluster_size) != off) {
+        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
             res->bfi.fragmented_clusters++;
         }
         prev_off = off;
@@ -487,10 +486,10 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         }
     }
 
-    res->image_end_offset = high_off + cluster_size;
+    res->image_end_offset = high_off + s->cluster_size;
     if (size > res->image_end_offset) {
         int64_t count;
-        count = DIV_ROUND_UP(size - res->image_end_offset, cluster_size);
+        count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
         fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
                 fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR",
                 size - res->image_end_offset);
@@ -771,6 +770,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
         ret = -EFBIG;
         goto fail;
     }
+    s->cluster_size = s->tracks << BDRV_SECTOR_BITS;
 
     s->bat_size = le32_to_cpu(ph.bat_entries);
     if (s->bat_size > INT_MAX / sizeof(uint32_t)) {
-- 
2.29.2


