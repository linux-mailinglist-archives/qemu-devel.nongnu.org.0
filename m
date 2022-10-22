Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26B460965E
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Oct 2022 23:06:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omgWw-0000TV-TP
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 15:21:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1omFFk-0003QQ-Jr; Sat, 22 Oct 2022 10:13:32 -0400
Received: from mailout12.t-online.de ([194.25.134.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1omFFi-0001HZ-PQ; Sat, 22 Oct 2022 10:13:32 -0400
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
 by mailout12.t-online.de (Postfix) with SMTP id 790B7BCB8;
 Sat, 22 Oct 2022 16:12:06 +0200 (CEST)
Received: from linpower.localnet ([84.175.228.229]) by fwd74.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1omFEK-3i8pnt0; Sat, 22 Oct 2022 16:12:04 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 1AC9F2000A4; Sat, 22 Oct 2022 16:12:04 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: [PATCH] ui: remove useless typecasts
Date: Sat, 22 Oct 2022 16:12:04 +0200
Message-Id: <20221022141204.29358-1-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1666447924-CACB7B6F-C9A8A810/0/0 CLEAN NORMAL
X-TOI-MSGID: fc122d45-d8f3-49cb-b22a-ec1a9c890cf5
Received-SPF: none client-ip=194.25.134.22;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout12.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Commit 8f9abdf586 ("chardev: src buffer const for write functions")
changed the type of the second parameter of qemu_chr_be_write()
from uint8_t * to const uint8_t *. Remove the now useless type
casts from qemu_chr_be_write() function calls in ui/console.c and
ui/gtk.c.

Cc: qemu-trivial@nongnu.org
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 ui/console.c | 2 +-
 ui/gtk.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 49da6a91df..65c117874c 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1297,7 +1297,7 @@ static void kbd_send_chars(QemuConsole *s)
         uint32_t size;
 
         buf = fifo8_pop_buf(&s->out_fifo, MIN(len, avail), &size);
-        qemu_chr_be_write(s->chr, (uint8_t *)buf, size);
+        qemu_chr_be_write(s->chr, buf, size);
         len = qemu_chr_be_can_write(s->chr);
         avail -= size;
     }
diff --git a/ui/gtk.c b/ui/gtk.c
index 92daaa6a6e..7ec21f7798 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1763,7 +1763,7 @@ static void gd_vc_send_chars(VirtualConsole *vc)
         uint32_t size;
 
         buf = fifo8_pop_buf(&vc->vte.out_fifo, MIN(len, avail), &size);
-        qemu_chr_be_write(vc->vte.chr, (uint8_t *)buf, size);
+        qemu_chr_be_write(vc->vte.chr, buf, size);
         len = qemu_chr_be_can_write(vc->vte.chr);
         avail -= size;
     }
-- 
2.35.3


