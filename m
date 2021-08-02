Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E9F3DD078
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 08:26:53 +0200 (CEST)
Received: from localhost ([::1]:57664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mARPY-0004r9-FM
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 02:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maozhongyi@cmss.chinamobile.com>)
 id 1mAROW-0003vH-Jg; Mon, 02 Aug 2021 02:25:48 -0400
Received: from cmccmta3.chinamobile.com ([221.176.66.81]:53200)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>)
 id 1mAROS-0002sO-96; Mon, 02 Aug 2021 02:25:48 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.3]) by
 rmmx-syy-dmz-app12-12012 (RichMail) with SMTP id 2eec61078fcf268-e3cfe;
 Mon, 02 Aug 2021 14:25:20 +0800 (CST)
X-RM-TRANSID: 2eec61078fcf268-e3cfe
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from maozy-host.mshome.net (unknown[10.42.68.12])
 by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee261078fc69dc-9bab6;
 Mon, 02 Aug 2021 14:25:19 +0800 (CST)
X-RM-TRANSID: 2ee261078fc69dc-9bab6
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] block/monitor: Consolidate hmp_handle_error calls to reduce
 redundant code
Date: Mon,  2 Aug 2021 14:25:07 +0800
Message-Id: <20210802062507.347555-1-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=221.176.66.81;
 envelope-from=maozhongyi@cmss.chinamobile.com; helo=cmccmta3.chinamobile.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, Mao Zhongyi <maozhongyi@cmss.chinamobile.com>,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
---
 block/monitor/block-hmp-cmds.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index 3e6670c963..2ac4aedfff 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -251,10 +251,10 @@ void hmp_drive_mirror(Monitor *mon, const QDict *qdict)
 
     if (!filename) {
         error_setg(&err, QERR_MISSING_PARAMETER, "target");
-        hmp_handle_error(mon, err);
-        return;
+        goto end;
     }
     qmp_drive_mirror(&mirror, &err);
+end:
     hmp_handle_error(mon, err);
 }
 
@@ -281,11 +281,11 @@ void hmp_drive_backup(Monitor *mon, const QDict *qdict)
 
     if (!filename) {
         error_setg(&err, QERR_MISSING_PARAMETER, "target");
-        hmp_handle_error(mon, err);
-        return;
+        goto end;
     }
 
     qmp_drive_backup(&backup, &err);
+end:
     hmp_handle_error(mon, err);
 }
 
@@ -356,8 +356,7 @@ void hmp_snapshot_blkdev(Monitor *mon, const QDict *qdict)
          * will be taken internally. Today it's actually required.
          */
         error_setg(&err, QERR_MISSING_PARAMETER, "snapshot-file");
-        hmp_handle_error(mon, err);
-        return;
+        goto end;
     }
 
     mode = reuse ? NEW_IMAGE_MODE_EXISTING : NEW_IMAGE_MODE_ABSOLUTE_PATHS;
@@ -365,6 +364,7 @@ void hmp_snapshot_blkdev(Monitor *mon, const QDict *qdict)
                                filename, false, NULL,
                                !!format, format,
                                true, mode, &err);
+end:
     hmp_handle_error(mon, err);
 }
 
-- 
2.31.1




