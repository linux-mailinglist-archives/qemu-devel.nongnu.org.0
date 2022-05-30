Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFBD53793C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 12:42:55 +0200 (CEST)
Received: from localhost ([::1]:48426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvcrO-0005bi-Bd
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 06:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1nvcon-0003yR-OB; Mon, 30 May 2022 06:40:14 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:55852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1nvcom-0006kf-8W; Mon, 30 May 2022 06:40:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=Pw1i4JHXQHsyKUpkFB9CPCw0yKaVrTyMoxAFsUxZR8s=; b=KgBLpKXx0dfX
 eCbWazTZkcMKyKq962SpIRTr2aUkWooWk5qJkeyKMG9G/p7VpG8nb6uSb/W3tW5+u2GMXvzxg7Nyh
 SBHzBKaWto3DKjJQMCJhwfeh4jkdF7GjlZ3OF3vfwBeIgoNUyKrCq+o/lJeZYyzTo2yizSrp1UquQ
 sd09Q=;
Received: from [192.168.16.212] (helo=iris.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.94.2)
 (envelope-from <den@openvz.org>)
 id 1nvcn0-000aVc-SS; Mon, 30 May 2022 12:39:39 +0200
From: "Denis V. Lunev" <den@openvz.org>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Denis V. Lunev" <den@openvz.org>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH 1/1] block: use 'unsigned' for in_flight field on driver state
Date: Mon, 30 May 2022 12:39:57 +0200
Message-Id: <20220530103957.629398-1-den@openvz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=130.117.225.111; envelope-from=den@openvz.org;
 helo=relay.virtuozzo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This patch makes in_flight field 'unsigned' for BDRVNBDState and
MirrorBlockJob. This matches the definition of this field on BDS
and is generically correct - we should never get negative value here.

Signed-off-by: Denis V. Lunev <den@openvz.org>
CC: John Snow <jsnow@redhat.com>
CC: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
CC: Kevin Wolf <kwolf@redhat.com>
CC: Hanna Reitz <hreitz@redhat.com>
CC: Eric Blake <eblake@redhat.com>
---
 block/mirror.c | 2 +-
 block/nbd.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index d8ecb9efa2..3c4ab1159d 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -73,7 +73,7 @@ typedef struct MirrorBlockJob {
 
     uint64_t last_pause_ns;
     unsigned long *in_flight_bitmap;
-    int in_flight;
+    unsigned in_flight;
     int64_t bytes_in_flight;
     QTAILQ_HEAD(, MirrorOp) ops_in_flight;
     int ret;
diff --git a/block/nbd.c b/block/nbd.c
index 6085ab1d2c..512a53bf73 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -77,7 +77,7 @@ typedef struct BDRVNBDState {
     QemuMutex requests_lock;
     NBDClientState state;
     CoQueue free_sema;
-    int in_flight;
+    unsigned in_flight;
     NBDClientRequest requests[MAX_NBD_REQUESTS];
     QEMUTimer *reconnect_delay_timer;
 
-- 
2.32.0


