Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC1025D827
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 13:58:11 +0200 (CEST)
Received: from localhost ([::1]:52312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEAM6-0006ut-Rl
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 07:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kEA6o-0000zH-Gp
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 07:42:23 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:43174
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kEA6k-0005HW-BD
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 07:42:22 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-a_iWqo1ZPDqdlK7ZmzwI9w-1; Fri, 04 Sep 2020 07:42:16 -0400
X-MC-Unique: a_iWqo1ZPDqdlK7ZmzwI9w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA88F10A3EB8
 for <qemu-devel@nongnu.org>; Fri,  4 Sep 2020 11:41:43 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CAC4682157
 for <qemu-devel@nongnu.org>; Fri,  4 Sep 2020 11:41:42 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/46] configure: move C++ compiler handling to meson
Date: Fri,  4 Sep 2020 07:41:08 -0400
Message-Id: <20200904114122.31307-33-pbonzini@redhat.com>
In-Reply-To: <20200904114122.31307-1-pbonzini@redhat.com>
References: <20200904114122.31307-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 01:57:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All configure tests are run with a C compiler, except for building
QEMU_CXXFLAGS and checking for compatibility between the C and C++
compilers.  Move this to Meson and get rid of the link_language
property in the toolchain description.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure       | 53 -------------------------------------------------
 meson.build     | 30 +++++++++++++++++++++++-----
 scripts/empty.c |  6 ++++++
 3 files changed, 31 insertions(+), 58 deletions(-)
 create mode 100644 scripts/empty.c

diff --git a/configure b/configure
index 2fdad3c82f..2837eb6a74 100755
--- a/configure
+++ b/configure
@@ -150,24 +150,6 @@ add_to() {
     eval $1=\${$1:+\"\$$1 \"}\$2
 }
 
-update_cxxflags() {
-    # Set QEMU_CXXFLAGS from QEMU_CFLAGS by filtering out those
-    # options which some versions of GCC's C++ compiler complain about
-    # because they only make sense for C programs.
-    QEMU_CXXFLAGS="$QEMU_CXXFLAGS -D__STDC_LIMIT_MACROS -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS"
-    CXXFLAGS=$(echo "$CFLAGS" | sed s/-std=gnu99/-std=gnu++11/)
-    for arg in $QEMU_CFLAGS; do
-        case $arg in
-            -Wstrict-prototypes|-Wmissing-prototypes|-Wnested-externs|\
-            -Wold-style-declaration|-Wold-style-definition|-Wredundant-decls)
-                ;;
-            *)
-                QEMU_CXXFLAGS=${QEMU_CXXFLAGS:+$QEMU_CXXFLAGS }$arg
-                ;;
-        esac
-    done
-}
-
 compile_object() {
   local_cflags="$1"
   do_cc $CFLAGS $QEMU_CFLAGS $local_cflags -c -o $TMPO $TMPC
@@ -6561,38 +6543,6 @@ if test "$cpu" = "s390x" ; then
   fi
 fi
 
-# Check that the C++ compiler exists and works with the C compiler.
-# All the QEMU_CXXFLAGS are based on QEMU_CFLAGS. Keep this at the end to don't miss any other that could be added.
-if has $cxx; then
-    cat > $TMPC <<EOF
-int c_function(void);
-int main(void) { return c_function(); }
-EOF
-
-    compile_object
-
-    cat > $TMPCXX <<EOF
-extern "C" {
-   int c_function(void);
-}
-int c_function(void) { return 42; }
-EOF
-
-    update_cxxflags
-
-    if do_cxx $CXXFLAGS $QEMU_CXXFLAGS -o $TMPE $TMPCXX $TMPO $QEMU_LDFLAGS; then
-        # C++ compiler $cxx works ok with C compiler $cc
-        :
-    else
-        echo "C++ compiler $cxx does not work with C compiler $cc"
-        echo "Disabling C++ specific optional code"
-        cxx=
-    fi
-else
-    echo "No C++ compiler available; disabling C++ specific optional code"
-    cxx=
-fi
-
 echo_version() {
     if test "$1" = "yes" ; then
         echo "($2)"
@@ -7523,7 +7473,6 @@ echo "NM=$nm" >> $config_host_mak
 echo "PKG_CONFIG=$pkg_config_exe" >> $config_host_mak
 echo "WINDRES=$windres" >> $config_host_mak
 echo "CFLAGS=$CFLAGS" >> $config_host_mak
-echo "CXXFLAGS=$CXXFLAGS" >> $config_host_mak
 echo "CFLAGS_NOPIE=$CFLAGS_NOPIE" >> $config_host_mak
 echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
 echo "QEMU_CXXFLAGS=$QEMU_CXXFLAGS" >> $config_host_mak
@@ -8023,8 +7972,6 @@ meson_quote() {
 }
 
 echo "# Automatically generated by configure - do not modify" > $cross
-echo "[properties]" >> $cross
-test -z "$cxx" && echo "link_language = 'c'" >> $cross
 echo "[binaries]" >> $cross
 echo "c = $(meson_quote $cc)" >> $cross
 test -n "$cxx" && echo "cpp = $(meson_quote $cxx)" >> $cross
diff --git a/meson.build b/meson.build
index 84a3e610e7..a222a50a23 100644
--- a/meson.build
+++ b/meson.build
@@ -34,8 +34,6 @@ have_block = have_system or have_tools
 
 add_project_arguments(config_host['QEMU_CFLAGS'].split(),
                       native: false, language: ['c', 'objc'])
-add_project_arguments(config_host['QEMU_CXXFLAGS'].split(),
-                      native: false, language: 'cpp')
 add_project_link_arguments(config_host['QEMU_LDFLAGS'].split(),
                            native: false, language: ['c', 'cpp', 'objc'])
 add_project_arguments(config_host['QEMU_INCLUDES'].split(),
@@ -43,9 +41,31 @@ add_project_arguments(config_host['QEMU_INCLUDES'].split(),
 
 python = import('python').find_installation()
 
-link_language = meson.get_external_property('link_language', 'cpp')
-if link_language == 'cpp'
-  add_languages('cpp', required: true, native: false)
+##################
+# Compiler flags #
+##################
+
+link_language = 'c'
+if add_languages('cpp', required: false, native: false)
+  cxx = meson.get_compiler('cpp')
+  add_project_arguments('-D__STDC_LIMIT_MACROS', '-D__STDC_CONSTANT_MACROS',
+                        '-D__STDC_CONSTANT_MACROS',
+                        native: false, language: 'cpp')
+  foreach i : config_host['QEMU_CFLAGS'].split()
+    if i in [ '-Wstrict-prototypes', '-Wmissing-prototypes', '-Wnested-externs',
+              '-Wold-style-declaration', '-Wold-style-definition', '-Wredundant-decls' ]
+      # do nothing
+    elif i.startswith('-W')
+      add_project_arguments(cxx.get_supported_arguments(i), native: false, language: 'cpp')
+    else
+      add_project_arguments(i, native: false, language: 'cpp')
+    endif
+  endforeach
+  if cxx.links(files('scripts/empty.c'))
+    link_language = 'cpp'
+  else
+    warning('C++ compiler does not work with C compiler, disabling C++ code')
+  endif
 endif
 if host_machine.system() == 'darwin'
   add_languages('objc', required: false, native: false)
diff --git a/scripts/empty.c b/scripts/empty.c
new file mode 100644
index 0000000000..8f20b7e5f2
--- /dev/null
+++ b/scripts/empty.c
@@ -0,0 +1,6 @@
+/*
+ * An empty C file.  We need to make it a file and not include it
+ * in meson.build, so that we force it to compile with the C front-end
+ * and link with the C++ front-end.
+ */
+int main(void) { return 0; }
-- 
2.26.2



