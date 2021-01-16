Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 719CF2F8F94
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 23:02:53 +0100 (CET)
Received: from localhost ([::1]:47484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0tem-0008MS-H8
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 17:02:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQU-0005Lc-Jw; Sat, 16 Jan 2021 16:48:06 -0500
Received: from mail-eopbgr130098.outbound.protection.outlook.com
 ([40.107.13.98]:5600 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQR-00076Z-RK; Sat, 16 Jan 2021 16:48:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJhlxidn6C/TfCOWPJ5CxOwphhylC1YtCF+hMjMtaRLDi23HlOtEONtz/4tbqUeV8TEBaJnkmfC0LGWb527eL+Vryd0o15TsjlVzjJVgUN0TryGXOpOLZmlfmEGMvjEPWaypElB/8FX1HgZW2LP0AhzBQ+G/HQiFmvv59Cx0PQmKgEQ7F0gbBOd1HUvB2866aq9eW+k1S8QvKV6zkdNHQKDBLk/Q7l2e7geExiU1yQyKZgGQNNIYCWoU0Lc39/aMghl46BGjHKorPXVPji+EIgRZKthv2+koaH8PDZpKKvSMBpmaSY+3XAErFFvQcoKyTG0fDYvweboUJrnb8s4eYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CW1YHdYQda0mAU/fTq96VzrduzfY52hEQu3RMqU+f5M=;
 b=E9bgpAAUWO1EVx6hviWp8m4Vw0M6O2YJtxUNEvoJnjQa5N71jDT4OWc3/umy4da6MuyTnqcQzL0bIEe2B4V2trOa2BYMk09PiSz1ElIjfU5T2ecI4LUJfdIwpykKKc/cJf+m1PjB8HWzeqrHFnJH6qXc0G//MICYt6CF1GSD5QJGtCZAVmPgUkwQbybC2IIHThYqIPKjBmoW/44WNSO/5ZQSj9EevBpD2zI3iTDWVp4xlUcrdbWvrci5EAXWVThoN2Ozye+j94W8RUqErJ3D/yTFFlyc0xVc0UJKh8/9iue0y9LCtZRZcFcV8YG8uPXUGprq5dx82mNBDHI+stC0bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CW1YHdYQda0mAU/fTq96VzrduzfY52hEQu3RMqU+f5M=;
 b=P4QTtEq94nZqMxzCDkFlwdJ2bg0cD7mqmZAafwdvq3cwr+L2bRRWyVJlvFKigT5bADvztzhgvsuLBr9UZ2k+YFAvSsV7k8BJNP0FkW7gxOwE2WGkekhaqbgzRajjuh/0Prpb5tGILeaUVaWsP5r+6LBVBdgp6IC8EWUTqfRph7U=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2033.eurprd08.prod.outlook.com (2603:10a6:203:4c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:47:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:47:59 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 19/23] block/block-copy: drop unused
 block_copy_set_progress_callback()
Date: Sun, 17 Jan 2021 00:47:01 +0300
Message-Id: <20210116214705.822267-20-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116214705.822267-1-vsementsov@virtuozzo.com>
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM4PR0701CA0005.eurprd07.prod.outlook.com
 (2603:10a6:200:42::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM4PR0701CA0005.eurprd07.prod.outlook.com (2603:10a6:200:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.6 via Frontend
 Transport; Sat, 16 Jan 2021 21:47:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abab4069-a25a-4b53-8779-08d8ba686447
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2033:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2033545324ED6321A07090C1C1A60@AM5PR0801MB2033.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:52;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6T8FBYMEHV3lrMkK0U15xgVlgabFi2Fyr5urazV/I9G0RKstfutH3BeS4EUwjgRvOob9yzK93PgZ7mzss4BlFAKZNJx+gv5HIkXRYCzJ0h1GR77x52/MjlcPXI2+TJIcu3+THFAVBwOWiV1411lykKrJFPxtlydGQrJx3Yh3UJGk2NwafozzNxvTg9x2kQiREu52jFP+QrUTX+x1PCO5GWQ9i4n84oSbG3KTd1pfzQAdUoC03mIUpAZq29HUxyzazQKHsDEtPcfPDLO/GMGm4lBFKMuk2RkCo1C/pXgtsitH5+TqhpFCUjhg+95SRu65cf7xpceODD3fUmMFx0jG6ttH8e1SekuMjxr09d3F4jAJ0j2dLEgWK1d9HkI/WMWSvnxDuy0cfAcpR2XKvfygeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39840400004)(6506007)(8676002)(1076003)(186003)(16526019)(5660300002)(6486002)(6916009)(36756003)(6666004)(316002)(8936002)(107886003)(4326008)(478600001)(86362001)(6512007)(2616005)(956004)(2906002)(26005)(66476007)(66556008)(66946007)(83380400001)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/WFg4bvFSoBpsObdl4fU66CcThre4fGdZhj3l+cmIzTVtO5pZjNqYBKY/RD9?=
 =?us-ascii?Q?yzd2vC6jRZB7Gw9eZUaQwoJ7mtIz4PXrsXCvTVqSibIltHsC7JiQ3gg8qFNG?=
 =?us-ascii?Q?2E8RSCw4QPZk1j/qMGCFKp6phBotaEnaPlQPTxvfHjlpXh/P7UAqYyBBEbJo?=
 =?us-ascii?Q?+GyoroPX7n+lEiegMM10eqsPk5Mz3MFPMgfmT1utjK2AUhL7zLxbMAwDaDMD?=
 =?us-ascii?Q?0xTmcajr9d74gtIL+qNV9UpLVTsswh5vLkKw7W9HT4c4gUTCkXqulULU2/GJ?=
 =?us-ascii?Q?S1CHWZ1brd2m4Bj5ySwmisMdJZSq0Ng0y1giVDi8F1MfKVO+0g0v41wKN2k0?=
 =?us-ascii?Q?PB7+taFyVt4cwB8fgUcvCJ1IIQyYi/HFtvlEQ1k7hqsE9RLQyoYSrhVCbyd5?=
 =?us-ascii?Q?XIc5DtVm/Gb4SL+HDhDMDhR4LNJW8f9kZ02uy34MN7IES5JUtTODd9S7ZhGk?=
 =?us-ascii?Q?qTUGFFKTT54rqQiqRXaSQl1gEovZwbemzv9/RRzlrFNHhpmQz5Zcnxkqk3z/?=
 =?us-ascii?Q?2mj3Ad2R34X01nQQ4pUeV+aL6gqsM/ef3cEyif01WRN/aIBGzXqH34jXVm3a?=
 =?us-ascii?Q?y2Ei0/4U8ny3GTQDXHW9HeprGJyNUO/wAq21RXN0p2IVobJQiaCe4WwPXOb6?=
 =?us-ascii?Q?q1I76FtNaeZ3vNitzKpnSpUI1GSUovdOExQ/YU4VGQr+jmmrRB7KyWRADipS?=
 =?us-ascii?Q?pQsLRYM53esCzAx9mGJv+wS9y/hB/+Twible+sTBXvJao0gWKSLVhgKIN/Cx?=
 =?us-ascii?Q?F/yN9J16Fts9biIbbfRcGG7+73pbtYQsPjWYpl3PC6IRxD1Njc8PMnlI68BO?=
 =?us-ascii?Q?CvxYKYApzCY3qyokepDZvjy/pcZJaXJWQLo8nOH2VO2RTSYKbA6Dl2ZhNaPH?=
 =?us-ascii?Q?dG6u0jKmsKBVQj9UcwGuuIfI353QUuLoRDrP0NqxAKgcedFiHLeaPocUCC8C?=
 =?us-ascii?Q?cGEQOU41rS6Mv6yJQbNjmMvF6ivRtKxww2EgZfMjJ5MrBjaWU2mI4t1V4IQQ?=
 =?us-ascii?Q?8yuV?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abab4069-a25a-4b53-8779-08d8ba686447
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:47:59.5914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: shujoN9CvA2oX6N2/BOwsjiWiMF0QjRlb261HxPeTBcQSqpGXJoX7Clo80YPaqXNGPgGyu4jFZpw8Wqei9jO2J9MZg/LV8UG6Z6DmiG+kEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2033
Received-SPF: pass client-ip=40.107.13.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, den@openvz.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drop unused code.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block-copy.h |  6 ------
 block/block-copy.c         | 15 ---------------
 2 files changed, 21 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 7821850f88..1cbea0b79b 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -18,7 +18,6 @@
 #include "block/block.h"
 #include "qemu/co-shared-resource.h"
 
-typedef void (*ProgressBytesCallbackFunc)(int64_t bytes, void *opaque);
 typedef void (*BlockCopyAsyncCallbackFunc)(void *opaque);
 typedef struct BlockCopyState BlockCopyState;
 typedef struct BlockCopyCallState BlockCopyCallState;
@@ -28,11 +27,6 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
                                      BdrvRequestFlags write_flags,
                                      Error **errp);
 
-void block_copy_set_progress_callback(
-        BlockCopyState *s,
-        ProgressBytesCallbackFunc progress_bytes_callback,
-        void *progress_opaque);
-
 void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm);
 
 void block_copy_state_free(BlockCopyState *s);
diff --git a/block/block-copy.c b/block/block-copy.c
index 61d82d9a1c..2ea8b28684 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -110,9 +110,6 @@ typedef struct BlockCopyState {
     bool skip_unallocated;
 
     ProgressMeter *progress;
-    /* progress_bytes_callback: called when some copying progress is done. */
-    ProgressBytesCallbackFunc progress_bytes_callback;
-    void *progress_opaque;
 
     SharedResource *mem;
 
@@ -298,15 +295,6 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
     return s;
 }
 
-void block_copy_set_progress_callback(
-        BlockCopyState *s,
-        ProgressBytesCallbackFunc progress_bytes_callback,
-        void *progress_opaque)
-{
-    s->progress_bytes_callback = progress_bytes_callback;
-    s->progress_opaque = progress_opaque;
-}
-
 void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm)
 {
     s->progress = pm;
@@ -454,9 +442,6 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
         t->call_state->error_is_read = error_is_read;
     } else {
         progress_work_done(t->s->progress, t->bytes);
-        if (t->s->progress_bytes_callback) {
-            t->s->progress_bytes_callback(t->bytes, t->s->progress_opaque);
-        }
     }
     co_put_to_shres(t->s->mem, t->bytes);
     block_copy_task_end(t, ret);
-- 
2.29.2


