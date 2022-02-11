Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E15B44B2779
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 14:59:31 +0100 (CET)
Received: from localhost ([::1]:60226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIWSQ-0004zP-I9
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 08:59:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIVt6-0000ZG-Eu; Fri, 11 Feb 2022 08:23:00 -0500
Received: from [2a01:111:f400:fe1e::71c] (port=25931
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIVt3-0008IF-Np; Fri, 11 Feb 2022 08:22:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTiGtHcbWFkg0CUDbaicGYE4OTgKYRL2p60aerjYd0gYWUndhB7w6a/z5cwGVucbH1uBOzFckRjVDazAptx+3v9Etl+eJgnwaXrE3OJlZdZH60576JgXy9Zv7BDf1FoFukAFm7Ptqzm17DJbPBideAHiW4UsY7Eo7qoqvAugDETAm/CQ9Lj/5xetOM/kNoFhTkSba6g17XQfJUQpKSaNlqCAmU3dzSx27rLzVNwYPbZD0udHH5bw59jiCibjZ5reTUjUsQjsaBPj2j8064v50wn9wOrJHsPxAWxeia/tWSn15b/6mG3PNmgTokwXN3QxNJrvLbglmczP7W6d2o11Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gJsFAe5ACOn0229ao5p9/4VX+0rNyZWVVJPWbR8xKJc=;
 b=HG9/a/n8SkdoQIybXZa78+p7BvkjnNQ73lRRhifg77/97PhAWdBmt5r5fJOFOYFW5TWTyx2vPHlAw0OCWsx8QVq9D4S3rJHB5EoasnKDfNH1on0kFOdhANcewtash8d1yncy9APwGnbh9Sb5O+cRNl9Cs3vwrJA1d+byRhC1BXcoYuhu+9K3YRd+mBCsIeabiyJmpYa2NYSE6S2SY96n1RJe1jHU323/9ln9Ioqs7OeSNi9yeQFthZdDYMXBDZiIA5LnrOUY7QFTPYx4L3esegylU21mJ5hk/nKyZw/8uMNvw76Utc5BVgsZ+yecF3+2qCWgjzquIuTfBFMLev4vbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gJsFAe5ACOn0229ao5p9/4VX+0rNyZWVVJPWbR8xKJc=;
 b=obhD4EeYgEvjm6wQtwHo86RA3vDDYE7up9e/NYqEn1ocMvkJfW1FYTHzhgOeP93WOfeXq3ak8bBc3rpptS0NgZdH9v9GPr45Nh6GkU2oX3LX+0qbOYNb2DRHo+W2T3zdQXFIXmwwGNcMaloqbLwJLbb8RNrSqfMHndkWZE7OKWU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB7PR08MB3865.eurprd08.prod.outlook.com (2603:10a6:10:74::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 11 Feb
 2022 13:22:51 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4975.011; Fri, 11 Feb 2022
 13:22:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PULL v2 1/7] block/nbd: Delete reconnect delay timer when done
Date: Fri, 11 Feb 2022 14:22:34 +0100
Message-Id: <20220211132240.781958-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220211132240.781958-1-vsementsov@virtuozzo.com>
References: <20220211132240.781958-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0601CA0048.eurprd06.prod.outlook.com
 (2603:10a6:203:68::34) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9ee0039-06e4-46bb-287b-08d9ed619a93
X-MS-TrafficTypeDiagnostic: DB7PR08MB3865:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB3865B86035E2501C0BB95E48C1309@DB7PR08MB3865.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0n/QMdtmFxEaR+jTn3WZV7Jh7ZgVozmWY5xeZvHW5poExaW+5Jk1tAJpXpGvXyEvJr5E72y07jQ7cKNjhn+LPSYP2bdN5BirYnFNC0Jq5PlhBC+30Fu4tpBKWmOfess28HHZTWGU7veI6JnthReLJrDPGFWakNdHWvB4THDZm7hWKH80vtQAfVixKV/c0u3LEDjtbB/BF9K+7sbZKi7j80cNVk8NPl8eesXCGTzvLg2myelPv5rkcw3JlBozapW4/Pu1svgsZnQ98MXBFE0Jf7zLVH/+nQmLn6jroVoS1X8m8R6zx19c4lrLyDf54tZ9O3eZMErUgiJ3ATAFlbUteZ9tZVPTJ1xTAweh80x6S09DTe5su6K0+68EQ6NhdDh0Ru9y5LSG+j4AXeoPfhLwP3hnvbOmknhhIXBDJqetcZO/j7UNo8ZjplqZL2LjfNmABMJ1Xm28vvNwlZ0REDeTev5f5F7QUuukkl1rKYJb2AuJFBnOHqpX2H2wI/dOxdNXXHiEkG9egLK0KX4N+o6vbMm8GOaixQb85snlaop/ag2/6ZlxglvoOaRnYxs/836YNwXicZHcUjSvRtOzFY12sb9f6xecsdtJQAYQ41NcRzDe+xmQLzHPW9aXp8qeNarE76vOSJM63BqV/0hyKNnt91G6FQ5UVdiBa74AUVLf9CCVUUupMx6YEMjr72mUpvCMlrZ6M3fQX9KLvyoFWn7UMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(6916009)(2906002)(38100700002)(86362001)(508600001)(38350700002)(6486002)(36756003)(83380400001)(52116002)(186003)(26005)(5660300002)(6666004)(1076003)(8936002)(4326008)(6506007)(8676002)(66946007)(66556008)(6512007)(2616005)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LMrmtAWK5WNj3sarUfBn1djtCnw+6cJJlh/UnCd0YIOYgOYZF2Sm9J9u+gWj?=
 =?us-ascii?Q?F/QEL1jhWhREncwRhk5tlTLfhDAGLHmLCefgWL8EkjEAhcCVkD5txDhboM63?=
 =?us-ascii?Q?n0LavuNmPepBbXigi0GfhpCsA11B5Ug7bCktT6U/N0539xfbeQm8bN3vy23Z?=
 =?us-ascii?Q?cvQC6VJLsx4+SDoLARap0RTp2Tdz5rV62W2Tr/4I/JIs9l9sn2OEQyE96Dm0?=
 =?us-ascii?Q?eGzziy6TnHxXlRA8CQNSYArz2npGsmdPiOmExUhKZW08+V9QaNy3qTX6IA9A?=
 =?us-ascii?Q?OaQ8oujWW667NNEqmLPDv5KcV8H5P2077npW/pTK+Tevwsg5mU1FgwdVfLvL?=
 =?us-ascii?Q?DDfysOcqbOgxCM+x5Gqvp6YpJ1fqAnr+cT42ufRhtngQhOpCeXszUsQtMOFn?=
 =?us-ascii?Q?uSuG+/XSUjp2Vsg/uh2VAwLVRWdt+rjhXQKjR4KSh7J7pPjkxjJGQpKsNUXI?=
 =?us-ascii?Q?iw8o6gh9LiLW7A2ae0HRwe/05jBspWPC2ubgRXAobSH7Pt8j12UFA/0BCOQt?=
 =?us-ascii?Q?aqAnwR9JFG2mmFYHcvyrLuIlOaA/FZ9K3e4zQZjcTqYuEDeruwv8gX95lamD?=
 =?us-ascii?Q?ODQkPBEo3+OEhsY8uh7l4nEgtZISDSf6yGBTCIoWFI0Csqu0h+GkOEVeunIz?=
 =?us-ascii?Q?Ct0/Dz6l9PMo4dFTZFKP18ixj6ZJLfoXICrnProRuVRYC1gnA30R28PdFXRp?=
 =?us-ascii?Q?VBqXyPh+J56WZKtPbuy2TIRK6qODb6P4bjvBCMRF9XDcGwTocCitHeSzuXZJ?=
 =?us-ascii?Q?qAnyAskZIIR+ZkU8LnVvgdRZaUUVO9UclP8TRQi8r3ZkcKJ2rVlZ9hZBvIC/?=
 =?us-ascii?Q?SWQR+3t8wmGZhokmudv6d9R9xc0NEijgVLvvRUPvebXaGUMLeBhe2OIqKbT2?=
 =?us-ascii?Q?HTxapYaCgWEWUOcpkCcOp1Ud4s7j+yccPHIp3nbHVsY71KaUQJQZb/sKFi72?=
 =?us-ascii?Q?wnPgiolj9y7jidgBp7Mk2TV0kJ7UuKcBsc5kl+nCSCi3BCULUA7nSwwHkRyr?=
 =?us-ascii?Q?qYRt/VmPfHDn5NW/EWGFz5BAS+onfJTinbFgJLGvA6VhPpYZ6AK9IxpoWgmX?=
 =?us-ascii?Q?EpNDiAudvn/MBZrnSg2cJCaiFitQywrW5l5aRYfaF7zLBNq+GMKax0HvJb86?=
 =?us-ascii?Q?X3RnMu4Mg+JUevSzMr9nMInHVpxpBt8nUaa6AKPaNgFB8zAL596pamHlMoNm?=
 =?us-ascii?Q?HUND6zXy570R4+DGfSwHEX60jtGjxGhUlwv632cqu+xGA8mbm6et7DEnTk4v?=
 =?us-ascii?Q?pShJYjq62HBPihsib/3HVCr+cXbeofcid92UHhrASX7vUJXyHhu5+g7w67qx?=
 =?us-ascii?Q?gCU9YhVDZIZhgLWl6g5JqFIGp4UmcbfdMDIoTF/hyl0EOlQbLV8BuyDanLwK?=
 =?us-ascii?Q?mMy3irGepaCTQeNRyebSE7kdBOxpjGKk6WgghTw+9W5kJIScMdcimedr0BNU?=
 =?us-ascii?Q?caIoCTaAcp8R8dCgLwDqttRHoIfwFM4UdqHNmFWHIvBzRoQQnFA0w9rvRqHc?=
 =?us-ascii?Q?hJ9N+n4SgmM9rJroVdOSoxg1yTfBoG+7fV2hGCu+Pt2hDHiWx4hxN+kneSZ+?=
 =?us-ascii?Q?uZbiT8u5rU+umgMGd3Dd/3t2b+VBrEU73VLn5UUG7vzSXIAEwAI/tA2jonBE?=
 =?us-ascii?Q?I868jgtaa3iBQLtbaCQjwtJB0qOMZr7zAvykks4h4+DUYm/4wBTqYejo/N2P?=
 =?us-ascii?Q?aj67MA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ee0039-06e4-46bb-287b-08d9ed619a93
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 13:22:51.2768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JS4QC/f8Rh3LAslCPhx0W1UOfLpQQ31SXl6TXtvFHfTH5ggQgHLEAHf+W8MdzOJ9jpTdcXBo31+hb+7B0extwp+o9MyEUjmF6yCn7l5wXXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3865
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe1e::71c
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe1e::71c;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

From: Hanna Reitz <hreitz@redhat.com>

We start the reconnect delay timer to cancel the reconnection attempt
after a while.  Once nbd_co_do_establish_connection() has returned, this
attempt is over, and we no longer need the timer.

Delete it before returning from nbd_reconnect_attempt(), so that it does
not persist beyond the I/O request that was paused for reconnecting; we
do not want it to fire in a drained section, because all sort of things
can happen in such a section (e.g. the AioContext might be changed, and
we do not want the timer to fire in the wrong context; or the BDS might
even be deleted, and so the timer CB would access already-freed data).

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index 63dbfa807d..16cd7fef77 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -381,6 +381,13 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
     }
 
     nbd_co_do_establish_connection(s->bs, NULL);
+
+    /*
+     * The reconnect attempt is done (maybe successfully, maybe not), so
+     * we no longer need this timer.  Delete it so it will not outlive
+     * this I/O request (so draining removes all timers).
+     */
+    reconnect_delay_timer_del(s);
 }
 
 static coroutine_fn int nbd_receive_replies(BDRVNBDState *s, uint64_t handle)
-- 
2.31.1


