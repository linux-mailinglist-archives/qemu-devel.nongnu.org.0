Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E033E423EEF
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 15:26:24 +0200 (CEST)
Received: from localhost ([::1]:35296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY6wB-0002O8-Tw
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 09:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mY6oG-0005O6-0h; Wed, 06 Oct 2021 09:18:12 -0400
Received: from mail-eopbgr50102.outbound.protection.outlook.com
 ([40.107.5.102]:17182 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mY6oB-0004EY-3Z; Wed, 06 Oct 2021 09:18:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/3oAsrjuB5n3F6G7JAXGzRR/pgmJKDX0ZkxgTvlt+u48ZpGIYeKer+rB8uJg5f32YAqAigeSKRbaous1HvxbuURhXNMV3LmHzPOLJM0eFqHXp8I7L/Mez93prEOhMkm7jClQv0wLQ1lkMXlUAF5BwNjG1Es8KmdSOJLCT1tn9t7pgK0S6g4aA9Z7FTuJ7ggHqWTCuUD9ONZLoCShVu7Dtj3i8Bh943oGDEU/OxP4tgk5qyVFaMjuYZ3YPNMom63DLPYrm+RcJc3IsXTjvWnAzy8YxSuGq5Hv+/YJqQAyc76qmMlw+Y0iPDLJxNSJT/efTLc2rgZ4iPbaFX0/xylGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MpgzPHTXn0GiFIB34lWgQF/+mJ+ruAc4SKaSh3QDUa8=;
 b=ihyKtopF3xOc5zy20h+nTdqGIE2cBq4H5Ulp8HffxQxjeNjJBuTT3esBUwpWi+G1OwLRp6CzJK4J5DpIWsRkEi61yR/qKgMOSv0Ofn7ULMaFhEGvEOsG935xcGg3XLlBODT75dSdOxQgN/9C8oVswviFYBfreLBoNqL3tbki2fgatwQ5oPaqtg7UzqbdMkJSukjvvb7jUaL4ukzyJaQ0oRKodNT1LATEs7HpL2j4iRe4OyFk6jFY59ggh4C6NezavI9/OxD5qtvx8sqdoFMeaIKDeOWRA2O1KdTbWgnIeX//uK41mWZZ336Lk9UyPa+0j2cXX++7CpKGVtw1tTweTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpgzPHTXn0GiFIB34lWgQF/+mJ+ruAc4SKaSh3QDUa8=;
 b=fzVwkMDOzSG0b1BIMgWF4f+mNFiy0gC/DjgFkczmxESMFk7Dt2BjOIz3luKncbcQvgo/6j+qi2cTJQStarxj2dxd7z1DR7GpeIsm/j2L4qhTRFdcXrC2nzYx8H5eYc5eMriZq7gYrUugD/E5YIDKlxZ85cvoG5LWFr46aOvPJY4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB2981.eurprd08.prod.outlook.com (2603:10a6:209:44::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Wed, 6 Oct
 2021 13:17:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4566.022; Wed, 6 Oct 2021
 13:17:37 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, eblake@redhat.com,
 vsementsov@virtuozzo.com, stefanha@redhat.com
Subject: [PATCH 09/12] block-backend: convert blk_co_copy_range to int64_t
 bytes
Date: Wed,  6 Oct 2021 15:17:15 +0200
Message-Id: <20211006131718.214235-10-vsementsov@virtuozzo.com>
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
 Transport; Wed, 6 Oct 2021 13:17:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0c58142-fb96-4f25-7a7a-08d988cbaaac
X-MS-TrafficTypeDiagnostic: AM6PR08MB2981:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB2981AE91720D7B719B07D50AC1B09@AM6PR08MB2981.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Odue5eopjwJ5j97xDYWRxeoUaYfw0Zj5VzTi7cQi6/iCmtqqIcx7IxTTGs0ABdFBcWiPYahsDYKUm1CKpcYzTAR+jr11+7T0w05A81JEHO17/rxJMZL4AxQCJijfgS9Oz5mx5eMI8nfErbVKXZSdABD8SRwQWP9MDOfEdFACwxlyq2f5JjXayh6dMcbyKFRuazsfYAu3HrhtoREtXxsft2F0kowTrnHEekuHnDi8rGonKKIHSJtQ1u6C7Po7EoCjd2zf59+Q8CfCwAUKmPxv4iWo+gJvCZkOr1A4DJGxbTKvEz3XNd7oELFryJocbKmwlOtTyNDgVcPCul8NMBks/uT2APUGDxsfjIb9WP/AgBaJ3TZ83Iy0jhIssJdihxjrOEQPYq40CbepBSXNIo7bOA9CVhJcaIhHa985dJqryGMjqSwSWPtqgvkdfguvUGY1u6G3QMMPyF6+QVxZjgQCjnLE3mzZThrsmPLxa3iBK5IS+qh+y7/BK3l0ZjJnaktX9YmWHaGFhfoz/IQGQRAosSMw5k/bwQqcbMdaHHtXGD5yW3jYLuUOD+ADo8f+e6GfoVlJcp50AfbLJCl7KNoFeEFY7elvou8ZWyClTT4hNcbsQi5o2+HG9ZKMmY8hCh6zMVpMaUR+3qzpd/Ntl2UFhH5UrMBWPQtk1aIyBa5WGyAq+g2Hqr5pzUi85E9BBagnokDSINePTt+mGKTc3luc+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(2906002)(36756003)(6512007)(6666004)(83380400001)(38100700002)(38350700002)(1076003)(6486002)(508600001)(316002)(86362001)(6506007)(6916009)(26005)(52116002)(66556008)(66476007)(66946007)(5660300002)(186003)(8676002)(956004)(8936002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fN+qK57602FSvK7xvG39lAXa8wOBoPns8oR+Sw9Anpj+g4c+G25WjEjuyg5GhOwdBIweH6kFrZXqirOBMxK0NRQDlhEu3swwtbuOPXvyOIUPaMNzMsJgyF4FgMQM0ZTkOQdyvKCTCu1nKCVkujKiTs5zI5bkRQzdONHVPjf8reA2Jb1L+H71dOZDBut2Tf5AU6nDrIQshd6wxcoair9CVv+iFLlFNHADJkG4CQ0cQaiRzD2Hjd3S2GKqFW2RD6YOAnB7uq0C4DyKQukEpPbBBw8Q/x/SLpQPIrqkijIpNwLeMcMSRs5wg1z/RvS8fDJf9KQJq/Mz49HFlb/GW5ezBvs2DJfKCHHEeJ7MTMcUEbr4Fty7qEC9aR5JSxDpCB0xERwzhNTJSSp6NzeqnzreddPkCJ1fnY1RKWWJ7ml1IsK5fONLbhbL61cex6kXnw+1ofZgF8xtIS1m6MxY2tFnx8ZWu02+f1Yo1CeVip67lEE/bLGLjBEeacqR0QEm0VJb4nokD6SaiArVzS7tygmbX1lGLFHA3V1bJ2fjwsmGe+0SovvVgkiS3QKjcxP217vkj2nYBjoK5rUrAS59kDNodzyKph+/Bqr+IQeUIgz+KdU9CJoqMKShi1D9riPmzLGmGrQA1tNnN7quqOqZwwSLObjPM1ehrw2KKbJVo6c1vC4umze8OvvCPuw7hHED7F4K6s1gZE7f6RhHwzjXw4wYgFg5xFHHCc+EbhTxX+J81yoLvd38vJpj/ryTYKSsOXct
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c58142-fb96-4f25-7a7a-08d988cbaaac
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 13:17:37.6150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hg8Eu48WgunYUI5gn7e9NzYFSuVycPbAq7MyGCYoTRKsEUXfU+6JiKXNy3snyKmmXQOZRFIftoh20cI6RZgTvOnFFiZ39B3iNl0jYgrgWZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2981
Received-SPF: pass client-ip=40.107.5.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_SPF_HELO=1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

Function is updated so that parameter type becomes wider, so all
callers should be OK with it.

Look at blk_co_copy_range() itself: bytes passed only to
blk_check_byte_request() and bdrv_co_copy_range(), which already has
int64_t bytes parameter, so we are OK.

Note that requests exceeding INT_MAX are still restricted by
blk_check_byte_request().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/sysemu/block-backend.h | 2 +-
 block/block-backend.c          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 69f5cfb1c5..134c442754 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -269,7 +269,7 @@ void blk_unregister_buf(BlockBackend *blk, void *host);
 
 int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
                                    BlockBackend *blk_out, int64_t off_out,
-                                   int bytes, BdrvRequestFlags read_flags,
+                                   int64_t bytes, BdrvRequestFlags read_flags,
                                    BdrvRequestFlags write_flags);
 
 const BdrvChild *blk_root(BlockBackend *blk);
diff --git a/block/block-backend.c b/block/block-backend.c
index 018684a203..f051ea00e9 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2412,7 +2412,7 @@ void blk_unregister_buf(BlockBackend *blk, void *host)
 
 int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
                                    BlockBackend *blk_out, int64_t off_out,
-                                   int bytes, BdrvRequestFlags read_flags,
+                                   int64_t bytes, BdrvRequestFlags read_flags,
                                    BdrvRequestFlags write_flags)
 {
     int r;
-- 
2.31.1


