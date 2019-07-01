Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BB62C12F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 May 2019 10:27:39 +0200 (CEST)
Received: from localhost ([127.0.0.1]:59048 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVXSN-0000qv-02
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 04:27:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hVXO7-0006LB-Mi
	for qemu-devel@nongnu.org; Tue, 28 May 2019 04:23:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hVXO6-0002qN-2U
	for qemu-devel@nongnu.org; Tue, 28 May 2019 04:23:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58456)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hVXO5-0002pK-SN
	for qemu-devel@nongnu.org; Tue, 28 May 2019 04:23:14 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 35EA630833C0;
	Tue, 28 May 2019 08:23:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-250.ams2.redhat.com
	[10.36.117.250])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 611FA1001E80;
	Tue, 28 May 2019 08:23:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id EA4B61132BD3; Tue, 28 May 2019 10:23:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 28 May 2019 10:23:07 +0200
Message-Id: <20190528082308.22032-4-armbru@redhat.com>
In-Reply-To: <20190528082308.22032-1-armbru@redhat.com>
References: <20190528082308.22032-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 28 May 2019 08:23:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 3/4] Makefile: Rename targets for make recursion
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We make a few sub-directories recursively, in particular
$(TARGET_DIRS).

For goal "all", we do it the nice way: "all" has a prerequisite
subdir-T for each T in $(TARGET_DIRS), and T's recipe runs make
recursively.  Behaves nicely with -j and -k.

For other goals such as "clean" and "install", the recipe runs make
recursively in a for loop.  Ignores -j and -k.

The next commit will fix that for "clean" and "install".  This commit
prepares the ground by renaming the targets we use for "all" to
include the goal for the sub-make.  This will permit reusing them for
goals other than "all".

Targets subdir-T for T in $(TARGET_DIRS) run "make all" in T.  Rename
to T/all, and declare phony.

Targets romsubdir-R for R in $(ROMS) run "make" in pc-bios/R.  Default
goal is "all" for all R.  Rename to pc-bios/R/all, and declare phony.

The remainder are renamed just for consistency.

Target subdir-dtc runs "make libbft/libfdt.a" in dtc.  Rename to
dtc/all, and declare phony.

Target subdir-capstone runs make $(BUILD_DIR)/capstone/$(LIBCAPSTONE)
in $(SRC_PATH)/capstone.  Rename to capstone/all, and declare phony.

Target subdir-slirp runs "make" in $(SRC_PATH)/slirp.  Default goal is
all, which builds $(BUILD_DIR)/libslirp.a.  Rename to slirp/all, and
declare phony.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 Makefile               | 30 ++++++++++++++++++------------
 configure              |  6 +++---
 tests/Makefile.include |  5 +++--
 3 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/Makefile b/Makefile
index 80c9c6416f..42930b7749 100644
--- a/Makefile
+++ b/Makefile
@@ -437,8 +437,8 @@ config-host.h-timestamp: config-host.mak
 qemu-options.def: $(SRC_PATH)/qemu-options.hx $(SRC_PATH)/scripts/hxtool
 	$(call quiet-command,sh $(SRC_PATH)/scripts/hxtool -h < $< > $@,"GEN","=
$@")
=20
-SUBDIR_RULES=3D$(patsubst %,subdir-%, $(TARGET_DIRS))
-SOFTMMU_SUBDIR_RULES=3D$(filter %-softmmu,$(SUBDIR_RULES))
+SUBDIR_RULES=3D$(addsuffix /all, $(TARGET_DIRS))
+SOFTMMU_SUBDIR_RULES=3D$(filter %-softmmu/all,$(SUBDIR_RULES))
=20
 $(SOFTMMU_SUBDIR_RULES): $(authz-obj-y)
 $(SOFTMMU_SUBDIR_RULES): $(block-obj-y)
@@ -448,14 +448,16 @@ $(SOFTMMU_SUBDIR_RULES): $(io-obj-y)
 $(SOFTMMU_SUBDIR_RULES): config-all-devices.mak
 $(SOFTMMU_SUBDIR_RULES): $(edk2-decompressed)
=20
-subdir-%:
-	$(call quiet-command,$(MAKE) $(SUBDIR_MAKEFLAGS) -C $* V=3D"$(V)" TARGE=
T_DIR=3D"$*/" all,)
+.PHONY: $(SUBDIR_RULES)
+$(SUBDIR_RULES):
+	$(call quiet-command,$(MAKE) $(SUBDIR_MAKEFLAGS) -C $(dir $@) V=3D"$(V)=
" TARGET_DIR=3D"$(dir $@)" all,)
=20
 DTC_MAKE_ARGS=3D-I$(SRC_PATH)/dtc VPATH=3D$(SRC_PATH)/dtc -C dtc V=3D"$(=
V)" LIBFDT_srcdir=3D$(SRC_PATH)/dtc/libfdt
 DTC_CFLAGS=3D$(CFLAGS) $(QEMU_CFLAGS)
 DTC_CPPFLAGS=3D-I$(BUILD_DIR)/dtc -I$(SRC_PATH)/dtc -I$(SRC_PATH)/dtc/li=
bfdt
=20
-subdir-dtc: .git-submodule-status dtc/libfdt dtc/tests
+.PHONY: dtc/all
+dtc/all: .git-submodule-status dtc/libfdt dtc/tests
 	$(call quiet-command,$(MAKE) $(DTC_MAKE_ARGS) CPPFLAGS=3D"$(DTC_CPPFLAG=
S)" CFLAGS=3D"$(DTC_CFLAGS)" LDFLAGS=3D"$(LDFLAGS)" ARFLAGS=3D"$(ARFLAGS)=
" CC=3D"$(CC)" AR=3D"$(AR)" LD=3D"$(LD)" $(SUBDIR_MAKEFLAGS) libfdt/libfd=
t.a,)
=20
 dtc/%: .git-submodule-status
@@ -473,21 +475,25 @@ CAP_CFLAGS +=3D -DCAPSTONE_HAS_ARM64
 CAP_CFLAGS +=3D -DCAPSTONE_HAS_POWERPC
 CAP_CFLAGS +=3D -DCAPSTONE_HAS_X86
=20
-subdir-capstone: .git-submodule-status
+.PHONY: capstone/all
+capstone/all: .git-submodule-status
 	$(call quiet-command,$(MAKE) -C $(SRC_PATH)/capstone CAPSTONE_SHARED=3D=
no BUILDDIR=3D"$(BUILD_DIR)/capstone" CC=3D"$(CC)" AR=3D"$(AR)" LD=3D"$(L=
D)" RANLIB=3D"$(RANLIB)" CFLAGS=3D"$(CAP_CFLAGS)" $(SUBDIR_MAKEFLAGS) $(B=
UILD_DIR)/capstone/$(LIBCAPSTONE))
=20
-subdir-slirp: .git-submodule-status
+.PHONY: slirp/all
+slirp/all: .git-submodule-status
 	$(call quiet-command,$(MAKE) -C $(SRC_PATH)/slirp BUILD_DIR=3D"$(BUILD_=
DIR)/slirp" CC=3D"$(CC)" AR=3D"$(AR)" LD=3D"$(LD)" RANLIB=3D"$(RANLIB)" C=
FLAGS=3D"$(QEMU_CFLAGS) $(CFLAGS)" LDFLAGS=3D"$(LDFLAGS)")
=20
 $(SUBDIR_RULES): libqemuutil.a $(common-obj-y) \
 	$(qom-obj-y) $(crypto-user-obj-$(CONFIG_USER_ONLY))
=20
-ROMSUBDIR_RULES=3D$(patsubst %,romsubdir-%, $(ROMS))
+ROM_DIRS =3D $(addprefix pc-bios/, $(ROMS))
+ROMSUBDIR_RULES=3D$(addsuffix /all, $(ROM_DIRS))
 # Only keep -O and -g cflags
-romsubdir-%:
-	$(call quiet-command,$(MAKE) $(SUBDIR_MAKEFLAGS) -C pc-bios/$* V=3D"$(V=
)" TARGET_DIR=3D"$*/" CFLAGS=3D"$(filter -O% -g%,$(CFLAGS))",)
+.PHONY: $(ROMSUBDIR_RULES)
+$(ROMSUBDIR_RULES):
+	$(call quiet-command,$(MAKE) $(SUBDIR_MAKEFLAGS) -C $(dir $@) V=3D"$(V)=
" TARGET_DIR=3D"$(dir $@)" CFLAGS=3D"$(filter -O% -g%,$(CFLAGS))",)
=20
-ALL_SUBDIRS=3D$(TARGET_DIRS) $(patsubst %,pc-bios/%, $(ROMS))
+ALL_SUBDIRS=3D$(TARGET_DIRS) $(ROM_DIRS)
=20
 recurse-all: $(SUBDIR_RULES) $(ROMSUBDIR_RULES)
=20
@@ -1098,7 +1104,7 @@ endif
 	@$(if $(TARGET_DIRS), \
 		echo 'Architecture specific targets:'; \
 		$(foreach t, $(TARGET_DIRS), \
-		printf "  %-30s - Build for %s\\n" $(patsubst %,subdir-%,$(t)) $(t);) =
\
+		printf "  %-30s - Build for %s\\n" $(t)/all $(t);) \
 		echo '')
 	@echo  'Cleaning targets:'
 	@echo  '  clean           - Remove most generated files but keep the co=
nfig'
diff --git a/configure b/configure
index 528b9ff705..effd943a05 100755
--- a/configure
+++ b/configure
@@ -6597,7 +6597,7 @@ if test "$slirp" !=3D "no"; then
   echo "SLIRP_LIBS=3D$slirp_libs" >> $config_host_mak
 fi
 if [ "$slirp" =3D "git" -o "$slirp" =3D "internal" ]; then
-    echo "config-host.h: subdir-slirp" >> $config_host_mak
+    echo "config-host.h: slirp/all" >> $config_host_mak
 fi
 if test "$vde" =3D "yes" ; then
   echo "CONFIG_VDE=3Dy" >> $config_host_mak
@@ -7865,10 +7865,10 @@ if test -n "$enabled_cross_compilers"; then
 fi
=20
 if [ "$fdt" =3D "git" ]; then
-  echo "config-host.h: subdir-dtc" >> $config_host_mak
+  echo "config-host.h: dtc/all" >> $config_host_mak
 fi
 if [ "$capstone" =3D "git" -o "$capstone" =3D "internal" ]; then
-  echo "config-host.h: subdir-capstone" >> $config_host_mak
+  echo "config-host.h: capstone/all" >> $config_host_mak
 fi
 if test -n "$LIBCAPSTONE"; then
   echo "LIBCAPSTONE=3D$LIBCAPSTONE" >> $config_host_mak
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 1865f6b322..1a3f17faa9 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -1,3 +1,4 @@
+# -*- Mode: makefile -*-
=20
 .PHONY: check-help
 check-help:
@@ -880,7 +881,7 @@ define do_test_tap
 endef
=20
 .PHONY: $(patsubst %, check-qtest-%, $(QTEST_TARGETS))
-$(patsubst %, check-qtest-%, $(QTEST_TARGETS)): check-qtest-%: subdir-%-=
softmmu $(check-qtest-y)
+$(patsubst %, check-qtest-%, $(QTEST_TARGETS)): check-qtest-%: %-softmmu=
/all $(check-qtest-y)
 	$(call do_test_human,$(check-qtest-$*-y) $(check-qtest-generic-y), \
 	  QTEST_QEMU_BINARY=3D$*-softmmu/qemu-system-$* \
 	  QTEST_QEMU_IMG=3Dqemu-img$(EXESUF))
@@ -893,7 +894,7 @@ check-speed: $(check-speed-y)
=20
 # gtester tests with TAP output
=20
-$(patsubst %, check-report-qtest-%.tap, $(QTEST_TARGETS)): check-report-=
qtest-%.tap: subdir-%-softmmu $(check-qtest-y)
+$(patsubst %, check-report-qtest-%.tap, $(QTEST_TARGETS)): check-report-=
qtest-%.tap: %-softmmu/all $(check-qtest-y)
 	$(call do_test_tap, $(check-qtest-$*-y) $(check-qtest-generic-y), \
 	  QTEST_QEMU_BINARY=3D$*-softmmu/qemu-system-$* \
 	  QTEST_QEMU_IMG=3Dqemu-img$(EXESUF))
--=20
2.17.2


