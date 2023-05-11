Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 615726FEA5D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 05:56:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwxOF-0007Yx-Fz; Wed, 10 May 2023 23:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pwxOC-0007X9-3V
 for qemu-devel@nongnu.org; Wed, 10 May 2023 23:54:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pwxOA-0005Jt-7N
 for qemu-devel@nongnu.org; Wed, 10 May 2023 23:54:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683777285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KczXRnJGUregQ8tCnlo0EoJ+7UPFNcX25ukucGimkAU=;
 b=IHf5ubUOAJ5o4A1aJl5PWKmog3eIvRC+VdP/YgiDRHcjHT0HSPN6q1+28vkk0KBiWdDNie
 4AQ3iapUWmO0CdmsO3IbYe/VM5nGGEdQmPZ7XJRI8soLeYtKnoFKVpmd6aQmYQcuoU99RA
 E7ywPq4Pcwmda4/svkubfwVCfUeLXZs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183--lHWtM-VM6yx8-b8yXkqrw-1; Wed, 10 May 2023 23:54:42 -0400
X-MC-Unique: -lHWtM-VM6yx8-b8yXkqrw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CB9A3C0F225;
 Thu, 11 May 2023 03:54:41 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9488E40C2076;
 Thu, 11 May 2023 03:54:40 +0000 (UTC)
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
Subject: [PATCH 06/27] mkvenv: add ensure subcommand
Date: Wed, 10 May 2023 23:54:14 -0400
Message-Id: <20230511035435.734312-7-jsnow@redhat.com>
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

This command is to be used to add various packages (or ensure they're
already present) into the configure-provided venv in a modular fashion.

Examples:

mkvenv ensure --online --dir "${source_dir}/python/wheels/" "meson>=0.61.5"
mkvenv ensure --online "sphinx>=1.6.0"
mkvenv ensure "qemu.qmp==0.0.2"

It's designed to look for packages in three places, in order:

(1) In system packages, if the version installed is already good
enough. This way your distribution-provided meson, sphinx, etc are
always used as first preference.

(2) In a vendored packages directory. Here I am suggesting
qemu.git/python/wheels/ as that directory. This is intended to serve as
a replacement for vendoring the meson source for QEMU tarballs. It is
also highly likely to be extremely useful for packaging the "qemu.qmp"
package in source distributions for platforms that do not yet package
qemu.qmp separately.

(3) Online, via PyPI, ***only when "--online" is passed***. This is only
ever used as a fallback if the first two sources do not have an
appropriate package that meets the requirement. The ability to build
QEMU and run tests *completely offline* is not impinged.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/scripts/mkvenv.py | 130 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 129 insertions(+), 1 deletion(-)

diff --git a/python/scripts/mkvenv.py b/python/scripts/mkvenv.py
index 5ee9967421..c1982589c9 100644
--- a/python/scripts/mkvenv.py
+++ b/python/scripts/mkvenv.py
@@ -11,6 +11,7 @@
 Commands:
   command     Description
     create    create a venv
+    ensure    Ensure that the specified package is installed.
 
 --------------------------------------------------
 
@@ -22,6 +23,18 @@
 options:
   -h, --help  show this help message and exit
 
+--------------------------------------------------
+
+usage: mkvenv ensure [-h] [--online] [--dir DIR] dep_spec...
+
+positional arguments:
+  dep_spec    PEP 508 Dependency specification, e.g. 'meson>=0.61.5'
+
+options:
+  -h, --help  show this help message and exit
+  --online    Install packages from PyPI, if necessary.
+  --dir DIR   Path to vendored packages where we may install from.
+
 """
 
 # Copyright (C) 2022-2023 Red Hat, Inc.
@@ -43,7 +56,12 @@
 import sys
 import sysconfig
 from types import SimpleNamespace
-from typing import Any, Optional, Union
+from typing import (
+    Any,
+    Optional,
+    Sequence,
+    Union,
+)
 import venv
 
 
@@ -333,6 +351,85 @@ def _stringify(data: Union[str, bytes]) -> str:
     print(builder.get_value("env_exe"))
 
 
+def pip_install(
+    args: Sequence[str],
+    online: bool = False,
+    wheels_dir: Optional[Union[str, Path]] = None,
+    devnull: bool = False,
+) -> None:
+    """
+    Use pip to install a package or package(s) as specified in @args.
+    """
+    loud = bool(
+        os.environ.get("DEBUG")
+        or os.environ.get("GITLAB_CI")
+        or os.environ.get("V")
+    )
+
+    full_args = [
+        sys.executable,
+        "-m",
+        "pip",
+        "install",
+        "--disable-pip-version-check",
+        "-v" if loud else "-q",
+    ]
+    if not online:
+        full_args += ["--no-index"]
+    if wheels_dir:
+        full_args += ["--find-links", f"file://{str(wheels_dir)}"]
+    full_args += list(args)
+    subprocess.run(
+        full_args,
+        check=True,
+        stdout=subprocess.DEVNULL if devnull else None,
+        stderr=subprocess.DEVNULL if devnull else None,
+    )
+
+
+def ensure(
+    dep_specs: Sequence[str],
+    online: bool = False,
+    wheels_dir: Optional[Union[str, Path]] = None,
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
+    """
+    # This first install command will:
+    # (A) Do nothing, if we already have a suitable package.
+    # (B) Install the package from vendored source, if possible.
+    # (C) Fail if neither A nor B.
+    try:
+        pip_install(
+            dep_specs,
+            online=False,
+            wheels_dir=wheels_dir,
+            devnull=online and not wheels_dir,
+        )
+        # (A) or (B) happened. Success.
+        return
+    except subprocess.CalledProcessError:
+        # (C) Happened.
+        # The package is missing or isn't a suitable version,
+        # and we weren't able to install a suitable vendored package.
+        if online:
+            print(
+                f"mkvenv: installing {', '.join(dep_specs)}", file=sys.stderr
+            )
+            pip_install(dep_specs, online=True)
+        else:
+            raise
+
+
 def _add_create_subcommand(subparsers: Any) -> None:
     subparser = subparsers.add_parser("create", help="create a venv")
     subparser.add_argument(
@@ -343,6 +440,30 @@ def _add_create_subcommand(subparsers: Any) -> None:
     )
 
 
+def _add_ensure_subcommand(subparsers: Any) -> None:
+    subparser = subparsers.add_parser(
+        "ensure", help="Ensure that the specified package is installed."
+    )
+    subparser.add_argument(
+        "--online",
+        action="store_true",
+        help="Install packages from PyPI, if necessary.",
+    )
+    subparser.add_argument(
+        "--dir",
+        type=str,
+        action="store",
+        help="Path to vendored packages where we may install from.",
+    )
+    subparser.add_argument(
+        "dep_specs",
+        type=str,
+        action="store",
+        help="PEP 508 Dependency specification, e.g. 'meson>=0.61.5'",
+        nargs="+",
+    )
+
+
 def main() -> int:
     """CLI interface to make_qemu_venv. See module docstring."""
     if os.environ.get("DEBUG") or os.environ.get("GITLAB_CI"):
@@ -363,6 +484,7 @@ def main() -> int:
     )
 
     _add_create_subcommand(subparsers)
+    _add_ensure_subcommand(subparsers)
 
     args = parser.parse_args()
     try:
@@ -372,6 +494,12 @@ def main() -> int:
                 system_site_packages=True,
                 clear=True,
             )
+        if args.command == "ensure":
+            ensure(
+                dep_specs=args.dep_specs,
+                online=args.online,
+                wheels_dir=args.dir,
+            )
         logger.debug("mkvenv.py %s: exiting", args.command)
     except Ouch as exc:
         print("\n*** Ouch! ***\n", file=sys.stderr)
-- 
2.40.0


