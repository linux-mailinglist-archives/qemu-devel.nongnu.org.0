Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BF86FEA73
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 05:58:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwxOO-0007eT-1x; Wed, 10 May 2023 23:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pwxOK-0007bX-Ua
 for qemu-devel@nongnu.org; Wed, 10 May 2023 23:54:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pwxOJ-0005M4-0u
 for qemu-devel@nongnu.org; Wed, 10 May 2023 23:54:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683777294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ifzFBEc3+G0N7VEsrEdz+h68NntXhwbLaXeeY+WI1Og=;
 b=bBIOCiRW4TU0bh0A3tUkkVZDOcPdGCSk/8jLAQPhQQ6Xkz675QPq8mt+C7PY35ZLxm48G/
 G4Nd9wp2Z/PEj1PHSioIVYK+HDEtNelyAKqDzBQ/Eu+pK0s5tSlIb3C+KFnFxtoN42IJpc
 3vzzn4E9hmq3Rw3dLRe3gzqRy2x3yqQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-ooZxuTg7PXSeAjnIHmjFAA-1; Wed, 10 May 2023 23:54:51 -0400
X-MC-Unique: ooZxuTg7PXSeAjnIHmjFAA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B16CB29AB3EF;
 Thu, 11 May 2023 03:54:50 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03D5940C2076;
 Thu, 11 May 2023 03:54:49 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Roth <michael.roth@amd.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 17/27] configure: use 'mkvenv ensure meson' to bootstrap meson
Date: Wed, 10 May 2023 23:54:25 -0400
Message-Id: <20230511035435.734312-18-jsnow@redhat.com>
In-Reply-To: <20230511035435.734312-1-jsnow@redhat.com>
References: <20230511035435.734312-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Currently, configure creates a lightweight Python virtual environment
unconditionally using the user's configured $python that inherits system
packages. Temporarily, we forced the use of meson source present via git
submodule or in the release tarball.

With this patch, we restore the ability to use a system-provided meson:

If Meson is installed in the build venv and meets our minimum version
requirements, we will use that Meson. This includes a system provided
meson, which would be visible via system-site packages inside the venv.

In the event that Meson is installed but *not for the chosen Python
interpreter*, not found, or of insufficient version, we will attempt to
install Meson from vendored source into the newly created Python virtual
environment. This vendored installation replaces both the git submodule
and tarball source mechanisms for sourcing meson.

As a result of this patch, the Python interpreter we use for both our
own build scripts *and* Meson extensions are always known to be the
exact same Python. As a further benefit, there will also be a symlink
available in the build directory that points to the correct, configured
python and can be used by e.g. manual tests to invoke the correct,
configured Python unambiguously.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 configure                           | 80 ++++++++++-------------------
 .gitlab-ci.d/buildtest-template.yml |  4 +-
 python/scripts/mkvenv.py            |  4 ++
 3 files changed, 32 insertions(+), 56 deletions(-)

diff --git a/configure b/configure
index 1d7db92ee3..6e4499a68a 100755
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
@@ -1017,7 +1015,6 @@ Advanced options (experts only):
   --cross-prefix-ARCH=PREFIX cross compiler prefix when building ARCH guest test cases
   --make=MAKE              use specified make [$make]
   --python=PYTHON          use specified python [$python]
-  --meson=MESON            use specified meson [$meson]
   --ninja=NINJA            use specified ninja [$ninja]
   --smbd=SMBD              use specified smbd [$smbd]
   --with-git=GIT           use specified git [$git]
@@ -1090,7 +1087,6 @@ fi
 
 # Resolve PATH
 python="$(command -v "$python")"
-explicit_python=yes
 
 # Create a Python virtual environment using our configured python.
 # The stdout of this script will be the location of a symlink that
@@ -1102,7 +1098,6 @@ explicit_python=yes
 # - venv is cleared if it exists already;
 # - venv is allowed to use system packages;
 # - all setup is performed **offline**;
-# - No packages are installed by default;
 # - pip is not installed into the venv when possible,
 #   but ensurepip is called as a fallback when necessary.
 
@@ -1117,59 +1112,36 @@ fi
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
-    fi
+if ! $python "${source_path}/python/scripts/mkvenv.py" ensure \
+     --dir "${source_path}/python/wheels" \
+     --diagnose "meson" \
+     "meson>=0.61.5" ;
+then
+    exit 1
+fi
+
+# At this point, we expect Meson to be installed and available.
+# We expect mkvenv or pip to have created pyvenv/bin/meson for us.
+# We ignore PATH completely here: we want to use the venv's Meson
+# *exclusively*.
+
+# "mkvenv ensure" has a limitation compared to "pip install": it is not
+# able to create launcher .exe files on Windows.  This limitation exists
+# because "py.exe" is not guaranteed to exist on the machine (pip/setuptools
+# work around the issue by bundling the .exe files as resources).
+# This is not a problem for msys, since it emulates a POSIX environment;
+# it is also okay for programs that meson.build looks up with find_program(),
+# because in that case Meson checks the file for a shebang line.  However,
+# when meson wants to invoke itself as part of a build recipe, we need
+# to convince it to put the python interpreter in front of the path to the
+# script.  To do so, run it using '-m'.
+if test "$targetos" = windows; then
+  meson="$python -m mesonbuild.mesonmain"
 else
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
+  meson="$(cd pyvenv/bin; pwd)/meson"
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
-
 # Probe for ninja
 
 if test -z "$ninja"; then
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
diff --git a/python/scripts/mkvenv.py b/python/scripts/mkvenv.py
index 1e072b3df3..31193b3b22 100644
--- a/python/scripts/mkvenv.py
+++ b/python/scripts/mkvenv.py
@@ -530,6 +530,10 @@ def _get_entry_points() -> Iterator[Dict[str, str]]:
         # launcher copied to foo.exe.  Unfortunately there is no guarantee that
         # py.exe exists on the machine.  Creating the script like this is
         # enough for msys and meson, both of which understand shebang lines.
+        # It does requires some care when invoking meson however, which is
+        # worked around in configure.  Note that a .exe launcher is needed
+        # and not for example a batch file, because the CreateProcess API
+        # (used by Ninja) cannot start them.
         with open(script_path, "w", encoding="UTF-8") as file:
             file.write(script)
         mode = os.stat(script_path).st_mode | stat.S_IEXEC
-- 
2.40.0


