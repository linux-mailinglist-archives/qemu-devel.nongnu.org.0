Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B10D5483EEE
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 10:14:14 +0100 (CET)
Received: from localhost ([::1]:37450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ftV-0004do-98
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 04:14:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n4fr9-0002DF-5s; Tue, 04 Jan 2022 04:11:47 -0500
Received: from [2a00:1450:4864:20::430] (port=44763
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n4fr6-0005qX-IE; Tue, 04 Jan 2022 04:11:45 -0500
Received: by mail-wr1-x430.google.com with SMTP id k18so38050332wrg.11;
 Tue, 04 Jan 2022 01:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:signed-off-by:content-transfer-encoding;
 bh=gUacSFKzE5d5rBkE0IE8ydFAm3pspR29oFymbe1laec=;
 b=SpKzP18pDwRB1xifWNNtl9TFaPh0aJws361lD4xeCT+gtsLE0YBP5v1vuIOO4xEFe+
 far3TaCH9ZwmUfdmuB94xVcbEjKVJutFm0V6OslAK2FNtrxGpuUy8WdUQGtHk4u0HLqH
 4yy33EpsuvQ6cBB2BUe/S0ncAEsGmqk/iW4oyIGwRFboT/4aIG61qaKGFo67FNVRg5gw
 bc6cNcqvW48Y66FlG6wTFD9+Va0952xEexNNRgfSNERYO5OQP6UhNk5lHlUtnpgdcCGz
 ydepL4+u4XtVwoBNO7PH7EdJm13SI5vU5R7kLlN/s56K3TPNdmNvXoJ5b8MOc35yYE3I
 b29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:signed-off-by:content-transfer-encoding;
 bh=gUacSFKzE5d5rBkE0IE8ydFAm3pspR29oFymbe1laec=;
 b=0G4UY8XKFxKG4iPaflNpnOyUWzDz4vwCn7pWnl2/Rc4jw7Rd638wmiL/zQ7fgojYXc
 MwhCZRAUasfDpBMZFyy9tXiGqMEAjwhkhBuc4zskRbCzdWQOessz4O2GPsq8ekyeexNM
 q7SFLurWM200vks+yWk/qpLSMa/gsrUYRzhrfCHZVZgFwuwfSY/OgtaYVnqkeL04Mh1+
 v3ujECR8WJRv+lqvtssX1n4vm6WnxSKTlz511WZAmfQRyyKAZNgZJ47wWLYS5t0sjxG/
 encgiVbvpHgyURHyw4Agz+TqNnc1GhhXBPtSxwVp0f84LM5TBzksVRUgbCfvpTB15ohC
 1wFA==
X-Gm-Message-State: AOAM531APhV0b99VNR/wistdT0y+3ZeeyFqsHoMJVm1XDJ/M7Jiu906u
 yKVBPpUXpb6Poiv1C0A0vmoFsHr/72c=
X-Google-Smtp-Source: ABdhPJy4qjtVGrsr+hEhVNUB7ihCAz2F028GLx2Z5W7uxk9LZ5mjnGfEmBTonAIhMr516WcgIgJZNg==
X-Received: by 2002:a05:6000:118a:: with SMTP id
 g10mr40146559wrx.533.1641287502957; 
 Tue, 04 Jan 2022 01:11:42 -0800 (PST)
Received: from localhost.localdomain (201.11.75.194.dyn.plus.net.
 [194.75.11.201])
 by smtp.googlemail.com with ESMTPSA id c11sm43962844wmq.48.2022.01.04.01.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 01:11:42 -0800 (PST)
From: Carwyn Ellis <carwynellis@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/display/vmware_vga: do not discard screen updates
Date: Tue,  4 Jan 2022 09:11:35 +0000
Message-Id: <20220104091135.61226-3-carwynellis@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220104091135.61226-1-carwynellis@gmail.com>
References: <20220104091135.61226-1-carwynellis@gmail.com>
MIME-Version: 1.0
Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=carwynellis@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Carwyn Ellis <carwynellis@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In certain circumstances, typically when there is lots changing on the
screen, updates will be discarded resulting in garbled output.

This change firstly increases the screen update FIFO size to ensure it's
large enough to accomodate all updates deferred in a given screen
refresh cycle.

When updating the screen all updates are applied to ensure the display
output is rendered correctly.

Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
---
 hw/display/vmware_vga.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index 8080e085d1..28556f39c6 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -82,7 +82,7 @@ struct vmsvga_state_s {
     uint32_t fifo_next;
     uint32_t fifo_stop;
 
-#define REDRAW_FIFO_LEN  512
+#define REDRAW_FIFO_LEN  8192
     struct vmsvga_rect_s {
         int x, y, w, h;
     } redraw_fifo[REDRAW_FIFO_LEN];
@@ -385,7 +385,14 @@ static inline void vmsvga_update_rect_delayed(struct vmsvga_state_s *s,
 {
     struct vmsvga_rect_s *rect = &s->redraw_fifo[s->redraw_fifo_last++];
 
-    s->redraw_fifo_last &= REDRAW_FIFO_LEN - 1;
+    if (s->redraw_fifo_last >= REDRAW_FIFO_LEN) {
+        VMWARE_VGA_DEBUG("%s: Discarding updates - FIFO length %d exceeded\n",
+            "vmsvga_update_rect_delayed",
+            REDRAW_FIFO_LEN
+        );
+        s->redraw_fifo_last = REDRAW_FIFO_LEN - 1;
+    }
+
     rect->x = x;
     rect->y = y;
     rect->w = w;
@@ -402,11 +409,13 @@ static inline void vmsvga_update_rect_flush(struct vmsvga_state_s *s)
     }
     /* Overlapping region updates can be optimised out here - if someone
      * knows a smart algorithm to do that, please share.  */
-    while (s->redraw_fifo_first != s->redraw_fifo_last) {
-        rect = &s->redraw_fifo[s->redraw_fifo_first++];
-        s->redraw_fifo_first &= REDRAW_FIFO_LEN - 1;
+    for (int i = 0; i < s->redraw_fifo_last; i++) {
+        rect = &s->redraw_fifo[i];
         vmsvga_update_rect(s, rect->x, rect->y, rect->w, rect->h);
     }
+
+    s->redraw_fifo_first = 0;
+    s->redraw_fifo_last = 0;
 }
 
 #ifdef HW_RECT_ACCEL
@@ -607,13 +616,14 @@ static inline uint32_t vmsvga_fifo_read(struct vmsvga_state_s *s)
 static void vmsvga_fifo_run(struct vmsvga_state_s *s)
 {
     uint32_t cmd, colour;
-    int args, len, maxloop = 1024;
+    int args, len = 1024;
     int x, y, dx, dy, width, height;
     struct vmsvga_cursor_definition_s cursor;
     uint32_t cmd_start;
 
     len = vmsvga_fifo_length(s);
-    while (len > 0 && --maxloop > 0) {
+
+    while (len > 0) {
         /* May need to go back to the start of the command if incomplete */
         cmd_start = s->fifo_stop;
 
-- 
2.34.1


