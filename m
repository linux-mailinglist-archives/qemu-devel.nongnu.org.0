Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCD9400C1B
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 18:27:36 +0200 (CEST)
Received: from localhost ([::1]:37482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMYVz-0006JZ-MR
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 12:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mMYTZ-0002UB-Hp; Sat, 04 Sep 2021 12:25:05 -0400
Received: from mail-vi1eur05on2102.outbound.protection.outlook.com
 ([40.107.21.102]:64544 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mMYTW-0007MU-PN; Sat, 04 Sep 2021 12:25:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5iyp/HBfDl1k3M6lgRbGyXi5wfFQnScK9HncYQ8P/BuTZsEM9b3PCwBjUDvOMQpZ7VOXh3JDjvItEp+x0FTct/oHCDUdnRV/mKcGazlOsRl2gt/5nrOzAHZCqKybjIiRaUUie8wddIRuITWuPlvCBA7uW1doyHrORQvUQy+fzqZfhoiw/Jiz4WHEpOrQNiCuUDQP1MWWgXLZEFOY+PE9REma5eFITb0i9VxXYAY2hw27wVUTlZLmulqQYJB54YSzcx6sZQwmbRlp16G1SFeTHUTvn9qcgG0sDN48gB1rOQgnnDepztO0anfFrDgQPr5o4MBgn7Od75eJwnQ3NsRNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=edNG5+/Gx3BBqfLjoEG7swLq9drCCgu1BzgGL/EUQxg=;
 b=XPfSjrDaBwghUKh6zWJCH1mnhKHPdCH+FaGbu8G7ldcaCYHc70OwnAo4TXYnJDH0Suoej3jj8FP7gJy/dUW07hzNPyDiluH68Wl1WlM9TaGJJCS1X+lBwfxjrpbiiaDgIsqya+2xcpWMiRzUkh3A+Ryqu1NvZhRB8XgAzbEjyrCTN2BKSrXo64/dMBrgy5VGagTCd7CPiS0HgLtOdecf2kzSjn9SN4O6T70z5YOgSdaz3/tCHaNjRofX8dmnnkonzkkJWqlsCcJS3x2DjYItik8/eWHi9W2CeqEefomc9zKy9hceSi4hbpz8444oliZT5S510TB4IJ9qXwVOVwVOjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edNG5+/Gx3BBqfLjoEG7swLq9drCCgu1BzgGL/EUQxg=;
 b=H93JnVy3lS16PlJS7u7xQgVBDXKQAia1eR0iBR6YpjCHkU3TJKbAT0Mx53umxUx52jgxX6YpfjoX1wv+Z6bFKcdG/fhrSnJcymkSQj3Kbrhj2EGD37olfxGpTBA+FHevg/FdEdPaT+kPA0N/Fdre8XppTk8su1xHpB3IEkPuoeo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6904.eurprd08.prod.outlook.com (2603:10a6:20b:394::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Sat, 4 Sep
 2021 16:24:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.024; Sat, 4 Sep 2021
 16:24:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, hreitz@redhat.com,
 kwolf@redhat.com
Subject: [PATCH v7 01/11] block/reqlist: drop extra assertion
Date: Sat,  4 Sep 2021 19:24:18 +0300
Message-Id: <20210904162428.222008-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210904162428.222008-1-vsementsov@virtuozzo.com>
References: <20210904162428.222008-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0275.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:3:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Sat, 4 Sep 2021 16:24:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd52a992-0956-4267-0c3f-08d96fc08727
X-MS-TrafficTypeDiagnostic: AS8PR08MB6904:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB69044226513684EC08BB8F1AC1D09@AS8PR08MB6904.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A70cI7DeJRhfeCg4rOeELNoHr5IwKSkv3v7zI6jDtpQigx/LOW/XQpojfK62EgRvPjL7FdF6f4x+CjvSjIDKNJVH2TpPo6zeDnZk/H5NArg8rI5WwIUW0hgrV49Os9mZt5hsg5Mhc+BJ7d+Bx/xR4zw0uf9ZQeuvOHSdEJplVc1lsDLlfVAqEfpyfSYpHwQ2rRXxmLcLzQaDjP6aEmDd+DHCq9MJfRw1H+TI9PlbPBE26e+QyqPBenM/Bxcb+2keL/4uWA4RsLPVPzsmPKc57F89CsxKVsJ4K6AXP16cVBYhvDmyhkOyK65JMQXE0+UzlmDAxT7/PinwRRGHVRCMI/cPBaQlHQB7bM3NHWLMLZ7q+K3SFbTlhJKbyb0qcRM71OFhJ4XZKJJxcRKVqmIi8yP+vsChMlxuwiUnufGhUrT3sAbdzhv5ihY8PIpAaHj4bJERmx7BiPNA2mlpvskNHJ5/GABr+HDsXyZWi7Wvjzoaor4mYclB+swr6Ru9VzbwK/fU93EZPRTCEhzf2uldlKKSk8LpXAuiOlXwwQTJ3Za2JtRki8OOTvFrw22Ic0TN/UvspYrRY3UJ49AJ8dxqeoB3c1EdnWQnsqhPAxXhur27+16G9fAgcZrKiDL1z0CdWnFcddzIlSaDSmsrUz9OWdCllNzUKsBftJGfBgwaTRAohb+lVOFBS0146A3EJXKpmaa7GA5DIZ3A/InPFpL6xA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39840400004)(396003)(366004)(6486002)(66946007)(8936002)(52116002)(6666004)(83380400001)(478600001)(4326008)(38350700002)(186003)(38100700002)(4744005)(5660300002)(2906002)(1076003)(8676002)(6506007)(86362001)(6916009)(6512007)(66556008)(36756003)(26005)(2616005)(956004)(316002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9XMNDWlUeszVhGbdnip4OXIK8F7y54ybN1JH+76xlASdk9DZhqmuPoKP9HEi?=
 =?us-ascii?Q?Y5B599TS6dJEc1QaIR9mR6exOC1HrI4dRzytswDOJiC8R5UrLpPY5Lm2g/jC?=
 =?us-ascii?Q?VA14ET1HGtT+w0NiX9Y+yAf0W1SzujPp/OKtbxgflw0EJKJDCFsg8I25pXbQ?=
 =?us-ascii?Q?fwOcz7WVd+V+wZmKZ59rENNP8WO+4Y4ZBWUk/go4WHviP7icfgbLm0I1/BG2?=
 =?us-ascii?Q?IyzyDUmBfh1NtiRjaKfgjzkYw7XpVJUr5YsTdRqbuajcavdwx+R+dc3eoKaG?=
 =?us-ascii?Q?ry8PmEmU79MgXhMD0x7gs5QD7F3B7XQH/bDg274l3TyCY3jslKj5p1c7oPo+?=
 =?us-ascii?Q?ip8t6EsjK31pxRGhWR/DokdGKj1YYeYV0CcZknn3sdaXEqDB1hrN+blHCxa5?=
 =?us-ascii?Q?IOEj97g+kQjOMe59SuQsOQXFkMsPRaL2Buig1o5iT5VO/VMre5h7cvFY8GwL?=
 =?us-ascii?Q?gi79uvt1/OR+T5IcXvDsIhGrhwWosLAA8Ejw1fcGHQD8BZS1OkXBYSQlUYoX?=
 =?us-ascii?Q?UuUU5DfM/u35S8cHCSxeUB2LTfhiGc0SajHclH7DfJ408oQJvvCI6lUSh0a7?=
 =?us-ascii?Q?72pOZeil+UAR3WTDtnrH8+FtH1gjGswZeBQpq/3hdT/2rVXm/KEjPrz2Ie53?=
 =?us-ascii?Q?71zveBG2z4P7iAJRNHZVgf2oEDuQZoTYa35fJPHYk8X/vgLZyVA+HyaQzyOJ?=
 =?us-ascii?Q?MZvX/5+tK59x0V4mP7eJIyda9aDjz7W2aMeG07fL2wMT8wOFJt6izHc23JK1?=
 =?us-ascii?Q?Si+hwfsO2c7eYWK6NkxBI3W6NhRhadDR9V4jW1y3qGmRqKK/WkvdzHgWAyS2?=
 =?us-ascii?Q?TMJlNEVHc1rzU850F3vOWV8jpQFka88E5ABEg3bdyWYDvuGy44A762/2qpMT?=
 =?us-ascii?Q?kGIMgPV0/Oy2V2QoMwcCsLY4Pf6x4B4e29CQkoQyayBlNaj+1JmAvh0FlRuE?=
 =?us-ascii?Q?EL5imRnGu7lQscRrblaku7YtU+6D5DasL+nVnAvG17BjVN+0F+8KmkBSlPPF?=
 =?us-ascii?Q?ldkliR1jXGPEfjZYLura2wozl8ogMagqlQecz+HPl51XKqi+Emb+N02b5USU?=
 =?us-ascii?Q?l8tc0P7kRZ63DGipHwfA6Z30VqQ8AUwQ+yfuZOfsJNir99wth+AngGSGW/pB?=
 =?us-ascii?Q?NUzilboaEtn0pqGOXvqHZlirt9MVw9MmUcb6oObmZk9DZZKSzzaKZ58mBImL?=
 =?us-ascii?Q?o3/EgkhqjgZuSViXMZnf+2hwJSbBwWj7AOr9U1Zk+FTM5JlOkpZIBBE0Dduc?=
 =?us-ascii?Q?zbGvZY54/CkDjUWyXMkMgHG+AaMChCZbVSrc3BebHhpIuliDy9xGWeWf3bql?=
 =?us-ascii?Q?di4+WY2Yq6vjMC6LpYjzlWc3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd52a992-0956-4267-0c3f-08d96fc08727
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2021 16:24:54.3803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YxIvE1I1d8BF1oqrpw78NNmHLXd8EZYC/tB7BCFe7j5AFmAw0hKe5Wtl2N9AJU4R4DfcvUUt+f2hISLgAxohJAt9H9eyLv+a6ZZOTp91zhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6904
Received-SPF: pass client-ip=40.107.21.102;
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

We are going to reuse reqlist in conditions where intersecting requests
are possible in the list. So, drop the assertion.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/reqlist.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/block/reqlist.c b/block/reqlist.c
index 5e320ba649..c580752db7 100644
--- a/block/reqlist.c
+++ b/block/reqlist.c
@@ -19,8 +19,6 @@
 void reqlist_init_req(BlockReqList *reqs, BlockReq *req, int64_t offset,
                       int64_t bytes)
 {
-    assert(!reqlist_find_conflict(reqs, offset, bytes));
-
     *req = (BlockReq) {
         .offset = offset,
         .bytes = bytes,
-- 
2.29.2


