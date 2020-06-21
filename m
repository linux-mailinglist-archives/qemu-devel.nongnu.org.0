Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAACB20295C
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Jun 2020 09:31:06 +0200 (CEST)
Received: from localhost ([::1]:36278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmuRV-0004IC-H3
	for lists+qemu-devel@lfdr.de; Sun, 21 Jun 2020 03:31:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lichun@ruijie.com.cn>)
 id 1jmtwz-0005A6-Kp
 for qemu-devel@nongnu.org; Sun, 21 Jun 2020 02:59:33 -0400
Received: from mxfz.ruijie.com.cn ([120.35.11.201]:14309
 helo=FZEX3.ruijie.com.cn)
 by eggs.gnu.org with esmtps (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lichun@ruijie.com.cn>)
 id 1jmtwv-0006Ig-BO
 for qemu-devel@nongnu.org; Sun, 21 Jun 2020 02:59:31 -0400
Received: from localhost.localdomain.localdomain (172.30.216.210) by
 FZEX3.ruijie.com.cn (192.168.58.89) with Microsoft SMTP Server id 14.3.123.3; 
 Sun, 21 Jun 2020 14:53:07 +0800
From: lichun <lichun@ruijie.com.cn>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] chardev/tcp: fix error message double free error
Date: Sun, 21 Jun 2020 22:53:03 +0800
Message-ID: <20200621145303.13068-1-lichun@ruijie.com.cn>
X-Mailer: git-send-email 2.18.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.30.216.210]
Received-SPF: pass client-ip=120.35.11.201; envelope-from=lichun@ruijie.com.cn;
 helo=FZEX3.ruijie.com.cn
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/21 02:53:10
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 21 Jun 2020 03:29:40 -0400
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
Cc: marcandre.lureau@redhat.com, lichun <lichun@ruijie.com.cn>,
 706701795@qq.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: lichun <lichun@ruijie.com.cn>
---
 chardev/char-socket.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index afebeec5c3..3b6c1c5848 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -1086,7 +1086,10 @@ static void qemu_chr_socket_connected(QIOTask *task, void *opaque)
     if (qio_task_propagate_error(task, &err)) {
         tcp_chr_change_state(s, TCP_CHARDEV_STATE_DISCONNECTED);
         check_report_connect_error(chr, err);
-        error_free(err);
+        /* If connect_err_reported is true, it means err is already freed */
+        if (!s->connect_err_reported) {
+            error_free(err);
+        }
         goto cleanup;
     }
 
-- 
2.18.4


