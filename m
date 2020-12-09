Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 802F72D49A6
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:59:49 +0100 (CET)
Received: from localhost ([::1]:47158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4gm-0007ZV-EB
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:59:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3v4-0004Sb-Lu
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:10:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3v0-0000Fn-VL
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:10:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dV+7BzXez4+ny3udEAvAWmvm0532zQlUP4+qQ+UHZ0k=;
 b=TpmSz6Yl/VreYCmYzuU+ErC9CrcaM+oQLBofHraKIjBnCSg7f18g4KYD28138/F1dxzAt3
 owHz+u+RdHV9PK7Sv4iqtDBvHIRo8uFzSRHaslNQ18QSUtCZDhFrdtH/fOcTxmQYv+45gb
 ZRqzSkb/uRME2puaP2jzfpllFkFJJI4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-DWWoNb0-OYy-LiK6CuM7aw-1; Wed, 09 Dec 2020 13:10:23 -0500
X-MC-Unique: DWWoNb0-OYy-LiK6CuM7aw-1
Received: by mail-wr1-f70.google.com with SMTP id v1so949717wri.16
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:10:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=dV+7BzXez4+ny3udEAvAWmvm0532zQlUP4+qQ+UHZ0k=;
 b=O79nep061hSRrMcra6kDa76pwKOmyOLw+e2rxhXa2v8/qINgbGNuQ8uqQPrcOHmJVz
 oseUce4tPRNfM5Y3Lg2/x+j4/E3jn4yslJ7Oyl5exCF8hB+DXz1E5YUR6Tz74hw6pP7T
 DLgJ6ABuy9Mikj1sjT6Z3Wfr5COBCtCNBzaXV0hDJrSPK1V1YbWKDqiKKjlB/icjm2cl
 MdND7rs/PZDNeM0YXqjIq024pg5wZ6AEOYAfCx73IFgIJWNb4PSOrSyQqzZ6Uo/DJPC/
 Nv4Jy5Ti3V+FkVjrGE2P1jcucaRJGM/IYvd1curjiYVcR90xdpk41oWMLo5HEGfueQZf
 dMiA==
X-Gm-Message-State: AOAM533qOT3A+dFr8ToUmjKA3SPb4HuRbmUag9K5b86MGFs5/3PLbegn
 9lQuqzgMYTI5hCUXnVZRYUF0+w6KnPSRlAhAX2ECdNFAvazqY1I4f1ZT4pBbmuN4syN0UXkpORx
 qxxSA4iywYyaxzINcFepojdXdqKia1RAyfa8VSvQH0HTJF9mVNStqzvlXQJjw
X-Received: by 2002:a1c:bd43:: with SMTP id n64mr4074962wmf.169.1607537421970; 
 Wed, 09 Dec 2020 10:10:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxvX7fhdA2rbKE4mrE/Ss+F5WvwV50RafAyw56X3JTQVpLb3LHLWOAt5n1r76O9565PS5dhew==
X-Received: by 2002:a1c:bd43:: with SMTP id n64mr4074931wmf.169.1607537421681; 
 Wed, 09 Dec 2020 10:10:21 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id i11sm4845223wmd.47.2020.12.09.10.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:10:21 -0800 (PST)
Date: Wed, 9 Dec 2020 13:10:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 48/65] libvhost-user: make it a meson subproject
Message-ID: <20201209180546.721296-49-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

By making libvhost-user a subproject, check it builds
standalone (without the global QEMU cflags etc).

Note that the library still relies on QEMU include/qemu/atomic.h and
linux_headers/.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20201125100640.366523-6-marcandre.lureau@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 contrib/vhost-user-gpu/vugpu.h                |  2 +-
 include/qemu/vhost-user-server.h              |  2 +-
 .../libvhost-user/libvhost-user-glib.h        |  0
 .../libvhost-user/libvhost-user.h             |  0
 block/export/vhost-user-blk-server.c          |  2 +-
 contrib/vhost-user-blk/vhost-user-blk.c       |  3 +--
 contrib/vhost-user-input/main.c               |  3 +--
 contrib/vhost-user-scsi/vhost-user-scsi.c     |  2 +-
 .../libvhost-user/libvhost-user-glib.c        |  0
 .../libvhost-user/libvhost-user.c             |  0
 tests/vhost-user-bridge.c                     |  2 +-
 tools/virtiofsd/fuse_virtio.c                 |  2 +-
 contrib/libvhost-user/meson.build             |  4 ----
 contrib/vhost-user-blk/meson.build            |  3 +--
 contrib/vhost-user-gpu/meson.build            |  3 +--
 contrib/vhost-user-input/meson.build          |  3 +--
 contrib/vhost-user-scsi/meson.build           |  3 +--
 meson.build                                   |  7 ++++++-
 subprojects/libvhost-user/meson.build         | 20 +++++++++++++++++++
 tests/meson.build                             |  3 +--
 tools/virtiofsd/meson.build                   |  3 +--
 21 files changed, 40 insertions(+), 27 deletions(-)
 rename {contrib => subprojects}/libvhost-user/libvhost-user-glib.h (100%)
 rename {contrib => subprojects}/libvhost-user/libvhost-user.h (100%)
 rename {contrib => subprojects}/libvhost-user/libvhost-user-glib.c (100%)
 rename {contrib => subprojects}/libvhost-user/libvhost-user.c (100%)
 delete mode 100644 contrib/libvhost-user/meson.build
 create mode 100644 subprojects/libvhost-user/meson.build

diff --git a/contrib/vhost-user-gpu/vugpu.h b/contrib/vhost-user-gpu/vugpu.h
index 3153c9a6de..bdf9a74b46 100644
--- a/contrib/vhost-user-gpu/vugpu.h
+++ b/contrib/vhost-user-gpu/vugpu.h
@@ -17,7 +17,7 @@
 
 #include "qemu/osdep.h"
 
-#include "contrib/libvhost-user/libvhost-user-glib.h"
+#include "libvhost-user-glib.h"
 #include "standard-headers/linux/virtio_gpu.h"
 
 #include "qemu/queue.h"
diff --git a/include/qemu/vhost-user-server.h b/include/qemu/vhost-user-server.h
index 0da4c2cc4c..121ea1dedf 100644
--- a/include/qemu/vhost-user-server.h
+++ b/include/qemu/vhost-user-server.h
@@ -11,7 +11,7 @@
 #ifndef VHOST_USER_SERVER_H
 #define VHOST_USER_SERVER_H
 
-#include "contrib/libvhost-user/libvhost-user.h"
+#include "subprojects/libvhost-user/libvhost-user.h" /* only for the type definitions */
 #include "io/channel-socket.h"
 #include "io/channel-file.h"
 #include "io/net-listener.h"
diff --git a/contrib/libvhost-user/libvhost-user-glib.h b/subprojects/libvhost-user/libvhost-user-glib.h
similarity index 100%
rename from contrib/libvhost-user/libvhost-user-glib.h
rename to subprojects/libvhost-user/libvhost-user-glib.h
diff --git a/contrib/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
similarity index 100%
rename from contrib/libvhost-user/libvhost-user.h
rename to subprojects/libvhost-user/libvhost-user.h
diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index 62672d1cb9..a3d95ca012 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -11,7 +11,7 @@
  */
 #include "qemu/osdep.h"
 #include "block/block.h"
-#include "contrib/libvhost-user/libvhost-user.h"
+#include "subprojects/libvhost-user/libvhost-user.h" /* only for the type definitions */
 #include "standard-headers/linux/virtio_blk.h"
 #include "qemu/vhost-user-server.h"
 #include "vhost-user-blk-server.h"
diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-blk/vhost-user-blk.c
index dc981bf945..6abd7835a8 100644
--- a/contrib/vhost-user-blk/vhost-user-blk.c
+++ b/contrib/vhost-user-blk/vhost-user-blk.c
@@ -17,8 +17,7 @@
 
 #include "qemu/osdep.h"
 #include "standard-headers/linux/virtio_blk.h"
-#include "contrib/libvhost-user/libvhost-user-glib.h"
-#include "contrib/libvhost-user/libvhost-user.h"
+#include "libvhost-user-glib.h"
 
 #if defined(__linux__)
 #include <linux/fs.h>
diff --git a/contrib/vhost-user-input/main.c b/contrib/vhost-user-input/main.c
index 6020c6f33a..3ea840cf44 100644
--- a/contrib/vhost-user-input/main.c
+++ b/contrib/vhost-user-input/main.c
@@ -12,8 +12,7 @@
 #include "qemu/iov.h"
 #include "qemu/bswap.h"
 #include "qemu/sockets.h"
-#include "contrib/libvhost-user/libvhost-user.h"
-#include "contrib/libvhost-user/libvhost-user-glib.h"
+#include "libvhost-user-glib.h"
 #include "standard-headers/linux/virtio_input.h"
 #include "qapi/error.h"
 
diff --git a/contrib/vhost-user-scsi/vhost-user-scsi.c b/contrib/vhost-user-scsi/vhost-user-scsi.c
index 4639440a70..4f6e3e2a24 100644
--- a/contrib/vhost-user-scsi/vhost-user-scsi.c
+++ b/contrib/vhost-user-scsi/vhost-user-scsi.c
@@ -15,7 +15,7 @@
 #define inline __attribute__((gnu_inline))  /* required for libiscsi v1.9.0 */
 #include <iscsi/scsi-lowlevel.h>
 #undef inline
-#include "contrib/libvhost-user/libvhost-user-glib.h"
+#include "libvhost-user-glib.h"
 #include "standard-headers/linux/virtio_scsi.h"
 
 
diff --git a/contrib/libvhost-user/libvhost-user-glib.c b/subprojects/libvhost-user/libvhost-user-glib.c
similarity index 100%
rename from contrib/libvhost-user/libvhost-user-glib.c
rename to subprojects/libvhost-user/libvhost-user-glib.c
diff --git a/contrib/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
similarity index 100%
rename from contrib/libvhost-user/libvhost-user.c
rename to subprojects/libvhost-user/libvhost-user.c
diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c
index bd43607a4d..24815920b2 100644
--- a/tests/vhost-user-bridge.c
+++ b/tests/vhost-user-bridge.c
@@ -34,7 +34,7 @@
 #include "qemu/ctype.h"
 #include "qemu/iov.h"
 #include "standard-headers/linux/virtio_net.h"
-#include "contrib/libvhost-user/libvhost-user.h"
+#include "libvhost-user.h"
 
 #define VHOST_USER_BRIDGE_DEBUG 1
 
diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 83ba07c6cd..623812c432 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -35,7 +35,7 @@
 #include <grp.h>
 #include <unistd.h>
 
-#include "contrib/libvhost-user/libvhost-user.h"
+#include "libvhost-user.h"
 
 struct fv_VuDev;
 struct fv_QueueInfo {
diff --git a/contrib/libvhost-user/meson.build b/contrib/libvhost-user/meson.build
deleted file mode 100644
index a261e7665f..0000000000
--- a/contrib/libvhost-user/meson.build
+++ /dev/null
@@ -1,4 +0,0 @@
-libvhost_user = static_library('vhost-user',
-                               files('libvhost-user.c', 'libvhost-user-glib.c'),
-                               build_by_default: false)
-vhost_user = declare_dependency(link_with: libvhost_user)
diff --git a/contrib/vhost-user-blk/meson.build b/contrib/vhost-user-blk/meson.build
index 5db8cc3fe2..601ea15ef5 100644
--- a/contrib/vhost-user-blk/meson.build
+++ b/contrib/vhost-user-blk/meson.build
@@ -1,6 +1,5 @@
 # FIXME: broken on 32-bit architectures
 executable('vhost-user-blk', files('vhost-user-blk.c'),
-           link_with: libvhost_user,
-           dependencies: qemuutil,
+           dependencies: [qemuutil, vhost_user],
            build_by_default: false,
            install: false)
diff --git a/contrib/vhost-user-gpu/meson.build b/contrib/vhost-user-gpu/meson.build
index c487ca72c1..2fc2320b52 100644
--- a/contrib/vhost-user-gpu/meson.build
+++ b/contrib/vhost-user-gpu/meson.build
@@ -2,8 +2,7 @@ if 'CONFIG_TOOLS' in config_host and 'CONFIG_VIRGL' in config_host \
     and 'CONFIG_GBM' in config_host and 'CONFIG_LINUX' in config_host \
     and pixman.found()
   executable('vhost-user-gpu', files('vhost-user-gpu.c', 'virgl.c', 'vugbm.c'),
-             link_with: libvhost_user,
-             dependencies: [qemuutil, pixman, gbm, virgl],
+             dependencies: [qemuutil, pixman, gbm, virgl, vhost_user],
              install: true,
              install_dir: get_option('libexecdir'))
 
diff --git a/contrib/vhost-user-input/meson.build b/contrib/vhost-user-input/meson.build
index 1eeb1329d9..21a9ed4f15 100644
--- a/contrib/vhost-user-input/meson.build
+++ b/contrib/vhost-user-input/meson.build
@@ -1,5 +1,4 @@
 executable('vhost-user-input', files('main.c'),
-           link_with: libvhost_user,
-           dependencies: qemuutil,
+           dependencies: [qemuutil, vhost_user],
            build_by_default: targetos == 'linux',
            install: false)
diff --git a/contrib/vhost-user-scsi/meson.build b/contrib/vhost-user-scsi/meson.build
index 257cbffc8e..044c50bf43 100644
--- a/contrib/vhost-user-scsi/meson.build
+++ b/contrib/vhost-user-scsi/meson.build
@@ -1,7 +1,6 @@
 if 'CONFIG_LIBISCSI' in config_host
   executable('vhost-user-scsi', files('vhost-user-scsi.c'),
-             link_with: libvhost_user,
-             dependencies: [qemuutil, libiscsi],
+             dependencies: [qemuutil, libiscsi, vhost_user],
              build_by_default: targetos == 'linux',
              install: false)
 endif
diff --git a/meson.build b/meson.build
index e3386196ba..732b29a1f3 100644
--- a/meson.build
+++ b/meson.build
@@ -1475,7 +1475,12 @@ trace_events_subdirs += [
   'util',
 ]
 
-subdir('contrib/libvhost-user')
+vhost_user = not_found
+if 'CONFIG_VHOST_USER' in config_host
+  libvhost_user = subproject('libvhost-user')
+  vhost_user = libvhost_user.get_variable('vhost_user_dep')
+endif
+
 subdir('qapi')
 subdir('qobject')
 subdir('stubs')
diff --git a/subprojects/libvhost-user/meson.build b/subprojects/libvhost-user/meson.build
new file mode 100644
index 0000000000..f9ecc534cf
--- /dev/null
+++ b/subprojects/libvhost-user/meson.build
@@ -0,0 +1,20 @@
+project('libvhost-user', 'c',
+        license: 'GPL-2.0-or-later',
+        default_options: ['c_std=gnu99'])
+
+glib = dependency('glib-2.0')
+inc = include_directories('../../include', '../../linux-headers')
+
+vhost_user = static_library('vhost-user',
+                            files('libvhost-user.c'),
+                            include_directories: inc,
+                            c_args: '-D_GNU_SOURCE')
+
+vhost_user_glib = static_library('vhost-user-glib',
+                                 files('libvhost-user-glib.c'),
+                                 include_directories: inc,
+                                 link_with: vhost_user,
+                                 dependencies: glib)
+
+vhost_user_dep = declare_dependency(link_with: vhost_user_glib,
+                                    include_directories: include_directories('.'))
diff --git a/tests/meson.build b/tests/meson.build
index afeb6be689..1fa068f27b 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -264,8 +264,7 @@ endforeach
 if have_tools and 'CONFIG_VHOST_USER' in config_host and 'CONFIG_LINUX' in config_host
   executable('vhost-user-bridge',
              sources: files('vhost-user-bridge.c'),
-             link_with: [libvhost_user],
-             dependencies: [qemuutil])
+             dependencies: [qemuutil, vhost_user])
 endif
 
 if have_system and 'CONFIG_POSIX' in config_host
diff --git a/tools/virtiofsd/meson.build b/tools/virtiofsd/meson.build
index 17edecf55c..c134ba633f 100644
--- a/tools/virtiofsd/meson.build
+++ b/tools/virtiofsd/meson.build
@@ -8,8 +8,7 @@ executable('virtiofsd', files(
   'helper.c',
   'passthrough_ll.c',
   'passthrough_seccomp.c'),
-  link_with: libvhost_user,
-  dependencies: [seccomp, qemuutil, libcap_ng],
+  dependencies: [seccomp, qemuutil, libcap_ng, vhost_user],
   install: true,
   install_dir: get_option('libexecdir'))
 
-- 
MST


