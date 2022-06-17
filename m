Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8210654F28B
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 10:13:17 +0200 (CEST)
Received: from localhost ([::1]:42802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o276S-0005cu-4N
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 04:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o26lN-0005MO-9I
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 03:51:29 -0400
Received: from mga06b.intel.com ([134.134.136.31]:28798 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o26lK-000779-B6
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 03:51:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655452286; x=1686988286;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TmmymS2zMdJqwA2QJe8CWQ23Yt3VkbkPJtURlcK+Es4=;
 b=VNXoPkGsWWRDBhhp+G/MD4w5JjyATfu/qPuRMcZfBtDvve6fuV5hgx/D
 PFDrc2YhoWBwFO95uxbU2MbbE8IxJfeJjeSpFFoBrKSaG5+u/oHSIY3aY
 Z3tp9mUBbxlYVwxcez6cu/ndEwk89X5sDdDZWJnISQCNTEyPJD+yRbu4W
 0RxXSnIK/Lp35rEBWdSI/jC+o2kIVZorteEhLHenkT5qXqMrinTh60sq0
 Q/B+6Cd8bCBX4VI8T7sLVe0ef0iZNDN0I1dmPAZcvtxQ00d6ifsQ7H7c2
 i9Q9S+XjRrQL0SbZdIbjxoKfeeDxvgBgT9rJffXxktETeEpK1x9soCajL g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="341102159"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="341102159"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 00:51:25 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="641936751"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 00:51:22 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: Zhang Chen <chen.zhang@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>
Subject: [RFC PATCH 07/12] net/filter: Introduce filter-ubpf module
Date: Fri, 17 Jun 2022 15:36:25 +0800
Message-Id: <20220617073630.535914-8-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220617073630.535914-1-chen.zhang@intel.com>
References: <20220617073630.535914-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=chen.zhang@intel.com;
 helo=mga06.intel.com
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

The filter-ubpf module able to load user defined ebpf program
to handle network packet based on filter framework.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/filter-ubpf.c | 149 ++++++++++++++++++++++++++++++++++++++++++++++
 net/meson.build   |   1 +
 2 files changed, 150 insertions(+)
 create mode 100644 net/filter-ubpf.c

diff --git a/net/filter-ubpf.c b/net/filter-ubpf.c
new file mode 100644
index 0000000000..c63a021759
--- /dev/null
+++ b/net/filter-ubpf.c
@@ -0,0 +1,149 @@
+/*
+ * QEMU Userspace eBPF Support
+ *
+ * Copyright(C) 2022 Intel Corporation.
+ *
+ * Author:
+ *  Zhang Chen <chen.zhang@intel.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "net/filter.h"
+#include "net/net.h"
+#include "qapi/error.h"
+#include "qom/object.h"
+#include "qemu/main-loop.h"
+#include "qemu/error-report.h"
+#include "trace.h"
+#include "ebpf/ubpf.h"
+
+#define TYPE_FILTER_UBPF "filter-ubpf"
+OBJECT_DECLARE_SIMPLE_TYPE(FiliterUbpfState, FILTER_UBPF)
+
+struct FiliterUbpfState {
+    NetFilterState parent_obj;
+    bool ip_mode;
+    char *handler;
+    UbpfState ubpf;
+};
+
+static ssize_t filter_ubpf_receive_iov(NetFilterState *nf,
+                                       NetClientState *sender,
+                                       unsigned flags,
+                                       const struct iovec *iov,
+                                       int iovcnt,
+                                       NetPacketSent *sent_cb)
+{
+    /* TODO: handle packet by loaded userspace ebpf program */
+
+    return 0;
+}
+
+static void filter_ubpf_cleanup(NetFilterState *nf)
+{
+    /* cleanup */
+}
+
+static void filter_ubpf_setup(NetFilterState *nf, Error **errp)
+{
+    FiliterUbpfState *s = FILTER_UBPF(nf);
+
+    if (s->handler == NULL) {
+        error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND, "filter-ubpf parameter"\
+                  " 'ubpf-handler' cannot be empty");
+        return;
+    }
+
+    qemu_ubpf_init_jit(&s->ubpf, true);
+
+    if (qemu_ubpf_prepare(&s->ubpf, s->handler)) {
+        error_set(errp, ERROR_CLASS_DEVICE_NOT_ACTIVE, "filter-ubpf parameter"\
+                  " 'ubpf-handler' cannot be load");
+        return;
+    }
+}
+
+static char *filter_ubpf_get_handler(Object *obj, Error **errp)
+{
+    FiliterUbpfState *s = FILTER_UBPF(obj);
+
+    return g_strdup(s->handler);
+}
+
+static void filter_ubpf_set_handler(Object *obj,
+                                    const char *value,
+                                    Error **errp)
+{
+    FiliterUbpfState *s = FILTER_UBPF(obj);
+
+    g_free(s->handler);
+    s->handler = g_strdup(value);
+    if (!s->handler) {
+        error_setg(errp, "filter ubpf needs 'ubpf-handler' "
+                   "property set");
+        return;
+    }
+}
+
+static bool filter_ubpf_get_mode(Object *obj, Error **errp)
+{
+    FiliterUbpfState *s = FILTER_UBPF(obj);
+
+    return s->ip_mode;
+}
+
+static void filter_ubpf_set_mode(Object *obj, bool value, Error **errp)
+{
+    FiliterUbpfState *s = FILTER_UBPF(obj);
+
+    s->ip_mode = value;
+}
+
+static void filter_ubpf_class_init(ObjectClass *oc, void *data)
+{
+    NetFilterClass *nfc = NETFILTER_CLASS(oc);
+
+    object_class_property_add_str(oc, "ubpf-handler",
+                                  filter_ubpf_get_handler,
+                                  filter_ubpf_set_handler);
+    object_class_property_add_bool(oc, "ip-mode",
+                                   filter_ubpf_get_mode,
+                                   filter_ubpf_set_mode);
+
+    nfc->setup = filter_ubpf_setup;
+    nfc->cleanup = filter_ubpf_cleanup;
+    nfc->receive_iov = filter_ubpf_receive_iov;
+}
+
+static void filter_ubpf_init(Object *obj)
+{
+    FiliterUbpfState *s = FILTER_UBPF(obj);
+
+    /* Filter-ubpf default is ip_mode */
+    s->ip_mode = true;
+}
+
+static void filter_ubpf_fini(Object *obj)
+{
+    /* do some thing */
+}
+
+static const TypeInfo filter_ubpf_info = {
+    .name = TYPE_FILTER_UBPF,
+    .parent = TYPE_NETFILTER,
+    .class_init = filter_ubpf_class_init,
+    .instance_init = filter_ubpf_init,
+    .instance_finalize = filter_ubpf_fini,
+    .instance_size = sizeof(FiliterUbpfState),
+};
+
+static void register_types(void)
+{
+    type_register_static(&filter_ubpf_info);
+}
+
+type_init(register_types);
diff --git a/net/meson.build b/net/meson.build
index 754e2d1d40..177078fa7a 100644
--- a/net/meson.build
+++ b/net/meson.build
@@ -14,6 +14,7 @@ softmmu_ss.add(files(
   'queue.c',
   'socket.c',
   'util.c',
+  'filter-ubpf.c',
 ))
 
 softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('filter-replay.c'))
-- 
2.25.1


