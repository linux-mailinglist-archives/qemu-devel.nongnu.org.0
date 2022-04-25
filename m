Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC0750D967
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 08:27:21 +0200 (CEST)
Received: from localhost ([::1]:53670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nisBq-0000zN-BF
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 02:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nirvi-0003gJ-UA
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 02:10:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nirvg-0006IT-8x
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 02:10:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650867033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oJ9Ufvj12vzxAT3bkAQJ/3nh94mDOPCyRdbWI9L4yLw=;
 b=LnMogsVrBUlfho0McYJtZFS4WM9I/cjyRpFdfEBNV7y3h38youtmI0r5cd9z+vSW+iy+Od
 gSS0xz7jjIk4tSIN3YqHezxIoQIN1NVF3Jo69EN90w+NSx+zQuq3j4pVjQDnRXeUtwjjcA
 m1KLtaguKZR8eDczTYVnEm91JUkhHYA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-ftfI9Nr-PleUMiVIeY58Jw-1; Mon, 25 Apr 2022 02:10:31 -0400
X-MC-Unique: ftfI9Nr-PleUMiVIeY58Jw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 574483804062;
 Mon, 25 Apr 2022 06:10:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 074E7463DF9;
 Mon, 25 Apr 2022 06:10:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C568B18003BA; Mon, 25 Apr 2022 08:10:29 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/6] hw/display/vmware_vga: do not discard screen updates
Date: Mon, 25 Apr 2022 08:10:24 +0200
Message-Id: <20220425061029.3932731-2-kraxel@redhat.com>
In-Reply-To: <20220425061029.3932731-1-kraxel@redhat.com>
References: <20220425061029.3932731-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Carwyn Ellis <carwynellis@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Carwyn Ellis <carwynellis@gmail.com>

In certain circumstances, typically when there is lots changing on the
screen, updates will be discarded resulting in garbled output.

This change simplifies the traversal of the display update FIFO queue
when applying updates. We just track the queue length and iterate up to
the end of the queue.

Additionally when adding updates to the queue, if the buffer reaches
capacity we force a flush before accepting further events.

Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
Message-Id: <20220206183956.10694-3-carwynellis@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/vmware_vga.c | 45 +++++++++++++++++++++++------------------
 hw/display/trace-events |  1 +
 2 files changed, 26 insertions(+), 20 deletions(-)

diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index 45d06cbe2544..cedbbde522ec 100644
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
@@ -380,35 +380,41 @@ static inline void vmsvga_update_rect(struct vmsvga_state_s *s,
     dpy_gfx_update(s->vga.con, x, y, w, h);
 }
 
+static inline void vmsvga_update_rect_flush(struct vmsvga_state_s *s)
+{
+    struct vmsvga_rect_s *rect;
+
+    if (s->invalidated) {
+        s->redraw_fifo_last = 0;
+        return;
+    }
+    /* Overlapping region updates can be optimised out here - if someone
+     * knows a smart algorithm to do that, please share.  */
+    for (int i = 0; i < s->redraw_fifo_last; i++) {
+        rect = &s->redraw_fifo[i];
+        vmsvga_update_rect(s, rect->x, rect->y, rect->w, rect->h);
+    }
+
+    s->redraw_fifo_last = 0;
+}
+
 static inline void vmsvga_update_rect_delayed(struct vmsvga_state_s *s,
                 int x, int y, int w, int h)
 {
+
+    if (s->redraw_fifo_last >= REDRAW_FIFO_LEN) {
+        trace_vmware_update_rect_delayed_flush();
+        vmsvga_update_rect_flush(s);
+    }
+
     struct vmsvga_rect_s *rect = &s->redraw_fifo[s->redraw_fifo_last++];
 
-    s->redraw_fifo_last &= REDRAW_FIFO_LEN - 1;
     rect->x = x;
     rect->y = y;
     rect->w = w;
     rect->h = h;
 }
 
-static inline void vmsvga_update_rect_flush(struct vmsvga_state_s *s)
-{
-    struct vmsvga_rect_s *rect;
-
-    if (s->invalidated) {
-        s->redraw_fifo_first = s->redraw_fifo_last;
-        return;
-    }
-    /* Overlapping region updates can be optimised out here - if someone
-     * knows a smart algorithm to do that, please share.  */
-    while (s->redraw_fifo_first != s->redraw_fifo_last) {
-        rect = &s->redraw_fifo[s->redraw_fifo_first++];
-        s->redraw_fifo_first &= REDRAW_FIFO_LEN - 1;
-        vmsvga_update_rect(s, rect->x, rect->y, rect->w, rect->h);
-    }
-}
-
 #ifdef HW_RECT_ACCEL
 static inline int vmsvga_copy_rect(struct vmsvga_state_s *s,
                 int x0, int y0, int x1, int y1, int w, int h)
@@ -1161,7 +1167,6 @@ static void vmsvga_reset(DeviceState *dev)
     s->config = 0;
     s->svgaid = SVGA_ID;
     s->cursor.on = 0;
-    s->redraw_fifo_first = 0;
     s->redraw_fifo_last = 0;
     s->syncing = 0;
 
diff --git a/hw/display/trace-events b/hw/display/trace-events
index 91efc88f04f5..0c0ffcbe42c1 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -24,6 +24,7 @@ vmware_setmode(uint32_t w, uint32_t h, uint32_t bpp) "%dx%d @ %d bpp"
 vmware_verify_rect_less_than_zero(const char *name, const char *param, int x) "%s: %s was < 0 (%d)"
 vmware_verify_rect_greater_than_bound(const char *name, const char *param, int bound, int x) "%s: %s was > %d (%d)"
 vmware_verify_rect_surface_bound_exceeded(const char *name, const char *component, int bound, const char *param1, int value1, const char *param2, int value2) "%s: %s > %d (%s: %d, %s: %d)"
+vmware_update_rect_delayed_flush(void) "display update FIFO full - forcing flush"
 
 # virtio-gpu-base.c
 virtio_gpu_features(bool virgl) "virgl %d"
-- 
2.35.1


