Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D172A922B
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Nov 2020 10:12:14 +0100 (CET)
Received: from localhost ([::1]:43666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaxn3-00056Y-35
	for lists+qemu-devel@lfdr.de; Fri, 06 Nov 2020 04:12:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lichun@ruijie.com.cn>)
 id 1kaxkn-0002Ly-Qz
 for qemu-devel@nongnu.org; Fri, 06 Nov 2020 04:09:53 -0500
Received: from [240e:678:8c0:5::c0a8:3a63] (port=61549
 helo=FZEX4.ruijie.com.cn)
 by eggs.gnu.org with esmtps (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lichun@ruijie.com.cn>)
 id 1kaxkk-00058N-45
 for qemu-devel@nongnu.org; Fri, 06 Nov 2020 04:09:52 -0500
Received: from centos.localdomain (172.20.101.108) by FZEX4.ruijie.com.cn
 (192.168.58.89) with Microsoft SMTP Server id 14.3.123.3; Fri, 6 Nov 2020
 17:03:46 +0800
From: lichun <lichun@ruijie.com.cn>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] console: avoid passing con=NULL to graphic_hw_update_done()
 In graphic_hw_update(), first select an existing console,
 a specific-console or active_console(if not specified),
 then updating the console.
Date: Sat, 7 Nov 2020 01:03:39 +0800
Message-ID: <1604682219-114389-1-git-send-email-lichun@ruijie.com.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.20.101.108]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 240e:678:8c0:5::c0a8:3a63
 (failed)
Received-SPF: permerror client-ip=240e:678:8c0:5::c0a8:3a63;
 envelope-from=lichun@ruijie.com.cn; helo=FZEX4.ruijie.com.cn
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 28
X-Spam_score: 2.8
X-Spam_bar: ++
X-Spam_report: (2.8 / 5.0 requ) BAYES_40=-0.001, DATE_IN_FUTURE_06_12=1.947,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 T_SPF_PERMERROR=0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, lichun <lichun@ruijie.com.cn>, 706701795@qq.com,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: lichun <lichun@ruijie.com.cn>
---
 ui/console.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index e8e5970..e07d2c3 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -270,10 +270,11 @@ void graphic_hw_update_done(QemuConsole *con)
 void graphic_hw_update(QemuConsole *con)
 {
     bool async = false;
+    con = con ? con : active_console;
     if (!con) {
-        con = active_console;
+        return;
     }
-    if (con && con->hw_ops->gfx_update) {
+    if (con->hw_ops->gfx_update) {
         con->hw_ops->gfx_update(con->hw);
         async = con->hw_ops->gfx_update_async;
     }
-- 
1.8.3.1


