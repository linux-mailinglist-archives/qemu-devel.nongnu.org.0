Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DD81ECB19
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jun 2020 10:11:11 +0200 (CEST)
Received: from localhost ([::1]:45608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgOUQ-0002Gk-Ql
	for lists+qemu-devel@lfdr.de; Wed, 03 Jun 2020 04:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maozhongyi@cmss.chinamobile.com>)
 id 1jgOTC-0000YD-2k
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 04:09:54 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:13034)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jgOT8-0000Db-Mq
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 04:09:53 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.15]) by
 rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee85ed75ab4862-8b2aa;
 Wed, 03 Jun 2020 16:09:25 +0800 (CST)
X-RM-TRANSID: 2ee85ed75ab4862-8b2aa
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.146])
 by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee85ed75aae43e-6101d;
 Wed, 03 Jun 2020 16:09:24 +0800 (CST)
X-RM-TRANSID: 2ee85ed75aae43e-6101d
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/9] monitor/hmp-cmds: don't silently output when running
 'migrate_set_downtime' fails
Date: Wed,  3 Jun 2020 16:08:59 +0800
Message-Id: <20200603080904.997083-5-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200603080904.997083-1-maozhongyi@cmss.chinamobile.com>
References: <20200603080904.997083-1-maozhongyi@cmss.chinamobile.com>
Received-SPF: pass client-ip=221.176.66.80;
 envelope-from=maozhongyi@cmss.chinamobile.com; helo=cmccmta2.chinamobile.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 04:09:39
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
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
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 monitor/hmp-cmds.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 8c3e436b39..6938f1060e 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1188,8 +1188,11 @@ void hmp_migrate_pause(Monitor *mon, const QDict *qdict)
 /* Kept for backwards compatibility */
 void hmp_migrate_set_downtime(Monitor *mon, const QDict *qdict)
 {
+    Error *err = NULL;
+
     double value = qdict_get_double(qdict, "value");
-    qmp_migrate_set_downtime(value, NULL);
+    qmp_migrate_set_downtime(value, &err);
+    hmp_handle_error(mon, err);
 }
 
 void hmp_migrate_set_cache_size(Monitor *mon, const QDict *qdict)
-- 
2.17.1




