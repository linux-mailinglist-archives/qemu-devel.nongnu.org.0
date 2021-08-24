Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C933F5A83
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 11:10:58 +0200 (CEST)
Received: from localhost ([::1]:40282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISSP-00066r-Ss
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 05:10:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRzG-0005oF-CM; Tue, 24 Aug 2021 04:40:50 -0400
Received: from mail-eopbgr30097.outbound.protection.outlook.com
 ([40.107.3.97]:41120 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRzD-0008Cr-NI; Tue, 24 Aug 2021 04:40:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pqnqegrpq2VVdfrpdcUq9uKZUwi+szWx7HOw2CEuEh1sHTgxXm96vXjwqmBqnhoq9mM3kXtKcnaGg5JZ3AzzbKOiaXHtcTUKudozuDJtNtDT+Fl+VqsVSHCllswB4iDdBFSwzkaPU00a9sUI7/4ZMoGMSNpnDB+aEMSePx9JhLt/fRk3RQPjcJNru3uJYYl52fQAlfUB51I5esbmWCJmo1Ikm640vp03fnn8IeFG7bKuAdhyPChpfa/T4aMQdpMeBg8+vLGY3WEZwarEVRw8Kz4tEPK2vGhWJZkC0cqvOGtn+LRfxgrLidlKSkFv4llkYsXVjSk4OSlBMxVFOL1RCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MJJJqh6X0tyOPN5k2fzpZeTLqTuDiYYFdTHsgugpz8=;
 b=fRLVwzHEfGjnx/DvjMvMKiR46AsGRm5oEHtKWFs+tVs8cxZS2WceUr6ZvucAvP6WFp2qtSwiMrAw3KZaxnewp6zxaJdtY20bWTv+7Oy1t3GkkCvseOLHVerKiWmsLvp6XC7Cmvk8J9B3lZNEs46snUw8WfqdFxHO9oQkBUqdmpVyRtZx222T6QC+JwEpvgXNIPIueiv4astzUCBpfVdWjAGF85O0YXxrMcmZ46C2NyJhK9005XWb/NcyGeINjJccJ4ActoaaCsR4yEc9lRF1vsqY4M7Qn0BmdG3xs2482jNTQtmIxbng276KUl3TKoMIKLxCxKfBysPjaHDAA2UsdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MJJJqh6X0tyOPN5k2fzpZeTLqTuDiYYFdTHsgugpz8=;
 b=mk0A9ToQU2liNanOaBfuSPCQzcl3YGqYTNnYzq5nXjwteAG6Jtr8Kd97hOOpqOYGWxxBpBZybe6rlCuAwPj1be6e+FPlPn+CtszOM46SLUu/4hMaQGdycZaM4Ueu1rrgaMiVPVvWXVkZLMIVbdfehD2Af2exxha07NWQi0HBg+E=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5077.eurprd08.prod.outlook.com (2603:10a6:20b:e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 08:40:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:40:30 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v8 34/34] block/block-copy: block_copy_state_new(): drop extra
 arguments
Date: Tue, 24 Aug 2021 11:38:56 +0300
Message-Id: <20210824083856.17408-35-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210824083856.17408-1-vsementsov@virtuozzo.com>
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0178.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR05CA0178.eurprd05.prod.outlook.com (2603:10a6:3:f8::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:40:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e55ab463-4656-446f-5adf-08d966dac62e
X-MS-TrafficTypeDiagnostic: AM6PR08MB5077:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB507772CDEFC530A07E3D0256C1C59@AM6PR08MB5077.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:185;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j+HsiGOPjMz9gV4rRwI7jJSbCkH3vXsUDlpycjwd1BqnXaNTk3fEaIMDCjH/MnJzYvHbuzsdqaBcDkDmJX8JLaNU6Pe5HXzfXH4+JCWSehE2bZmlT1X8ZNcvncf+CP6IdgBzoQQx/szGePOrMKrR4y714aqRUhHkQ6rdVexKCUiCfrc9Ngsa4/SOmJ9sIAwDHKO2JaHXLKwqc5ofjZtKHSqLN4o9vAtt7nr7LbGoLZnZY1YVWLyexOJJKvJTlxiz9TCuZlI6EiKIOTy/lG3s4zz0xS/JZ0687rxDoWrgfIDdBPGJgzyOSRr/nGd3+QmvPGzyklI5+UHcUaJy6WwSFlRKMi/NzVcGFh4eL6PAkrOp18RgAZyVaZudyo1jxMh7O3TR/J9e9BxVSBgduqNpxvqi9529atjGooXlUe05wmUN+EnustFyb7Bou2NsRqQzpnhRVhDREKWAXEmTJDV97QrpGV2+ZU32nXUs/7QzfzyRq+J/Ui28da5wrh2MBwF1bp1xX/6B9lQMVAmsvM4E8PGsjSRR15SVvi39XGOZNd2UST/9XEkNgUkQ63B9Gb2Pj0kCn0Xuokwh1vLKorOFfVpE/szRaAT7VKRLDqk2LEy5I8YffJC1uQqLjGQolFCOPThP9DzQKTIQRRCKwFoRubynuY1A903DjDF1BflCtNcOvH06T2gFMQmXWz37TqTrVqNaWHL1Q9jf6QozGuNJrQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(39840400004)(346002)(956004)(66476007)(66946007)(316002)(6506007)(36756003)(2906002)(66556008)(6512007)(186003)(2616005)(1076003)(6486002)(52116002)(6666004)(86362001)(38100700002)(38350700002)(8676002)(4326008)(478600001)(26005)(5660300002)(7416002)(83380400001)(6916009)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SrH1+7BegGV0v+Gqvrkv3+hQRdSbbivLFzorHqQWzZ1Z4tqJ7ra1ev1+8eQ0?=
 =?us-ascii?Q?oVGlscd7bS2C6hoo8FJ/XvzlYg9bLFsyZIuliuys6aB9mg/O3Y53aSt08B9f?=
 =?us-ascii?Q?WutgRMVSBHy7nagCRI7rZQM/oGshjJNYDDubvHh/zP3lzsa03cJiXZQLu9Ai?=
 =?us-ascii?Q?SWlO3sLw+UUx4nz3jjbMMHYNg7OPsd+XxhatkABoC2k/uNfYnxpT00HqNJyn?=
 =?us-ascii?Q?1BHivh7A/8G+soTskomzMmretFe09N5RkusyVPs+AIKaZCxBeqXFm5fg+aG2?=
 =?us-ascii?Q?sP6zRdYp2tCoBAkwoq3K38QB57xFhyYPWyd6L3mAHfqbCCObo88Ko1/Mg2/t?=
 =?us-ascii?Q?UzmL1aOrNIIM3TeI1s4onkuGZV4w/9Za3ShRH+50Yjemhh6CJVXaT2wuHLFB?=
 =?us-ascii?Q?ct818du+qQs47LzZG+95JBuJWu6bqEGvcYo4iXp1xVlXS/GfSxQTXjG2GgFh?=
 =?us-ascii?Q?FPcqMgi5IJAO7yxaiZ94QFUtZJcQ/SLDC/uycxGe5KgNOZGkcLbRAlNVJIkp?=
 =?us-ascii?Q?7qUwirv5orFMvnUMDswiibLEQ91xQHWqHOgZT+ODTn9/uN/fRfNYFGQ3fpSR?=
 =?us-ascii?Q?eOV2ydEFtYFe3flqN6ccdPv/9I9Dofuf5gVv6DJ9L0oU9aE5OZ2fBqj/4+zz?=
 =?us-ascii?Q?FY+yBoFjtL0RYieRrUiiA0c+gtsH6WV9urWDSD9fI2L3Jxml8EamiO1puG7Y?=
 =?us-ascii?Q?J/DCJlAzzQj2ASLWEI8IG/qhkpOFOlCgUMtrPXxRMZzgysA8+pJva/rWtLe/?=
 =?us-ascii?Q?7/vpA2IF6wg6Oj41SZGqyVRI0JAQD+AMio0VGhxmlTGMtHLLXe80I8v9mDft?=
 =?us-ascii?Q?QqqIuW7Ayk5KBgU6IYBI2VUiVbORY16aNDPwtpgmjcPL6MCZTIbJGqXABVHu?=
 =?us-ascii?Q?NKNRuuw+C9mcbwTW819OwcgNjYvNYiWWa2VLV0dlTJs3zAMFYVgAK7025NIt?=
 =?us-ascii?Q?qGSYLt4Q9CR05/0Fs9T2VoTfldmiLlI7WnnsIEwbmJQYT923kVBfKJM7H/Gv?=
 =?us-ascii?Q?pNWxAydmA44exbUDdBb1V8Y1QJrJ3HFV18M+twvX+WqyLaOw6V8tJI2I0qHj?=
 =?us-ascii?Q?RgRWx+n3g7tgfY2Kd/Rv/yvbfNZAZkPs0xzhcUu5hDd3rfwNg2uMYA0lZTvp?=
 =?us-ascii?Q?PbsZW84RD9MIPoyxWm0WisGue6j7z8lB5ccWNr3eyjUAsrVXreJutDQEDMBs?=
 =?us-ascii?Q?LNyVZl69a53MzkqrJbwFndp1rKGBWqn0z7rC+b1n+pJBYoLZJQoOTGT/58EE?=
 =?us-ascii?Q?cXVQIEF0S6XM8xKDcOIyQGA+ArI+Nasp1G85rMzl3jUEG6tpGwMfY8QaPE1e?=
 =?us-ascii?Q?YDnVeGbdnnCSmxNi9lhbIHmj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e55ab463-4656-446f-5adf-08d966dac62e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:40:06.5457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qp7MadVGvQ36mE0torjEUV2sQFCdmkcFJpaIU5U7P7bLwiOFFV9BBoyGAO0TVgEl6Hl5zRurkZfZ2GTTI+c6a9PMbL9wqnDDamTbpVKa5Tc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5077
Received-SPF: pass client-ip=40.107.3.97;
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

The only caller pass copy_range and compress both false. Let's just
drop these arguments.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block-copy.h | 1 -
 block/block-copy.c         | 5 ++---
 block/copy-before-write.c  | 2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index b8a2d63545..99370fa38b 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -25,7 +25,6 @@ typedef struct BlockCopyState BlockCopyState;
 typedef struct BlockCopyCallState BlockCopyCallState;
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
-                                     bool use_copy_range, bool compress,
                                      Error **errp);
 
 /* Function should be called prior any actual copy request */
diff --git a/block/block-copy.c b/block/block-copy.c
index 975f9986a4..37d804ec42 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -383,8 +383,7 @@ static int64_t block_copy_calculate_cluster_size(BlockDriverState *target,
 }
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
-                                     bool use_copy_range,
-                                     bool compress, Error **errp)
+                                     Error **errp)
 {
     BlockCopyState *s;
     int64_t cluster_size;
@@ -433,7 +432,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
                                     cluster_size),
     };
 
-    block_copy_set_copy_opts(s, use_copy_range, compress);
+    block_copy_set_copy_opts(s, false, false);
 
     ratelimit_init(&s->rate_limit);
     qemu_co_mutex_init(&s->lock);
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 2cd68b480a..2a5e57deca 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -170,7 +170,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              bs->file->bs->supported_zero_flags);
 
-    s->bcs = block_copy_state_new(bs->file, s->target, false, false, errp);
+    s->bcs = block_copy_state_new(bs->file, s->target, errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
-- 
2.29.2


