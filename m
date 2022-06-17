Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 767F654F282
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 10:08:37 +0200 (CEST)
Received: from localhost ([::1]:38460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o271q-0002KT-IS
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 04:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o26lF-00059X-IN
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 03:51:21 -0400
Received: from mga06b.intel.com ([134.134.136.31]:28798 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o26lD-000779-Hj
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 03:51:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655452279; x=1686988279;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=urlV7c37WJynsUdaqFjV/mT7ZEVNkHueLzfaaSMF5sM=;
 b=NYPYphGRjgs0lBtf+upaDKQfmj6gdissxHWsXACZ0XT+Zd7tC1ifq4T4
 kRRPiRr94VN4YaN7aXfcm8vpXm4IVT1Jrp2hdBMzLGn4ShW94NnOu/1Sq
 7UmQIUhknCL/TtOcNNqkn01uu6OMzhsLWE2cupR8npkyxiqQq/cVULz4j
 xE/MjlecxioyDZmiMNFb/dHOol4m8BwuIzHOI8YZjKRbLzkyW5GFvxEAX
 OqZ/Aux/eYDw9jBFgLmsOG991RJ6K8E7G6uOQnlxc1c4iGQw9h605oJYK
 D2Yme1o+yVICRLvlHV+/fah9uaYddSEDpr2tIDRbZyym5kFGLSCISVduy g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="341102147"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="341102147"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 00:51:18 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="641936707"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 00:51:16 -0700
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
Subject: [RFC PATCH 05/12] ebpf/uBPF: Add qemu_prepare_ubpf to load ebpf binary
Date: Fri, 17 Jun 2022 15:36:23 +0800
Message-Id: <20220617073630.535914-6-chen.zhang@intel.com>
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

The qemu_prepare_ubpf() can load user defined userspace ebpf binary
file to Qemu userspace ebpf VM but not run it. The ebpf program
will triggered in the hook point.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 ebpf/ubpf-stub.c |   5 +++
 ebpf/ubpf.c      | 100 +++++++++++++++++++++++++++++++++++++++++++++++
 ebpf/ubpf.h      |   1 +
 3 files changed, 106 insertions(+)

diff --git a/ebpf/ubpf-stub.c b/ebpf/ubpf-stub.c
index 2e8bf15b91..885bd954b7 100644
--- a/ebpf/ubpf-stub.c
+++ b/ebpf/ubpf-stub.c
@@ -22,3 +22,8 @@ bool qemu_ubpf_read_target(UbpfState *u_ebpf, char *path)
 }
 
 void qemu_ubpf_init_jit(UbpfState *u_ebpf, bool jit) {}
+
+int qemu_ubpf_prepare(UbpfState *u_ebpf, char *code_path)
+{
+    return 0;
+}
diff --git a/ebpf/ubpf.c b/ebpf/ubpf.c
index 38a6530903..d65fffeda3 100644
--- a/ebpf/ubpf.c
+++ b/ebpf/ubpf.c
@@ -99,3 +99,103 @@ void qemu_ubpf_init_jit(UbpfState *u_ebpf, bool jit)
 {
     u_ebpf->jit = jit;
 }
+
+static uint64_t gather_bytes(uint8_t a, uint8_t b, uint8_t c,
+                             uint8_t d, uint8_t e)
+{
+    return ((uint64_t)a << 32) |
+           ((uint32_t)b << 24) |
+           ((uint32_t)c << 16) |
+           ((uint16_t)d << 8) |
+           e;
+}
+
+static void trash_registers(void)
+{
+    /* Overwrite all caller-save registers */
+    asm(
+        "mov $0xf0, %rax;"
+        "mov $0xf1, %rcx;"
+        "mov $0xf2, %rdx;"
+        "mov $0xf3, %rsi;"
+        "mov $0xf4, %rdi;"
+        "mov $0xf5, %r8;"
+        "mov $0xf6, %r9;"
+        "mov $0xf7, %r10;"
+        "mov $0xf8, %r11;"
+    );
+}
+
+static uint32_t sqrti(uint32_t x)
+{
+    return sqrt(x);
+}
+
+static uint64_t unwind(uint64_t i)
+{
+    return i;
+}
+
+static void register_functions(struct ubpf_vm *vm)
+{
+    ubpf_register(vm, 0, "gather_bytes", gather_bytes);
+    ubpf_register(vm, 1, "memfrob", memfrob);
+    ubpf_register(vm, 2, "trash_registers", trash_registers);
+    ubpf_register(vm, 3, "sqrti", sqrti);
+    ubpf_register(vm, 4, "strcmp_ext", strcmp);
+    ubpf_register(vm, 5, "unwind", unwind);
+    ubpf_set_unwind_function_index(vm, 5);
+}
+
+int qemu_ubpf_prepare(UbpfState *u_ebpf, char *code_path)
+{
+    bool is_elf;
+    char *errmsg;
+    int ret;
+
+    if (!qemu_ubpf_read_code(u_ebpf, code_path)) {
+        error_report("Ubpf failed to read code");
+        return -1;
+    }
+
+    u_ebpf->vm = ubpf_create();
+    if (!u_ebpf->vm) {
+        error_report("Failed to create ubpf VM");
+        return -1;
+    }
+
+    register_functions(u_ebpf->vm);
+
+    /*
+     * The ELF magic corresponds to an RSH instruction with an offset,
+     * which is invalid.
+     */
+     is_elf = u_ebpf->code_len >= SELFMAG && !memcmp(u_ebpf->code,
+                                                     ELFMAG, SELFMAG);
+
+    if (is_elf) {
+        ret = ubpf_load_elf(u_ebpf->vm, u_ebpf->code,
+                            u_ebpf->code_len, &errmsg);
+    } else {
+        ret = ubpf_load(u_ebpf->vm, u_ebpf->code,
+                        u_ebpf->code_len, &errmsg);
+    }
+
+    if (ret < 0) {
+        error_report("Failed to load ubpf code: %s ", errmsg);
+        free(errmsg);
+        ubpf_destroy(u_ebpf->vm);
+        return -1;
+    }
+
+    if (u_ebpf->jit) {
+        u_ebpf->fn = ubpf_compile(u_ebpf->vm, &errmsg);
+        if (u_ebpf->fn == NULL) {
+            error_report("Failed to ubpf compile: %s", errmsg);
+            free(errmsg);
+            return -1;
+        }
+    }
+
+    return 0;
+}
diff --git a/ebpf/ubpf.h b/ebpf/ubpf.h
index 808c02565c..9a35efbeb6 100644
--- a/ebpf/ubpf.h
+++ b/ebpf/ubpf.h
@@ -37,5 +37,6 @@ typedef struct UbpfState {
 bool qemu_ubpf_read_code(UbpfState *u_ebpf, char *path);
 bool qemu_ubpf_read_target(UbpfState *u_ebpf, char *path);
 void qemu_ubpf_init_jit(UbpfState *u_ebpf, bool jit);
+int qemu_ubpf_prepare(UbpfState *u_ebpf, char *code_path);
 
 #endif /* QEMU_UBPF_H */
-- 
2.25.1


