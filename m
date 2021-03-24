Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B22348339
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 21:55:37 +0100 (CET)
Received: from localhost ([::1]:42640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPAXP-0000iv-Kw
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 16:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPAU8-0006hI-4e; Wed, 24 Mar 2021 16:52:12 -0400
Received: from mail-vi1eur05on2092.outbound.protection.outlook.com
 ([40.107.21.92]:36928 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPAU4-0005MQ-2j; Wed, 24 Mar 2021 16:52:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crEmVcLk/xnn423uylqTGRvFwUMva2rHz1nUQiQ3MV+1FQKa7t09v8DznvyKdwT2uRpk8XH8/6fudmXh20BuUEXSj6RSuZFDrgOmAqRy0okTiqo8B79I/+TkTZXBaT5jtIxi24mgaVAIN4i1KKi9a+Pq/HwSjsiKItVUi2ZPBk6keTY7VVn10TDHZTUK450a/BpwAtS7wAvhai3ySvHDf0jslrxf6k3+kxuK0521AqNtsrsFytQ3WP5wXVbYdeX2H659EXJOYhSwfXLTnMti1eZAOuQrR0JC1NQtxPODpKMZ33QYJDkhK28lY7OEvWZvUJW/DDuA+4mfCHUBbY621A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdBzwN23DErr3rhqFhBhFjdkM5PB4KJyxk4JvcqNfRs=;
 b=XE8GuF+uZEMQRyeGFXbscT9tCfqQJ3h1lE/kfML+iW6KpaXEKsQSnlSzXGZULnwu72/3a9DMradQV7zygBo6axoK3uDXYNGuj4UY9NIXPAmsyynCIs+kQRGaiO17NjqNrrrjhTYvm9iBQW3oul9Q6yLZVigAYiDs4FLljDrNptHGHvUmKNFNXh//fKTc5EShuRnoNWs+Go9d/JQJVuNB6IGtbZka9I2/RfH/04zKWbH/v7XGCafXbJkHsbycET61ronUK26ePiaCfGhcTi86pDcYc8HMwcd4xA8jSMmvJ5BO3HHQ5TE+F/Ceg+/RzMycdDQpXbGplU//VjC9r9uVtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdBzwN23DErr3rhqFhBhFjdkM5PB4KJyxk4JvcqNfRs=;
 b=m47pKamIti9go/dt4+W1x15V4cSl6gZ2CZMrWlTK8ISUtR3s5wi/VuEsZb6BQbNvDWxAzymINTnUej3P9IRRQRD0D+LOdAwRq7f2tQfnaxYVdpzom61toQYjUm87eL+pGBZDgs/aUsH2jz5WIPRnKGN5q4GMLvEQtNWvFGRdYSc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5447.eurprd08.prod.outlook.com (2603:10a6:20b:10b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Wed, 24 Mar
 2021 20:51:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 20:51:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, integration@gluster.org, namei.unix@gmail.com,
 dillaman@redhat.com, berto@igalia.com, eblake@redhat.com, pl@kamp.de,
 ronniesahlberg@gmail.com, fam@euphon.net, sw@weilnetz.de,
 stefanha@redhat.com, pbonzini@redhat.com, pavel.dovgaluk@ispras.ru,
 ari@tuxera.com, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v4 05/11] block: use int64_t instead of uint64_t in copy_range
 driver handlers
Date: Wed, 24 Mar 2021 23:51:26 +0300
Message-Id: <20210324205132.464899-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210324205132.464899-1-vsementsov@virtuozzo.com>
References: <20210324205132.464899-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR07CA0022.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 AM0PR07CA0022.eurprd07.prod.outlook.com (2603:10a6:208:ac::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.9 via Frontend Transport; Wed, 24 Mar 2021 20:51:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae3fce06-2eba-44ad-ec86-08d8ef06a7e9
X-MS-TrafficTypeDiagnostic: AM7PR08MB5447:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB54475A9965B84EEE354592B5C1639@AM7PR08MB5447.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n9eAvb/ctrjuAA2Yj+t9JX0Vvit+NMzlOEyWxrXv+Uh6iKGvgvu1FKq5uRDLZ0CLzLFP2GNQexeL1SYCZzysKEDnhgdQiHFM+xdLsJDSteJit4FnrI6JUJYGS4KEB3MKYRFHjD3EI97oRTrkDn9gI8Z6mOkUWhVj4QEJ/dmcpUQrDEFUzHVWNPdZfDCAhZLaZNpUIbLgGir268BzxMhM8H7gGkkqKYt3VPgMUS5YercpQ591+NmvtV1xSMOLAGvQNcL+Bcm5SA3RtvgfzTIFoJXp+c1ws+WhKb2ucsZmnF5WI/8vbv0Q7/I3gvXvgpmNRO1GwXbb+mVwwb2tgd+owLMcEcveiM0iWv0kvsPTtB4gZAcN9+IeFrHN8fT1WRKr3loXPsieMs2S7lILWXtnmGmuAS+ALGEgsg7VjK48Ed+cMd5cKHdKQWICzQFr1mU91PD6RlAjOuhLq+Lh8QWfjED4NsoWtQUHEPgvlSfi2memrgEvF/Sw7xXNFwiVGxAXr+Ww2QpaAyzFZnvWaQno9fygIZJomYtEGLR1X8IOUscdpbdXbhfzTWJbbynP1GxdTF7QoZ1Pv0Q5kPSaBdar6yMVNXYDzP7HG6YS7DdfRiq6GQzkH69XSeT2YVJUKi16l5Ef8YUNvN1jO2rQFUbRrilBKMAOKSAqMMwvNfFJddkaxWbiXlJ3JohlydCEM/nd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(136003)(376002)(396003)(366004)(2616005)(6916009)(478600001)(8936002)(66946007)(38100700001)(956004)(66556008)(6512007)(66476007)(6506007)(6486002)(52116002)(186003)(5660300002)(26005)(69590400012)(83380400001)(7416002)(6666004)(86362001)(2906002)(16526019)(316002)(1076003)(36756003)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?tub1AaATRqBxn0HE4cfqsqCEbR8LWIFa4jnWlfmBBUC+1giwp812K7clCz4n?=
 =?us-ascii?Q?kN3PKYk+AXhOG0tCDyun7ryFs5Gv+XE4S1lLV+cOcusl/+NqqJSluMC6MR8J?=
 =?us-ascii?Q?Seb3xk4N5a8LKncSKN8ZlLMWvlisuuczhShsU1rwQQN0k0C2sJI/nXdH+YwQ?=
 =?us-ascii?Q?qJkOtyqFyqvHqSTqRm1gP0t4SvUwyLvmueK+7SIufPlkZCEaSEDr7OKkosnr?=
 =?us-ascii?Q?ep7uuuHGgbguXU1bOoI7puOI2S5qmROqgimviCh5GDEoLne6EOdBdM2gnCty?=
 =?us-ascii?Q?I776htY/60gFPSNTmJgjZSdWNTj2zdAkpvntKrHueEigG4WqDliln0634NA9?=
 =?us-ascii?Q?Uq9Ul10mZ3u6IiE2K/pDJ6Al5m1zqIwzgh1JSL+mh4oZrLlKzkZjLHMtyefG?=
 =?us-ascii?Q?3OZHcZXN2z8H2mVCCki4O4xda9ubykPlIKaWdUi+EjA32hjoUMUFr1tkWzQI?=
 =?us-ascii?Q?uLC/WHftEXKZByGHAKW86+EY9Eguw2Uqkthw+2E1t4uknqGcLA1XjvyW7JEv?=
 =?us-ascii?Q?M2K7EyhIRXxcrenMzAAEoQHQ8ocuAI71jLqJgi0NVQkHDS0iZSHH+oBuefAx?=
 =?us-ascii?Q?+Mwr3imJni+UIbZVL+Q9zqrVuQVKrWxADA2RVXflMMHYQXQj+UWT+GmF6FQs?=
 =?us-ascii?Q?dJczggYN/jb/8YJbX8oYPoYm1hXB/LwjBzqofiXXlGM7hiDQR0XUOuedEVlj?=
 =?us-ascii?Q?IV7JvgvzsciA5TSLsR0kD2pLYHU0hPW3ooR34OUn7e10W8MIjiEwvbT40AvW?=
 =?us-ascii?Q?m/Ywtp3AIVEDl2UKqPGcxJTse5We/sRrwl3R/6LU5+LYk0zDzkYgl+iGNOaN?=
 =?us-ascii?Q?a8qxvZMJ+nc7nL0T8AbtRU1+LIDiPpFcx8lyNbtB95mpqSNIZRuUnvAIhh+y?=
 =?us-ascii?Q?BV9BehFU26dho0vHfMalX7TTuzIlsXUbffeIPPnDRjNIkTorfVuLQ7g1QFDw?=
 =?us-ascii?Q?sBeWaaxWueMr8VuW27pyDh+axON/ULLn/Ekes2c8w+V0I22w6MOE+U7KmZWJ?=
 =?us-ascii?Q?08n4ToaqETrDkDBU0A68o3s0H8y2VJASYe6WA05FKwKPpIPWnO+YjA8q42pk?=
 =?us-ascii?Q?qLQ0+UteYLFTH6wOMuXfqZCa2Amf9U7bq8UsNLEy4dTNFdJVFVU1dA+GggAf?=
 =?us-ascii?Q?z8zI1OesS0Pz2VIBwTkHMu/Qk3bUyfWYCh3Y9h8SrrQVaGGirLGOkKI4Br8w?=
 =?us-ascii?Q?TBdOQJ5oonotjv0olSyIJnkOE3OpzsNXxI1psz6MkQG3cwCfcCFJy/Ll6jc0?=
 =?us-ascii?Q?8XpWzLWoCMGy8IRivLzsU/xxvuXV3jmL4o/kx9rA19Za99bInWhi4vohTjEs?=
 =?us-ascii?Q?e/ht7l4GR68Y11lQvrHzdB2b?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae3fce06-2eba-44ad-ec86-08d8ef06a7e9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 20:51:54.0217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N29Q+5N6J4tT95Nt6TiU0HBHrHAN3kX6IZMxUKPo2DFQSumL/dUVSjvKKya6HnMdJXizNrJiL8UNDoVgDd4bWcE68E3z/QAY0M1VOi2menc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5447
Received-SPF: pass client-ip=40.107.21.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
index 928369e0bc..88b19db756 100644
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
index add56cab00..6faf7eb96e 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3167,8 +3167,8 @@ static void raw_abort_perm_update(BlockDriverState *bs)
 }
 
 static int coroutine_fn raw_co_copy_range_from(
-        BlockDriverState *bs, BdrvChild *src, uint64_t src_offset,
-        BdrvChild *dst, uint64_t dst_offset, uint64_t bytes,
+        BlockDriverState *bs, BdrvChild *src, int64_t src_offset,
+        BdrvChild *dst, int64_t dst_offset, int64_t bytes,
         BdrvRequestFlags read_flags, BdrvRequestFlags write_flags)
 {
     return bdrv_co_copy_range_to(src, src_offset, dst, dst_offset, bytes,
@@ -3177,10 +3177,10 @@ static int coroutine_fn raw_co_copy_range_from(
 
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
index 1e55ab52b3..c786601d52 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3975,9 +3975,9 @@ static coroutine_fn int qcow2_co_pdiscard(BlockDriverState *bs,
 
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
@@ -4058,9 +4058,9 @@ out:
 
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


