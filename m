Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B38029235A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 10:04:19 +0200 (CEST)
Received: from localhost ([::1]:49152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUQ9S-0008Hc-4t
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 04:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kUPyJ-0005FX-Cr
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 03:52:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kUPyH-00087J-FZ
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 03:52:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603093964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RKeLauqdIaclnPiWN2ZnmD0w1dLsI1Xl3FhKss0Moxs=;
 b=ZBV2LIosQLcQdpUIo78bx63Sz+AKKSnQcu87VY9IBzCJfFVzCa9hpP+xiaEIk4fr+yCrSt
 FYAQpU2KyeEb5+lUwapy/2kCgjY2paZzYf79wJ8ncDFIRhRACzT4KomQPu4c1Jk/o76Ftt
 QSNb1U3KXez5tXMXMVkI1Tqx4pGq7Mk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-TYUfRfMeMESmtzaYP8r0Hw-1; Mon, 19 Oct 2020 03:52:41 -0400
X-MC-Unique: TYUfRfMeMESmtzaYP8r0Hw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA8261018F79
 for <qemu-devel@nongnu.org>; Mon, 19 Oct 2020 07:52:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AECC25C662;
 Mon, 19 Oct 2020 07:52:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C35781FCE5; Mon, 19 Oct 2020 09:52:24 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/14] opengl: build opengl helper code modular
Date: Mon, 19 Oct 2020 09:52:24 +0200
Message-Id: <20201019075224.14803-15-kraxel@redhat.com>
In-Reply-To: <20201019075224.14803-1-kraxel@redhat.com>
References: <20201019075224.14803-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 02:32:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Removes opengl dependency from core qemu.  The number of shared
libraries for qemu-system-x86_64 goes down from 66 to 60 on my system.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 util/module.c  | 7 +++++++
 ui/meson.build | 8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/util/module.c b/util/module.c
index 21237dcc24df..fe3b82dd4d37 100644
--- a/util/module.c
+++ b/util/module.c
@@ -181,6 +181,13 @@ static const struct {
     { "hw-display-qxl", "ui-spice-core" },
     { "ui-spice-app",   "ui-spice-core" },
     { "ui-spice-app",   "chardev-spice" },
+
+#ifdef CONFIG_OPENGL
+    { "ui-egl-headless", "ui-opengl"    },
+    { "ui-gtk",          "ui-opengl"    },
+    { "ui-sdl",          "ui-opengl"    },
+    { "ui-spice-core",   "ui-opengl"    },
+#endif
 };
 #endif
 
diff --git a/ui/meson.build b/ui/meson.build
index 3cf03d2c297b..73c8dbc7c742 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -33,7 +33,6 @@ vnc_ss.add(zlib, png, jpeg)
 vnc_ss.add(when: sasl, if_true: files('vnc-auth-sasl.c'))
 softmmu_ss.add_all(when: vnc, if_true: vnc_ss)
 softmmu_ss.add(when: vnc, if_false: files('vnc-stubs.c'))
-softmmu_ss.add(when: [opengl, 'CONFIG_OPENGL'], if_true: files('shader.c', 'console-gl.c', 'egl-helpers.c', 'egl-context.c'))
 specific_ss.add(when: ['CONFIG_SOFTMMU'], if_true: opengl)
 
 ui_modules = {}
@@ -44,6 +43,13 @@ if curses.found()
   ui_modules += {'curses' : curses_ss}
 endif
 
+if config_host.has_key('CONFIG_OPENGL')
+  opengl_ss = ss.source_set()
+  opengl_ss.add(when: [opengl, pixman, 'CONFIG_OPENGL'],
+               if_true: files('shader.c', 'console-gl.c', 'egl-helpers.c', 'egl-context.c'))
+  ui_modules += {'opengl' : opengl_ss}
+endif
+
 if config_host.has_key('CONFIG_OPENGL_DMABUF')
   egl_headless_ss = ss.source_set()
   egl_headless_ss.add(when: [opengl, pixman, 'CONFIG_OPENGL_DMABUF'],
-- 
2.27.0


