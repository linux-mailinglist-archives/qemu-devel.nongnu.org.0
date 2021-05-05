Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5233735E9
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:59:00 +0200 (CEST)
Received: from localhost ([::1]:59354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leCQt-0005qW-7r
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leCIs-0005cX-SV; Wed, 05 May 2021 03:50:42 -0400
Received: from mail-eopbgr80109.outbound.protection.outlook.com
 ([40.107.8.109]:41697 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leCIq-0002WS-FL; Wed, 05 May 2021 03:50:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNyHqnvlziYUuFb1w7Jhub+HqIckJa2rdWrZfWyrtBnnwh6jgTWAf2ovKfxi3yx1bl4ybCXUn8mTpK8mH1gfzlzaUHjRE5XhQLw4pLTILkSgYvKqpHjATRbJS/aNDUgfnmV9Zjlhz2FvFAwQqy/jS6ztt/QKrD+knzmDHU5bfMygLMsd6RUl/wAJC8fxcOLsbw242sE0fQWomq6weQqNS7VuOawHf6JCMvWqfc2EouJlC14dzszCDf+Rxnes3GXGD54Lna/agATCacDBUKxQo3DhPdFLZUswkZuvR6r/wvqGtgtDSxud59jibN+VRwbYlEb3z8U1LGdhBL2+VOm2vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfybI+lE3oIAT7zbnN6jXII/jgrNSQxPYrH/H6lr0e4=;
 b=DyuuD25d8H5oBrQs5gjSKyFVTfa4YWYMiIzIFgJx/y12prFGIkwNonkdfnO/B3ndrrF6qxeulWuGw+kS2luPsbfjqkSAPw5eKkpMsLbA8C598kxyLQFhcfUMqOrqTC1KysewZcrgyFhNAtTttvBHkyOu39x2gafs7Su+qovT82ZdNvz1Ksr4enOALB4G14XJW7MGAI+EDEvug+0+I93E5u13RiLrZlrKhZCMQeuIRjORT+akshBOVDr+VaK8ozMxdxHgYcy7P+7Ehygy3w/DmnaESZNNHVkXvExWmr13vx2iA0Sc+1/iX/bmUY5FyZdlkEPKRwkA4oFsrB55+ScLFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfybI+lE3oIAT7zbnN6jXII/jgrNSQxPYrH/H6lr0e4=;
 b=K3TsErNuDwrolgIi1alxBFmgmexnPx2+I1NZGcPNLE3AV3y96EyaDf3Kau5WyDJe8I0cs76cKY515IetddWk8RWAs/C6lk7Vu21rhQgV+vp7Mi26RruWTP089r7HolWJO7yvd4H3cNU4ADX+wyC9xqkvFiS3/hKw5DKkbI6d9UY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6839.eurprd08.prod.outlook.com (2603:10a6:20b:352::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.39; Wed, 5 May
 2021 07:50:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 07:50:31 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, stefanha@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, vsementsov@virtuozzo.com,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Lieven <pl@kamp.de>
Subject: [PATCH v5 05/11] block: use int64_t instead of uint64_t in copy_range
 driver handlers
Date: Wed,  5 May 2021 10:49:55 +0300
Message-Id: <20210505075001.45041-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210505075001.45041-1-vsementsov@virtuozzo.com>
References: <20210505075001.45041-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: HE1P195CA0024.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::34)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 HE1P195CA0024.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Wed, 5 May 2021 07:50:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 847543d0-234f-44f5-a51c-08d90f9a754b
X-MS-TrafficTypeDiagnostic: AS8PR08MB6839:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB683965E08721972CFAE6BE8EC1599@AS8PR08MB6839.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BL6RvKiOcZ5QM8lvgiBGZ6Q81z5WP5UvUmcEeLOcRoR3KsTBBpNNEvT9rR+ukrOqyZzM9cxmQ5+zoss+LKGYd3J5c9K2Q4QhSqb0FOz4gfpdRVz1zxIGru1LnxhAFQ4EwmhTh3DVHRBWA9SyVI+QXFAHc6wRMeJufMdZdgISaVN1Uo1pkzm9lNirmk1+F2WrpyVz0M7VyUqXhuADdICQj3suOhzU262cPhIAHUP5ZRjMY4cn82/9EzArGmEAJSFfCe7SbvfZx+wNxgowLKAwXs1uSBI99oYVLzBxRvNTmsXk7S7UHt2iZV8EiYO8e3cxs24ELqoXNfl5B2jn9kUNp7dr64swRXdBBrzLEIkibim50Br7aRfjvkkpCyMgQ/hoFOHxBfXIakuC53G7htUYXro5gfLK8if2xhl/ijoCbc2TkUpma9CvTHOB5DKGT6OQbDujUhATQ1Cc8ZhLzxGeLlwKssg8tzOcBU0aNeEmIk9AdQz3XN8JjX5pSBlKSJBRtNsq/svrRLhubtUA2g6tVD9A0iEj0bMGokA3rJOBukjGJn+UMAYM3awrXTOi4rdApVv3UuQ5jBN00me+B8xz6d7Wim9CJU3IQ6zZykktfnk66uP2ATlrDFvbhup9wNHTG9HyoFQGj9ULIhYLlbqEJrSaM+x/UFCO7t3kJSbjrfFXvFTSxQM14k3szJa5NH72
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(346002)(396003)(366004)(136003)(38350700002)(38100700002)(66946007)(26005)(66556008)(6506007)(66476007)(86362001)(16526019)(83380400001)(6666004)(54906003)(6916009)(4326008)(36756003)(478600001)(316002)(8676002)(6512007)(2616005)(2906002)(186003)(52116002)(956004)(6486002)(8936002)(5660300002)(1076003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3Vv1Fnx942aEkx+z193As5W9kz+QR1Wo602RE5Un38ZU0H+Z7wvMTlyWTtjM?=
 =?us-ascii?Q?fCsY9TxtMfE5Dm8MZdAeT66E1Aut8yrXzL8o10P7bdBFQeeOPtbSTIHFsgh9?=
 =?us-ascii?Q?ItZQTvh+iu9PPXmst5MoHBG3d3ItNcG3ul0S2lwCVAk3dx7Wzn+cGka2imKS?=
 =?us-ascii?Q?nnb6MQclBy20rQ1XvHeL01yzLPajgj+/p43WzsqoPrNyIyqvUTv3MMDCuaeJ?=
 =?us-ascii?Q?8mcPSPRn+6VO81ZMKXS9pnvBCgcOfItvVcljDF/GYqt2nFsqjvmisC6/hZ/C?=
 =?us-ascii?Q?d8pjr8m78u13sZwUqXOcKtOZtLjTrwrlNTBeXbyj/nyGCRAlfcebpZdYvalI?=
 =?us-ascii?Q?Ixt1OnX+Vb8X7QkzRignB7DdfZLOzUvsT4oP2ENoh61AKS8WwBpJujx0uhmh?=
 =?us-ascii?Q?VJoDAzOOOxzXWgZwKcm363Xto85B0AsavTCfptqv2Wby1NX9FJBgTPS+LSaz?=
 =?us-ascii?Q?wlLKKQNcTL+ymoItaD+PP0FSjmbrN1JS/HjKyZA8VBXQTm9HqNuiKwPEZ3d4?=
 =?us-ascii?Q?HPNXFnxFWqtKrDnqOoTLy/ysEe6tWlwd6Z5hc6zu74sTYLj2P7qYVDdojB0D?=
 =?us-ascii?Q?dAvTvSExwZQdmZrJNC7qLTWLTPmh3MWQWf0BMBTxCDk7eaEzEscORR1ZjOtU?=
 =?us-ascii?Q?6SAHIL1xGhFqN/PFRVFyE4OieUElMYtQR2UYieE0jZUowIC2gsLoumtEiTIs?=
 =?us-ascii?Q?9YkdRQJc9v/sbjGHOe9LjZK7mZ/0K4/VgQixyhJwDVh4vURb58bOMpNCcJEB?=
 =?us-ascii?Q?a8yow1DGoH+uDQs0rrPUf+nvCRUXMUsMXnq1E5ZId6uf4H3NfrhYDxEGtOee?=
 =?us-ascii?Q?LkcCd+fx6JWbBRcFGbVZoSDHPE2fRmdJSVFH/lSjIeppbYfYSRnkAHpyVieT?=
 =?us-ascii?Q?Ebt9THI23ht+CpuCLQaabkj+15eqhaHNoH/Md9mQxb/7vgIxa3y/TWQ6RMdU?=
 =?us-ascii?Q?InMXI18r+Pa0rsTcqbHQqqEkxtFCK5YNKoPY8n9BDue0ZRfzjO5nZ2t3GJlX?=
 =?us-ascii?Q?kokR/GN/9XH/j0BpEJzLZmbUXOMOjvnVjd0kEtX3SVbRJpP4OTZ42DmqLx9C?=
 =?us-ascii?Q?7gWgZdbALhBIk01dLvZkzZy32ADlsZCKhcZzXPI0HkKVefkylrt1mZ54fAOP?=
 =?us-ascii?Q?MdFQ1Mk+ojKxCrIFQGHQ0CT+e2dSm3QXgM9JERc/mLu1Uz7/EdAfPiOO7FWN?=
 =?us-ascii?Q?khcF0Y0p0ZSzH6hWkSQU53H/Sln/8XjmaqRqafOczwpeJvB0J+G06fTtq25+?=
 =?us-ascii?Q?xmHh2gozEVrwI2AN1MVTGZOL2Z10LujtgHC/3opzS++thxJgSp70cvBZS/Wh?=
 =?us-ascii?Q?asyN7/beM3VjKOTl+aw/Zha5?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 847543d0-234f-44f5-a51c-08d90f9a754b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 07:50:31.8441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7TCv5v40zbgL/7y0bHnOI23PKpFR2D5s4qgsh8ilN/k1n/Ia6B6VRyt1xegBmhYZ9bwvR74enfoAF+35F9zkcvS6gp6X305qo14D105FPnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6839
Received-SPF: pass client-ip=40.107.8.109;
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

  bdrv_co_copy_range_internal(), which doesn bdrv_check_request32(),
  so everything is OK.

Still, the functions may be called directly, not only by drv->...
Let's check:

git grep '\.bdrv_co_copy_range_\(from\|to\)\s*=' | \
awk '{print $4}' | sed 's/,//' | sed 's/&//' | sort | uniq | \
while read func; do git grep "$func(" | \
grep -v "$func(BlockDriverState"; done

shows no more callers. So, we are done.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h | 12 ++++++------
 block/file-posix.c        | 10 +++++-----
 block/iscsi.c             | 12 ++++++------
 block/qcow2.c             | 12 ++++++------
 block/raw-format.c        | 16 ++++++++--------
 5 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 38ce897972..b614db5cf9 100644
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
index 9771eafe5e..df1b3c98c8 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3134,8 +3134,8 @@ static void raw_abort_perm_update(BlockDriverState *bs)
 }
 
 static int coroutine_fn raw_co_copy_range_from(
-        BlockDriverState *bs, BdrvChild *src, uint64_t src_offset,
-        BdrvChild *dst, uint64_t dst_offset, uint64_t bytes,
+        BlockDriverState *bs, BdrvChild *src, int64_t src_offset,
+        BdrvChild *dst, int64_t dst_offset, int64_t bytes,
         BdrvRequestFlags read_flags, BdrvRequestFlags write_flags)
 {
     return bdrv_co_copy_range_to(src, src_offset, dst, dst_offset, bytes,
@@ -3144,10 +3144,10 @@ static int coroutine_fn raw_co_copy_range_from(
 
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
index 5bab24d1dc..acf29277c9 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3998,9 +3998,9 @@ static coroutine_fn int qcow2_co_pdiscard(BlockDriverState *bs,
 
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
@@ -4081,9 +4081,9 @@ out:
 
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
index b0fe75f54a..051b00a4d4 100644
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


