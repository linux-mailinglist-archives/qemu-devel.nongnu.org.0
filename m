Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB8C3156A4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 20:19:21 +0100 (CET)
Received: from localhost ([::1]:45664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9YXg-0006eW-BY
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 14:19:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YLX-0004M8-BV
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:06:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YLS-0002cp-MC
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:06:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612897600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2+PKRjRL0uQkeqx2q2kSSEHpKI8DjUcO+q9RzQ70mTY=;
 b=VI7+sZTey3Hpke4jtOpGr36vGbTg7q3kmBPQB9O5bEkTlWsp5Ek4yn18GOs/SmlK3mN68h
 yH1PEWEVElapgf14EUte7bOVke0IPGADEoCFZFlm4q3wtB1hc9kqbxOXx/B+Eadj/U24FF
 dhAtImsxrG31DeZIrKkvxwMor3kTCzo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-yKKwSIX9PVSL4YVCWRh5tQ-1; Tue, 09 Feb 2021 14:06:37 -0500
X-MC-Unique: yKKwSIX9PVSL4YVCWRh5tQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9E45801988
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 19:06:36 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-112-66.ams2.redhat.com
 [10.36.112.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D08EF60C04;
 Tue,  9 Feb 2021 19:06:20 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 virtio-fs@redhat.com, marcandre.lureau@redhat.com, mst@redhat.com
Subject: [PATCH 23/24] vhost-user-fs: Implement drop CAP_FSETID functionality
Date: Tue,  9 Feb 2021 19:02:23 +0000
Message-Id: <20210209190224.62827-24-dgilbert@redhat.com>
In-Reply-To: <20210209190224.62827-1-dgilbert@redhat.com>
References: <20210209190224.62827-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Goyal <vgoyal@redhat.com>

As part of slave_io message, slave can ask to do I/O on an fd. Additionally
slave can ask for dropping CAP_FSETID (if master has it) before doing I/O.
Implement functionality to drop CAP_FSETID and gain it back after the
operation.

This also creates a dependency on libcap-ng.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 hw/virtio/meson.build     |  1 +
 hw/virtio/vhost-user-fs.c | 92 ++++++++++++++++++++++++++++++++++++++-
 meson.build               |  6 +++
 3 files changed, 97 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index fbff9bc9d4..bdcdc82e13 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -18,6 +18,7 @@ virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-balloon.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virtio-crypto.c'))
 virtio_ss.add(when: ['CONFIG_VIRTIO_CRYPTO', 'CONFIG_VIRTIO_PCI'], if_true: files('virtio-crypto-pci.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-user-fs.c'))
+virtio_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: libcap_ng)
 virtio_ss.add(when: ['CONFIG_VHOST_USER_FS', 'CONFIG_VIRTIO_PCI'], if_true: files('vhost-user-fs-pci.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_PMEM', if_true: files('virtio-pmem.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock.c', 'vhost-vsock-common.c'))
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index 61e891c82d..0d6ec27edd 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -13,6 +13,8 @@
 
 #include "qemu/osdep.h"
 #include <sys/ioctl.h>
+#include <cap-ng.h>
+#include <sys/syscall.h>
 #include "standard-headers/linux/virtio_fs.h"
 #include "qapi/error.h"
 #include "hw/qdev-properties.h"
@@ -36,6 +38,84 @@
 #define DAX_WINDOW_PROT PROT_NONE
 #endif
 
+/*
+ * Helpers for dropping and regaining effective capabilities. Returns 0
+ * on success, error otherwise
+ */
+static int drop_effective_cap(const char *cap_name, bool *cap_dropped)
+{
+    int cap, ret;
+
+    cap = capng_name_to_capability(cap_name);
+    if (cap < 0) {
+        ret = -errno;
+        error_report("capng_name_to_capability(%s) failed:%s", cap_name,
+                     strerror(errno));
+        goto out;
+    }
+
+    if (capng_get_caps_process()) {
+        ret = -errno;
+        error_report("capng_get_caps_process() failed:%s", strerror(errno));
+        goto out;
+    }
+
+    /* We dont have this capability in effective set already. */
+    if (!capng_have_capability(CAPNG_EFFECTIVE, cap)) {
+        ret = 0;
+        goto out;
+    }
+
+    if (capng_update(CAPNG_DROP, CAPNG_EFFECTIVE, cap)) {
+        ret = -errno;
+        error_report("capng_update(DROP,) failed");
+        goto out;
+    }
+    if (capng_apply(CAPNG_SELECT_CAPS)) {
+        ret = -errno;
+        error_report("drop:capng_apply() failed");
+        goto out;
+    }
+
+    ret = 0;
+    if (cap_dropped) {
+        *cap_dropped = true;
+    }
+
+out:
+    return ret;
+}
+
+static int gain_effective_cap(const char *cap_name)
+{
+    int cap;
+    int ret = 0;
+
+    cap = capng_name_to_capability(cap_name);
+    if (cap < 0) {
+        ret = -errno;
+        error_report("capng_name_to_capability(%s) failed:%s", cap_name,
+                     strerror(errno));
+        goto out;
+    }
+
+    if (capng_update(CAPNG_ADD, CAPNG_EFFECTIVE, cap)) {
+        ret = -errno;
+        error_report("capng_update(ADD,) failed");
+        goto out;
+    }
+
+    if (capng_apply(CAPNG_SELECT_CAPS)) {
+        ret = -errno;
+        error_report("gain:capng_apply() failed");
+        goto out;
+    }
+    ret = 0;
+
+out:
+    return ret;
+}
+
 uint64_t vhost_user_fs_slave_map(struct vhost_dev *dev, VhostUserFSSlaveMsg *sm,
                                  int fd)
 {
@@ -170,6 +250,7 @@ uint64_t vhost_user_fs_slave_io(struct vhost_dev *dev, VhostUserFSSlaveMsg *sm,
     unsigned int i;
     int res = 0;
     size_t done = 0;
+    bool cap_fsetid_dropped = false;
 
     if (fd < 0) {
         error_report("Bad fd for map");
@@ -177,8 +258,10 @@ uint64_t vhost_user_fs_slave_io(struct vhost_dev *dev, VhostUserFSSlaveMsg *sm,
     }
 
     if (sm->gen_flags & VHOST_USER_FS_GENFLAG_DROP_FSETID) {
-        error_report("Dropping CAP_FSETID is not supported");
-        return (uint64_t)-ENOTSUP;
+        res = drop_effective_cap("FSETID", &cap_fsetid_dropped);
+        if (res != 0) {
+            return (uint64_t)res;
+        }
     }
 
     for (i = 0; i < VHOST_USER_FS_SLAVE_ENTRIES && !res; i++) {
@@ -237,6 +320,11 @@ uint64_t vhost_user_fs_slave_io(struct vhost_dev *dev, VhostUserFSSlaveMsg *sm,
     }
     close(fd);
 
+    if (cap_fsetid_dropped) {
+        if (gain_effective_cap("FSETID")) {
+            error_report("Failed to gain CAP_FSETID");
+        }
+    }
     trace_vhost_user_fs_slave_io_exit(res, done);
     if (res < 0) {
         return (uint64_t)res;
diff --git a/meson.build b/meson.build
index 2d8b433ff0..99a7fbacc1 100644
--- a/meson.build
+++ b/meson.build
@@ -1060,6 +1060,12 @@ elif get_option('virtfs').disabled()
   have_virtfs = false
 endif
 
+if config_host.has_key('CONFIG_VHOST_USER_FS')
+  if not libcap_ng.found()
+    error('vhost-user-fs requires libcap-ng-devel')
+  endif
+endif
+
 config_host_data.set_quoted('CONFIG_BINDIR', get_option('prefix') / get_option('bindir'))
 config_host_data.set_quoted('CONFIG_PREFIX', get_option('prefix'))
 config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', get_option('prefix') / qemu_confdir)
-- 
2.29.2


