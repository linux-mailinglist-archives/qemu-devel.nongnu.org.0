Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E41B6F2F32
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 09:41:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptO8R-00055H-K3; Mon, 01 May 2023 03:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1ptO8G-00053Q-OU
 for qemu-devel@nongnu.org; Mon, 01 May 2023 03:39:36 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1ptO8E-0004lR-Jd
 for qemu-devel@nongnu.org; Mon, 01 May 2023 03:39:36 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-50bc3088b7aso2068768a12.3
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 00:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682926773; x=1685518773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wxzi09saFEDLMQRGHi7UFrFhP0FnObo3mb1YPVnMNXg=;
 b=u6eB1PSnc19cAFfXht6GpHR7ZiW1iYoLV/U8JbHSrVsOHZifXUGed5Qtp9iWjPcyM2
 sQSndx5Z3GBSYnn4Khv9W3fFqSyrc9HgEoWY8VVch5mpkyQVnJO5uJWlGtWaSjFF+ONl
 9jg5OR/rwI3VNLZtVgJ01ft0ouvQ8utPR8D1pqT8yfXC4lFfoTLdulMD6XmbQUH5zNFx
 3TS3yyyNNMf+b4hpibTpa7C+ElQg/EFiw6cDdZpWr6jL3z65ppeZtJRT2Z1jXzD3v28F
 nJppMrNhk6GhmTz6HV0qHukEkPLz3aESYs2SlvpiU2NsXG8T+hZNvu1pqcbsPIR/kh1G
 YQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682926773; x=1685518773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wxzi09saFEDLMQRGHi7UFrFhP0FnObo3mb1YPVnMNXg=;
 b=gbgJ/lmbt4H80JKhwYIuII8WTXoTSMdG+RamBp0tQ6OpOUu8P3jWyaVIZ4sZC/BFxz
 22PwRVv0oxBVnb7+dcVD+nCqqILGyZe7cMD8oweQrm2rjPjZbkkHzuX6dFwWnOrjVxRv
 SKdgjU4VxfcYySd8xvlqPWtAWgnabdkRPUHoNflK60ngjmGZWGjzZL8uUt6XeXC78shP
 u+ZcRYlbpjqSOBhWgtp0gdQW/OlH/P/eO9UiqmSYwr/FgYsnrC57+ahsga/7upT/SRdg
 vdtG6+NF8hveezDpmosFIqbdrlhJgJ+o5q5qystLfSzCqb6b34hOoliictCvIJlgMzXL
 CejA==
X-Gm-Message-State: AC+VfDwop0+jvbRv94muKH91aZIdzW1fKzsErZ5mUp3gNkrgsX0LgfYf
 pxVk+Ly9XLESVAASuX8UPNsoQQ==
X-Google-Smtp-Source: ACHHUZ5Fn1yB2VuXAm2+FXYZdm63KeycJhRRSNz0/QaAQi+rxgFcND4fu/u97J0gkRi3uRNz3I6pLg==
X-Received: by 2002:aa7:cacd:0:b0:504:8014:1554 with SMTP id
 l13-20020aa7cacd000000b0050480141554mr5269570edt.28.1682926773308; 
 Mon, 01 May 2023 00:39:33 -0700 (PDT)
Received: from localhost.localdomain (178-133-125-224.mobile.vf-ua.net.
 [178.133.125.224]) by smtp.gmail.com with ESMTPSA id
 d21-20020aa7c1d5000000b005027d31615dsm11708182edp.62.2023.05.01.00.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 00:39:32 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com, mst@redhat.com, armbru@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, berrange@redhat.com
Cc: yuri.benditovich@daynix.com,
	yan@daynix.com
Subject: [PATCH 3/5] ebpf: Added declaration/initialization routines.
Date: Mon,  1 May 2023 10:20:59 +0300
Message-Id: <20230501072101.22890-4-andrew@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230501072101.22890-1-andrew@daynix.com>
References: <20230501072101.22890-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::531;
 envelope-from=andrew@daynix.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Now, the binary objects may be retrieved by id/name.
It would require for future qmp commands that may require specific
eBPF blob.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 ebpf/ebpf.c      | 54 ++++++++++++++++++++++++++++++++++++++++++++++++
 ebpf/ebpf.h      | 31 +++++++++++++++++++++++++++
 ebpf/ebpf_rss.c  |  4 ++++
 ebpf/meson.build |  1 +
 4 files changed, 90 insertions(+)
 create mode 100644 ebpf/ebpf.c
 create mode 100644 ebpf/ebpf.h

diff --git a/ebpf/ebpf.c b/ebpf/ebpf.c
new file mode 100644
index 00000000000..fd96f2b42f9
--- /dev/null
+++ b/ebpf/ebpf.c
@@ -0,0 +1,54 @@
+/*
+ * QEMU eBPF binary declaration routine.
+ *
+ * Developed by Daynix Computing LTD (http://www.daynix.com)
+ *
+ * Authors:
+ *  Andrew Melnychenko <andrew@daynix.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later.  See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/queue.h"
+#include "qapi/error.h"
+#include "ebpf/ebpf.h"
+
+struct ElfBinaryDataEntry {
+    const char *id;
+    const void *data;
+    size_t datalen;
+
+    QSLIST_ENTRY(ElfBinaryDataEntry) node;
+};
+
+static QSLIST_HEAD(, ElfBinaryDataEntry) ebpf_elf_obj_list =
+                                            QSLIST_HEAD_INITIALIZER();
+
+void ebpf_register_binary_data(const char *id, const void *data, size_t datalen)
+{
+    struct ElfBinaryDataEntry *dataentry = NULL;
+
+    dataentry = g_new0(struct ElfBinaryDataEntry, 1);
+    dataentry->data = data;
+    dataentry->datalen = datalen;
+    dataentry->id = id;
+
+    QSLIST_INSERT_HEAD(&ebpf_elf_obj_list, dataentry, node);
+}
+
+const void *ebpf_find_binary_by_id(const char *id, size_t *sz, Error **errp)
+{
+    struct ElfBinaryDataEntry *it = NULL;
+    QSLIST_FOREACH(it, &ebpf_elf_obj_list, node) {
+        if (strcmp(id, it->id) == 0) {
+            *sz = it->datalen;
+            return it->data;
+        }
+    }
+
+    error_setg(errp, "can't find eBPF object with id: %s", id);
+
+    return NULL;
+}
diff --git a/ebpf/ebpf.h b/ebpf/ebpf.h
new file mode 100644
index 00000000000..36c5d455b4b
--- /dev/null
+++ b/ebpf/ebpf.h
@@ -0,0 +1,31 @@
+/*
+ * QEMU eBPF binary declaration routine.
+ *
+ * Developed by Daynix Computing LTD (http://www.daynix.com)
+ *
+ * Authors:
+ *  Andrew Melnychenko <andrew@daynix.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later.  See the COPYING file in the top-level directory.
+ */
+
+#ifndef EBPF_H
+#define EBPF_H
+
+struct Error;
+
+void ebpf_register_binary_data(const char *id, const void *data,
+                               size_t datalen);
+const void *ebpf_find_binary_by_id(const char *id, size_t *sz,
+                                   struct Error **errp);
+
+#define ebpf_binary_init(id, fn)                                           \
+static void __attribute__((constructor)) ebpf_binary_init_ ## fn(void)     \
+{                                                                          \
+    size_t datalen = 0;                                                    \
+    const void *data = fn(&datalen);                                       \
+    ebpf_register_binary_data(id, data, datalen);                          \
+}
+
+#endif /* EBPF_H */
diff --git a/ebpf/ebpf_rss.c b/ebpf/ebpf_rss.c
index 08015fecb18..b4038725f23 100644
--- a/ebpf/ebpf_rss.c
+++ b/ebpf/ebpf_rss.c
@@ -21,6 +21,8 @@
 
 #include "ebpf/ebpf_rss.h"
 #include "ebpf/rss.bpf.skeleton.h"
+#include "ebpf/ebpf.h"
+
 #include "trace.h"
 
 void ebpf_rss_init(struct EBPFRSSContext *ctx)
@@ -237,3 +239,5 @@ void ebpf_rss_unload(struct EBPFRSSContext *ctx)
     ctx->obj = NULL;
     ctx->program_fd = -1;
 }
+
+ebpf_binary_init("rss", rss_bpf__elf_bytes)
diff --git a/ebpf/meson.build b/ebpf/meson.build
index 2dd0fd89480..67c3f53aa9d 100644
--- a/ebpf/meson.build
+++ b/ebpf/meson.build
@@ -1 +1,2 @@
+softmmu_ss.add(files('ebpf.c'))
 softmmu_ss.add(when: libbpf, if_true: files('ebpf_rss.c'), if_false: files('ebpf_rss-stub.c'))
-- 
2.39.1


