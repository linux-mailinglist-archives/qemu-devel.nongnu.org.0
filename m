Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8097E24D32D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 12:51:11 +0200 (CEST)
Received: from localhost ([::1]:54080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k94da-0005rc-H5
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 06:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94Dr-0002D5-Ck
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:24:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46747
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94Dk-0001e8-BK
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:24:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598005467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TzP4DUOiKfJcE1NCEPdlkJnuYTG6hWg1JCB0JDr4YZA=;
 b=eHNp1GhlL1bK3/pHFA3uA4Fi1ObJ8fCJvLdzcoU3cQ6i/1ncaRs86Ck56PEN2cTagStAg/
 O6Eih0fpQ0uXNrReImQbbrYBXVaqaEvXHjibHy1zoj3h4YUPajKEXyXAEfo0bVP90ewTdx
 YS8y4nyPhRArzW0gmnZUgztY4sO0Goc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-_q8e0tKEMLuT91gCz-_Utg-1; Fri, 21 Aug 2020 06:24:25 -0400
X-MC-Unique: _q8e0tKEMLuT91gCz-_Utg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E57C11009458
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 10:24:24 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FB26101E247;
 Fri, 21 Aug 2020 10:24:24 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v8 063/152] meson: add modules infrastructure
Date: Fri, 21 Aug 2020 06:22:00 -0400
Message-Id: <20200821102329.29777-64-pbonzini@redhat.com>
In-Reply-To: <20200821102329.29777-1-pbonzini@redhat.com>
References: <20200821102329.29777-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 23:41:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile            | 10 +--------
 Makefile.target     |  6 ++++++
 meson.build         | 51 +++++++++++++++++++++++++++++++++++++++++++++
 rules.mak           | 10 ++++-----
 scripts/undefsym.sh | 20 ++++++++++++++++++
 5 files changed, 83 insertions(+), 14 deletions(-)
 create mode 100755 scripts/undefsym.sh

diff --git a/Makefile b/Makefile
index 19f167ba5f..0ec50ee9b7 100644
--- a/Makefile
+++ b/Makefile
@@ -266,7 +266,7 @@ slirp/all: .git-submodule-status
 		CFLAGS="$(QEMU_CFLAGS) $(CFLAGS)" LDFLAGS="$(QEMU_LDFLAGS)")
 
 $(filter %/all, $(TARGET_DIRS_RULES)): libqemuutil.a $(common-obj-y) \
-	$(qom-obj-y)
+	$(qom-obj-y) block.syms qemu.syms
 
 $(filter %/fuzz, $(TARGET_DIRS_RULES)): libqemuutil.a $(common-obj-y) \
 	$(qom-obj-y) $(crypto-user-obj-$(CONFIG_USER_ONLY))
@@ -474,14 +474,6 @@ install: all $(if $(BUILD_DOCS),install-doc) \
 ifneq ($(TOOLS),)
 	$(call install-prog,$(TOOLS),$(DESTDIR)$(bindir))
 endif
-ifneq ($(CONFIG_MODULES),)
-	$(INSTALL_DIR) "$(DESTDIR)$(qemu_moddir)"
-	for s in $(modules-m:.mo=$(DSOSUF)); do \
-		t="$(DESTDIR)$(qemu_moddir)/$$(echo $$s | tr / -)"; \
-		$(INSTALL_LIB) $$s "$$t"; \
-		test -z "$(STRIP)" || $(STRIP) "$$t"; \
-	done
-endif
 ifneq ($(HELPERS-y),)
 	$(call install-prog,$(HELPERS-y),$(DESTDIR)$(libexecdir))
 endif
diff --git a/Makefile.target b/Makefile.target
index 43d2f9734f..d1d8906b4d 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -162,6 +162,12 @@ obj-y += qapi/
 obj-y += migration/ram.o
 LIBS := $(libs_softmmu) $(LIBS)
 
+# Temporary until emulators are linked by Meson
+LIBS := $(LIBS) @../block.syms @../qemu.syms
+ifneq ($(CONFIG_MODULES),y)
+LIBS := $(LIBS)
+endif
+
 # Hardware support
 ifeq ($(TARGET_NAME), sparc64)
 obj-y += hw/sparc64/
diff --git a/meson.build b/meson.build
index 6f8024cdcf..13b83ea14b 100644
--- a/meson.build
+++ b/meson.build
@@ -10,6 +10,7 @@ sh = find_program('sh')
 cc = meson.get_compiler('c')
 config_host = keyval.load(meson.current_build_dir() / 'config-host.mak')
 config_all_disas = keyval.load(meson.current_build_dir() / 'config-all-disas.mak')
+enable_modules = 'CONFIG_MODULES' in config_host
 
 add_project_arguments(config_host['QEMU_CFLAGS'].split(),
                       native: false, language: ['c', 'objc'])
@@ -316,6 +317,7 @@ genh += hxdep
 util_ss = ss.source_set()
 stub_ss = ss.source_set()
 trace_ss = ss.source_set()
+block_ss = ss.source_set()
 common_ss = ss.source_set()
 softmmu_ss = ss.source_set()
 user_ss = ss.source_set()
@@ -323,6 +325,7 @@ bsd_user_ss = ss.source_set()
 linux_user_ss = ss.source_set()
 specific_ss = ss.source_set()
 
+modules = {}
 hw_arch = {}
 target_arch = {}
 target_softmmu_arch = {}
@@ -432,6 +435,12 @@ subdir('crypto')
 subdir('storage-daemon')
 subdir('ui')
 
+
+if enable_modules
+  libmodulecommon = static_library('module-common', files('module-common.c') + genh, pic: true, c_args: '-DBUILD_DSO')
+  modulecommon = declare_dependency(link_whole: libmodulecommon, compile_args: '-DBUILD_DSO')
+endif
+
 # Build targets from sourcesets
 
 stub_ss = stub_ss.apply(config_all, strict: false)
@@ -448,6 +457,48 @@ subdir('io')
 subdir('fsdev')
 subdir('target')
 
+block_mods = []
+softmmu_mods = []
+foreach d, list : modules
+  foreach m, module_ss : list
+    if enable_modules and targetos != 'windows'
+      module_ss = module_ss.apply(config_host, strict: false)
+      sl = static_library(d + '-' + m, [genh, module_ss.sources()],
+                          dependencies: [modulecommon, module_ss.dependencies()], pic: true)
+      if d == 'block'
+        block_mods += sl
+      else
+        softmmu_mods += sl
+      endif
+    else
+      if d == 'block'
+        block_ss.add_all(module_ss)
+      else
+        softmmu_ss.add_all(module_ss)
+      endif
+    endif
+  endforeach
+endforeach
+
+nm = find_program('nm')
+undefsym = find_program('scripts/undefsym.sh')
+block_syms = custom_target('block.syms', output: 'block.syms',
+                             input: [libqemuutil, block_mods],
+                             capture: true,
+                             command: [undefsym, nm, '@INPUT@'])
+qemu_syms = custom_target('qemu.syms', output: 'qemu.syms',
+                             input: [libqemuutil, softmmu_mods],
+                             capture: true,
+                             command: [undefsym, nm, '@INPUT@'])
+
+foreach m : block_mods + softmmu_mods
+  shared_module(m.name(),
+                name_prefix: '',
+                link_whole: m,
+                install: true,
+                install_dir: config_host['qemu_moddir'])
+endforeach
+
 common_ss.add_all(when: 'CONFIG_SOFTMMU', if_true: softmmu_ss)
 common_ss.add_all(when: 'CONFIG_USER_ONLY', if_true: user_ss)
 
diff --git a/rules.mak b/rules.mak
index d8d35f735a..9da9dcd4f6 100644
--- a/rules.mak
+++ b/rules.mak
@@ -61,17 +61,17 @@ endif
 # This is necessary because the exectuable itself may not use the function, in
 # which case the function would not be linked in. Then the DSO loading will
 # fail because of the missing symbol.
-process-archive-undefs = $(filter-out %.a %.fa %.mo,$1) \
+process-archive-undefs = $(filter-out %.a %.fa %.mo %$(DSOSUF),$1) \
                 $(addprefix $(WL_U), \
                      $(filter $(call defined-symbols,$(filter %.a %.fa, $1)), \
-                              $(call undefined-symbols,$(filter %.mo,$1)))) \
+		$(call undefined-symbols,$(filter %.mo %$(DSOSUF),$1)))) \
 		$(foreach l,$(filter %.fa,$1),$(call whole-archive,$l)) \
 		$(filter %.a,$1)
 
-extract-libs = $(strip $(foreach o,$(filter-out %.mo,$1),$($o-libs)))
+extract-libs = $(strip $(foreach o,$(filter-out %.mo %$(DSOSUF),$1),$($o-libs)))
 expand-objs = $(strip $(sort $(filter %.o,$1)) \
-                  $(foreach o,$(filter %.mo,$1),$($o-objs)) \
-                  $(filter-out %.o %.mo,$1))
+		$(foreach o,$(filter %.mo %$(DSOSUF),$1),$($o-objs)) \
+		$(filter-out %.o %.mo %$(DSOSUF),$1))
 
 %.o: %.c
 	@mkdir -p $(dir $@)
diff --git a/scripts/undefsym.sh b/scripts/undefsym.sh
new file mode 100755
index 0000000000..b9ec332e95
--- /dev/null
+++ b/scripts/undefsym.sh
@@ -0,0 +1,20 @@
+#! /usr/bin/env bash
+
+# Before a shared module's DSO is produced, a static library is built for it
+# and passed to this script.  The script generates -Wl,-u options to force
+# the inclusion of symbol from libqemuutil.a if the shared modules need them,
+# This is necessary because the modules may use functions not needed by the
+# executable itself, which would cause the function to not be linked in.
+# Then the DSO loading would fail because of the missing symbol.
+
+if test $# -le 2; then
+  exit 0
+fi
+
+NM=$1
+staticlib=$2
+shift 2
+# Find symbols defined in static libraries and undefined in shared modules
+comm -12 \
+  <( $NM -P -g $staticlib | awk '$2!="U"{print "-Wl,-u," $1}' | sort -u) \
+  <( $NM -P -g "$@" | awk '$2=="U"{print "-Wl,-u," $1}' | sort -u)
-- 
2.26.2



