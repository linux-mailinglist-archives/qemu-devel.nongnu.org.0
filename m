Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AED31056C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 08:06:39 +0100 (CET)
Received: from localhost ([::1]:41786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7vCQ-0007T4-7x
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 02:06:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v39-0001Sv-B6
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:57:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v36-0001EV-4n
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:57:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612508219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NBMNjbjTe6trPUZ4O0c0FepAOVSExaPM9dz+xKmbDuE=;
 b=GMxQZHRNa9D1yu4ajGHkGlvpN4vcNrwQu7ywpYkO3ZW0TQmD/fteLzNGjeK0Ux3O2odSgF
 w2ZQUowTMldPJeZQx09ayXapbpxJfXr2uEOmLeAITpzhxJbHROQP4wmjQFUCxGkyCdLlE9
 KH3uvHu//E2EsUsJZwNUgKB/ylevarM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-tXYOE47CM92r1o_cRuVx_w-1; Fri, 05 Feb 2021 01:56:57 -0500
X-MC-Unique: tXYOE47CM92r1o_cRuVx_w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 085E55B364
 for <qemu-devel@nongnu.org>; Fri,  5 Feb 2021 06:56:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-108.ams2.redhat.com
 [10.36.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4309F62461;
 Fri,  5 Feb 2021 06:56:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5F95D18003BE; Fri,  5 Feb 2021 07:56:21 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/24] ui: add qemu_egl_has_dmabuf helper
Date: Fri,  5 Feb 2021 07:56:14 +0100
Message-Id: <20210205065620.1726554-19-kraxel@redhat.com>
In-Reply-To: <20210205065620.1726554-1-kraxel@redhat.com>
References: <20210205065620.1726554-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Message-Id: <20210204105232.834642-15-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/egl-helpers.h |  1 +
 ui/egl-helpers.c         | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/include/ui/egl-helpers.h b/include/ui/egl-helpers.h
index 94a4b3e6f3bd..5b1f7fafe0bc 100644
--- a/include/ui/egl-helpers.h
+++ b/include/ui/egl-helpers.h
@@ -51,5 +51,6 @@ EGLSurface qemu_egl_init_surface_x11(EGLContext ectx, EGLNativeWindowType win);
 int qemu_egl_init_dpy_x11(EGLNativeDisplayType dpy, DisplayGLMode mode);
 int qemu_egl_init_dpy_mesa(EGLNativeDisplayType dpy, DisplayGLMode mode);
 EGLContext qemu_egl_init_ctx(void);
+bool qemu_egl_has_dmabuf(void);
 
 #endif /* EGL_HELPERS_H */
diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c
index 7c530c2825be..73fe61f87819 100644
--- a/ui/egl-helpers.c
+++ b/ui/egl-helpers.c
@@ -441,6 +441,16 @@ int qemu_egl_init_dpy_mesa(EGLNativeDisplayType dpy, DisplayGLMode mode)
 #endif
 }
 
+bool qemu_egl_has_dmabuf(void)
+{
+    if (qemu_egl_display == EGL_NO_DISPLAY) {
+        return false;
+    }
+
+    return epoxy_has_egl_extension(qemu_egl_display,
+                                   "EGL_EXT_image_dma_buf_import");
+}
+
 EGLContext qemu_egl_init_ctx(void)
 {
     static const EGLint ctx_att_core[] = {
-- 
2.29.2


