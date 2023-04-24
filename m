Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 214166ED5E4
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 22:08:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr2Ot-0007ij-Av; Mon, 24 Apr 2023 16:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2Op-0007dg-IY
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:03:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2Om-0000wO-M6
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:02:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682366575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AYaJSVHUp8hRHnw2+FO+zlIVYCp3jgnfsdKnX8ybISM=;
 b=S9WPgTKtyzHTxGazmpEETnxeQbLmoFv5Mr54/9t+sq1mU8tIZUCIOLGbRnDpv3eubJ97OJ
 w7xzD45EkjOfLcZ0smZ+34nTy1c2Q9KO8TgAsd9xNtMgeCoawWTUuQyjncRcNxAYODLsG0
 oFk+UB6DQpHxUZxXK7QpxovBZtP5R2M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-kd1mArEMNaS9vHUqLnexcQ-1; Mon, 24 Apr 2023 16:02:52 -0400
X-MC-Unique: kd1mArEMNaS9vHUqLnexcQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB48687B2A2;
 Mon, 24 Apr 2023 20:02:51 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 251FA1121318;
 Mon, 24 Apr 2023 20:02:51 +0000 (UTC)
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
Subject: [RFC PATCH v3 03/20] mkvenv: add console script entry point generation
Date: Mon, 24 Apr 2023 16:02:31 -0400
Message-Id: <20230424200248.1183394-4-jsnow@redhat.com>
In-Reply-To: <20230424200248.1183394-1-jsnow@redhat.com>
References: <20230424200248.1183394-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

When creating a virtual environment that inherits system packages,
script entry points (like "meson", "sphinx-build", etc) are not
re-generated with the correct shebang. When you are *inside* of the
venv, this is not a problem, but if you are *outside* of it, you will
not have a script that engages the virtual environment appropriately.

Add a mechanism that generates new entry points for pre-existing
packages so that we can use these scripts to run "meson",
"sphinx-build", "pip", unambiguously inside the venv.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/scripts/mkvenv.py | 179 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 172 insertions(+), 7 deletions(-)

diff --git a/python/scripts/mkvenv.py b/python/scripts/mkvenv.py
index 1dfcc0198a..f355cb54fb 100644
--- a/python/scripts/mkvenv.py
+++ b/python/scripts/mkvenv.py
@@ -14,13 +14,14 @@
 
 --------------------------------------------------
 
-usage: mkvenv create [-h] target
+usage: mkvenv create [-h] [--gen GEN] target
 
 positional arguments:
   target      Target directory to install virtual environment into.
 
 options:
   -h, --help  show this help message and exit
+  --gen GEN   Regenerate console_scripts for given packages, if found.
 
 """
 
@@ -38,11 +39,20 @@
 import logging
 import os
 from pathlib import Path
+import re
+import stat
 import subprocess
 import sys
 import traceback
 from types import SimpleNamespace
-from typing import Any, Optional, Union
+from typing import (
+    Any,
+    Dict,
+    Iterator,
+    Optional,
+    Sequence,
+    Union,
+)
 import venv
 
 
@@ -60,10 +70,9 @@ class QemuEnvBuilder(venv.EnvBuilder):
     """
     An extension of venv.EnvBuilder for building QEMU's configure-time venv.
 
-    As of this commit, it does not yet do anything particularly
-    different than the standard venv-creation utility. The next several
-    commits will gradually change that in small commits that highlight
-    each feature individually.
+    The only functional change is that it adds the ability to regenerate
+    console_script shims for packages available via system_site
+    packages.
 
     Parameters for base class init:
       - system_site_packages: bool = False
@@ -77,6 +86,7 @@ class QemuEnvBuilder(venv.EnvBuilder):
 
     def __init__(self, *args: Any, **kwargs: Any) -> None:
         logger.debug("QemuEnvBuilder.__init__(...)")
+        self.script_packages = kwargs.pop("script_packages", ())
         super().__init__(*args, **kwargs)
 
         # The EnvBuilder class is cute and toggles this setting off
@@ -87,6 +97,12 @@ def __init__(self, *args: Any, **kwargs: Any) -> None:
     def post_setup(self, context: SimpleNamespace) -> None:
         logger.debug("post_setup(...)")
 
+        # Generate console_script entry points for system packages:
+        if self._system_site_packages:
+            generate_console_scripts(
+                context.env_exe, context.bin_path, self.script_packages
+            )
+
         # print the python executable to stdout for configure.
         print(context.env_exe)
 
@@ -129,6 +145,7 @@ def make_venv(  # pylint: disable=too-many-arguments
     clear: bool = True,
     symlinks: Optional[bool] = None,
     with_pip: Optional[bool] = None,
+    script_packages: Sequence[str] = (),
 ) -> None:
     """
     Create a venv using `QemuEnvBuilder`.
@@ -149,16 +166,20 @@ def make_venv(  # pylint: disable=too-many-arguments
         Whether to run "ensurepip" or not. If unspecified, this will
         default to False if system_site_packages is True and a usable
         version of pip is found.
+    :param script_packages:
+        A sequence of package names to generate console entry point
+        shims for, when system_site_packages is True.
     """
     logging.debug(
         "%s: make_venv(env_dir=%s, system_site_packages=%s, "
-        "clear=%s, symlinks=%s, with_pip=%s)",
+        "clear=%s, symlinks=%s, with_pip=%s, script_packages=%s)",
         __file__,
         str(env_dir),
         system_site_packages,
         clear,
         symlinks,
         with_pip,
+        script_packages,
     )
 
     print(f"MKVENV {str(env_dir)}", file=sys.stderr)
@@ -181,6 +202,7 @@ def make_venv(  # pylint: disable=too-many-arguments
         clear=clear,
         symlinks=symlinks,
         with_pip=with_pip,
+        script_packages=script_packages,
     )
     try:
         logger.debug("Invoking builder.create()")
@@ -221,8 +243,147 @@ def _stringify(data: Optional[Union[str, bytes]]) -> Optional[str]:
         raise Ouch("VENV creation subprocess failed.") from exc
 
 
+def _gen_importlib(packages: Sequence[str]) -> Iterator[Dict[str, str]]:
+    # pylint: disable=import-outside-toplevel
+    try:
+        # First preference: Python 3.8+ stdlib
+        from importlib.metadata import (
+            PackageNotFoundError,
+            distribution,
+        )
+    except ImportError as exc:
+        logger.debug("%s", str(exc))
+        # Second preference: Commonly available PyPI backport
+        from importlib_metadata import (
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
+# Borrowed/adapted from pip's vendored version of distutils:
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
+    python_path: str, bin_path: str, packages: Sequence[str]
+) -> None:
+    """
+    Generate script shims for console_script entry points in @packages.
+    """
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
+        with open(script_path, "w", encoding="UTF-8") as file:
+            file.write(script)
+        mode = os.stat(script_path).st_mode | stat.S_IEXEC
+        os.chmod(script_path, mode)
+
+        logger.debug("wrote '%s'", script_path)
+
+
 def _add_create_subcommand(subparsers: Any) -> None:
     subparser = subparsers.add_parser("create", help="create a venv")
+    subparser.add_argument(
+        "--gen",
+        type=str,
+        action="append",
+        help="Regenerate console_scripts for given packages, if found.",
+    )
     subparser.add_argument(
         "target",
         type=str,
@@ -256,10 +417,14 @@ def main() -> int:
     args = parser.parse_args()
     try:
         if args.command == "create":
+            script_packages = []
+            for element in args.gen or ():
+                script_packages.extend(element.split(","))
             make_venv(
                 args.target,
                 system_site_packages=True,
                 clear=True,
+                script_packages=script_packages,
             )
         logger.debug("mkvenv.py %s: exiting", args.command)
     except Ouch as exc:
-- 
2.39.2


