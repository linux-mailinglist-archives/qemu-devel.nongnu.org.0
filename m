Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A60316ED5D0
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 22:04:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr2Oz-0007sA-PO; Mon, 24 Apr 2023 16:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2Ow-0007oM-4S
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:03:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2Ou-0000yJ-A2
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:03:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682366583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HtFYttd8CqMAVMoMy3j2CRbrsXLDDEtEXCCLyjF0Gl4=;
 b=b7t4QcqoPFf7sOKPbM7s6/HQYokbiRdSO+yofkUWNdfrlT8Qsps4eCZy+XKh1vHidNEfOr
 mFDItXjI7ztGFjNIXQMZFNugosYMEccE3yi9+A+YG/OtWC3eAnSdXK+Ti5G8v9LWxSth3K
 d2MOVe/58oE2OLbmQN0+Nh8zEyH//Q0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-R3rtj1TON_O2RoKRNcFplw-1; Mon, 24 Apr 2023 16:03:00 -0400
X-MC-Unique: R3rtj1TON_O2RoKRNcFplw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D271185A794;
 Mon, 24 Apr 2023 20:03:00 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58CD21121319;
 Mon, 24 Apr 2023 20:02:59 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH v3 14/20] configure: use 'mkvenv ensure meson' to
 bootstrap meson
Date: Mon, 24 Apr 2023 16:02:42 -0400
Message-Id: <20230424200248.1183394-15-jsnow@redhat.com>
In-Reply-To: <20230424200248.1183394-1-jsnow@redhat.com>
References: <20230424200248.1183394-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This commit changes how we detect and install meson. It notably removes
'--meson='.

The previous patch creates a lightweight Python virtual environment
unconditionally using the user's configured $python that inherits system
packages. If Meson is installed there and meets our minimum version
requirements, we will use that Meson.

In the event that Meson is installed but *not for the chosen Python
interpreter*, not found, or of insufficient version, we will attempt to
install Meson from vendored source into the newly created Python virtual
environment. This vendored installation is considered to replace the
mechanism from prior tarball distributions.

This commit restores the ability to use a system meson, but in turn
temporarily removes the ability to use a meson as obtained from the
internet at configure-time (git submodules, as it stood prior to this
patch); that ability will be restored in the next commit.

As a result of this patch, the Python interpreter we use for both our
own build scripts *and* Meson extensions are always known to be the
exact same Python. As a further benefit, there will also be a symlink
available in the build directory that points to the correct, configured
python and can be used by e.g. manual tests to invoke the correct,
configured Python unambiguously.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 configure                           | 72 ++++++++---------------------
 .gitlab-ci.d/buildtest-template.yml |  4 +-
 2 files changed, 21 insertions(+), 55 deletions(-)

diff --git a/configure b/configure
index 462fe604d6..e9947369b2 100755
--- a/configure
+++ b/configure
@@ -731,8 +731,6 @@ for opt do
   ;;
   --skip-meson) skip_meson=yes
   ;;
-  --meson=*) meson="$optarg"
-  ;;
   --ninja=*) ninja="$optarg"
   ;;
   --smbd=*) smbd="$optarg"
@@ -1016,7 +1014,6 @@ Advanced options (experts only):
   --cross-prefix-ARCH=PREFIX cross compiler prefix when building ARCH guest test cases
   --make=MAKE              use specified make [$make]
   --python=PYTHON          use specified python [$python]
-  --meson=MESON            use specified meson [$meson]
   --ninja=NINJA            use specified ninja [$ninja]
   --smbd=SMBD              use specified smbd [$smbd]
   --with-git=GIT           use specified git [$git]
@@ -1089,7 +1086,8 @@ fi
 
 # Resolve PATH
 python="$(command -v "$python")"
-explicit_python=yes
+# This variable is intended to be used only for error messages:
+target_python=$python
 
 # Create a Python virtual environment using our configured python.
 # The stdout of this script will be the location of a symlink that
@@ -1101,7 +1099,6 @@ explicit_python=yes
 # - venv is cleared if it exists already;
 # - venv is allowed to use system packages;
 # - all setup is performed **offline**;
-# - No packages are installed by default;
 # - pip is not installed into the venv when possible,
 #   but ensurepip is called as a fallback when necessary.
 
@@ -1116,58 +1113,27 @@ fi
 # Suppress writing compiled files
 python="$python -B"
 
-has_meson() {
-  local python_dir=$(dirname "$python")
-  # PEP405: pyvenv.cfg is either adjacent to the Python executable
-  # or one directory above
-  if test -f $python_dir/pyvenv.cfg || test -f $python_dir/../pyvenv.cfg; then
-    # Ensure that Meson and Python come from the same virtual environment
-    test -x "$python_dir/meson" &&
-      test "$(command -v meson)" -ef "$python_dir/meson"
-  else
-    has meson
-  fi
-}
 
-if test -z "$meson"; then
-    if test "$explicit_python" = no && has_meson && version_ge "$(meson --version)" 0.61.5; then
-        meson=meson
-    elif test "$git_submodules_action" != 'ignore' ; then
-        meson=git
-    elif test -e "${source_path}/meson/meson.py" ; then
-        meson=internal
-    else
-        if test "$explicit_python" = yes; then
-            error_exit "--python requires using QEMU's embedded Meson distribution, but it was not found."
-        else
-            error_exit "Meson not found.  Use --meson=/path/to/meson"
-        fi
+if ! $python "${source_path}/python/scripts/mkvenv.py" ensure \
+     --dir "${source_path}/python/wheels" \
+     "meson>=0.61.5" ;
+then
+    # We're very out of luck. Try to give a good diagnostic.
+    if test -e pyvenv/bin/meson; then
+        echo "Meson is too old: $(pyvenv/bin/meson --version)"
+    elif has meson ; then
+        echo "Meson was found installed on your system," \
+             "but not for the configured Python interpreter ($target_python)."
+        echo "(Hint: check '$(which meson)' to see which interpreter its shebang uses.)"
     fi
-else
-    # Meson uses its own Python interpreter to invoke other Python scripts,
-    # but the user wants to use the one they specified with --python.
-    #
-    # We do not want to override the distro Python interpreter (and sometimes
-    # cannot: for example in Homebrew /usr/bin/meson is a bash script), so
-    # just require --meson=git|internal together with --python.
-    if test "$explicit_python" = yes; then
-        case "$meson" in
-            git | internal) ;;
-            *) error_exit "--python requires using QEMU's embedded Meson distribution." ;;
-        esac
-    fi
-fi
-
-if test "$meson" = git; then
-    git_submodules="${git_submodules} meson"
+    exit 1
 fi
 
-case "$meson" in
-    git | internal)
-        meson="$python ${source_path}/meson/meson.py"
-        ;;
-    *) meson=$(command -v "$meson") ;;
-esac
+# At this point, we expect Meson to be installed and available.
+# We expect mkvenv or pip to have created pyvenv/bin/meson for us.
+# We ignore PATH completely here: we want to use the venv's Meson
+# *exclusively*.
+meson="$(cd pyvenv/bin; pwd)/meson"
 
 echo "MKVENV ok!"
 
diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index a6cfe9be97..7edb50b760 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -12,12 +12,12 @@
     - mkdir build
     - cd build
     - ../configure --enable-werror --disable-docs --enable-fdt=system
-          ${LD_JOBS:+--meson=git} ${TARGETS:+--target-list="$TARGETS"}
+          ${TARGETS:+--target-list="$TARGETS"}
           $CONFIGURE_ARGS ||
       { cat config.log meson-logs/meson-log.txt && exit 1; }
     - if test -n "$LD_JOBS";
       then
-        ../meson/meson.py configure . -Dbackend_max_links="$LD_JOBS" ;
+        pyvenv/bin/meson configure . -Dbackend_max_links="$LD_JOBS" ;
       fi || exit 1;
     - make -j"$JOBS"
     - if test -n "$MAKE_CHECK_ARGS";
-- 
2.39.2


