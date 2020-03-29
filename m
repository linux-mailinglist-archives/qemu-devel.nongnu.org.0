Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A19196B6A
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Mar 2020 07:04:32 +0200 (CEST)
Received: from localhost ([::1]:34320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIQ7b-0002Ld-Dd
	for lists+qemu-devel@lfdr.de; Sun, 29 Mar 2020 01:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41669)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jIQ5N-00086P-JT
 for qemu-devel@nongnu.org; Sun, 29 Mar 2020 01:02:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jIQ5M-0005Vz-Jx
 for qemu-devel@nongnu.org; Sun, 29 Mar 2020 01:02:13 -0400
Received: from cmccmta1.chinamobile.com ([221.176.66.79]:7098)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jIQ5M-0005H9-1k
 for qemu-devel@nongnu.org; Sun, 29 Mar 2020 01:02:12 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.11]) by
 rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee45e802bb9d22-f3ce7;
 Sun, 29 Mar 2020 13:01:46 +0800 (CST)
X-RM-TRANSID: 2ee45e802bb9d22-f3ce7
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from maozy-host.localdomain (unknown[117.136.46.37])
 by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee65e802baee64-267ca;
 Sun, 29 Mar 2020 13:01:46 +0800 (CST)
X-RM-TRANSID: 2ee65e802baee64-267ca
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] monitor/hmp-cmds: add hmp_handle_error() for
 hmp_migrate_set_speed()
Date: Sun, 29 Mar 2020 13:01:30 +0800
Message-Id: <20200329050131.26864-3-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200329050131.26864-1-maozhongyi@cmss.chinamobile.com>
References: <20200329050131.26864-1-maozhongyi@cmss.chinamobile.com>
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
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
---
 monitor/hmp-cmds.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 790fad3afe..63097ddcc8 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1203,8 +1203,11 @@ void hmp_migrate_set_cache_size(Monitor *mon, const QDict *qdict)
 /* Kept for backwards compatibility */
 void hmp_migrate_set_speed(Monitor *mon, const QDict *qdict)
 {
+    Error *err = NULL;
+
     int64_t value = qdict_get_int(qdict, "value");
-    qmp_migrate_set_speed(value, NULL);
+    qmp_migrate_set_speed(value, &err);
+    hmp_handle_error(mon, err);
 }
 
 void hmp_migrate_set_capability(Monitor *mon, const QDict *qdict)
-- 
2.17.1




