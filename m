Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB3C31054C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 08:00:57 +0100 (CET)
Received: from localhost ([::1]:46752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7v6u-0006B9-Uy
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 02:00:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v2r-00012h-N5
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:56:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v2q-00016Y-6T
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:56:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612508203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=djGm7em1BgCb/gG6DOeg/pYmAOYFfMXv/CtPlD5mons=;
 b=AkuZdkULCVn7mkHE4WzCNjxBKTFmDHrGr7f0T3tHf4nGsIjAjwSH1sSjcRx3wdXYkvCpn5
 h1FDl51R8Isj3j0X4i4FWFiPPuU9+QwyxnSEjC4jE5Mu+ytVl7dhEZk2K3U2y7Mjgn29Sn
 ErbNmxvnKCAJKCDu/FrYZ2PhQEA0rFY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-yVJwYwoTOASxMRonGvf5Lg-1; Fri, 05 Feb 2021 01:56:41 -0500
X-MC-Unique: yVJwYwoTOASxMRonGvf5Lg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C725A835E20
 for <qemu-devel@nongnu.org>; Fri,  5 Feb 2021 06:56:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-108.ams2.redhat.com
 [10.36.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A207D1A26A;
 Fri,  5 Feb 2021 06:56:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1F8BC18003B9; Fri,  5 Feb 2021 07:56:21 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/24] ui: remove console_has_gl_dmabuf()
Date: Fri,  5 Feb 2021 07:56:09 +0100
Message-Id: <20210205065620.1726554-14-kraxel@redhat.com>
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

This check is currently limited. It only is used by vhost-user-gpu (not
by vfio-display), and will print an error repeatedly during run-time.

We are going to dissociate the GL context from the
DisplayChangeListener, and listeners may come and go. The following
patches will address this differently.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210204105232.834642-10-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/console.h        | 1 -
 hw/display/vhost-user-gpu.c | 5 -----
 ui/console.c                | 5 -----
 3 files changed, 11 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index bea2b6329a92..ac989fdf7016 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -323,7 +323,6 @@ void dpy_gl_ctx_destroy(QemuConsole *con, QEMUGLContext ctx);
 int dpy_gl_ctx_make_current(QemuConsole *con, QEMUGLContext ctx);
 
 bool console_has_gl(QemuConsole *con);
-bool console_has_gl_dmabuf(QemuConsole *con);
 
 static inline int surface_stride(DisplaySurface *s)
 {
diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 55b0ed15f250..dd587436ff34 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -224,11 +224,6 @@ vhost_user_gpu_handle_display(VhostUserGPU *g, VhostUserGpuMsg *msg)
             close(dmabuf->fd);
             dmabuf->fd = -1;
         }
-        if (!console_has_gl_dmabuf(con)) {
-            /* it would be nice to report that error earlier */
-            error_report("console doesn't support dmabuf!");
-            break;
-        }
         dpy_gl_release_dmabuf(con, dmabuf);
         if (fd == -1) {
             dpy_gl_scanout_disable(con);
diff --git a/ui/console.c b/ui/console.c
index ab9224429e29..b5bc3f7699a1 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1463,11 +1463,6 @@ bool console_has_gl(QemuConsole *con)
     return con->gl != NULL;
 }
 
-bool console_has_gl_dmabuf(QemuConsole *con)
-{
-    return con->gl != NULL && con->gl->ops->dpy_gl_scanout_dmabuf != NULL;
-}
-
 void register_displaychangelistener(DisplayChangeListener *dcl)
 {
     static const char nodev[] =
-- 
2.29.2


