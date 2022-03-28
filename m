Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8124E9B18
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 17:28:40 +0200 (CEST)
Received: from localhost ([::1]:49162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYrIM-0002x7-Kc
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 11:28:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nYrGB-0001AZ-30
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 11:26:23 -0400
Received: from [2a00:1450:4864:20::42e] (port=36421
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nYrG9-0001Zh-6e
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 11:26:22 -0400
Received: by mail-wr1-x42e.google.com with SMTP id u3so20956795wrg.3
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 08:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pBymOyMO/SSZAGGx1Pb+hhWQVZJ3zv96epfxxyIA1f8=;
 b=PIKcJefzj3XBteOn+U+RFOhN5tOac/ABahktH9M3nd+prY3I7NraKALPpXDQYqDAXL
 n3z83rUMUg3GgiO9Q6nFyn4hlwE49YuT+uTm5qDuJ1gkM8bvW+2t8BCNonG/6peba7rl
 9KCUBzBtkzWcNIoVlnbzDHbSWA9pb2buA7sZ4aawes1IsWocBGCd611U83WpybUXu/jB
 zaxlJhu8dHPwVJE5/O39+7klXD2u5XnOsR8uaKTjxHx8fXp8VDDdDcbNsn5Hw5Edd56F
 Qfo+PwmtFb+VasuQTyqEYA3PLOpu1VkX2xgdAYsTXMRVI4koUT1gNjjzq8hOjYmzmOiX
 SWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pBymOyMO/SSZAGGx1Pb+hhWQVZJ3zv96epfxxyIA1f8=;
 b=WD87QjIpl9C8zRjVh1osYQ3zTymrUIcphgcSBVYd1gqOf7UJ7c1YJ2Fa2gdrjGqIh5
 AheK7w0KSO9SRTNCnLijr6Ev8B5N/SPS0FVsi5DzEjm5TZ+7wjdUb5+h8tWqNvR3qEUb
 qs4LEgU90RZS1mmLsiIsifoUuaQJ3rO2BsyMV5Z/ivKePdJlVEZWRBIhEYr/HzTKh4h4
 Ch10tLTyTXBWgISYPxUPEwBTh3gA27umZZ3uhqWZUJI+455PHplZBVS5Ieh5H5uRmdMB
 caGGMuPPSkhcbmn3jBJ1rfbxvIbKqNVb5xceMO2sMI8Wt+aGCaWMXq2831SS0gDSU5vZ
 Dacg==
X-Gm-Message-State: AOAM533LDj6tfQ8aBxxu7JhThlmS0U9udFUNsGWdYMmXQ6lqXyvpI8gv
 r7ZEAFZXqky5dyEnJVvvSN0RbQ==
X-Google-Smtp-Source: ABdhPJzoWNp22+VSopp61J/vH3rysW+M8C3mUzhHDo8fp7gApsJBPb220lQu5z+fNcNUkpC74dwP1w==
X-Received: by 2002:a5d:4812:0:b0:205:c541:3e92 with SMTP id
 l18-20020a5d4812000000b00205c5413e92mr5278127wrq.485.1648481177569; 
 Mon, 28 Mar 2022 08:26:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a5d5988000000b00203d5f1f3e4sm13722573wri.105.2022.03.28.08.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 08:26:15 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AF6321FFBA;
 Mon, 28 Mar 2022 16:26:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 2/2] plugins: extend execlog to filter matches
Date: Mon, 28 Mar 2022 16:26:14 +0100
Message-Id: <20220328152614.2452259-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220328152614.2452259-1-alex.bennee@linaro.org>
References: <20220328152614.2452259-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: aaron@os.amperecomputing.com, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Luke.Craig@ll.mit.edu, Alexandre Iooss <erdnaxe@crans.org>,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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
2.30.2


