Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C98392345
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 01:32:10 +0200 (CEST)
Received: from localhost ([::1]:55250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm30T-0002aQ-HH
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 19:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lm2vf-0002qN-41
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:27:11 -0400
Received: from mga01.intel.com ([192.55.52.88]:11254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lm2vb-0001y0-Ix
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:27:10 -0400
IronPort-SDR: Pt6xnB7bfqYzUvKhZxdM1+FZFTb6Y/WO1WSJ7XlyyOazHGorqsBklo2lcPxMaRzCCAnsi3/Vdu
 5x/Bez94Z2OA==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="223801542"
X-IronPort-AV: E=Sophos;i="5.82,333,1613462400"; d="scan'208";a="223801542"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 16:26:56 -0700
IronPort-SDR: /N2d5yKDooZ5rJG5AqtZ+wvn/eBuOe/4Hc/1HtwJz0rrJH94k4LuZ5qgL/6JQKluRTAWi22v2S
 fmJPgdqJpuiw==
X-IronPort-AV: E=Sophos;i="5.82,333,1613462400"; d="scan'208";a="477188141"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 16:26:56 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 04/14] stubs: Add stubs for udmabuf helpers
Date: Wed, 26 May 2021 16:14:19 -0700
Message-Id: <20210526231429.1045476-5-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526231429.1045476-1-vivek.kasireddy@intel.com>
References: <20210526231429.1045476-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.88;
 envelope-from=vivek.kasireddy@intel.com; helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This is needed to ensure that virtio-gpu device works for
non-linux builds.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 meson.build                |  2 +-
 stubs/meson.build          |  1 +
 stubs/virtio-gpu-udmabuf.c | 18 ++++++++++++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 stubs/virtio-gpu-udmabuf.c

diff --git a/meson.build b/meson.build
index 632b380738..9b6d93b8bb 100644
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
index 3faef16892..9915251c4f 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -40,6 +40,7 @@ stub_ss.add(files('target-monitor-defs.c'))
 stub_ss.add(files('tpm.c'))
 stub_ss.add(files('trace-control.c'))
 stub_ss.add(files('uuid.c'))
+stub_ss.add(files('virtio-gpu-udmabuf.c'))
 stub_ss.add(files('vmgenid.c'))
 stub_ss.add(files('vmstate.c'))
 stub_ss.add(files('vm-stop.c'))
diff --git a/stubs/virtio-gpu-udmabuf.c b/stubs/virtio-gpu-udmabuf.c
new file mode 100644
index 0000000000..e962e00d86
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
-- 
2.30.2


