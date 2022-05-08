Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8217B51F1A3
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 22:38:18 +0200 (CEST)
Received: from localhost ([::1]:51734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnnfV-0007Pv-Li
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 16:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn5X-0000F5-Mz
 for qemu-devel@nongnu.org; Sun, 08 May 2022 16:01:07 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:55528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn5V-0007bS-6p
 for qemu-devel@nongnu.org; Sun, 08 May 2022 16:01:07 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn45-0000yR-HN; Sun, 08 May 2022 20:59:37 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Sun,  8 May 2022 20:56:50 +0100
Message-Id: <20220508195650.28590-54-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220508195650.28590-1-mark.cave-ayland@ilande.co.uk>
References: <20220508195650.28590-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 53/53] artist: only render dirty scanlines on the display
 surface
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The framebuffer_update_display() function returns the dirty scanlines that were
touched since the last display update, however artist_update_display() always calls
dpy_gfx_update() with start and end scanlines of 0 and s->height causing the
entire display surface to be rendered on every update.

Update artist_update_display() so that dpy_gfx_update() only renders the dirty
scanlines on the display surface, bypassing the display surface rendering
completely if framebuffer_update_display() indicates no changes occurred.

This noticeably improves boot performance when the framebuffer is enabled on my
rather modest laptop here, including making the GTK UI usable.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220504153708.10352-4-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Helge Deller <deller@gmx.de>
Reviewed-by: Sven Schnelle <svens@stackframe.org>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/display/artist.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index 4a9f7b5e59..39fc0c4ca5 100644
--- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -1243,7 +1243,9 @@ static void artist_update_display(void *opaque)
 
     artist_draw_cursor(s);
 
-    dpy_gfx_update(s->con, 0, 0, s->width, s->height);
+    if (first >= 0) {
+        dpy_gfx_update(s->con, 0, first, s->width, last - first + 1);
+    }
 }
 
 static void artist_invalidate(void *opaque)
-- 
2.20.1


