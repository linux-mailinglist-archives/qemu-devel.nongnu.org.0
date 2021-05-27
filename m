Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0033930EB
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 16:29:30 +0200 (CEST)
Received: from localhost ([::1]:43724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmH0r-0006vM-P7
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 10:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGwY-0008Iy-EW
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:25:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGwW-0004rs-17
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:25:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622125499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yryjHAhtoL78ycnVCb8yiifgJPX6deYLjQWuBxbxqpc=;
 b=O/F/6IpldWnOiz6jvOB0cxf/L8PWCQEHCBzLSWplXft7gM5pJ06c9uFSSQOSaLEJPSOjTy
 aMrhfGp7Pl+OdaN8LQ1uYUj34oczjXvYITa4U1zWTixp91gjmEntRLJSJpiMyOP3vSUbYD
 W2Wo190f11GPopjvzB/sZOszpiBtcsg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-S4B99iT2MdOaVgZ6JLas6A-1; Thu, 27 May 2021 10:24:57 -0400
X-MC-Unique: S4B99iT2MdOaVgZ6JLas6A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6ABD8180FD6A;
 Thu, 27 May 2021 14:24:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42BBA5D9D3;
 Thu, 27 May 2021 14:24:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A1DE1180084C; Thu, 27 May 2021 16:23:41 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/23] stubs: Add stubs for udmabuf helpers
Date: Thu, 27 May 2021 16:23:30 +0200
Message-Id: <20210527142340.1352791-14-kraxel@redhat.com>
In-Reply-To: <20210527142340.1352791-1-kraxel@redhat.com>
References: <20210527142340.1352791-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Kasireddy <vivek.kasireddy@intel.com>

This is needed to ensure that virtio-gpu device works for
non-linux builds.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Message-Id: <20210526231429.1045476-5-vivek.kasireddy@intel.com>

[ kraxel: add virtio-gpu-udmabuf.c stubs only when building
          system emulation ]

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 stubs/virtio-gpu-udmabuf.c | 18 ++++++++++++++++++
 meson.build                |  2 +-
 stubs/meson.build          |  1 +
 3 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 stubs/virtio-gpu-udmabuf.c

diff --git a/stubs/virtio-gpu-udmabuf.c b/stubs/virtio-gpu-udmabuf.c
new file mode 100644
index 000000000000..e962e00d86d3
--- /dev/null
+++ b/stubs/virtio-gpu-udmabuf.c
@@ -0,0 +1,18 @@
+#include "qemu/osdep.h"
+#include "hw/virtio/virtio-gpu.h"
+
+bool virtio_gpu_have_udmabuf(void)
+{
+    /* nothing (stub) */
+    return false;
+}
+
+void virtio_gpu_init_udmabuf(struct virtio_gpu_simple_resource *res)
+{
+    /* nothing (stub) */
+}
+
+void virtio_gpu_fini_udmabuf(struct virtio_gpu_simple_resource *res)
+{
+    /* nothing (stub) */
+}
diff --git a/meson.build b/meson.build
index 632b380738d3..9b6d93b8bb44 100644
--- a/meson.build
+++ b/meson.build
@@ -1899,7 +1899,7 @@ util_ss.add_all(trace_ss)
 util_ss = util_ss.apply(config_all, strict: false)
 libqemuutil = static_library('qemuutil',
                              sources: util_ss.sources() + stub_ss.sources() + genh,
-                             dependencies: [util_ss.dependencies(), m, glib, socket, malloc])
+                             dependencies: [util_ss.dependencies(), m, glib, socket, malloc, pixman])
 qemuutil = declare_dependency(link_with: libqemuutil,
                               sources: genh + version_res)
 
diff --git a/stubs/meson.build b/stubs/meson.build
index 3faef16892be..c32d18258538 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -52,6 +52,7 @@ if have_system
   stub_ss.add(files('semihost.c'))
   stub_ss.add(files('usb-dev-stub.c'))
   stub_ss.add(files('xen-hw-stub.c'))
+  stub_ss.add(files('virtio-gpu-udmabuf.c'))
 else
   stub_ss.add(files('qdev.c'))
 endif
-- 
2.31.1


