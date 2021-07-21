Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFF33D10D8
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 16:07:44 +0200 (CEST)
Received: from localhost ([::1]:32812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Csw-0004tc-RL
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 10:07:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m6CqA-000254-D1; Wed, 21 Jul 2021 10:04:50 -0400
Received: from mail-eopbgr80105.outbound.protection.outlook.com
 ([40.107.8.105]:17431 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m6Cq8-0007Ca-Tq; Wed, 21 Jul 2021 10:04:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LuZeFNdkrTr6UhcvH0W1dPJ85sXS/kw2UjY31Cr/7Fw6/w3CUD+WsEbf6ov37cUa16w02B5XY5/niPTx4IfZLmb7uEKojxOWy2gh4wkWgRN63u8rdsRzLOThDAFYpzPFdzrzGaMOE/Bw9be9wGuQSejANjT46dHB0FdYmp6BKy+Dw7KrzDJb+xuyT1Io9hyn2/iMh2itzguN7r0dOGtWp3Lmw/tnPbQpORJMGHrSNsOMdYzeBwYlB6eztUtRA/EhhM5KdsRkHiCNoO9vrixYQjtlTOcHz8pCPykx+IJ0wm/g8yHbbmbZyU87IVUgELlptKoy6yix6gvqvp89p+8Q2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7NTIygQ1ANSTyO6aSkYdm0tyohisTgZcvOTuKGhE9M=;
 b=XLOJaKjzAVl6NFdRJklgdcFZFWjBKiieVYtVx8fdMrPTMVyiN1W/05kr8CdFJLM8ZhQhu9Bvqa009QgIrXRjHdxVBERZRJe77Jd+YxVihFXc7fWFfEdNPluuZ+10NqubNw2IOzVmlMGFeobHVZ1IQs0qTIz5WvDcjqkd2jfIEKyVUDZQjxQoDMdb5DlbFZ0FKq6sgRlKoAmWoawImeUQuc/MR8kvbhRt9QmDxJFusJolS3Jr1J9bI+skbwr7xoI4Unz7DQKF39lO4gUWn0S69pGWJ/pTakhw/J4dacMBdgoIsg9IHgtcOa4pdiAvyhWZMrJODq8zb87VH0p7ZwSLpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7NTIygQ1ANSTyO6aSkYdm0tyohisTgZcvOTuKGhE9M=;
 b=iDNcTdQfSH1cieVedds8EBKcDEntDZxkRVNyyKzH5uyJqOenSZpcAY4TkdcCUvnNY9U5Chbxa3WBaZKrOftPO/tG1qGOV0C+fLLB+PlCGEl9TIo75MXKlWGLpix9NNhNFzW2RKjyy7VM3oqfeDAymX3rLsbJJsgE4uwlY4uYkoI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6374.eurprd08.prod.outlook.com (2603:10a6:20b:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Wed, 21 Jul
 2021 14:04:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 14:04:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 xiechanglong.d@gmail.com, wencongyang2@huawei.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com
Subject: [PATCH v2 2/6] block/copy-before-write: require
 BLK_PERM_WRITE_UNCHANGED for fleecing
Date: Wed, 21 Jul 2021 17:04:20 +0300
Message-Id: <20210721140424.163701-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721140424.163701-1-vsementsov@virtuozzo.com>
References: <20210721140424.163701-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P195CA0016.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::26)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P195CA0016.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 14:04:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bba2d1a-b0c8-4485-114d-08d94c507c62
X-MS-TrafficTypeDiagnostic: AS8PR08MB6374:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB637480EC8C480837C5B1F5DCC1E39@AS8PR08MB6374.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:31;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bYVS0MHZGwVwONXxvJ7uMCoqZ7a+q2+Jl+eaOR8t5+GfiIM5zmPOjrFr5UfsCqxym3xBs+8M49i3aHOLD0D/3UmHB58bWcyjgzq5j8HNFqeUCQMXo92k9fz8+RbgXLO7BUSjgXeQVeJywLgkRvTFP21BpJYu5sDdH51umMRFO4TBCsgQuZon/qrc9CcgzTIXXtO2gHIuWap3mWbbg6xcJNIKrjkR64h7qT4X+IeQwS/kgfRxOxgKJJHYDXBmgxUlUozlRAnGxWd2eyDf1Ga2RXm6QnAz0qcMidzMcb7h40DhBrrqN7e5Y2LnCRLiyoaWQP4bjKVcAJwyeJYlFHI7y+8KPDq6d0BlGXFFY5qad4YUB9Ax4+nPJvukJ/hPO/00xRXPlHAyd58itC4eQ89qrtirtxaxTfulthf399GJNoBfroExKWxA2GOVr/mo1fYol2XeT3sE0pX4qh/FKyVvKchPqiSMRVKqiaoIAP1LtHuDkxNPXcuI1/ATeuC0FsHwWQBC56Ap6X8DkuzrWUSCJwOsutr+LfNN0S96M5xGiVpjL6W1UL1Z0FJOrNpXhU4AAgodmmN/u08SOwqezQ7hhdh1p7KDTfXhv15+XcfdYgwMRQ33gqZUK5n999wAqUfMOUIG44mr+jqpTLWq3iOWdrNCNi4xHLD+cfCkt3Yws6ZNMYTd5ArIa8EN8uE4JzYWNQ/wxUvF0WZBMT67QA1BUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(39840400004)(376002)(38100700002)(5660300002)(52116002)(38350700002)(2906002)(83380400001)(956004)(1076003)(6506007)(6916009)(316002)(6666004)(66946007)(66476007)(66556008)(478600001)(186003)(4326008)(36756003)(6512007)(86362001)(26005)(8936002)(8676002)(6486002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mxzhJ9FPbHORfsX4foCr7iXAJnCigHD4rBIRMeCXmnfYra/Neoh6jpadlm9h?=
 =?us-ascii?Q?donnVKk2/wgYStFcJG+Uaaw8lFpDw1nXww7nMI7jYb8WA6pK+qW6oXzbwBUh?=
 =?us-ascii?Q?Q+7h+IoweOvKfNusXcgw4GJ4hPXKh8oPgHAaQDHiLFdtMXYv/46M19pLgs5b?=
 =?us-ascii?Q?bVsKPi8jU0w8DRLWKEGnU5b/Qs/nIHavyMmRYnyoQYMxwYL+DtzCylhGuXNO?=
 =?us-ascii?Q?wAKkzjyf5OY+bV7wktk91WjxrQyTaHu95vRIuosBdYNy1aZFdE/hnaCoewU5?=
 =?us-ascii?Q?nn/Z9PCzMuvXQlt9PxJYxAgIuW+ZkJoArqel5eAa6PxavJBDZLblC3zxXSZd?=
 =?us-ascii?Q?9LhhDd/vQmk/sdIXRi1ZIRVMtD9yD1wc0XjthgeDChveU3YM/jRkeFtkmwO9?=
 =?us-ascii?Q?ruCLLttuHv8Xr6ftRng0CrF96am80bwxEd0HtgjoRYlWImr8oNamW73oPWgs?=
 =?us-ascii?Q?lQC/KyGm1sM4z48I9mo79ynHpkHYVhCqrcaT0zuQX9eRmSFMGpZnCsjUpzTL?=
 =?us-ascii?Q?F87Xg3ChzCqAmDJFYyRH5DdOG1pufQD7E84jyg4FoyL5mNuy11BuI3l2DLCA?=
 =?us-ascii?Q?KWY6Hma16l6L/5oCcTK78dHx9PgY2XCdZo3CnSpmVAWaWy/YSASdJg2QjpqF?=
 =?us-ascii?Q?Ekd4TdWVpH7+Fckc8M9mEzV7uo/Ydg9aqNJI9/DOJ5AgduNTo4CbrXm8LOpF?=
 =?us-ascii?Q?f3LLHdf5b6V17xV+Ufa3D+er5uTYRBT51Ia74yKuMHfhgeNAuMk+XuLRRLY2?=
 =?us-ascii?Q?MaAXl/KZXOi/FAnnf2KayXMbapdrvQKKJ3Q5BcLSNn6GZ150ikUSIqVnd1Ml?=
 =?us-ascii?Q?uRHp9ygPPSyieTZlZ+94uH1HggMgDUnWZDzX6FLs6exONy41BK5diuy8pmYL?=
 =?us-ascii?Q?B6ZGwi7PPB9ug6yZvzcaotXEnSsi3uVtupE1IQI0EzVeut4LUFUQUTIv/AHO?=
 =?us-ascii?Q?VjZiypIQNAp2i6LP+kdqNFmfy4XiEzHJw/eqYeo0Pnp9fVuPMQ0DQKF9gdF9?=
 =?us-ascii?Q?PDvrN4dvy4tsVVhg2DC+uCly39VAcyzR6x+JyQ732FSsd/aLXX3z5LNDso0K?=
 =?us-ascii?Q?zL99wlDOu0ShFlthaEJhBfPaBrFPMdHMUpYIz49qu3Yd5VRuN3ijFuNeGU58?=
 =?us-ascii?Q?UTsXlavugvbSC6YQrCfl8hAadPIjD00ARRnZolDlpwryTEwZsJelxWFdZQPF?=
 =?us-ascii?Q?fgTpOyh5GdNTPtNKsPG/XqwOW5nVUX5PFCZQn+9Xoh4FjT+WClAOIie06ZX0?=
 =?us-ascii?Q?N9MQyzRR8W06Qz0gAmk2WoQ1WpWjxh/edSDBzFm12pCB2iSSJaIH5qg0/E37?=
 =?us-ascii?Q?yST73xqk/Bd3yisI5K6Cotkg?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bba2d1a-b0c8-4485-114d-08d94c507c62
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 14:04:41.9095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1BBzBL1Y2k7jWuHk6nuh1Nu6LFLFYdW1LL7XEpsiH4hJv3wSK4gNBbHmMKlpvjB/ags+ePtjmMFKiyBERjKKpxw4gQBfDU+dPvGlKQ2zCNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6374
Received-SPF: pass client-ip=40.107.8.105;
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

Now block-copy detects fleecing scheme and do write-unchanged
operations if detected. So, let's require appropriate permissions.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 2cd68b480a..808e8707ed 100644
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


