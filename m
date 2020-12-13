Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C62232D8EE8
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 17:59:03 +0100 (CET)
Received: from localhost ([::1]:53818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koUi6-0007Pz-Rj
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 11:59:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1koUgi-0005f5-5Z
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 11:57:37 -0500
Received: from mailout05.t-online.de ([194.25.134.82]:53070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1koUgd-0003SN-Dd
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 11:57:35 -0500
Received: from fwd39.aul.t-online.de (fwd39.aul.t-online.de [172.20.27.138])
 by mailout05.t-online.de (Postfix) with SMTP id 6E6E14227545;
 Sun, 13 Dec 2020 17:57:28 +0100 (CET)
Received: from linpower.localnet
 (Ek9QqoZ-whcrnA6x+fHTldCjtha-p66E1LdjOFCzbE7gC0yAulmxc3PwNhHa9DEQX3@[79.208.17.59])
 by fwd39.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1koUgW-1Okecy0; Sun, 13 Dec 2020 17:57:24 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 0F257200451; Sun, 13 Dec 2020 17:57:24 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 1/3] ui/gtk: don't try to redefine SI prefixes
Date: Sun, 13 Dec 2020 17:57:22 +0100
Message-Id: <20201213165724.13418-1-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <d5f2e3c5-b6d0-db4e-70c2-9de47fd8fefd@t-online.de>
References: <d5f2e3c5-b6d0-db4e-70c2-9de47fd8fefd@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: Ek9QqoZ-whcrnA6x+fHTldCjtha-p66E1LdjOFCzbE7gC0yAulmxc3PwNhHa9DEQX3
X-TOI-EXPURGATEID: 150726::1607878644-00000BD0-A2FDF743/0/0 CLEAN NORMAL
X-TOI-MSGID: 681ef9ac-db59-42af-b80f-557303083428
Received-SPF: none client-ip=194.25.134.82;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout05.t-online.de
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Nikola Pavlica <pavlica.nikola@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Redefining SI prefixes is always wrong. 1s has per definition
1000ms. Remove the misnamed named constant and replace it with
a comment explaining the frequency to period conversion in two
simple steps. Now you can cancel out the unit mHz in the comment
with the implicit unit mHz in refresh_rate_millihz and see why
the implicit unit ms for update_interval remains.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 include/ui/gtk.h | 2 --
 ui/gtk.c         | 3 ++-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index eaeb450f91..80851fb4c7 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -24,8 +24,6 @@
 #include "ui/egl-context.h"
 #endif
 
-#define MILLISEC_PER_SEC 1000000
-
 typedef struct GtkDisplayState GtkDisplayState;
 
 typedef struct VirtualGfxConsole {
diff --git a/ui/gtk.c b/ui/gtk.c
index a752aa22be..86b386a20d 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -798,7 +798,8 @@ static gboolean gd_draw_event(GtkWidget *widget, cairo_t *cr, void *opaque)
     refresh_rate_millihz = gd_refresh_rate_millihz(vc->window ?
                                                    vc->window : s->window);
     if (refresh_rate_millihz) {
-        vc->gfx.dcl.update_interval = MILLISEC_PER_SEC / refresh_rate_millihz;
+        /* T = 1 / f = 1 [s*Hz] / f = 1000*1000 [ms*mHz] / f */
+        vc->gfx.dcl.update_interval = 1000 * 1000 / refresh_rate_millihz;
     }
 
     fbw = surface_width(vc->gfx.ds);
-- 
2.26.2


