Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4116C5A17A7
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 19:05:54 +0200 (CEST)
Received: from localhost ([::1]:57168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRGIV-00073Q-Kn
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 13:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davydov-max@yandex-team.ru>)
 id 1oRGDp-0004Wk-S2
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 13:00:56 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:36448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davydov-max@yandex-team.ru>)
 id 1oRGDl-0004Xe-2N
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 13:00:48 -0400
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 117B32E125E;
 Thu, 25 Aug 2022 19:53:00 +0300 (MSK)
Received: from davydov-max-nux.yandex.net (unknown
 [2a02:6b8:0:107:fa75:a4ff:fe7d:8480])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 fXx7JLARBO-qwOWaJK4; Thu, 25 Aug 2022 19:52:59 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1661446379; bh=p4YUzmxjf/iI0Ba34ZqdENBWEgP32PKcV6bE/rc+XA8=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=QRJ1x2qX+UO9whiqHrkq5B0w3gxiCcSI4nX19jfArOSkZ23F38s4oY0+xmxJXlceI
 wFLHft3VuzIuS+5DG+YCl9asy7MDtZ7rHAw5rmoMTWs0y6mMpr6VzQtKjQwrKzM+YY
 iLDLgMUPqg/Yv4mCdAxHP22FsSPvbIvL2Yq4V0no=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Maksim Davydov <davydov-max@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, marcandre.lureau@redhat.com, yc-core@yandex-team.ru,
 davydov-max@yandex-team.ru
Subject: [PATCH] chardev: fix segfault in finalize
Date: Thu, 25 Aug 2022 19:52:47 +0300
Message-Id: <20220825165247.33704-1-davydov-max@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=davydov-max@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

If finalize chardev-msmouse or chardev-wctable is called immediately after
init it cases QEMU to crash with segfault. This happens because of
QTAILQ_REMOVE in qemu_input_handler_unregister tries to dereference
NULL pointer.
For instance, this error can be reproduced via `qom-list-properties`
command.

Signed-off-by: Maksim Davydov <davydov-max@yandex-team.ru>
---
 chardev/msmouse.c  | 4 +++-
 chardev/wctablet.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/chardev/msmouse.c b/chardev/msmouse.c
index eb9231dcdb..2cc1b16561 100644
--- a/chardev/msmouse.c
+++ b/chardev/msmouse.c
@@ -146,7 +146,9 @@ static void char_msmouse_finalize(Object *obj)
 {
     MouseChardev *mouse = MOUSE_CHARDEV(obj);
 
-    qemu_input_handler_unregister(mouse->hs);
+    if (mouse->hs) {
+        qemu_input_handler_unregister(mouse->hs);
+    }
 }
 
 static QemuInputHandler msmouse_handler = {
diff --git a/chardev/wctablet.c b/chardev/wctablet.c
index e8b292c43c..43bdf6b608 100644
--- a/chardev/wctablet.c
+++ b/chardev/wctablet.c
@@ -319,7 +319,9 @@ static void wctablet_chr_finalize(Object *obj)
 {
     TabletChardev *tablet = WCTABLET_CHARDEV(obj);
 
-    qemu_input_handler_unregister(tablet->hs);
+    if (tablet->hs) {
+        qemu_input_handler_unregister(tablet->hs);
+    }
 }
 
 static void wctablet_chr_open(Chardev *chr,
-- 
2.25.1


