Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8761A3450
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Apr 2020 14:44:42 +0200 (CEST)
Received: from localhost ([::1]:48642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMWXx-00017l-OH
	for lists+qemu-devel@lfdr.de; Thu, 09 Apr 2020 08:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51920)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cfontana@suse.de>) id 1jMWX5-0000iL-Jq
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 08:43:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cfontana@suse.de>) id 1jMWX4-000258-6h
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 08:43:47 -0400
Received: from mx2.suse.de ([195.135.220.15]:44316)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cfontana@suse.de>) id 1jMWX3-00024y-UU
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 08:43:46 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 54390AF6D;
 Thu,  9 Apr 2020 12:43:43 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v2] Makefile: libfdt: build only the strict necessary
Date: Thu,  9 Apr 2020 14:43:37 +0200
Message-Id: <20200409124337.32134-1-cfontana@suse.de>
X-Mailer: git-send-email 2.16.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic]
X-Received-From: 195.135.220.15
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
Cc: qemu-devel@nongnu.org, Alex Bennee <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

when building dtc/libfdt, we were previously using dtc/Makefile,
which tries to build some artifacts that are not needed,
and can complain on stderr about the absence of tools that
are not required to build just libfdt.

Instead, build only the strict necessary to get libfdt.a .

Remove the subdir-dtc "compatibility gunk" for recursion,
since we are not recursing anymore.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 Makefile  | 23 +++++++++++++----------
 configure |  6 +-----
 rules.mak |  2 ++
 3 files changed, 16 insertions(+), 15 deletions(-)

v1 -> v2:

* fix error generated when running UNCHECKED_GOALS without prior configure,
  for example during make docker-image-fedora. Without configure, DSOSUF is
  empty, and the module pattern rule in rules.mak that uses this variable
  can match too much; provide a default in the Makefile to avoid it.

* only attempt to build the archive when there is a non-empty list of objects.
  This could be done in general for the %.a: pattern in rules.mak, but maybe
  there are valid reasons to build an empty .a?

* removed some intermediate variables that did not add much value
  (LIBFDT_srcdir, LIBFDT_archive)

Tested locally with 3 VPATH configurations (no-, VPATH, VPATH in src subdir),
and with docker-image-fedora, docker-test-debug@fedora that failed before.

diff --git a/Makefile b/Makefile
index 84ef881600..92bc853b5f 100644
--- a/Makefile
+++ b/Makefile
@@ -4,6 +4,10 @@ ifneq ($(words $(subst :, ,$(CURDIR))), 1)
   $(error main directory cannot contain spaces nor colons)
 endif
 
+# some pattern rules in rules.mak are confused by an empty DSOSUF,
+# and UNCHECKED_GOALS for testing (docker-) can run without prior configure.
+DSOSUF ?= ".so"
+
 # Always point to the root of the build tree (needs GNU make).
 BUILD_DIR=$(CURDIR)
 
@@ -526,15 +530,16 @@ $(SOFTMMU_FUZZ_RULES): $(edk2-decompressed)
 $(TARGET_DIRS_RULES):
 	$(call quiet-command,$(MAKE) $(SUBDIR_MAKEFLAGS) -C $(dir $@) V="$(V)" TARGET_DIR="$(dir $@)" $(notdir $@),)
 
-DTC_MAKE_ARGS=-I$(SRC_PATH)/dtc VPATH=$(SRC_PATH)/dtc -C dtc V="$(V)" LIBFDT_srcdir=$(SRC_PATH)/dtc/libfdt
-DTC_CFLAGS=$(CFLAGS) $(QEMU_CFLAGS)
-DTC_CPPFLAGS=-I$(BUILD_DIR)/dtc -I$(SRC_PATH)/dtc -I$(SRC_PATH)/dtc/libfdt
-
-.PHONY: dtc/all
-dtc/all: .git-submodule-status dtc/libfdt dtc/tests
-	$(call quiet-command,$(MAKE) $(DTC_MAKE_ARGS) CPPFLAGS="$(DTC_CPPFLAGS)" CFLAGS="$(DTC_CFLAGS)" LDFLAGS="$(QEMU_LDFLAGS)" ARFLAGS="$(ARFLAGS)" CC="$(CC)" AR="$(AR)" LD="$(LD)" $(SUBDIR_MAKEFLAGS) libfdt/libfdt.a,)
+LIBFDT_objdir = dtc/libfdt
+-include $(SRC_PATH)/dtc/libfdt/Makefile.libfdt
+LIBFDT_objects = $(addprefix $(LIBFDT_objdir)/, $(LIBFDT_OBJS))
+.PHONY: libfdt
+libfdt: .git-submodule-status $(LIBFDT_objdir)/libfdt.a
+$(LIBFDT_objdir)/libfdt.a: $(LIBFDT_objects)
+	$(if $(LIBFDT_objects),$(call quiet-command,rm -f $@ && $(AR) rcs $@ $^,"AR","$(TARGET_DIR)$@"),)
 
-dtc/%: .git-submodule-status
+$(LIBFDT_objects): | $(LIBFDT_objdir)
+$(LIBFDT_objdir): .git-submodule-status
 	@mkdir -p $@
 
 # Overriding CFLAGS causes us to lose defines added in the sub-makefile.
@@ -563,7 +568,6 @@ slirp/all: .git-submodule-status
 
 # Compatibility gunk to keep make working across the rename of targets
 # for recursion, to be removed some time after 4.1.
-subdir-dtc: dtc/all
 subdir-capstone: capstone/all
 subdir-slirp: slirp/all
 
@@ -821,7 +825,6 @@ distclean: clean
 	rm -rf $$d || exit 1 ; \
         done
 	rm -Rf .sdk
-	if test -f dtc/version_gen.h; then $(MAKE) $(DTC_MAKE_ARGS) clean; fi
 
 KEYMAPS=da     en-gb  et  fr     fr-ch  is  lt  no  pt-br  sv \
 ar      de     en-us  fi  fr-be  hr     it  lv  nl         pl  ru     th \
diff --git a/configure b/configure
index 233c671aaa..36f83ffc5a 100755
--- a/configure
+++ b/configure
@@ -4278,10 +4278,6 @@ EOF
       if test -d "${source_path}/dtc/libfdt" || test -e "${source_path}/.git" ; then
           fdt=git
           mkdir -p dtc
-          if [ "$pwd_is_source_path" != "y" ] ; then
-              symlink "$source_path/dtc/Makefile" "dtc/Makefile"
-              symlink "$source_path/dtc/scripts" "dtc/scripts"
-          fi
           fdt_cflags="-I\$(SRC_PATH)/dtc/libfdt"
           fdt_ldflags="-L\$(BUILD_DIR)/dtc/libfdt"
           fdt_libs="$fdt_libs"
@@ -8151,7 +8147,7 @@ echo "PIXMAN_CFLAGS=$pixman_cflags" >> $config_host_mak
 echo "PIXMAN_LIBS=$pixman_libs" >> $config_host_mak
 
 if [ "$fdt" = "git" ]; then
-  echo "config-host.h: dtc/all" >> $config_host_mak
+  echo "config-host.h: libfdt" >> $config_host_mak
 fi
 if [ "$capstone" = "git" -o "$capstone" = "internal" ]; then
   echo "config-host.h: capstone/all" >> $config_host_mak
diff --git a/rules.mak b/rules.mak
index 694865b63e..61eb474ba4 100644
--- a/rules.mak
+++ b/rules.mak
@@ -105,6 +105,8 @@ LINK = $(call quiet-command, $(LINKPROG) $(CFLAGS) $(QEMU_LDFLAGS) -o $@ \
 
 DSO_OBJ_CFLAGS := -fPIC -DBUILD_DSO
 module-common.o: CFLAGS += $(DSO_OBJ_CFLAGS)
+
+# Note: DSOSUF must not be empty, or these rules will try to match too much
 %$(DSOSUF): QEMU_LDFLAGS += $(LDFLAGS_SHARED)
 %$(DSOSUF): %.mo
 	$(call LINK,$^)
-- 
2.16.4


