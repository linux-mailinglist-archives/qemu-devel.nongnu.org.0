Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3587334F767
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 05:23:49 +0200 (CEST)
Received: from localhost ([::1]:40572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRRSN-0004E6-Ow
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 23:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lRRQT-0002Yl-8K
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 23:21:49 -0400
Received: from mga18.intel.com ([134.134.136.126]:53070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lRRQL-00057q-Ml
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 23:21:48 -0400
IronPort-SDR: /WMHXdbo7ES+ou6oY7cZDiUYJ3Emw88Bwr9DkBgMDTzgoj5T4dCBusAh5MEcIW5FKbKRHYsaF7
 OP3QhfEaamvA==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="179449760"
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="179449760"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 20:21:33 -0700
IronPort-SDR: xQznw9dCNKkWdS7I4ZPme1FGyAxWilkVYdcI6qR/dI5U2jTROIawDKn7ydIZPUuCHWUKZJYetl
 RVz3qKhksjAg==
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="418454105"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 20:21:33 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/11] ui: Get the fd associated with udmabuf driver
Date: Tue, 30 Mar 2021 20:09:51 -0700
Message-Id: <20210331031001.1564125-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210331031001.1564125-1-vivek.kasireddy@intel.com>
References: <20210331031001.1564125-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=vivek.kasireddy@intel.com; helo=mga18.intel.com
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


