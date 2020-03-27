Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66A5195218
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 08:34:13 +0100 (CET)
Received: from localhost ([::1]:38056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHjVM-0003Nt-5t
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 03:34:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44655)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jHjTx-0002WF-I5
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 03:32:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jHjTt-0005VC-Ml
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 03:32:43 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:11079)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jHjTp-0004Xj-Cb
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 03:32:39 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.17]) by
 rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee85e7dac01701-d55c3;
 Fri, 27 Mar 2020 15:32:18 +0800 (CST)
X-RM-TRANSID: 2ee85e7dac01701-d55c3
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.146])
 by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee95e7dabfc32c-971e9;
 Fri, 27 Mar 2020 15:32:17 +0800 (CST)
X-RM-TRANSID: 2ee95e7dabfc32c-971e9
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] monitor/hmp-cmds: add units for mirate_parameters.
Date: Fri, 27 Mar 2020 15:32:10 +0800
Message-Id: <20200327073210.198080-1-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 221.176.66.80
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
Cc: dgilbert@redhat.com, Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
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
'xbzrle-cache-size', it's easier to read.

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
---
 monitor/hmp-cmds.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 2a900a528a..8d22f96e57 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -440,7 +440,7 @@ void hmp_info_migrate_parameters(Monitor *mon, const QDict *qdict)
             MigrationParameter_str(MIGRATION_PARAMETER_DOWNTIME_LIMIT),
             params->downtime_limit);
         assert(params->has_x_checkpoint_delay);
-        monitor_printf(mon, "%s: %u\n",
+        monitor_printf(mon, "%s: %u" " milliseconds\n",
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




