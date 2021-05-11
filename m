Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401A737B20B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 01:02:10 +0200 (CEST)
Received: from localhost ([::1]:46878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgbOD-0001X3-7m
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 19:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgbM2-0007Ov-BC
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:59:54 -0400
Received: from mga05.intel.com ([192.55.52.43]:2837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgbM0-0006DO-IP
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:59:54 -0400
IronPort-SDR: 1rZtVggcIuU0DH1OXjrkHIRu4/V14lNq2p82NJW/yKDaQr71mB9wd7YoRkqqcE+IHuEswRzAKS
 i+IzVyXL6EpA==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="285065715"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="285065715"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 15:59:40 -0700
IronPort-SDR: b2gzyzLx16OhFlHo1S5uyEeuVPwu5DIshNBxRQYQcMvFY3WPr01ksVVCwyX25KK1y57V+EjBEN
 BP+ZewxXrlYw==
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="436883278"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 15:59:40 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/13] ui: Get the fd associated with udmabuf driver
Date: Tue, 11 May 2021 15:47:07 -0700
Message-Id: <20210511224719.387443-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511224719.387443-1-vivek.kasireddy@intel.com>
References: <20210511224719.387443-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43;
 envelope-from=vivek.kasireddy@intel.com; helo=mga05.intel.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
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
2.30.2


