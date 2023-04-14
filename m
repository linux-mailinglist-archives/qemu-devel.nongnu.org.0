Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1416E1C0D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 07:56:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnCP8-0007Qf-Fw; Fri, 14 Apr 2023 01:55:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pnCOz-0007Od-Li
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 01:55:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pnCOk-0000Ju-94
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 01:55:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681451700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hoi18Z99d/5Y09VoN24QIWuhDsmKwXiy9nDSUT3ER8U=;
 b=h3y9dD+WxsWdVnkZ8vkgdCZQ98MFqn2L/uEBFf6zHB5krYj5YNbknoyAF4xXlxCIxDH0Cg
 aG+zo5KaQmm634khJO3b74GFVpu9UXmfuPK0zej/ceZSfek2T/xQFYRBh0NMixPfqwSt3L
 /2UFUW2hX6TH0YOXSndqu7Z0tKTL/NE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-iLZK1QPdNiWhTof4_J0xag-1; Fri, 14 Apr 2023 01:54:56 -0400
X-MC-Unique: iLZK1QPdNiWhTof4_J0xag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2C58101A54F;
 Fri, 14 Apr 2023 05:54:55 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DA75C1602A;
 Fri, 14 Apr 2023 05:54:55 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>, Kyle Evans <kevans@freebsd.org>,
 Beraldo Leal <bleal@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH v2 09/10] configure: remove --meson=;
 install meson to the pyvenv
Date: Fri, 14 Apr 2023 01:54:48 -0400
Message-Id: <20230414055449.4028284-10-jsnow@redhat.com>
In-Reply-To: <20230414055449.4028284-1-jsnow@redhat.com>
References: <20230414055449.4028284-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

This patch changes how we detect and install meson.

The previous patch creates a lightweight Python virtual environment
unconditionally using the user's configured $python that inherits system
packages. If Meson is installed there and meets our minimum version
requirements, we will use that Meson.

In the event that Meson is installed but *not for the chosen Python
interpreter*, not found, or of insufficient version, we will attempt to
install Meson from source into the newly created Python virtual
environment.

At present, the source is obtained in the same manner as it has been;
preferring git submodules first and relying on vendored source as a
backup.

This patch (as of now) does *not* connect to PyPI and will work offline
for all supported build platforms.

As a result of this patch, the Python interpreter we use for both our
own build scripts *and* Meson extensions are always known to be the
exact same Python. As a further benefit, there will also be a symlink
available in the build directory that points to the correct, configured
python and can be used by e.g. manual tests to invoke the correct,
configured Python unambiguously.

Notes:

- The meson git submodule can be removed in favor of just loading meson
  from PyPI; but we probably want a configure flag to toggle
  online/offline behavior. (What do we want the default to be? Online is
  my guess.)

- Installing meson from the source tree for vendored cases (tarball
  releases) can be replaced by vendoring a .whl file instead. This will
  remove some of the `--no-use-pep517` hackiness and alleviates the
  requirement that users install the python3 'wheel' dependency.

- Most of this logic can be moved into mkvenv.py, *especially* if the
  meson git submodule is removed.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 configure                           | 104 +++++++++++++++-------------
 .gitlab-ci.d/buildtest-template.yml |   4 +-
 2 files changed, 59 insertions(+), 49 deletions(-)

diff --git a/configure b/configure
index 03278fd891..c8f73d4ff7 100755
--- a/configure
+++ b/configure
@@ -721,8 +721,6 @@ for opt do
   ;;
   --skip-meson) skip_meson=yes
   ;;
-  --meson=*) meson="$optarg"
-  ;;
   --ninja=*) ninja="$optarg"
   ;;
   --smbd=*) smbd="$optarg"
@@ -1006,7 +1004,6 @@ Advanced options (experts only):
   --cross-prefix-ARCH=PREFIX cross compiler prefix when building ARCH guest test cases
   --make=MAKE              use specified make [$make]
   --python=PYTHON          use specified python [$python]
-  --meson=MESON            use specified meson [$meson]
   --ninja=NINJA            use specified ninja [$ninja]
   --smbd=SMBD              use specified smbd [$smbd]
   --with-git=GIT           use specified git [$git]
@@ -1079,7 +1076,8 @@ fi
 
 # Resolve PATH
 python="$(command -v "$python")"
-explicit_python=yes
+# This variable is intended to be used only for error messages:
+target_python=$python
 
 # Create a Python virtual environment using our configured python.
 # The stdout of this script will be the location of a symlink that
@@ -1106,58 +1104,70 @@ fi
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
+pip_install() {
+    $python -m pip install -v \
+            --disable-pip-version-check \
+            --no-index \
+            "$@"
 }
 
-if test -z "$meson"; then
-    if test "$explicit_python" = no && has_meson && version_ge "$(meson --version)" 0.61.5; then
-        meson=meson
-    elif test "$git_submodules_action" != 'ignore' ; then
-        meson=git
-    elif test -e "${source_path}/meson/meson.py" ; then
-        meson=internal
+# OK, let's have some fun!
+
+# This install command is intended to either fail or be a NOP;
+# because we're offline, it's just a convenient version check.
+if ! pip_install 'meson>=0.61.5'; then
+    # Either we don't have Meson, or our Meson is too old.
+    # (Future revisions of this patchset can be less chatty.)
+    if test -e pyvenv/bin/meson; then
+        echo "Meson in pyvenv is too old: $(pyvenv/bin/meson --version)"
+    elif has meson ; then
+        echo "Meson was found installed on your system," \
+             "but not for the configured Python interpreter ($target_python)."
+        echo "(Hint: check '$(which meson)' to see which interpreter its shebang uses.)"
     else
-        if test "$explicit_python" = yes; then
-            error_exit "--python requires using QEMU's embedded Meson distribution, but it was not found."
-        else
-            error_exit "Meson not found.  Use --meson=/path/to/meson"
+        echo "Meson was not found."
+    fi
+
+    # OK, but can we fix it, though? :~)
+    if test "$git_submodules_action" != 'ignore' ; then
+        git_submodules="${git_submodules} meson"
+        echo "Attempting to install meson from git submodule ..."
+        # Stolen from later in the configure file.
+        # Is it a problem if we front-load this now and run it again later?
+        if ! (GIT="$git" "$source_path/scripts/git-submodule.sh" "$git_submodules_action" "$git_submodules"); then
+            exit 1
         fi
+    elif test -e "${source_path}/meson/setup.cfg" ; then
+        echo "Attempting to install meson from vendored source ..."
+    else
+        # In the future, we could use PyPI as a source if the user allows it.
+        # For now, you're outta luck!
+        error_exit "A suitable version of Meson was not found."
     fi
-else
-    # Meson uses its own Python interpreter to invoke other Python scripts,
-    # but the user wants to use the one they specified with --python.
+
+    # If we're here, we have the meson source and we can attempt to
+    # install it into our venv.
+
+    # We want to install meson with --no-use-pep517 if possible,
+    # because it avoids needing a 'wheel' dependency. Old versions
+    # of pip do this by default, so test for the behavior.
     #
-    # We do not want to override the distro Python interpreter (and sometimes
-    # cannot: for example in Homebrew /usr/bin/meson is a bash script), so
-    # just require --meson=git|internal together with --python.
-    if test "$explicit_python" = yes; then
-        case "$meson" in
-            git | internal) ;;
-            *) error_exit "--python requires using QEMU's embedded Meson distribution." ;;
-        esac
+    # --no-build-isolation was added to pip 10.0.
+    # --no-use-pep517 was added ... sometime after 18.1?
+    pip_flags='--no-build-isolation'
+    if $python -m pip install --help | grep 'no-use-pep517' > /dev/null 2>&1 ; then
+        pip_flags="${pip_flags} --no-use-pep517"
+    fi
+    if ! pip_install $pip_flags "${source_path}/meson" ; then
+        exit 1
     fi
 fi
 
-if test "$meson" = git; then
-    git_submodules="${git_submodules} meson"
-fi
-
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
 
 # Probe for ninja
 
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


