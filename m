Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A255F2CF69A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 23:10:58 +0100 (CET)
Received: from localhost ([::1]:49334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klJI1-00055j-Ls
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 17:10:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1klJFc-0003Ik-3U; Fri, 04 Dec 2020 17:08:28 -0500
Received: from mail-eopbgr10108.outbound.protection.outlook.com
 ([40.107.1.108]:31004 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1klJFY-00024O-Gp; Fri, 04 Dec 2020 17:08:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6+DgrhgIin5ij373SOdIC5fSPQ6b4EAWqAl9cPJMS71vDfUYevvTchliejznJxFyUTxPdSesgew+UtRWqOfNlvna5TF/NI//4HG/48Ta3UpUVDVq39kuCJMurctOl9YJJXL4tlUZsyrKglefm2HFOkcORPl+2zJQbzTXaXefLnQVeaQNzd/rXu16nFaf1e+glnOfazczIUx3rMOOAkmab5Pth5rD0ZjhY0+ypE7NYoEzFaMAIifZNjuulH9JJzHB2CMW/UReh+4+nz0StfJ53hSXbsh9Oia04436ll/+2C//gYdu4nRmpfbYOMW6iVj3eRlF6v4fg6f7SnTWQykMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4bZTTtpjUIkb0CyXuXomxBOD7CrwAEwDdzwDi+DR1w=;
 b=Drl3fbuas8OVbPFUunqfRRaAAEESthakpO67OYtub5RspujRL9Kvus3GT1oQZ7TTKMhLp1TOqxPMh2Gu6NfmiUfxVZcIzPgft3y3LDmZ8jAFMeJymXAwAbYBbnxnHpFByG6tYImly/uNjJcAPrxEtrr+NpsSozC325qnxS4pSc28Ox6QY1bu6e14SA9OZQUE5MVpLo6f1YCQfuaHfQEUnxUs/cBgfssTSGZKz8GwvJZEUfmpPLJjjB/Pqolm9ihVTzchDWsflWL5KbNm6ewzGg4Y4NVJsKx21DdWLCkCZpeatZxylh6At1YnQ7hZLNrk7/tkVnb95sGiJtBZ3L8UgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4bZTTtpjUIkb0CyXuXomxBOD7CrwAEwDdzwDi+DR1w=;
 b=wZ148qA2GI6lMsFzEFTNwbT57LqWv4eLsRsxUw2LkGrApkoM5n0qwiJaRv3AQUAk9frTgExyTvmiYVG1xWZj0WIviUeSS8+NwkmN6eWeodyrW5QGT9Frz5lk5rDY6uBF95wMyRXt2+/IHYeWETydZ64YNKWKgxcatGolcoDHaks=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4072.eurprd08.prod.outlook.com (2603:10a6:20b:a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 4 Dec
 2020 22:08:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3632.021; Fri, 4 Dec 2020
 22:08:14 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 jsnow@redhat.com, fam@euphon.net, stefanha@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, andrey.shinkevich@virtuozzo.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v14 01/13] copy-on-read: support preadv/pwritev_part functions
Date: Sat,  5 Dec 2020 01:07:46 +0300
Message-Id: <20201204220758.2879-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201204220758.2879-1-vsementsov@virtuozzo.com>
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0701CA0003.eurprd07.prod.outlook.com
 (2603:10a6:200:42::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM4PR0701CA0003.eurprd07.prod.outlook.com (2603:10a6:200:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7 via Frontend
 Transport; Fri, 4 Dec 2020 22:08:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37c47736-e605-4682-9384-08d898a1189b
X-MS-TrafficTypeDiagnostic: AM6PR08MB4072:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4072798B7B5BC29EC88F22D6C1F10@AM6PR08MB4072.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wwE42GA/A6pF3SDdAKHw4Y9fU/IV0AcOwc/Rak2Psd21l8SLEoLAHZcv5aQJMsSuj8dKW797iFHhmPmvc4b/8nbun0mDF1V8CzEXeLSXhKBRyEIn4jb3vpCFkQCkLZMO+HYf/+tTqkaT/RPn7QpuO1JUALl/1l2H6zneS9/oW78GCxvHHLWsGchzHS2qRFJzjeUafwZQoavf0hl41TmtHrfC5xkW/Cs+w+/QBb5Yc6AGc/07nJVOsOAbZ/xZBBwK6eqJcHFsLH5CkoN1nmKHMyHcJQ/x+pKWiL0eJSXDrYIcJWuwFOQ6SbqPTEZJMpwXfAEhv6w33Vcpo0DvLL8YZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39840400004)(136003)(396003)(8936002)(2906002)(6916009)(52116002)(316002)(478600001)(6512007)(6506007)(83380400001)(2616005)(8676002)(6486002)(956004)(5660300002)(6666004)(107886003)(66946007)(1076003)(66556008)(186003)(36756003)(86362001)(16526019)(4326008)(26005)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?E9pQE2jCsj+VwMuj37psJODJcrVCid4PTsUx1yBD+utd7+UrBfA5k2QNMDbR?=
 =?us-ascii?Q?ZuXSOmImrJIgMC82zAizM2a+8ABCRZoqgq5Lg1E5Tqpt5hGiEsDftHQDFQ6b?=
 =?us-ascii?Q?ify9+SPbE14ZpZ+E1/sNDcgreSNya4MPbdVPOrJNyzdNc/n6rVJjmxuivSqS?=
 =?us-ascii?Q?lyK/Dmuc9GZ/BZOAxfkKghOt6OAF9sltHmObbYf7NV+W2cV0RWjW/u6Q9kdC?=
 =?us-ascii?Q?zMVSJqHV2usM7S3EfY8Uw8P0sbz2sIxkoYArJBuPvDuKmiIporTj+fg3m6uO?=
 =?us-ascii?Q?FGBiEDJlPyOinhgSAR6I8BVNi0CnrYkIqNlUXICnExb27zU1ziWGiB5IPqdn?=
 =?us-ascii?Q?H32DbtsELztKJeg7TPSV6IuCCWdTOGp3XPNIQo2450cQl5/D07jVSRvBxTuY?=
 =?us-ascii?Q?mM/JGigWg1qHoCPs0CIcZyZD56tS1Wc6kftGmrs4KwoXQThENsf4hxKD8hnP?=
 =?us-ascii?Q?CzfCstU/oIOljnYqQMZmD2KcPAtfTxTWwIJ94IixqF5pKMtd4ocFVXROuxoJ?=
 =?us-ascii?Q?jKzLduGJYc+BrrVAyp3jjE5jA2AbSupWJg52NjcJorg5qqOcQHCO6c2cEBl/?=
 =?us-ascii?Q?1JkmjHiGUjwY2JHHzQsLIiZFWh1sRIy5cFKGYaTCpemynY/b+T/YacFkdYKJ?=
 =?us-ascii?Q?rKHf8TKe3ZWxOdTS9esbOL65falZIrIzsbw9YjZnAi30LkDwhPXg20BRgEzN?=
 =?us-ascii?Q?xL5ye0H/yDp8NhjpAFULX0yun8tUPUIuXvmsMF0kq5exJCJY4D8c7e8KJVuU?=
 =?us-ascii?Q?Oh3xdIZLCvWo0RDAriyOm6EEz5WmNiGRBBvbkNXK04QEhbr73x9OxpoKqnwT?=
 =?us-ascii?Q?glC29/hHU/iR1QqjlipYJCYI0gx1Yq30KEhHCFKEU7CxzbrpPa0q/bnMLtqW?=
 =?us-ascii?Q?OOH5p4ULekD7AIfJ1b5E/a7rDurtP0yvwfBl/8C3aoTvhLAOxBgNHce8NpKt?=
 =?us-ascii?Q?XczRujA8OsxAzJQOKeYqDcStzhW5uOIsvYU1JaW1jP9IUxPQ25/bEDXkuRqz?=
 =?us-ascii?Q?QHvZ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c47736-e605-4682-9384-08d898a1189b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 22:08:14.4832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gieD5Ef6AVf+9Id4yVXnI3TUjYPc4pBZWUbrPDcNjq+c2UwOnr9n2NBHdHlx62Ta3cFIDTUtDd/wQqQ0zmMu0xW0um1LLP4Lz8zL1t6g2Aw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4072
Received-SPF: pass client-ip=40.107.1.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

Add support for the recently introduced functions
bdrv_co_preadv_part()
and
bdrv_co_pwritev_part()
to the COR-filter driver.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-on-read.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 2816e61afe..cb03e0f2d3 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -74,21 +74,25 @@ static int64_t cor_getlength(BlockDriverState *bs)
 }
 
 
-static int coroutine_fn cor_co_preadv(BlockDriverState *bs,
-                                      uint64_t offset, uint64_t bytes,
-                                      QEMUIOVector *qiov, int flags)
+static int coroutine_fn cor_co_preadv_part(BlockDriverState *bs,
+                                           uint64_t offset, uint64_t bytes,
+                                           QEMUIOVector *qiov,
+                                           size_t qiov_offset,
+                                           int flags)
 {
-    return bdrv_co_preadv(bs->file, offset, bytes, qiov,
-                          flags | BDRV_REQ_COPY_ON_READ);
+    return bdrv_co_preadv_part(bs->file, offset, bytes, qiov, qiov_offset,
+                               flags | BDRV_REQ_COPY_ON_READ);
 }
 
 
-static int coroutine_fn cor_co_pwritev(BlockDriverState *bs,
-                                       uint64_t offset, uint64_t bytes,
-                                       QEMUIOVector *qiov, int flags)
+static int coroutine_fn cor_co_pwritev_part(BlockDriverState *bs,
+                                            uint64_t offset,
+                                            uint64_t bytes,
+                                            QEMUIOVector *qiov,
+                                            size_t qiov_offset, int flags)
 {
-
-    return bdrv_co_pwritev(bs->file, offset, bytes, qiov, flags);
+    return bdrv_co_pwritev_part(bs->file, offset, bytes, qiov, qiov_offset,
+                                flags);
 }
 
 
@@ -137,8 +141,8 @@ static BlockDriver bdrv_copy_on_read = {
 
     .bdrv_getlength                     = cor_getlength,
 
-    .bdrv_co_preadv                     = cor_co_preadv,
-    .bdrv_co_pwritev                    = cor_co_pwritev,
+    .bdrv_co_preadv_part                = cor_co_preadv_part,
+    .bdrv_co_pwritev_part               = cor_co_pwritev_part,
     .bdrv_co_pwrite_zeroes              = cor_co_pwrite_zeroes,
     .bdrv_co_pdiscard                   = cor_co_pdiscard,
     .bdrv_co_pwritev_compressed         = cor_co_pwritev_compressed,
-- 
2.21.3


