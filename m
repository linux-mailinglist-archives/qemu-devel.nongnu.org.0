Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BC235871A
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 16:24:51 +0200 (CEST)
Received: from localhost ([::1]:45982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUVaU-0003T9-EM
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 10:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUVWx-0000Sk-Np; Thu, 08 Apr 2021 10:21:12 -0400
Received: from mail-vi1eur05on2121.outbound.protection.outlook.com
 ([40.107.21.121]:29482 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUVWl-0007ST-5n; Thu, 08 Apr 2021 10:21:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W43PNAk+5lVhfdKUBf8s/dcnodBNPfOWbwVNFB+tioeoPv0i8qaa91j/3bTC56dhj33hyi1sRqcjX6cfLiuBSdD77JoBO1asUkALiMtk4GIV1djUBOSJy7ncl3Wf2Hn5DQmlnhxDcKZvnFt2bj6E0auUfM6vPWOQHTzKRVAQLonuVhPFEaloqNQO55wDC63BvEYv/+91W7G9Jo8HuyQ+8onjUtfBzgX9TOn8I9swcNN0wyyw5QrMLJGC+XNd/pusAkvwqB2r930/+2ZV0T1mMUF05n5U3/eb6iI+YRE5mincPwj8Uw7luKsHB89M0dB6s9dwctB8DCIwQydC3i+nMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWSezsaOBS6sPFWBkZtqPiG0dmz5LipYe56swsx30p8=;
 b=aJSpA5j0qqUBPVZMUYTs2DcLEMdGap5pvRwKhCmBL7FjplAehEUHt01QsAPwWiBDKvnhWDbM/CescPW0a7CYa42luqKdFHc8c64NzeFLV4jOF6jqtajvvFIeSARAd7mXctZxhRXMpufiSE/tT0WZQol0qXE1hduEZtNjBuUF+pW4zNT+371z14jUi2mXAEEe7F/ufPII7Bu0PS5SfjL65egHLOM2soAnWcPM9b4ug66DlDAxNheWWwH0lrGuok0WVhtn0sdu7QUqxAKx4i24/GxnQKIlpNPtZehxEZGxRYK5Iz0MxKfSBGJ+ONFSOeQABz6HEve9vWJUyls3m7ytPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWSezsaOBS6sPFWBkZtqPiG0dmz5LipYe56swsx30p8=;
 b=W/z/NyK5M9HevNeBiiaZ74vo3ZBbz/sxufqk6d4CCuucUBQmpP6VTif4QKTXWaxLwkGDXbWINPA31D46gwyWqlUcesdk4zsnRe3jmGdfMVdZCT3PFLeb970hMG6qkaI+aqYr/9eIFsmSOI0bFPNaEpWteBjgE1oU2v162AVwQFY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5909.eurprd08.prod.outlook.com (2603:10a6:20b:297::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Thu, 8 Apr
 2021 14:08:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Thu, 8 Apr 2021
 14:08:46 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 eblake@redhat.com, rvkagan@yandex-team.ru
Subject: [PATCH v2 03/10] util/async: aio_co_enter(): do aio_co_schedule in
 general case
Date: Thu,  8 Apr 2021 17:08:20 +0300
Message-Id: <20210408140827.332915-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210408140827.332915-1-vsementsov@virtuozzo.com>
References: <20210408140827.332915-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: HE1PR0701CA0052.eurprd07.prod.outlook.com
 (2603:10a6:3:9e::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.206) by
 HE1PR0701CA0052.eurprd07.prod.outlook.com (2603:10a6:3:9e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.6 via Frontend Transport; Thu, 8 Apr 2021 14:08:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 808c8e78-e918-4948-46a1-08d8fa97d349
X-MS-TrafficTypeDiagnostic: AS8PR08MB5909:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5909F1AEF1A65556C0B8EC8BC1749@AS8PR08MB5909.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gWXXisYXb2DOWPjeCMnF7anMtWJ4Kf/7xdmeAdMRgj+AXmXlIakaSOSUigRJ1/I376qBBAZ03ocpCgkBg//24TOrN7jMDkLEsElQYOiouzJEQRN4AGRuW40/m4LBCwVYb1zw6/v+IifZNzgs4eNRzTSV1bIdBwe4cBygpZpesbeXjpS7L5lxdkejdu52jpuhVSQLGjtFvUxIdpvabPrO7EQ/ulwS8Je73rG/dcvus7AnOtrIg/8KuB7deRLmiqpyt+DV173wiMfzCSh0WEZh4tVGR6DqCD9k/Fu1yxAfCiLfEokRFZLXm8ua8f21O8wQKUDPaFpoWvn0NBE/h82ifeeTBhsqKY/GQtrYaTVmwuNlwvpKKAJv6ZFyPSr+7G7Du/z83je3N3V/kPf4x9A4uvWADrzHGKtPbu5gQffd8VWSLMJPjBPPfv4hJZSzvASU3v4qixKmsqrmiSzV0S2mqZMX+cZZoEXoziF7kadZ0OzhK02//13O7Ta+JdS3d50fxTE37C8iOXw9KpokEwX5wDutGynOlMdaBpiYHfCu2JPbwDylGya/VpIwCYrd/QRfXL0c8LX1AuD/Y2pGXO7slURSMJWym/9PyH+Vr3HowpFYPf0a7TS1n7/Qxw9lHzbBh0XiXR8PBrBCdvCPS8CxyzcLAr97n1FzN0nvxjO0jHevWpv9BCS8uWWXY0x8m/6KCX5jQKd/eEADInUDTnFZhpKNV6qmZEQx0dpWKvS0TDo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(136003)(39840400004)(376002)(36756003)(5660300002)(38100700001)(66946007)(316002)(478600001)(86362001)(66556008)(66476007)(2906002)(69590400012)(6512007)(38350700001)(6916009)(186003)(6666004)(26005)(8936002)(6486002)(4326008)(1076003)(16526019)(52116002)(8676002)(6506007)(956004)(2616005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?LkCm1Z1aJ+0FOzLcNlrgVMdJbvg8F8mQWgmeleJ9ICsUbzt35ASsoaauZBlz?=
 =?us-ascii?Q?zr63KRqQZvsZrMXoMwaQYMr739dB1SZDqLcX3VL6c5c8lsSCqjJJZb3A2qLv?=
 =?us-ascii?Q?QPll4r+aXDo3q6VonA9dRepTcr9nkO1A5z9DtyhtBWiAHLoaWVm8v0vWwCvh?=
 =?us-ascii?Q?qXFvR1DNeK+wOIg52uP/zlmIrsi/GncbfLtJQP4mm2WS08ewq/N5uYh41L3h?=
 =?us-ascii?Q?eHLsTJHaI6nekFdhpn/cmlyq2S6tNQ4SSml3Fqw2B171yDsIS6j0AlaVHJxP?=
 =?us-ascii?Q?mTyHX4aZGaiEeZSgbfmYnm6GNJfoBDVn0E6EGaEl11CPyLs500ZPa76yao3A?=
 =?us-ascii?Q?Vb8QFVufYlbWsVkhhMeDHdr/2E/b689gYTYJ4ErNL3Z4kk2nIfHIvP8pdGRY?=
 =?us-ascii?Q?Hr+LMTYSQyI6abzLmWSPFz8y9tcwjEpwDYec9VgVf7QUHK08D8GsLN3enzSw?=
 =?us-ascii?Q?4KClHKX3Gn5YwzDId9DvMBTXCv0gIDDjZmqm7ef1uwTr1r7Ow+x9YzZYtts7?=
 =?us-ascii?Q?jUXVYJDq24YoW72xs079ztWnp/h7bPpkZhSWaw+PcC+jo2ov48TrcBFQtDR4?=
 =?us-ascii?Q?SEQK2xAVLbR4c3+nk0aP7p1w27IXao+iI9BN7Vyq5PmTL90W241wFBu31tGt?=
 =?us-ascii?Q?hqgbbHT7Fn0+0CAiy6GSUdRxC+T4iq3XInbA7XYYmH6N3JT8c8sC5PQ6rNYh?=
 =?us-ascii?Q?RcygHAq5QuVtj13BtmEp45d90AtmOUEVLDw9X1CbFTZIII+9OoU2czqFfEMv?=
 =?us-ascii?Q?BvawXAg8tdFk23KnIjMm4I6SKKSW+w1HQdfoLqnzFtF4W9Js308mr1an1aBl?=
 =?us-ascii?Q?z2mq6accm2YAEe7RC4XAvabZjBTsiMJPb9vLVxQJnPCfgpsg1tJTCJALmn5x?=
 =?us-ascii?Q?ttcvJvf0yQcCiRXRxNWGEDa2aLtW+57bTktTbwu/6AgSEqY8uFiwEVu28Kdf?=
 =?us-ascii?Q?e9lBcpaq4uAYxZY7u79HWaBAC6wr9bABvdkPT3HkyFbTUaU7DynrhcQNHroz?=
 =?us-ascii?Q?tmYEGY0LC32WwrtZwIiaqqTTwyP4uK21Fcz8LnmoYUyHwCC82oacinTaWep4?=
 =?us-ascii?Q?4VPSsfnqJU4O5oQYQHPKhPaLr073Fw/5QZZj5c/98e9nx90quQ1yb/pSkcQI?=
 =?us-ascii?Q?3gFJCRlAp37EZXWYIu7s1GQruToYLde180+RpVyts+xdhZHtLTnorMLguer6?=
 =?us-ascii?Q?QdsSTuiznVJrGBE5TyMlduv0f6pCjUG31MXFc8evEezmqL3EfZiYtIcA0ORW?=
 =?us-ascii?Q?61fxjTX0nKOo44F3MI2g5Xcu7udsYhVaMwte66gEaZ4FjqdDsR96P3uXBJLb?=
 =?us-ascii?Q?gquDDnaBssCpypFYzbm5Yvvr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 808c8e78-e918-4948-46a1-08d8fa97d349
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:08:46.6388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oCTWFdt3DE7n6B8qrkPHUHwuf4AsJ4Eey/6XL+dcVBmuTfpE93Yada/OHgwguMVNUnvzM4Z5+lUpU0IIRNtJYIfImrdUkvGSXwtyzqDvd8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5909
Received-SPF: pass client-ip=40.107.21.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

With the following patch we want to call aio_co_wake() from thread.
And it works bad.
Assume we have no iothreads.
Assume we have a coroutine A, which waits in the yield point for external
aio_co_wake(), and no progress can be done until it happen.
Main thread is in blocking aio_poll() (for example, in blk_read()).

Now, in a separate thread we do aio_co_wake(). It calls  aio_co_enter(),
which goes through last "else" branch and do aio_context_acquire(ctx).

Now we have a deadlock, as aio_poll() will not release the context lock
until some progress is done, and progress can't be done until
aio_co_wake() wake the coroutine A. And it can't because it wait for
aio_context_acquire().

Still, aio_co_schedule() works well in parallel with blocking
aio_poll(). So let's use it in generic case and drop
aio_context_acquire/aio_context_release branch from aio_co_enter().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 util/async.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/util/async.c b/util/async.c
index 674dbefb7c..f05b883a39 100644
--- a/util/async.c
+++ b/util/async.c
@@ -614,19 +614,12 @@ void aio_co_wake(struct Coroutine *co)
 
 void aio_co_enter(AioContext *ctx, struct Coroutine *co)
 {
-    if (ctx != qemu_get_current_aio_context()) {
-        aio_co_schedule(ctx, co);
-        return;
-    }
-
-    if (qemu_in_coroutine()) {
+    if (ctx == qemu_get_current_aio_context() && qemu_in_coroutine()) {
         Coroutine *self = qemu_coroutine_self();
         assert(self != co);
         QSIMPLEQ_INSERT_TAIL(&self->co_queue_wakeup, co, co_queue_next);
     } else {
-        aio_context_acquire(ctx);
-        qemu_aio_coroutine_enter(ctx, co);
-        aio_context_release(ctx);
+        aio_co_schedule(ctx, co);
     }
 }
 
-- 
2.29.2


