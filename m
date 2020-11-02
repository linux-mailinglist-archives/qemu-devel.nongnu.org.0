Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F36822A32F1
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 19:26:44 +0100 (CET)
Received: from localhost ([::1]:60926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZeXU-0001Dg-1S
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 13:26:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kZeR7-0001fn-JC
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 13:20:09 -0500
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:42017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kZeQu-0006hs-8u
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 13:20:09 -0500
Received: by mail-lf1-x141.google.com with SMTP id a7so18628526lfk.9
 for <qemu-devel@nongnu.org>; Mon, 02 Nov 2020 10:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3+YyHTEOmoDlnxZwQCww4YXw4Lozy8Eon7UHJCT2EzM=;
 b=NSz4/piZs7R5rtGK6iEwyUNc2Se7teWjllHhJvvkPZoOcbmA1wXHbX8aN2cxtWUqcT
 qSzXv0aH4cnfCjNf/JI74QcPE1eFrgi/B2KnjYvYMrnQh0Ybe0wj/BafbVvFvVxfR7YT
 5ISxA4W/SeGiTYUwgv5EVCT4SsV6oon0IY1KQV39VHEaJt1/441oXOHu8bNmY3WO0twS
 19GJx/VLt8aQWbaY0DbBw/KbICx04T0cozFXck2ddd3zaW0cpsVxvGB5A2p+nsdajEuE
 i3/nh3qVB0waw+tbWMcP455OjYidGMJzflvTzM9u5aQUuUuuILPGjBA5wuKZ7x5yvkOs
 /zxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3+YyHTEOmoDlnxZwQCww4YXw4Lozy8Eon7UHJCT2EzM=;
 b=YeWMDN9ZYukJ/WsAO8ur6KQTa+1ostZ9p8H1AMxdSXdQtRqplANLhYawcVUDgGpvsf
 MwERQXlu4HEfLOKyiwjOpgm1UZDrpAQJ6ypIhLGOHY1QS2bOMojfC7BSDCgMo4UkpuDn
 0OzT7HU0rr0umplxJL4u3kwZtALzwg6njKDL9zNG32PORLcaxo0qAtfLIQkc7wKtDrJq
 mRz5bLQeJJysB1Iox+qrKHsUgjtE93rJdO03utcMoW337AEZkkublykyxtfuhVUBZKkw
 7/MTlhSJz512h3FJjFiMeOr+ojBXewaLVkpjELF1dUIvezGCxYLA53tLZFJbX7hOk+1r
 Ap3g==
X-Gm-Message-State: AOAM531xhdUsbI0tk0TFfJqY0OvivrLKjJaSyE7ZM8xUmCqoLtEp0csU
 Sa54/6+HIPnpiKelvabNfxna7w==
X-Google-Smtp-Source: ABdhPJyRiaXqfwvJsq1jD9Ly3RknIiCLSt5abf9+ZSuAhO20/Ls5tn9ghUt3xXlBm+Il3nKjaUMYOw==
X-Received: by 2002:ac2:47fc:: with SMTP id b28mr5969722lfp.454.1604341193176; 
 Mon, 02 Nov 2020 10:19:53 -0800 (PST)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id c6sm2527007lfm.226.2020.11.02.10.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 10:19:52 -0800 (PST)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH 2/6] ebpf: Added basic eBPF API.
Date: Mon,  2 Nov 2020 20:51:12 +0200
Message-Id: <20201102185115.7425-3-andrew@daynix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201102185115.7425-1-andrew@daynix.com>
References: <20201102185115.7425-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::141;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: yan@daynix.com, yuri.benditovich@daynix.com, Andrew <andrew@daynix.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew <andrew@daynix.com>

Added basic functions for creating eBPF maps and loading programs.
Also added helper function to 'fix' eBPF map descriptors in programs.
During runtime, different values of eBPF map file descriptors created,
and it required to place them into eBPF instructions for proper work.
It's similar to ELF's relocation table section routine.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 ebpf/ebpf.c       | 107 ++++++++++++++++++++++++++++++++++++++++++++++
 ebpf/ebpf.h       |  35 +++++++++++++++
 ebpf/trace-events |   4 ++
 ebpf/trace.h      |   2 +
 4 files changed, 148 insertions(+)
 create mode 100644 ebpf/ebpf.c
 create mode 100644 ebpf/ebpf.h
 create mode 100644 ebpf/trace-events
 create mode 100644 ebpf/trace.h

diff --git a/ebpf/ebpf.c b/ebpf/ebpf.c
new file mode 100644
index 0000000000..cec35a484c
--- /dev/null
+++ b/ebpf/ebpf.c
@@ -0,0 +1,107 @@
+#include "ebpf/ebpf.h"
+#include <sys/syscall.h>
+#include "trace.h"
+
+#define ptr_to_u64(x) ((uint64_t)(uintptr_t)x)
+
+static inline int ebpf(enum bpf_cmd cmd, union bpf_attr *attr,
+        unsigned int size)
+{
+    int ret = syscall(__NR_bpf, cmd, attr, size);
+    if (ret < 0) {
+        trace_ebpf_error("eBPF syscall error", strerror(errno));
+    }
+
+    return ret;
+}
+
+int bpf_create_map(enum bpf_map_type map_type,
+                   unsigned int key_size,
+                   unsigned int value_size,
+                   unsigned int max_entries)
+{
+    union bpf_attr attr = {
+            .map_type    = map_type,
+            .key_size    = key_size,
+            .value_size  = value_size,
+            .max_entries = max_entries
+    };
+
+    return ebpf(BPF_MAP_CREATE, &attr, sizeof(attr));
+}
+
+int bpf_lookup_elem(int fd, const void *key, void *value)
+{
+    union bpf_attr attr = {
+            .map_fd = (uint32_t)fd,
+            .key    = ptr_to_u64(key),
+            .value  = ptr_to_u64(value),
+    };
+
+    return ebpf(BPF_MAP_LOOKUP_ELEM, &attr, sizeof(attr));
+}
+
+int bpf_update_elem(int fd, const void *key, const void *value,
+                    uint64_t flags)
+{
+    union bpf_attr attr = {
+            .map_fd = (uint32_t)fd,
+            .key    = ptr_to_u64(key),
+            .value  = ptr_to_u64(value),
+            .flags  = flags,
+    };
+
+    return ebpf(BPF_MAP_UPDATE_ELEM, &attr, sizeof(attr));
+}
+
+int bpf_delete_elem(int fd, const void *key)
+{
+    union bpf_attr attr = {
+            .map_fd = (uint32_t)fd,
+            .key    = ptr_to_u64(key),
+    };
+
+    return ebpf(BPF_MAP_DELETE_ELEM, &attr, sizeof(attr));
+}
+
+#define BPF_LOG_BUF_SIZE (UINT32_MAX >> 8)
+static char bpf_log_buf[BPF_LOG_BUF_SIZE] = {};
+
+int bpf_prog_load(enum bpf_prog_type type,
+                  const struct bpf_insn *insns, int insn_cnt,
+                  const char *license)
+{
+    int ret = 0;
+    union bpf_attr attr = {};
+    attr.prog_type = type;
+    attr.insns     = ptr_to_u64(insns);
+    attr.insn_cnt  = (uint32_t)insn_cnt;
+    attr.license   = ptr_to_u64(license);
+    attr.log_buf   = ptr_to_u64(bpf_log_buf);
+    attr.log_size  = BPF_LOG_BUF_SIZE;
+    attr.log_level = 1;
+
+    ret = ebpf(BPF_PROG_LOAD, &attr, sizeof(attr));
+    if (ret < 0) {
+        trace_ebpf_error("eBPF program load error:", bpf_log_buf);
+    }
+
+    return ret;
+}
+
+unsigned int bpf_fixup_mapfd(struct fixup_mapfd_t *table,
+                             size_t table_size, struct bpf_insn *insn,
+                             size_t insn_len, const char *map_name, int fd) {
+    unsigned int ret = 0;
+    int i = 0;
+
+    for (; i < table_size; ++i) {
+        if (strcmp(table[i].map_name, map_name) == 0) {
+            insn[table[i].instruction_num].src_reg = 1;
+            insn[table[i].instruction_num].imm = fd;
+            ++ret;
+        }
+    }
+
+    return ret;
+}
diff --git a/ebpf/ebpf.h b/ebpf/ebpf.h
new file mode 100644
index 0000000000..511ad0a06f
--- /dev/null
+++ b/ebpf/ebpf.h
@@ -0,0 +1,35 @@
+#ifndef QEMU_EBPF_H
+#define QEMU_EBPF_H
+
+#include "qemu/osdep.h"
+
+#ifdef CONFIG_EBPF
+#include <linux/bpf.h>
+
+int bpf_create_map(enum bpf_map_type map_type,
+                   unsigned int key_size,
+                   unsigned int value_size,
+                   unsigned int max_entries);
+
+int bpf_lookup_elem(int fd, const void *key, void *value);
+
+int bpf_update_elem(int fd, const void *key, const void *value,
+                    uint64_t flags);
+
+int bpf_delete_elem(int fd, const void *key);
+
+int bpf_prog_load(enum bpf_prog_type type,
+                  const struct bpf_insn *insns, int insn_cnt,
+                  const char *license);
+
+struct fixup_mapfd_t {
+    const char *map_name;
+    size_t instruction_num;
+};
+
+unsigned int bpf_fixup_mapfd(struct fixup_mapfd_t *table,
+                             size_t table_size, struct bpf_insn *insn,
+                             size_t insn_len, const char *map_name, int fd);
+
+#endif /* CONFIG_EBPF */
+#endif /* QEMU_EBPF_H */
diff --git a/ebpf/trace-events b/ebpf/trace-events
new file mode 100644
index 0000000000..3c189516e3
--- /dev/null
+++ b/ebpf/trace-events
@@ -0,0 +1,4 @@
+# See docs/devel/tracing.txt for syntax documentation.
+
+# ebpf.c
+ebpf_error(const char *s1, const char *s2) "error in %s: %s"
diff --git a/ebpf/trace.h b/ebpf/trace.h
new file mode 100644
index 0000000000..ad570e6691
--- /dev/null
+++ b/ebpf/trace.h
@@ -0,0 +1,2 @@
+#include "trace/trace-ebpf.h"
+
-- 
2.28.0


