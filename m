Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88496484785
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 19:11:36 +0100 (CET)
Received: from localhost ([::1]:39818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4oHX-00038L-MM
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 13:11:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n4oDG-0004M9-Sy; Tue, 04 Jan 2022 13:07:11 -0500
Received: from [2a00:1450:4864:20::435] (port=36664
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n4oDF-0006OH-BQ; Tue, 04 Jan 2022 13:07:10 -0500
Received: by mail-wr1-x435.google.com with SMTP id r17so77788667wrc.3;
 Tue, 04 Jan 2022 10:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:signed-off-by:content-transfer-encoding;
 bh=3ZZxFr5xVe+GuL3uJDgrFgJ0B4WFBTuqdC66x2MxRHY=;
 b=a3iELk3zFrKw+CWckRD/cTKv1LBR0KgAJIOfBQuqMDUdZPl6/QePrjs553ZCmewyYg
 Ol8Z3FQWE/aMhbLJFOKT9F/yzyE9eyGJj4hw5ZutZ4tCawmXgneny9CGystjmd5IDEFn
 r0UL7hEjLBPqJTDTxcVLCjHCYBjmoepKuMz4dx9lkeYCd4ndGx1+YZxzmvZPOv9lTB5l
 /3mZGBwmHAkbd3n0qKft8hnXDshEfXPVjzINrCztCxCTFhhQDwPW8725hLnjDMxqhq1l
 a+89Ohu3xObOxUjn2poOBPvitLV+aYTk+kmfnRKBWIdNwaLFl4OT6QqXSbxreJjoEkMJ
 xISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:signed-off-by:content-transfer-encoding;
 bh=3ZZxFr5xVe+GuL3uJDgrFgJ0B4WFBTuqdC66x2MxRHY=;
 b=bEvpqyi1yQprPHIZD1GqJxqsJ3Uf+Oc0QoDWvBSiyLStzDWwhQa/K8fKNVXp1z99w9
 jpwpFOkHiYuy7CxxfdKeayB7+5Fu8koyjp/S60CUGtsbf/uKzLHXs3520UAi0LeJ+rVN
 tFsUcQ+NmdAOFpcaFLgOUC1Jk74fWx9KIpY7zijUKmzlAK3I9h9j1n4y2WGohJLDNRku
 O5wWEQBaGuLqAz/Ntk6Vm7dUoZdtIBvLP/FtHTl0nwpxFilsELeqWreeNzd+eKBhvT/S
 D1PUeJ93LoxXuGSmeiG/RdKrCwFj1Bjg2GamUIKk5H/QcgrX66m6c7AAnEJcWGS6wPHf
 UW7Q==
X-Gm-Message-State: AOAM530QKCutEvEkPmYScnPtBsLANEunEnI6ABKk+9UDmTFbN+WMY/jg
 yR1ITI9M65tdq1QKrzEY3i+DDusWvGI=
X-Google-Smtp-Source: ABdhPJzGGgFlneqG2XeOVPWEMTQ0smHo+iIgBYlLWgnOb/ZfigUNI5OOdNtMWi98QLJ0ed1ZGNbnGg==
X-Received: by 2002:adf:efc5:: with SMTP id i5mr43125082wrp.263.1641319627862; 
 Tue, 04 Jan 2022 10:07:07 -0800 (PST)
Received: from localhost.localdomain (201.11.75.194.dyn.plus.net.
 [194.75.11.201])
 by smtp.googlemail.com with ESMTPSA id o11sm121997wmq.15.2022.01.04.10.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 10:07:07 -0800 (PST)
From: Carwyn Ellis <carwynellis@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/display/vmware_vga: do not discard screen updates
Date: Tue,  4 Jan 2022 18:06:59 +0000
Message-Id: <20220104180659.91619-3-carwynellis@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220104180659.91619-1-carwynellis@gmail.com>
References: <20220104180659.91619-1-carwynellis@gmail.com>
MIME-Version: 1.0
Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=carwynellis@gmail.com; helo=mail-wr1-x435.google.com
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

This change simplifies the traversal of the display update FIFO queue
when applying updates. We just track the queue length and iterate up to
the end of the queue.

Additionanlly when adding updates to the queue, if the buffer reaches
capacity we force a flush before accepting further events.

Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
---
 hw/display/trace-events |  1 +
 hw/display/vmware_vga.c | 41 +++++++++++++++++++++++------------------
 2 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/hw/display/trace-events b/hw/display/trace-events
index e1a0d2a88a..5e3cdb3fa3 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -24,6 +24,7 @@ vmware_setmode(uint32_t w, uint32_t h, uint32_t bpp) "%dx%d @ %d bpp"
 vmware_verify_rect_less_than_zero(const char *name, const char *param, int x) "%s: %s was < 0 (%d)"
 vmware_verify_rect_greater_than_bound(const char *name, const char *param, int bound, int x) "%s: %s was > %d (%d)"
 vmware_verify_rect_surface_bound_exceeded(const char *name, const char *component, int bound, const char *param1, int value1, const char *param2, int value2) "%s: %s > %d (%s: %d, %s, %d)"
+vmware_update_rect_delayed_flush(void) "display update FIFO full - forcing flush"
 
 # virtio-gpu-base.c
 virtio_gpu_features(bool virgl) "virgl %d"
diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index 0d32a605a0..e6943005e3 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -80,7 +80,7 @@ struct vmsvga_state_s {
     struct vmsvga_rect_s {
         int x, y, w, h;
     } redraw_fifo[REDRAW_FIFO_LEN];
-    int redraw_fifo_first, redraw_fifo_last;
+    int redraw_fifo_last;
 };
 
 #define TYPE_VMWARE_SVGA "vmware-svga"
@@ -372,33 +372,39 @@ static inline void vmsvga_update_rect(struct vmsvga_state_s *s,
     dpy_gfx_update(s->vga.con, x, y, w, h);
 }
 
-static inline void vmsvga_update_rect_delayed(struct vmsvga_state_s *s,
-                int x, int y, int w, int h)
-{
-    struct vmsvga_rect_s *rect = &s->redraw_fifo[s->redraw_fifo_last++];
-
-    s->redraw_fifo_last &= REDRAW_FIFO_LEN - 1;
-    rect->x = x;
-    rect->y = y;
-    rect->w = w;
-    rect->h = h;
-}
-
 static inline void vmsvga_update_rect_flush(struct vmsvga_state_s *s)
 {
     struct vmsvga_rect_s *rect;
 
     if (s->invalidated) {
-        s->redraw_fifo_first = s->redraw_fifo_last;
+        s->redraw_fifo_last = 0;
         return;
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
+    s->redraw_fifo_last = 0;
+}
+
+static inline void vmsvga_update_rect_delayed(struct vmsvga_state_s *s,
+                int x, int y, int w, int h)
+{
+
+    if (s->redraw_fifo_last >= REDRAW_FIFO_LEN) {
+        trace_vmware_update_rect_delayed_flush();
+        vmsvga_update_rect_flush(s);
+    }
+
+    struct vmsvga_rect_s *rect = &s->redraw_fifo[s->redraw_fifo_last++];
+
+    rect->x = x;
+    rect->y = y;
+    rect->w = w;
+    rect->h = h;
 }
 
 #ifdef HW_RECT_ACCEL
@@ -1151,7 +1157,6 @@ static void vmsvga_reset(DeviceState *dev)
     s->config = 0;
     s->svgaid = SVGA_ID;
     s->cursor.on = 0;
-    s->redraw_fifo_first = 0;
     s->redraw_fifo_last = 0;
     s->syncing = 0;
 
-- 
2.34.1


