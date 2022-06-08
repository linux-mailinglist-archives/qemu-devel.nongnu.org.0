Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 750B35430D7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 14:52:25 +0200 (CEST)
Received: from localhost ([::1]:50692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyvAe-0002UU-I0
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 08:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nyur6-0000p9-KA
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 08:32:12 -0400
Received: from mga05.intel.com ([192.55.52.43]:56958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nyur4-0005ks-Aw
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 08:32:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654691530; x=1686227530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9oajes8EV6rgYzGmYnPn9mJY8K7V4O6AG1IziEyV2Os=;
 b=c+H0sX7YvznzcOjJmycWUJ0Ph5qDMybIV6qo581E6qnstSW/o0DM+bVd
 4nZH/l7iERJXUOQpVjWfA3yNWTB4HtDS2eSh8Qz4nYnNsEoXRZl+W2I7x
 vahrH5y7gVnF9oDXECUXiEWKP2GXiUf8REaN42otPcxHpkMg9uCjFJJiV
 IibCZd7SjvEr+dhxlZ+wWTCVNZyLWJ+tEASJcjwW4H4E4dXR4LC7cQjsB
 ASaVZ6TdeTlabFyY+FmImNHoQ/6em7N+OyOlZAbM+vfYWA9MesW3PPVex
 BUjSEC+rF3KcmNwb2g5OfqW6ZXkP371CrFmWPro7X97WP6pk4qvg/+neG Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="363210165"
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; d="scan'208";a="363210165"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 05:31:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; d="scan'208";a="670529878"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Jun 2022 05:31:48 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	cohuck@redhat.com,
	qemu-devel@nongnu.org
Cc: david@gibson.dropbear.id.au, thuth@redhat.com, farman@linux.ibm.com,
 mjrosato@linux.ibm.com, akrowiak@linux.ibm.com, pasic@linux.ibm.com,
 jjherne@linux.ibm.com, jasowang@redhat.com, kvm@vger.kernel.org,
 jgg@nvidia.com, nicolinc@nvidia.com, eric.auger@redhat.com,
 eric.auger.pro@gmail.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 chao.p.peng@intel.com, yi.y.sun@intel.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, zhangfei.gao@linaro.org,
 berrange@redhat.com
Subject: [RFC v2 12/15] util/char_dev: Add open_cdev()
Date: Wed,  8 Jun 2022 05:31:36 -0700
Message-Id: <20220608123139.19356-13-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220608123139.19356-1-yi.l.liu@intel.com>
References: <20220608123139.19356-1-yi.l.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=yi.l.liu@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

/dev/vfio/devices/vfioX may not exist. In that case it is still possible
to open /dev/char/$major:$minor instead. Add helper function to abstract
the cdev open.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 MAINTAINERS             |  6 +++++
 include/qemu/char_dev.h | 16 ++++++++++++
 util/chardev_open.c     | 58 +++++++++++++++++++++++++++++++++++++++++
 util/meson.build        |  1 +
 4 files changed, 81 insertions(+)
 create mode 100644 include/qemu/char_dev.h
 create mode 100644 util/chardev_open.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c6aa4e7fd0..0b3ade4170 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3171,6 +3171,12 @@ S: Maintained
 F: include/qemu/iova-tree.h
 F: util/iova-tree.c
 
+cdev Open
+M: Yi Liu <yi.l.liu@intel.com>
+S: Maintained
+F: include/qemu/char_dev.h
+F: util/chardev_open.c
+
 elf2dmp
 M: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
 S: Maintained
diff --git a/include/qemu/char_dev.h b/include/qemu/char_dev.h
new file mode 100644
index 0000000000..79877fb24d
--- /dev/null
+++ b/include/qemu/char_dev.h
@@ -0,0 +1,16 @@
+/*
+ * QEMU Chardev Helper
+ *
+ * Copyright (C) 2022 Intel Corporation.
+ *
+ * Authors: Yi Liu <yi.l.liu@intel.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef QEMU_CHARDEV_HELPERS_H
+#define QEMU_CHARDEV_HELPERS_H
+
+int open_cdev(const char *devpath, dev_t cdev);
+#endif
diff --git a/util/chardev_open.c b/util/chardev_open.c
new file mode 100644
index 0000000000..133fad06ec
--- /dev/null
+++ b/util/chardev_open.c
@@ -0,0 +1,58 @@
+/*
+ * Copyright (C) 2022 Intel Corporation.
+ * Copyright (c) 2019, Mellanox Technologies. All rights reserved.
+ *
+ * Authors: Yi Liu <yi.l.liu@intel.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Copied from https://github.com/linux-rdma/rdma-core/blob/master/util/open_cdev.c
+ *
+ */
+#ifndef _GNU_SOURCE
+#define _GNU_SOURCE
+#endif
+#include "qemu/osdep.h"
+#include "qemu/char_dev.h"
+
+static int open_cdev_internal(const char *path, dev_t cdev)
+{
+    struct stat st;
+    int fd;
+
+    fd = qemu_open_old(path, O_RDWR);
+    if (fd == -1)
+        return -1;
+    if (fstat(fd, &st) || !S_ISCHR(st.st_mode) ||
+        (cdev != 0 && st.st_rdev != cdev)) {
+        close(fd);
+        return -1;
+    }
+    return fd;
+}
+
+static int open_cdev_robust(dev_t cdev)
+{
+    char *devpath;
+    int ret;
+
+    /*
+     * This assumes that udev is being used and is creating the /dev/char/
+     * symlinks.
+     */
+    devpath = g_strdup_printf("/dev/char/%u:%u", major(cdev), minor(cdev));
+    ret = open_cdev_internal(devpath, cdev);
+    g_free(devpath);
+    return ret;
+}
+
+int open_cdev(const char *devpath, dev_t cdev)
+{
+    int fd;
+
+    fd = open_cdev_internal(devpath, cdev);
+    if (fd == -1 && cdev != 0)
+        return open_cdev_robust(cdev);
+    return fd;
+}
diff --git a/util/meson.build b/util/meson.build
index 8f16018cd4..eff15d3826 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -95,4 +95,5 @@ if have_block
     util_ss.add(files('filemonitor-stub.c'))
   endif
   util_ss.add(when: 'CONFIG_LINUX', if_true: files('vfio-helpers.c'))
+  util_ss.add(when: 'CONFIG_LINUX', if_true: files('chardev_open.c'))
 endif
-- 
2.27.0


