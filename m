Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 113126ED5D5
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 22:04:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr2P3-0007yy-Su; Mon, 24 Apr 2023 16:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2P0-0007uf-QN
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:03:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2Ox-00010j-NW
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:03:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682366587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ZVxxSZ7/C5X1V8cQvXR6zh46ie6lD6B7GimcdwGhcs=;
 b=CEaroXkf+fb+a8Q9KhPn2Lb1Ldu1JgNETvvpHBNaxLrg0zJ6yAaOHJPVBSEc4zHzTyL3op
 kZyRTAOTJAtvX6Ks1mkZ9CdCF64W/H2+eaiSL6pKMLmdY9yCfzr4gUOL5JLmVeZ80dJe2g
 X8+X0c29SFaa0sB6OIF8b7FOdeo30Rc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-lEF_6W8KPBWjkJ1YEx1AWw-1; Mon, 24 Apr 2023 16:03:03 -0400
X-MC-Unique: lEF_6W8KPBWjkJ1YEx1AWw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2105C88B7A1;
 Mon, 24 Apr 2023 20:03:03 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AD7F1121318;
 Mon, 24 Apr 2023 20:03:02 +0000 (UTC)
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
Subject: [RFC PATCH v3 18/20] mkvenv: add diagnose() method for ensure()
 failures
Date: Mon, 24 Apr 2023 16:02:46 -0400
Message-Id: <20230424200248.1183394-19-jsnow@redhat.com>
In-Reply-To: <20230424200248.1183394-1-jsnow@redhat.com>
References: <20230424200248.1183394-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This is a routine that is designed to print some usable info for human
beings back out to the terminal if/when "mkvenv ensure" fails to locate
or install a package during configure time, such as meson or sphinx.

Since we are requiring that "meson" and "sphinx" are installed to the
same Python environment as QEMU is configured to build with, this can
produce some surprising failures when things are mismatched. This method
is here to try and ease that sting by offering some actionable
diagnosis.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/scripts/mkvenv.py | 153 +++++++++++++++++++++++++++++++++++----
 1 file changed, 140 insertions(+), 13 deletions(-)

diff --git a/python/scripts/mkvenv.py b/python/scripts/mkvenv.py
index 937664ea9c..1bc4bc01b1 100644
--- a/python/scripts/mkvenv.py
+++ b/python/scripts/mkvenv.py
@@ -64,6 +64,7 @@
 import os
 from pathlib import Path
 import re
+import shutil
 import site
 import stat
 import subprocess
@@ -543,6 +544,103 @@ def checkpip() -> None:
     logging.debug("Pip is now (hopefully) repaired!")
 
 
+def diagnose(
+    dep_spec: str,
+    online: bool,
+    wheels_dir: Optional[Union[str, Path]],
+    prog: Optional[str],
+) -> str:
+    """
+    Offer a summary to the user as to why a package failed to be installed.
+
+    :param dep_spec: The package we tried to ensure, e.g. 'meson>=0.61.5'
+    :param online: Did we allow PyPI access?
+    :param prog:
+        Optionally, a shell program name that can be used as a
+        bellwether to detect if this program is installed elsewhere on
+        the system. This is used to offer advice when a program is
+        detected for a different python version.
+    :param wheels_dir:
+        Optionally, a directory that was searched for vendored packages.
+    """
+    # pylint: disable=too-many-branches
+
+    # Parse name out of PEP-508 depspec.
+    # See https://peps.python.org/pep-0508/#names
+    match = re.match(
+        r"^([A-Z0-9]([A-Z0-9._-]*[A-Z0-9])?)", dep_spec, re.IGNORECASE
+    )
+    if not match:
+        raise ValueError(
+            f"dep_spec '{dep_spec}'"
+            " does not appear to contain a valid package name"
+        )
+    pkg_name = match.group(0)
+    pkg_version = None
+
+    has_importlib = False
+    try:
+        # Python 3.8+ stdlib
+        # pylint: disable=import-outside-toplevel
+        from importlib.metadata import PackageNotFoundError, version
+
+        has_importlib = True
+        try:
+            pkg_version = version(pkg_name)
+        except PackageNotFoundError:
+            pass
+    except ModuleNotFoundError:
+        pass
+
+    lines = []
+
+    if pkg_version:
+        lines.append(
+            f"Python package '{pkg_name}' version '{pkg_version}' was found,"
+            " but isn't suitable."
+        )
+    elif has_importlib:
+        lines.append(
+            f"Python package '{pkg_name}' was not found nor installed."
+        )
+    else:
+        lines.append(
+            f"Python package '{pkg_name}' is either not found or"
+            " not a suitable version."
+        )
+
+    if wheels_dir:
+        lines.append(
+            "No suitable version found in, or failed to install from"
+            f" '{wheels_dir}'."
+        )
+    else:
+        lines.append("No local package directory was searched.")
+
+    if online:
+        lines.append("A suitable version could not be obtained from PyPI.")
+    else:
+        lines.append(
+            "mkvenv was configured to operate offline and did not check PyPI."
+        )
+
+    if prog and not pkg_version:
+        which = shutil.which(prog)
+        if which:
+            pypath = Path(sys.executable).resolve()
+            lines.append(
+                f"'{prog}' was detected on your system at '{which}', "
+                f"but the Python package '{pkg_name}' was not found by this "
+                f"Python interpreter ('{pypath}'). "
+                f"Typically this means that '{prog}' has been installed "
+                "against a different Python interpreter on your system."
+            )
+
+    lines = [f" • {line}" for line in lines]
+    lines.insert(0, f"Could not ensure availability of '{dep_spec}':")
+    return os.linesep.join(lines)
+
+
 def pip_install(
     args: Sequence[str],
     online: bool = False,
@@ -573,23 +671,11 @@ def pip_install(
     subprocess.run(full_args, check=True)
 
 
-def ensure(
+def _do_ensure(
     dep_spec: str,
     online: bool = False,
     wheels_dir: Optional[Union[str, Path]] = None,
 ) -> None:
-    """
-    Use pip to ensure we have the package specified by @dep_spec.
-
-    If the package is already installed, do nothing. If online and
-    wheels_dir are both provided, prefer packages found in wheels_dir
-    first before connecting to PyPI.
-
-    :param dep_spec:
-        A PEP 508 dependency specification. e.g. 'meson>=0.61.5'.
-    :param online: If True, fall back to PyPI.
-    :param wheels_dir: If specified, search this path for packages.
-    """
     # This first install command will:
     # (A) Do nothing, if we already have a suitable package.
     # (B) Install the package from vendored source, if possible.
@@ -603,11 +689,42 @@ def ensure(
         # The package is missing or isn't a suitable version,
         # and we weren't able to install a suitable vendored package.
         if online:
+            logger.info("offline ensure failed, trying PyPI ...")
             pip_install([dep_spec], online=True)
         else:
             raise
 
 
+def ensure(
+    dep_spec: str,
+    online: bool = False,
+    wheels_dir: Optional[Union[str, Path]] = None,
+    prog: Optional[str] = None,
+) -> None:
+    """
+    Use pip to ensure we have the package specified by @dep_spec.
+
+    If the package is already installed, do nothing. If online and
+    wheels_dir are both provided, prefer packages found in wheels_dir
+    first before connecting to PyPI.
+
+    :param dep_spec:
+        A PEP 508 dependency specification. e.g. 'meson>=0.61.5'.
+    :param online: If True, fall back to PyPI.
+    :param wheels_dir: If specified, search this path for packages.
+    :param prog:
+        If specified, use this program name for error diagnostics that will
+        be presented to the user. e.g., 'sphinx-build' can be used as a
+        bellwether for the presence of 'sphinx'.
+    """
+    print(f"MKVENV ensure {dep_spec}", file=sys.stderr)
+    try:
+        _do_ensure(dep_spec, online, wheels_dir)
+    except subprocess.CalledProcessError as exc:
+        # Well, that's not good.
+        raise Ouch(diagnose(dep_spec, online, wheels_dir, prog)) from exc
+
+
 def post_venv_setup(bin_path: str, packages: Sequence[str] = ()) -> None:
     """
     This is intended to be run *inside the venv* after it is created.
@@ -671,6 +788,15 @@ def _add_ensure_subcommand(subparsers: Any) -> None:
         action="store",
         help="Path to vendored packages where we may install from.",
     )
+    subparser.add_argument(
+        "--diagnose",
+        type=str,
+        action="store",
+        help=(
+            "Name of a shell utility to use for "
+            "diagnostics if this command fails."
+        ),
+    )
     subparser.add_argument(
         "dep_spec",
         type=str,
@@ -727,6 +853,7 @@ def _normalize_gen() -> None:
                 dep_spec=args.dep_spec,
                 online=args.online,
                 wheels_dir=args.dir,
+                prog=args.diagnose,
             )
         logger.debug("mkvenv.py %s: exiting", args.command)
     except Ouch as exc:
-- 
2.39.2


