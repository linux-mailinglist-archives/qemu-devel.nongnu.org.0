Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AD96CF847
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 02:34:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phgEE-00083l-Kq; Wed, 29 Mar 2023 20:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1phgEC-00083F-HD
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 20:33:20 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1phgEA-0004Et-K7
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 20:33:20 -0400
Received: by mail-wr1-x430.google.com with SMTP id j24so17454492wrd.0
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 17:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1680136397;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gTcU5HqVU1XgtuJ2Y8sd/OBjaB0pp67CpHcRkiVabVQ=;
 b=P9W81ZlrD6we0FkdTcwsWfNrlUwoye2CUAxFp5/F4sL/j6M29+4e3x/zhKoyzYC1H2
 8KPyDBUoaoGedNzGMYJ3b+nXUdl0O6bH9ZeElHGpsq17mhQH8ctZT4QX2E9v4JQmFN/u
 2uDlrjk1bUAeTU3U1jPVrxG4wf3BXdkDIn6dw7PrO8hJh6YUcpovueQrZrvyrZ3M4TB6
 +tQo/Uz6MG+xRYETUg9c4QgjSMiJ2frB+GVIvWF3DcOX21cGiysVpdaSplEmQxf8p5fD
 ykaH5Pz8GMSLP8WScF462wOR1Hd/tILQIvLGmk0BfJm0PLRjIZGdyKcyvcGbj6TLG5kV
 srbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680136397;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gTcU5HqVU1XgtuJ2Y8sd/OBjaB0pp67CpHcRkiVabVQ=;
 b=gB64nDObnflhiYWCmorzXejtavlnoSRyEOVRiEwy57cxfz26REcTp/IesWHcD8PuKf
 HlkJQ9RhTEAPSleUSIrpn6/pPcrO/79sVLgO3ZxXiotyTtYXJADKwTPoJW7laObn0oGv
 4WSDKaTmRDF1vg7fSCGl241Ov+XB0NifRS2rvJwCd+DrLyF+n/WVmPPBYvk7RZVdmrmt
 eyDunxYOdOpqqLpif6UXvkJIJYlre+yaxXqC+TysdyLZTlNwWBfQTOkpBh0bVf6sBGoN
 J3WvW8mGp/Jq00NDGp4MOfdNnewN3VJKiBW7TMYq16ycC2nrE1ZFsDpTGt7CXpCh84Ju
 BM3g==
X-Gm-Message-State: AAQBX9csAJ1rHwP2mqMUrd2v43q0BY9G7YwJPj+8MvJ6ilz2lKuwQlEH
 MJrUcgEH+DiQU5nzU8LmgZUErQ==
X-Google-Smtp-Source: AKy350b/Jk0ANJeJk/PjVqVDifBtdGw5w7LeSwz7ffhbuz+F0b46AeW5RWBCjEAm9TR4vkjLVX1kKQ==
X-Received: by 2002:adf:edc8:0:b0:2ce:aa69:c9a7 with SMTP id
 v8-20020adfedc8000000b002ceaa69c9a7mr17408891wro.8.1680136396709; 
 Wed, 29 Mar 2023 17:33:16 -0700 (PDT)
Received: from localhost.localdomain (178-133-100-41.mobile.vf-ua.net.
 [178.133.100.41]) by smtp.gmail.com with ESMTPSA id
 n19-20020a7bcbd3000000b003ef684c5e32sm3724480wmi.48.2023.03.29.17.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 17:33:16 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, armbru@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, toke@redhat.com, mprivozn@redhat.com
Cc: yuri.benditovich@daynix.com,
	yan@daynix.com
Subject: [RFC PATCH 3/5] ebpf: Added declaration/initialization routines.
Date: Thu, 30 Mar 2023 03:15:20 +0300
Message-Id: <20230330001522.120774-4-andrew@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230330001522.120774-1-andrew@daynix.com>
References: <20230330001522.120774-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::430;
 envelope-from=andrew@daynix.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 ebpf/ebpf.c      | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 ebpf/ebpf.h      | 25 +++++++++++++++++++++++++
 ebpf/ebpf_rss.c  |  4 ++++
 ebpf/meson.build |  1 +
 4 files changed, 78 insertions(+)
 create mode 100644 ebpf/ebpf.c
 create mode 100644 ebpf/ebpf.h

diff --git a/ebpf/ebpf.c b/ebpf/ebpf.c
new file mode 100644
index 0000000000..86320d72f5
--- /dev/null
+++ b/ebpf/ebpf.c
@@ -0,0 +1,48 @@
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
+#include "ebpf/ebpf.h"
+
+struct ElfBinaryDataEntry {
+    const char *id;
+    const void * (*fn)(size_t *);
+
+    QSLIST_ENTRY(ElfBinaryDataEntry) node;
+};
+
+static QSLIST_HEAD(, ElfBinaryDataEntry) ebpf_elf_obj_list =
+                                            QSLIST_HEAD_INITIALIZER();
+
+void ebpf_register_binary_data(const char *id, const void * (*fn)(size_t *))
+{
+    struct ElfBinaryDataEntry *data = NULL;
+
+    data = g_malloc0(sizeof(*data));
+    data->fn = fn;
+    data->id = id;
+
+    QSLIST_INSERT_HEAD(&ebpf_elf_obj_list, data, node);
+}
+
+const void *ebpf_find_binary_by_id(const char *id, size_t *sz)
+{
+    struct ElfBinaryDataEntry *it = NULL;
+    QSLIST_FOREACH(it, &ebpf_elf_obj_list, node) {
+        if (strcmp(id, it->id) == 0) {
+            return it->fn(sz);
+        }
+    }
+
+    return NULL;
+}
diff --git a/ebpf/ebpf.h b/ebpf/ebpf.h
new file mode 100644
index 0000000000..fd705cb73e
--- /dev/null
+++ b/ebpf/ebpf.h
@@ -0,0 +1,25 @@
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
+void ebpf_register_binary_data(const char *id, const void * (*fn)(size_t *));
+const void *ebpf_find_binary_by_id(const char *id, size_t *sz);
+
+#define ebpf_binary_init(id, fn)                                           \
+static void __attribute__((constructor)) ebpf_binary_init_ ## fn(void)     \
+{                                                                          \
+    ebpf_register_binary_data(id, fn);                                     \
+}
+
+#endif /* EBPF_H */
diff --git a/ebpf/ebpf_rss.c b/ebpf/ebpf_rss.c
index 08015fecb1..b4038725f2 100644
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
index 2dd0fd8948..67c3f53aa9 100644
--- a/ebpf/meson.build
+++ b/ebpf/meson.build
@@ -1 +1,2 @@
+softmmu_ss.add(files('ebpf.c'))
 softmmu_ss.add(when: libbpf, if_true: files('ebpf_rss.c'), if_false: files('ebpf_rss-stub.c'))
-- 
2.39.1


