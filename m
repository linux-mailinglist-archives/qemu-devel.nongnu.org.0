Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7D9407D66
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 14:54:39 +0200 (CEST)
Received: from localhost ([::1]:60540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPP0I-0007ZA-80
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 08:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1mPOy1-0004rd-Px
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 08:52:19 -0400
Received: from mailout03.t-online.de ([194.25.134.81]:35136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1mPOxz-00085G-1j
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 08:52:17 -0400
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
 by mailout03.t-online.de (Postfix) with SMTP id 81FE43FE1;
 Sun, 12 Sep 2021 14:52:13 +0200 (CEST)
Received: from linpower.localnet ([79.208.16.31]) by fwd78.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1mPOxt-157aAD0; Sun, 12 Sep 2021 14:52:09 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 05F7E200630; Sun, 12 Sep 2021 14:52:04 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 3/3] ui/console: remove chardev frontend connected test
Date: Sun, 12 Sep 2021 14:52:03 +0200
Message-Id: <20210912125203.7114-3-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <23041f12-b405-7dbc-b098-e9c48802e29c@t-online.de>
References: <23041f12-b405-7dbc-b098-e9c48802e29c@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1631451129-00016B91-73612273/0/0 CLEAN NORMAL
X-TOI-MSGID: 18f181b3-040a-4474-b64f-2f07e4c0d8a5
Received-SPF: none client-ip=194.25.134.81;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout03.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The test if the chardev frontend is connected in
kbd_put_keysym_console() is redundant, because the call
to qemu_chr_be_can_write() in kbd_send_chars() tests
the connected condition again.

Remove the redundant test whether the chardev frontend
is connected.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 ui/console.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 7b276bfc6c..a06442ed86 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -28,10 +28,11 @@
 #include "qapi/error.h"
 #include "qapi/qapi-commands-ui.h"
 #include "qemu/fifo8.h"
+#include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
 #include "qemu/timer.h"
-#include "chardev/char-fe.h"
+#include "chardev/char.h"
 #include "trace.h"
 #include "exec/memory.h"
 #include "io/channel-file.h"
@@ -1126,7 +1127,6 @@ static void kbd_send_chars(QemuConsole *s)
 void kbd_put_keysym_console(QemuConsole *s, int keysym)
 {
     uint8_t buf[16], *q;
-    CharBackend *be;
     int c;
     uint32_t free;
 
@@ -1170,12 +1170,9 @@ void kbd_put_keysym_console(QemuConsole *s, int keysym)
         if (s->echo) {
             vc_chr_write(s->chr, buf, q - buf);
         }
-        be = s->chr->be;
-        if (be && be->chr_read) {
-            free = fifo8_num_free(&s->out_fifo);
-            fifo8_push_all(&s->out_fifo, buf, MIN(free, q - buf));
-            kbd_send_chars(s);
-        }
+        free = fifo8_num_free(&s->out_fifo);
+        fifo8_push_all(&s->out_fifo, buf, MIN(free, q - buf));
+        kbd_send_chars(s);
         break;
     }
 }
-- 
2.31.1


