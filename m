Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE5D19510C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 07:28:00 +0100 (CET)
Received: from localhost ([::1]:37632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHiTH-0000Eh-Ow
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 02:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58728)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jHiSK-0008C0-Ij
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 02:27:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jHiSJ-0003tI-4e
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 02:27:00 -0400
Received: from cmccmta1.chinamobile.com ([221.176.66.79]:3973)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jHiSI-0000yd-D2
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 02:26:59 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.5]) by
 rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee15e7d9c95898-d3635;
 Fri, 27 Mar 2020 14:26:29 +0800 (CST)
X-RM-TRANSID: 2ee15e7d9c95898-d3635
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.146])
 by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee35e7d9c9070d-18a74;
 Fri, 27 Mar 2020 14:26:29 +0800 (CST)
X-RM-TRANSID: 2ee35e7d9c9070d-18a74
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] monitor/hmp-cmds: don't silently output when running
 'migrate_set_downtime' fails
Date: Fri, 27 Mar 2020 14:26:23 +0800
Message-Id: <20200327062623.191818-1-maozhongyi@cmss.chinamobile.com>
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
Cc: dgilbert@redhat.com, Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Although 'migrate_set_downtime' has been deprecated and replaced
with 'migrate_set_parameter downtime_limit', it has not been
completely eliminated, possibly due to compatibility with older
versions. I think as long as this old parameter is running, we
should report appropriate message when something goes wrong, not
be silent.

before:
(qemu) migrate_set_downtime -1
(qemu)

after:
(qemu) migrate_set_downtime -1
Error: Parameter 'downtime_limit' expects an integer in the range of 0 to 2000 seconds

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
---
 monitor/hmp-cmds.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 9b94e67879..2a900a528a 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1181,8 +1181,14 @@ void hmp_migrate_pause(Monitor *mon, const QDict *qdict)
 /* Kept for backwards compatibility */
 void hmp_migrate_set_downtime(Monitor *mon, const QDict *qdict)
 {
+    Error *err = NULL;
+
     double value = qdict_get_double(qdict, "value");
-    qmp_migrate_set_downtime(value, NULL);
+    qmp_migrate_set_downtime(value, &err);
+
+    if (err) {
+        hmp_handle_error(mon, err);
+    }
 }
 
 void hmp_migrate_set_cache_size(Monitor *mon, const QDict *qdict)
-- 
2.17.1




