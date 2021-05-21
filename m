Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4363238CCBD
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 19:53:38 +0200 (CEST)
Received: from localhost ([::1]:33792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk9L7-0005BF-C9
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 13:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lk9HR-0005dM-O7; Fri, 21 May 2021 13:49:49 -0400
Received: from mail-eopbgr80131.outbound.protection.outlook.com
 ([40.107.8.131]:27182 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lk9HO-000645-DR; Fri, 21 May 2021 13:49:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DU8IArOkeK/2DKeWwGTKCdeLHRppt9JDx1oXNljcSGH5YoqgoLc2WBWKzVB7vagqq4BvMQ71b4LC5CDD1LLebDWocacDjtQDZJvL+IRA7GH46UPeefV2AqLt9Z2xCe7P+ZlOtCZ6+dt6N943yBgF/NSo6EAqGHr9bPfyADMeqszlsFrZ9hBfjHk8KYMGU8a3LXVhzsSFLtDHLFXy4XPSw2pubw2U06anuqSO+kfQpHhHRrkoFfRmrFFJe07CHM8C1HI3HRei4uBniF+0jK3PuQWU7z3oGGu7u9DH90QnoI3dx9MEQZoYQ3wFMJ08I4rOXAY1VE/mfy4Nxd3WMJpZ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNVRjDrDsD88nqmhfv6j1z2w0IA9Adbx6d6gb7rztfw=;
 b=IiD6bf3FVrSMOLOYzFeSxHEc4CMjKJB7zXsXsYALSBMCy68+ji5Kkh9hRnjP+rjj3BSd/gDwbu4/6el5tdG1M5WNxKd4acDC5ySEie4Mos5hwqs0ouov9bDtoMATlscfCcbvNxBxQzVxn99nl7hby5/5R+HEIZKpOD8h5lJzvNdsshAoCEzVRgPgXQbyaoSLj1n3Z7TdN08JciDFOF0P9Wk1AnbI+i7F9o90h7x4G/BfaJfX8VPDSa0UOGgA8TGKhsiKnn/r4ACEeJp+lrR/vX7m5u5MqWIQBDPj+0MbMGByRvB76MUwUrzCGGL9y6XknW1RUqUsVIREh2hmqxm0Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNVRjDrDsD88nqmhfv6j1z2w0IA9Adbx6d6gb7rztfw=;
 b=KQAefzdQGx4FGLegkrqYb5kgd/hWAYL28pFqkbYvYNdM0uoWb3hlZbI3s5Ow6bzzCX9rrY9GMX7EzlNw39TBmafqgTxiAKcguS71wQYoW07x1ykEhravvJOf6w0OB1D/bDcdctS//yOgBzeesSg5aH0UzozQWVwtu6wp4PxIwlg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5911.eurprd08.prod.outlook.com (2603:10a6:20b:292::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Fri, 21 May
 2021 17:49:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.025; Fri, 21 May 2021
 17:49:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH 1/6] block/block-copy: use write-unchanged for fleecing scheme
Date: Fri, 21 May 2021 20:49:20 +0300
Message-Id: <20210521174925.62781-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210521174925.62781-1-vsementsov@virtuozzo.com>
References: <20210521174925.62781-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: HE1PR09CA0083.eurprd09.prod.outlook.com
 (2603:10a6:7:3d::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.197) by
 HE1PR09CA0083.eurprd09.prod.outlook.com (2603:10a6:7:3d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Fri, 21 May 2021 17:49:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67232c52-6dce-45ec-bac2-08d91c80cef8
X-MS-TrafficTypeDiagnostic: AS8PR08MB5911:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5911F2A0350CCF73FC870D9EC1299@AS8PR08MB5911.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FQ587YNvgGIKIte6pzFbFc5hYCCqivmvhzd5+953rpK1/VBYY58FOAV5Mrcr4yvs3YU2faQsu06l9vIEtf048nu9QiEwoqXKP9PKQR5FOdlAn6M1NIQYJz44Ly1NVGdijaLTeS8fAJ34ED0vYicXFg0zThKHGtXoN07zdOkBShAbXm5dqjz/BUWQIB9rdMrPuNUqr5uUzeqpc9G2088sbUk4M9AXIqqulZFj0KDSRVNR+o8xIGQzG9uyRN4ADkLwQ+bM89yIvonuK8+4d269WwFDUmifmkts5N4EYFBa4BeNegnmrYxy0IDqSizKGvIWej2VAuQqAuTMZCkBmyvmPIjh9pDfljJiye1Grn4h3JDZ1EGlEghZQWC1Saqe29cw7JPd4lM3xNTl5JL75U9hQLd2xYGj3JTf3u7ygvO/XF8GQv3TWOy9oE+Kai47Ihny2+WrJvIoAVciInPhFTrj46zbbss90HDkIiHAw2ZsCDCfkvApP/m6st+DLG8csCndprVf4LQSnYmQLjs4b+9sJBqXPZHgwK9Svl752XIyoOUeFTh09c6SwzuIqJfaot7XOG6RcLRh/jDVehTelCxmNjihEpAiWMbZStiaDhxKM7DkOC08BcF2liAeFTigZwcLlELnv1D9kKZA1vH9CJreenkJBbcYgr+fgn30nXWi7Zq401/pCvRzoMi6UioFZyZ5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39840400004)(6506007)(38100700002)(38350700002)(6916009)(6666004)(86362001)(52116002)(478600001)(36756003)(316002)(2616005)(956004)(4326008)(8676002)(5660300002)(1076003)(26005)(83380400001)(6512007)(8936002)(66476007)(66946007)(66556008)(186003)(2906002)(16526019)(6486002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6mKEDqxruKNy+dMPqF/5+0m6um/B2suZ4BA6KsUhff+GvF7sWiL0liCRW7ix?=
 =?us-ascii?Q?GMLN19d2/RT7MTo4NYkiMssHRsNa/k7JUDa0EjDR6M2aKi6NE/m9ObhbMeON?=
 =?us-ascii?Q?/W5V00iBPury2/HhMIrb4iby9wG3PuK1ORc0gpRAUo8Q9/TerlVSGLYq5CjG?=
 =?us-ascii?Q?dmv5w7XzXwCx7tE1SFS2U5L0pkHNte5HoFKq1N8Ho0Fm9f2puoeYzlCyNOzM?=
 =?us-ascii?Q?yA5kB4PiUWBzb3KzG49XfoPA9klOtH/HgVokKc6Hr38emf6MwRbLqUq4pZsA?=
 =?us-ascii?Q?oaysITiUmEYHhw985wzwaNXKNz3lQ1J5emkHxshkmKuJDyvhR0KMgjMeGPYK?=
 =?us-ascii?Q?eY34q7qzf9QHPrJgRsSIT5+L/22PxMTltPlaWBx3xGEuoSJCPEpCQwkwyd1D?=
 =?us-ascii?Q?Fc8d5ypXlidVXm0UG56NrYfca8mRKeBzuR4Bxg+u7Mqrn9/TyVvbsyzEvZ5b?=
 =?us-ascii?Q?n0p50UXLEUi5XG/Eonw5IWcMfasFrhE7P9/zFgWKvbONSYPs8Ez7wOJ1ymLK?=
 =?us-ascii?Q?BGiqligVHdI6G4Q/5TD3gH9LxxW00W1a7gmCu5inaWgDz2RVVYWQjC6393zZ?=
 =?us-ascii?Q?BeOgPl5A6s5tvvcgTJZbLMuY85DSc9Mbk99iPYr0MM1UUhv4z6nE6jOTdg9a?=
 =?us-ascii?Q?ogSG7WGYuFmMed1uNakgTzyUQwngT17rNj1Tk1fuoZZ4tyzbdudqsOMRYckq?=
 =?us-ascii?Q?wnWHIBDQB4zQI+0yt3akDHIysj8SE94BSgKEgfFbK8ZWaN8wb4su0U5OmgSG?=
 =?us-ascii?Q?e+oXI841hHsuJvXXkEOTYsMqr8Swa0InN0XJTjvkRPDJw9QWBNpFJ7sabRmm?=
 =?us-ascii?Q?riTZZBq1jh1y4SNmtQpiPPxQ5jrYy05HbzaSGYYIGp54ToZc5MB6wuK6MKo9?=
 =?us-ascii?Q?snyCglozVp94cZwqgQzfalGW/thObLsAk8nG7tpQAXC/AsG5oj7JyFWCTa4z?=
 =?us-ascii?Q?USdBsyC7RCsD/Ovvy3gSK5jP5yyQJEZINhqVouZY1hyYUT1nrvdUFZDiVhTS?=
 =?us-ascii?Q?oQj3lByjVF0QFyAovCACFyOXwZbS5HT9DCuR4zGEPUnSHU3FC4bxAeMl5JN1?=
 =?us-ascii?Q?ReyKSAK+wimQVbKv1iQYSTKRKQuPho6RnoY3M7Y9W9qGTEq0C52dub3hkiLn?=
 =?us-ascii?Q?fVLo6n0ycukhFxF+IZV0WwtXIij7mUHH9vGpWMBy5zlaBHCjHizD99nfYclr?=
 =?us-ascii?Q?4uFBr/cxkRm/m8p3gk3Lm407dEqe9SXUzxhPiNUubKCYqcD5pYJpz+MboGY+?=
 =?us-ascii?Q?18hYSAEHYgh+iJy3AAU+E+0ky1TRf0vldlUeUNsdv4TYv4l25UicIQuDKN2b?=
 =?us-ascii?Q?bwdUUorJ95ZfgupkiYoSKu7W?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67232c52-6dce-45ec-bac2-08d91c80cef8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 17:49:40.5326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJSwhoMq3WVBnMs0xK8Dsi9qjpQob5LHFAJ+l5/n5WCWVCN04JGVguGr+PQjGwv+YuC9rpzGh4fEGVo9qnI1riO28kJmykq1PqkkWMlLY/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5911
Received-SPF: pass client-ip=40.107.8.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

We are going to use fleecing scheme for push-backup, so that
copy-before-write filter does copy before write operations to temporary
image and backup job copies data from (immutable from backup's point of
view) temporary image to actual backup target. For this to work
properly, backup job should unshare writes on immutable source node.
copy-before-write filter should do write-unchanged operations for this
(they are really unchanged, as source is a backing of temporary node).

So, let's detect fleecing scheme in block-copy and do write-unchanged
operations in this case.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/block-copy.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 0a9c3692bf..1a9db5794a 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -418,6 +418,7 @@ static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
     int ret;
     int64_t nbytes = MIN(offset + bytes, s->len) - offset;
     void *bounce_buffer = NULL;
+    BdrvRequestFlags write_flags = s->write_flags;
 
     assert(offset >= 0 && bytes > 0 && INT64_MAX - offset >= bytes);
     assert(QEMU_IS_ALIGNED(offset, s->cluster_size));
@@ -427,8 +428,15 @@ static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
            offset + bytes == QEMU_ALIGN_UP(s->len, s->cluster_size));
     assert(nbytes < INT_MAX);
 
+    /* Detect fleecing scheme */
+    if (bdrv_backing_chain_next(s->target->bs) ==
+        bdrv_skip_filters(s->source->bs))
+    {
+        write_flags |= BDRV_REQ_WRITE_UNCHANGED;
+    }
+
     if (zeroes) {
-        ret = bdrv_co_pwrite_zeroes(s->target, offset, nbytes, s->write_flags &
+        ret = bdrv_co_pwrite_zeroes(s->target, offset, nbytes, write_flags &
                                     ~BDRV_REQ_WRITE_COMPRESSED);
         if (ret < 0) {
             trace_block_copy_write_zeroes_fail(s, offset, ret);
@@ -439,7 +447,7 @@ static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
 
     if (s->use_copy_range) {
         ret = bdrv_co_copy_range(s->source, offset, s->target, offset, nbytes,
-                                 0, s->write_flags);
+                                 0, write_flags);
         if (ret < 0) {
             trace_block_copy_copy_range_fail(s, offset, ret);
             s->use_copy_range = false;
@@ -485,7 +493,7 @@ static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
     }
 
     ret = bdrv_co_pwrite(s->target, offset, nbytes, bounce_buffer,
-                         s->write_flags);
+                         write_flags);
     if (ret < 0) {
         trace_block_copy_write_fail(s, offset, ret);
         *error_is_read = false;
-- 
2.29.2


