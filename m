Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45357546FA2
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 00:28:32 +0200 (CEST)
Received: from localhost ([::1]:60824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzn7H-00037U-Ac
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 18:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nzn55-0000hs-SU
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 18:26:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nzn51-0005Tw-Dr
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 18:26:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654899970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=anYhfcvgMMDENUPqkU/tUzCABSO9Egx8LCG3jbKLIcY=;
 b=OlRldXXzCJ332M207hEFBSz/80oapaVbis0kNah6o+pjWua9QxRUfR0h9XQjDsFg9B8Hw8
 RDWp/qLqAgm/lS25244cXoel85BvaNs83prvCd4Z5QZg1g8yK3Dp7PrymASexOly8478qh
 QekDLNpIBuZX1mBOtGxMphsMnQmi8qM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-Kp4X-yEQNzWeCV1Juc1LKg-1; Fri, 10 Jun 2022 18:26:09 -0400
X-MC-Unique: Kp4X-yEQNzWeCV1Juc1LKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E12585A580;
 Fri, 10 Jun 2022 22:26:08 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A116240D2962;
 Fri, 10 Jun 2022 22:26:07 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [RFC PATCH v2 2/7] tests: pythonize test venv creation
Date: Fri, 10 Jun 2022 18:26:00 -0400
Message-Id: <20220610222605.2259132-3-jsnow@redhat.com>
In-Reply-To: <20220610222605.2259132-1-jsnow@redhat.com>
References: <20220610222605.2259132-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This splits the venv creation logic out of the Makefile and into a
Python script.

One reason for doing this is to be able to call the venv bootstrapper
from places outside of the Makefile, e.g. configure and iotests. Another
reason is to be able to add "offline" logic to modify the behavior of
the script in certain circumstances.

RFC: I don't like how I have an entire "enter_venv" function here, and
by the end of the series, completely separate logic for entering a venv
in testenv.py -- but they both operate in different ways: this patch
offers a method that alters the current ENV immediately, whereas the
testenv.py method alters a copied ENV that is explicitly passed to
subprocesses.

Still, there's a bit more boilerplate than I'd like, but it's probably
fine and it probably won't need to be updated much, but... less code is
usually better.

But, even if I did write it more generically here; iotests wouldn't be
able to use it anyway, because importing it would mean more sys.path
hacking. So... eh?

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/Makefile.include |  16 ++--
 tests/mkvenv.py        | 186 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 192 insertions(+), 10 deletions(-)
 create mode 100644 tests/mkvenv.py

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 82c697230e0..d8af6a38112 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -104,21 +104,17 @@ else
 	AVOCADO_CMDLINE_TAGS=$(addprefix -t , $(AVOCADO_TAGS))
 endif
 
-quiet-venv-pip = $(quiet-@)$(call quiet-command-run, \
-    $(TESTS_PYTHON) -m pip -q --disable-pip-version-check $1, \
-    "VENVPIP","$1")
-
 # Core dependencies for tests/venv
 $(TESTS_VENV_DIR): $(SRC_PATH)/tests/setup.cfg $(SRC_PATH)/python/setup.cfg
-	$(call quiet-command, $(PYTHON) -m venv $@, VENV, $@)
-	$(call quiet-venv-pip,install -e "$(SRC_PATH)/python/")
-	$(call quiet-venv-pip,install "$(SRC_PATH)/tests/")
-	$(call quiet-command, touch $@)
+	$(call quiet-command, \
+            $(PYTHON) "$(SRC_PATH)/tests/mkvenv.py" "$@", \
+            MKVENV, $@)
 
 # Optional avocado dependencies for tests/venv
 $(TESTS_VENV_DIR)/avocado: $(TESTS_VENV_DIR)
-	$(call quiet-venv-pip,install "$(SRC_PATH)/tests/[avocado]")
-	$(call quiet-command, touch $@)
+	$(call quiet-command, \
+            $(PYTHON) "$(SRC_PATH)/tests/mkvenv.py" --opt avocado "$<", \
+            MKVENV, $@)
 
 $(TESTS_RESULTS_DIR):
 	$(call quiet-command, mkdir -p $@, \
diff --git a/tests/mkvenv.py b/tests/mkvenv.py
new file mode 100644
index 00000000000..0667106d6aa
--- /dev/null
+++ b/tests/mkvenv.py
@@ -0,0 +1,186 @@
+"""
+mkvenv - QEMU venv bootstrapping utility
+
+usage: mkvenv.py [-h] [--offline] [--opt OPT] target
+
+Bootstrap QEMU testing venv.
+
+positional arguments:
+  target      Target directory to install virtual environment into.
+
+optional arguments:
+  -h, --help  show this help message and exit
+  --offline   Use system packages and work entirely offline.
+  --opt OPT   Install an optional dependency group.
+"""
+
+# Copyright (C) 2022 Red Hat, Inc.
+#
+# Authors:
+#  John Snow <jsnow@redhat.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later. See the COPYING file in the top-level directory.
+
+# Do not add any dependencies from outside the stdlib:
+# This script must be usable on its own!
+
+import argparse
+from contextlib import contextmanager
+import logging
+import os
+from pathlib import Path
+import subprocess
+import sys
+from typing import Iterable, Iterator, Union
+import venv
+
+
+def make_venv(
+        venv_path: Union[str, Path],
+        system_site_packages: bool = False
+) -> None:
+    """
+    Create a venv using the python3 'venv' module.
+
+    Identical to:
+    ``python3 -m venv --clear [--system-site-packages] {venv_path}``
+
+    :param venv_path: The target directory
+    :param system_site_packages: If True, allow system packages in venv.
+    """
+    logging.debug("%s: make_venv(venv_path=%s, system_site_packages=%s)",
+                  __file__, str(venv_path), system_site_packages)
+    venv.create(
+        str(venv_path),
+        clear=True,
+        symlinks=os.name != "nt",  # Same as venv CLI's default.
+        with_pip=True,
+        system_site_packages=system_site_packages,
+    )
+
+
+@contextmanager
+def enter_venv(venv_dir: Union[str, Path]) -> Iterator[None]:
+    """Scoped activation of an existing venv."""
+    venv_keys = ('PATH', 'PYTHONHOME', 'VIRTUAL_ENV')
+    old = {k: v for k, v in os.environ.items() if k in venv_keys}
+    vdir = Path(venv_dir).resolve()
+
+    def _delete_keys() -> None:
+        for k in venv_keys:
+            try:
+                del os.environ[k]
+            except KeyError:
+                pass
+
+    try:
+        _delete_keys()
+
+        os.environ['VIRTUAL_ENV'] = str(vdir)
+        os.environ['PATH'] = os.pathsep.join([
+            str(vdir / "bin/"),
+            old['PATH'],
+        ])
+
+        logging.debug("PATH => %s", os.environ['PATH'])
+        logging.debug("VIRTUAL_ENV => %s", os.environ['VIRTUAL_ENV'])
+
+        yield
+
+    finally:
+        _delete_keys()
+        for key, val in old.items():
+            os.environ[key] = val
+
+
+def install(*args: str, offline: bool = False) -> None:
+    """Shorthand for pip install; expected to be used under a venv."""
+    cli_args = ['pip3', '--disable-pip-version-check', '-q', 'install']
+    if offline:
+        cli_args.append('--no-index')
+    cli_args += args
+    print(f"  VENVPIP install {' '.join(args)}")
+    logging.debug(' '.join(cli_args))
+    subprocess.run(cli_args, check=True)
+
+
+def make_qemu_venv(
+        venv_dir: str,
+        options: Iterable[str],
+        offline: bool = False
+) -> None:
+    """
+    Make and initialize a qemu testing venv.
+
+    Forcibly re-creates the venv if it already exists, unless optional
+    dependency groups are specified - in which case, just install the
+    extra dependency groups.
+
+    :param venv_dir: The target directory to install to.
+    :param options:
+        Optional dependency groups of the testing package to install.
+        (e.g. 'avocado'.)
+    :param offline:
+        If true, force offline mode. System packages will be usable from
+        the venv and dependencies will not be fetched from PyPI.
+    """
+    venv_path = Path(venv_dir).resolve()
+    src_root = Path(__file__).joinpath('../..')
+    pysrc_path = src_root.joinpath('python/').resolve()
+    test_src_path = src_root.joinpath('tests/').resolve()
+
+    logging.debug("make_qemu_venv(%s)", venv_dir)
+    logging.debug("sys.executable: %s", sys.executable)
+    logging.debug("resolved:       %s", str(Path(sys.executable).resolve()))
+    logging.debug("venv_dir:       %s", str(venv_path))
+    logging.debug("python source:  %s", str(pysrc_path))
+    logging.debug("tests source:   %s", str(test_src_path))
+
+    do_initialize = not venv_path.exists() or not options
+    if do_initialize:
+        make_venv(venv_path, system_site_packages=offline)
+
+    with enter_venv(venv_path):
+        if do_initialize:
+            install("-e", str(pysrc_path), offline=offline)
+            install(str(test_src_path), offline=offline)
+            venv_path.touch()
+
+        for option in options:
+            dummy = venv_path / option
+            install(f"{test_src_path!s}/[{option}]", offline=offline)
+            dummy.touch()
+
+
+def main() -> int:
+    """CLI interface to make_qemu_venv. See module docstring."""
+    if os.environ.get('DEBUG'):
+        logging.basicConfig(level=logging.DEBUG)
+
+    parser = argparse.ArgumentParser(
+        description="Bootstrap QEMU testing venv.")
+    parser.add_argument(
+        '--offline',
+        action='store_true',
+        help="Use system packages and work entirely offline.",
+    )
+    parser.add_argument(
+        '--opt',
+        type=str,
+        action='append',
+        help="Install an optional dependency group.",
+    )
+    parser.add_argument(
+        'target',
+        type=str,
+        action='store',
+        help="Target directory to install virtual environment into.",
+    )
+    args = parser.parse_args()
+    make_qemu_venv(args.target, args.opt or (), args.offline)
+    return 0
+
+
+if __name__ == '__main__':
+    sys.exit(main())
-- 
2.34.3


