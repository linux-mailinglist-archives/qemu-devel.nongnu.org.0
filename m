Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D68386E1C0E
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 07:56:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnCOp-0007Ku-PQ; Fri, 14 Apr 2023 01:55:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pnCOm-0007KY-Ak
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 01:55:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pnCOi-0000Ih-BA
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 01:55:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681451694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8fRsZFhLyR6e1nO5VCN8SkoCsQI4OWXbpIyhKdc+2nA=;
 b=jBWSaoQFOdE2uyufYKhzhguKmAjdzK++ure+xAzEjjbeC+tGVDEGCo2InNjyuquBXdLlpt
 o2ff+JMF61e67myO4gVnkyrAc2VbBp0cONAnjJgEes0FCnCsAn4Scqz1DGhHkXoJmHsKh0
 FIrXgC+7f+8Qt5f1MdmF/Ul+HAlvUwU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-gpW3d7rENFWI5U1jX_KtCg-1; Fri, 14 Apr 2023 01:54:51 -0400
X-MC-Unique: gpW3d7rENFWI5U1jX_KtCg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15CDE3C0F388;
 Fri, 14 Apr 2023 05:54:51 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 80532C16031;
 Fri, 14 Apr 2023 05:54:50 +0000 (UTC)
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
Subject: [RFC PATCH v2 01/10] python: add mkvenv.py
Date: Fri, 14 Apr 2023 01:54:40 -0400
Message-Id: <20230414055449.4028284-2-jsnow@redhat.com>
In-Reply-To: <20230414055449.4028284-1-jsnow@redhat.com>
References: <20230414055449.4028284-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

This script will be responsible for building a lightweight Python
virtual environment at configure time. It works with Python 3.7 or
newer.

It has been designed to:
- work *offline*, no PyPI required.
- work *quickly*, The fast path is only ~65ms on my machine.
- work *robustly*, with multiple fallbacks to keep things working.
- work *cooperatively*, using system packages where possible.
  (You can use your distro's meson, no problem.)

Due to its unique position in the build chain, it exists outside of the
installable python packages in-tree and *must* be runnable without any
third party dependencies.

Under normal circumstances, the only dependency required to execute this
script is Python 3.7+ itself. The script is *faster* by several seconds
when setuptools and pip are installed in the host environment, which is
probably the case for a typical multi-purpose developer workstation.

In the event that pip/setuptools are missing or not usable, additional
dependencies may be required on some distributions which remove certain
Python stdlib modules to package them separately:

- Debian may require python3-venv to provide "ensurepip"
- NetBSD may require py310-expat to provide "pyexpat" *
  (* Or whichever version is current for NetBSD.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/scripts/mkvenv.py | 379 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 379 insertions(+)
 create mode 100644 python/scripts/mkvenv.py

diff --git a/python/scripts/mkvenv.py b/python/scripts/mkvenv.py
new file mode 100644
index 0000000000..6df95382f3
--- /dev/null
+++ b/python/scripts/mkvenv.py
@@ -0,0 +1,379 @@
+"""
+mkvenv - QEMU venv bootstrapping utility
+
+usage: TODO/FIXME
+"""
+
+# Copyright (C) 2022-2023 Red Hat, Inc.
+#
+# Authors:
+#  John Snow <jsnow@redhat.com>
+#  Paolo Bonzini <pbonzini@redhat.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later. See the COPYING file in the top-level directory.
+
+import argparse
+from importlib.util import find_spec
+import logging
+import os
+from os import PathLike
+from pathlib import Path
+import re
+import stat
+import subprocess
+import sys
+import traceback
+from types import SimpleNamespace
+from typing import Dict, Sequence, Optional, Union, Iterator
+import venv
+
+
+# Do not add any mandatory dependencies from outside the stdlib:
+# This script *must* be usable standalone!
+
+DirType = Union[str, bytes, 'PathLike[str]', 'PathLike[bytes]']
+logger = logging.getLogger('mkvenv')
+
+
+class Ouch(RuntimeError):
+    """An Exception class we can't confuse with a builtin."""
+
+
+class QemuEnvBuilder(venv.EnvBuilder):
+    """
+    An extension of venv.EnvBuilder for building QEMU's configure-time venv.
+
+    The only functional change is that it adds the ability to regenerate
+    console_script shims for packages available via system_site
+    packages.
+
+    Parameters for base class init:
+      - system_site_packages: bool = False
+      - clear: bool = False
+      - symlinks: bool = False
+      - upgrade: bool = False
+      - with_pip: bool = False
+      - prompt: Optional[str] = None
+      - upgrade_deps: bool = False             (Since 3.9)
+    """
+    def __init__(self, *args, **kwargs) -> None:
+        logger.debug("QemuEnvBuilder.__init__(...)")
+        self.script_packages = kwargs.pop('script_packages', ())
+        super().__init__(*args, **kwargs)
+
+        # The EnvBuilder class is cute and toggles this setting off
+        # before post_setup, but we need it to decide if we want to
+        # generate shims or not.
+        self._system_site_packages = self.system_site_packages
+
+    def post_setup(self, context: SimpleNamespace) -> None:
+        logger.debug("post_setup(...)")
+
+        # Generate console_script entry points for system packages:
+        if self._system_site_packages:
+            generate_console_scripts(
+                context.env_exe, context.bin_path, self.script_packages)
+
+        # print the python executable to stdout for configure.
+        print(context.env_exe)
+
+
+def need_ensurepip() -> bool:
+    """
+    Tests for the presence of setuptools and pip.
+
+    :return: `True` if we do not detect both packages.
+    """
+    # Don't try to actually import them, it's fraught with danger:
+    # https://github.com/pypa/setuptools/issues/2993
+    if find_spec("setuptools") and find_spec("pip"):
+        return False
+    return True
+
+
+def check_ensurepip(with_pip: bool) -> None:
+    """
+    Check that we have ensurepip.
+
+    Raise a fatal exception with a helpful hint if it isn't available.
+    """
+    if with_pip and not find_spec("ensurepip"):
+        msg = ("Python's ensurepip module is not found.\n"
+
+               "It's normally part of the Python standard library, "
+               "maybe your distribution packages it separately?\n"
+
+               "Either install ensurepip, or alleviate the need for it in the "
+               "first place by installing pip and setuptools for "
+               f"'{sys.executable}'.\n"
+
+               "(Hint: Debian puts ensurepip in its python3-venv package.)")
+        raise Ouch(msg)
+
+
+def make_venv(  # pylint: disable=too-many-arguments
+        venv_path: Union[str, Path],
+        system_site_packages: bool = False,
+        clear: bool = True,
+        symlinks: Optional[bool] = None,
+        upgrade: bool = False,
+        with_pip: Optional[bool] = None,
+        script_packages: Sequence[str]=(),
+) -> None:
+    """
+    Create a venv using the QemuEnvBuilder class.
+
+    TODO/FIXME: write docs O:-)
+    """
+    logging.debug("%s: make_venv(venv_path=%s, system_site_packages=%s, "
+                  "clear=%s, symlinks=%s, upgrade=%s, with_pip=%s, "
+                  "script_packages=%s)",
+                  __file__, str(venv_path), system_site_packages,
+                  clear, symlinks, upgrade, with_pip, script_packages)
+
+    print(f"MKVENV {str(venv_path)}", file=sys.stderr)
+
+    # ensurepip is slow: venv creation can be very fast for cases where
+    # we allow the use of system_site_packages. Toggle ensure_pip on only
+    # in the cases where we really need it.
+    if with_pip is None:
+        with_pip = True if not system_site_packages else need_ensurepip()
+        logger.debug("with_pip unset, choosing %s", with_pip)
+
+    check_ensurepip(with_pip)
+
+    if symlinks is None:
+        # Default behavior of standard venv CLI
+        symlinks = os.name != "nt"
+
+    builder = QemuEnvBuilder(
+        system_site_packages=system_site_packages,
+        clear=clear,
+        symlinks=symlinks,
+        upgrade=upgrade,
+        with_pip=with_pip,
+        script_packages=script_packages,
+    )
+    try:
+        logger.debug("Invoking builder.create()")
+        try:
+            builder.create(str(venv_path))
+        except SystemExit as exc:
+            # Some versions of the venv module raise SystemExit; *nasty*!
+            # We want the exception that prompted it. It might be a subprocess
+            # error that has output we *really* want to see.
+            logger.debug("Intercepted SystemExit from EnvBuilder.create()")
+            raise exc.__cause__ or exc.__context__ or exc
+        logger.debug("builder.create() finished")
+    except subprocess.CalledProcessError as exc:
+        print(f"cmd: {exc.cmd}", file=sys.stderr)
+        print(f"returncode: {exc.returncode}", file=sys.stderr)
+
+        def _stringify(data: Union[str, bytes]) -> str:
+            if data and isinstance(data, bytes):
+                return data.decode()
+            return data
+
+        if exc.stdout:
+            print("========== stdout ==========",
+                  _stringify(exc.stdout),
+                  "============================",
+                  sep='\n', file=sys.stderr)
+        if exc.stderr:
+            print("========== stderr ==========",
+                  _stringify(exc.stderr),
+                  "============================",
+                  sep='\n', file=sys.stderr)
+        raise Ouch("VENV creation subprocess failed.") from exc
+
+
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
+        r'(?P<module>[\w.]+)\s*'
+        r'(:\s*(?P<attr>[\w.]+)\s*)?'
+        r'((?P<extras>\[.*\])\s*)?$'
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
+                lambda ep: ep.group == 'console_scripts', entry_points)
+
+            for entry_point in entry_points:
+                # Python 3.8 doesn't have 'module' or 'attr' attributes
+                if not (hasattr(entry_point, 'module') and
+                        hasattr(entry_point, 'attr')):
+                    match = pattern.match(entry_point.value)
+                    assert match is not None
+                    module = match.group('module')
+                    attr = match.group('attr')
+                else:
+                    module = entry_point.module
+                    attr = entry_point.attr
+                yield {
+                    'name': entry_point.name,
+                    'module': module,
+                    'import_name': attr,
+                    'func': attr,
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
+                eps = pkg_resources.get_entry_map(package, 'console_scripts')
+            except pkg_resources.DistributionNotFound:
+                continue
+
+            for entry_point in eps.values():
+                yield {
+                    'name': entry_point.name,
+                    'module': entry_point.module_name,
+                    'import_name': ".".join(entry_point.attrs),
+                    'func': ".".join(entry_point.attrs),
+                }
+
+    return _generator()
+
+
+# Borrowed/adapted from pip's vendored version of distutils:
+SCRIPT_TEMPLATE = r'''#!{python_path:s}
+# -*- coding: utf-8 -*-
+import re
+import sys
+from {module:s} import {import_name:s}
+if __name__ == '__main__':
+    sys.argv[0] = re.sub(r'(-script\.pyw|\.exe)?$', '', sys.argv[0])
+    sys.exit({func:s}())
+'''
+
+
+def generate_console_scripts(python_path: str, bin_path: str,
+                             packages: Sequence[str]) -> None:
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
+                "Use Python 3.8+, or install importlib-metadata, or setuptools."
+            ) from exc
+
+    for entry_point in _get_entry_points():
+        script_path = os.path.join(bin_path, entry_point['name'])
+        script = SCRIPT_TEMPLATE.format(python_path=python_path, **entry_point)
+        with open(script_path, "w", encoding='UTF-8') as file:
+            file.write(script)
+        mode = os.stat(script_path).st_mode | stat.S_IEXEC
+        os.chmod(script_path, mode)
+
+        logger.debug("wrote '%s'", script_path)
+
+
+def main() -> int:
+    """CLI interface to make_qemu_venv. See module docstring."""
+    if os.environ.get('DEBUG') or os.environ.get('GITLAB_CI'):
+        # You're welcome.
+        logging.basicConfig(level=logging.DEBUG)
+    elif os.environ.get('V'):
+        logging.basicConfig(level=logging.INFO)
+
+    parser = argparse.ArgumentParser(description="Bootstrap QEMU venv.")
+    subparsers = parser.add_subparsers(
+        title="Commands",
+        description="Various actions this utility can perform",
+        prog="prog",
+        dest="command",
+        required=True,
+        metavar="command",
+        help='Description')
+
+    subparser = subparsers.add_parser('create', help='create a venv')
+    subparser.add_argument(
+        '--gen',
+        type=str,
+        action='append',
+        help="Regenerate console_scripts for given packages, if found.",
+    )
+    subparser.add_argument(
+        'target',
+        type=str,
+        action='store',
+        help="Target directory to install virtual environment into.",
+    )
+
+    args = parser.parse_args()
+    try:
+        if args.command == 'create':
+            script_packages = []
+            for element in args.gen or ():
+                script_packages.extend(element.split(","))
+            make_venv(
+                args.target,
+                system_site_packages=True,
+                clear=True,
+                upgrade=False,
+                with_pip=None,  # Autodetermine
+                script_packages=script_packages,
+            )
+            logger.debug("mkvenv.py create - exiting")
+    except Ouch as exc:
+        print("\n*** Ouch! ***\n", file=sys.stderr)
+        print(str(exc), "\n\n", file=sys.stderr)
+        return 1
+    except:  # pylint: disable=bare-except
+        print("mkvenv did not complete successfully:", file=sys.stderr)
+        traceback.print_exc()
+        return 2
+    return 0
+
+
+if __name__ == '__main__':
+    sys.exit(main())
-- 
2.39.2


