Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1D547D975
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 23:59:31 +0100 (CET)
Received: from localhost ([::1]:60210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Aa2-0004Or-GD
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 17:59:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1n0AWv-0002Hw-N6
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 17:56:19 -0500
Received: from [2a00:1450:4864:20::530] (port=41678
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1n0AWr-0002Q6-Gj
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 17:56:15 -0500
Received: by mail-ed1-x530.google.com with SMTP id b13so14187775edd.8
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 14:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5kdp0snb3SFSbv62l+V5oc1HsNnrPydAEd/264gvRo4=;
 b=NxZ15at1KMKLRjpl25D72e5iV1QvciryiNPRySCo5c/+7i+wgd54NEmrIoNIlY387P
 o0NjISgoADJBr5Fq4+mkSvjGCdj1vvjRZ6frauCmwt+TDkM7oB1ofSyF2HGza6z3ftHu
 C4n/ixxhTQmTAoujaP5ikZvIfP5b7nglHQl0P6ji/hcMAFnBx8WkWMgMLie3umpfTgy2
 Y/TIsHrpbsHGDIB9AVXZxJLiJMrLo70G+3JleHfhR3YJ4kKeWkEZc4+7VOdzcEbH7VU/
 khU6cniMpdLJTb5hBFy/1MlEUEP2eNp4bTWx7aEl4Et4TrbpLfE1pC2Fcwggat5Encsy
 goBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5kdp0snb3SFSbv62l+V5oc1HsNnrPydAEd/264gvRo4=;
 b=SN+rWjbB7O4wQIo2Lw7CuSG4g+xwH/VdcwnXdoGoSSW6nOK+Pd/t7fynhyRo5pjSeq
 RhcyqYwE5Ctd4wcg6UaN7iZHxBaMtLG2Q5Ykv51ymB6jff5fOP9Lj/knsInk0BQu4Fki
 zlWcpmXRTdpxpoapsh7PcpGO/nA0SAhMZYN/XL3tA9+LXUZHXOUy7nxfwOJzzFeu7l2o
 JW+PFG7mf3iENWrr3ffdRC83u+Xgo+NJmSpW180xdB2Wr/kDfohdxs5F6kMe+QJnKO6o
 CwMrQKg1Bxe8yxKaC9AYHRr4lkItLBix4K9D8D8qkfaCEpieZ03OhMiQdqMiDjt0jz5W
 M24g==
X-Gm-Message-State: AOAM530wxj0G/tfDns/bCL50ssi8SpEXJz5lczRHTcPwp1Ryvp13zpv0
 f+Ys64C8cuoFMPsFut/9d3vaHFWVs5g=
X-Google-Smtp-Source: ABdhPJz4Zm5jV6b+fzU7YP5S4O9UI5zWTBGv+1zo/Uuo/TY9t8j6ZrS+2j/tVprTu43yeRgqCNINZA==
X-Received: by 2002:a05:6402:16cd:: with SMTP id
 r13mr4668816edx.264.1640213769815; 
 Wed, 22 Dec 2021 14:56:09 -0800 (PST)
Received: from owl.kpn ([2a02:a467:f77d:1:deba:f393:276b:fad2])
 by smtp.gmail.com with ESMTPSA id gv11sm1097226ejc.135.2021.12.22.14.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 14:56:09 -0800 (PST)
From: Dmitry Petrov <dpetroff@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/5] ui/gtk: pass horizontal scroll information to the
 device code
Date: Wed, 22 Dec 2021 23:56:04 +0100
Message-Id: <20211222225606.1359162-4-dpetroff@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211222225606.1359162-1-dpetroff@gmail.com>
References: <20211222225606.1359162-1-dpetroff@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=dpetroff@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Dmitry Petrov <dpetroff@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Dmitry Petrov <dpetroff@gmail.com>
---
 ui/gtk.c | 54 ++++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 12 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 6a1f65d518..a8567b9ddc 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -968,33 +968,63 @@ static gboolean gd_scroll_event(GtkWidget *widget, GdkEventScroll *scroll,
                                 void *opaque)
 {
     VirtualConsole *vc = opaque;
-    InputButton btn;
+    InputButton btn_vertical;
+    InputButton btn_horizontal;
+    bool has_vertical = false;
+    bool has_horizontal = false;
 
     if (scroll->direction == GDK_SCROLL_UP) {
-        btn = INPUT_BUTTON_WHEEL_UP;
+        btn_vertical = INPUT_BUTTON_WHEEL_UP;
+        has_vertical = true;
     } else if (scroll->direction == GDK_SCROLL_DOWN) {
-        btn = INPUT_BUTTON_WHEEL_DOWN;
+        btn_vertical = INPUT_BUTTON_WHEEL_DOWN;
+        has_vertical = true;
+    } else if (scroll->direction == GDK_SCROLL_LEFT) {
+        btn_horizontal = INPUT_BUTTON_WHEEL_LEFT;
+        has_horizontal = true;
+    } else if (scroll->direction == GDK_SCROLL_RIGHT) {
+        btn_horizontal = INPUT_BUTTON_WHEEL_RIGHT;
+        has_horizontal = true;
     } else if (scroll->direction == GDK_SCROLL_SMOOTH) {
         gdouble delta_x, delta_y;
         if (!gdk_event_get_scroll_deltas((GdkEvent *)scroll,
                                          &delta_x, &delta_y)) {
             return TRUE;
         }
-        if (delta_y == 0) {
-            return TRUE;
-        } else if (delta_y > 0) {
-            btn = INPUT_BUTTON_WHEEL_DOWN;
+
+        if (delta_y > 0) {
+            btn_vertical = INPUT_BUTTON_WHEEL_DOWN;
+            has_vertical = true;
+        } else if (delta_y < 0) {
+            btn_vertical = INPUT_BUTTON_WHEEL_UP;
+            has_vertical = true;
+        } else if (delta_x > 0) {
+            btn_horizontal = INPUT_BUTTON_WHEEL_RIGHT;
+            has_horizontal = true;
+        } else if (delta_x < 0) {
+            btn_horizontal = INPUT_BUTTON_WHEEL_LEFT;
+            has_horizontal = true;
         } else {
-            btn = INPUT_BUTTON_WHEEL_UP;
+            return TRUE;
         }
     } else {
         return TRUE;
     }
 
-    qemu_input_queue_btn(vc->gfx.dcl.con, btn, true);
-    qemu_input_event_sync();
-    qemu_input_queue_btn(vc->gfx.dcl.con, btn, false);
-    qemu_input_event_sync();
+    if (has_vertical) {
+        qemu_input_queue_btn(vc->gfx.dcl.con, btn_vertical, true);
+        qemu_input_event_sync();
+        qemu_input_queue_btn(vc->gfx.dcl.con, btn_vertical, false);
+        qemu_input_event_sync();
+    }
+
+    if (has_horizontal) {
+        qemu_input_queue_btn(vc->gfx.dcl.con, btn_horizontal, true);
+        qemu_input_event_sync();
+        qemu_input_queue_btn(vc->gfx.dcl.con, btn_horizontal, false);
+        qemu_input_event_sync();
+    }
+
     return TRUE;
 }
 
-- 
2.32.0


