Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA5B5C0421
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 18:28:50 +0200 (CEST)
Received: from localhost ([::1]:34242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob2af-00031i-9V
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 12:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob2Gq-0003Tr-KJ
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:08:20 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob2Gn-0000cF-Aw
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:08:19 -0400
Received: by mail-wr1-x42b.google.com with SMTP id n15so3755551wrq.5
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 09:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=RolUEI1sAdkeZqLhK3SHKMIX8JiB7vTNvSZnkZrUXOI=;
 b=qqPuTY1HONNMEFZcSifLXE1XlciQMrd/NBjtbKwNHlgcppwqj+dAyZlTjQocwY/YDn
 jwV9hR3/7R4NQEi9243TxuXAsD9RssRDbFDUjp5BXa+ECOv00ARL5TO90pw+H/QFmY1X
 gLLMPZ+vQYJzf4c6FUJnJF7OTCg+2oNU54WoO9mI6gxdmTo5pDgJwYgHp+pfH8gCkphc
 nSn7E5IYcxA2B14xlKOXEdohVV2oSlkWdS7zEX7L0tKgxsBo2vW+Mpm9PC9haGlcJHER
 dEf7eRIwlpbRonNxERl3+MluhjrbJJvviToCYTDG5VwfXt2byr0stv3eOJm2aEDNbt4d
 1ncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=RolUEI1sAdkeZqLhK3SHKMIX8JiB7vTNvSZnkZrUXOI=;
 b=xLGEIL2edv38QXHy0hFcHF14wH1M7Ltu7yLKExPDiUVLjb2HNZHJUaB8CKQLkfIJK1
 L5ra1erPagGAutojL21f1LRQOLtIEnhvO2Ffepr3ySMBTlyzhQ5ULdKxTXmVJwNl6w8q
 dxIGDH68Ty+2L/6qgMlOvlXUDYZnPQ235iNzDU4r9tr0YX9gfqTlkrYthVTumY7po66X
 LhWFyhPOQGs/bClY1QKkNSAZDCZEM21lgzyiSNwsAVtL7gsnMGZm5Dv0Ems3nI282F6d
 Nj13iggef9F10w2cxXhoDTPvq4WSaoQh5mYHu5FmIh4R3BWvdbHcGSePZ/tn/BPx0G3Y
 pcFw==
X-Gm-Message-State: ACrzQf0PuOb7qMZieMq9TTtckygdc6+IPr7HlX9EFrDIZuX7DHGuUaqv
 MRkJviZROeqzV48klLabN/XSSA==
X-Google-Smtp-Source: AMsMyM60dfHJXhQ8o4ZjVF9TEZN9i9EUSqyk/TcmsNevj+8jMg8dMzQKw9Jn9k7D/Y1NjgJSOwOjNA==
X-Received: by 2002:a5d:6d0e:0:b0:22a:7bb2:14ae with SMTP id
 e14-20020a5d6d0e000000b0022a7bb214aemr18660208wrq.379.1663776496241; 
 Wed, 21 Sep 2022 09:08:16 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a5d6790000000b00228dd80d78asm2936092wru.86.2022.09.21.09.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 09:08:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A1E2E1FFBD;
 Wed, 21 Sep 2022 17:08:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH  v1 05/10] plugins: extend execlog to filter matches
Date: Wed, 21 Sep 2022 17:07:56 +0100
Message-Id: <20220921160801.1490125-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220921160801.1490125-1-alex.bennee@linaro.org>
References: <20220921160801.1490125-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Sometimes the whole execlog is just two much so add the ability to
filter by instruction opcode or address.

[AJB: this shows for example

 .qemu-system-aarch64 -display none -serial mon:stdio \
   -M virt -cpu max \
   -semihosting-config enable=on \
   -kernel ./tests/tcg/aarch64-softmmu/memory-sve \
   -plugin ./contrib/plugins/libexeclog.so,ifilter=st1w,afilter=0x40001808 -d plugin -D plugin.out

the st1w SVE instruction is not instrumenting its stores.]

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alexandre Iooss <erdnaxe@crans.org>
Cc: Robert Henry <robhenry@microsoft.com>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
---
 docs/devel/tcg-plugins.rst |  9 +++-
 contrib/plugins/execlog.c  | 96 ++++++++++++++++++++++++++++++++------
 2 files changed, 90 insertions(+), 15 deletions(-)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index a7cc44aa20..a503d44cee 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -346,7 +346,7 @@ The execlog tool traces executed instructions with memory access. It can be used
 for debugging and security analysis purposes.
 Please be aware that this will generate a lot of output.
 
-The plugin takes no argument::
+The plugin needs default argument::
 
   qemu-system-arm $(QEMU_ARGS) \
     -plugin ./contrib/plugins/libexeclog.so -d plugin
@@ -364,6 +364,13 @@ which will output an execution trace following this structure::
   0, 0xd34, 0xf9c8f000, "bl #0x10c8"
   0, 0x10c8, 0xfff96c43, "ldr r3, [r0, #0x44]", load, 0x200000e4, RAM
 
+the output can be filtered to only track certain instructions or
+addresses using the `ifilter` or `afilter` options. You can stack the
+arguments if required::
+
+  qemu-system-arm $(QEMU_ARGS) \
+    -plugin ./contrib/plugins/libexeclog.so,ifilter=st1w,afilter=0x40001808 -d plugin
+
 - contrib/plugins/cache.c
 
 Cache modelling plugin that measures the performance of a given L1 cache
diff --git a/contrib/plugins/execlog.c b/contrib/plugins/execlog.c
index a5275dcc15..e659ac9cbb 100644
--- a/contrib/plugins/execlog.c
+++ b/contrib/plugins/execlog.c
@@ -20,6 +20,9 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
 /* Store last executed instruction on each vCPU as a GString */
 GArray *last_exec;
 
+static GPtrArray *imatches;
+static GArray *amatches;
+
 /**
  * Add memory read or write information to current instruction log
  */
@@ -85,12 +88,13 @@ static void vcpu_insn_exec(unsigned int cpu_index, void *udata)
 static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
 {
     struct qemu_plugin_insn *insn;
-    uint64_t insn_vaddr;
-    uint32_t insn_opcode;
-    char *insn_disas;
+    bool skip = (imatches || amatches) ? true : false;
 
     size_t n = qemu_plugin_tb_n_insns(tb);
     for (size_t i = 0; i < n; i++) {
+        char *insn_disas;
+        uint64_t insn_vaddr;
+
         /*
          * `insn` is shared between translations in QEMU, copy needed data here.
          * `output` is never freed as it might be used multiple times during
@@ -99,20 +103,52 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
          * a limitation for CISC architectures.
          */
         insn = qemu_plugin_tb_get_insn(tb, i);
-        insn_vaddr = qemu_plugin_insn_vaddr(insn);
-        insn_opcode = *((uint32_t *)qemu_plugin_insn_data(insn));
         insn_disas = qemu_plugin_insn_disas(insn);
-        char *output = g_strdup_printf("0x%"PRIx64", 0x%"PRIx32", \"%s\"",
-                                       insn_vaddr, insn_opcode, insn_disas);
+        insn_vaddr = qemu_plugin_insn_vaddr(insn);
+
+        /*
+         * If we are filtering we better check out if we have any
+         * hits. The skip "latches" so we can track memory accesses
+         * after the instruction we care about.
+         */
+        if (skip && imatches) {
+            int j;
+            for (j = 0; j < imatches->len && skip; j++) {
+                char *m = g_ptr_array_index(imatches, j);
+                if (g_str_has_prefix(insn_disas, m)) {
+                    skip = false;
+                }
+            }
+        }
+
+        if (skip && amatches) {
+            int j;
+            for (j = 0; j < amatches->len && skip; j++) {
+                uint64_t v = g_array_index(amatches, uint64_t, j);
+                if (v == insn_vaddr) {
+                    skip = false;
+                }
+            }
+        }
 
-        /* Register callback on memory read or write */
-        qemu_plugin_register_vcpu_mem_cb(insn, vcpu_mem,
-                                         QEMU_PLUGIN_CB_NO_REGS,
-                                         QEMU_PLUGIN_MEM_RW, NULL);
+        if (skip) {
+            g_free(insn_disas);
+        } else {
+            uint32_t insn_opcode;
+            insn_opcode = *((uint32_t *)qemu_plugin_insn_data(insn));
+            char *output = g_strdup_printf("0x%"PRIx64", 0x%"PRIx32", \"%s\"",
+                                           insn_vaddr, insn_opcode, insn_disas);
+
+            /* Register callback on memory read or write */
+            qemu_plugin_register_vcpu_mem_cb(insn, vcpu_mem,
+                                             QEMU_PLUGIN_CB_NO_REGS,
+                                             QEMU_PLUGIN_MEM_RW, NULL);
+
+            /* Register callback on instruction */
+            qemu_plugin_register_vcpu_insn_exec_cb(insn, vcpu_insn_exec,
+                                                   QEMU_PLUGIN_CB_NO_REGS, output);
+        }
 
-        /* Register callback on instruction */
-        qemu_plugin_register_vcpu_insn_exec_cb(insn, vcpu_insn_exec,
-                                               QEMU_PLUGIN_CB_NO_REGS, output);
     }
 }
 
@@ -132,6 +168,25 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
     }
 }
 
+/* Add a match to the array of matches */
+static void parse_insn_match(char *match)
+{
+    if (!imatches) {
+        imatches = g_ptr_array_new();
+    }
+    g_ptr_array_add(imatches, match);
+}
+
+static void parse_vaddr_match(char *match)
+{
+    uint64_t v = g_ascii_strtoull(match, NULL, 16);
+
+    if (!amatches) {
+        amatches = g_array_new(false, true, sizeof(uint64_t));
+    }
+    g_array_append_val(amatches, v);
+}
+
 /**
  * Install the plugin
  */
@@ -145,6 +200,19 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
      */
     last_exec = g_array_new(FALSE, FALSE, sizeof(GString *));
 
+    for (int i = 0; i < argc; i++) {
+        char *opt = argv[i];
+        g_autofree char **tokens = g_strsplit(opt, "=", 2);
+        if (g_strcmp0(tokens[0], "ifilter") == 0) {
+            parse_insn_match(tokens[1]);
+        } else if (g_strcmp0(tokens[0], "afilter") == 0) {
+            parse_vaddr_match(tokens[1]);
+        } else {
+            fprintf(stderr, "option parsing failed: %s\n", opt);
+            return -1;
+        }
+    }
+
     /* Register translation block and exit callbacks */
     qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
     qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
-- 
2.34.1


