Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC366FEA59
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 05:56:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwxOF-0007ZD-RW; Wed, 10 May 2023 23:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pwxOD-0007YE-HH
 for qemu-devel@nongnu.org; Wed, 10 May 2023 23:54:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pwxOB-0005KA-7X
 for qemu-devel@nongnu.org; Wed, 10 May 2023 23:54:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683777286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PxaAwKOPbMGTZNCaDLb42ViJXWEqLjcyJm3tFZWILk8=;
 b=RD+unl6OcKvz3nb7o0wnmp2fxK2Sk0redWhLzdFdDGxVkhIqR2++AsdxLAjIAM0k+Wbh3J
 lMfWYWAgoBeT/o+7fziHzt6A2GKqTb4Ohy/3YJqUiN6LhpIa/7g5iQUnCu3sbr2nXKxfIG
 +6F4tpkiHpbOnylUN7JeT3aFOTvkO9A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-XGJaW7u4ONS4WfmztcadDA-1; Wed, 10 May 2023 23:54:43 -0400
X-MC-Unique: XGJaW7u4ONS4WfmztcadDA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D348E1C05EA7;
 Thu, 11 May 2023 03:54:42 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25D0840C2076;
 Thu, 11 May 2023 03:54:42 +0000 (UTC)
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
Subject: [PATCH 08/27] mkvenv: add console script entry point generation
Date: Wed, 10 May 2023 23:54:16 -0400
Message-Id: <20230511035435.734312-9-jsnow@redhat.com>
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

When creating a virtual environment that inherits system packages,
script entry points (like "meson", "sphinx-build", etc) are not
re-generated with the correct shebang. When you are *inside* of the
venv, this is not a problem, but if you are *outside* of it, you will
not have a script that engages the virtual environment appropriately.

Add a mechanism that generates new entry points for pre-existing
packages so that we can use these scripts to run "meson",
"sphinx-build", "pip", unambiguously inside the venv.

NOTE: the "FIXME" command regarding Windows launcher binaries can be
solved by using distlib.  distlib is usually not installed on Linux
distribution, but it is a dependency of pip (and therefore should be
much more commonly available) on msys, where it is most useful.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/scripts/mkvenv.py | 174 ++++++++++++++++++++++++++++++++++++++-
 python/setup.cfg         |   1 +
 2 files changed, 172 insertions(+), 3 deletions(-)

diff --git a/python/scripts/mkvenv.py b/python/scripts/mkvenv.py
index d9ba2e1532..9c99122603 100644
--- a/python/scripts/mkvenv.py
+++ b/python/scripts/mkvenv.py
@@ -54,12 +54,15 @@
 import re
 import shutil
 import site
+import stat
 import subprocess
 import sys
 import sysconfig
 from types import SimpleNamespace
 from typing import (
     Any,
+    Dict,
+    Iterator,
     Optional,
     Sequence,
     Union,
@@ -353,6 +356,168 @@ def _stringify(data: Union[str, bytes]) -> str:
     print(builder.get_value("env_exe"))
 
 
+def _gen_importlib(packages: Sequence[str]) -> Iterator[Dict[str, str]]:
+    # pylint: disable=import-outside-toplevel
+    # pylint: disable=no-name-in-module
+    # pylint: disable=import-error
+    try:
+        # First preference: Python 3.8+ stdlib
+        from importlib.metadata import (  # type: ignore
+            PackageNotFoundError,
+            distribution,
+        )
+    except ImportError as exc:
+        logger.debug("%s", str(exc))
+        # Second preference: Commonly available PyPI backport
+        from importlib_metadata import (  # type: ignore
+            PackageNotFoundError,
+            distribution,
+        )
+
+    # Borrowed from CPython (Lib/importlib/metadata/__init__.py)
+    pattern = re.compile(
+        r"(?P<module>[\w.]+)\s*"
+        r"(:\s*(?P<attr>[\w.]+)\s*)?"
+        r"((?P<extras>\[.*\])\s*)?$"
+    )
+
+    def _generator() -> Iterator[Dict[str, str]]:
+        for package in packages:
+            try:
+                entry_points = distribution(package).entry_points
+            except PackageNotFoundError:
+                continue
+
+            # The EntryPoints type is only available in 3.10+,
+            # treat this as a vanilla list and filter it ourselves.
+            entry_points = filter(
+                lambda ep: ep.group == "console_scripts", entry_points
+            )
+
+            for entry_point in entry_points:
+                # Python 3.8 doesn't have 'module' or 'attr' attributes
+                if not (
+                    hasattr(entry_point, "module")
+                    and hasattr(entry_point, "attr")
+                ):
+                    match = pattern.match(entry_point.value)
+                    assert match is not None
+                    module = match.group("module")
+                    attr = match.group("attr")
+                else:
+                    module = entry_point.module
+                    attr = entry_point.attr
+                yield {
+                    "name": entry_point.name,
+                    "module": module,
+                    "import_name": attr,
+                    "func": attr,
+                }
+
+    return _generator()
+
+
+def _gen_pkg_resources(packages: Sequence[str]) -> Iterator[Dict[str, str]]:
+    # pylint: disable=import-outside-toplevel
+    # Bundled with setuptools; has a good chance of being available.
+    import pkg_resources
+
+    def _generator() -> Iterator[Dict[str, str]]:
+        for package in packages:
+            try:
+                eps = pkg_resources.get_entry_map(package, "console_scripts")
+            except pkg_resources.DistributionNotFound:
+                continue
+
+            for entry_point in eps.values():
+                yield {
+                    "name": entry_point.name,
+                    "module": entry_point.module_name,
+                    "import_name": ".".join(entry_point.attrs),
+                    "func": ".".join(entry_point.attrs),
+                }
+
+    return _generator()
+
+
+# Borrowed/adapted from pip's vendored version of distlib:
+SCRIPT_TEMPLATE = r"""#!{python_path:s}
+# -*- coding: utf-8 -*-
+import re
+import sys
+from {module:s} import {import_name:s}
+if __name__ == '__main__':
+    sys.argv[0] = re.sub(r'(-script\.pyw|\.exe)?$', '', sys.argv[0])
+    sys.exit({func:s}())
+"""
+
+
+def generate_console_scripts(
+    packages: Sequence[str],
+    python_path: Optional[str] = None,
+    bin_path: Optional[str] = None,
+) -> None:
+    """
+    Generate script shims for console_script entry points in @packages.
+    """
+    if python_path is None:
+        python_path = sys.executable
+    if bin_path is None:
+        bin_path = sysconfig.get_path("scripts")
+        assert bin_path is not None
+
+    logger.debug(
+        "generate_console_scripts(packages=%s, python_path=%s, bin_path=%s)",
+        packages,
+        python_path,
+        bin_path,
+    )
+
+    if not packages:
+        return
+
+    def _get_entry_points() -> Iterator[Dict[str, str]]:
+        """Python 3.7 compatibility shim for iterating entry points."""
+        # Python 3.8+, or Python 3.7 with importlib_metadata installed.
+        try:
+            return _gen_importlib(packages)
+        except ImportError as exc:
+            logger.debug("%s", str(exc))
+
+        # Python 3.7 with setuptools installed.
+        try:
+            return _gen_pkg_resources(packages)
+        except ImportError as exc:
+            logger.debug("%s", str(exc))
+            raise Ouch(
+                "Neither importlib.metadata nor pkg_resources found, "
+                "can't generate console script shims.\n"
+                "Use Python 3.8+, or install importlib-metadata or setuptools."
+            ) from exc
+
+    for entry_point in _get_entry_points():
+        script_path = os.path.join(bin_path, entry_point["name"])
+        script = SCRIPT_TEMPLATE.format(python_path=python_path, **entry_point)
+
+        # If the script already exists (in any form), do not overwrite
+        # it nor recreate it in a new format.
+        suffixes = ("", ".exe", "-script.py", "-script.pyw")
+        if any(os.path.exists(f"{script_path}{s}") for s in suffixes):
+            continue
+
+        # FIXME: this is only correct for POSIX systems.  On Windows, the
+        # script source should be written to foo-script.py, and the py.exe
+        # launcher copied to foo.exe.  Unfortunately there is no guarantee that
+        # py.exe exists on the machine.  Creating the script like this is
+        # enough for msys and meson, both of which understand shebang lines.
+        with open(script_path, "w", encoding="UTF-8") as file:
+            file.write(script)
+        mode = os.stat(script_path).st_mode | stat.S_IEXEC
+        os.chmod(script_path, mode)
+
+        logger.debug("wrote '%s'", script_path)
+
+
 def pkgname_from_depspec(dep_spec: str) -> str:
     """
     Parse package name out of a PEP-508 depspec.
@@ -515,7 +680,6 @@ def _do_ensure(
             devnull=online and not wheels_dir,
         )
         # (A) or (B) happened. Success.
-        return
     except subprocess.CalledProcessError:
         # (C) Happened.
         # The package is missing or isn't a suitable version,
@@ -525,8 +689,12 @@ def _do_ensure(
                 f"mkvenv: installing {', '.join(dep_specs)}", file=sys.stderr
             )
             pip_install(dep_specs, online=True)
-        else:
-            raise
+            return
+        raise
+
+    # For case (A), we still need to generate entrypoint shims.
+    # (We generate them only if they do not exist, excluding (B).)
+    generate_console_scripts([pkgname_from_depspec(dep) for dep in dep_specs])
 
 
 def ensure(
diff --git a/python/setup.cfg b/python/setup.cfg
index 5b25f810fa..8f15b7eddd 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -124,6 +124,7 @@ ignore_missing_imports = True
 # --disable=W".
 disable=consider-using-f-string,
         consider-using-with,
+        fixme,
         too-many-arguments,
         too-many-function-args,  # mypy handles this with less false positives.
         too-many-instance-attributes,
-- 
2.40.0


