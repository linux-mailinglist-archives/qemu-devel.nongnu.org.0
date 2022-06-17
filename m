Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D02F454F23F
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 09:54:38 +0200 (CEST)
Received: from localhost ([::1]:50460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o26oP-0007m2-AJ
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 03:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o26lB-000575-Hg
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 03:51:17 -0400
Received: from mga06b.intel.com ([134.134.136.31]:28791 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o26l9-00074u-6l
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 03:51:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655452275; x=1686988275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=whdQNEMqdbB7synrgxp+I8MwnlGsyMBCOizN8yk/qDo=;
 b=HWhZq7vsVbjRs/DNOFuN5lRdS+XwdkYL769pEi9B58MHfF5/raMWxlr5
 XUVQb1VK+1iKVZqJmmWrBRBcy28Caq3mWx59XQ6VPhXR/QMm6CExQO6Vj
 xDyfw8NQ8W6NArvqAOxMqcBV8zAOfnnebmvY2SgOJoxIr4CosoYHqr6qo
 aw8MdM+mzjKlCZjMVGF9bK3ontaNWiHefGs2suK7Z2AyWO7SfMVHoc5kV
 VXeXTxfR+qYCjVYCk42VsyHTNulYcKz8myGQVC85FsH7GI3tmRtxsgAhL
 JlLXuFVndHlIvDCXW8vkZyi66CHA63vUzYm2Qx3ioF6t5Q5HhCXEDIqI5 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="341102125"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="341102125"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 00:51:12 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="641936669"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 00:51:10 -0700
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
Subject: [RFC PATCH 03/12] ebpf/uBPF: Introduce userspace ebpf data structure
Date: Fri, 17 Jun 2022 15:36:21 +0800
Message-Id: <20220617073630.535914-4-chen.zhang@intel.com>
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

Add ebpf/ubpf.h for the UbpfState.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 ebpf/ubpf.h | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 ebpf/ubpf.h

diff --git a/ebpf/ubpf.h b/ebpf/ubpf.h
new file mode 100644
index 0000000000..2562fff503
--- /dev/null
+++ b/ebpf/ubpf.h
@@ -0,0 +1,37 @@
+/*
+ * QEMU Userspace eBPF Header
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
+#ifndef QEMU_UBPF_H
+#define QEMU_UBPF_H
+
+#include <ubpf.h>
+#include <math.h>
+#include <elf.h>
+
+#define MAX_LEN (1024 * 1024)
+
+typedef struct UbpfState {
+    bool jit;
+    char *code_path;
+    void *code;
+    size_t code_len;
+    char *target_path;
+    void *target;
+    size_t target_len;
+    struct ubpf_vm *vm;
+    ubpf_jit_fn fn;
+    int type;
+    char *func;
+} UbpfState;
+
+#endif /* QEMU_UBPF_H */
-- 
2.25.1


