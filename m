Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB4E2489E0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 17:29:26 +0200 (CEST)
Received: from localhost ([::1]:59784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k83YD-0005Ks-6X
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 11:29:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82Lv-0006cZ-Tg
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:12:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24025
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82Ln-0007gq-QU
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:12:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597759951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=as7a1PHC7IrwzPH7fkBv6Spk7f6oxDc7+X0mXS1Qpsw=;
 b=ixCjYkZ15v75CgF1K5aTeReY0+pG0p0feSltnBqGsRx5bwa0mzaZGbM3UNwFLpDYGldDHv
 U2aohuFZ3xiDkB+0Df0oogb3lQ+XryPT7ogc1omXEhCJZIXsK92kdoyyjUMUfBMbzLC1XD
 uIxczGd4h8HR0mPokxU3+uxxJQLSUXA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-7Wwt2IjBOUWN5LzDhIZ6lg-1; Tue, 18 Aug 2020 10:12:15 -0400
X-MC-Unique: 7Wwt2IjBOUWN5LzDhIZ6lg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 483C01007463
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 14:12:14 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03EBF5C64D;
 Tue, 18 Aug 2020 14:12:13 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 132/150] meson: cpu-emu
Date: Tue, 18 Aug 2020 10:10:07 -0400
Message-Id: <20200818141025.21608-133-pbonzini@redhat.com>
In-Reply-To: <20200818141025.21608-1-pbonzini@redhat.com>
References: <20200818141025.21608-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 06:40:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
 Makefile.target         | 12 ------------
 configure               | 10 +++++++++-
 meson.build             | 37 +++++++++++++++++++++++++++++++++++++
 scripts/feature_to_c.sh | 24 ++++++++----------------
 4 files changed, 54 insertions(+), 29 deletions(-)

diff --git a/Makefile.target b/Makefile.target
index 5c099fa79f..c180b4cb38 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -108,15 +108,6 @@ obj-y += $(LIBQEMU)
 obj-y += trace/
 
 #########################################################
-# cpu emulator library
-obj-y += exec.o exec-vary.o
-obj-$(CONFIG_TCG) += tcg/tcg.o tcg/tcg-op.o tcg/tcg-op-vec.o tcg/tcg-op-gvec.o
-obj-$(CONFIG_TCG) += tcg/tcg-common.o tcg/optimize.o
-obj-$(CONFIG_TCG_INTERPRETER) += tcg/tci.o
-obj-$(CONFIG_TCG_INTERPRETER) += disas/tci.o
-obj-$(CONFIG_TCG) += fpu/softfloat.o
-obj-y += disas.o
-obj-$(call notempty,$(TARGET_XML_FILES)) += gdbstub-xml.o
 LIBS := $(libs_cpu) $(LIBS)
 
 obj-$(CONFIG_PLUGIN) += plugins/
@@ -200,9 +191,6 @@ ifdef CONFIG_DARWIN
 	$(call quiet-command,SetFile -a C $@,"SETFILE","$(TARGET_DIR)$@")
 endif
 
-gdbstub-xml.c: $(TARGET_XML_FILES) $(SRC_PATH)/scripts/feature_to_c.sh
-	$(call quiet-command,rm -f $@ && $(SHELL) $(SRC_PATH)/scripts/feature_to_c.sh $@ $(TARGET_XML_FILES),"GEN","$(TARGET_DIR)$@")
-
 clean: clean-target
 	rm -f *.a *~ $(PROGS)
 	rm -f $(shell find . -name '*.[od]')
diff --git a/configure b/configure
index 14fb50d419..1df15fbbe9 100755
--- a/configure
+++ b/configure
@@ -5429,9 +5429,13 @@ case "$capstone" in
       LIBCAPSTONE=libcapstone.a
     fi
     libs_cpu="-L$PWD/capstone -lcapstone $libs_cpu"
+    capstone_libs="-L$PWD/capstone -lcapstone"
+    capstone_cflags="-I${source_path}/capstone/include"
     ;;
 
   system)
+    capstone_libs="$($pkg_config --libs capstone)"
+    capstone_cflags="$($pkg_config --cflags capstone)"
     QEMU_CFLAGS="$QEMU_CFLAGS $($pkg_config --cflags capstone)"
     libs_cpu="$($pkg_config --libs capstone) $libs_cpu"
     ;;
@@ -7663,6 +7667,8 @@ if test "$ivshmem" = "yes" ; then
 fi
 if test "$capstone" != "no" ; then
   echo "CONFIG_CAPSTONE=y" >> $config_host_mak
+  echo "CAPSTONE_CFLAGS=$capstone_cflags" >> $config_host_mak
+  echo "CAPSTONE_LIBS=$capstone_libs" >> $config_host_mak
 fi
 if test "$debug_mutex" = "yes" ; then
   echo "CONFIG_DEBUG_MUTEX=y" >> $config_host_mak
@@ -7683,6 +7689,8 @@ fi
 
 if test "$libpmem" = "yes" ; then
   echo "CONFIG_LIBPMEM=y" >> $config_host_mak
+  echo "LIBPMEM_LIBS=$libpmem_libs" >> $config_host_mak
+  echo "LIBPMEM_CFLAGS=$libpmem_cflags" >> $config_host_mak
 fi
 
 if test "$libdaxctl" = "yes" ; then
@@ -8181,7 +8189,7 @@ fi
 list=""
 if test ! -z "$gdb_xml_files" ; then
   for x in $gdb_xml_files; do
-    list="$list $source_path/gdb-xml/$x"
+    list="$list gdb-xml/$x"
   done
   echo "TARGET_XML_FILES=$list" >> $config_target_mak
 fi
diff --git a/meson.build b/meson.build
index b55d9aa186..e6422ef8a3 100644
--- a/meson.build
+++ b/meson.build
@@ -342,6 +342,16 @@ if 'CONFIG_USB_LIBUSB' in config_host
   libusb = declare_dependency(compile_args: config_host['LIBUSB_CFLAGS'].split(),
                               link_args: config_host['LIBUSB_LIBS'].split())
 endif
+capstone = not_found
+if 'CONFIG_CAPSTONE' in config_host
+  capstone = declare_dependency(compile_args: config_host['CAPSTONE_CFLAGS'].split(),
+                                link_args: config_host['CAPSTONE_LIBS'].split())
+endif
+libpmem = not_found
+if 'CONFIG_LIBPMEM' in config_host
+  libpmem = declare_dependency(compile_args: config_host['LIBPMEM_CFLAGS'].split(),
+                               link_args: config_host['LIBPMEM_LIBS'].split())
+endif
 
 create_config = find_program('scripts/create_config')
 minikconf = find_program('scripts/minikconf.py')
@@ -526,6 +536,8 @@ target_softmmu_arch = {}
 # Trace files #
 ###############
 
+# TODO: add each directory to the subdirs from its own meson.build, once
+# we have those
 trace_events_subdirs = [
   'accel/kvm',
   'accel/tcg',
@@ -694,6 +706,20 @@ softmmu_ss.add(when: ['CONFIG_FDT', fdt],  if_true: [files('device_tree.c')])
 common_ss.add(files('cpus-common.c'))
 
 subdir('softmmu')
+
+specific_ss.add(files('disas.c', 'exec.c', 'gdbstub.c'), capstone, libpmem)
+specific_ss.add(files('exec-vary.c'))
+specific_ss.add(when: 'CONFIG_TCG', if_true: files(
+  'fpu/softfloat.c',
+  'tcg/optimize.c',
+  'tcg/tcg-common.c',
+  'tcg/tcg-op-gvec.c',
+  'tcg/tcg-op-vec.c',
+  'tcg/tcg-op.c',
+  'tcg/tcg.c',
+))
+specific_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('disas/tci.c', 'tcg/tci.c'))
+
 subdir('backends')
 subdir('disas')
 subdir('migration')
@@ -785,6 +811,8 @@ common_all = static_library('common',
                             dependencies: common_all.dependencies(),
                             name_suffix: 'fa')
 
+feature_to_c = find_program('scripts/feature_to_c.sh')
+
 foreach target : target_dirs
   config_target = config_target_mak[target]
   target_name = config_target['TARGET_NAME']
@@ -831,6 +859,15 @@ foreach target : target_dirs
     endif
   endif
 
+  if 'TARGET_XML_FILES' in config_target
+    gdbstub_xml = custom_target(target + '-gdbstub-xml.c',
+                                output: target + '-gdbstub-xml.c',
+                                input: files(config_target['TARGET_XML_FILES'].split()),
+                                command: [feature_to_c, '@INPUT@'],
+                                capture: true)
+    arch_srcs += gdbstub_xml
+  endif
+
   t = target_arch[arch].apply(config_target, strict: false)
   arch_srcs += t.sources()
 
diff --git a/scripts/feature_to_c.sh b/scripts/feature_to_c.sh
index c8ce9b88f6..b1169899c1 100644
--- a/scripts/feature_to_c.sh
+++ b/scripts/feature_to_c.sh
@@ -19,16 +19,8 @@
 # You should have received a copy of the GNU General Public License
 # along with this program; if not, see <http://www.gnu.org/licenses/>.
 
-output=$1
-shift
-
-if test -z "$output" || test -z "$1"; then
-  echo "Usage: $0 OUTPUTFILE INPUTFILE..."
-  exit 1
-fi
-
-if test -e "$output"; then
-  echo "Output file \"$output\" already exists; refusing to overwrite."
+if test -z "$1"; then
+  echo "Usage: $0 INPUTFILE..."
   exit 1
 fi
 
@@ -60,17 +52,17 @@ for input; do
       printf "'\''\\n'\'', \n"
     } END {
       print "  0 };"
-    }' < $input >> $output
+    }' < $input
 done
 
-echo >> $output
-echo "const char *const xml_builtin[][2] = {" >> $output
+echo
+echo "const char *const xml_builtin[][2] = {"
 
 for input; do
   basename=$(echo $input | sed 's,.*/,,')
   arrayname=xml_feature_$(echo $input | sed 's,.*/,,; s/[-.]/_/g')
-  echo "  { \"$basename\", $arrayname }," >> $output
+  echo "  { \"$basename\", $arrayname },"
 done
 
-echo "  { (char *)0, (char *)0 }" >> $output
-echo "};" >> $output
+echo "  { (char *)0, (char *)0 }"
+echo "};"
-- 
2.26.2



