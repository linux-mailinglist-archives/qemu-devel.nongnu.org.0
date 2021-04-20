Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A73AB3652DA
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 09:07:18 +0200 (CEST)
Received: from localhost ([::1]:60268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYkTY-0004sE-Of
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 03:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lYkS9-00031O-Tn
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 03:05:45 -0400
Received: from mga17.intel.com ([192.55.52.151]:17751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lYkS6-0002hb-3I
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 03:05:45 -0400
IronPort-SDR: GSvbEoLRgletEd8oSb9y7CDZ5SEuhPtdNSaW0iQ0mwFH1uE1YR/jrzIB68weKAnBEET4VYZaNS
 eehuaVL1eX1g==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="175563723"
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; d="scan'208";a="175563723"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 00:05:37 -0700
IronPort-SDR: 1fL0I301hqh03DPAElGTrI67tHVyczg+JAdBFp/D2OnUct0NfoD8KrOvi9m4VkPuMHAr0BX/cl
 mJKj39fNkJNQ==
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; d="scan'208";a="420293114"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 00:05:36 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/12] ui: Get the fd associated with udmabuf driver
Date: Mon, 19 Apr 2021 23:53:36 -0700
Message-Id: <20210420065347.2685768-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210420065347.2685768-1-vivek.kasireddy@intel.com>
References: <20210420065347.2685768-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=vivek.kasireddy@intel.com; helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Try to open the udmabuf dev node for the first time or return the
fd if the device was previously opened.

Based-on-patch-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/ui/console.h |  3 +++
 ui/meson.build       |  1 +
 ui/udmabuf.c         | 40 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+)
 create mode 100644 ui/udmabuf.c

diff --git a/include/ui/console.h b/include/ui/console.h
index ca3c7af6a6..b30b63976a 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -471,4 +471,7 @@ bool vnc_display_reload_certs(const char *id,  Error **errp);
 /* input.c */
 int index_from_key(const char *key, size_t key_length);
 
+/* udmabuf.c */
+int udmabuf_fd(void);
+
 #endif
diff --git a/ui/meson.build b/ui/meson.build
index e8d3ff41b9..7a709ff548 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -11,6 +11,7 @@ softmmu_ss.add(files(
   'kbd-state.c',
   'keymaps.c',
   'qemu-pixman.c',
+  'udmabuf.c',
 ))
 softmmu_ss.add([spice_headers, files('spice-module.c')])
 
diff --git a/ui/udmabuf.c b/ui/udmabuf.c
new file mode 100644
index 0000000000..e6234fd86f
--- /dev/null
+++ b/ui/udmabuf.c
@@ -0,0 +1,40 @@
+/*
+ * udmabuf helper functions.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "ui/console.h"
+
+#ifdef CONFIG_LINUX
+
+#include <sys/fcntl.h>
+#include <sys/ioctl.h>
+
+int udmabuf_fd(void)
+{
+    static bool first = true;
+    static int udmabuf;
+
+    if (!first) {
+        return udmabuf;
+    }
+    first = false;
+
+    udmabuf = open("/dev/udmabuf", O_RDWR);
+    if (udmabuf < 0) {
+        warn_report("open /dev/udmabuf: %s", strerror(errno));
+    }
+    return udmabuf;
+}
+
+#else
+
+int udmabuf_fd(void)
+{
+    return -1;
+}
+
+#endif
-- 
2.26.2


