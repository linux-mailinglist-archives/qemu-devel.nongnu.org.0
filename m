Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BAE500BA9
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 12:55:40 +0200 (CEST)
Received: from localhost ([::1]:39038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nex8V-00019i-48
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 06:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nex11-0002sz-TL
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 06:47:55 -0400
Received: from mga12.intel.com ([192.55.52.136]:34772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nex0z-0005Kn-Co
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 06:47:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649933273; x=1681469273;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3UceRf2HWmSm4CQsvPTxQRPUH75cKHVY3AXYZmTVfe8=;
 b=T8iazVPJip+jWtMKG/w7oewZdYu9nRVDAZEIHsp4AsZ0ENW6ReBleQh/
 3gOSK1SldiI7sOKcAAuqry9LqPuB2BBls1As8dQH8Zd00IOj6/dngLXLY
 vurrC4GgJZKXfoCE8kLHbHEPzZxie81WMHIC7rT2KY6oPtwBnO+7FOnJm
 T8DKoTzoCi2fJA+hRbi/SXR+SL8pmjKunwxJfdwgjm+gZUzcbdX3nURbH
 K6ruKbnEf6VcrvV3Ch3c63+oH6wU5ctBu48cyUgSc8+Ky5vrN5d3ubuZ3
 //0lO3XWK/7SCzYuoMyunPasL8u+0SHgOnc+hMgjFS1PUk2seLFCjU1dG g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="242836513"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="242836513"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 03:47:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="803091249"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga006.fm.intel.com with ESMTP; 14 Apr 2022 03:47:21 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	cohuck@redhat.com,
	qemu-devel@nongnu.org
Subject: [RFC 14/18] hw/iommufd: Creation
Date: Thu, 14 Apr 2022 03:47:06 -0700
Message-Id: <20220414104710.28534-15-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220414104710.28534-1-yi.l.liu@intel.com>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=yi.l.liu@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: akrowiak@linux.ibm.com, jjherne@linux.ibm.com, thuth@redhat.com,
 yi.l.liu@intel.com, kvm@vger.kernel.org, mjrosato@linux.ibm.com,
 jasowang@redhat.com, farman@linux.ibm.com, peterx@redhat.com,
 pasic@linux.ibm.com, eric.auger@redhat.com, yi.y.sun@intel.com,
 chao.p.peng@intel.com, nicolinc@nvidia.com, kevin.tian@intel.com,
 jgg@nvidia.com, eric.auger.pro@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce iommufd utility library which can be compiled out with
CONFIG_IOMMUFD configuration. This code is bound to be called by
several subsystems: vdpa, and vfio.

Co-authored-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 MAINTAINERS                  |   7 ++
 hw/Kconfig                   |   1 +
 hw/iommufd/Kconfig           |   4 +
 hw/iommufd/iommufd.c         | 209 +++++++++++++++++++++++++++++++++++
 hw/iommufd/meson.build       |   1 +
 hw/iommufd/trace-events      |  11 ++
 hw/iommufd/trace.h           |   1 +
 hw/meson.build               |   1 +
 include/hw/iommufd/iommufd.h |  37 +++++++
 meson.build                  |   1 +
 10 files changed, 273 insertions(+)
 create mode 100644 hw/iommufd/Kconfig
 create mode 100644 hw/iommufd/iommufd.c
 create mode 100644 hw/iommufd/meson.build
 create mode 100644 hw/iommufd/trace-events
 create mode 100644 hw/iommufd/trace.h
 create mode 100644 include/hw/iommufd/iommufd.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 4ad2451e03..f6bcb25f7f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1954,6 +1954,13 @@ F: hw/vfio/ap.c
 F: docs/system/s390x/vfio-ap.rst
 L: qemu-s390x@nongnu.org
 
+iommufd
+M: Yi Liu <yi.l.liu@intel.com>
+M: Eric Auger <eric.auger@redhat.com>
+S: Supported
+F: hw/iommufd/*
+F: include/hw/iommufd/*
+
 vhost
 M: Michael S. Tsirkin <mst@redhat.com>
 S: Supported
diff --git a/hw/Kconfig b/hw/Kconfig
index ad20cce0a9..d270d44760 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -63,6 +63,7 @@ source sparc/Kconfig
 source sparc64/Kconfig
 source tricore/Kconfig
 source xtensa/Kconfig
+source iommufd/Kconfig
 
 # Symbols used by multiple targets
 config TEST_DEVICES
diff --git a/hw/iommufd/Kconfig b/hw/iommufd/Kconfig
new file mode 100644
index 0000000000..4b1b00e36b
--- /dev/null
+++ b/hw/iommufd/Kconfig
@@ -0,0 +1,4 @@
+config IOMMUFD
+    bool
+    default y
+    depends on LINUX
diff --git a/hw/iommufd/iommufd.c b/hw/iommufd/iommufd.c
new file mode 100644
index 0000000000..4e8179d612
--- /dev/null
+++ b/hw/iommufd/iommufd.c
@@ -0,0 +1,209 @@
+/*
+ * QEMU IOMMUFD
+ *
+ * Copyright (C) 2022 Intel Corporation.
+ * Copyright Red Hat, Inc. 2022
+ *
+ * Authors: Yi Liu <yi.l.liu@intel.com>
+ *          Eric Auger <eric.auger@redhat.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "qemu/thread.h"
+#include "qemu/module.h"
+#include <sys/ioctl.h>
+#include <linux/iommufd.h>
+#include "hw/iommufd/iommufd.h"
+#include "trace.h"
+
+static QemuMutex iommufd_lock;
+static uint32_t iommufd_users;
+static int iommufd = -1;
+
+static int iommufd_get(void)
+{
+    qemu_mutex_lock(&iommufd_lock);
+    if (iommufd == -1) {
+        iommufd = qemu_open_old("/dev/iommu", O_RDWR);
+        if (iommufd < 0) {
+            error_report("Failed to open /dev/iommu!");
+        } else {
+            iommufd_users = 1;
+        }
+        trace_iommufd_get(iommufd);
+    } else if (++iommufd_users == UINT32_MAX) {
+        error_report("Failed to get iommufd: %d, count overflow", iommufd);
+        iommufd_users--;
+        qemu_mutex_unlock(&iommufd_lock);
+        return -E2BIG;
+    }
+    qemu_mutex_unlock(&iommufd_lock);
+    return iommufd;
+}
+
+static void iommufd_put(int fd)
+{
+    qemu_mutex_lock(&iommufd_lock);
+    if (--iommufd_users) {
+        qemu_mutex_unlock(&iommufd_lock);
+        return;
+    }
+    iommufd = -1;
+    trace_iommufd_put(fd);
+    close(fd);
+    qemu_mutex_unlock(&iommufd_lock);
+}
+
+static int iommufd_alloc_ioas(int iommufd, uint32_t *ioas)
+{
+    int ret;
+    struct iommu_ioas_alloc alloc_data  = {
+        .size = sizeof(alloc_data),
+        .flags = 0,
+    };
+
+    ret = ioctl(iommufd, IOMMU_IOAS_ALLOC, &alloc_data);
+    if (ret) {
+        error_report("Failed to allocate ioas %m");
+    }
+
+    *ioas = alloc_data.out_ioas_id;
+    trace_iommufd_alloc_ioas(iommufd, *ioas, ret);
+
+    return ret;
+}
+
+static void iommufd_free_ioas(int iommufd, uint32_t ioas)
+{
+    int ret;
+    struct iommu_destroy des = {
+        .size = sizeof(des),
+        .id = ioas,
+    };
+
+    ret = ioctl(iommufd, IOMMU_DESTROY, &des);
+    trace_iommufd_free_ioas(iommufd, ioas, ret);
+    if (ret) {
+        error_report("Failed to free ioas: %u %m", ioas);
+    }
+}
+
+int iommufd_get_ioas(int *fd, uint32_t *ioas_id)
+{
+    int ret;
+
+    *fd = iommufd_get();
+    if (*fd < 0) {
+        return *fd;
+    }
+
+    ret = iommufd_alloc_ioas(*fd, ioas_id);
+    trace_iommufd_get_ioas(*fd, *ioas_id, ret);
+    if (ret) {
+        iommufd_put(*fd);
+    }
+    return ret;
+}
+
+void iommufd_put_ioas(int iommufd, uint32_t ioas)
+{
+    trace_iommufd_put_ioas(iommufd, ioas);
+    iommufd_free_ioas(iommufd, ioas);
+    iommufd_put(iommufd);
+}
+
+int iommufd_unmap_dma(int iommufd, uint32_t ioas,
+                      hwaddr iova, ram_addr_t size)
+{
+    int ret;
+    struct iommu_ioas_unmap unmap = {
+        .size = sizeof(unmap),
+        .ioas_id = ioas,
+        .iova = iova,
+        .length = size,
+    };
+
+    ret = ioctl(iommufd, IOMMU_IOAS_UNMAP, &unmap);
+    trace_iommufd_unmap_dma(iommufd, ioas, iova, size, ret);
+    if (ret) {
+        error_report("IOMMU_IOAS_UNMAP failed: %s", strerror(errno));
+    }
+    return !ret ? 0 : -errno;
+}
+
+int iommufd_map_dma(int iommufd, uint32_t ioas, hwaddr iova,
+                    ram_addr_t size, void *vaddr, bool readonly)
+{
+    int ret;
+    struct iommu_ioas_map map = {
+        .size = sizeof(map),
+        .flags = IOMMU_IOAS_MAP_READABLE |
+                 IOMMU_IOAS_MAP_FIXED_IOVA,
+        .ioas_id = ioas,
+        .__reserved = 0,
+        .user_va = (int64_t)vaddr,
+        .iova = iova,
+        .length = size,
+    };
+
+    if (!readonly) {
+        map.flags |= IOMMU_IOAS_MAP_WRITEABLE;
+    }
+
+    ret = ioctl(iommufd, IOMMU_IOAS_MAP, &map);
+    trace_iommufd_map_dma(iommufd, ioas, iova, size, vaddr, readonly, ret);
+    if (ret) {
+        error_report("IOMMU_IOAS_MAP failed: %s", strerror(errno));
+    }
+    return !ret ? 0 : -errno;
+}
+
+int iommufd_copy_dma(int iommufd, uint32_t src_ioas, uint32_t dst_ioas,
+                     hwaddr iova, ram_addr_t size, bool readonly)
+{
+    int ret;
+    struct iommu_ioas_copy copy = {
+        .size = sizeof(copy),
+        .flags = IOMMU_IOAS_MAP_READABLE |
+                 IOMMU_IOAS_MAP_FIXED_IOVA,
+        .dst_ioas_id = dst_ioas,
+        .src_ioas_id = src_ioas,
+        .length = size,
+        .dst_iova = iova,
+        .src_iova = iova,
+    };
+
+    if (!readonly) {
+        copy.flags |= IOMMU_IOAS_MAP_WRITEABLE;
+    }
+
+    ret = ioctl(iommufd, IOMMU_IOAS_COPY, &copy);
+    trace_iommufd_copy_dma(iommufd, src_ioas, dst_ioas,
+                           iova, size, readonly, ret);
+    if (ret) {
+        error_report("IOMMU_IOAS_COPY failed: %s", strerror(errno));
+    }
+    return !ret ? 0 : -errno;
+}
+
+static void iommufd_register_types(void)
+{
+    qemu_mutex_init(&iommufd_lock);
+}
+
+type_init(iommufd_register_types)
diff --git a/hw/iommufd/meson.build b/hw/iommufd/meson.build
new file mode 100644
index 0000000000..515bc40cbe
--- /dev/null
+++ b/hw/iommufd/meson.build
@@ -0,0 +1 @@
+specific_ss.add(when: 'CONFIG_IOMMUFD', if_true: files('iommufd.c'))
diff --git a/hw/iommufd/trace-events b/hw/iommufd/trace-events
new file mode 100644
index 0000000000..615d80cdf4
--- /dev/null
+++ b/hw/iommufd/trace-events
@@ -0,0 +1,11 @@
+# See docs/devel/tracing.rst for syntax documentation.
+
+iommufd_get(int iommufd) " iommufd=%d"
+iommufd_put(int iommufd) " iommufd=%d"
+iommufd_alloc_ioas(int iommufd, uint32_t ioas, int ret) " iommufd=%d ioas=%d (%d)"
+iommufd_free_ioas(int iommufd, uint32_t ioas, int ret) " iommufd=%d ioas=%d (%d)"
+iommufd_get_ioas(int iommufd, uint32_t ioas, int ret) " iommufd=%d ioas=%d (%d)"
+iommufd_put_ioas(int iommufd, uint32_t ioas) " iommufd=%d ioas=%d"
+iommufd_unmap_dma(int iommufd, uint32_t ioas, uint64_t iova, uint64_t size, int ret) " iommufd=%d ioas=%d iova=0x%"PRIx64" size=0x%"PRIx64" (%d)"
+iommufd_map_dma(int iommufd, uint32_t ioas, uint64_t iova, uint64_t size, void *vaddr, bool readonly, int ret) " iommufd=%d ioas=%d iova=0x%"PRIx64" size=0x%"PRIx64" addr=%p readonly=%d (%d)"
+iommufd_copy_dma(int iommufd, uint32_t src_ioas, uint32_t dst_ioas, uint64_t iova, uint64_t size, bool readonly, int ret) " iommufd=%d src_ioas=%d dst_ioas=%d iova=0x%"PRIx64" size=0x%"PRIx64" readonly=%d (%d)"
diff --git a/hw/iommufd/trace.h b/hw/iommufd/trace.h
new file mode 100644
index 0000000000..3fb40b0932
--- /dev/null
+++ b/hw/iommufd/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-hw_iommufd.h"
diff --git a/hw/meson.build b/hw/meson.build
index b3366c888e..ffb5203265 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -38,6 +38,7 @@ subdir('timer')
 subdir('tpm')
 subdir('usb')
 subdir('vfio')
+subdir('iommufd')
 subdir('virtio')
 subdir('watchdog')
 subdir('xen')
diff --git a/include/hw/iommufd/iommufd.h b/include/hw/iommufd/iommufd.h
new file mode 100644
index 0000000000..59835cddca
--- /dev/null
+++ b/include/hw/iommufd/iommufd.h
@@ -0,0 +1,37 @@
+/*
+ * QEMU IOMMUFD
+ *
+ * Copyright (C) 2022 Intel Corporation.
+ * Copyright Red Hat, Inc. 2022
+ *
+ * Authors: Yi Liu <yi.l.liu@intel.com>
+ *          Eric Auger <eric.auger@redhat.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_IOMMUFD_IOMMUFD_H
+#define HW_IOMMUFD_IOMMUFD_H
+#include "exec/hwaddr.h"
+#include "exec/cpu-common.h"
+
+int iommufd_get_ioas(int *fd, uint32_t *ioas_id);
+void iommufd_put_ioas(int fd, uint32_t ioas_id);
+int iommufd_unmap_dma(int iommufd, uint32_t ioas, hwaddr iova, ram_addr_t size);
+int iommufd_map_dma(int iommufd, uint32_t ioas, hwaddr iova,
+                    ram_addr_t size, void *vaddr, bool readonly);
+int iommufd_copy_dma(int iommufd, uint32_t src_ioas, uint32_t dst_ioas,
+                     hwaddr iova, ram_addr_t size, bool readonly);
+bool iommufd_supported(void);
+#endif /* HW_IOMMUFD_IOMMUFD_H */
diff --git a/meson.build b/meson.build
index 861de93c4f..45caa53db6 100644
--- a/meson.build
+++ b/meson.build
@@ -2755,6 +2755,7 @@ if have_system
     'hw/tpm',
     'hw/usb',
     'hw/vfio',
+    'hw/iommufd',
     'hw/virtio',
     'hw/watchdog',
     'hw/xen',
-- 
2.27.0


