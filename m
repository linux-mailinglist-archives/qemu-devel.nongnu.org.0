Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37665195ADB
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 17:16:24 +0100 (CET)
Received: from localhost ([::1]:43928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHreh-0002rK-3h
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 12:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37796)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jHrdg-0002Of-FR
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 12:15:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jHrdf-0006Qy-3A
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 12:15:20 -0400
Received: from cmccmta1.chinamobile.com ([221.176.66.79]:2592)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jHrdd-0006Ek-UD
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 12:15:19 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.3]) by
 rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee35e7e2685fc9-def25;
 Sat, 28 Mar 2020 00:15:01 +0800 (CST)
X-RM-TRANSID: 2ee35e7e2685fc9-def25
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from maozy-host.localdomain (unknown[117.136.46.213])
 by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee25e7e2680fcf-c9487;
 Sat, 28 Mar 2020 00:15:01 +0800 (CST)
X-RM-TRANSID: 2ee25e7e2680fcf-c9487
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] monitor/hmp-cmds: add units for migrate_parameters.
Date: Sat, 28 Mar 2020 00:14:54 +0800
Message-Id: <bfceb9751f76533c823e9ec91ac14f4bc94a47b6.1585324937.git.maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 221.176.66.79
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
Cc: dgilbert@redhat.com, Mao Zhongyi <maozhongyi@cmss.chinamobile.com>,
 sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running:
(qemu) info migrate_parameters
announce-initial: 50 ms
announce-max: 550 ms
announce-step: 100 ms
compress-wait-thread: on
...
max-bandwidth: 33554432 bytes/second
downtime-limit: 300 milliseconds
x-checkpoint-delay: 20000
...
xbzrle-cache-size: 67108864

add units for the parameters 'x-checkpoint-delay' and
'xbzrle-cache-size', it's easier to read, also move
milliseconds to ms to keep the same style.

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
---
 monitor/hmp-cmds.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 2a900a528a..790fad3afe 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -436,11 +436,11 @@ void hmp_info_migrate_parameters(Monitor *mon, const QDict *qdict)
             MigrationParameter_str(MIGRATION_PARAMETER_MAX_BANDWIDTH),
             params->max_bandwidth);
         assert(params->has_downtime_limit);
-        monitor_printf(mon, "%s: %" PRIu64 " milliseconds\n",
+        monitor_printf(mon, "%s: %" PRIu64 " ms\n",
             MigrationParameter_str(MIGRATION_PARAMETER_DOWNTIME_LIMIT),
             params->downtime_limit);
         assert(params->has_x_checkpoint_delay);
-        monitor_printf(mon, "%s: %u\n",
+        monitor_printf(mon, "%s: %u ms\n",
             MigrationParameter_str(MIGRATION_PARAMETER_X_CHECKPOINT_DELAY),
             params->x_checkpoint_delay);
         assert(params->has_block_incremental);
@@ -453,7 +453,7 @@ void hmp_info_migrate_parameters(Monitor *mon, const QDict *qdict)
         monitor_printf(mon, "%s: %s\n",
             MigrationParameter_str(MIGRATION_PARAMETER_MULTIFD_COMPRESSION),
             MultiFDCompression_str(params->multifd_compression));
-        monitor_printf(mon, "%s: %" PRIu64 "\n",
+        monitor_printf(mon, "%s: %" PRIu64 " bytes\n",
             MigrationParameter_str(MIGRATION_PARAMETER_XBZRLE_CACHE_SIZE),
             params->xbzrle_cache_size);
         monitor_printf(mon, "%s: %" PRIu64 "\n",
-- 
2.17.1




