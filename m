Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6A31CCD15
	for <lists+qemu-devel@lfdr.de>; Sun, 10 May 2020 20:51:32 +0200 (CEST)
Received: from localhost ([::1]:58088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jXr2x-0002Vy-F0
	for lists+qemu-devel@lfdr.de; Sun, 10 May 2020 14:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1jXqv9-000868-Gt
 for qemu-devel@nongnu.org; Sun, 10 May 2020 14:43:27 -0400
Received: from mailout08.t-online.de ([194.25.134.20]:45714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1jXqv8-0005T4-Ot
 for qemu-devel@nongnu.org; Sun, 10 May 2020 14:43:27 -0400
Received: from fwd08.aul.t-online.de (fwd08.aul.t-online.de [172.20.26.151])
 by mailout08.t-online.de (Postfix) with SMTP id 9FFDA411E3C0;
 Sun, 10 May 2020 20:43:25 +0200 (CEST)
Received: from linpower.localnet
 (bR6pEQZZQhGTvGIx2LKkfKiVVWtHblG8vwx1Phx6Kl1nHSm0QRfZzqDQUs0tM80QOC@[46.86.59.135])
 by fwd08.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1jXqv7-2SgojY0; Sun, 10 May 2020 20:43:25 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id A6BE9200632; Sun, 10 May 2020 20:43:04 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 09/10] ui/gtk: don't pass on win keys without keyboard grab
Date: Sun, 10 May 2020 20:43:03 +0200
Message-Id: <20200510184304.9267-9-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <2393388c-86c3-4d7e-178e-2c7e6d14a8de@t-online.de>
References: <2393388c-86c3-4d7e-178e-2c7e6d14a8de@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: bR6pEQZZQhGTvGIx2LKkfKiVVWtHblG8vwx1Phx6Kl1nHSm0QRfZzqDQUs0tM80QOC
X-TOI-MSGID: ef055f01-332d-42aa-a346-50fa83c172d3
Received-SPF: none client-ip=194.25.134.20;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout08.t-online.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/10 14:43:07
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001 autolearn=_AUTOLEARN
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch applies commit c68f74b02e "win32: do not handle win
keys when the keyboard is not grabbed" from project spice-gtk
to ui/gtk.c.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 ui/gtk.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 5a25e3fa4c..a43fddc57f 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1085,10 +1085,17 @@ static gboolean gd_key_event(GtkWidget *widget, GdkEventKey *key, void *opaque)
     VirtualConsole *vc = opaque;
     int qcode;
 
-#ifdef WIN32
+#ifdef G_OS_WIN32
     /* on windows, we ought to ignore the reserved key event? */
     if (key->hardware_keycode == 0xff)
         return false;
+
+    if (!vc->s->kbd_owner) {
+        if (key->hardware_keycode == VK_LWIN ||
+            key->hardware_keycode == VK_RWIN) {
+            return FALSE;
+        }
+    }
 #endif
 
     if (key->keyval == GDK_KEY_Pause
-- 
2.26.1


