Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 382A354F24E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 09:59:17 +0200 (CEST)
Received: from localhost ([::1]:59084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o26su-0005Be-4x
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 03:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o26lD-00057i-51
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 03:51:19 -0400
Received: from mga06b.intel.com ([134.134.136.31]:28798 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o26lA-000779-L3
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 03:51:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655452276; x=1686988276;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=itrH3lwJEdenqHNk/rzk/jU1d9vLWcacw9Xlg0BpOgI=;
 b=h+XJc/VzrCw0A9dK2372tWxKznQHiCGNPjohTSECuhnGATMXJ2voE/k3
 aWnflP2IQkHIj/fvIRh47mCPHvOzxAFhDc/C7jHcgFlVDOP8/CWquKJD/
 90Ha9/h2C1RYHk8Ak5r2kZTNtSSL+Q8eNbhAOraXKwILnX0kFe/TVrxKT
 qRaUF9btKMGQ6hwH8W1FXufNm4Fnpg8w413VSXAjZyW/Pejw2QiO1q5mR
 S/8sc3miti5QyMnkQPx4PMPc+dCFeOVbkw6n4WZdRC5fdriseQ3S3+F98
 YYmkyDd7SpmL5jQDNtltjeR2r+JniBHgstA6dgMYMCibX29MqfpRlSy6G w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="341102138"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="341102138"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 00:51:15 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="641936688"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 00:51:13 -0700
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
Subject: [RFC PATCH 04/12] ebpf/uBPF: Introduce ubpf initialize functions
Date: Fri, 17 Jun 2022 15:36:22 +0800
Message-Id: <20220617073630.535914-5-chen.zhang@intel.com>
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

Introduce ubpf.c/ubpf-stub.c with basic read and init_jit functions.
Add ubpf related .c files to meson.build.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 ebpf/meson.build |   1 +
 ebpf/ubpf-stub.c |  24 +++++++++++
 ebpf/ubpf.c      | 101 +++++++++++++++++++++++++++++++++++++++++++++++
 ebpf/ubpf.h      |   4 ++
 4 files changed, 130 insertions(+)
 create mode 100644 ebpf/ubpf-stub.c
 create mode 100644 ebpf/ubpf.c

diff --git a/ebpf/meson.build b/ebpf/meson.build
index 2dd0fd8948..f4457fbd28 100644
--- a/ebpf/meson.build
+++ b/ebpf/meson.build
@@ -1 +1,2 @@
 softmmu_ss.add(when: libbpf, if_true: files('ebpf_rss.c'), if_false: files('ebpf_rss-stub.c'))
+softmmu_ss.add(when: ubpf, if_true: files('ubpf.c'), if_false: files('ubpf-stub.c'))
diff --git a/ebpf/ubpf-stub.c b/ebpf/ubpf-stub.c
new file mode 100644
index 0000000000..2e8bf15b91
--- /dev/null
+++ b/ebpf/ubpf-stub.c
@@ -0,0 +1,24 @@
+/*
+ * QEMU Userspace eBPF Stub File
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
+bool qemu_ubpf_read_code(UbpfState *u_ebpf, char *path)
+{
+    return 0;
+}
+
+bool qemu_ubpf_read_target(UbpfState *u_ebpf, char *path)
+{
+    return 0;
+}
+
+void qemu_ubpf_init_jit(UbpfState *u_ebpf, bool jit) {}
diff --git a/ebpf/ubpf.c b/ebpf/ubpf.c
new file mode 100644
index 0000000000..38a6530903
--- /dev/null
+++ b/ebpf/ubpf.c
@@ -0,0 +1,101 @@
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
+#include "qemu/error-report.h"
+#include "ebpf/ubpf.h"
+
+static void *qemu_ubpf_read(const char *path, size_t maxlen, size_t *len)
+{
+    FILE *file;
+    size_t offset = 0, rv;
+    void *data;
+
+    if (!strcmp(path, "-")) {
+        file = fdopen(STDIN_FILENO, "r");
+    } else {
+        file = fopen(path, "r");
+    }
+
+    if (file == NULL) {
+        error_report("Failed to open %s: %s", path, strerror(errno));
+        return NULL;
+    }
+
+    data = g_malloc0(maxlen);
+
+    while ((rv = fread(data + offset, 1, maxlen - offset, file)) > 0) {
+        offset += rv;
+    }
+
+    if (ferror(file)) {
+        error_report("Failed to read %s: %s", path, strerror(errno));
+        goto err;
+    }
+
+    if (!feof(file)) {
+        error_report("Failed to read %s because it is too large"
+                     " (max %u bytes)", path, (unsigned)maxlen);
+        goto err;
+    }
+
+    fclose(file);
+    if (len) {
+        *len = offset;
+    }
+    return data;
+
+err:
+    fclose(file);
+    free(data);
+    return false;
+}
+
+/* Read Userspace eBPF binary file to QEMU */
+bool qemu_ubpf_read_code(UbpfState *u_ebpf, char *path)
+{
+    if (!path) {
+        return false;
+    }
+    u_ebpf->code_path = path;
+
+    u_ebpf->code = qemu_ubpf_read(u_ebpf->code_path, MAX_LEN,
+                                  &u_ebpf->code_len);
+    if (u_ebpf->code) {
+        return true;
+    } else {
+        return false;
+    }
+}
+
+/* Read Userspace eBPF target */
+bool qemu_ubpf_read_target(UbpfState *u_ebpf, char *path)
+{
+    if (!path) {
+        return false;
+    }
+    u_ebpf->target_path = path;
+
+    u_ebpf->target = qemu_ubpf_read(u_ebpf->target_path, MAX_LEN,
+                                    &u_ebpf->target_len);
+    if (u_ebpf->target) {
+        return true;
+    } else {
+        return false;
+    }
+}
+
+void qemu_ubpf_init_jit(UbpfState *u_ebpf, bool jit)
+{
+    u_ebpf->jit = jit;
+}
diff --git a/ebpf/ubpf.h b/ebpf/ubpf.h
index 2562fff503..808c02565c 100644
--- a/ebpf/ubpf.h
+++ b/ebpf/ubpf.h
@@ -34,4 +34,8 @@ typedef struct UbpfState {
     char *func;
 } UbpfState;
 
+bool qemu_ubpf_read_code(UbpfState *u_ebpf, char *path);
+bool qemu_ubpf_read_target(UbpfState *u_ebpf, char *path);
+void qemu_ubpf_init_jit(UbpfState *u_ebpf, bool jit);
+
 #endif /* QEMU_UBPF_H */
-- 
2.25.1


