Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D31310578
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 08:09:09 +0100 (CET)
Received: from localhost ([::1]:48082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7vEq-0001iB-NH
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 02:09:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v3C-0001aQ-23
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:57:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v3A-0001GE-98
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:57:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612508223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d4ajX2jqr8XyJJQE5LbbPBUY7Hqk7qujv+RKmmfrqdI=;
 b=Zj/Z/akeBDOOYyCCvX7w49pZP6qaMEffWhjuXdm+pu3Vqgy+QK/APznCT/VWtmXIRCsxvj
 CUhTBQ16tY6isKsVrqmwbFFdi2ZymZqo5tLmABOofRG1CF7xjC/ackASWaLtqHnqYLIAdf
 B9cL0DfsGtrCMVsBCvHBtbc1hz6/1Qg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-FlgQ6SD6MT2Jf4-Ue7syyA-1; Fri, 05 Feb 2021 01:57:01 -0500
X-MC-Unique: FlgQ6SD6MT2Jf4-Ue7syyA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E974B192CC40
 for <qemu-devel@nongnu.org>; Fri,  5 Feb 2021 06:57:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-108.ams2.redhat.com
 [10.36.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A6121A26A;
 Fri,  5 Feb 2021 06:56:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6C2F718003BF; Fri,  5 Feb 2021 07:56:21 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/24] ui: check gtk-egl dmabuf support
Date: Fri,  5 Feb 2021 07:56:15 +0100
Message-Id: <20210205065620.1726554-20-kraxel@redhat.com>
In-Reply-To: <20210205065620.1726554-1-kraxel@redhat.com>
References: <20210205065620.1726554-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210204105232.834642-16-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/gtk.h | 1 +
 ui/gtk.c         | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 7569d090fa95..aaef884b95b4 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -48,6 +48,7 @@ typedef struct VirtualGfxConsole {
     int cursor_y;
     bool y0_top;
     bool scanout_mode;
+    bool has_dmabuf;
 #endif
 } VirtualGfxConsole;
 
diff --git a/ui/gtk.c b/ui/gtk.c
index 00045881b121..f41c396cb98a 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -623,6 +623,13 @@ static const DisplayChangeListenerOps dcl_ops = {
 
 #if defined(CONFIG_OPENGL)
 
+static bool gd_has_dmabuf(DisplayChangeListener *dcl)
+{
+    VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
+
+    return vc->gfx.has_dmabuf;
+}
+
 /** DisplayState Callbacks (opengl version) **/
 
 static const DisplayChangeListenerOps dcl_gl_area_ops = {
@@ -661,6 +668,7 @@ static const DisplayChangeListenerOps dcl_egl_ops = {
     .dpy_gl_cursor_position  = gd_egl_cursor_position,
     .dpy_gl_release_dmabuf   = gd_egl_release_dmabuf,
     .dpy_gl_update           = gd_egl_scanout_flush,
+    .dpy_has_dmabuf          = gd_has_dmabuf,
 };
 
 #endif /* CONFIG_OPENGL */
@@ -2004,6 +2012,7 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
             gtk_widget_set_double_buffered(vc->gfx.drawing_area, FALSE);
 #pragma GCC diagnostic pop
             vc->gfx.dcl.ops = &dcl_egl_ops;
+            vc->gfx.has_dmabuf = qemu_egl_has_dmabuf();
         }
     } else
 #endif
-- 
2.29.2


