Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AE0ABD79
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 18:15:57 +0200 (CEST)
Received: from localhost ([::1]:58176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i6Gtw-0008Fl-LP
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 12:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51388)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <anton.nefedov@virtuozzo.com>) id 1i6GgF-0002On-Qh
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 12:01:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anton.nefedov@virtuozzo.com>) id 1i6GgE-00054y-8y
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 12:01:47 -0400
Received: from relay.sw.ru ([185.231.240.75]:37890)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <anton.nefedov@virtuozzo.com>)
 id 1i6GgB-0004wW-A0; Fri, 06 Sep 2019 12:01:43 -0400
Received: from [172.16.25.154] (helo=xantnef-ws.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <anton.nefedov@virtuozzo.com>)
 id 1i6GgA-0005vz-1b; Fri, 06 Sep 2019 19:01:42 +0300
From: Anton Nefedov <anton.nefedov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Fri,  6 Sep 2019 19:01:14 +0300
Message-Id: <20190906160120.70239-4-anton.nefedov@virtuozzo.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190906160120.70239-1-anton.nefedov@virtuozzo.com>
References: <20190906160120.70239-1-anton.nefedov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v9 3/9] block: add empty account cookie type
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 den@virtuozzo.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 Anton Nefedov <anton.nefedov@virtuozzo.com>, pbonzini@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds some protection from accounting uninitialized cookie.
That is, block_acct_failed/done without previous block_acct_start;
in that case, cookie probably holds values from previous operation.

(Note: it might also be uninitialized holding garbage value and there is
 still "< BLOCK_MAX_IOTYPE" assertion for that.
 So block_acct_failed/done without previous block_acct_start should be used
 with caution.)

Currently this is particularly useful in ide code where it's hard to
keep track whether the request started accounting or not. For example,
trim requests do the accounting separately.

Signed-off-by: Anton Nefedov <anton.nefedov@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/accounting.h | 1 +
 block/accounting.c         | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/block/accounting.h b/include/block/accounting.h
index ba8b04d572..878b4c3581 100644
--- a/include/block/accounting.h
+++ b/include/block/accounting.h
@@ -33,6 +33,7 @@ typedef struct BlockAcctTimedStats BlockAcctTimedStats;
 typedef struct BlockAcctStats BlockAcctStats;
 
 enum BlockAcctType {
+    BLOCK_ACCT_NONE = 0,
     BLOCK_ACCT_READ,
     BLOCK_ACCT_WRITE,
     BLOCK_ACCT_FLUSH,
diff --git a/block/accounting.c b/block/accounting.c
index 70a3d9a426..8d41c8a83a 100644
--- a/block/accounting.c
+++ b/block/accounting.c
@@ -195,6 +195,10 @@ static void block_account_one_io(BlockAcctStats *stats, BlockAcctCookie *cookie,
 
     assert(cookie->type < BLOCK_MAX_IOTYPE);
 
+    if (cookie->type == BLOCK_ACCT_NONE) {
+        return;
+    }
+
     qemu_mutex_lock(&stats->lock);
 
     if (failed) {
@@ -217,6 +221,8 @@ static void block_account_one_io(BlockAcctStats *stats, BlockAcctCookie *cookie,
     }
 
     qemu_mutex_unlock(&stats->lock);
+
+    cookie->type = BLOCK_ACCT_NONE;
 }
 
 void block_acct_done(BlockAcctStats *stats, BlockAcctCookie *cookie)
-- 
2.17.1


