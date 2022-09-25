Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EC65E938D
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 16:00:41 +0200 (CEST)
Received: from localhost ([::1]:52832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocSBU-00081M-3P
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 10:00:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luzhipeng@cestc.cn>)
 id 1ocS55-00079r-4y; Sun, 25 Sep 2022 09:54:03 -0400
Received: from [106.39.185.57] (port=35804 helo=smtp.cecloud.com)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luzhipeng@cestc.cn>)
 id 1ocS51-0001tu-Cj; Sun, 25 Sep 2022 09:54:02 -0400
Received: from localhost (localhost [127.0.0.1])
 by smtp.cecloud.com (Postfix) with ESMTP id CC607FC0203;
 Sun, 25 Sep 2022 21:53:34 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [171.217.49.64])
 by smtp.cecloud.com (postfix) whith ESMTP id
 P51403T281470639468912S1664114012785511_; 
 Sun, 25 Sep 2022 21:53:34 +0800 (CST)
X-UNIQUE-TAG: <fb0e24e127f161e2f63175c7a4484060>
X-RL-SENDER: luzhipeng@cestc.cn
X-SENDER: luzhipeng@cestc.cn
X-LOGIN-NAME: luzhipeng@cestc.cn
X-FST-TO: qemu-devel@nongnu.org
X-RCPT-COUNT: 5
X-SENDER-IP: 171.217.49.64
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: luzhipeng <luzhipeng@cestc.cn>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, lu zhipeng <luzhipeng@cestc.cn>
Subject: [PATCH] qemu-nbd: set timeout to qemu-nbd socket
Date: Sun, 25 Sep 2022 21:53:08 +0800
Message-Id: <20220925135308.481-1-luzhipeng@cestc.cn>
X-Mailer: git-send-email 2.34.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 106.39.185.57 (failed)
Received-SPF: pass client-ip=106.39.185.57; envelope-from=luzhipeng@cestc.cn;
 helo=smtp.cecloud.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: lu zhipeng <luzhipeng@cestc.cn>

Prevent the NBD socket stuck all the time, So
set timeout.

Signed-off-by: lu zhipeng <luzhipeng@cestc.cn>
---
 nbd/client.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/nbd/client.c b/nbd/client.c
index 30d5383cb1..89dde53a0f 100644
--- a/nbd/client.c
+++ b/nbd/client.c
@@ -24,6 +24,8 @@
 #include "nbd-internal.h"
 #include "qemu/cutils.h"
 
+#define NBD_DEFAULT_TIMEOUT 30
+
 /* Definitions for opaque data types */
 
 static QTAILQ_HEAD(, NBDExport) exports = QTAILQ_HEAD_INITIALIZER(exports);
@@ -1301,6 +1303,12 @@ int nbd_init(int fd, QIOChannelSocket *sioc, NBDExportInfo *info,
         }
     }
 
+    if (ioctl(fd, NBD_SET_TIMEOUT, NBD_DEFAULT_TIMEOUT) < 0) {
+        int serrno = errno;
+        error_setg(errp, "Failed setting timeout");
+        return -serrno;
+    }
+
     trace_nbd_init_finish();
 
     return 0;
-- 
2.31.1




