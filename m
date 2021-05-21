Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DB938CCB7
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 19:51:45 +0200 (CEST)
Received: from localhost ([::1]:54626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk9JH-00005A-Pa
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 13:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lk9HU-0005gu-Lf; Fri, 21 May 2021 13:49:52 -0400
Received: from mail-eopbgr30105.outbound.protection.outlook.com
 ([40.107.3.105]:26486 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lk9HR-00065R-GV; Fri, 21 May 2021 13:49:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DkRq1KEyvrEfHYwi7KDhxAFHyzR0mScsK4IeAlwuLouxKPY0zzjqXqNXfS2Tz5Nh6npbr8MhalgYWFj03/9YmYieAY8nGlv8NG238IbCV/aK6CIHe61HXAz3PqDmDsp+znYazyfWi2RYSjQ7HOooDA0qbRz+922f/IHijcsBHI/yD/5+/ISTy14exO089itNJ3M7qdbDurelpfbLPgPO9tS9O6/ZIy0ZU9X1O/oEO5xVPjovqL5xbY0Rwo8QsF2PdoLFC+rLrNjJUdtW7Tn8g7jFW8ZkGvZ3YEjXgP7QQGNJS6C6qd/ykiICFMl3Y5QACIDr47/ghU9YYfTWbq9RRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6JgL9X/WqGmE35fU0zMf/+FjcQtGghxH1Po1XKoeUYE=;
 b=V1dz+Zxmc+F8d3abH3B0jRU684Jz9kTuhBWKzC6iBU8KN1YEti+maYmlv7ehTRfRGH2q7g0q2/xRzTdVL8gwOwGsRf36pG1Bpj1bb4RWycPxGF/OrxtGGlpza+0J0IO6mhKu0wnSTLygGNmWr35upVre0Bi7VZZ8e58LKU1B+4Bo6qqH20Cm/M2h2QX1gSG1kLd5Z62+lSoBPwrGQfkOkg9mpv06fg0X1xB5WD52u7ALqoiIJ9iKSAqon8wQ61WhXEe3V62ukW7Mjw8zhtBfTJb4FnKOu14Z7tvY1gI2Mn8lb+rHePs6N8Qax50P+6ZhumDTEEqsnsD2qNcchgLN6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6JgL9X/WqGmE35fU0zMf/+FjcQtGghxH1Po1XKoeUYE=;
 b=m5RwKVp//OMJRettpiVZBgzaY+1c0mNQOHoKic19xW2jtKwXSLxnVKGr6BNv9/dLVZ2Tadd9F20plQHTCWD8MRyx7LauFqQq1wIS+23tM1oQwf5Chsyp675Qfn/k1nWG15ZxhSwCRQoI9IsvN2o3iOrGu8sTOxKQHax3NZv1o6U=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5911.eurprd08.prod.outlook.com (2603:10a6:20b:292::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Fri, 21 May
 2021 17:49:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.025; Fri, 21 May 2021
 17:49:41 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH 2/6] block/copy-before-write: require BLK_PERM_WRITE_UNCHANGED
 for fleecing
Date: Fri, 21 May 2021 20:49:21 +0300
Message-Id: <20210521174925.62781-3-vsementsov@virtuozzo.com>
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
 15.20.4150.23 via Frontend Transport; Fri, 21 May 2021 17:49:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24ce52e7-fe14-49c7-9725-08d91c80cf9b
X-MS-TrafficTypeDiagnostic: AS8PR08MB5911:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5911FB5D7E2C18A9DB28F8C3C1299@AS8PR08MB5911.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:31;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P4vYgVMpQtByf2W37PszazfbmxyhqKL2fas49TVocqEyIlhQq4mAtK6O/93LxTlYuz8088sezoj19YRPMwwdMPjX5fgKWeK1bmO3bn+CUPLKN77CFRU934maKGAaqbyVhrRo4RVh8K9aK+ck5cuRKe6BSaiOoNcXNOfG1HbnxurdjvINIUUvOfM+jpXaFLfi7dXWMk0JQbu2bTmAXhx0+XLz5pmBcY3vMMMTqWSFMh4Srhd1Jtoq0+1erBoPYyxTQQBkZYo0z6XGRxRTpSeKJcS+w/tCzmfG7Tkis7tnKeFoNMybty4hNpmx0UX0oemejecEEw1JoaKUrUOMf7sok+fTi6zn88AjJrxF7sjSoWAjU5rHBzlIxv+XLet85FoODNQ+d74PrtYCbBfkChp1uxIIg8/XBLnWlIlEtNLBza9GRim034G296SAudjef+OTMf8NU3wAYyDK3Qby5HnhgjfvnvYmA6gmQTimEtTPtRQYxh3N59eVxupQEK/RGr+E+5GQ1fhtcc0jsaRY2Bj43V3jSZeTM0u1rA/T9zT589Tk/teKJzVGi6qXVS2G99bEVVTileuN+20OZZePWSH5jVG7IdG7Q8BOzudYzaftDa29ChtMUNpX3Bx1tlEhjodUNxvug/JzfPDjDcDVjduUbZE9Rny/9orKmONzGVQI3QIxLRDCoV/y/qUoK67cyeBv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39840400004)(6506007)(38100700002)(38350700002)(6916009)(6666004)(86362001)(52116002)(478600001)(36756003)(316002)(2616005)(956004)(4326008)(8676002)(5660300002)(1076003)(26005)(83380400001)(6512007)(8936002)(66476007)(66946007)(66556008)(186003)(2906002)(16526019)(6486002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vizy8y7Pb6TQajEmrpmIv7rax3I7P8TfiViRrjSsWOxuxaMLmmioRnIdC+YR?=
 =?us-ascii?Q?hAxfwcJ5+cbc8OfvD2JP9tcj+USf+uRLr0cqLyZ8QFOq7lMg1Ew9tQQaSQNY?=
 =?us-ascii?Q?f2M0luUfN1LKSWxpQQs2a77cHyZqx/AWObnf15zDxf7OO0v+yw0YUwfwbCxN?=
 =?us-ascii?Q?GLi/CYdpg8t98cblOJhp16sDSh5ZBVTE7OAkYgYQ16VRWINVZr8cJTP1nE/P?=
 =?us-ascii?Q?wf/djqwxyWPyGam/C2onQOKOrKFMt5qXkkMz2tBOzveIlv28yE2gZTL2pk6H?=
 =?us-ascii?Q?DC6ZGuRVuATCCpWIXZvHcZrAKOZ3maQopLOadnsNbXS5AqQ8YzaaeA5ZnYVW?=
 =?us-ascii?Q?Es+lzY5NfPZ48KUo7iXpth9Q6dtcAsZ5PpmgzEJBoiRj3ToenSQ67AcEUFyv?=
 =?us-ascii?Q?yu8id2M8DOK6Vqrrac0CitdzxaWwVIc64AW9UYyUVl/qJ/y0irOLShzLm2bl?=
 =?us-ascii?Q?8l5C3mAQ6/QPKIFF5fhBPJWMBQEBo0Tf/2dcwkOvd9TK/642Ub9XrhNX5rD/?=
 =?us-ascii?Q?bBiiQ9ONLiPa1rD87twBO8QSwYjHmALbKcJVARruwN3akLyrLGel2j7xHz1P?=
 =?us-ascii?Q?cXCZQ07INPahXT9ILzkE+ksDrLteSJ5ImY0vRvGcSjB3z7aRe4y3vYJA/PN3?=
 =?us-ascii?Q?Tbk8zd3KIvTlN46iXoZjgV1zHhp/twSOmdfltZKOFqoDjpdDXy2VlOqeAbuR?=
 =?us-ascii?Q?1SlRPAC6wni9rHlfyV6mvcuX6MsEMNmqAkb5F8lOblFb79OMcu86F6KYbwT4?=
 =?us-ascii?Q?kIO0lH93H/dvXiGbBy4dy5Se6vnrZi/4//5jomHNoybretmcx8Jd5Cap7v3v?=
 =?us-ascii?Q?W7oC8pkwm6tMCnAKrKnr56RbcvCfiCz4/UluIa7tKtscmWnSBIoPnAbnEHZG?=
 =?us-ascii?Q?+M+Q7JDoigcCy+YeWeitcYe7eqFvEq/uhioVFT4S0huok6qUz9XNDBUHtGIs?=
 =?us-ascii?Q?uOegZbbfzUUULY1wpafOcaz9myg2rffOxAuH2S0n6fag3vhyy2bYFijr7Izb?=
 =?us-ascii?Q?fgW7Ze9u/m53xGbMiBO8qrF6TmYlTHzRcNfGkOki2OaOY+r4U8S8Ulkc8F/q?=
 =?us-ascii?Q?oZcwZ58RqA3W6lwbUJ28lDuFkrCnIOpXDvWD+Lc7vzYPAIcK8Rx1PsT0mjU9?=
 =?us-ascii?Q?WGk0FlHW7dBmzgRpKHWN3418Squw05sPPOV1V2rKcXtXGaucJ+oC/76bcMOh?=
 =?us-ascii?Q?ijluclfwQ5rcUpKNiKP5mYLkCbfgxtsSqdfybxQko7zaaeulNCD0UV/p3uGF?=
 =?us-ascii?Q?v4bAe/wM41oTh/xCLfEftMcPBBmwEoogXckMxqkCeO3WWuV4CFlA72c3v6wW?=
 =?us-ascii?Q?MS47g0WYTPL0oak7xGtjUoC+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ce52e7-fe14-49c7-9725-08d91c80cf9b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 17:49:41.5830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GtAETvTPhrHTo9JnADeMaDhXKF6/CU70kJN9GltJnqFA/aQhwYSYEyj/yl73NDT2Kkf9MFzEPWHmO6GNVg+9Ci9fwHFK5gYu83GXp0+lT70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5911
Received-SPF: pass client-ip=40.107.3.105;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

Now block-copy detects fleecing scheme and do write-unchanged
operations if detected. So, let's require appropriate permissions.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 6ed5bce1f1..1b104545bd 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -113,6 +113,14 @@ static void cbw_refresh_filename(BlockDriverState *bs)
             bs->file->bs->filename);
 }
 
+static bool cbw_is_fleecing(BlockDriverState *bs)
+{
+    BDRVCopyBeforeWriteState *s = bs->opaque;
+
+    return bs->file && s->target &&
+        bdrv_skip_filters(bs) == bdrv_backing_chain_next(s->target->bs);
+}
+
 static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
                            BdrvChildRole role,
                            BlockReopenQueue *reopen_queue,
@@ -129,7 +137,8 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
          * only upfront.
          */
         *nshared = BLK_PERM_ALL & ~BLK_PERM_RESIZE;
-        *nperm = BLK_PERM_WRITE;
+        *nperm =
+            cbw_is_fleecing(bs) ? BLK_PERM_WRITE_UNCHANGED : BLK_PERM_WRITE;
     } else {
         /* Source child */
         bdrv_default_perms(bs, c, role, reopen_queue,
-- 
2.29.2


