Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 982C3423EAF
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 15:23:58 +0200 (CEST)
Received: from localhost ([::1]:56940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY6tp-0006R0-Lq
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 09:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mY6nz-0004wi-4J; Wed, 06 Oct 2021 09:17:55 -0400
Received: from mail-eopbgr60121.outbound.protection.outlook.com
 ([40.107.6.121]:24830 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mY6nu-0004Ha-8V; Wed, 06 Oct 2021 09:17:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8HJvSPT6Qe2D5inYH0OEikVUwGrZ2oxYl6jT21y3XsvMSDk78o+uEQOrjf+/uTXsrdcVZuwK+a43BV+1/6TldxxmEKpQaAc5m0775jQ8hUiU6lvnLhzrg9LGMKF0pOnjQ0yQ8XmpGJzSux8PyvbtSnYJqW+vwAFgi5916AbDxgbPMBVUBvq1wXiai+mqjKgs0sxJy3olBfifnWlWS3kemV6vOB1IrNWi4w1fpcxiZLiLIjjyGO09k0h5swBSsn06zMsXbC/zEJK7JwPBd5onp09nLXmHXfXdES0RxvWrBjgfz2Hr+8Lx0tynCHQVFgkj6a/u+3dSMn0ERip+INhGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZuM9hLJL3qpBmCcsiuLJ8RKXFvfSozZ2aBKUZ/EkcYY=;
 b=M37QqMcJ6Wluo2h8KVgQw9ecPLRx+ET9DMslSpuFdGuP33Z2G0jEkSymlL0VMzQjKtlIJurvKUZqi+nsl6Av5L4qDqXQy0vTOkC0gCvKr/BLX792fMSbXyKj/VAVCnbqUTJae3VYFnGZVy4eob6WHzEDF1cH7hjoj+ix4TgEnKjFfIZqW/LQ81RxqiTB5FtoVhX8Ih6BCinQUKxrJ28pa5GTn3+Ilwe2WTkoIqn6QZI+9ke5GCXKfMKdqK7lOWNWM+JKI5B37eSZkNz874SpVKzliBXp1cZ7jC/7oAsyUK/k05/sf9q03NM5qkiOavmU1gnScfx2qcUkEUDlgwCVMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZuM9hLJL3qpBmCcsiuLJ8RKXFvfSozZ2aBKUZ/EkcYY=;
 b=T/Tw5OzrRRJ8yjDoF/LNnn8uW3aCZgVZ8+Kb2mWt+GnPhxRmYn7kazIeZN19KjVt5utG+1EMd7C26I9remMPIR4eLPAmAZVxfDSnAh8oVLmJb4Hqr+zBCvKT+28P8Rqm9+B7dg33boUTViKtBfmVlKHHzrTR939VbNibcmpzG7o=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5910.eurprd08.prod.outlook.com (2603:10a6:20b:296::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Wed, 6 Oct
 2021 13:17:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4566.022; Wed, 6 Oct 2021
 13:17:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, eblake@redhat.com,
 vsementsov@virtuozzo.com, stefanha@redhat.com
Subject: [PATCH 12/12] block-backend: drop INT_MAX restriction from
 blk_check_byte_request()
Date: Wed,  6 Oct 2021 15:17:18 +0200
Message-Id: <20211006131718.214235-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006131718.214235-1-vsementsov@virtuozzo.com>
References: <20211006131718.214235-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0296.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AS9PR06CA0296.eurprd06.prod.outlook.com (2603:10a6:20b:45a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 6 Oct 2021 13:17:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 286992fc-91e7-47a2-109c-08d988cbabcc
X-MS-TrafficTypeDiagnostic: AS8PR08MB5910:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB59109E431A53E84F2D25680FC1B09@AS8PR08MB5910.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pK4msqFzIxw56N1ku+LCzK6jcoNWXM2gI0Ocq5KP72aJ4JaUgo1CxKXa9kGogkjFrWrcbdpzJr+98P0PcFuPnR4ngARWDQ8YOo+MiQrfGG0BXl4dvT9OMaQ4xyglQof+w7HerA6XkceBZRCc1eFY82cJRawIMt66t99TPxXZusetdxYdJqRYa3XKA49djFQA0s/f/q0hSq9I3zBFUmzoG2UL1lWvIP1509dsRR2qpPuZ54E5q+NApZQQqsZBdzJZ0USv1Tsk/CBxzwvl0HTeQ93ff0rxjVLFIi6MDklQIWdS01HIxr9i0/0LIv5JUHENJGZOaex10Wa60ERJQSiJeGXJS3kGqlVb52LvEAQxisuqe6dEhLO5u8vcVtjAbVxpHsUJuu3fxuFr7C9/3jLs13AOJwJ9fjFVIHz+FZedcoCYOn/qx32zGfSiGKif7iGVaeiuhBdkeb8iyZytufSDkTm7rkjX4+6xJ6ZYQaQ+xdC7iViEYOWGGijsBgQB4zLi1bnG0LqIyCa8zPH7zJW9krRtUTTtDnO9wRwCVDDK9czrVhxZuP6fXOOMYo80hjXxhXpIst+QoqmYUZoOtBX1oqg+2HC+IPWVjfo2Jv7qzV4HDVDMH72O9oyuZhoxdUvlluGsS2wa6TjQW73jom0AkF3a2CNgFGuk29Tyae4evlFoMrmSXx7+5qVBR+FOPJOvYrJmd9/adq9MGGqaYdWGcg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(8936002)(83380400001)(86362001)(508600001)(52116002)(2616005)(956004)(66946007)(1076003)(316002)(8676002)(6486002)(36756003)(6506007)(186003)(6916009)(4326008)(6512007)(6666004)(66556008)(5660300002)(66476007)(38350700002)(38100700002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1QOcugROy8L209SU2aEyF67fqGlNxJWVHBTCVuSCh52FIsaYid+vM9P1p1zj6en3B9BSW4gtm7hLZoJ+w5Xi5123deH876IW5u0T7Yx+IDj6o7x9f8xEcIwBw12MJ7YWJGe7cys3ubWMQZCl+gp3083qgBWIDFz+RSymjsLnwA/H1gFS68G5aORM3ASWTynVK3jMkEvO/69tvDHC+qCCb0E3vw2XTPX4b5EHPVOlEnUyWAkY0BjwGuKbKfXpTsSPwM4o1ys3lw5RoE0McIzfcQlt5ZYE7PYQohL6RLuAPYAHdWlh0SWWpBTgmpjxir1ANSOYGBpxzHqW+z5eSWkiuMNMDig4ZyCC4NN/bXmvmM8mXa4CHDitXIkyqWrNwTzfyfHMPpBCaWRz7BD5R/Vsuxshanl33hWm/MUsB1nPb7tynzYtT5v1rtAZFaQlNJ7yCQfLOs2LyZYoZWvCigF0gx7MBIWIzEbl+TmwY703X3XTZAyBahTU5mKRJ/5/uWShuDe4OP7U74kYpODsNcYX34zbGZ1lbXVSAbTcOPBJqmSItYPT+3fGCWboQUflv8DbzThamyYwZm91HJeFIaD9tyvMK9coCAQnpUGewb0MshrQctkfV1KPKnFovuj0TmVRap2CnUYMkU0TZ5tToX7ChRDJX6gKU0c9uohB3QgqWKz/3mnk9ndshzsxjYpiW08hzhqg66dHHEdoTQ8su1jULfVcJvBky4H3hwwFqiAo8f6TGiiLuj/SYtT7/84BwO7R
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 286992fc-91e7-47a2-109c-08d988cbabcc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 13:17:39.4828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l/yvFAc+FMhYD4nXLFpZMEIANZQF83eYReOeqmsWmokdLTQM7fkvwE1/vVGdN2nVJohFUUeFHfWHumbrZvboKJ+HK+qjUoNghtvqu3OPVQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5910
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

blk_check_bytes_request is called from blk_co_do_preadv,
blk_co_do_pwritev_part, blk_co_do_pdiscard and blk_co_copy_range
before (maybe) calling throttle_group_co_io_limits_intercept() (which
has int64_t argument) and then calling corresponding bdrv_co_ function.
bdrv_co_ functions are OK with int64_t bytes as well.

So dropping the check for INT_MAX we just get same restrictions as in
bdrv_ layer: discard and write-zeroes goes through
bdrv_check_qiov_request() and are allowed to be 64bit. Other requests
go through bdrv_check_request32() and still restricted by INT_MAX
boundary.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/block-backend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index e2b363ff63..21d8e88311 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1166,7 +1166,7 @@ static int blk_check_byte_request(BlockBackend *blk, int64_t offset,
 {
     int64_t len;
 
-    if (bytes < 0 || bytes > INT_MAX) {
+    if (bytes < 0) {
         return -EIO;
     }
 
-- 
2.31.1


