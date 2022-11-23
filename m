Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEFA636234
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 15:46:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxqzh-0004FD-Rc; Wed, 23 Nov 2022 09:44:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oxqzg-0004Ev-3b
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:44:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oxqze-0002wc-I9
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:44:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669214693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dmj3eYzGq8N02pY8S5D07dZrkbYZHf+DViE4LL3gSoE=;
 b=TVr41gTHHmDOwgbUM/PE6P+PTN3XCfDvEyNNqHV8OXIX5CQvnzCSlmMVOZqLGoWmzubeem
 BI+zfkaukXN8WuCxFIeFPmRlWJcj+2w88iTorT2hcdEpg7IhbRWFa9S6Mce+a4z6wSuJCx
 P3jAOd91Ry72jwvTXWCP0Fr/sW1/E/0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-ENbr_eXgODSNU3n2w12S6Q-1; Wed, 23 Nov 2022 09:44:49 -0500
X-MC-Unique: ENbr_eXgODSNU3n2w12S6Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 035A51C2726A;
 Wed, 23 Nov 2022 14:44:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8ADC12024CBE;
 Wed, 23 Nov 2022 14:44:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DF5591800619; Wed, 23 Nov 2022 15:44:36 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Dongwon Kim <dongwon.kim@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PULL 4/7] ui/gtk: prevent ui lock up when dpy_gl_update called again
 before current draw event occurs
Date: Wed, 23 Nov 2022 15:44:33 +0100
Message-Id: <20221123144436.2141069-5-kraxel@redhat.com>
In-Reply-To: <20221123144436.2141069-1-kraxel@redhat.com>
References: <20221123144436.2141069-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Dongwon Kim <dongwon.kim@intel.com>

A warning, "qemu: warning: console: no gl-unblock within" followed by
guest scanout lockup can happen if dpy_gl_update is called in a row
and the second call is made before gd_draw_event scheduled by the first
call is taking place. This is because draw call returns without decrementing
gl_block ref count if the dmabuf was already submitted as shown below.

(gd_gl_area_draw/gd_egl_draw)

        if (dmabuf) {
            if (!dmabuf->draw_submitted) {
                return;
            } else {
                dmabuf->draw_submitted = false;
            }
        }

So it should not schedule any redundant draw event in case draw_submitted is
already set in gd_egl_fluch/gd_gl_area_scanout_flush.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20221021192315.9110-1-dongwon.kim@intel.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/gtk-egl.c     | 2 +-
 ui/gtk-gl-area.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index 35f917ceb15e..e84431790c9b 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -341,7 +341,7 @@ void gd_egl_flush(DisplayChangeListener *dcl,
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
     GtkWidget *area = vc->gfx.drawing_area;
 
-    if (vc->gfx.guest_fb.dmabuf) {
+    if (vc->gfx.guest_fb.dmabuf && !vc->gfx.guest_fb.dmabuf->draw_submitted) {
         graphic_hw_gl_block(vc->gfx.dcl.con, true);
         vc->gfx.guest_fb.dmabuf->draw_submitted = true;
         gtk_widget_queue_draw_area(area, x, y, w, h);
diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index 682638a197d2..7696df1f6bc4 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -278,7 +278,7 @@ void gd_gl_area_scanout_flush(DisplayChangeListener *dcl,
 {
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
 
-    if (vc->gfx.guest_fb.dmabuf) {
+    if (vc->gfx.guest_fb.dmabuf && !vc->gfx.guest_fb.dmabuf->draw_submitted) {
         graphic_hw_gl_block(vc->gfx.dcl.con, true);
         vc->gfx.guest_fb.dmabuf->draw_submitted = true;
     }
-- 
2.38.1


