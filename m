Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05993308B90
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:33:14 +0100 (CET)
Received: from localhost ([::1]:41462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Xdw-000686-Ky
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:33:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5XL2-0005U7-Sf
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:13:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5XKz-0007q8-QL
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:13:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611940417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VKXhDcY2fr9D/W+PiAuP5BWT+VMuGcseLcNFfSXuLpM=;
 b=XG+3ttJRyq9ippCmp/jHFHPNTVeKbHFRKAQETkIYDZbkNYj8LRsrhdiA5AMwR9Y4YBkmEv
 iy0MUu+mfJQzhWMOTJp3yk+46wY7tWxIsMhOxLolVBRjvQ8MNOONbuUPItyDXFdC9C2YF1
 8flJ/XIdgI8rz+Pg4hFbzEKwCwZctgY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-FujtSPoGMdyGPXmJzJLMVQ-1; Fri, 29 Jan 2021 12:13:34 -0500
X-MC-Unique: FujtSPoGMdyGPXmJzJLMVQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EBB818C8C1D;
 Fri, 29 Jan 2021 17:13:33 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-94.ams2.redhat.com
 [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 190F66B544;
 Fri, 29 Jan 2021 17:12:48 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/13] configure: replace --enable/disable-git-update with
 --with-git-submodules
Date: Fri, 29 Jan 2021 17:10:58 +0000
Message-Id: <20210129171102.4109641-10-berrange@redhat.com>
In-Reply-To: <20210129171102.4109641-1-berrange@redhat.com>
References: <20210129171102.4109641-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, libvir-list@redhat.com, Max Reitz <mreitz@redhat.com>,
 Dan Streetman <ddstreet@canonical.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dan Streetman <ddstreet@canonical.com>

Replace the --enable-git-update and --disable-git-update configure params
with the param --with-git-submodules=(update|validate|ignore) to
allow 3 options for building from a git repo.

This is needed because downstream packagers, e.g. Debian, Ubuntu, etc,
also keep the source code in git, but do not want to enable the
'git_update' mode; with the current code, that's not possible even
if the downstream package specifies --disable-git-update.

The previous parameters are deprecated but still available; the
--enable-git-update parameter maps to --with-git-submodules=update and
--disable-git-update parameter maps to --with-git-submodules=validate.

The configure script behavior is slightly modified, where previously
the dtc, capstone, and slirp submodules were not validated when
--disable-git-update was specified (but were updated with git-update
enabled), now they are validated when using --with-git-submodules=validate
and are only ignored when using --with-git-submodules=ignore.

Signed-off-by: Dan Streetman <ddstreet@canonical.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 Makefile                 | 24 ++-----------------
 configure                | 51 ++++++++++++++++++++++++++++++----------
 scripts/git-submodule.sh | 34 ++++++++++++++++++++-------
 3 files changed, 66 insertions(+), 43 deletions(-)

diff --git a/Makefile b/Makefile
index 291ea19f2e..b0dff73904 100644
--- a/Makefile
+++ b/Makefile
@@ -47,30 +47,10 @@ git-submodule-update:
 Makefile: .git-submodule-status
 
 .PHONY: git-submodule-update
-
-git_module_status := $(shell \
-  cd '$(SRC_PATH)' && \
-  GIT="$(GIT)" ./scripts/git-submodule.sh status $(GIT_SUBMODULES); \
-  echo $$?; \
-)
-
-ifeq (1,$(git_module_status))
-ifeq (no,$(GIT_UPDATE))
 git-submodule-update:
 	$(call quiet-command, \
-            echo && \
-            echo "GIT submodule checkout is out of date. Please run" && \
-            echo "  scripts/git-submodule.sh update $(GIT_SUBMODULES)" && \
-            echo "from the source directory checkout $(SRC_PATH)" && \
-            echo && \
-            exit 1)
-else
-git-submodule-update:
-	$(call quiet-command, \
-          (cd $(SRC_PATH) && GIT="$(GIT)" ./scripts/git-submodule.sh update $(GIT_SUBMODULES)), \
-          "GIT","$(GIT_SUBMODULES)")
-endif
-endif
+		(GIT="$(GIT)" "$(SRC_PATH)/scripts/git-submodule.sh" $(GIT_SUBMODULES_ACTION) $(GIT_SUBMODULES)), \
+		"GIT","$(GIT_SUBMODULES)")
 
 # 0. ensure the build tree is okay
 
diff --git a/configure b/configure
index 87de49e2c2..8fc59848b2 100755
--- a/configure
+++ b/configure
@@ -254,12 +254,12 @@ gdb_bin=$(command -v "gdb-multiarch" || command -v "gdb")
 
 if test -e "$source_path/.git"
 then
-    git_update=yes
+    git_submodules_action="update"
     git_submodules="ui/keycodemapdb"
     git_submodules="$git_submodules tests/fp/berkeley-testfloat-3"
     git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
 else
-    git_update=no
+    git_submodules_action="ignore"
     git_submodules=""
 
     if ! test -f "$source_path/ui/keycodemapdb/README"
@@ -1508,9 +1508,16 @@ for opt do
   ;;
   --with-git=*) git="$optarg"
   ;;
-  --enable-git-update) git_update=yes
+  --enable-git-update)
+      git_submodules_action="update"
+      echo "--enable-git-update deprecated, use --with-git-submodules=update"
   ;;
-  --disable-git-update) git_update=no
+  --disable-git-update)
+      git_submodules_action="validate"
+      echo "--disable-git-update deprecated, use --with-git-submodules=validate"
+  ;;
+  --with-git-submodules=*)
+      git_submodules_action="$optarg"
   ;;
   --enable-debug-mutex) debug_mutex=yes
   ;;
@@ -1566,6 +1573,21 @@ for opt do
   esac
 done
 
+case $git_submodules_action in
+    update|validate)
+        if test ! -e "$source_path/.git"; then
+            echo "ERROR: cannot $git_submodules_action git submodules without .git"
+            exit 1
+        fi
+    ;;
+    ignore)
+    ;;
+    *)
+        echo "ERROR: invalid --with-git-submodules= value '$git_submodules_action'"
+        exit 1
+    ;;
+esac
+
 libdir="${libdir:-$prefix/lib}"
 libexecdir="${libexecdir:-$prefix/libexec}"
 includedir="${includedir:-$prefix/include}"
@@ -1710,6 +1732,9 @@ Advanced options (experts only):
   --ninja=NINJA            use specified ninja [$ninja]
   --smbd=SMBD              use specified smbd [$smbd]
   --with-git=GIT           use specified git [$git]
+  --with-git-submodules=update   update git submodules (default if .git dir exists)
+  --with-git-submodules=validate fail if git submodules are not up to date
+  --with-git-submodules=ignore   do not update or check git submodules (default if no .git dir)
   --static                 enable static build [$static]
   --mandir=PATH            install man pages in PATH
   --datadir=PATH           install firmware in PATH/$qemu_suffix
@@ -1926,7 +1951,7 @@ python="$python -B"
 if test -z "$meson"; then
     if test "$explicit_python" = no && has meson && version_ge "$(meson --version)" 0.55.3; then
         meson=meson
-    elif test -e "${source_path}/.git" && test $git_update = 'yes' ; then
+    elif test $git_submodules_action != 'ignore' ; then
         meson=git
     elif test -e "${source_path}/meson/meson.py" ; then
         meson=internal
@@ -1994,7 +2019,7 @@ fi
 # Consult white-list to determine whether to enable werror
 # by default.  Only enable by default for git builds
 if test -z "$werror" ; then
-    if test -e "$source_path/.git" && \
+    if test "$git_submodules_action" != "ignore" && \
         { test "$linux" = "yes" || test "$mingw32" = "yes"; }; then
         werror="yes"
     else
@@ -3550,7 +3575,7 @@ fi
 case "$fdt" in
   auto | enabled | internal)
     # Simpler to always update submodule, even if not needed.
-    if test -e "${source_path}/.git" && test $git_update = 'yes' ; then
+    if test "$git_submodules_action" != "ignore"; then
       git_submodules="${git_submodules} dtc"
     fi
     ;;
@@ -4264,7 +4289,7 @@ fi
 case "$capstone" in
   auto | enabled | internal)
     # Simpler to always update submodule, even if not needed.
-    if test -e "${source_path}/.git" && test $git_update = 'yes' ; then
+    if test "$git_submodules_action" != "ignore"; then
       git_submodules="${git_submodules} capstone"
     fi
     ;;
@@ -5211,7 +5236,7 @@ fi
 case "$slirp" in
   auto | enabled | internal)
     # Simpler to always update submodule, even if not needed.
-    if test -e "${source_path}/.git" && test $git_update = 'yes' ; then
+    if test "$git_submodules_action" != "ignore"; then
       git_submodules="${git_submodules} slirp"
     fi
     ;;
@@ -5385,7 +5410,7 @@ if test "$cpu" = "s390x" ; then
     roms="$roms s390-ccw"
     # SLOF is required for building the s390-ccw firmware on s390x,
     # since it is using the libnet code from SLOF for network booting.
-    if test -e "${source_path}/.git" ; then
+    if test "$git_submodules_action" != "ignore"; then
       git_submodules="${git_submodules} roms/SLOF"
     fi
   fi
@@ -5423,8 +5448,8 @@ else
     cxx=
 fi
 
-if test $git_update = 'yes' ; then
-    (cd "${source_path}" && GIT="$git" "./scripts/git-submodule.sh" update "$git_submodules")
+if !(GIT="$git" "$source_path/scripts/git-submodule.sh" "$git_submodules_action" "$git_submodules"); then
+    exit 1
 fi
 
 config_host_mak="config-host.mak"
@@ -5435,7 +5460,7 @@ echo >> $config_host_mak
 echo all: >> $config_host_mak
 echo "GIT=$git" >> $config_host_mak
 echo "GIT_SUBMODULES=$git_submodules" >> $config_host_mak
-echo "GIT_UPDATE=$git_update" >> $config_host_mak
+echo "GIT_SUBMODULES_ACTION=$git_submodules_action" >> $config_host_mak
 
 echo "ARCH=$ARCH" >> $config_host_mak
 
diff --git a/scripts/git-submodule.sh b/scripts/git-submodule.sh
index 65ed877aef..e225d3a963 100755
--- a/scripts/git-submodule.sh
+++ b/scripts/git-submodule.sh
@@ -9,9 +9,14 @@ command=$1
 shift
 maybe_modules="$@"
 
+# if --with-git-submodules=ignore, do nothing
+test "$command" = "ignore" && exit 0
+
 test -z "$GIT" && GIT=git
 
-error() {
+cd "$(dirname "$0")/.."
+
+update_error() {
     echo "$0: $*"
     echo
     echo "Unable to automatically checkout GIT submodules '$modules'."
@@ -24,7 +29,7 @@ error() {
     echo "Alternatively you may disable automatic GIT submodule checkout"
     echo "with:"
     echo
-    echo " $ ./configure --disable-git-update"
+    echo " $ ./configure --with-git-submodules=validate"
     echo
     echo "and then manually update submodules prior to running make, with:"
     echo
@@ -33,6 +38,19 @@ error() {
     exit 1
 }
 
+validate_error() {
+    if test "$1" = "validate"; then
+        echo "GIT submodules checkout is out of date, and submodules"
+        echo "configured for validate only. Please run"
+        echo "  scripts/git-submodule.sh update $maybe_modules"
+        echo "from the source directory or call configure with"
+        echo "  --with-git-submodules=update"
+        echo "To disable GIT submodules validation, use"
+        echo "  --with-git-submodules=ignore"
+    fi
+    exit 1
+}
+
 modules=""
 for m in $maybe_modules
 do
@@ -52,18 +70,18 @@ then
 fi
 
 case "$command" in
-status)
+status|validate)
     if test -z "$maybe_modules"
     then
-         test -s ${substat} && exit 1 || exit 0
+         test -s ${substat} && validate_error "$command" || exit 0
     fi
 
-    test -f "$substat" || exit 1
+    test -f "$substat" || validate_error "$command"
     for module in $modules; do
         CURSTATUS=$($GIT submodule status $module)
         OLDSTATUS=$(cat $substat | grep $module)
         if test "$CURSTATUS" != "$OLDSTATUS"; then
-            exit 1
+            validate_error "$command"
         fi
     done
     exit 0
@@ -76,10 +94,10 @@ update)
     fi
 
     $GIT submodule update --init $modules 1>/dev/null
-    test $? -ne 0 && error "failed to update modules"
+    test $? -ne 0 && update_error "failed to update modules"
 
     $GIT submodule status $modules > "${substat}"
-    test $? -ne 0 && error "failed to save git submodule status" >&2
+    test $? -ne 0 && update_error "failed to save git submodule status" >&2
     ;;
 esac
 
-- 
2.29.2


