Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D9F32F235
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:13:06 +0100 (CET)
Received: from localhost ([::1]:36814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEwk-0002UP-05
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:13:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3O-0006wU-U7
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:54 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:37414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE32-0007YL-Ly
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:54 -0500
Received: by mail-wr1-x444.google.com with SMTP id v15so2900774wrx.4
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hGveFUw35dofH+JM1Luu2Fax7+Pq8TNijJmfB2mXnXg=;
 b=GnCkweInjQ3u2PYdwPsKkzob6En5++HCLOg7Z34slcpldDXTyHP6Zc9SG1RJnhGA7g
 o9iWRGO6KbjtKDbC4W12xkklgrYG4Gcd4K22c34VZtLSKFfiRpS4q1DLX2nmKi71ljQl
 wcyD552fPBJl+eh813oaHyZ0IwrEQTpLsd7LRienRZkCh9PusvVEdbIGvQpNmDgWCd3+
 MxaK7UiyeQXFDe+1fRIDGXkh8ORoVraita9cIkkJ/vcEcqy96t8pH94YIWG7WHb2/gIJ
 kTewoH3ALi+dDUDNakIVnxA2JhCohXI+Gov3NFJh7hkmoupiAA0tqsovjUJkmlcAx/VC
 eadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hGveFUw35dofH+JM1Luu2Fax7+Pq8TNijJmfB2mXnXg=;
 b=acES/3WtA8LJiLa2zUozJrwtlHWC3C6rMKVoOZlmqV03bt/14MnueqV18KGkl8Rj6r
 KirZWaYLcfQLFd7pcWV/5IvJVWdWnoSP3N6oDgKbDzEofo0LeZauOlbJpL1F9699qWhk
 nKUXBCdBkDN9fKidJOCISo7OJhRoiivqqDouSUmSnJtmtOUM0mnEY44kdB4kUj2vmZX+
 zxSAI4Mqq/0Ey4gIr/eMJprDEmxPwoGQqZDIGmkQw+RUrkGgTSF7RCzBXlqiJkgBecbs
 v2qiJv/25l9n+wXUX9pStutbhos6LW5dlwUjYacJrW1fhjq/UdJ/M8DpLQtwXGZELiLD
 FBIQ==
X-Gm-Message-State: AOAM5327iNaCDhS+FIOODA6da/WPXWp3Yp+EEvL0S2jrDGx0peEkiSFM
 NlsTkgMu4nd4wuWdvQthFpGC1XJIZ1vpEQ==
X-Google-Smtp-Source: ABdhPJzP9fDY2j3WjK4W4J8Z9EpCkK+xNugnnTLNctDtDFJNoOw3pX0EPRmnCXgTldI8wdOo62vYUQ==
X-Received: by 2002:a5d:4b50:: with SMTP id w16mr10172354wrs.34.1614964531366; 
 Fri, 05 Mar 2021 09:15:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/49] hw/display/tc6393xb: Inline tc6393xb_draw_graphic32() at
 its callsite
Date: Fri,  5 Mar 2021 17:14:45 +0000
Message-Id: <20210305171515.1038-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function tc6393xb_draw_graphic32() is called in exactly one place,
so just inline the function body at its callsite. This allows us to
drop the template header entirely.

The code move includes a single added space after 'for' to fix
the coding style.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210215103215.4944-5-peter.maydell@linaro.org
---
 hw/display/tc6393xb_template.h | 45 ----------------------------------
 hw/display/tc6393xb.c          | 23 ++++++++++++++---
 2 files changed, 19 insertions(+), 49 deletions(-)
 delete mode 100644 hw/display/tc6393xb_template.h

diff --git a/hw/display/tc6393xb_template.h b/hw/display/tc6393xb_template.h
deleted file mode 100644
index 7789ffc4399..00000000000
--- a/hw/display/tc6393xb_template.h
+++ /dev/null
@@ -1,45 +0,0 @@
-/*
- * Toshiba TC6393XB I/O Controller.
- * Found in Sharp Zaurus SL-6000 (tosa) or some
- * Toshiba e-Series PDAs.
- *
- * FB support code. Based on G364 fb emulator
- *
- * Copyright (c) 2007 Hervé Poussineau
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation; either version 2 of
- * the License, or (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-
-static void tc6393xb_draw_graphic32(TC6393xbState *s)
-{
-    DisplaySurface *surface = qemu_console_surface(s->con);
-    int i;
-    uint16_t *data_buffer;
-    uint8_t *data_display;
-
-    data_buffer = s->vram_ptr;
-    data_display = surface_data(surface);
-    for(i = 0; i < s->scr_height; i++) {
-        int j;
-        for (j = 0; j < s->scr_width; j++, data_display += 4, data_buffer++) {
-            uint16_t color = *data_buffer;
-            uint32_t dest_color = rgb_to_pixel32(
-                           ((color & 0xf800) * 0x108) >> 11,
-                           ((color & 0x7e0) * 0x41) >> 9,
-                           ((color & 0x1f) * 0x21) >> 2
-                           );
-            *(uint32_t *)data_display = dest_color;
-        }
-    }
-}
diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c
index 4cddb1a99ad..1f28223c7be 100644
--- a/hw/display/tc6393xb.c
+++ b/hw/display/tc6393xb.c
@@ -410,12 +410,27 @@ static void tc6393xb_nand_writeb(TC6393xbState *s, hwaddr addr, uint32_t value)
                                         (uint32_t) addr, value & 0xff);
 }
 
-#define BITS 32
-#include "tc6393xb_template.h"
-
 static void tc6393xb_draw_graphic(TC6393xbState *s, int full_update)
 {
-    tc6393xb_draw_graphic32(s);
+    DisplaySurface *surface = qemu_console_surface(s->con);
+    int i;
+    uint16_t *data_buffer;
+    uint8_t *data_display;
+
+    data_buffer = s->vram_ptr;
+    data_display = surface_data(surface);
+    for (i = 0; i < s->scr_height; i++) {
+        int j;
+        for (j = 0; j < s->scr_width; j++, data_display += 4, data_buffer++) {
+            uint16_t color = *data_buffer;
+            uint32_t dest_color = rgb_to_pixel32(
+                           ((color & 0xf800) * 0x108) >> 11,
+                           ((color & 0x7e0) * 0x41) >> 9,
+                           ((color & 0x1f) * 0x21) >> 2
+                           );
+            *(uint32_t *)data_display = dest_color;
+        }
+    }
     dpy_gfx_update_full(s->con);
 }
 
-- 
2.20.1


