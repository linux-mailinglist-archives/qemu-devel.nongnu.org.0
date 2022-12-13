Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A35364BEAB
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:43:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5D0x-0001eF-KE; Tue, 13 Dec 2022 16:40:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1p5D0G-0001Q0-P9
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:39:58 -0500
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1p5D0E-00087R-Cf
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:39:56 -0500
Received: from panda194.. ([18.4.85.108]) (authenticated bits=0)
 (User authenticated as fasano@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 2BDLcaPF030603
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 16:39:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1670967587; bh=04+GIoDwHme3ZeKgdIBJSxOVCToSjQdjHcp9Buqf1fc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=S6IJkfjOwyTaB2Y8cKNJCEvhuT/6Ag7jo8rFbDLcRnI9JIcNAPaoUgz4++yWQaPEu
 ZixCixEvW5hzYONvHgC7NQFdHJQNiqT6BYF0pCv+03LzYUOMYej3nspi2dbnj8wpzx
 WYswxo9U882dXEoqd+lL6ar7DRHoTbw+dsRVWPQWcN+TR8i1Rna5h89wunLiVlPO/i
 KfpNzl83Ul121/PRjWIH6vdn19824Q9k6nDKvIcFSJSoAfPHhlbi3K80OJrwNRbaG1
 PwUGPvjR5hapE0Z8cX0Yqd8jUXu+kU+nyF+mcKldrKOei+uMaC3breY8c8k+b5/ZfC
 uofFO0V+WAAgw==
From: Andrew Fasano <fasano@mit.edu>
To: qemu-devel@nongnu.org
Cc: elysia.witham@ll.mit.edu, alex.bennee@linaro.org, erdnaxe@crans.org,
 ma.mandourr@gmail.com, Andrew Fasano <fasano@mit.edu>
Subject: [PATCH 8/8] tests: build and run QPP tests
Date: Tue, 13 Dec 2022 16:37:57 -0500
Message-Id: <20221213213757.4123265-9-fasano@mit.edu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213213757.4123265-1-fasano@mit.edu>
References: <20221213213757.4123265-1-fasano@mit.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=18.9.28.11; envelope-from=fasano@mit.edu;
 helo=outgoing.mit.edu
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Elysia Witham <elysia.witham@ll.mit.edu>

These test plugins demonstrate the QPP API changes by exporting
and importing functions and creating and registering callbacks.
These tests are integrated into the `make check-tcg` tests.

Signed-off-by: Elysia Witham <elysia.witham@ll.mit.edu>
Signed-off-by: Andrew Fasano <fasano@mit.edu>
---
 tests/Makefile.include                    |  2 +-
 tests/meson.build                         |  1 +
 tests/plugin_qpp/meson.build              |  7 +++++
 tests/plugin_qpp/qpp_client.c             | 32 ++++++++++++++++++++
 tests/plugin_qpp/qpp_srv.c                | 37 +++++++++++++++++++++++
 tests/plugin_qpp/qpp_srv.h                | 12 ++++++++
 tests/tcg/Makefile.target                 | 29 ++++++++++++++++++
 tests/tcg/aarch64/Makefile.softmmu-target |  2 ++
 tests/tcg/arm/Makefile.softmmu-target     |  1 +
 tests/tcg/arm/Makefile.target             |  2 ++
 tests/tcg/multiarch/Makefile.target       |  2 ++
 11 files changed, 126 insertions(+), 1 deletion(-)
 create mode 100644 tests/plugin_qpp/meson.build
 create mode 100644 tests/plugin_qpp/qpp_client.c
 create mode 100644 tests/plugin_qpp/qpp_srv.c
 create mode 100644 tests/plugin_qpp/qpp_srv.h

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 9422ddaece..08dd667aad 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -73,7 +73,7 @@ $(TCG_TESTS_TARGETS:%=distclean-tcg-tests-%): distclean-tcg-tests-%:
 build-tcg: $(BUILD_TCG_TARGET_RULES)
 
 .PHONY: check-tcg
-.ninja-goals.check-tcg = all $(if $(CONFIG_PLUGIN),test-plugins)
+.ninja-goals.check-tcg = all $(if $(CONFIG_PLUGIN),test-plugins test-plugins-qpp)
 check-tcg: $(RUN_TCG_TARGET_RULES)
 
 .PHONY: clean-tcg
diff --git a/tests/meson.build b/tests/meson.build
index 8e318ec513..12d3ec9c4b 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -86,6 +86,7 @@ endif
 if get_option('tcg').allowed()
   if 'CONFIG_PLUGIN' in config_host
     subdir('plugin')
+    subdir('plugin_qpp')
   endif
 endif
 
diff --git a/tests/plugin_qpp/meson.build b/tests/plugin_qpp/meson.build
new file mode 100644
index 0000000000..25555d0ec2
--- /dev/null
+++ b/tests/plugin_qpp/meson.build
@@ -0,0 +1,7 @@
+t = []
+foreach i : ['qpp_srv', 'qpp_client']
+  t += shared_module(i, files(i + '.c'),
+                     include_directories: '../../include/qemu',
+                     dependencies: glib)
+endforeach
+alias_target('test-plugins-qpp', t)
diff --git a/tests/plugin_qpp/qpp_client.c b/tests/plugin_qpp/qpp_client.c
new file mode 100644
index 0000000000..69b7cc4ac5
--- /dev/null
+++ b/tests/plugin_qpp/qpp_client.c
@@ -0,0 +1,32 @@
+#include <stdio.h>
+#include <qemu-plugin.h>
+#include <plugin-qpp.h>
+#include <glib.h>
+
+QEMU_PLUGIN_EXPORT const char *qemu_plugin_name = "qpp_client";
+QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
+QEMU_PLUGIN_EXPORT const char *qemu_plugin_uses[] = {"qpp_srv", NULL};
+
+#include "qpp_srv.h"
+
+void my_cb_exit_callback(gpointer evdata, gpointer udata);
+
+QEMU_PLUGIN_EXPORT void my_cb_exit_callback(gpointer evdata, gpointer udata)
+{
+    *(bool *)evdata = true;
+    qemu_plugin_outs("called my on exit callback\n");
+}
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
+                   const qemu_info_t *info, int argc, char **argv) {
+
+    g_autoptr(GString) report = g_string_new("QPP client: Call "
+                                             "qpp_srv's do_add(0) do_sub(3) => ");
+    g_string_append_printf(report, "%d %d\n", qpp_srv_do_add_qpp(0),
+                           qpp_srv_do_sub_qpp(3));
+    qemu_plugin_outs(report->str);
+    qemu_plugin_reg_callback("qpp_srv", "my_on_exit", &my_cb_exit_callback);
+
+    return 0;
+}
+
diff --git a/tests/plugin_qpp/qpp_srv.c b/tests/plugin_qpp/qpp_srv.c
new file mode 100644
index 0000000000..88b1907a7e
--- /dev/null
+++ b/tests/plugin_qpp/qpp_srv.c
@@ -0,0 +1,37 @@
+#include <stdio.h>
+#include <qemu-plugin.h>
+#include <plugin-qpp.h>
+#include <gmodule.h>
+#include <assert.h>
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
+QEMU_PLUGIN_EXPORT const char *qemu_plugin_name = "qpp_srv";
+#include "qpp_srv.h"
+
+static void plugin_exit(qemu_plugin_id_t id, void *p)
+{
+  qemu_plugin_outs("QPP srv: exit triggered, running all registered"
+                  " QPP callbacks\n");
+  bool called = false;
+  qemu_plugin_run_callback(id, "my_on_exit", &called, NULL);
+  assert(called);
+}
+
+QEMU_PLUGIN_EXPORT int qpp_srv_do_add(int x)
+{
+  return x + 1;
+}
+
+QEMU_PLUGIN_EXPORT int qpp_srv_do_sub(int x)
+{
+  return x - 1;
+}
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
+                   const qemu_info_t *info, int argc, char **argv) {
+    qemu_plugin_outs("qpp_srv loaded\n");
+    qemu_plugin_create_callback(id, "my_on_exit");
+    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
+
+    return 0;
+}
diff --git a/tests/plugin_qpp/qpp_srv.h b/tests/plugin_qpp/qpp_srv.h
new file mode 100644
index 0000000000..16d9bc2df4
--- /dev/null
+++ b/tests/plugin_qpp/qpp_srv.h
@@ -0,0 +1,12 @@
+#ifndef QPP_SRV_H
+#define QPP_SRV_H
+
+
+/*
+ * Prototypes for the do_add and do_sub functions. Both return an int and
+ * take an int as an argument.
+ */
+QPP_FUN_PROTOTYPE(qpp_srv, int, qpp_srv_do_add, int);
+QPP_FUN_PROTOTYPE(qpp_srv, int, qpp_srv_do_sub, int);
+
+#endif /* QPP_SRV_H */
diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 75257f2b29..c478f1b2de 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -145,6 +145,9 @@ RUN_TESTS=$(patsubst %,run-%, $(TESTS))
 ifeq ($(CONFIG_PLUGIN),y)
 PLUGIN_SRC=$(SRC_PATH)/tests/plugin
 PLUGIN_LIB=../../plugin
+
+PLUGIN_LIB_QPP=../../plugin_qpp
+
 VPATH+=$(PLUGIN_LIB)
 PLUGINS=$(patsubst %.c, lib%.so, $(notdir $(wildcard $(PLUGIN_SRC)/*.c)))
 
@@ -156,6 +159,11 @@ $(foreach p,$(PLUGINS), \
 	$(foreach t,$(TESTS),\
 		$(eval run-plugin-$(t)-with-$(p): $t $p) \
 		$(eval RUN_TESTS+=run-plugin-$(t)-with-$(p))))
+
+$(foreach t,$(TESTS),\
+	$(eval run-plugin-qpp-$(t): $t) \
+	$(eval RUN_TESTS+=run-plugin-qpp-$(t)))
+
 endif
 
 strip-plugin = $(wordlist 1, 1, $(subst -with-, ,$1))
@@ -167,18 +175,39 @@ ifeq ($(filter %-softmmu, $(TARGET)),)
 run-%: %
 	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<)
 
+run-plugin-qpp-%:
+	$(call run-test, $@, \
+	  $(QEMU) \
+			-plugin $(PLUGIN_LIB_QPP)/libqpp_srv.so \
+			-plugin $(PLUGIN_LIB_QPP)/libqpp_client.so \
+			$(call extract-plugin,$@) \
+			-d plugin -D $*.pout \
+		$(QEMU_OPTS) $<)
+
 run-plugin-%:
 	$(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
 		-plugin $(PLUGIN_LIB)/$(call extract-plugin,$@) \
 		-d plugin -D $*.pout \
 		 $(call strip-plugin,$<))
+
 else
+
 run-%: %
 	$(call run-test, $<, \
 	  $(QEMU) -monitor none -display none \
 		  -chardev file$(COMMA)path=$<.out$(COMMA)id=output \
 		  $(QEMU_OPTS) $<)
 
+run-plugin-qpp-%:
+	$(call run-test, $@, \
+	  $(QEMU) -monitor none -display none \
+		-chardev file$(COMMA)path=$@.out$(COMMA)id=output \
+			-plugin $(PLUGIN_LIB_QPP)/libqpp_srv.so \
+			-plugin $(PLUGIN_LIB_QPP)/libqpp_client.so \
+			$(call extract-plugin,$@) \
+				-d plugin -D $*.pout \
+		$(QEMU_OPTS) $<)
+
 run-plugin-%:
 	$(call run-test, $@, \
 	  $(QEMU) -monitor none -display none \
diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index a1368905f5..f87a1a799b 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -45,6 +45,8 @@ QEMU_SEMIHOST=-chardev stdio,mux=on,id=stdio0 -semihosting-config enable=on,char
 run-semiconsole: QEMU_OPTS=$(QEMU_BASE_MACHINE) $(QEMU_SEMIHOST)  -kernel
 run-semiconsole: semiconsole
 	$(call skip-test, $<, "MANUAL ONLY")
+run-plugin-qpp-semiconsole: semiconsole
+	$(call skip-test, $<, "MANUAL ONLY")
 run-plugin-semiconsole-with-%: semiconsole
 	$(call skip-test, $<, "MANUAL ONLY")
 
diff --git a/tests/tcg/arm/Makefile.softmmu-target b/tests/tcg/arm/Makefile.softmmu-target
index 7df88ddea8..f4bfab41bf 100644
--- a/tests/tcg/arm/Makefile.softmmu-target
+++ b/tests/tcg/arm/Makefile.softmmu-target
@@ -24,3 +24,4 @@ test-armv6m-undef: EXTRA_CFLAGS+=-mcpu=cortex-m0 -mfloat-abi=soft
 
 run-test-armv6m-undef: QEMU_OPTS+=-semihosting -M microbit -kernel
 run-plugin-test-armv6m-undef-%: QEMU_OPTS+=-semihosting -M microbit -kernel
+run-plugin-qpp-test-armv6m-undef: QEMU_OPTS+=-semihosting -M microbit -kernel
diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index b3b1504a1c..2aa3479952 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -62,6 +62,8 @@ semiconsole-arm: semihosting.c
 run-semiconsole-arm: semiconsole-arm
 	$(call skip-test, $<, "MANUAL ONLY")
 
+run-plugin-qpp-semiconsole-arm:
+	$(call skip-test, $<, "MANUAL ONLY")
 run-plugin-semiconsole-arm-with-%:
 	$(call skip-test, $<, "MANUAL ONLY")
 
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 5f0fee1aad..a77b30aa94 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -108,6 +108,8 @@ semiconsole: CFLAGS+=-I$(SRC_PATH)/tests/tcg/$(TARGET_NAME)
 run-semiconsole: semiconsole
 	$(call skip-test, $<, "MANUAL ONLY")
 
+run-plugin-qpp-semiconsole:
+	$(call skip-test, $<, "MANUAL ONLY")
 run-plugin-semiconsole-with-%:
 	$(call skip-test, $<, "MANUAL ONLY")
 
-- 
2.34.1


