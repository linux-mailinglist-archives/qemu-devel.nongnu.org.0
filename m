Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6A2423EEE
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 15:26:23 +0200 (CEST)
Received: from localhost ([::1]:35378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY6wA-0002RZ-CW
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 09:26:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mY6nu-0004t3-1s; Wed, 06 Oct 2021 09:17:50 -0400
Received: from mail-eopbgr40136.outbound.protection.outlook.com
 ([40.107.4.136]:14496 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mY6nr-0004IV-BF; Wed, 06 Oct 2021 09:17:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ix7OWPAgRXkB3F1tWD5ERTWoFkLPcYt0Na6QJQc9tJlmurc+OdKNzOPUlLrtbWk+HDLuAEe+gq5fRJ0czzwkN5l3Rd1tghcrnu+fZMk0DDTljSY6IlmXusr0dM0zR6z7gpVgMUd1lFqQtc9c/+JKnlnSXnaaqYdfXG4dsAxIu9tF3dY4mcRXsGy8qj2GERJHKKSaco4AVCFTFEmuzsQOsXtGxYK93IziISzut7v9ZUhY/9LnqykqIDMN9B6o2+wH6+h+iM/scHPTWuuIsdbK1Mmrjl3RyVjWtZqpVsyllq6meWYAZsvO62iKzEQktZXc6AiH+oxSn6EiDxRgECeEtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e9OFZEVPJ46HmehMuoHo3VAQ3lpLRXKsnVu4S5oZMbY=;
 b=aCnbBf170stM75vGFWHQ3J9QfTzlQtaSavU65f2FLdgmrSQbGZ4OT5VdG3L+smRVqaEozKZlMwVGlF5KDbm1MshuxNa7ySu67ZxtJkAP7vDeqMQo++CHY1LnWQ1ZyNhLsiINxG75b9hl+4v26fUAuZtm9fQjHs7kfQX98kB6g/tUhS/gmoFZTXmmxBuYUo7SSEnAqnvA6mdGFUpNhgH7G6S59W3sIi2YDHfunQUsQEUsNBAJ98Y0EZGL95GKPmVAV7KU3OxAWb2mjRnjxIuQn7tKSmJRZ78Bvy8heemGYq/OxZBjubHkJbw3O5tr0dPReZvX0gJYkPIBt0oLOgUDIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9OFZEVPJ46HmehMuoHo3VAQ3lpLRXKsnVu4S5oZMbY=;
 b=iHQbW8GyqfaO2e7U9rKd35sRpJQxJhc5SFDjitRtRpE5xQj97c0Wz7j93zEj3oWWVAXCx+xJ8R1NxKcpYmDJcWvRK8kImiPoPA0QKIVhx/vWw7q+7VkVaORs19h93gSNKv9Bo4euVvcSIrp/1QLTvG6JFpsg5zcTOPJ3FQFXHSE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB2981.eurprd08.prod.outlook.com (2603:10a6:209:44::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Wed, 6 Oct
 2021 13:17:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4566.022; Wed, 6 Oct 2021
 13:17:33 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, eblake@redhat.com,
 vsementsov@virtuozzo.com, stefanha@redhat.com
Subject: [PATCH 03/12] block-backend: convert blk_co_pwritev_part to int64_t
 bytes
Date: Wed,  6 Oct 2021 15:17:09 +0200
Message-Id: <20211006131718.214235-4-vsementsov@virtuozzo.com>
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
 Transport; Wed, 6 Oct 2021 13:17:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 838a6584-2bdf-4134-aa86-08d988cba899
X-MS-TrafficTypeDiagnostic: AM6PR08MB2981:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB29815EF87B0945104746922BC1B09@AM6PR08MB2981.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:217;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8C9Rm+6DDdxFNuYRZWsYjz8wDgm/G7mvff+xe0W4I32/6RKJla/HYpmVo4Wl5Ubye4kkOucCVN8Q0T2pz2ucBrUTVwKO/Z+GbIE6oFrRYwK3tzFAHGvEUW1dP9GOBVDMTKi1ieI4uYcfPzbaiUTZxwWli46gLZA3dKw3YRDBvwIab4vCEwmHgNdQ17Rx0cVumF7bIdGuVMPGHVWWjBtnQ2we9ykyItZkw7lrz1d6cNb8XA5v9LS0wB8nmRwQmy/iT95vSPZdNpYbRXhZipU5ZsMV450UQYrbfMeEC4cauhsILO4LpLVlorE9yBdx4kOlkGZfQ71WfIM/42P83/Xn/2qrCvcx3STArCVApaadpzKgynObcH6WwmueCIQ+0uuP/a6mcazHzeea4VCNP5V+ZWfAfMpJFxpTdfG17nnzgXAJJ6pA81adYV+1xT8w/SqpsU7DSMvh1qBpktxgfvVCtKV5NWsBz3QhR+Cnssw8FBvs9OLi73kwom6WScHVXVeZDdywG5fOeXw6ktVjOhphpQQbYQJ6YtKPmbSD2FJ4EaeUnnoQDGBGFPL+a1I8oZZXVRFDXDeit8/CZMnBpduUriSowHN0a7e5zeKfroGR69TqqXWTOrVKx2YGeqixsnmSy+vttNT6j3yiNJcOHoGODHyI+/XAAG3ZSKJj6pAFPEvso+jTM9eT2X9+zixBuY+ocJ1YkCOJHx3l+Fsjw8gHhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(2906002)(36756003)(6512007)(6666004)(83380400001)(38100700002)(38350700002)(1076003)(6486002)(508600001)(316002)(86362001)(6506007)(6916009)(26005)(52116002)(66556008)(66476007)(66946007)(5660300002)(186003)(8676002)(956004)(8936002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oe7JI4vQah3k7zxwPAKrjkNaRXVo1LN5Z2K4FnOlgNQYW4UVAT5SlLts1Ewba57zlT8KIT07xswMlG0EtVHolUvCJXF3hsidJOeZVeBj/LWZgSOasG+2ZKXhNHhgQ9+0GxRxvMA1DCyWWPvO1nkq87co8IiSkvKsNjoCJMm2wW1QVtIS9BqBLZOVurxcT70C18Ng+cGKhWuH/nQRvBnY2iyBnjVx6rd0J/rZVYyGkBDm2aSj+/8nJbFdJBDeWWNaxf3wmI5yQTWGWIkRMS7aNk56rnQ4ue4wyzo78HVxcQPN9lLmCD+0drZVW7QzM7TBp/eWLuRJZ7C636LvKpRMac133/7RbxNmetYC2YSCYohVmMJWQtuXWpuCWvNW1LzJqC9nQjcwEFzZGqtrF/1uD6cilNsz2Pv786iv9Nu5I5JbBZADOkbmBqihdKZZoCQCdgawRu4FWZQjkDrLuz5PuhvqVkVV0LQrZjkGgUS/sbYK64zeF9dssVZpyEvuVc/G0XaaSxSzc1f2sHDHpdB3l0DxwfuFVFRFEZ5jmAq8AQW5sdZouCMb2nXJJZ9nEEG6M0hCum3WDzhhAFWQdLit5zNcmF5JLpcWjbymNcAUZpom8Dqhnv8SAoMhbcrBaqAMPSaxBJT697HIzoNtQQyid+zUtfcVznbRs+6TRbFE/+0piVFUzaQeGOhkjWYSq9ni9SKCypUE2hzosg75ohU4AANPVblcPhJiQIwhyHd0WBn2YwS9N1xpAl+EzbMXgn4M
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 838a6584-2bdf-4134-aa86-08d988cba899
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 13:17:33.9301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wC2aJo4gpE8iJdcCkI9tcainRFNAdYQkZNy1ydaAL1LSDflEG3beBjluZo0xicVxgHx/5Vjzn9lErIaxmm723rQbtDyv54gETJUtLu0PqLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2981
Received-SPF: pass client-ip=40.107.4.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

We convert blk_do_pwritev_part() and some wrappers:
blk_co_pwritev_part(), blk_co_pwritev(), blk_co_pwrite_zeroes().

All functions are converted so that parameter type becomes wider, so
all callers should be OK with it.

Look at blk_do_pwritev_part() body:
bytes is passed to:

 - trace_blk_co_pwritev (we update it here)
 - blk_check_byte_request, throttle_group_co_io_limits_intercept,
   bdrv_co_pwritev_part - all already has int64_t argument.

Note that requests exceeding INT_MAX are still restricted by
blk_check_byte_request().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/sysemu/block-backend.h | 6 +++---
 block/block-backend.c          | 8 ++++----
 block/trace-events             | 2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 32a88878bb..844bb039c5 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -129,11 +129,11 @@ int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
                                int64_t bytes, QEMUIOVector *qiov,
                                BdrvRequestFlags flags);
 int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
-                                     unsigned int bytes,
+                                     int64_t bytes,
                                      QEMUIOVector *qiov, size_t qiov_offset,
                                      BdrvRequestFlags flags);
 int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
-                               unsigned int bytes, QEMUIOVector *qiov,
+                               int64_t bytes, QEMUIOVector *qiov,
                                BdrvRequestFlags flags);
 
 static inline int coroutine_fn blk_co_pread(BlockBackend *blk, int64_t offset,
@@ -242,7 +242,7 @@ int blk_get_open_flags_from_root_state(BlockBackend *blk);
 void *blk_aio_get(const AIOCBInfo *aiocb_info, BlockBackend *blk,
                   BlockCompletionFunc *cb, void *opaque);
 int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                                      int bytes, BdrvRequestFlags flags);
+                                      int64_t bytes, BdrvRequestFlags flags);
 int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, const void *buf,
                           int bytes);
 int blk_truncate(BlockBackend *blk, int64_t offset, bool exact,
diff --git a/block/block-backend.c b/block/block-backend.c
index be5a7fb5fb..b09ec5a7c7 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1250,7 +1250,7 @@ int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
 static int coroutine_fn
-blk_do_pwritev_part(BlockBackend *blk, int64_t offset, unsigned int bytes,
+blk_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
                     QEMUIOVector *qiov, size_t qiov_offset,
                     BdrvRequestFlags flags)
 {
@@ -1286,7 +1286,7 @@ blk_do_pwritev_part(BlockBackend *blk, int64_t offset, unsigned int bytes,
 }
 
 int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
-                                     unsigned int bytes,
+                                     int64_t bytes,
                                      QEMUIOVector *qiov, size_t qiov_offset,
                                      BdrvRequestFlags flags)
 {
@@ -1300,7 +1300,7 @@ int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
 }
 
 int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
-                                unsigned int bytes, QEMUIOVector *qiov,
+                                int64_t bytes, QEMUIOVector *qiov,
                                 BdrvRequestFlags flags)
 {
     return blk_co_pwritev_part(blk, offset, bytes, qiov, 0, flags);
@@ -2208,7 +2208,7 @@ void *blk_aio_get(const AIOCBInfo *aiocb_info, BlockBackend *blk,
 }
 
 int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                                      int bytes, BdrvRequestFlags flags)
+                                      int64_t bytes, BdrvRequestFlags flags)
 {
     return blk_co_pwritev(blk, offset, bytes, NULL,
                           flags | BDRV_REQ_ZERO_WRITE);
diff --git a/block/trace-events b/block/trace-events
index ff397ffff4..ab56edacb4 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -6,7 +6,7 @@ bdrv_lock_medium(void *bs, bool locked) "bs %p locked %d"
 
 # block-backend.c
 blk_co_preadv(void *blk, void *bs, int64_t offset, int64_t bytes, int flags) "blk %p bs %p offset %"PRId64" bytes %" PRId64 " flags 0x%x"
-blk_co_pwritev(void *blk, void *bs, int64_t offset, unsigned int bytes, int flags) "blk %p bs %p offset %"PRId64" bytes %u flags 0x%x"
+blk_co_pwritev(void *blk, void *bs, int64_t offset, int64_t bytes, int flags) "blk %p bs %p offset %"PRId64" bytes %" PRId64 " flags 0x%x"
 blk_root_attach(void *child, void *blk, void *bs) "child %p blk %p bs %p"
 blk_root_detach(void *child, void *blk, void *bs) "child %p blk %p bs %p"
 
-- 
2.31.1


