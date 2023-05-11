Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFF56FEA67
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 05:57:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwxOG-0007ZO-D8; Wed, 10 May 2023 23:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pwxOE-0007Yc-LZ
 for qemu-devel@nongnu.org; Wed, 10 May 2023 23:54:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pwxOC-0005KY-Je
 for qemu-devel@nongnu.org; Wed, 10 May 2023 23:54:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683777288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oYEPWtJpy9qO1LcZmmJfl/F59sqqdji7HsB7EbhDGNU=;
 b=fS0nTEcwfA+og6ig3KtSYEyM2TNXhvVRtQuYZ149+MGaXqYbh9vsT3yXp4bIF2pXwUHvFo
 914FzL4TbVt1jntdFSysQAAUoONaz+ZMCVU/38sMSk+nATPDchFCifSdK6pfBD7ImEwxZp
 vxJnruxU1yfBPGukNIIdZ25I6Jw/k5I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-FeFjTRB_MgaJ0J0QLNpfXg-1; Wed, 10 May 2023 23:54:42 -0400
X-MC-Unique: FeFjTRB_MgaJ0J0QLNpfXg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18EA829AB3EB;
 Thu, 11 May 2023 03:54:42 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E23140C2076;
 Thu, 11 May 2023 03:54:41 +0000 (UTC)
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
Subject: [PATCH 07/27] mkvenv: add diagnose() method for ensure() failures
Date: Wed, 10 May 2023 23:54:15 -0400
Message-Id: <20230511035435.734312-8-jsnow@redhat.com>
In-Reply-To: <20230511035435.734312-1-jsnow@redhat.com>
References: <20230511035435.734312-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 python/scripts/mkvenv.py | 165 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 152 insertions(+), 13 deletions(-)

diff --git a/python/scripts/mkvenv.py b/python/scripts/mkvenv.py
index c1982589c9..d9ba2e1532 100644
--- a/python/scripts/mkvenv.py
+++ b/python/scripts/mkvenv.py
@@ -51,6 +51,8 @@
 import logging
 import os
 from pathlib import Path
+import re
+import shutil
 import site
 import subprocess
 import sys
@@ -351,6 +353,115 @@ def _stringify(data: Union[str, bytes]) -> str:
     print(builder.get_value("env_exe"))
 
 
+def pkgname_from_depspec(dep_spec: str) -> str:
+    """
+    Parse package name out of a PEP-508 depspec.
+
+    See https://peps.python.org/pep-0508/#names
+    """
+    match = re.match(
+        r"^([A-Z0-9]([A-Z0-9._-]*[A-Z0-9])?)", dep_spec, re.IGNORECASE
+    )
+    if not match:
+        raise ValueError(
+            f"dep_spec '{dep_spec}'"
+            " does not appear to contain a valid package name"
+        )
+    return match.group(0)
+
+
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
+    pkg_name = pkgname_from_depspec(dep_spec)
+    pkg_version = None
+
+    has_importlib = False
+    try:
+        # Python 3.8+ stdlib
+        # pylint: disable=import-outside-toplevel
+        # pylint: disable=no-name-in-module
+        # pylint: disable=import-error
+        from importlib.metadata import (  # type: ignore
+            PackageNotFoundError,
+            version,
+        )
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
@@ -387,23 +498,11 @@ def pip_install(
     )
 
 
-def ensure(
+def _do_ensure(
     dep_specs: Sequence[str],
     online: bool = False,
     wheels_dir: Optional[Union[str, Path]] = None,
 ) -> None:
-    """
-    Use pip to ensure we have the package specified by @dep_specs.
-
-    If the package is already installed, do nothing. If online and
-    wheels_dir are both provided, prefer packages found in wheels_dir
-    first before connecting to PyPI.
-
-    :param dep_specs:
-        PEP 508 dependency specifications. e.g. ['meson>=0.61.5'].
-    :param online: If True, fall back to PyPI.
-    :param wheels_dir: If specified, search this path for packages.
-    """
     # This first install command will:
     # (A) Do nothing, if we already have a suitable package.
     # (B) Install the package from vendored source, if possible.
@@ -430,6 +529,36 @@ def ensure(
             raise
 
 
+def ensure(
+    dep_specs: Sequence[str],
+    online: bool = False,
+    wheels_dir: Optional[Union[str, Path]] = None,
+    prog: Optional[str] = None,
+) -> None:
+    """
+    Use pip to ensure we have the package specified by @dep_specs.
+
+    If the package is already installed, do nothing. If online and
+    wheels_dir are both provided, prefer packages found in wheels_dir
+    first before connecting to PyPI.
+
+    :param dep_specs:
+        PEP 508 dependency specifications. e.g. ['meson>=0.61.5'].
+    :param online: If True, fall back to PyPI.
+    :param wheels_dir: If specified, search this path for packages.
+    :param prog:
+        If specified, use this program name for error diagnostics that will
+        be presented to the user. e.g., 'sphinx-build' can be used as a
+        bellwether for the presence of 'sphinx'.
+    """
+    print(f"mkvenv: checking for {', '.join(dep_specs)}", file=sys.stderr)
+    try:
+        _do_ensure(dep_specs, online, wheels_dir)
+    except subprocess.CalledProcessError as exc:
+        # Well, that's not good.
+        raise Ouch(diagnose(dep_specs[0], online, wheels_dir, prog)) from exc
+
+
 def _add_create_subcommand(subparsers: Any) -> None:
     subparser = subparsers.add_parser("create", help="create a venv")
     subparser.add_argument(
@@ -455,6 +584,15 @@ def _add_ensure_subcommand(subparsers: Any) -> None:
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
         "dep_specs",
         type=str,
@@ -499,6 +637,7 @@ def main() -> int:
                 dep_specs=args.dep_specs,
                 online=args.online,
                 wheels_dir=args.dir,
+                prog=args.diagnose,
             )
         logger.debug("mkvenv.py %s: exiting", args.command)
     except Ouch as exc:
-- 
2.40.0


