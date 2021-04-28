Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AED736D665
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 13:22:45 +0200 (CEST)
Received: from localhost ([::1]:58092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbiHE-0004Ou-H0
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 07:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbhxu-0006vH-C6
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:02:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbhxh-0005PH-6f
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:02:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619607751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S+pkjOJytdvl3z7L2mlcNi096oDGf+g5R5RPLFUhO30=;
 b=UXYvbs66dgsY21joHenFKR3ZbvjZGQuKyDFqk2j+T45i3mrwoC8oKtL/JMSwilM2TIBYFW
 n41TG5HMw9vnVXrBge2IsQd1zTqkbvnZ9qanIF5483EQD8SA+i0eSAJWiRuGulh+2vQZEw
 KYAaZBpYVzGiWznAK4h5k8k369VtsOA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-ULP7EpL-MOKIxd6JPDKBXQ-1; Wed, 28 Apr 2021 07:02:29 -0400
X-MC-Unique: ULP7EpL-MOKIxd6JPDKBXQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E8981898296;
 Wed, 28 Apr 2021 11:02:28 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-35.ams2.redhat.com
 [10.36.115.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4E941002D71;
 Wed, 28 Apr 2021 11:02:19 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 groug@kaod.org
Subject: [PATCH v3 25/26] vhost-user-fs: Implement drop CAP_FSETID
 functionality
Date: Wed, 28 Apr 2021 12:00:59 +0100
Message-Id: <20210428110100.27757-26-dgilbert@redhat.com>
In-Reply-To: <20210428110100.27757-1-dgilbert@redhat.com>
References: <20210428110100.27757-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: virtio-fs@redhat.com
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
index 036ca17767..7afd9495c9 100644
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
@@ -91,6 +93,84 @@ static bool check_slave_message_entries(const VhostUserFSSlaveMsg *sm,
     return true;
 }
 
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
 uint64_t vhost_user_fs_slave_map(struct vhost_dev *dev, int message_size,
                                  VhostUserFSSlaveMsg *sm, int fd)
 {
@@ -238,6 +318,7 @@ uint64_t vhost_user_fs_slave_io(struct vhost_dev *dev, int message_size,
     unsigned int i;
     int res = 0;
     size_t done = 0;
+    bool cap_fsetid_dropped = false;
 
     if (fd < 0) {
         error_report("Bad fd for io");
@@ -245,8 +326,10 @@ uint64_t vhost_user_fs_slave_io(struct vhost_dev *dev, int message_size,
     }
 
     if (sm->flags & VHOST_USER_FS_GENFLAG_DROP_FSETID) {
-        error_report("Dropping CAP_FSETID is not supported");
-        return (uint64_t)-ENOTSUP;
+        res = drop_effective_cap("FSETID", &cap_fsetid_dropped);
+        if (res != 0) {
+            return (uint64_t)res;
+        }
     }
 
     for (i = 0; i < sm->count && !res; i++) {
@@ -313,6 +396,11 @@ uint64_t vhost_user_fs_slave_io(struct vhost_dev *dev, int message_size,
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
index c6f4b0cf5e..71899d0993 100644
--- a/meson.build
+++ b/meson.build
@@ -1081,6 +1081,12 @@ elif get_option('virtfs').disabled()
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
2.31.1


