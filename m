Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9802E3E5399
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 08:37:08 +0200 (CEST)
Received: from localhost ([::1]:59152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDLNr-0007v5-2h
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 02:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1mDLMq-00079l-5t
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 02:36:04 -0400
Received: from mailout04.t-online.de ([194.25.134.18]:39748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1mDLMo-0003di-0m
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 02:36:03 -0400
Received: from fwd29.aul.t-online.de (fwd29.aul.t-online.de [172.20.26.134])
 by mailout04.t-online.de (Postfix) with SMTP id EB4F85929;
 Tue, 10 Aug 2021 08:32:57 +0200 (CEST)
Received: from linpower.localnet
 (ZY2wl+ZU8hMPLfKKqrJFDBx3++FrTlDWFdkoeZURgoQnzsT-Z+X5dN-31WvXFDOwFh@[79.208.26.7])
 by fwd29.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1mDLJp-2J2SJM0; Tue, 10 Aug 2021 08:32:57 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 1FCC0200452; Tue, 10 Aug 2021 08:32:57 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH for 6.1] ui/gtk: retry sending VTE console input
Date: Tue, 10 Aug 2021 08:32:57 +0200
Message-Id: <20210810063257.17411-1-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: ZY2wl+ZU8hMPLfKKqrJFDBx3++FrTlDWFdkoeZURgoQnzsT-Z+X5dN-31WvXFDOwFh
X-TOI-EXPURGATEID: 150726::1628577177-00012BF3-36C95722/0/0 CLEAN NORMAL
X-TOI-MSGID: 39d95cd8-ac99-48e0-9e0f-e140e734e5ae
Received-SPF: none client-ip=194.25.134.18;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout04.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 584af1f1d9 ("ui/gtk: add a keyboard fifo to the VTE
consoles") changed the VTE chardev backend code to rely on the
chr_accept_input() callback function. The code expects a
chr_accept_input() call whenever qemu_chr_be_can_write() bytes
were written. It turns out this is wrong. Some chardev
frontends only call this callback after can_write was 0.

Change the code to send data until the keyboard fifo is empty
or qemu_chr_be_can_write() returns 0.

Fixes: 584af1f1d9 ("ui/gtk: add a keyboard fifo to the VTE consoles")
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 ui/gtk.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 974e4dfc0b..cfb0728d1f 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1646,16 +1646,14 @@ static void gd_vc_send_chars(VirtualConsole *vc)
 
     len = qemu_chr_be_can_write(vc->vte.chr);
     avail = fifo8_num_used(&vc->vte.out_fifo);
-    if (len > avail) {
-        len = avail;
-    }
-    while (len > 0) {
+    while (len > 0 && avail > 0) {
         const uint8_t *buf;
         uint32_t size;
 
-        buf = fifo8_pop_buf(&vc->vte.out_fifo, len, &size);
+        buf = fifo8_pop_buf(&vc->vte.out_fifo, MIN(len, avail), &size);
         qemu_chr_be_write(vc->vte.chr, (uint8_t *)buf, size);
-        len -= size;
+        len = qemu_chr_be_can_write(vc->vte.chr);
+        avail -= size;
     }
 }
 
-- 
2.26.2


