Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8AC209E9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 May 2019 16:39:30 +0200 (CEST)
Received: from localhost ([127.0.0.1]:59196 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRHXd-0003ir-6l
	for lists+qemu-devel@lfdr.de; Thu, 16 May 2019 10:39:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55343)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anton.nefedov@virtuozzo.com>) id 1hRHRs-00080n-Tr
	for qemu-devel@nongnu.org; Thu, 16 May 2019 10:33:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anton.nefedov@virtuozzo.com>) id 1hRHRr-0004KV-Ix
	for qemu-devel@nongnu.org; Thu, 16 May 2019 10:33:32 -0400
Received: from relay.sw.ru ([185.231.240.75]:39664)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <anton.nefedov@virtuozzo.com>)
	id 1hRHRm-0004DO-TS; Thu, 16 May 2019 10:33:27 -0400
Received: from [172.16.25.154] (helo=xantnef-ws.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <anton.nefedov@virtuozzo.com>)
	id 1hRHRl-0007Lk-9V; Thu, 16 May 2019 17:33:25 +0300
From: Anton Nefedov <anton.nefedov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Thu, 16 May 2019 17:33:06 +0300
Message-Id: <20190516143314.81302-2-anton.nefedov@virtuozzo.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190516143314.81302-1-anton.nefedov@virtuozzo.com>
References: <20190516143314.81302-1-anton.nefedov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v8 1/9] qapi: group BlockDeviceStats fields
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
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

Make the stat fields definition slightly more readable.
Also reorder total_time_ns stats read-write-flush as done elsewhere.
Cosmetic change only.

Signed-off-by: Anton Nefedov <anton.nefedov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 7ccbfff9d0..754d07f1fb 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -863,12 +863,12 @@
 # @flush_operations: The number of cache flush operations performed by the
 #                    device (since 0.15.0)
 #
-# @flush_total_time_ns: Total time spend on cache flushes in nano-seconds
-#                       (since 0.15.0).
+# @rd_total_time_ns: Total time spent on reads in nanoseconds (since 0.15.0).
 #
-# @wr_total_time_ns: Total time spend on writes in nano-seconds (since 0.15.0).
+# @wr_total_time_ns: Total time spent on writes in nanoseconds (since 0.15.0).
 #
-# @rd_total_time_ns: Total_time_spend on reads in nano-seconds (since 0.15.0).
+# @flush_total_time_ns: Total time spent on cache flushes in nanoseconds
+#                       (since 0.15.0).
 #
 # @wr_highest_offset: The offset after the greatest byte written to the
 #                     device.  The intended use of this information is for
@@ -921,14 +921,18 @@
 # Since: 0.14.0
 ##
 { 'struct': 'BlockDeviceStats',
-  'data': {'rd_bytes': 'int', 'wr_bytes': 'int', 'rd_operations': 'int',
-           'wr_operations': 'int', 'flush_operations': 'int',
-           'flush_total_time_ns': 'int', 'wr_total_time_ns': 'int',
-           'rd_total_time_ns': 'int', 'wr_highest_offset': 'int',
-           'rd_merged': 'int', 'wr_merged': 'int', '*idle_time_ns': 'int',
+  'data': {'rd_bytes': 'int', 'wr_bytes': 'int',
+           'rd_operations': 'int', 'wr_operations': 'int',
+           'flush_operations': 'int',
+           'rd_total_time_ns': 'int', 'wr_total_time_ns': 'int',
+           'flush_total_time_ns': 'int',
+           'wr_highest_offset': 'int',
+           'rd_merged': 'int', 'wr_merged': 'int',
+           '*idle_time_ns': 'int',
            'failed_rd_operations': 'int', 'failed_wr_operations': 'int',
-           'failed_flush_operations': 'int', 'invalid_rd_operations': 'int',
-           'invalid_wr_operations': 'int', 'invalid_flush_operations': 'int',
+           'failed_flush_operations': 'int',
+           'invalid_rd_operations': 'int', 'invalid_wr_operations': 'int',
+           'invalid_flush_operations': 'int',
            'account_invalid': 'bool', 'account_failed': 'bool',
            'timed_stats': ['BlockDeviceTimedStats'],
            '*rd_latency_histogram': 'BlockLatencyHistogramInfo',
-- 
2.17.1


