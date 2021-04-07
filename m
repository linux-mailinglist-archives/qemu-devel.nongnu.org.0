Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 191A6356ABA
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 13:01:46 +0200 (CEST)
Received: from localhost ([::1]:57582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU5wP-00044P-76
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 07:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5iY-00069y-U9; Wed, 07 Apr 2021 06:47:27 -0400
Received: from mail-vi1eur05on2113.outbound.protection.outlook.com
 ([40.107.21.113]:20888 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5iX-0001Tc-6j; Wed, 07 Apr 2021 06:47:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUsW0Ol/VGj1E+lf+D8luuvP+wCVLq3h/JZZ+nQ1eLWgkhM+oH5TzO8MyX2x/kSKTDOouhlAlL6tY1EvafiiN1O7pH8P4QEEaPEKfL1cSidHIAWWiBnQt0vArmmP01EEznuhHStyrqL9xYp4xDug/uhv7shQlg3oHFRWlF79GpLqsMEfD6v3LWB/ktP7MOnC0LtxF7l+F1I/8CXxDHANJa6CS+zKz9Ng7soP1pYty6ELbdOJ9BwI6i+J+GhLpaY8kHlh6ZsyrpCzgsMqBMZGeMOo0TBKtTS5cUH5XtGUyrnSQ1+kqKShTZ2aOmKKW87sjU74m3h21fgx/eYr3o2XsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6SZZHqPsEPW9RvBHOdz4qCMzqv0gizgGhoHY22gZMQ=;
 b=cvVcVndwSI5BPU1LINvHgpXbUtIpbkaK6ARPIUc5gp+z3EQLFGsQFpah5R74Be4bPc2cbnkP7QMHWMoE1z1Nk6Jy5RIvEAF+++IxiR0KCMw7j+sGf0mW5Dg/YCN1j4xyI5V+VHuzBjT3JKbrlf4EIA+nh9kZ7WFrDSoXYHU9xqo9ZfDfPEZ8yg3p0YMzoox0G4Mt6+O/g9ZtDKcpOrE5Hl71A/ij/k9qVlbgxQwV2qV1PQYoBh7k0zjh7SzdVWwFyP8mmvGi5Ihn50sRxsB3Egih45ZEtyoTjtjnM3MKGQZIFoyLVU1GXuJvC/JMl3/zFobDSC6ovTuuNSfmG83Tkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6SZZHqPsEPW9RvBHOdz4qCMzqv0gizgGhoHY22gZMQ=;
 b=aBCrJo9RWLxFZBUG2rU7th2FNi5nnN8v5rIXZliJGIrdjzTJNMepOmi3Ep0la5lQpgd0gqDx0XAUUlQuVTab6ASREwB1B/e64oBHSONAXwvMyg/hAQuDPjpQck003bAgv4v2OdNjL5Q0l0GqbCNaASy0CvBKmvaXLsIq0uwafJw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2452.eurprd08.prod.outlook.com (2603:10a6:203:9f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Wed, 7 Apr
 2021 10:47:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Wed, 7 Apr 2021
 10:47:15 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, rvkagan@yandex-team.ru,
 den@openvz.org
Subject: [PATCH 13/14] block/nbd: nbd_co_establish_connection_cancel(): rename
 wake to do_wake
Date: Wed,  7 Apr 2021 13:46:36 +0300
Message-Id: <20210407104637.36033-14-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210407104637.36033-1-vsementsov@virtuozzo.com>
References: <20210407104637.36033-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: HE1PR0902CA0021.eurprd09.prod.outlook.com
 (2603:10a6:3:e5::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.206) by
 HE1PR0902CA0021.eurprd09.prod.outlook.com (2603:10a6:3:e5::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 10:47:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2da6843-5507-44ed-b7e4-08d8f9b281ed
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2452:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB24524D1FBB03E978DD1458A0C1759@AM5PR0802MB2452.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:422;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fAGjf7q+ehbAF28W2iICHVOneuXJc9fLRPNb/JYdbzL3pYOGG51LzyytDvG5mb6qNIPdi7+YP3Ih+eQ8M8SSZ7BaCGpMrDmZxCnnXBlgjKucXZ9N57iAEN8Un+W44iYZ8+CIaCh+VjQmKvOiXWfSE6HGn8HnvfCka8C/lByQwvHtXXLu5JtQT2/GcOoBcu/l6RP8sbUtkkx9jKMqUF0AsRh5X+9kn3GNx2QiBXGsI36qFI/7+QA/5czvkaU2G//1SvcOwLtPaBsT/9wWOmjJRiB0X9ORS8CmBdKRNgZ8K3Nh4+jyY1ZQwFlgo7QqH/ApjVsKS83FZL8C4DruREACfG3lhDWPlfwxMo7tEsGFn0P9LM61rV6jW2fn2aO1d+nkuG1+bRFkir74xt+ahX2Z4hTeePw9FFPOxPlzTE8VPHHsO/SfUNuRRjrK114F4w6LQ5GauydY6FCPqTqUjAHfUjvzub30AzkNYgmlODYdg8NU4AJx4QqlKU/yPua7nK/Vajfx2Usoj/xeGNkLs/iG16e8qdw1PsCnssoFiY6B71zs83nWzSJ9KO1C4VHwkM93gcwoIDY90QoXLuCPIjWcPu/X+/eO/RcCQmcjyfruyKWKQPFbFATTACmhS5frvs0bJhR5k4ERBR67CbSiIygSM86yt1jpQGeDpC9PDS4m6vP/5HUF130aByuHpguF1ke2kb5wnfG8qRqn0vHOrGJD/YizRQNh/tOPOhbbI9Cy/Jo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39840400004)(396003)(346002)(376002)(8936002)(66476007)(38350700001)(36756003)(5660300002)(6506007)(4326008)(69590400012)(956004)(66556008)(2616005)(478600001)(83380400001)(8676002)(316002)(6512007)(1076003)(186003)(66946007)(16526019)(107886003)(38100700001)(6486002)(6916009)(52116002)(86362001)(2906002)(6666004)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?aYKz/GW/sjVOp6YGAC9ISCS34stfmxTWWeBrrjEEt40YTp56TQs/EBMtvZhS?=
 =?us-ascii?Q?h5LjMj64soZ+0TZLtyDlVQ7E0AlZCpmIOYAKcxMqA8uka0307gFOoq/C7WjB?=
 =?us-ascii?Q?ic7Wio/WCVzLUFW4rtgGsa+pUKYnafyB7tesXLOcwP6qoC7Mi0U376xCWwYV?=
 =?us-ascii?Q?YH9shm2sYbkUUHYj9wPfk4+5Nc0hV11038xHy5wCet84bFywoQKjaury9SBd?=
 =?us-ascii?Q?y8FzwMg/yLDfREbP5AZbWj0f/QlIwnxBVbwd1QErkC77B+Z+18hrz3u8uT/p?=
 =?us-ascii?Q?gi3v+oEtrly85x3mlKj9xemphmScntQJsUrurDSAHVzSKi5lpl8/iYDYKNH6?=
 =?us-ascii?Q?cYD0AVPBveYzpeO/HkomtmTiKF7UCM3PeycpFH+dbH2TSSDvjKgOQvGbayoO?=
 =?us-ascii?Q?9dr15txHrG1R6OTcc39bv79czmu+nasN08U2WOf60B4vH2AjXbYZXs3pWAAW?=
 =?us-ascii?Q?/IPHVc3Pwwc0i/L4FB/Zquvxq87iLSHvd2R2DHYIGM+WEmLDezBtCPn0UPUN?=
 =?us-ascii?Q?Ocmsa0HvG41fMhtA8rHGfuxBXYvhLtRg0pj4QSj9c5tJ1TXtvwLQ2otVm5YZ?=
 =?us-ascii?Q?khUfltXcfDGfpLg3H3FzRdhukqnZb4sRizw9EX/6D34FBy2X0C81j4jjY+mz?=
 =?us-ascii?Q?KQcuhMormTVJbwuq5+mLKMIU08HFO5BlkD3EuFTMwIjm8MoeqXsAJB64tQTf?=
 =?us-ascii?Q?ffXOv44WI7RG30v1YRglqSwsts5qDs3IjtxwwEn8IPQvwNPQt9LiTykTdLeb?=
 =?us-ascii?Q?1sc8xNeeBq30o0UwX41lxYn0Ga83aHRnUJCm8BF298mno04Ze9BKB5lF3Vqb?=
 =?us-ascii?Q?jTZkpFhlada29P1rkyu//P3P1Ae/pltEkuTDeP+SIIv1WanMi+PI/L3ppFJX?=
 =?us-ascii?Q?huEC0tL00xiR/tMW+vQlS3V5++ISzM+5mI98ZKX4NTMhxV81ZBM6BrkZQa57?=
 =?us-ascii?Q?6YYXLJoMsi1TOyV9IRN0pqq4PtPFIOp/VGHKYAycwwS2zQB7jdhUFUHB2+dr?=
 =?us-ascii?Q?4A0YVTNCn3//iOPmW33jOFcorlXe8qlZ3+2ceViPsRrRnw47cr/+nsL6j+D0?=
 =?us-ascii?Q?p/qzL2LF1xw/Q5UWnEp+3OAoalccXis/vjo+OVQ5d+WFYPeAsFLC/+i3BZA9?=
 =?us-ascii?Q?BOpSvRQQXc4+nmhpOb1hih6A3qCTmnvJI/yqy1DqCz3LYpOoAGppgPK/6F/D?=
 =?us-ascii?Q?b5GkHeIqjW3o2T4Lnx6TvRM8Xc5PWVBB/S64qwzET2SYGo0GObPAgjndqQLy?=
 =?us-ascii?Q?xpriybmJKloPZnV2b3IwQ00yujfGzQteNnnYDmDN2UniFtxa0pBJL0sJYPSE?=
 =?us-ascii?Q?NmfsADdEyoC/ZV7AB+zhc7E8?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2da6843-5507-44ed-b7e4-08d8f9b281ed
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 10:47:15.4828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HDARqPbu4zSQVruJw+MpdCfP9gTxpQ7cNeqirSuVf5Zijpgdm6yBRpVTKPAuo14q/LpzH1pP6PYx+nl8VGwisU74P0tx89FnnSh9wzXb2aI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2452
Received-SPF: pass client-ip=40.107.21.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

Rename local variable to look like do_free in same function and like
do_wake and do_free in connect_thread_cb

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index f0319d2256..9cee5b6650 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -501,7 +501,7 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
 {
     BDRVNBDState *s = bs->opaque;
     NBDConnectCB *thr = s->connect_thread;
-    bool wake = false;
+    bool do_wake = false;
     bool do_free = false;
 
     qemu_mutex_lock(&thr->mutex);
@@ -510,7 +510,7 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
         /* We can cancel only in running state, when bh is not yet scheduled */
         if (thr->wait_connect) {
             thr->wait_connect = false;
-            wake = true;
+            do_wake = true;
         }
         if (detach) {
             thr->bs = NULL;
@@ -528,7 +528,7 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
         s->connect_thread = NULL;
     }
 
-    if (wake) {
+    if (do_wake) {
         aio_co_wake(s->connection_co);
     }
 }
-- 
2.29.2


