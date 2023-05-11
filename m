Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77FA6FEA61
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 05:57:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwxOW-0007ij-Co; Wed, 10 May 2023 23:55:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pwxOT-0007hP-KZ
 for qemu-devel@nongnu.org; Wed, 10 May 2023 23:55:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pwxOR-0005Pg-6L
 for qemu-devel@nongnu.org; Wed, 10 May 2023 23:55:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683777302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U004erHmG70+lrMAoYJali7WdcR0MAFZELRtY9tmr5g=;
 b=Dco41GW/1WjoOAzlsSe+raXE9KsncNScJKwHPjmfr+ycOx/TSb4QA026TuoaCYijsEDpxI
 saORpfewTrzi5zCxXCpvCs6VuRY7GFYMbUmiEnbjRP6EUv4Dw6xgun7N3rev+02Dq05FE/
 Kp0q9Lp9axY63FRnpu7W1fJbzrMay5I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-0UgPOOqgMwaNPhEm2kyNMg-1; Wed, 10 May 2023 23:54:59 -0400
X-MC-Unique: 0UgPOOqgMwaNPhEm2kyNMg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E6D329AB3EB;
 Thu, 11 May 2023 03:54:58 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7D6640C2076;
 Thu, 11 May 2023 03:54:57 +0000 (UTC)
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
Subject: [PATCH 27/27] mkvenv.py: experiment;
 use distlib to generate script entry points
Date: Wed, 10 May 2023 23:54:35 -0400
Message-Id: <20230511035435.734312-28-jsnow@redhat.com>
In-Reply-To: <20230511035435.734312-1-jsnow@redhat.com>
References: <20230511035435.734312-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This is an experiment: by using pip's internal vendored distlib, we can
generate script entry points for Windows, Mac and Linux using distlib's
mechanisms. This is the same mechanism used when running "pip install",
so it will be consistent with the most common method of package
installation on all platforms. It also allows us to delete a good bit of
vendored/borrowed code from inside of mkvenv.py, so there's less to
maintain and the license might be more straightforward.

As a downside, if we're not willing to actually add a distlib
requirement, we have to piggy-back on pip's vendored version, which
could have downsides if they move our cheese in the future.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 configure                |  16 +-----
 python/scripts/mkvenv.py | 117 +++++++++++++--------------------------
 python/setup.cfg         |   7 ++-
 3 files changed, 46 insertions(+), 94 deletions(-)

diff --git a/configure b/configure
index ff654a9f45..b559bdc040 100755
--- a/configure
+++ b/configure
@@ -1147,21 +1147,7 @@ fi
 # We ignore PATH completely here: we want to use the venv's Meson
 # *exclusively*.
 
-# "mkvenv ensure" has a limitation compared to "pip install": it is not
-# able to create launcher .exe files on Windows.  This limitation exists
-# because "py.exe" is not guaranteed to exist on the machine (pip/setuptools
-# work around the issue by bundling the .exe files as resources).
-# This is not a problem for msys, since it emulates a POSIX environment;
-# it is also okay for programs that meson.build looks up with find_program(),
-# because in that case Meson checks the file for a shebang line.  However,
-# when meson wants to invoke itself as part of a build recipe, we need
-# to convince it to put the python interpreter in front of the path to the
-# script.  To do so, run it using '-m'.
-if test "$targetos" = windows; then
-  meson="$python -m mesonbuild.mesonmain"
-else
-  meson="$(cd pyvenv/bin; pwd)/meson"
-fi
+meson="$(cd pyvenv/bin; pwd)/meson"
 
 # Conditionally ensure Sphinx is installed.
 
diff --git a/python/scripts/mkvenv.py b/python/scripts/mkvenv.py
index 8e097e4759..8faec0957b 100644
--- a/python/scripts/mkvenv.py
+++ b/python/scripts/mkvenv.py
@@ -63,14 +63,12 @@
 import re
 import shutil
 import site
-import stat
 import subprocess
 import sys
 import sysconfig
 from types import SimpleNamespace
 from typing import (
     Any,
-    Dict,
     Iterator,
     Optional,
     Sequence,
@@ -376,7 +374,7 @@ def _stringify(data: Union[str, bytes]) -> str:
     print(builder.get_value("env_exe"))
 
 
-def _gen_importlib(packages: Sequence[str]) -> Iterator[Dict[str, str]]:
+def _gen_importlib(packages: Sequence[str]) -> Iterator[str]:
     # pylint: disable=import-outside-toplevel
     # pylint: disable=no-name-in-module
     # pylint: disable=import-error
@@ -394,14 +392,7 @@ def _gen_importlib(packages: Sequence[str]) -> Iterator[Dict[str, str]]:
             distribution,
         )
 
-    # Borrowed from CPython (Lib/importlib/metadata/__init__.py)
-    pattern = re.compile(
-        r"(?P<module>[\w.]+)\s*"
-        r"(:\s*(?P<attr>[\w.]+)\s*)?"
-        r"((?P<extras>\[.*\])\s*)?$"
-    )
-
-    def _generator() -> Iterator[Dict[str, str]]:
+    def _generator() -> Iterator[str]:
         for package in packages:
             try:
                 entry_points = distribution(package).entry_points
@@ -415,34 +406,17 @@ def _generator() -> Iterator[Dict[str, str]]:
             )
 
             for entry_point in entry_points:
-                # Python 3.8 doesn't have 'module' or 'attr' attributes
-                if not (
-                    hasattr(entry_point, "module")
-                    and hasattr(entry_point, "attr")
-                ):
-                    match = pattern.match(entry_point.value)
-                    assert match is not None
-                    module = match.group("module")
-                    attr = match.group("attr")
-                else:
-                    module = entry_point.module
-                    attr = entry_point.attr
-                yield {
-                    "name": entry_point.name,
-                    "module": module,
-                    "import_name": attr,
-                    "func": attr,
-                }
+                yield f"{entry_point.name} = {entry_point.value}"
 
     return _generator()
 
 
-def _gen_pkg_resources(packages: Sequence[str]) -> Iterator[Dict[str, str]]:
+def _gen_pkg_resources(packages: Sequence[str]) -> Iterator[str]:
     # pylint: disable=import-outside-toplevel
     # Bundled with setuptools; has a good chance of being available.
     import pkg_resources
 
-    def _generator() -> Iterator[Dict[str, str]]:
+    def _generator() -> Iterator[str]:
         for package in packages:
             try:
                 eps = pkg_resources.get_entry_map(package, "console_scripts")
@@ -450,28 +424,11 @@ def _generator() -> Iterator[Dict[str, str]]:
                 continue
 
             for entry_point in eps.values():
-                yield {
-                    "name": entry_point.name,
-                    "module": entry_point.module_name,
-                    "import_name": ".".join(entry_point.attrs),
-                    "func": ".".join(entry_point.attrs),
-                }
+                yield str(entry_point)
 
     return _generator()
 
 
-# Borrowed/adapted from pip's vendored version of distlib:
-SCRIPT_TEMPLATE = r"""#!{python_path:s}
-# -*- coding: utf-8 -*-
-import re
-import sys
-from {module:s} import {import_name:s}
-if __name__ == '__main__':
-    sys.argv[0] = re.sub(r'(-script\.pyw|\.exe)?$', '', sys.argv[0])
-    sys.exit({func:s}())
-"""
-
-
 def generate_console_scripts(
     packages: Sequence[str],
     python_path: Optional[str] = None,
@@ -496,7 +453,7 @@ def generate_console_scripts(
     if not packages:
         return
 
-    def _get_entry_points() -> Iterator[Dict[str, str]]:
+    def _get_entry_points() -> Iterator[str]:
         """Python 3.7 compatibility shim for iterating entry points."""
         # Python 3.8+, or Python 3.7 with importlib_metadata installed.
         try:
@@ -515,34 +472,32 @@ def _get_entry_points() -> Iterator[Dict[str, str]]:
                 "Use Python 3.8+, or install importlib-metadata or setuptools."
             ) from exc
 
+    # Try to load distlib, with a fallback to pip's vendored version.
+    # We perform the loading here, just-in-time, so it may occur after
+    # a potential call to ensurepip in checkpip().
+    # pylint: disable=import-outside-toplevel
+    try:
+        from distlib import scripts
+    except ImportError:
+        try:
+            # Reach into pip's cookie jar:
+            from pip._vendor.distlib import scripts  # type: ignore
+        except ImportError as exc:
+            logger.exception("failed to locate distlib")
+            raise Ouch(
+                "distlib not found, can't generate script shims."
+            ) from exc
+
+    maker = scripts.ScriptMaker(None, bin_path)
+    maker.variants = {""}
+    maker.clobber = False
+
     for entry_point in _get_entry_points():
-        script_path = os.path.join(bin_path, entry_point["name"])
-        script = SCRIPT_TEMPLATE.format(python_path=python_path, **entry_point)
+        for filename in maker.make(entry_point):
+            logger.debug("wrote console_script '%s'", filename)
 
-        # If the script already exists (in any form), do not overwrite
-        # it nor recreate it in a new format.
-        suffixes = ("", ".exe", "-script.py", "-script.pyw")
-        if any(os.path.exists(f"{script_path}{s}") for s in suffixes):
-            continue
 
-        # FIXME: this is only correct for POSIX systems.  On Windows, the
-        # script source should be written to foo-script.py, and the py.exe
-        # launcher copied to foo.exe.  Unfortunately there is no guarantee that
-        # py.exe exists on the machine.  Creating the script like this is
-        # enough for msys and meson, both of which understand shebang lines.
-        # It does requires some care when invoking meson however, which is
-        # worked around in configure.  Note that a .exe launcher is needed
-        # and not for example a batch file, because the CreateProcess API
-        # (used by Ninja) cannot start them.
-        with open(script_path, "w", encoding="UTF-8") as file:
-            file.write(script)
-        mode = os.stat(script_path).st_mode | stat.S_IEXEC
-        os.chmod(script_path, mode)
-
-        logger.debug("wrote '%s'", script_path)
-
-
-def checkpip() -> None:
+def checkpip() -> bool:
     """
     Debian10 has a pip that's broken when used inside of a virtual environment.
 
@@ -553,12 +508,12 @@ def checkpip() -> None:
         import pip._internal  # type: ignore  # noqa: F401
 
         logger.debug("pip appears to be working correctly.")
-        return
+        return False
     except ModuleNotFoundError as exc:
         if exc.name == "pip._internal":
             # Uh, fair enough. They did say "internal".
             # Let's just assume it's fine.
-            return
+            return False
         logger.warning("pip appears to be malfunctioning: %s", str(exc))
 
     check_ensurepip("pip appears to be non-functional, and ")
@@ -570,6 +525,7 @@ def checkpip() -> None:
         check=True,
     )
     logger.debug("Pip is now (hopefully) repaired!")
+    return True
 
 
 def pkgname_from_depspec(dep_spec: str) -> str:
@@ -787,7 +743,12 @@ def post_venv_setup() -> None:
     """
     logger.debug("post_venv_setup()")
     # Test for a broken pip (Debian 10 or derivative?) and fix it if needed
-    checkpip()
+    if checkpip():
+        # We ran ensurepip. We need to re-run post_init...!
+        args = [sys.executable, __file__, "post_init"]
+        subprocess.run(args, check=True)
+        return
+
     # Finally, generate a 'pip' script so the venv is usable in a normal
     # way from the CLI. This only happens when we inherited pip from a
     # parent/system-site and haven't run ensurepip in some way.
diff --git a/python/setup.cfg b/python/setup.cfg
index 7d75c168a8..4ea016876b 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -111,6 +111,12 @@ ignore_missing_imports = True
 [mypy-pkg_resources]
 ignore_missing_imports = True
 
+[mypy-distlib]
+ignore_missing_imports = True
+
+[mypy-pip._vendor.distlib]
+ignore_missing_imports = True
+
 [pylint.messages control]
 # Disable the message, report, category or checker with the given id(s). You
 # can either give multiple identifiers separated by comma (,) or put this
@@ -123,7 +129,6 @@ ignore_missing_imports = True
 # --disable=W".
 disable=consider-using-f-string,
         consider-using-with,
-        fixme,
         too-many-arguments,
         too-many-function-args,  # mypy handles this with less false positives.
         too-many-instance-attributes,
-- 
2.40.0


